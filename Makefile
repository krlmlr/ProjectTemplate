all: rd

git:
	test "$$(git status --porcelain | wc -c)" = "0"

master: git
	test $$(git rev-parse --abbrev-ref HEAD) = "master"

gh-pages:
	git subtree split --prefix website --branch gh-pages

rd:
	crant -X

inst/NEWS.Rd: git NEWS.md
	Rscript -e "tools:::news2Rd('$(word 2,$^)', '$@')"
	sed -r -i 's/`([^`]+)`/\\code{\1}/g' $@
	git add $@
	test "$$(git status --porcelain | wc -c)" = "0" || git commit -m "Update NEWS.Rd"

tag:
	git tag v$$(sed -n -r '/^Version: / {s/.* ([0-9.-]+)$$/\1/;p}' DESCRIPTION)

bump-cran-desc: master rd inst/NEWS.Rd
	crant -u 2 -C

bump-gh-desc: master rd inst/NEWS.Rd
	crant -u 3 -C

bump-desc: master rd inst/NEWS.Rd
	test "$$(git status --porcelain | wc -c)" = "0"
	sed -i -r '/^Version: / s/( [0-9.]+)$$/\1-0.0/' DESCRIPTION
	git add DESCRIPTION
	test "$$(git status --porcelain | wc -c)" = "0" || git commit -m "Add suffix -0.0 to version"
	crant -u 4 -C

bump-cran: bump-cran-desc tag

bump-gh: bump-gh-desc tag

bump: bump-desc tag

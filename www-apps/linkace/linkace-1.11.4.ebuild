# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

DESCRIPTION="LinkAce is a bookmark archive."
HOMEPAGE="https://github.com/kovah/linkace"
SRC_URI="https://github.com/kovah/linkace/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE="+mysql sqlite"
REQUIRED_USE="|| ( mysql sqlite )"

DEPEND="dev-php/composer"
BDEPEND="${DEPEND}
	>=net-libs/nodejs-16"
RDEPEND="${DEPEND}
	>=dev-lang/php-8.0[cli,fileinfo,ftp,pdo]
	mysql? ( virtual/mysql )
	sqlite? ( dev-db/sqlite )
	virtual/httpd-php"

S="${WORKDIR}/LinkAce-${PV}"

pkg_pretend() {
	(has network-sandbox ${FEATURES}) && die "You need to disable 'network-sandbox' in FEATURES or package.env"
}

src_prepare() {

	default

	if [ -f "${S}/.dockerignore" ]; then
		rm "${S}/.dockerignore"
	fi

	if [ -f "${S}/docker-compose.yml" ]; then
		rm "${S}/docker-compose.yml"
	fi

	if [ -f "${S}/docker-compose.production.yml" ]; then
		rm "${S}/docker-compose.production.yml"
	fi

	if [ -f "${S}/docker-compose.production-simple.yml" ]; then
		rm "${S}/docker-compose.production-simple.yml"
	fi

	if [ -d "${S}/.github" ]; then
		rm -R "${S}/.github"
	fi

	cd "${S}"
	composer install --no-dev

	npm ci
	npm run prod

}

src_install() {

	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"

	doins -r .

	webapp_serverowned -R "${MY_HTDOCSDIR}"/storage
	webapp_serverowned -R "${MY_HTDOCSDIR}"/bootstrap/cache

	webapp_src_install

}

pkg_postinst() {
	elog "Don't forget to update the application by running 'php artisan migrate'."
	webapp_pkg_postinst
}
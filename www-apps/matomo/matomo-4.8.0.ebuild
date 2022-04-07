# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit webapp

DESCRIPTION="Matomo is the leading Free/Libre open analytics platform."
HOMEPAGE="https://matomo.org"
SRC_URI="https://builds.matomo.org/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-php/composer"
RDEPEND=">=dev-lang/php-7.4[gd,pdo]
        virtual/mysql
        virtual/httpd-php"

S="${WORKDIR}/${PN}"

src_install() {

        webapp_src_preinst

        insinto "${MY_HTDOCSDIR}"
        doins -r .

	keepdir "${MY_HTDOCSDIR}/config"

	webapp_serverowned -R "${MY_HTDOCSDIR}/tmp"
	webapp_serverowned -R "${MY_HTDOCSDIR}/matomo.js"

        webapp_src_install

}

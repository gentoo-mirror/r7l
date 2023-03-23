# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The command line interface for Drupal"
HOMEPAGE="https://drush.org/"
SRC_URI="https://github.com/drush-ops/drush/releases/download/${PV}/${PN}.phar -> ${P}.phar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="dev-lang/php:*"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}"
	cp -L "${DISTDIR}/${A}" "${S}/${PN}"
}

src_install() {
	dobin "${PN}"
}

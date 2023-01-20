# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="passpy -- ZX2C4's pass compatible library and cli"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/bfrascher/passpy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
	dev-python/click
	dev-python/GitPython
	dev-python/python-gnupg
	dev-python/pyperclip
	"

src_prepare() {
	[ -d tests ] && rm -R tests
	distutils-r1_src_prepare
}

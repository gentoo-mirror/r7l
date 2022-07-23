# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg

DESCRIPTION="Obsidian is a powerful knowledge base on top of a local folder of plain text Markdown files."
HOMEPAGE="https://obsidian.md/"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/${PN}-${PV}.tar.gz
	https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/${PN}_${PV}_amd64.deb"

S="${WORKDIR}"

LICENSE="Obsidian-EULA"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""

src_install() {

	# files
	insinto /opt/Obsidian
	doins -r ${S}/${P}/*

	# desktop file from deb
	domenu usr/share/applications/obsidian.desktop

	# icons from deb
	for size in 16 32 48 64 128 256 512; do
		doicon --size "${size}" usr/share/icons/hicolor/${size}x${size}/apps/${PN}.png
	done

	# permissions
	fperms 4755 /opt/Obsidian/chrome-sandbox || die
	fperms +x  /opt/Obsidian/obsidian || die

	# executable
	dosym ../../opt/Obsidian/obsidian /usr/bin/obsidian

}

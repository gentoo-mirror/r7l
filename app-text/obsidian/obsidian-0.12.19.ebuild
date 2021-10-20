# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop unpacker xdg

# Obsidian does not always release a .deb version but plain .tar.gz does not come with desktop file or icons.
# We make use an older deb version for those files.

DEB_VERSION="0.12.15"

DESCRIPTION="https://github.com/obsidianmd/obsidian-releases"
HOMEPAGE="https://obsidian.md/"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/${PN}-${PV}.tar.gz
	https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/${PN}_${DEB_VERSION}_amd64.deb"

S="${WORKDIR}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""

src_install() {

	ls -la ${S}

#	DESTDIR="${D}"

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
# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A ready-to-use zsh configuration with plugins."
HOMEPAGE="https://ohmyz.sh"

EGIT_COMMIT="53863e7b3ff0c2e2816e90dab3d870adebdf49c7"
SRC_URI="https://github.com/ohmyzsh/ohmyzsh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

KEYWORDS="~amd64 ~arm64"

LICENSE="ZSH"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="app-shells/zsh"

ZSH_DEST="/usr/share/zsh/site-contrib/${PN}"
ZSH_EDEST="${EPREFIX}${ZSH_DEST}"
ZSH_TEMPLATE="templates/zshrc.zsh-template"

S="${WORKDIR}/ohmyzsh-${EGIT_COMMIT}"

src_prepare() {
	local i
	for i in "${S}"/tools/*install* "${S}"/tools/*upgrade*
		do test -f "${i}" && : >"${i}"
	done
	sed -i -e 's!^ZSH=.*$!ZSH='"${ZSH_EDEST}"'!' \
		   -e 's!~/.oh-my-zsh!'"${ZSH_EDEST}"'!' "${S}/${ZSH_TEMPLATE}"
	sed -i -e 's!~/.oh-my-zsh!'"${ZSH_EDEST}"'!' \
		"${S}/plugins/dirpersist/dirpersist.plugin.zsh"
	sed -i -e '/zstyle.*cache/d' "${S}/lib/completion.zsh"
	default
}

src_install() {
	insinto "${ZSH_DEST}"
	doins -r *
}

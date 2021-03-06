# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/aquasecurity/trivy"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Scanner for vulnerabilities in container images, file systems, and Git repositories, as well as for configuration issues and hard-coded secrets"
HOMEPAGE="https://github.com/aquasecurity/trivy"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_pretend() {
        (has network-sandbox ${FEATURES}) && die "You need to disable 'network-sandbox' for this Ebuild in FEATURES"
}

src_compile() {

        cd "${S}"

        export GOPATH="${G}"

        local MY_GO_ARGS=(
                -v -work -x
        )

        go generate || die
        CGO_ENABLED=0 GOGC=off go build "${MY_GO_ARGS[@]}" ./cmd/trivy

}

src_install() {
        dobin trivy
}

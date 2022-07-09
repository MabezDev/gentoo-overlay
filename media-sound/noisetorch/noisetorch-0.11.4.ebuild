# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Real-time microphone noise suppression on Linux"
HOMEPAGE="https://github.com/lawl/NoiseTorch"
SRC_URI="https://github.com/lawl/NoiseTorch/releases/download/${PV}/NoiseTorch_x64.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


pkg_setup() {
	S="${WORKDIR}"
}

src_install() {
	insinto "/opt/${PN}/"
	which setcap
	setcap 'CAP_SYS_RESOURCE=+ep' ${WORKDIR}/.local/bin/${PN}
	doins ${WORKDIR}/.local/bin/${PN}
	dosym "${EPREFIX}/opt/${PN}/${PN}" "/usr/bin/${PN}"
	fperms +x "/opt/${PN}/${PN}"
}

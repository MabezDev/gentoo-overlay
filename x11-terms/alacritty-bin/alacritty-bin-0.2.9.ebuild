# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

EXEC_NAME=alacritty
DESCRIPTION="A GPU accelerated terminal written in Rust"

HOMEPAGE="https://github.com/jwilm/alacritty"
BASE_URI="https://github.com/jwilm/alacritty/releases/download/v${PV}/Alacritty-v${PV}"
SRC_URI="amd64? ( ${BASE_URI}-x86_64.tar.gz -> ${P}-x86_64.tar.gz ) x86? ( ${BASE_URI}-i386.tar.gz -> ${P}-i386.tar.gz )"
RESTRICT="mirror strip bindist"

LICENSE="APACHE"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-libs/freetype-2.9.1-r3
>=media-libs/fontconfig-2.13.0-r4
>=x11-misc/xclip-0.13"

RDEPEND="${DEPEND}"

pkg_setup() {
	S="${WORKDIR}"
}

src_install() {
	insinto "/opt/${PN}"
	doins -r *
	dosym "${EPREFIX}/opt/${PN}/${EXEC_NAME}" "/usr/bin/${EXEC_NAME}"
	make_desktop_entry "${EXEC_NAME}" "Alacritty Terminal" "${PN}" "Development;IDE"
	fperms +x "/opt/${PN}/alacritty"

	#newicon "${S}/resources/app/resources/linux/code.png" "${PN}.png"
}

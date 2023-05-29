# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="Noise suppression plugins (LADSPA, LV2, VST) via rrnoise. This package only installs LADSPA."
HOMEPAGE="https://github.com/werman/noise-suppression-for-voice"
SRC_URI="https://github.com/werman/noise-suppression-for-voice/releases/download/v${PV}/linux-rnnoise.zip"

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
	doins "${WORKDIR}/linux-rnnoise/ladspa/librnnoise_ladspa.so"
	dosym "${EPREFIX}/opt/${PN}/librnnoise_ladspa.so" "/usr/lib/ladspa/librnnoise_ladspa.so"
}

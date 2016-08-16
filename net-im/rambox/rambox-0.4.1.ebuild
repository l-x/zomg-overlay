# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils 

EXECUTABLE="Rambox"
MY_PN="Rambox"

DESCRIPTION="Rambox is a free messaging app and combines chat and messaging services into one application."
HOMEPAGE="http://rambox.pro"

LICENSE="MIT"
SLOT="0"

IUSE=""
DEPEND=""

KEYWORDS="~amd64 ~x86"

URL_64="https://github.com/saenzramiro/${PN}/releases/download/${PV}/${P}-x64.zip"
URL_32="https://github.com/saenzramiro/${PN}/releases/download/${PV}/${P}-ia32.zip"

SRC_URI="
	amd64? ( ${URL_64} )
	x86? ( ${URL_32} )
"

RESTRICT="strip mirror"

S="${WORKDIR}/linux"

src_install() {
	local TARGETDIR="/opt/${PN}"

	insinto "${TARGETDIR}/"
	dodir "${TARGETDIR}"
	doins -r ${S}/* || die "Could not install!"

	exeinto "${TARGETDIR}/"
	doexe "${S}/${EXECUTABLE}"

	dosym "${TARGETDIR}/${EXECUTABLE}" /usr/bin/${EXECUTABLE}

	doicon "${FILESDIR}/${PN}.png"

	make_desktop_entry_args=(
		"${EXECUTABLE} %U"				# exec
		"${MY_PN}"						# name
		"${PN}"							# icon
		"Utility"						# categories
	)
	make_desktop_entry_extras=(
		
	)

	make_desktop_entry "${make_desktop_entry_args[@]}"
}

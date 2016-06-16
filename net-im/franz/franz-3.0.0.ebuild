# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils 

EXECUTABLE="Franz"
MY_PN="Franz"

DESCRIPTION="Franz is a free messaging app and combines chat and messaging services into one application."
HOMEPAGE="http://meetfranz.com"

LICENSE="GPL-2"
SLOT="0"

IUSE=""
DEPEND=""

KEYWORDS="~amd64 ~x86"

URL_64="https://github.com/imprecision/franz-app/releases/download/${PV}/${MY_PN}-linux-x64-3.0.0.tgz"
URL_32="https://github.com/imprecision/franz-app/releases/download/${PV}/${MY_PN}-linux-ia32-3.0.0.tgz"

SRC_URI="
	amd64? ( ${URL_64} )
	x86? ( ${URL_32} )
"

S="$WORKDIR"

src_install() {
	local TARGETDIR="/opt/${MY_PN}"

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

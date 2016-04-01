# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils 

EXECUTABLE="Simplenote"

MY_PN="${EXECUTABLE}-linux-x64"
MY_P="${MY_PN}.${PV}"

DESCRIPTION="Simplenote is an easy way to keep notes, lists, ideas and more."
HOMEPAGE="http://simplenote.com"

LICENSE="GPL-2"
SLOT="0"

IUSE=""
DEPEND=""

KEYWORDS="amd64"

SRC_URI="https://github.com/Automattic/simplenote-electron/releases/download/v${PV}/${MY_P}.tar.gz"

S="$WORKDIR/$MY_PN"

src_install() {
	local TARGETDIR="/opt/${MY_PN}"

	insinto "${TARGETDIR}/"
	dodir "${TARGETDIR}"
	doins -r ${S}/* || die "Could not install!"

	exeinto "${TARGETDIR}/"
	doexe "${S}/${EXECUTABLE}"

	dosym "${TARGETDIR}/${EXECUTABLE}" /usr/bin/${PN}

	newicon "${EXECUTABLE}.png" "${PN}.png"

	make_desktop_entry_args=(
		"${PN} %U"						# exec
		"${EXECUTABLE}"					# name
		"${PN}"							# icon
		"Utility"						# categories
	)
	make_desktop_entry_extras=(
		
	)

	make_desktop_entry "${make_desktop_entry_args[@]}"
}

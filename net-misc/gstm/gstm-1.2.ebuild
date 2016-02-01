# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="Gnome SSH Tunnel Manager is a graphical front-end for managing ssh tunneled portredirects"
HOMEPAGE="http://gstm.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-2.6.0
	>=gnome-base/libgnomeui-2.0
	dev-libs/libxml2
	dev-libs/openssl
	"

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-linker-deps.patch" || die "patch failed"
	epatch "${FILESDIR}/${P}-fix-desktop-file.patch" || die "patch failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"

	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README
}

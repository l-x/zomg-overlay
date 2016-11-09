# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit gnome2

DESCRIPTION="Fully-featured alarm clock for your GNOME panel."
HOMEPAGE="http://alarm-clock.pseudoberries.com/"
SRC_URI="https://launchpad.net/alarm-clock/trunk/${PV}/+download/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/glib:2
	x11-libs/gtk+:2
	gnome-base/gnome-vfs
	gnome-base/gconf
	gnome-base/libglade
	media-libs/gstreamer
	x11-themes/gnome-icon-theme
	gnome-base/gnome-panel
	gnome-base/libgnome
	gnome-base/libgnomeui
	x11-libs/libnotify"
DEPEND="${DEPEND}
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README"

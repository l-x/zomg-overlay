# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Yaws is a high performance HTTP 1.1 web server."
HOMEPAGE="http://yaws.hyber.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

SRC_URI="http://yaws.hyber.org/download/${P}.tar.gz"
DEPEND="dev-lang/erlang"
PROVIDE="virtual/httpd-basic virtual/httpd-cgi"

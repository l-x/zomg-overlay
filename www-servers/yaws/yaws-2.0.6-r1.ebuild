# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Yaws is a high performance HTTP 1.1 web server."
HOMEPAGE="http://yaws.hyber.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SRC_URI="https://github.com/klacke/yaws/archive/${P}.tar.gz"
DEPEND="dev-lang/erlang"
PROVIDE="virtual/httpd-basic virtual/httpd-cgi"

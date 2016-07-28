# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Kotlin is a statically typed programming language for the JVM, Android and the browser"
HOMEPAGE="https://kotlinlang.org/"
LICENSE="Apache-2.0"

MY_REV="1"
MY_PN="${PN}-compiler"
MY_PV="${PV}" #-${MY_REV}"
MY_N="$MY_PN-$MY_PV"

SRC_URI="https://github.com/JetBrains/${PN}/releases/download/v${MY_PV}/${MY_N}.zip"

KEYWORDS="amd64 x86"
RDEPEND="|| ( >=virtual/jdk-1.7 >=virtual/jre-1.6 )"

SLOT="0"

S="${WORKDIR}/kotlinc"

src_install() {
	local install_dir="/opt/${MY_PN}"

	insinto "$install_dir"
	doins -r .

	fperms a+x "${install_dir}/bin/kotlin"{,c,c-js,c-jvm}

	dosym "${install_dir}/bin/kotlinc" /usr/bin/kotlinc
	dosym "${install_dir}/bin/kotlinc-js" /usr/bin/kotlinc-js
	dosym "${install_dir}/bin/kotlinc-jvm" /usr/bin/kotlinc-jvm
	dosym "${install_dir}/bin/kotlin" /usr/bin/kotlin
}
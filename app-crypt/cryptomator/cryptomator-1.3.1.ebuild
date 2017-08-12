inherit eutils

DESCRIPTION="Free client-side encryption for your cloud files."
SRC_URI="https://github.com/cryptomator/cryptomator/archive/${PV}.tar.gz"
LICENSE="MIT X"
KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://cryptomator.org"
SLOT=0

S="${WORKDIR}/${P}"

src_compile() {
	cd main
	mvn install -Prelease -Dmaven.test.skip=true
}

src_install () {

	local TARGETDIR="/opt/cryptomator"
	local JARFILE="Cryptomator-${PV}.jar"
	local JARPATH="${S}/main/uber-jar/target/${JARFILE}"

	dodir "${TARGETDIR}"
	insinto "${TARGETDIR}"/

	doins "${JARPATH}" || die "Install failed!"
	doins "${FILESDIR}/${PN}.png"

	make_desktop_entry "java -jar ${TARGETDIR}/${JARFILE}" "Cryptomator" "${TARGETDIR}/${PN}.png" "Utility"

	return
}

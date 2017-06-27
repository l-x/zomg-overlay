EAPI=6

DESCRIPTION="Enchive is a tool to encrypt files to yourself for long-term archival."
HOMEPAGE="https://github.com/skeeto/enchive"
SRC_URI="https://github.com/skeeto/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="mirror"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
}
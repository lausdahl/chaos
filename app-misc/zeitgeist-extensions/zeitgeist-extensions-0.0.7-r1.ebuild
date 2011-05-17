# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator eutils python

DESCRIPTION="Extensions to the engine such as Teamgeist, Relevancy Providers and
Machine Learning Algorithms"
HOMEPAGE="https://launchpad.net/zeitgeist-extensions"
#SRC_URI="http://launchpad.net/${PN}/$(get_version_component_range 1-2)/${PV}/+download/${P}.tar.gz"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+fts geolocation profile"

DEPEND="app-misc/zeitgeist
	fts? ( dev-libs/xapian-bindings[python] )
	geolocation? ( dev-python/python-geoclue )
	profile? ( dev-python/pympler
			   dev-python/dbus-python )"
#	debug? ( dev-python/sqlparse )"
RDEPEND="${DEPEND}"

src_install() {
	#emake install DESTDIR="${D}" || die "Failed to install"
	EXTENSION_DIR="/usr/share/zeitgeist/_zeitgeist/engine/extensions/"

#	if use debug;then
#		insinto "${EXTENSION_DIR}"
#		doins "${S}/debug_sql/debug_sql.py"
#	fi

	if use fts;then
		insinto "${EXTENSION_DIR}"
		doins "${S}/fts/fts.py"
	fi

	if use geolocation;then
		insinto "${EXTENSION_DIR}"
		doins "${S}/geolocation/geolocation.py"
	fi

	if use profile;then
		insinto "${EXTENSION_DIR}"
		doins "${S}/memory-profile/profile_memory.py"
	fi
}

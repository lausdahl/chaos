
# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils mono

BUILDDATE="20061231-0101"

DESCRIPTION="Simias SimpleServer"
HOMEPAGE="http://www.ifolder.com/"
SRC_URI="http://distfiles.one-gear.com/distfiles/${P}.tar.gz"
RESTRICT="mirror"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~amd64"

DEPEND=">=dev-lang/mono-1.2.2.1
	>=dev-dotnet/xsp-1.2.1
	>=dev-dotnet/log4net-1.2.9
	>=dev-db/libflaim-4.9.617
	!dev-dotnet/ifolder-server"



simiasdatadir="${ROOT}var/lib/simias"
S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A} || die "Error unpacking ${PN}"
	cd ${S} || die "Error entering ${PN} source directory"
#	epatch ${FILESDIR}/webdir-prefix.patch
#	epatch ${FILESDIR}/SimiasSetup.cs.in.patch
#	epatch ${FILESDIR}/wildcard.patch
}

src_compile() {
	local myconf

#	sed -i -e "s|@_simiasdatadir_@|${simiasdatadir}|g" ${S}/other/SimpleServer/simpleserver.in || die "Error patching simpleserver.in"
	myconf="--with-runasclient"
	./autogen.sh ${myconf}
	econf ${myconf}
	emake

}

src_install() {
	make DESTDIR=${D} install
}
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/jimmac-xcursors/jimmac-xcursors-0.0.1.ebuild,v 1.11 2006/01/31 14:57:12 josejx Exp $

MY_P="PolarCursorTheme"
MY_SRC_FILE="27913-PolarCursorThemes.tar.bz2"
DESCRIPTION="smooth and simple cursor set"
HOMEPAGE="http://gnome-look.org/content/show.php/Polar+Cursor+Theme?content=27913"
SRC_URI="http://gnome-look.org/CONTENT/content-files/${MY_SRC_FILE}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc ppc64 x86"
IUSE=""

DEPEND="${RDEPEND}"
RDEPEND=""

S=${WORKDIR}
src_install() {
	X11_IMPLEM="xorg-x11"
	einfo "X11 implementation is ${X11_IMPLEM}."

	for THEME in $(ls);do
		dodir /usr/share/cursors/${X11_IMPLEM}/${THEME}/cursors
		THEME_FILE="${THEME}/index.theme"
		cp -d -R ${THEME}/cursors/* \
			${D}/usr/share/cursors/${X11_IMPLEM}/${THEME}/cursors/ || die
		if [ -n "${THEME_FILE}" ];then
			einfo "Installing theme file.."
			cp ${THEME_FILE} \
				${D}/usr/share/cursors/${X11_IMPLEM}/${THEME}/ || die
		fi
	done
}

pkg_postinst() {
	einfo "To use this set of cursors, edit or create the file ~/.Xdefaults"
	einfo "and add the following line:"
	einfo "Xcursor.theme: ${MY_P}"
	einfo ""
	einfo "Also, you can change the size by adding a line like:"
	einfo "Xcursor.size: 48"
	einfo ""
	einfo "To globally use this set of mouse cursors edit the file:"
	einfo "	  /etc/env.d/99xcursors"
	einfo "and change add the line:"
	einfo "	  XCURSORS_THEME="${MY_P}""
	einfo "Note this will be overruled by a user's ~/.Xdefaults file."
	einfo ""
	ewarn "If you experience flickering, try setting the following line in"
	ewarn "the Device section of your XF86Config:"
	ewarn "Option \"HWCursor\" \"false\""
}

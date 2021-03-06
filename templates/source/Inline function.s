#=============================================================================
#   FILE DESCRIPTION: @@INPUT:File description\:@@
#
#   AUTHOR:    @@USER_NAME@@
#   GROUP:     The NULL workgroup
#   PROJECT:   The project
#   PART:      Main
#   VERSION:   1.0
#   CREATED:   @@DATETIME:dd.MM.yyyy HH\:mm\:ss@@
#
#   EMAIL:     some@mail.net
#   WWW:       http://some.net
#
#   COPYRIGHT: (C) @@DATE:yyyy@@ The NULL workgroup. All Rights Reserved.
#-----------------------------------------------------------------------------
#   Copyright (C) @@DATE:yyyy@@ The NULL workgroup
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#-----------------------------------------------------------------------------
#   FILE ID: $Id$
#
#   CHANGE LOG:
#
#   $Log$
#=============================================================================
.text
.global	delta
delta:
	flds 	b  			# Stack b
	fmuls 	b  			# Stack b*b
	flds 	Quatre 			# Stack 4 b*b
	fmuls 	a  			# Stack 4*a b*b
	fmuls 	c  			# Stack 4*a*c b*b
	fsubrp  			# Stack b*b-4*a*c
	fstps 	Delta 			# Stack empty
	ret
#=============================================================================

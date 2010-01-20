/* Copyright (C) 2010 Mobile Sorcery AB

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License, version 2, as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with this program; see the file COPYING.  If not, write to the Free
Software Foundation, 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA.
*/

#ifndef PIXELCOORDINATE_H_
#define PIXELCOORDINATE_H_

namespace MAP
{
	//=========================================================================
	class PixelCoordinate
	//=========================================================================
	{
	public:
		PixelCoordinate( ) :
			mX( 0 ),
			mY( 0 ),
			mMagnification( 0 )
		{
		}

		PixelCoordinate( const int magnification, const int x, const int y)
		:	mX( x ),
			mY( y ),
			mMagnification( magnification )
		{
		}

		int getX( ) const					
		{ 
			return mX; 
		}

		int getY( ) const					
		{ 
			return mY; 
		}

		int getMagnification( ) const		
		{ 
			return mMagnification; 
		}

		bool operator == ( const PixelCoordinate& b ) const
		{
			return getX( ) == b.getX( ) && getY( ) == b.getY( ) && getMagnification( ) == b.getMagnification( );
		}

		bool operator != ( const PixelCoordinate& b ) const
		{
			return getX( ) != b.getX( ) || getY( ) != b.getY( ) || getMagnification( ) != b.getMagnification( );
		}
	private:
		int mX;
		int mY;
		int mMagnification;
	};
}

#endif // PIXELCOORDINATE_H_

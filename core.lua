--[[
MIT License

Copyright (c) 2023 Graham Ranson of Glitch Games Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]

--- Class creation.
local Fonts = {}

--- Required libraries

--- Initiates a new Fonts object.
-- @param params Parameter table for the object.
function Fonts:new( params )
	
	self.fonts = {}
	
	return self
	
end

function Fonts:register( name, file, size, platform )
	self.fonts[ name ] = self.fonts[ name ] or {}
	self.fonts[ name ][ platform or "default" ] = { file = file, size = size }
end

function Fonts:get( name, platform )
	
	platform = platform or system.getInfo( "platform" )

	local font = self.fonts[ name ]
	
	if font then
		font = ( self.fonts[ name ][ platform ] or self.fonts[ name ][ "default" ] )
	end
	
	if not font then
		font =
		{
			file = native.systemFont,
			size = 12
		}
	end
	
	return font
	
end

return Fonts
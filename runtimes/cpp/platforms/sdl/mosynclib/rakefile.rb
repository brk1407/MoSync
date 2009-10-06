BD = "../../../../.."

require "#{BD}/build_rules/host.rb"

#---------------------------------------------------------------------------------
# SOURCES is a list of directories containing source code
# LIBRARIES is a list of libraries that this project needs
#---------------------------------------------------------------------------------
SOURCES = []
EXTRA_SOURCEFILES = ["mosynclib.cpp", "mosyncmain.cpp"]
EXTRA_INCLUDES = ["#{BD}/runtimes/cpp/base", ".."]

LOCAL_LIBS = ["mosync_sdl", "mosync_log_file", "mosync_bluetooth", "net"]
LOCAL_DLLS = ["amr"]
COMMON_LIBRARIES = ["SDL", "SDL_image", "SDL_ttf"]

if(HOST == "win32") then
	CUSTOM_LIBS = COMMON_LIBRARIES.collect do |lib| "#{lib}.lib" end +
		["libexpat.lib", "SDL_sound.lib", "libirprops.a", "libuuid.a"]
	LIBRARIES = ["wsock32", "ws2_32"]
else
	if ( SDL_SOUND == false )
		SOUND_LIB = []

		if ( HOST_PLATFORM != "moblin" )
			EXTRA_CXXFLAGS = " -D__NO_SDL_SOUND__ "
		else
			EXTRA_CXXFLAGS = " -D__NO_SDL_SOUND__ -D__USE_FULLSCREEN__ "
		end

		IGNORED_FILES += [ "SDLSoundAudioSource.cpp" ]
	else
		SOUND_LIB = [ "SDL_sound" ]
	end

	LIBRARIES = COMMON_LIBRARIES + SOUND_LIB + ["gtk-x11-2.0", "bluetooth", "expat"]
end

DLLNAME = "mosync"

#---------------------------------------------------------------------------------
# actual build rules
#---------------------------------------------------------------------------------

require "#{BD}/build_rules/native.rb"

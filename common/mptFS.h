/*
 * mptFS.h
 * -------
 * Purpose:
 * Notes  : Currently none.
 * Authors: OpenMPT Devs
 * The OpenMPT source code is released under the BSD license. Read LICENSE for more details.
 */


#pragma once

#include "openmpt/all/BuildSettings.hpp"

#include "mpt/base/namespace.hpp"

#include "openmpt/base/FlagSet.hpp"

#include "mptPathString.h"



OPENMPT_NAMESPACE_BEGIN



namespace mpt
{



#if defined(MODPLUG_TRACKER) && MPT_OS_WINDOWS



namespace FS
{

	// Verify if this path represents a valid directory on the file system.
	bool IsDirectory(const mpt::PathString &path);
	// Verify if this path exists and is a file on the file system.
	bool IsFile(const mpt::PathString &path);
	// Verify that a path exists (no matter what type)
	bool PathExists(const mpt::PathString &path);

	// Deletes a complete directory tree. Handle with EXTREME care.
	// Returns false if any file could not be removed and aborts as soon as it
	// encounters any error. path must be absolute.
	bool DeleteDirectoryTree(mpt::PathString path);

} // namespace FS



// Returns the application executable path or an empty string (if unknown), e.g. "C:\mptrack\"
mpt::PathString GetExecutableDirectory();

#if !MPT_OS_WINDOWS_WINRT
// Returns the system directory path, e.g. "C:\Windows\System32\"
mpt::PathString GetSystemDirectory();
#endif // !MPT_OS_WINDOWS_WINRT

// Returns temporary directory (with trailing backslash added) (e.g. "C:\TEMP\")
mpt::PathString GetTempDirectory();



#endif // MODPLUG_TRACKER && MPT_OS_WINDOWS



} // namespace mpt



OPENMPT_NAMESPACE_END

/*==========================================================================*/
/*
@@INCLUDE:$\templates\source\header-base@@
*/
/*--------------------------------------------------------------------------*/
/*
@@INCLUDE:$\templates\source\header-gnu@@
*/
/*--------------------------------------------------------------------------*/
/*
@@INCLUDE:$\templates\source\header-cvs@@
*/
/*==========================================================================*/
#ifndef __@@UPPERFILE_NAME@@_@@UPPERFILE_EXT@@__
#define __@@UPPERFILE_NAME@@_@@UPPERFILE_EXT@@__
/*==========================================================================*/
#ifdef __cplusplus
extern "C" {
#endif
/*==========================================================================*/
/*                            DRIVER SETTINGS                               */
/*==========================================================================*/
#ifdef __DRIVER_DLL__
#	ifdef __DRIVER_EXPORT__
#		define DRIVER_API __declspec(dllexport)
#	else
#		define DRIVER_API __declspec(dllimport)
#	endif
#else
#	define DRIVER_API
#endif
/*==========================================================================*/
/*                            DRIVER FUNCTIONS                              */
/*==========================================================================*/
// FUNCTION: Install driver
// ARGUMENTS:
//     1) Pionter to driver handle
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_Install(void** DriverHandle);
// FUNCTION: Uninstall driver
// ARGUMENTS:
//     1) Pionter to driver handle
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_Uninstall(void** DriverHandle);
// FUNCTION: Get driver name
// ARGUMENTS:
//     1) Driver handle
//     2) Driver name (256 bytes)
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_GetDriverNameA(void* DriverHandle, char* Name);
// FUNCTION: Get driver name (unicode version)
// ARGUMENTS:
//     1) Driver handle
//     2) Driver name (256 wide bytes)
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_GetDriverNameW(void* DriverHandle, wchar_t* Name);
// FUNCTION: Get device name
// ARGUMENTS:
//     1) Driver handle
//     2) Device index
//     3) Device name (256 bytes)
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_GetDeviceNameA(void* DriverHandle, int DeviceIndex, char* Name);
// FUNCTION: Get device name (unicode version)
// ARGUMENTS:
//     1) Driver handle
//     2) Device index
//     3) Device name (256 wide bytes)
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_GetDeviceNameW(void* DriverHandle, int DeviceIndex, wchar_t* Name);
// FUNCTION: Get device count
// ARGUMENTS:
//     1) Driver handle
// RETURN:
//     1) Device count
DRIVER_API int Driver_GetDeviceCount(void* DriverHandle);
// FUNCTION: Init device
// ARGUMENTS:
//     1) Driver handle
//     2) Pionter to device handle
//     3) Device index
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_Init(void* DriverHandle, void** DeviceHandle, int DeviceIndex);
// FUNCTION: Close device
// ARGUMENTS:
//     1) Driver handle
//     2) Pionter to device handle
// RETURN:
//     1) 0 - if ok
//     2) -1 - if error
DRIVER_API int Driver_Close(void* DriverHandle, void** DeviceHandle);
/*==========================================================================*/
#ifdef __cplusplus
}
#endif
/*==========================================================================*/
#endif

@implementation TelephonyCapabilitiesGetHardwareModel

void __TelephonyCapabilitiesGetHardwareModel_block_invoke()
{
  void *v0;
  uint64_t (*v1)(const __CFString *, _QWORD);
  uint64_t (*v2)(const __CFString *, _QWORD);
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  const __CFString *v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  int Value;
  const __CFString *v12;
  const __CFString *v13;
  CFTypeID v14;
  const __CFString *v15;
  CFTypeID v16;
  NSObject *v17;
  const char *v18;
  char v19;
  char v20;
  _OWORD v21[2];
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(v21, 0, sizeof(v21));
  v0 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (!v0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Failed to load MobileGestalt library";
    goto LABEL_13;
  }
  v1 = (uint64_t (*)(const __CFString *, _QWORD))dlsym(v0, "MGCopyAnswer");
  if (!v1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to find MGCopyAnswer function";
    goto LABEL_13;
  }
  v2 = v1;
  v3 = (const __CFBoolean *)v1(CFSTR("IsVirtualDevice"), 0);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unable to determine whether this is a virtual device", buf, 2u);
    }
    goto LABEL_47;
  }
  v4 = v3;
  if (CFBooleanGetValue(v3) == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Detected virtual device, so treating it as unknown Telephony product", buf, 2u);
    }
    dword_1ECF857A8 = 0;
    sTelephonyCapabilitiesHardwareModelInfo = 0;
    v5 = (const __CFString *)v4;
    goto LABEL_8;
  }
  CFRelease(v4);
  v9 = (const __CFBoolean *)v2(CFSTR("HasBaseband"), 0);
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to determine whether device has baseband";
    goto LABEL_13;
  }
  v10 = v9;
  Value = CFBooleanGetValue(v9);
  CFRelease(v10);
  if (!Value)
  {
    v15 = (const __CFString *)v2(CFSTR("DeviceName"), 0);
    if (v15)
    {
      v13 = v15;
      v16 = CFGetTypeID(v15);
      if (v16 != CFStringGetTypeID())
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_46;
        *(_WORD *)buf = 0;
        v17 = MEMORY[0x1E0C81028];
        v18 = "Detected unexpected type in the MobileGestalt device name";
        goto LABEL_45;
      }
      if (CFStringCompare(CFSTR("iPad"), v13, 0))
      {
        if (CFStringCompare(CFSTR("Apple Watch"), v13, 0))
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_WORD *)buf = 0;
          v17 = MEMORY[0x1E0C81028];
          v18 = "Detected an unsupported non-baseband device";
LABEL_45:
          _os_log_error_impl(&dword_190D2F000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
          goto LABEL_46;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Detected a WiFi Watch", buf, 2u);
        }
        v19 = 104;
        v20 = 87;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Detected a WiFi iPad", buf, 2u);
        }
        v19 = 100;
        v20 = 80;
      }
      LODWORD(sTelephonyCapabilitiesHardwareModelInfo) = 99;
      BYTE4(sTelephonyCapabilitiesHardwareModelInfo) = v20;
      BYTE5(sTelephonyCapabilitiesHardwareModelInfo) = v19;
      HIWORD(sTelephonyCapabilitiesHardwareModelInfo) = 0;
      dword_1ECF857A8 = 0;
      v5 = v13;
LABEL_8:
      CFRelease(v5);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to determine the device name";
LABEL_13:
    v8 = 2;
LABEL_14:
    _os_log_error_impl(&dword_190D2F000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
    goto LABEL_47;
  }
  v12 = (const __CFString *)v2(CFSTR("HWModelStr"), 0);
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to determine the hardware model string";
    goto LABEL_13;
  }
  v13 = v12;
  v14 = CFGetTypeID(v12);
  if (v14 != CFStringGetTypeID())
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Detected unexpected type in the MobileGestalt hardware model string";
    goto LABEL_45;
  }
  if (!CFStringGetCString(v13, (char *)v21, 32, 0x600u))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
      v18 = "Unable to copy MobileGestalt hardware model string into local buffer";
      goto LABEL_45;
    }
LABEL_46:
    CFRelease(v13);
    goto LABEL_47;
  }
  CFRelease(v13);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v21;
    _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Detected a baseband device with hardware model string '%s'", buf, 0xCu);
  }
  memset(buf, 170, 12);
  if (TelephonyUtilParseHardwareModel(v21, (uint64_t)buf))
  {
    sTelephonyCapabilitiesHardwareModelInfo = *(_QWORD *)buf;
    dword_1ECF857A8 = *(_DWORD *)&buf[8];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Successfully set the hardware model info", buf, 2u);
    }
    return;
  }
  dword_1ECF857A8 = 0;
  sTelephonyCapabilitiesHardwareModelInfo = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v21;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Failed to set hardware model info based on hardware model string '%s'";
    v8 = 12;
    goto LABEL_14;
  }
LABEL_47:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v21[0]) = 0;
    _os_log_error_impl(&dword_190D2F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Treating device as unknown Telephony product due error determining hardware model info from MobileGestalt query", (uint8_t *)v21, 2u);
  }
  dword_1ECF857A8 = 0;
  sTelephonyCapabilitiesHardwareModelInfo = 0;
}

@end

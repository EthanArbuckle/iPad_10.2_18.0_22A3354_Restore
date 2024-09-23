@implementation PSWiFiSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=WIFI"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.wifi"));
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  const void *v5;
  CFRunLoopRef Current;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CFRunLoopRef v13;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  v4 = PSWiFiManagerClientCreate(*MEMORY[0x1E0C9AE00]);
  if (v4)
  {
    v5 = (const void *)v4;
    Current = CFRunLoopGetCurrent();
    v7 = *MEMORY[0x1E0C9B280];
    PSWiFiManagerClientScheduleWithRunLoop((uint64_t)v5, (uint64_t)Current, *MEMORY[0x1E0C9B280]);
    v8 = (void *)PSWiFiManagerClientCopyDevices((uint64_t)v5);
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (PSWiFiDeviceClientGetPower((uint64_t)v9) != v3)
      {
        _PSLoggingFacility();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "Toggled Wifi State.", (uint8_t *)&v15, 2u);
        }

        v15 = 0;
        v16 = &v15;
        v17 = 0x2020000000;
        v11 = getWiFiManagerClientSetPowerSymbolLoc_ptr;
        v18 = getWiFiManagerClientSetPowerSymbolLoc_ptr;
        if (!getWiFiManagerClientSetPowerSymbolLoc_ptr)
        {
          v12 = (void *)MobileWiFiLibrary();
          v11 = dlsym(v12, "WiFiManagerClientSetPower");
          v16[3] = (uint64_t)v11;
          getWiFiManagerClientSetPowerSymbolLoc_ptr = v11;
        }
        _Block_object_dispose(&v15, 8);
        if (!v11)
        {
          v14 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
          _Block_object_dispose(&v15, 8);
          _Unwind_Resume(v14);
        }
        ((void (*)(const void *, _BOOL8))v11)(v5, v3);
      }
    }
    v13 = CFRunLoopGetCurrent();
    PSWiFiManagerClientUnscheduleFromRunLoop((uint64_t)v5, (uint64_t)v13, v7);
    CFRelease(v5);

  }
}

+ (BOOL)isEnabled
{
  uint64_t v2;
  const void *v3;
  CFRunLoopRef Current;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  CFRunLoopRef v9;

  v2 = PSWiFiManagerClientCreate(*MEMORY[0x1E0C9AE00]);
  if (!v2)
    return 0;
  v3 = (const void *)v2;
  Current = CFRunLoopGetCurrent();
  v5 = *MEMORY[0x1E0C9B280];
  PSWiFiManagerClientScheduleWithRunLoop((uint64_t)v3, (uint64_t)Current, *MEMORY[0x1E0C9B280]);
  v6 = (void *)PSWiFiManagerClientCopyDevices((uint64_t)v3);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = PSWiFiDeviceClientGetPower((uint64_t)v7) != 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = CFRunLoopGetCurrent();
  PSWiFiManagerClientUnscheduleFromRunLoop((uint64_t)v3, (uint64_t)v9, v5);
  CFRelease(v3);

  return v8;
}

@end

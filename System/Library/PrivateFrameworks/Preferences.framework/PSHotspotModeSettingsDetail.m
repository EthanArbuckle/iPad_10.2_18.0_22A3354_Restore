@implementation PSHotspotModeSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT#INTERNET_TETHERING"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.personal-hotspot"));
}

+ (BOOL)deviceSupportsPersonalHotspot
{
  return MGGetBoolAnswer();
}

+ (NETRBClient)getNETRBClient
{
  NETRBClient *result;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  result = (NETRBClient *)_netrbClient;
  if (!_netrbClient)
  {
    v3 = (void *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
    v5 = v3;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v6 = get_NETRBClientCreateSymbolLoc_ptr;
    v14 = get_NETRBClientCreateSymbolLoc_ptr;
    if (!get_NETRBClientCreateSymbolLoc_ptr)
    {
      v7 = (void *)NetrbLibrary();
      v6 = dlsym(v7, "_NETRBClientCreate");
      v12[3] = (uint64_t)v6;
      get_NETRBClientCreateSymbolLoc_ptr = v6;
    }
    _Block_object_dispose(&v11, 8);
    if (!v6)
    {
      v10 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v10);
    }
    v8 = (void *)MEMORY[0x1E0C80D38];
    v9 = ((uint64_t (*)(_QWORD, void *, _QWORD))v6)(MEMORY[0x1E0C80D38], &__block_literal_global_31, 0);

    _netrbClient = v9;
    return (NETRBClient *)_netrbClient;
  }
  return result;
}

uint64_t __45__PSHotspotModeSettingsDetail_getNETRBClient__block_invoke()
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NETRBClient *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = +[PSHotspotModeSettingsDetail getNETRBClient](PSHotspotModeSettingsDetail, "getNETRBClient");
  if (v3)
    v5 = 1023;
  else
    v5 = 1022;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  v13 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr)
  {
    v7 = (void *)NetrbLibrary();
    v6 = dlsym(v7, "_NETRBClientSetGlobalServiceState");
    v11[3] = (uint64_t)v6;
    get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    v9 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  ((void (*)(NETRBClient *, uint64_t))v6)(v4, v5);
  v8 = wifiManager;
  if (!wifiManager)
    v8 = PSWiFiManagerClientCreate(*MEMORY[0x1E0C9AE00]);
  wifiManager = v8;
  PSWiFiManagerClientSetMISDiscoveryState(v8, v3, v3 ^ 1);
}

+ (BOOL)isEnabled
{
  NETRBClient *v2;
  void *v3;
  void *v4;
  _Unwind_Exception *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v2 = +[PSHotspotModeSettingsDetail getNETRBClient](PSHotspotModeSettingsDetail, "getNETRBClient");
  v7 = 0;
  v8 = 1020;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  v12 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr)
  {
    v4 = (void *)NetrbLibrary();
    v3 = dlsym(v4, "_NETRBClientGetGlobalServiceState");
    v10[3] = (uint64_t)v3;
    get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    v6 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v6);
  }
  ((void (*)(NETRBClient *, int *, int *))v3)(v2, &v8, &v7);
  return v8 == 1023;
}

+ (void)setDiscoverable:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;

  v3 = a3;
  if (a3 && !+[PSHotspotModeSettingsDetail isEnabled](PSHotspotModeSettingsDetail, "isEnabled"))
  {
    +[PSHotspotModeSettingsDetail setEnabled:](PSHotspotModeSettingsDetail, "setEnabled:", 1);
  }
  else
  {
    v4 = wifiManager;
    if (!wifiManager)
      v4 = PSWiFiManagerClientCreate(*MEMORY[0x1E0C9AE00]);
    wifiManager = v4;
    PSWiFiManagerClientSetMISDiscoveryState(v4, v3, v3 ^ 1);
  }
}

+ (BOOL)isDiscoverable
{
  uint64_t v2;
  void *v3;
  void *v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v2 = wifiManager;
  if (!wifiManager)
    v2 = PSWiFiManagerClientCreate(*MEMORY[0x1E0C9AE00]);
  wifiManager = v2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr;
  v10 = getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr;
  if (!getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr)
  {
    v4 = (void *)MobileWiFiLibrary();
    v3 = dlsym(v4, "WiFiManagerClientGetMISDiscoveryState");
    v8[3] = (uint64_t)v3;
    getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
  {
    v6 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v3)(v2);
}

@end

void TRLogInitialize()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int AppBooleanValue;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == -1)
  {
    v0 = (void *)MEMORY[0x24BDD17C8];
    NSHomeDirectoryForUser(CFSTR("mobile"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v1;
    v12[1] = CFSTR("Library");
    v12[2] = CFSTR("Preferences");
    v12[3] = CFSTR("com.apple.TouchRemote.plist");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "pathWithComponents:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
    LODWORD(v2) = objc_msgSend(v4, "isReadableFileAtPath:", v3);

    if ((_DWORD)v2)
      _TRLogEnabled = CFPreferencesGetAppBooleanValue(CFSTR("DebugLog"), CFSTR("com.apple.TouchRemote"), 0);

  }
  if (_TRLogVerboseEnabled == -1)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    NSHomeDirectoryForUser(CFSTR("mobile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = CFSTR("Library");
    v11[2] = CFSTR("Preferences");
    v11[3] = CFSTR("com.apple.TouchRemote.plist");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDD1580]);
    LODWORD(v7) = objc_msgSend(v9, "isReadableFileAtPath:", v8);

    if ((_DWORD)v7)
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VerboseDebugLog"), CFSTR("com.apple.TouchRemote"), 0);
    else
      AppBooleanValue = 0;
    _TRLogVerboseEnabled = AppBooleanValue;

  }
}

id TRLogHandle()
{
  if (TRLogHandle_once != -1)
    dispatch_once(&TRLogHandle_once, &__block_literal_global);
  return (id)TRLogHandle_handle;
}

void sub_20A2C17F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGKLocalPlayerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!GameCenterFoundationLibraryCore_frameworkLibrary)
  {
    GameCenterFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!GameCenterFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("GKLocalPlayer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getGKLocalPlayerClass_block_invoke_cold_1();
    free(v3);
  }
  getGKLocalPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20A2C2738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A2C3290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A2C4634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20A2C6A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

const __CFString *TRStringFromSetupAccountType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("None");
  else
    return off_24C2E50E0[a1 - 1];
}

const __CFString *TRStringFromDeviceSetupError(uint64_t a1)
{
  if ((unint64_t)(a1 + 8110) > 9)
    return CFSTR("TRDeviceSetupErrorUnknown");
  else
    return off_24C2E5100[a1 + 8110];
}

void sub_20A2C8BB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20A2C92EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2C9728(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20A2C9C58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20A2C9EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CA0E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20A2CA2DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20A2CA510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CAC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CB568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initAKAppleIDAuthenticationInAppContext()
{
  Class result;

  if (AuthKitUILibrary_sOnce != -1)
    dispatch_once(&AuthKitUILibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  classAKAppleIDAuthenticationInAppContext = (uint64_t)result;
  getAKAppleIDAuthenticationInAppContextClass = (uint64_t (*)())AKAppleIDAuthenticationInAppContextFunction;
  return result;
}

id AKAppleIDAuthenticationInAppContextFunction()
{
  return (id)classAKAppleIDAuthenticationInAppContext;
}

id _StringFromAccountServices(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        StringFromTRAccountService(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "unsignedIntegerValue", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_20A2CD7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CDC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CE508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2CF0C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20A2D0B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

BOOL TRGetCurrentWiFiNetwork(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  const void *v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;

  v4 = WiFiManagerClientCreate();
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v6 = (void *)WiFiManagerClientCopyDevices();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (const void *)objc_claimAutoreleasedReturnValue();
    v8 = WiFiDeviceClientCopyCurrentNetwork();
    if (v8)
    {
      v9 = (const void *)v8;
      v10 = (void *)objc_msgSend((id)WiFiNetworkGetSSID(), "copy");
      v11 = v10;
      if (a1)
        *a1 = objc_retainAutorelease(v10);
      v12 = (void *)WiFiNetworkCopyPassword();
      v13 = v12;
      if (a2)
        *a2 = objc_retainAutorelease(v12);
      v14 = objc_msgSend(v11, "length") != 0;
      CFRelease(v9);

    }
    else
    {
      v14 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v14 = 0;
  }
  CFRelease(v5);

  return v14;
}

SCPreferencesRef TRGetNetworkConfigurationForIPv4(_QWORD *a1)
{
  SCPreferencesRef result;
  const void *v3;
  const __SCNetworkSet *v4;
  const __SCNetworkSet *v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  const __CFString *v11;
  uint64_t i;
  const __SCNetworkService *v13;
  const __SCNetworkInterface *Interface;
  CFStringRef InterfaceType;
  SCNetworkProtocolRef v16;
  const __SCNetworkProtocol *v17;
  CFTypeRef v18;
  void *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  result = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.TouchRemote"), 0, 0);
  if (!result)
    return result;
  v3 = result;
  v4 = SCNetworkSetCopyCurrent(result);
  if (!v4)
    goto LABEL_28;
  v5 = v4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = SCNetworkSetCopyServices(v4);
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v20 = a1;
    v9 = *(_QWORD *)v22;
    v10 = (const void *)*MEMORY[0x24BDF5A48];
    v11 = (const __CFString *)*MEMORY[0x24BDF5A58];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v13 = *(const __SCNetworkService **)(*((_QWORD *)&v21 + 1) + 8 * i);
        Interface = SCNetworkServiceGetInterface(v13);
        if (SCNetworkInterfaceGetBSDName(Interface))
        {
          InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
          if (CFEqual(InterfaceType, v10))
          {
            v16 = SCNetworkServiceCopyProtocol(v13, v11);
            if (v16)
            {
              v17 = v16;
              v18 = CFRetain(v13);
              goto LABEL_15;
            }
          }
        }
      }
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
    v17 = 0;
    v18 = 0;
LABEL_15:
    a1 = v20;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }

  CFRelease(v5);
  if (v17 && v18)
  {
    v19 = (void *)-[__CFDictionary copy](SCNetworkProtocolGetConfiguration(v17), "copy");
    CFRelease(v18);
    goto LABEL_24;
  }
  if (v18)
    CFRelease(v18);
  if (!v17)
  {
LABEL_28:
    CFRelease(v3);
    return 0;
  }
  v19 = 0;
LABEL_24:
  CFRelease(v17);
  CFRelease(v3);
  if (!v19)
    return 0;
  if (a1)
    *a1 = objc_retainAutorelease(v19);

  return (SCPreferencesRef)1;
}

uint64_t TRCanPerformSetupGetConfig(BOOL *a1, _QWORD *a2, _QWORD *a3)
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = 0;
  v6 = TRGetCurrentWiFiNetwork(&v18, &v17);
  v7 = v18;
  v8 = v17;
  if (v6)
  {
    v9 = objc_msgSend(v7, "length");
    if (v9)
    {
      if (a1)
        *a1 = v9 != 0;
      if (a2)
        *a2 = objc_retainAutorelease(v7);
      if (a3)
        *a3 = objc_retainAutorelease(v8);
      v16 = 0;
      v10 = (uint64_t)TRGetNetworkConfigurationForIPv4(&v16);
      v11 = v16;
      v12 = v11;
      if (!(_DWORD)v10)
        goto LABEL_22;
      -[NSObject objectForKey:](v11, "objectForKey:", *MEMORY[0x24BDF5AE0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDF5BE0]) & 1) != 0)
      {

        v10 = 1;
LABEL_22:

        goto LABEL_23;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "BOOL TRCanPerformSetupGetConfig(BOOL *, NSString *__autoreleasing *, NSString *__autoreleasing *)";
          v21 = 2112;
          v22 = v13;
          _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Unsupported network config method: %@", buf, 0x16u);
        }

      }
LABEL_21:
      v10 = 0;
      goto LABEL_22;
    }
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v12, OS_LOG_TYPE_DEFAULT, "No Wi-Fi network", buf, 2u);
    }
    goto LABEL_21;
  }
  v10 = 0;
LABEL_23:

  return v10;
}

void sub_20A2D46D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _TRSetupAccountTypeFromProtocolString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("it")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ic")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("hs")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("gc")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id TRCopyDecompressedGZipDataForData()
{
  void *v0;
  id v1;
  unsigned int v2;
  unsigned int v3;
  z_stream strm;
  _BYTE v6[16384];
  uint64_t v7;

  v0 = (void *)MEMORY[0x24BDAC7A8]();
  v7 = *MEMORY[0x24BDAC8D0];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(v0, "length");
  strm.next_in = (Bytef *)objc_msgSend(v0, "bytes");
  v1 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v6;
      v2 = inflate(&strm, 0);
      if (v2 > 1)
        break;
      v3 = v2;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v1, "appendBytes:length:", v6, 0x4000 - strm.avail_out);
      if (v3)
      {
        inflateEnd(&strm);
        return v1;
      }
    }
    inflateEnd(&strm);

    return 0;
  }
  return v1;
}

uint64_t TRCopyGzippedDataForData(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  z_stream v10;

  v2 = objc_msgSend(a1, "bytes");
  v3 = objc_msgSend(a1, "length");
  v4 = 0;
  if (v2)
  {
    v5 = v3;
    if (v3)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v3);
      memset(&v10.avail_in, 0, 104);
      v10.avail_in = v5;
      v10.avail_out = v5;
      v10.next_out = (Bytef *)objc_msgSend(v6, "mutableBytes", v2, *(_QWORD *)&v10.avail_in);
      if (v6
        && !deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (v7 = deflate(&v10, 4), v8 = deflateEnd(&v10), v7 == 1))
      {
        v4 = 0;
        if (!v8 && v5 == v10.total_in)
        {
          objc_msgSend(v6, "setLength:", v10.total_out);
          v4 = objc_msgSend(v6, "copy");
        }
      }
      else
      {
        v4 = 0;
      }

    }
  }
  return v4;
}

void sub_20A2D749C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20A2D959C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;
  id *v6;

  v6 = v3;
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20A2DB780(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_20A2DBBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2DC974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initAAUIProxiedTermsRemoteUI()
{
  Class result;

  if (AppleAccountUILibrary_sOnce != -1)
    dispatch_once(&AppleAccountUILibrary_sOnce, &__block_literal_global_2);
  result = objc_getClass("AAUIProxiedTermsRemoteUI");
  classAAUIProxiedTermsRemoteUI = (uint64_t)result;
  getAAUIProxiedTermsRemoteUIClass = (uint64_t (*)())AAUIProxiedTermsRemoteUIFunction;
  return result;
}

id AAUIProxiedTermsRemoteUIFunction()
{
  return (id)classAAUIProxiedTermsRemoteUI;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20A2DFBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *StringFromTRAccountService(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_24C2E5C18[a1 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%lu]"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_20A2E3600(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20A2E4114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2E58DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20A2E5B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2E616C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A2E6F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void TRMetricsLog(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "MetricEvent '%@' : %@\n", (uint8_t *)&v6, 0x16u);
    }

  }
  softLinkAnalyticsSendEvent(v3, v4);

}

void initAnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = CoreAnalyticsLibrary_sOnce;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&CoreAnalyticsLibrary_sOnce, &__block_literal_global_5);
  softLinkAnalyticsSendEvent = (uint64_t (*)())dlsym((void *)CoreAnalyticsLibrary_sLib, "AnalyticsSendEvent");
  ((void (*)(id, id))softLinkAnalyticsSendEvent)(v5, v4);

}

uint64_t __getGKLocalPlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1(v0);
}

uint64_t AES_CTR_Final()
{
  return MEMORY[0x24BE28DD8]();
}

uint64_t AES_CTR_Init()
{
  return MEMORY[0x24BE28DE0]();
}

uint64_t AES_CTR_Update()
{
  return MEMORY[0x24BE28DE8]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x24BDBC948](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x24BDD0DE0](userName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PCFdAVst()
{
  return MEMORY[0x24BE037A8]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5750](protocol);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x24BDF57B8](service, protocolType);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x24BDF57D8](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x24BDF5808](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x24BDF5810](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5870](allocator, name, prefsID, authorization);
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

uint64_t VBAEFt()
{
  return MEMORY[0x24BE037C0]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x24BE67B88]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x24BE67C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t gQblcfSzZBQsYCCV()
{
  return MEMORY[0x24BE037D8]();
}

uint64_t h4BvW7X()
{
  return MEMORY[0x24BE037E0]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}


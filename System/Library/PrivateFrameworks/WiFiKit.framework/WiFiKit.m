void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_219FCB3B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id WFLogForCategory(unint64_t a1)
{
  id v2;
  id v3;

  if (WFLogForCategory_onceToken != -1)
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_6);
  v2 = (id)MEMORY[0x24BDACB70];
  v3 = MEMORY[0x24BDACB70];
  if (a1 <= 8)
  {
    v2 = (id)*off_24DC35CB0[a1];

  }
  return v2;
}

uint64_t WFCurrentLogLevel()
{
  if (WFIsInternalInstall___internalInstallOnceToken != -1)
    dispatch_once(&WFIsInternalInstall___internalInstallOnceToken, &__block_literal_global_1);
  if (WFIsInternalInstall___internalInstall | __extraLoggingEnabled)
    return 4;
  else
    return 2;
}

uint64_t OSLogForWFLogLevel(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x201011000uLL >> (8 * a1);
  if (a1 >= 5)
    LOBYTE(v1) = 0;
  return v1;
}

uint64_t _WFNetworkUsesSecurityCiphers(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a3;
  v9 = a1;
  objc_msgSend(v9, "objectForKeyedSubscript:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12 = objc_msgSend(v7, "containsObject:", v10);
    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v12 = 0;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "intersectsSet:", v14);

  }
LABEL_7:

  return v12;
}

uint64_t WFSecurityModeFromScanDictionary(void *a1, uint64_t *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  _BOOL4 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
    v21 = 0;
    if (!a2)
      goto LABEL_88;
    goto LABEL_87;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("WEP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("WEP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  v48 = v6;
  v41 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("RSN_IE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v47 = v4;
    objc_msgSend(v3, "objectForKey:", CFSTR("RSN_IE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("IE_KEY_RSN_AUTHSELS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("IE_KEY_RSN_CAPS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "objectForKey:", CFSTR("MFP_REQUIRED"));
    v16 = objc_msgSend(v14, "objectForKey:", CFSTR("MFP_CAPABLE"));
    if (v15)
      v19 = v15 != *MEMORY[0x24BDBD270] || v16 == 0 || v16 != *MEMORY[0x24BDBD270];
    else
      v19 = 1;
    if ((objc_msgSend(v13, "containsObject:", v51, v5) & 1) != 0
      || objc_msgSend(v13, "containsObject:", v46))
    {
      v22 = 0;
      v23 = 1;
      v24 = 1024;
      v10 = 1024;
    }
    else
    {
      v23 = 0;
      v24 = 0;
      v22 = 1;
    }
    if ((objc_msgSend(v13, "containsObject:", v47) & 1) != 0
      || (objc_msgSend(v13, "containsObject:", v40) & 1) != 0
      || objc_msgSend(v13, "containsObject:", v43))
    {
      if (((v19 | objc_msgSend(v13, "containsObject:", v47)) & 1) != 0)
      {
        v24 |= 0x20uLL;
        if (v22)
        {
          v23 = 1;
          v10 = 32;
        }
      }
      else
      {
        if (v22)
        {
          v23 = 1;
          v10 = 1024;
        }
        v24 = 1056;
      }
    }
    if ((objc_msgSend(v13, "containsObject:", v50) & 1) != 0 || objc_msgSend(v13, "containsObject:", v44))
    {
      if (!v23)
        v10 = 512;
      v24 |= 0x200uLL;
      v23 = 1;
    }
    v25 = objc_msgSend(v13, "containsObject:", v49);
    v26 = v23 == 0;
    if (v25)
      v27 = 1;
    else
      v27 = v23;
    if (v25)
      v28 = v24 | 0x800;
    else
      v28 = v24;
    if ((v25 & v26) != 0)
      v29 = 2048;
    else
      v29 = v10;
    if ((objc_msgSend(v13, "containsObject:", v48) & 1) != 0
      || (objc_msgSend(v13, "containsObject:", v45) & 1) != 0
      || objc_msgSend(v13, "containsObject:", v42))
    {
      if (!v27)
        v29 = 8;
      v28 |= 8uLL;
      v27 = 1;
    }
    v5 = v40;
    v30 = 32;
    if (v29 == 1)
      v30 = 1075;
    if (v27)
      v10 = v28;
    else
      v10 = v30;
    if (v27)
      v20 = v29;
    else
      v20 = v30;

    v21 = v20;
    v4 = v47;
  }
  else
  {
    v20 = 16;
    v21 = v10;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("WPA_IE"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("WPA_IE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("IE_KEY_WPA_AUTHSELS"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "containsObject:", v4);
    if (v11)
      v35 = 1;
    else
      v35 = v34;
    if (v34)
      v10 = v10 & 0xFEE | 0x10;
    else
      v10 &= 0xFFEu;
    if (v34)
      v21 = v20;
    v6 = v48;
    if (objc_msgSend(v33, "containsObject:", v48))
    {
      if (!v35)
        v21 = 4;
      v10 |= 4uLL;
    }
    else
    {
      v36 = 16;
      if (v21 == 1)
        v36 = 1075;
      if (!v35)
      {
        v10 = v36;
        v21 = v36;
      }
    }
    a2 = v41;

  }
  else
  {
    a2 = v41;
    v6 = v48;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("WAPI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = v37;
    if ((objc_msgSend(v37, "intValue") & 8) != 0)
      v10 = 128;
    else
      v10 = 64;

    v21 = v10;
  }
  if (a2)
LABEL_87:
    *a2 = v10;
LABEL_88:

  return v21;
}

float WFScaleRSSI(uint64_t a1)
{
  float v1;
  float v2;

  v1 = (float)a1 + 77.5;
  v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

uint64_t WFDetermineNetworkCipherTypeObsolete(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("WPA_IE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("RSN_IE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (_WFNetworkUsesSecurityCiphers(v2, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"), CFSTR("IE_KEY_WPA_UCIPHERS"), &unk_24DC5DC30) & 1) != 0|| v3&& (_WFNetworkUsesSecurityCiphers(v3, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), CFSTR("IE_KEY_RSN_UCIPHERS"), &unk_24DC5DC48) & 1) != 0)
  {
    v4 = 1;
  }
  else if (v2
         && (_WFNetworkUsesSecurityCiphers(v2, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"), CFSTR("IE_KEY_WPA_UCIPHERS"), &unk_24DC5DC60) & 1) != 0|| v3&& _WFNetworkUsesSecurityCiphers(v3, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), CFSTR("IE_KEY_RSN_UCIPHERS"), &unk_24DC5DC78))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

CFStringRef WFConvertEthernetNetworkAddressToString(const __CFData *a1)
{
  const UInt8 *BytePtr;

  BytePtr = CFDataGetBytePtr(a1);
  return (id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%x:%x:%x:%x:%x:%x"), *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_219FCE5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FD031C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_219FD07B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef WFCopyProcessIdentifier()
{
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  CFStringRef v2;
  const __CFAllocator *v4;
  const char *v5;
  uint64_t v6;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle && (Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
  {
    v2 = Identifier;
    CFRetain(Identifier);
    return v2;
  }
  else
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v5 = getprogname();
    v6 = getpid();
    return CFStringCreateWithFormat(v4, 0, CFSTR("%s (%d)"), v5, v6);
  }
}

void sub_219FD26E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_219FD34E8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_219FD38A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FDA6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getW5ClientClass_block_invoke(uint64_t a1)
{
  WiFiVelocityLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getW5ClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getW5ClientClass_block_invoke_cold_1();
    WiFiVelocityLibrary();
  }
}

void WiFiVelocityLibrary()
{
  void *v0;

  if (!WiFiVelocityLibraryCore_frameworkLibrary)
    WiFiVelocityLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!WiFiVelocityLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

WFSaveSettingsOperation *__getW5LogItemRequestClass_block_invoke(uint64_t a1)
{
  WFSaveSettingsOperation *result;
  WFSaveSettingsOperation *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;

  WiFiVelocityLibrary();
  result = (WFSaveSettingsOperation *)objc_getClass("W5LogItemRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getW5LogItemRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (WFSaveSettingsOperation *)__getW5LogItemRequestClass_block_invoke_cold_1();
    return -[WFSaveSettingsOperation initWithSSID:interfaceName:settings:](v3, v4, v5, v6, v7);
  }
  return result;
}

void sub_219FDC234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _WiFiDeviceClientDiagnosticsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updateInfo:", a2);
}

void sub_219FDF960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FE031C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _WiFiDeviceClientAssociationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "_joinComplete:userInfo:network:", a4, a3, a2);
  }
  else
  {
    WFLogForCategory(5uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v11 = 136315394;
      v12 = "_WiFiDeviceClientAssociationCallback";
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: refcon is not of type WFEnterpriseJoinOperation %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

__CFString *stringForIpv6LinkLocalAddress(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  unint64_t v4;
  __CFString *v5;
  id v6;
  unsigned __int8 *v7;
  __CFString *v8;
  const __CFString *v9;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 16)
  {
    if ((unint64_t)objc_msgSend(v1, "length") >= 2)
    {
      v3 = 0;
      v4 = 0;
      v5 = &stru_24DC36C30;
      do
      {
        objc_msgSend(v1, "subdataWithRange:", v3, 2);
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x%02x"), *v7, v7[1]);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("0000")))
        {

          v8 = CFSTR("0");
        }
        if (v4 == ((unint64_t)objc_msgSend(v1, "length") >> 1) - 1)
          v9 = CFSTR("%@%@");
        else
          v9 = CFSTR("%@%@:");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v5, v8);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v4;
        v3 += 2;
        v5 = v2;
      }
      while (v4 < (unint64_t)objc_msgSend(v1, "length") >> 1);
    }
    else
    {
      v2 = &stru_24DC36C30;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void _WiFiManagerClientServerRestartedCallback(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "_WiFiManagerClientServerRestartedCallback";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: stateMonitor %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(v2, "_updateState");
}

void _WiFiManagerDeviceClientCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    v7 = 136315394;
    v8 = "_WiFiManagerDeviceClientCallback";
    v9 = 2112;
    v10 = a2;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s device is available %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v4, "_updateWithDeviceAttachment:", a2);
  objc_msgSend(v4, "_updateState");

}

void _WiFiDeviceClientPowerCallback(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "_WiFiDeviceClientPowerCallback";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: stateMonitor %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(v2, "_updateState");
}

void _WiFiDeviceLinkExtendedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "_WiFiDeviceLinkExtendedCallback";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: stateMonitor %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v3, "_updateState");
}

const __CFString *WFAssociationErrorCodeToString(unint64_t a1)
{
  if (a1 > 0x15)
    return CFSTR("Unknown Error");
  else
    return off_24DC34940[a1];
}

void sub_219FE7154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FE72C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_219FE745C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void sub_219FE79DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FE8968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FE8D54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_219FEA29C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x300], 8);
  _Unwind_Resume(a1);
}

void sub_219FED16C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_219FEE164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FEE6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FEEA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FEF0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FEF4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_219FEFDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FF0070(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_219FF05D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_219FF0A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_219FF21B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_219FF2920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FF3344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v30 - 168));
  objc_destroyWeak((id *)(v30 - 160));
  _Unwind_Resume(a1);
}

void sub_219FF4084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20,id a21)
{
  id *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v21);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_219FF4D54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_219FF556C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FF6A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_219FF72F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FF8800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FFA968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  id *v31;
  id *v32;
  id *v33;
  id *v34;
  id *v35;
  uint64_t v36;

  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(location);
  objc_destroyWeak(&a31);
  objc_destroyWeak((id *)(v36 - 168));
  _Unwind_Resume(a1);
}

void sub_219FFAB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FFB138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FFD418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id *a26,id *a27,uint64_t a28,id *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  id *v40;
  id *v41;
  id *v42;
  id *v43;
  id *v44;
  id *v45;
  id *v46;
  uint64_t v47;

  objc_destroyWeak(v43);
  objc_destroyWeak(v46);
  objc_destroyWeak(&location);
  objc_destroyWeak(v45);
  objc_destroyWeak(v41);
  objc_destroyWeak(v42);
  objc_destroyWeak(v44);
  objc_destroyWeak(v40);
  objc_destroyWeak(a10);
  objc_destroyWeak(a15);
  objc_destroyWeak(a11);
  objc_destroyWeak(a27);
  objc_destroyWeak(a12);
  objc_destroyWeak(a29);
  objc_destroyWeak(a13);
  objc_destroyWeak(a26);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x288]);
  objc_destroyWeak((id *)(v47 - 176));
  _Unwind_Resume(a1);
}

void sub_219FFE3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219FFE92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A0004B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_21A000ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_21A00124C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A0054D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A005CAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _WiFiDeviceHostAPStateChangedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_hostAPStateDidChange:", a2);
}

uint64_t _WiFiDeviceCarPlayNetworkTypeChangedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_carPlayNetworkTypeChangedCallback:", a2);
}

BOOL NetworkRefIsEqualToNetwork(const void *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  const void *v6;
  int v7;
  WFNetworkScanRecord *v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  int Type;
  void *v27;
  os_log_type_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(v3, "attributes");
    v6 = (const void *)WiFiNetworkCreate();
    v7 = CFEqual(v6, a1);
    v8 = -[WFNetworkScanRecord initWithNetworkRef:]([WFNetworkScanRecord alloc], "initWithNetworkRef:", a1);
    v9 = -[WFNetworkScanRecord isRandomMACAddressEnabled](v8, "isRandomMACAddressEnabled");
    v10 = v9 ^ objc_msgSend(v4, "isRandomMACAddressEnabled");
    if (v10 == 1)
    {
      WFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_219FC8000, v11, v12, "New network's random address enable status changed!", (uint8_t *)&v33, 2u);
      }

    }
    -[WFNetworkScanRecord randomMACAddress](v8, "randomMACAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      objc_msgSend(v4, "randomMACAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_18;
    }
    -[WFNetworkScanRecord randomMACAddress](v8, "randomMACAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "randomMACAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      WFLogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_219FC8000, v18, v19, "New network's random address changed!", (uint8_t *)&v33, 2u);
      }

      LOBYTE(v10) = 1;
    }
LABEL_18:
    -[WFNetworkScanRecord privateAddressConfig](v8, "privateAddressConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      objc_msgSend(v4, "privateAddressConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_22;
    }
    -[WFNetworkScanRecord privateAddressConfig](v8, "privateAddressConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateAddressConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) == 0)
    {
      WFLogForCategory(0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27)
      {
        v29 = v27;
        if (os_log_type_enabled(v29, v28))
        {
          objc_msgSend(v4, "privateAddressConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFNetworkScanRecord privateAddressConfig](v8, "privateAddressConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v30;
          v35 = 2112;
          v36 = v31;
          _os_log_impl(&dword_219FC8000, v29, v28, "new network private address config is not equal: %@ -> %@", (uint8_t *)&v33, 0x16u);

        }
      }

      goto LABEL_34;
    }
LABEL_22:
    if (v7)
      v25 = v10;
    else
      v25 = 1;
    if ((v25 & 1) == 0)
    {
      Type = WiFiNetworkGetType();
      v5 = WiFiNetworkGetType() == Type;
      if (!v6)
        goto LABEL_36;
      goto LABEL_35;
    }
LABEL_34:
    v5 = 0;
    if (!v6)
    {
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    CFRelease(v6);
    goto LABEL_36;
  }
LABEL_37:

  return v5;
}

void sub_21A008CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_21A00A01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, id location)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_21A00CEC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

uint64_t WiFiManagerGasQueryCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "_processGasResults:error:", a2, a3);
}

void sub_21A00DA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A00E5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A00EC38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_21A00EE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A00F114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A00F4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A00F9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A012044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A0143F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_21A01498C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21A014C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21A014FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_21A016CBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t WFWiFiNetworkRefIsEnterprise()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!WiFiNetworkGetProperty())
  {
    if (!WiFiNetworkGetProperty())
    {
      WiFiNetworkGetProperty();
      v10 = 0;
      goto LABEL_14;
    }
    v14 = v5;
    WiFiNetworkGetProperty();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("IE_KEY_WPA_AUTHSELS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v0) & 1) == 0)
    {
      v12 = v9;
      v13 = v1;
LABEL_17:
      v10 = objc_msgSend(v12, "containsObject:", v13) ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  v14 = v5;
  WiFiNetworkGetProperty();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("IE_KEY_RSN_AUTHSELS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v0) & 1) != 0
    || (objc_msgSend(v9, "containsObject:", v6) & 1) != 0
    || (objc_msgSend(v9, "containsObject:", v7) & 1) != 0)
  {
    goto LABEL_12;
  }
  if ((objc_msgSend(v9, "containsObject:", v1) & 1) == 0
    && (objc_msgSend(v9, "containsObject:", v2) & 1) == 0
    && (objc_msgSend(v9, "containsObject:", v3) & 1) == 0
    && (objc_msgSend(v9, "containsObject:", v4) & 1) == 0)
  {
    v12 = v9;
    v13 = v14;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_13:

  v5 = v14;
LABEL_14:

  return v10;
}

void sub_21A018EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A019160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A019514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A01AC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _WiFiManagerNotificationCallback(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6, void *a7)
{
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _BYTE *v18;
  int v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE *v23;
  int v24;
  _QWORD block[4];
  id v26;
  int v27;
  _BYTE buf[24];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a7;
  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "_WiFiManagerNotificationCallback";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    _os_log_impl(&dword_219FC8000, v12, v13, "%s: type %d, id %d", buf, 0x18u);
  }

  switch(a4)
  {
    case 3:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v29 = 0;
      if (a5)
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = WiFiNetworkCreateCopy();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = ___WiFiManagerNotificationCallback_block_invoke_3;
      v16[3] = &unk_24DC35A80;
      v19 = a3;
      v17 = v11;
      v18 = buf;
      dispatch_async(MEMORY[0x24BDAC9B8], v16);

      goto LABEL_18;
    case 2:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v29 = 0;
      if (a5)
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = WiFiNetworkCreateCopy();
      if (a6)
        v14 = (void *)objc_msgSend(a6, "copy");
      else
        v14 = 0;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = ___WiFiManagerNotificationCallback_block_invoke_2;
      v20[3] = &unk_24DC35A58;
      v24 = a3;
      v22 = v14;
      v23 = buf;
      v21 = v11;
      v15 = v14;
      dispatch_async(MEMORY[0x24BDAC9B8], v20);

LABEL_18:
      _Block_object_dispose(buf, 8);
      break;
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = ___WiFiManagerNotificationCallback_block_invoke;
      block[3] = &unk_24DC35A30;
      v26 = v11;
      v27 = a3;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      break;
  }

}

void sub_21A01AF54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void _WiFiManagerDeviceClientCallback_0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "_WiFiManagerDeviceClientCallback";
    v13 = 2112;
    v14 = a2;
    _os_log_impl(&dword_219FC8000, v5, v6, "%s device is available %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = ___WiFiManagerDeviceClientCallback_block_invoke;
  v8[3] = &unk_24DC348D0;
  v9 = v4;
  v10 = a2;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void _WiFiManagerClientManagedAppleIDCabllack(uint64_t a1, char a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ___WiFiManagerClientManagedAppleIDCabllack_block_invoke;
  v6[3] = &unk_24DC35940;
  v7 = v4;
  v8 = a2;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void sub_21A01BD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *__WFAssociationStateToString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24DC35AD0[a1];
}

__CFString *__WFAssociationOriginatorToString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24DC35AB8[a1];
}

void sub_21A0228E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *WFCaptiveEventToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Ended");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Started");
}

void sub_21A023EA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

const __CFString *WFWiFiStateMonitorStringForState(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Unknown");
  else
    return off_24DC35BB0[a1];
}

void sub_21A027CF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id getW5DiagnosticsTestRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getW5DiagnosticsTestRequestClass_softClass;
  v7 = getW5DiagnosticsTestRequestClass_softClass;
  if (!getW5DiagnosticsTestRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getW5DiagnosticsTestRequestClass_block_invoke;
    v3[3] = &unk_24DC34710;
    v3[4] = &v4;
    __getW5DiagnosticsTestRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21A027F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A028480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A028C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A0293B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getW5ClientClass_block_invoke_0(uint64_t a1)
{
  WiFiVelocityLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getW5ClientClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getW5ClientClass_block_invoke_cold_1();
    WiFiVelocityLibrary_0();
  }
}

void WiFiVelocityLibrary_0()
{
  void *v0;

  if (!WiFiVelocityLibraryCore_frameworkLibrary_0)
    WiFiVelocityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!WiFiVelocityLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getW5DiagnosticsTestRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  WFSetupViewProvider *v3;
  SEL v4;
  id v5;

  WiFiVelocityLibrary_0();
  result = objc_getClass("W5DiagnosticsTestRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getW5DiagnosticsTestRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (WFSetupViewProvider *)__getW5DiagnosticsTestRequestClass_block_invoke_cold_1();
    return (Class)-[WFSetupViewProvider credentialsViewControllerWithContext:](v3, v4, v5);
  }
  return result;
}

uint64_t WFSetExtraLoggingEnabled(uint64_t result)
{
  __extraLoggingEnabled = result;
  return result;
}

void sub_21A02CCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_WFScanningStateToString(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24DC35DC8[a1];
}

void sub_21A02E528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

id WFSplitChannelsBetweenBands(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  char v14;
  __int16 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "flags", (_QWORD)v21);
        v13 = v3;
        if ((v12 & 8) == 0)
        {
          v14 = objc_msgSend(v11, "flags");
          v13 = v4;
          if ((v14 & 0x10) == 0)
          {
            v15 = objc_msgSend(v11, "flags");
            v13 = v5;
            if ((v15 & 0x2000) == 0)
              continue;
          }
        }
        objc_msgSend(v13, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v17);

  objc_msgSend(v2, "addObject:", v3);
  if (objc_msgSend(v4, "count"))
  {
    v26 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortUsingDescriptors:", v18);

    objc_msgSend(v2, "addObject:", v4);
  }
  if (objc_msgSend(v5, "count", (_QWORD)v21))
  {
    v25 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingDescriptors:", v19);

    objc_msgSend(v2, "addObject:", v5);
  }

  return v2;
}

void sub_21A02F3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_21A030468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A0329CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A033F08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _WiFiDeviceClientAssociationCallback_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "_joinComplete:userInfo:network:", a4, a3, a2);
  }
  else
  {
    WFLogForCategory(5uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v11 = 136315394;
      v12 = "_WiFiDeviceClientAssociationCallback";
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: refcon is not of type WFJoinOperation %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void sub_21A035234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

const __CFString *WFPrivateAddressConfigDisableReasonToString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("unknown");
  else
    return *(&off_24DC35EA0 + a1);
}

uint64_t WFValidPasswordForSecurityMode(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v6);
  if ((unint64_t)(a1 - 4) <= 0x3C && ((1 << (a1 - 4)) & 0x1000000000000011) != 0
    || a1 == 520
    || a1 == 512)
  {
    v9 = v4 == 64 && v7 == 0x7FFFFFFFFFFFFFFFLL;
    v10 = (unint64_t)(v4 - 8) < 0x38 || v9;
  }
  else
  {
    v10 = v4 != 0;
  }

  return v10;
}

uint64_t WFSecurityModeRequiresPasswordOnly(unint64_t a1)
{
  uint64_t v1;

  v1 = (a1 >> 3) & 1;
  if (a1 == 64)
    LODWORD(v1) = 1;
  if (a1 == 512)
    LODWORD(v1) = 1;
  if (a1 == 256)
    LODWORD(v1) = 1;
  if (a1 == 4)
    LODWORD(v1) = 1;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

uint64_t WFSecurityModeIsEnterprise(uint64_t a1)
{
  _BOOL4 v1;

  v1 = a1 == 1024;
  if (a1 == 32)
    v1 = 1;
  return a1 == 16 || v1;
}

CFTypeRef WFCreateSecTrustFromCertificateChain(void *a1)
{
  id v1;
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  SecCertificateRef v10;
  SecCertificateRef v11;
  OSStatus v12;
  BOOL v13;
  CFTypeRef v14;
  CFTypeRef cf;

  v1 = a1;
  v2 = (void *)WFCreateSecTrustFromCertificateChain___eapLibraryPointer;
  if (!WFCreateSecTrustFromCertificateChain___eapLibraryPointer)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/EAP8021X.framework/EAP8021X", 1);
    WFCreateSecTrustFromCertificateChain___eapLibraryPointer = (uint64_t)v2;
  }
  if (v2)
    v3 = WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy == 0;
  else
    v3 = 0;
  if (v3)
    WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy = dlsym(v2, "EAPSecPolicyCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v1, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      v10 = SecCertificateCreateWithData(v9, (CFDataRef)objc_msgSend(v1, "objectAtIndex:", v8));
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v4, "addObject:", v10);
        CFRelease(v11);
      }
      cf = 0;
      if (WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy)
      {
        ((void (*)(CFTypeRef *))WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy)(&cf);
        if (cf)
        {
          objc_msgSend(v5, "addObject:");
          CFRelease(cf);
        }
      }
      ++v8;
    }
    while (v7 != v8);
  }
  if (objc_msgSend(v4, "count"))
  {
    cf = 0;
    v12 = SecTrustCreateWithCertificates(v4, v5, (SecTrustRef *)&cf);
    if (cf)
      v13 = v12 == 0;
    else
      v13 = 0;
    if (v13)
      v14 = cf;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id WFUserNameFromEnterpriseProfile(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("EAPClientConfiguration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("UserName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t WFWiFiSecurityModeFromOtherSecurityMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 0;
  else
    return qword_21A062C18[a1 - 1];
}

id WFWiFiLocalizedStringFromSecurityMode(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.WiFiKitUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = CFSTR("kWFLocSecurityWEPTitle");
  if (a1 <= 127)
  {
    if (a1 <= 15)
    {
      switch(a1)
      {
        case 1:
          goto LABEL_25;
        case 2:
          v4 = CFSTR("kWFLocSecurityDynamicWEPTitle");
          break;
        case 4:
          v4 = CFSTR("kWFLocSecurityWPAPersonalTitle");
          break;
        case 8:
          v4 = CFSTR("kWFLocSecurityWPA2PersonalTitle");
          break;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (a1 == 16)
    {
      v4 = CFSTR("kWFLocSecurityWPAEnterpriseTitle");
      goto LABEL_25;
    }
    if (a1 != 32)
    {
      if (a1 == 64)
      {
        v4 = CFSTR("kWFLocSecurityWAPITitle");
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_17:
    v4 = CFSTR("kWFLocSecurityWPA2EnterpriseTitle");
    goto LABEL_25;
  }
  if (a1 > 519)
  {
    if (a1 == 520)
    {
      v4 = CFSTR("kWFLocSecurityWPA2WPA3PersonalTitle");
      goto LABEL_25;
    }
    if (a1 == 1024)
    {
      v4 = CFSTR("kWFLocSecurityWPA3EnterpriseTitle");
      goto LABEL_25;
    }
    if (a1 != 1075)
      goto LABEL_24;
    goto LABEL_17;
  }
  if (a1 == 128)
  {
    v4 = CFSTR("kWFLocSecurityWAPIEnterpriseTitle");
    goto LABEL_25;
  }
  if (a1 != 256)
  {
    if (a1 == 512)
    {
      v4 = CFSTR("kWFLocSecurityWPA3PersonalTitle");
      goto LABEL_25;
    }
LABEL_24:
    v4 = CFSTR("kWFLocSecurityNoneTitle");
  }
LABEL_25:
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *WFStringFromWFSecurityMode(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (a1 <= 63)
  {
    v1 = 0;
    switch(a1)
    {
      case 0:
        v1 = CFSTR("Open");
        break;
      case 1:
        v1 = CFSTR("WEP");
        break;
      case 2:
        v1 = CFSTR("LEAP");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        return v1;
      case 4:
        v1 = CFSTR("WPA Personal");
        break;
      case 8:
        v1 = CFSTR("WPA2 Personal");
        break;
      default:
        v1 = CFSTR("WPA Enterprise");
        v9 = CFSTR("WPA2 Enterprise");
        if (a1 != 32)
          v9 = 0;
        if (a1 != 16)
          v1 = v9;
        break;
    }
  }
  else
  {
    v1 = CFSTR("Any EAP Encryption");
    v2 = CFSTR("OWE");
    if (a1 != 2048)
      v2 = 0;
    if (a1 != 1075)
      v1 = v2;
    v3 = CFSTR("WPA3 Transition");
    v4 = CFSTR("WPA3 Enterprise");
    if (a1 != 1024)
      v4 = 0;
    if (a1 != 520)
      v3 = v4;
    if (a1 <= 1074)
      v1 = v3;
    v5 = CFSTR("WEP 40_128");
    v6 = CFSTR("WPA3 Personal");
    if (a1 != 512)
      v6 = 0;
    if (a1 != 256)
      v5 = v6;
    v7 = CFSTR("WAPI Personal");
    v8 = CFSTR("WAPI Enterprise");
    if (a1 != 128)
      v8 = 0;
    if (a1 != 64)
      v7 = v8;
    if (a1 <= 255)
      v5 = v7;
    if (a1 <= 519)
      return v5;
  }
  return v1;
}

__CFString *WFStringFromWFSecurityModeExt(uint64_t a1)
{
  __int16 v1;
  __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (a1 > 127)
  {
    if (a1 > 1074)
    {
      if (a1 == 1075)
      {
        v2 = CFSTR("Any EAP Encryption");
        return v2;
      }
      if (a1 == 2048)
      {
        v2 = CFSTR("OWE");
        return v2;
      }
    }
    else
    {
      if (a1 == 128)
      {
        v2 = CFSTR("WAPI Enterprise");
        return v2;
      }
      if (a1 == 256)
      {
        v2 = CFSTR("WEP 40_128");
        return v2;
      }
    }
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v2 = v3;
    if ((v1 & 0x400) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR("'WPA3 Enterprise'"));
      if ((v1 & 0x20) == 0)
      {
LABEL_22:
        if ((v1 & 0x10) == 0)
          goto LABEL_23;
        goto LABEL_30;
      }
    }
    else if ((v1 & 0x20) == 0)
    {
      goto LABEL_22;
    }
    -[__CFString appendString:](v2, "appendString:", CFSTR("'WPA2 Enterprise'"));
    if ((v1 & 0x10) == 0)
    {
LABEL_23:
      if ((v1 & 0x200) == 0)
        goto LABEL_24;
      goto LABEL_31;
    }
LABEL_30:
    -[__CFString appendString:](v2, "appendString:", CFSTR("'WPA Enterprise'"));
    if ((v1 & 0x200) == 0)
    {
LABEL_24:
      if ((v1 & 8) == 0)
        goto LABEL_25;
      goto LABEL_32;
    }
LABEL_31:
    -[__CFString appendString:](v2, "appendString:", CFSTR("'WPA3 Personal'"));
    if ((v1 & 8) == 0)
    {
LABEL_25:
      if ((v1 & 4) == 0)
        return v2;
LABEL_26:
      -[__CFString appendString:](v2, "appendString:", CFSTR("'WPA Personal'"));
      return v2;
    }
LABEL_32:
    -[__CFString appendString:](v2, "appendString:", CFSTR("'WPA2 Personal'"));
    if ((v1 & 4) == 0)
      return v2;
    goto LABEL_26;
  }
  if (a1 > 1)
  {
    if (a1 == 2)
    {
      v2 = CFSTR("LEAP");
      return v2;
    }
    if (a1 == 64)
    {
      v2 = CFSTR("WAPI Personal");
      return v2;
    }
    goto LABEL_20;
  }
  if (!a1)
  {
    v2 = CFSTR("Open");
    return v2;
  }
  if (a1 != 1)
    goto LABEL_20;
  v2 = CFSTR("WEP");
  return v2;
}

uint64_t WFSSIDIsValid(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR(" ")) ^ 1;
  else
    v2 = 0;

  return v2;
}

id WFAllIdentities(OSStatus *a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  OSStatus v6;
  void *v7;
  CFTypeRef result;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  result = 0;
  v2 = (void *)*MEMORY[0x24BDE94D8];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDE8F50];
  keys[2] = *(void **)MEMORY[0x24BDE93B0];
  keys[3] = v3;
  keys[4] = *(void **)MEMORY[0x24BDE9538];
  v4 = (void *)*MEMORY[0x24BDBD270];
  values[0] = *(void **)MEMORY[0x24BDE9238];
  values[1] = v4;
  values[2] = *(void **)MEMORY[0x24BDE93B8];
  values[3] = CFSTR("com.apple.identities");
  values[4] = v4;
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if (v6 != -25300)
  {
    if (!v6)
    {
      v7 = (void *)result;
      if (!a1)
        return v7;
      goto LABEL_7;
    }
    NSLog(CFSTR("%s: status = %ld"), "WFAllIdentities", a1);
  }
  v7 = 0;
  if (a1)
LABEL_7:
    *a1 = v6;
  return v7;
}

uint64_t WFWAPIRootCertificateListCreate(CFTypeRef *a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  CFTypeRef result;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x24BDAC8D0];
  result = 0;
  v2 = (void *)*MEMORY[0x24BDE94D8];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v2;
  v3 = (void *)*MEMORY[0x24BDE9538];
  keys[2] = *(void **)MEMORY[0x24BDE93B0];
  keys[3] = v3;
  v4 = (void *)*MEMORY[0x24BDBD270];
  values[0] = *(void **)MEMORY[0x24BDE9228];
  values[1] = v4;
  values[2] = *(void **)MEMORY[0x24BDE93B8];
  values[3] = v4;
  v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
      NSLog(CFSTR("%s: status = %ld"), "WFWAPIRootCertificateListCreate", (int)v6);
    else
      *a1 = result;
  }
  return v6;
}

uint64_t WFWAPIIdentityListCreate(__CFArray **a1, __CFArray **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFAllocator *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  CFTypeID v10;
  CFIndex v11;
  __CFArray *Mutable;
  __CFArray *v13;
  const __CFData *ValueAtIndex;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFData *Value;
  const __CFData *v18;
  SecCertificateRef v19;
  SecCertificateRef v20;
  void *v21;
  CFDictionaryRef v22;
  CFPropertyListFormat format;
  CFErrorRef error;
  CFTypeRef result;
  void *v27[3];
  void *v28[2];
  const __CFString *v29;
  void *values[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *keys[7];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  result = 0;
  v4 = (void *)*MEMORY[0x24BDE9128];
  keys[0] = *(void **)MEMORY[0x24BDE9220];
  keys[1] = v4;
  v5 = (void *)*MEMORY[0x24BDE93B0];
  keys[2] = *(void **)MEMORY[0x24BDE94C8];
  keys[3] = v5;
  keys[4] = *(void **)MEMORY[0x24BDE9538];
  values[0] = *(void **)MEMORY[0x24BDE9230];
  values[1] = CFSTR("com.apple.managedconfiguration.wapi-identity");
  v6 = *MEMORY[0x24BDE93B8];
  v31 = *MEMORY[0x24BDBD270];
  v32 = v6;
  v33 = v31;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v9 = SecItemCopyMatching(v8, &result);
  CFRelease(v8);
  if ((_DWORD)v9 || !result)
  {
    if ((_DWORD)v9 == -25300)
      return v9;
LABEL_24:
    NSLog(CFSTR("%s: status = %ld"), "WFWAPIIdentityListCreate", (int)v9);
    return v9;
  }
  v10 = CFGetTypeID(result);
  if (v10 != CFArrayGetTypeID() || !CFArrayGetCount((CFArrayRef)result))
    goto LABEL_24;
  if (CFArrayGetCount((CFArrayRef)result) >= 1)
  {
    v11 = 0;
    Mutable = 0;
    v13 = 0;
    do
    {
      error = 0;
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)result, v11);
      if (ValueAtIndex)
      {
        format = kCFPropertyListXMLFormat_v1_0;
        v15 = (const __CFDictionary *)CFPropertyListCreateWithData(v7, ValueAtIndex, 0, &format, &error);
        if (v15)
        {
          v16 = v15;
          Value = (const __CFData *)CFDictionaryGetValue(v15, CFSTR("certData"));
          if (Value)
          {
            v18 = Value;
            v19 = SecCertificateCreateWithData(v7, Value);
            if (v19)
            {
              v20 = v19;
              if (!Mutable)
                Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x24BDBD690]);
              CFArrayAppendValue(Mutable, v20);
              if (!v13)
                v13 = CFArrayCreateMutable(v7, 0, MEMORY[0x24BDBD690]);
              *(_OWORD *)v28 = xmmword_24DC35EF0;
              v29 = CFSTR("certData");
              v21 = (void *)CFDictionaryGetValue(v16, CFSTR("pemData"));
              v27[0] = v20;
              v27[1] = v21;
              v27[2] = v18;
              v22 = CFDictionaryCreate(v7, (const void **)v28, (const void **)v27, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFArrayAppendValue(v13, v22);
              CFRelease(v22);
              CFRelease(v20);
            }
          }
          CFRelease(v16);
        }
        else
        {
          NSLog(CFSTR("%s: CFPropertyListCreateWithData(): %@"), "WFWAPIIdentityListCreate", error);
        }
      }
      ++v11;
    }
    while (CFArrayGetCount((CFArrayRef)result) > v11);
    if (!a1)
      goto LABEL_21;
    goto LABEL_20;
  }
  v13 = 0;
  Mutable = 0;
  if (a1)
LABEL_20:
    *a1 = Mutable;
LABEL_21:
  if (a2)
    *a2 = v13;
  return v9;
}

id WFGetCarNameFromCarPlayNetworkUUID(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BE15270]);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "vehicleNameForWiFiUUID:", v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return v4;
}

id WFBase64Encode(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v4 = v2 % 3;
  v3 = 4 * (v2 / 3);
  v5 = v3 + 4 * (v2 % 3 != 0);
  if (v5 < v2)
  {
    NSLog(CFSTR("%s: data is too large to encode"), "NSString *WFBase64Encode(NSData *__strong)");
LABEL_19:
    v19 = 0;
    goto LABEL_23;
  }
  v6 = v2;
  v7 = malloc_type_malloc(v3 + 4 * (v2 % 3 != 0), 0x301F9398uLL);
  if (!v7)
  {
    NSLog(CFSTR("%s: unable to allocate memory for length (%lu)"), "NSString *WFBase64Encode(NSData *__strong)", v5);
    goto LABEL_19;
  }
  v8 = v7;
  v9 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v1), "bytes");
  if (!v6)
    goto LABEL_22;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11 % 3;
    if (v11 % 3 == 2)
    {
      v14 = v10 + 1;
      v8[v10] = WFBase64Encode_DataEncodeTable[((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 6) & 0x3F];
      v13 = *v9 & 0x3F;
      v15 = 2;
    }
    else
    {
      if (v12 == 1)
      {
        v13 = ((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v12)
          goto LABEL_14;
        v13 = (unint64_t)*v9 >> 2;
      }
      v15 = 1;
      v14 = v10;
    }
    v10 += v15;
    v8[v14] = WFBase64Encode_DataEncodeTable[v13];
LABEL_14:
    ++v11;
    ++v9;
    --v6;
  }
  while (v6);
  if (v4 == 2)
  {
    v17 = WFBase64Encode_DataEncodeTable[4 * (*(v9 - 1) & 0xF)];
    v18 = 1;
    v16 = v10;
LABEL_21:
    v8[v16] = v17;
    v8[v10 + v18] = 61;
  }
  else if (v4 == 1)
  {
    v16 = v10 + 1;
    v8[v10] = WFBase64Encode_DataEncodeTable[16 * (*(v9 - 1) & 3)];
    v17 = 61;
    v18 = 2;
    goto LABEL_21;
  }
LABEL_22:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v8, v5, 1, 1);
LABEL_23:

  return v19;
}

id WFWAPICertificateBlobString(SecCertificateRef a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  CFTypeID v6;
  _BOOL4 v7;
  CFTypeID v8;
  CFDataRef v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SecCertificateRef certificateRef;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    certificateRef = 0;
    v6 = CFGetTypeID(a1);
    if (v6 == SecIdentityGetTypeID())
    {
      v7 = SecIdentityCopyCertificate(a1, &certificateRef) != 0;
      a1 = certificateRef;
      if (!certificateRef)
      {
LABEL_14:
        if (a1)
          CFRelease(a1);
        goto LABEL_16;
      }
    }
    else
    {
      v8 = CFGetTypeID(a1);
      if (v8 != SecCertificateGetTypeID())
      {
LABEL_16:
        v5 = 0;
        goto LABEL_17;
      }
      v7 = 0;
      certificateRef = a1;
    }
    if (v7)
      goto LABEL_14;
    v9 = SecCertificateCopyData(a1);
    WFBase64Encode(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    v13 = objc_msgSend(v10, "length");
    if (v13 >= 0x41)
    {
      v14 = v13 + 1;
      v15 = 64;
      do
      {
        objc_msgSend(v12, "insertString:atIndex:", CFSTR("\n"), v15);
        v15 += 65;
      }
      while (v15 < v14++);
    }
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    objc_msgSend(v12, "insertString:atIndex:", CFSTR("-----BEGIN ASU CERTIFICATE-----\n"), 0);
    objc_msgSend(v12, "appendString:", CFSTR("-----END ASU CERTIFICATE-----\n"));
    objc_msgSend(v12, "appendString:", v11);
    v17 = objc_msgSend(v12, "rangeOfString:options:", CFSTR("-----BEGIN CERTIFICATE-----"), 2);
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v18, CFSTR("-----BEGIN USER CERTIFICATE-----"));
    v19 = objc_msgSend(v12, "rangeOfString:options:", CFSTR("-----END CERTIFICATE-----"), 2);
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v19, v20, CFSTR("-----END USER CERTIFICATE-----"));
    v5 = v12;

  }
LABEL_17:

  return v5;
}

uint64_t WFIsValidIPv4Address(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "isValidIPv4Address") && objc_msgSend(v5, "isValidSubnetMask"))
    {
      if (objc_msgSend(v3, "hasPrefix:", CFSTR("169.254.")))
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("255.255.0.0")) ^ 1;
      else
        v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t WFIsValidIPv6Address(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v6[2];
  int v7;
  char buffer[46];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (__CFString *)v1;
  v6[0] = 0;
  v7 = 0;
  v6[1] = 0;
  if (!v1
    || (CFStringGetCString(v1, buffer, 46, 0x600u), inet_pton(30, buffer, v6) != 1)
    || LOBYTE(v6[0]) == 254 && (BYTE1(v6[0]) & 0xC0) == 0x80)
  {
    v4 = 0;
  }
  else
  {
    v3 = (BYTE1(v6[0]) & 0xF) != 2;
    if ((BYTE1(v6[0]) & 0xF0) == 0x30)
      v3 = 1;
    v4 = LOBYTE(v6[0]) != 255 || v3;
  }

  return v4;
}

uint64_t WFSecurityModeIsWPAPersonal(unint64_t a1)
{
  if (a1 == 4)
    return 1;
  else
    return (a1 >> 3) & 1;
}

uint64_t WFSecurityModeIsWPAEnterprise(uint64_t a1)
{
  _BOOL4 v1;

  v1 = a1 == 1024;
  if (a1 == 32)
    v1 = 1;
  return a1 == 16 || v1;
}

uint64_t WFSecurityModeIsEquivalentWPA(uint64_t a1, uint64_t a2)
{
  if ((a1 == 4 || (a1 & 8) != 0) && (a2 == 4 || (a2 & 8) != 0)
    || (a1 == 16 || a1 == 1024 || a1 == 32) && (a2 == 16 || a2 == 32 || a2 == 1024))
  {
    return 1;
  }
  else
  {
    return WFSecurityModeIsEquivalentEAPEncryption(a1, a2);
  }
}

uint64_t WFSecurityModeIsEquivalentEAPEncryption(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a1 == 1075)
  {
    result = 1;
    if (a2 > 1023)
    {
      if (a2 == 1024)
        return result;
    }
    else if (a2 == 16 || a2 == 32)
    {
      return result;
    }
    return 0;
  }
  if (a2 != 1075)
    return 0;
  result = 1;
  if (a1 != 16 && a1 != 32 && a1 != 1024)
    return 0;
  return result;
}

BOOL WFScanRecordArchiveToEnterprisePath(void *a1)
{
  uint64_t v1;
  const void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "attributes");
  v1 = WiFiNetworkCreate();
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  v3 = WiFiNetworkArchiveToPath() != 0;
  CFRelease(v2);
  return v3;
}

__CFString *WFSettingsURLPathForType(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24DC35F08[a1];
}

uint64_t _WFOpenSettingsPathWithPathType(unint64_t a1)
{
  __CFString *v1;

  if (a1 > 3)
    v1 = 0;
  else
    v1 = off_24DC35F08[a1];
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=WIFI&path=%@"), v1);
}

void WFOpenSettingsURLWithType(unint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  _WFOpenSettingsPathWithPathType(a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v1, 0);

}

BOOL WFSecurityModeExtIsWPAPersonal(__int16 a1)
{
  return (a1 & 0x20C) != 0;
}

BOOL WFSecurityModeExtIsWPAEnterprise(__int16 a1)
{
  return (a1 & 0x430) != 0;
}

uint64_t WFCompareSecurityModeExt(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 == a2)
    return 0;
  v3 = a1 & 0x430;
  if ((v3 != 0) != ((a2 & 0x430) != 0))
    goto LABEL_4;
  if ((a1 & 0x430) != 0)
  {
    if ((a1 & 0x20) != 0)
      v4 = 1;
    else
      v4 = -1;
    if ((a1 & 0x20) == (a2 & 0x20))
      v5 = 0;
    else
      v5 = v4;
    if ((a1 & 0x400) != 0)
      v6 = 1;
    else
      v6 = -1;
    if ((a1 & 0x400) == (a2 & 0x400))
      return v5;
    else
      return v6;
  }
  else
  {
    v3 = a1 & 0x20C;
    if ((v3 != 0) != ((a2 & 0x20C) != 0))
    {
LABEL_4:
      if (v3)
        return 1;
      else
        return -1;
    }
    v7 = a1 & 0x200;
    if ((a1 & 0x200 & (unsigned __int16)a2) == 0)
      goto LABEL_36;
    if ((a1 & 0xFFFFFFFFFFFFFDFFLL) == 0)
      return 1;
    if ((a2 & 0xFFFFFFFFFFFFFDFFLL) == 0)
    {
      return -1;
    }
    else
    {
LABEL_36:
      if (v7 == (a2 & 0x200))
      {
        v7 = a1 & 8;
        if (v7 == (a2 & 8))
        {
          if ((a1 & 8) != 0)
            return 0;
          v7 = a1 & 4;
          if (v7 == (a2 & 4))
          {
            v7 = a1 & 1;
            if (v7 == (a2 & 1))
              return 0;
          }
        }
      }
      if (v7)
        return 1;
      else
        return -1;
    }
  }
}

uint64_t WFIsSecurityModeMatch(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = (a2 & a1) != 0;
  if (a2 == 512)
    v2 = 0;
  if (a1 == 512)
    v2 = 0;
  return a1 == a2 || v2;
}

void WFErrorLogCurrentCallStackThread(void *a1, uint64_t a2)
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v14 = v3;
  if (v3)
    v4 = v3;
  else
    v4 = &stru_24DC36C30;
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      WFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v4;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_219FC8000, v12, v13, "%@%@", buf, 0x16u);
      }

      if (!(1 - a2 + v8 + v10))
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        v8 += v10;
        if (v7)
          goto LABEL_6;
        break;
      }
    }
  }

}

void _netServiceCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  os_log_type_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  id location;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "ipMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_initWeak(&location, v4);
    objc_msgSend(v4, "__wifiServiceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "setServiceID:", v6);

    WFLogForCategory(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        v11 = objc_loadWeakRetained(&location);
        objc_msgSend(v11, "serviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v19 = "void _netServiceCallback(SCDynamicStoreRef, CFArrayRef, void *)";
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_219FC8000, v10, v9, "%s- updating service ID %@", buf, 0x16u);

      }
    }

    v13 = objc_loadWeakRetained(&location);
    objc_msgSend(v13, "serviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "monitorNetworkServiceID:", v14);

    objc_destroyWeak(&location);
  }
  else
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v15, v16, "callback invoked after object deallocated", buf, 2u);
    }

  }
}

void sub_21A039308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __ipStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  id location;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "ipMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_initWeak(&location, v5);
    objc_msgSend(v5, "_postChangesNotification:", a2);

    objc_destroyWeak(&location);
  }
  else
  {
    WFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v7, v8, "callback invoked after object deallocated", buf, 2u);
    }

  }
}

void sub_21A0394F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A03AA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A03AFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A03B19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A03B380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A03EF8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A03F0BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A03F280(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A03F37C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A03F808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20,id a21)
{
  id *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_21A041E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A043564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_21A045060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 144));
  _Unwind_Resume(a1);
}

void sub_21A046EDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21A048B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A048C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A048F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _UserNotificationDidFinish(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  +[WFUserPromptOperation sharedMapTable](WFUserPromptOperation, "sharedMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_notification:didFinishWithResponse:", a1, a2);
}

uint64_t netrbInitIfnetTrafficDescriptor(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t value;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  unsigned __int8 v19;
  int v20;
  xpc_object_t v21;
  uint64_t v22;
  void *v23;
  const char *string_ptr;
  xpc_object_t v25;
  void *v26;
  const char *v27;
  char v28;
  xpc_object_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;

  if (!a1)
    goto LABEL_3;
  v4 = MEMORY[0x220738B88]();
  v5 = MEMORY[0x24BDACFA0];
  if (v4 != MEMORY[0x24BDACFA0])
    goto LABEL_3;
  value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam);
  if (!value)
    goto LABEL_3;
  v8 = value;
  if (MEMORY[0x220738B88]() != v5)
    goto LABEL_3;
  v34 = 0uLL;
  v33 = 0uLL;
  v9 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpVersion);
  v10 = MEMORY[0x24BDACFF8];
  if (v9 && (v11 = v9, MEMORY[0x220738B88]() == v10))
  {
    v19 = xpc_uint64_get_value(v11);
    v20 = v19;
    if (v19 != 4 && v19 != 96)
      goto LABEL_3;
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 1u;
      *(_BYTE *)(a2 + 9) = v19;
    }
    v21 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalIp);
    v22 = MEMORY[0x24BDACFF0];
    if (v21 && (v23 = v21, MEMORY[0x220738B88]() == v22))
    {
      string_ptr = xpc_string_get_string_ptr(v23);
      if (a2)
        *(_BYTE *)(a2 + 8) |= 4u;
    }
    else
    {
      NETRBInfoLog();
      string_ptr = 0;
    }
    v25 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemoteIp);
    if (v25 && (v26 = v25, MEMORY[0x220738B88]() == v22))
    {
      v27 = xpc_string_get_string_ptr(v26);
      if (a2)
        *(_BYTE *)(a2 + 8) |= 8u;
    }
    else
    {
      NETRBInfoLog();
      v27 = 0;
    }
    if (v20 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v34 + 12) != 1
        || v27 && inet_pton(2, v27, (char *)&v33 + 12) != 1)
      {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v34);
        *(_DWORD *)(a2 + 40) = HIDWORD(v33);
      }
    }
    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v34) != 1 || v27 && inet_pton(30, v27, &v33) != 1)
        goto LABEL_3;
      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v34;
        *(_OWORD *)(a2 + 28) = v33;
      }
    }
  }
  else
  {
    NETRBErrorLog();
  }
  v12 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpProtocol);
  if (v12 && (v13 = v12, MEMORY[0x220738B88]() == v10))
  {
    v28 = xpc_uint64_get_value(v13);
    if (v28 != 17 && v28 != 6)
      goto LABEL_3;
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 2u;
      *(_BYTE *)(a2 + 10) = v28;
    }
  }
  else
  {
    NETRBInfoLog();
  }
  v14 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalPort);
  if (v14)
  {
    v15 = v14;
    if (MEMORY[0x220738B88]() != v10)
      goto LABEL_3;
    v16 = xpc_uint64_get_value(v15);
    if (v16 - 0x10000 < 0xFFFFFFFFFFFF0001)
      goto LABEL_3;
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v16) >> 16;
    }
  }
  else
  {
    NETRBInfoLog();
  }
  v17 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemotePort);
  if (v17)
  {
    v18 = v17;
    if (MEMORY[0x220738B88]() != v10)
      goto LABEL_3;
    v32 = xpc_uint64_get_value(v18);
    if (v32 - 0x10000 < 0xFFFFFFFFFFFF0001)
      goto LABEL_3;
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v32) >> 16;
    }
  }
  else
  {
    NETRBErrorLog();
  }
  v30 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout);
  if (v30)
  {
    v31 = v30;
    if (MEMORY[0x220738B88]() != v10 || xpc_uint64_get_value(v31) >= 0x69781)
    {
LABEL_3:
      NETRBErrorLog();
      return 0;
    }
  }
  return 1;
}

_QWORD *_NETRBClientCreateInternal(NSObject *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  uint64_t Instance;
  NSObject *v10;
  int *v11;
  _QWORD block[10];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 2000;
  v7 = 0;
  if (!NETRBLogCreate())
  {
    if (__NETRBClientGetTypeID_pred != -1)
      dispatch_once(&__NETRBClientGetTypeID_pred, &__block_literal_global_11);
    Instance = _CFRuntimeCreateInstance();
    v7 = (_QWORD *)Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x218uLL);
      if (a1)
      {
        v7[2] = a1;
        dispatch_retain(a1);
        if (a2)
          v7[3] = _Block_copy(a2);
      }
      if (__NETRBClientGetQueue_predQueue != -1)
        dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
      v10 = __NETRBClientGetQueue___netrbQueue;
      if (!__NETRBClientGetQueue___netrbQueue)
        goto LABEL_19;
      if (__NETRBClientGetXpcQueue_predXpc != -1)
        dispatch_once(&__NETRBClientGetXpcQueue_predXpc, &__block_literal_global_177);
      if (__NETRBClientGetXpcQueue___netrbXpcQueue)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = ___NETRBClientCreateInternal_block_invoke;
        block[3] = &unk_24DC36240;
        block[6] = v7;
        block[7] = __NETRBClientGetXpcQueue___netrbXpcQueue;
        block[4] = &v17;
        block[5] = &v13;
        block[8] = v10;
        block[9] = a4;
        dispatch_sync(v10, block);
        if (*((_BYTE *)v18 + 24) && (v14[3] | 2) == 0x7D2)
          *((_BYTE *)v18 + 24) = 0;
      }
      else
      {
LABEL_19:
        NETRBErrorLog();
      }
      if (!*((_BYTE *)v18 + 24))
      {
        CFRelease(v7);
        v7 = 0;
      }
    }
    else
    {
      v11 = __error();
      strerror(*v11);
      NETRBErrorLog();
    }
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __NETRBClientRemoveFromList(const void *a1)
{
  CFIndex v2;

  if (__netrbClientList && CFArrayGetCount((CFArrayRef)__netrbClientList) >= 1)
  {
    v2 = 0;
    while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v2) != a1)
    {
      if (++v2 >= CFArrayGetCount((CFArrayRef)__netrbClientList))
        return;
    }
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)__netrbClientList, v2);
    if (!CFArrayGetCount((CFArrayRef)__netrbClientList))
    {
      NETRBXPCCleanup();
      NETRBEndPointCleanup();
      CFRelease((CFTypeRef)__netrbClientList);
      __netrbClientList = 0;
    }
  }
}

_QWORD *_NETRBClientCreate(NSObject *a1, const void *a2, uint64_t a3)
{
  return _NETRBClientCreateInternal(a1, a2, a3, 0);
}

uint64_t _NETRBClientDestroy(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 2000;
  if (!a1)
    goto LABEL_7;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientDestroy_block_invoke;
    block[3] = &unk_24DC36290;
    block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v10 + 24))
      *((_BYTE *)v10 + 24) = v6[3] == 2001;
  }
  else
  {
LABEL_7:
    NETRBErrorLog();
  }
  v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t __NETRBClientValidateClient(_BYTE *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;

  if (!a1)
    goto LABEL_9;
  if (!a1[288])
    return 22;
  if (!__netrbClientList || (Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) == 0 || (v3 = Count, Count < 1))
  {
LABEL_9:
    NETRBNoticeLog();
    return 22;
  }
  v4 = 0;
  while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v4) != a1)
  {
    if (v3 == ++v4)
      goto LABEL_9;
  }
  return 0;
}

uint64_t _NETRBClientStartService(uint64_t a1, char *__s1, int a3, int a4, void *a5)
{
  xpc_object_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t value;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  xpc_object_t v23;
  void *v24;
  xpc_object_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  xpc_object_t v29;
  void *v30;
  const char *string_ptr;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  xpc_object_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  xpc_object_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  xpc_object_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  xpc_object_t v48;
  void *v49;
  unsigned int v50;
  unsigned int v51;
  void *v52;
  xpc_object_t v53;
  void *v54;
  xpc_object_t v55;
  xpc_object_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  xpc_object_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  _QWORD block[9];
  int v65;
  int v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;

  v67 = 0;
  v68 = &v67;
  v69 = 0x2000000000;
  v70 = 0;
  if (!a1
    || (a3 - 205) <= 0xFFFFFFFA
    || (a4 - 304) <= 0xFFFFFFFB
    || __s1 && *__s1 && strncmp(__s1, (const char *)netrbClientAnyExternal, 0x10uLL) && !if_nametoindex(__s1)
    || (v10 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    goto LABEL_22;
  }
  v11 = v10;
  if (!a5)
    goto LABEL_18;
  v12 = MEMORY[0x220738B88](a5);
  v13 = MEMORY[0x24BDACFA0];
  if (v12 != MEMORY[0x24BDACFA0])
    goto LABEL_18;
  value = xpc_dictionary_get_value(a5, netrbClientDeviceType);
  if (!value)
    goto LABEL_18;
  v15 = value;
  v16 = MEMORY[0x220738B88]();
  v17 = MEMORY[0x24BDACFF8];
  if (v16 != MEMORY[0x24BDACFF8])
    goto LABEL_18;
  v18 = xpc_uint64_get_value(v15);
  if (v18 >= 7)
    goto LABEL_18;
  v22 = v18;
  xpc_dictionary_set_uint64(v11, netrbXPCDeviceType, v18);
  if (v22 != 1)
  {
    v25 = xpc_dictionary_get_value(a5, netrbClientInterfaceName);
    if (!v25)
      goto LABEL_18;
    v26 = v25;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
      goto LABEL_18;
    string_ptr = xpc_string_get_string_ptr(v26);
    if (!if_nametoindex(string_ptr))
      goto LABEL_18;
    v32 = netrbXPCInterfaceName;
    v33 = xpc_string_get_string_ptr(v26);
    xpc_dictionary_set_string(v11, v32, v33);
  }
  v23 = xpc_dictionary_get_value(a5, netrbClientInterfaceMTU);
  if (v23)
  {
    v24 = v23;
    if (MEMORY[0x220738B88]() != v17)
      goto LABEL_18;
    v27 = netrbXPCInterfaceMTU;
    v28 = xpc_uint64_get_value(v24);
    xpc_dictionary_set_uint64(v11, v27, v28);
  }
  v29 = xpc_dictionary_get_value(a5, netrbClientInterfaceInstance);
  if (v29)
  {
    v30 = v29;
    if (MEMORY[0x220738B88]() != v17)
      goto LABEL_18;
    v34 = netrbXPCInterfaceInstance;
    v35 = xpc_uint64_get_value(v30);
    xpc_dictionary_set_uint64(v11, v34, v35);
  }
  v36 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceStartAddress);
  if (v36)
  {
    v37 = v36;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
      goto LABEL_18;
    v38 = netrbXPCStartAddress;
    v39 = xpc_string_get_string_ptr(v37);
    xpc_dictionary_set_string(v11, v38, v39);
  }
  v40 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceEndAddress);
  if (v40)
  {
    v41 = v40;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
      goto LABEL_18;
    v42 = netrbXPCEndAddress;
    v43 = xpc_string_get_string_ptr(v41);
    xpc_dictionary_set_string(v11, v42, v43);
  }
  v44 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceNetworkMask);
  if (!v44)
    goto LABEL_46;
  v45 = v44;
  if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
  {
LABEL_18:
    NETRBErrorLog();
LABEL_19:
    v19 = v11;
LABEL_20:
    xpc_release(v19);
    goto LABEL_22;
  }
  v46 = netrbXPCNetworkMask;
  v47 = xpc_string_get_string_ptr(v45);
  xpc_dictionary_set_string(v11, v46, v47);
LABEL_46:
  v48 = xpc_dictionary_get_value(a5, (const char *)netrbClientNatType);
  if (!v48)
  {
    if (a3 != 201)
    {
      xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F5uLL);
LABEL_56:
      v52 = 0;
      goto LABEL_57;
    }
    xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F4uLL);
LABEL_51:
    if (!insert_nat66_params(a5, v11))
      goto LABEL_19;
    goto LABEL_56;
  }
  v49 = v48;
  if (MEMORY[0x220738B88]() != v17)
    goto LABEL_18;
  v50 = xpc_uint64_get_value(v49);
  v51 = v50;
  if (v50 - 503 <= 0xFFFFFFFC)
    goto LABEL_18;
  xpc_dictionary_set_uint64(v11, netrbXPCNatType, v50);
  if (v51 == 500)
    goto LABEL_51;
  if (v51 != 502)
    goto LABEL_56;
  v53 = xpc_dictionary_get_value(a5, (const char *)netrbClientNat64Param);
  if (!v53)
    goto LABEL_56;
  v54 = v53;
  if (MEMORY[0x220738B88]() != v13)
    goto LABEL_18;
  v55 = xpc_dictionary_create(0, 0, 0);
  if (!v55)
    goto LABEL_18;
  v52 = v55;
  v56 = xpc_dictionary_get_value(v54, (const char *)netrbClientDns64Prefix);
  if (v56)
  {
    v57 = v56;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
      goto LABEL_76;
    v58 = netrbXPCDns64Prefix;
    v59 = xpc_string_get_string_ptr(v57);
    xpc_dictionary_set_string(v52, v58, v59);
  }
  v60 = xpc_dictionary_get_value(v54, (const char *)netrbClientRaPrefix);
  if (v60)
  {
    v61 = v60;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFF0])
    {
LABEL_76:
      NETRBErrorLog();
      xpc_release(v11);
LABEL_63:
      v19 = v52;
      goto LABEL_20;
    }
    v62 = netrbXPCRaPrefix;
    v63 = xpc_string_get_string_ptr(v61);
    xpc_dictionary_set_string(v52, v62, v63);
  }
  xpc_dictionary_set_value(v11, netrbXPCNat64Param, v52);
LABEL_57:
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientStartService_block_invoke;
    block[3] = &unk_24DC362D8;
    block[4] = &v67;
    block[5] = a1;
    v65 = a3;
    v66 = a4;
    block[6] = v11;
    block[7] = __s1;
    block[8] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_release(v11);
  if (v52)
    goto LABEL_63;
LABEL_22:
  v20 = *((unsigned __int8 *)v68 + 24);
  _Block_object_dispose(&v67, 8);
  return v20;
}

uint64_t insert_nat66_params(void *a1, void *a2)
{
  xpc_object_t value;
  void *v4;
  const char *string;
  const char *v7;
  xpc_object_t v8;

  value = xpc_dictionary_get_value(a1, (const char *)netrbClientNat66Param);
  if (value)
  {
    v4 = value;
    if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFA0]
      || (string = xpc_dictionary_get_string(v4, (const char *)netrbClientRaPrefix)) == 0)
    {
      NETRBErrorLog();
      return 0;
    }
    v7 = string;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, netrbXPCRaPrefix, v7);
    xpc_dictionary_set_value(a2, netrbXPCNat66Param, v8);
  }
  return 1;
}

void __NETRBClientResponseHandler(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  xpc_object_t v8;
  xpc_object_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t uint64;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[7];
  int v18;

  NETRBInfoLog();
  if (__NETRBClientValidateClient((_BYTE *)a1) || !*(_QWORD *)(a1 + 16) || !*(_QWORD *)(a1 + 24))
    goto LABEL_6;
  if (!a3)
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
LABEL_12:
      v10 = (const char *)netrbClientNotificationKey;
      v11 = v8;
      v12 = 5003;
LABEL_13:
      xpc_dictionary_set_uint64(v11, v10, v12);
      goto LABEL_14;
    }
LABEL_15:
    NETRBErrorLog();
    goto LABEL_7;
  }
  if (xpc_dictionary_get_uint64(a3, netrbXPCResponse) == 2003)
  {
LABEL_6:
    NETRBDebugLog();
LABEL_7:
    CFRelease((CFTypeRef)a1);
    return;
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  if (!v9)
    goto LABEL_15;
  v8 = v9;
  if (xpc_dictionary_get_uint64(a3, netrbXPCResponse) == 2002)
    goto LABEL_12;
  uint64 = xpc_dictionary_get_uint64(a3, netrbXPCResponse);
  if (uint64 == 2001)
    v15 = 5002;
  else
    v15 = 5003;
  xpc_dictionary_set_uint64(v8, (const char *)netrbClientNotificationKey, v15);
  if (a2 != 1014 || uint64 != 2000)
  {
    if (a2 == 1014 && uint64 == 2001)
      notification_insert_keys(v8, a3);
    goto LABEL_14;
  }
  v16 = xpc_dictionary_get_uint64(a3, netrbXPCErrorCode);
  if (v16)
  {
    v12 = v16;
    v10 = (const char *)netrbClientErrorCode;
    v11 = v8;
    goto LABEL_13;
  }
LABEL_14:
  v13 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ____NETRBClientResponseHandler_block_invoke;
  block[3] = &__block_descriptor_tmp_194;
  v18 = a2;
  block[4] = a1;
  block[5] = a4;
  block[6] = v8;
  dispatch_async(v13, block);
}

uint64_t _NETRBClientStopService(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  if (!a1)
    goto LABEL_6;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientStopService_block_invoke;
    block[3] = &unk_24DC36320;
    block[4] = &v5;
    block[5] = a1;
    block[6] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }
  else
  {
LABEL_6:
    NETRBErrorLog();
  }
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t _NETRBClientGetDynamicStoreKey(uint64_t a1, char *a2)
{
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (!a1 || !a2)
    goto LABEL_8;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientGetDynamicStoreKey_block_invoke;
    v6[3] = &unk_24DC36348;
    v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v8 + 24))
      strcpy(a2, "com.apple.MobileInternetSharing");
  }
  else
  {
LABEL_8:
    NETRBErrorLog();
  }
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t _NETRBClientGetGlobalServiceState(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 2000;
  if (!a1 || !a2 || !a3)
    goto LABEL_9;
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    a1 = v7;
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetGlobalServiceState_block_invoke;
    block[3] = &unk_24DC36398;
    block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    block[7] = &v17;
    block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v14 + 24))
    {
      *((_BYTE *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetGlobalServiceState(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD block[7];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 2000;
  if (!a1 || (a2 - 1024) <= 0xFFFFFFFB)
    goto LABEL_10;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientSetGlobalServiceState_block_invoke;
    block[3] = &unk_24DC363E8;
    v7 = a2;
    block[4] = &v12;
    block[5] = &v8;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v13 + 24))
      *((_BYTE *)v13 + 24) = v9[3] == 2001;
  }
  else
  {
LABEL_10:
    NETRBErrorLog();
  }
  v4 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t _NETRBClientGetExtName(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 2000;
  if (!a1 || !a2)
    goto LABEL_8;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientGetExtName_block_invoke;
    v6[3] = &unk_24DC36438;
    v6[4] = &v11;
    v6[5] = &v7;
    v6[6] = a1;
    v6[7] = a2;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v12 + 24))
      *((_BYTE *)v12 + 24) = v8[3] == 2001;
  }
  else
  {
LABEL_8:
    NETRBErrorLog();
  }
  v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void *_NETRBClientCopyFixtureForwardedPorts(void *a1)
{
  void *v1;
  xpc_object_t v2;
  _QWORD block[9];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __int16 v20;

  v1 = a1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 2000;
  if (!a1)
  {
    NETRBErrorLog();
    goto LABEL_12;
  }
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (!__NETRBClientGetQueue___netrbQueue)
  {
    NETRBErrorLog();
LABEL_11:
    v1 = 0;
    goto LABEL_12;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___NETRBClientCopyFixtureForwardedPorts_block_invoke;
  block[3] = &unk_24DC36488;
  block[4] = &v9;
  block[5] = &v5;
  block[6] = &v17;
  block[7] = &v13;
  block[8] = v1;
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  if (!*((_BYTE *)v10 + 24) || v6[3] != 2001)
    goto LABEL_11;
  v2 = xpc_dictionary_create(0, 0, 0);
  v1 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, netrbClientForwardedLowPort, *((unsigned __int16 *)v18 + 12));
    xpc_dictionary_set_uint64(v1, netrbClientForwardedHighPort, *((unsigned __int16 *)v14 + 12));
  }
  else
  {
    NETRBErrorLog();
    *((_BYTE *)v10 + 24) = 0;
  }
LABEL_12:
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v1;
}

uint64_t _NETRBClientSetFixtureForwardedPorts(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 2000;
  if (!a1 || !a2 || MEMORY[0x220738B88](a2) != MEMORY[0x24BDACFA0])
    goto LABEL_4;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke;
    v6[3] = &unk_24DC364D8;
    v6[6] = a1;
    v6[7] = a2;
    v6[4] = &v11;
    v6[5] = &v7;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((_BYTE *)v12 + 24))
      *((_BYTE *)v12 + 24) = v8[3] == 2001;
  }
  else
  {
LABEL_4:
    NETRBErrorLog();
  }
  v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t _NETRBClientIsAllowedMoreHost(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 2000;
  if (!a1)
    goto LABEL_7;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientIsAllowedMoreHost_block_invoke;
    block[3] = &unk_24DC36528;
    block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v10 + 24))
      *((_BYTE *)v10 + 24) = v6[3] == 2001;
  }
  else
  {
LABEL_7:
    NETRBErrorLog();
  }
  v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t _NETRBClientAddHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    v6 = _NETRBClientAddHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

uint64_t _NETRBClientAddHostExt(uint64_t a1, void *a2)
{
  uint64_t v4;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  xpc_object_t v11;
  void *v12;
  uint64_t value;
  uint64_t v14;
  _QWORD block[8];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 2000;
  if (a2
    && MEMORY[0x220738B88](a2) == MEMORY[0x24BDACFA0]
    && (v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0
    && (v7 = v6, v8 = MEMORY[0x220738B88](), v9 = MEMORY[0x24BDACFF8], v8 == MEMORY[0x24BDACFF8])
    && (v10 = xpc_uint64_get_value(v7),
        (v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0)
    && (v12 = v11, MEMORY[0x220738B88]() == v9))
  {
    value = xpc_uint64_get_value(v12);
    if (!a1 || (v10 - 7) <= 0xFFFFFFFA)
      goto LABEL_20;
    v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1)
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___NETRBClientAddHostExt_block_invoke;
      block[3] = &unk_24DC36578;
      v16 = v10;
      block[6] = a1;
      block[7] = v14;
      block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((_BYTE *)v22 + 24))
        *((_BYTE *)v22 + 24) = v18[3] == 2001;
    }
    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }
  else
  {
    NETRBErrorLog();
    *((_BYTE *)v22 + 24) = 0;
  }
  v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHostExt(uint64_t a1, void *a2)
{
  uint64_t v4;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  xpc_object_t v11;
  void *v12;
  uint64_t value;
  uint64_t v14;
  _QWORD block[8];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 2000;
  if (a2
    && MEMORY[0x220738B88](a2) == MEMORY[0x24BDACFA0]
    && (v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0
    && (v7 = v6, v8 = MEMORY[0x220738B88](), v9 = MEMORY[0x24BDACFF8], v8 == MEMORY[0x24BDACFF8])
    && (v10 = xpc_uint64_get_value(v7),
        (v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0)
    && (v12 = v11, MEMORY[0x220738B88]() == v9))
  {
    value = xpc_uint64_get_value(v12);
    if (!a1 || (v10 - 7) <= 0xFFFFFFFA)
      goto LABEL_20;
    v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1)
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___NETRBClientRemoveHostExt_block_invoke;
      block[3] = &unk_24DC365C8;
      v16 = v10;
      block[6] = a1;
      block[7] = v14;
      block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((_BYTE *)v22 + 24))
        *((_BYTE *)v22 + 24) = v18[3] == 2001;
    }
    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }
  else
  {
    NETRBErrorLog();
    *((_BYTE *)v22 + 24) = 0;
  }
  v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    v6 = _NETRBClientRemoveHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

uint64_t _NETRBClientGetHostCount(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v5;
  uint64_t v7;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 2000;
  if (!a1 || !a2 || !a3)
    goto LABEL_9;
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
    a1 = v7;
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetHostCount_block_invoke;
    block[3] = &unk_24DC36618;
    block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    block[7] = &v17;
    block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v14 + 24))
    {
      *((_BYTE *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetHostCount(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  _QWORD block[7];
  int v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 2000;
  if (!a1 || (a2 - 7) <= 0xFFFFFFFA)
    goto LABEL_10;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientSetHostCount_block_invoke;
    block[3] = &unk_24DC36668;
    v9 = a2;
    v10 = a3;
    block[4] = &v15;
    block[5] = &v11;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((_BYTE *)v16 + 24))
      *((_BYTE *)v16 + 24) = v12[3] == 2001;
  }
  else
  {
LABEL_10:
    NETRBErrorLog();
  }
  v6 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t _NETRBClientNewInterface(uint64_t a1, int a2, uint64_t a3, xpc_object_t xdict)
{
  const char *string;
  int uint64;
  NSObject *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  char v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  const unsigned __int8 *uuid;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  NSObject *v35;
  _QWORD block[10];
  int v37;
  int v38;
  char v39;
  BOOL v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = 0;
  if (!a1)
    goto LABEL_40;
  if (xdict)
    string = xpc_dictionary_get_string(xdict, (const char *)netrbClientExternalInterface);
  else
    string = 0;
  if ((a2 - 201) >= 3)
  {
    if (a2 != 204 || !string || !*string)
      goto LABEL_40;
  }
  else
  {
    if (string)
      goto LABEL_40;
    if (xdict)
    {
      uint64 = xpc_dictionary_get_uint64(xdict, netrbClientInterfaceMTU);
      goto LABEL_17;
    }
  }
  uint64 = 0;
LABEL_17:
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  v10 = __NETRBClientGetQueue___netrbQueue;
  if (!__NETRBClientGetQueue___netrbQueue)
    goto LABEL_40;
  v45[3] = (uint64_t)xpc_dictionary_create(0, 0, 0);
  if (xdict)
  {
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientAllocateMACAddress))
      v33 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientAllocateMACAddress);
    else
      v33 = 1;
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableTSO))
      v32 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableTSO);
    else
      v32 = 0;
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableIsolation))
      v31 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableIsolation);
    else
      v31 = 0;
    v35 = v10;
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableChecksumOffload))
      v30 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableChecksumOffload);
    else
      v30 = 0;
    v34 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableMACNAT);
    v16 = (void *)v45[3];
    v17 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceStartAddress);
    v18 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceEndAddress);
    v19 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    if (v17 && v18 && (v20 = v19) != 0)
    {
      xpc_dictionary_set_string(v16, netrbXPCStartAddress, v17);
      xpc_dictionary_set_string(v16, netrbXPCEndAddress, v18);
      xpc_dictionary_set_string(v16, netrbXPCNetworkMask, v20);
    }
    else if ((unint64_t)v17 | (unint64_t)v18)
    {
      goto LABEL_40;
    }
    if (!insert_nat66_params(xdict, (void *)v45[3]))
      goto LABEL_41;
    v24 = (void *)v45[3];
    uuid = xpc_dictionary_get_uuid(xdict, (const char *)netrbClientNetworkIdentifier);
    if (!uuid)
      goto LABEL_52;
    xpc_dictionary_set_uuid(v24, netrbXPCNetworkIdentifier, uuid);
    v26 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv4Address);
    v27 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    v28 = v27;
    if (v26 && v27)
    {
      xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv4Address, v26);
      xpc_dictionary_set_string(v24, netrbXPCNetworkMask, v28);
      goto LABEL_50;
    }
    if (!((unint64_t)v26 | (unint64_t)v27))
    {
LABEL_50:
      v29 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv6Address);
      if (v29)
        xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv6Address, v29);
LABEL_52:
      v10 = v35;
      v13 = v32;
      v15 = v33;
      v11 = v30;
      v12 = v31;
      v14 = v34;
      goto LABEL_53;
    }
LABEL_40:
    NETRBErrorLog();
    goto LABEL_41;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 1;
LABEL_53:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___NETRBClientNewInterface_block_invoke;
  block[3] = &unk_24DC366B0;
  v39 = v15;
  block[6] = a1;
  block[7] = a3;
  v40 = v13;
  v41 = v14;
  v42 = v12;
  v43 = v11;
  v37 = a2;
  v38 = uint64;
  block[4] = &v44;
  block[5] = &v48;
  block[8] = string;
  block[9] = v10;
  dispatch_sync(v10, block);
LABEL_41:
  v21 = (void *)v45[3];
  if (v21)
    xpc_release(v21);
  v22 = *((unsigned __int8 *)v49 + 24);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v22;
}

uint64_t _NETRBClientAddIPPortForwardingRule(CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  char v10;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[9];
  __int16 v18;
  __int16 v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  if (!cf)
    goto LABEL_9;
  v10 = a4;
  if (a4 != 2 && a4 != 30)
    goto LABEL_9;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  v14 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke;
    block[3] = &unk_24DC36728;
    v20 = a2;
    v18 = a3;
    v21 = v10;
    block[6] = cf;
    block[7] = a5;
    v19 = a6;
    block[4] = a7;
    block[5] = &v22;
    block[8] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v14, block);
    if (!*((_BYTE *)v23 + 24))
      CFRelease(cf);
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  v15 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void *netrbMakePortForwardingRuleDict(unsigned int a1, unsigned int a2, unsigned int a3, void *a4, unsigned int a5)
{
  void *v10;
  xpc_object_t v12;
  char string[46];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 != 30 && a3 != 2 || !a4 && a5 || a4 && !a5 || a4 && !inet_ntop(a3, a4, string, 0x2Eu))
    return 0;
  v12 = xpc_dictionary_create(0, 0, 0);
  v10 = v12;
  if (a1)
    xpc_dictionary_set_uint64(v12, netrbXPCPortForwardingRuleProtocol, a1);
  if (a2)
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleExternalPort, a2);
  xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleAddressFamily, a3);
  if (a5)
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleInternalPort, a5);
  if (a4)
    xpc_dictionary_set_string(v10, netrbXPCPortForwardingRuleInternalAddress, string);
  return v10;
}

uint64_t _NETRBClientRemoveIPPortForwardingRule(CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5)
{
  char v6;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[8];
  __int16 v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  if (!cf)
    goto LABEL_9;
  v6 = a4;
  if (a4 != 2 && a4 != 30)
    goto LABEL_9;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  v10 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke;
    block[3] = &unk_24DC367A0;
    v15 = a2;
    v14 = a3;
    v16 = v6;
    block[4] = a5;
    block[5] = &v17;
    block[6] = cf;
    block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v10, block);
    if (!*((_BYTE *)v18 + 24))
      CFRelease(cf);
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  v11 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t _NETRBClientGetIPPortForwardingRules(CFTypeRef cf, int a2, uint64_t a3)
{
  char v4;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[8];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  if (!cf)
    goto LABEL_9;
  v4 = a2;
  if (a2 != 2 && a2 != 30)
    goto LABEL_9;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  v6 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke;
    block[3] = &unk_24DC36818;
    v10 = v4;
    block[4] = a3;
    block[5] = &v11;
    block[6] = cf;
    block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v6, block);
    if (!*((_BYTE *)v12 + 24))
      CFRelease(cf);
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

const char *_NETRBIPPortForwardingDictGetDetails(xpc_object_t xdict, _BYTE *a2, _WORD *a3, int a4, void *a5, _WORD *a6)
{
  char uint64;
  __int16 v13;
  __int16 v14;
  const char *result;

  if (!xdict || a4 != 2 && a4 != 30)
    goto LABEL_10;
  uint64 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleProtocol);
  *a2 = uint64;
  if (!uint64)
    return 0;
  v13 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleExternalPort);
  *a3 = v13;
  if (!v13)
    return 0;
  v14 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleInternalPort);
  *a6 = v14;
  if (!v14)
    return 0;
  if (xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleAddressFamily) != a4)
  {
LABEL_10:
    NETRBErrorLog();
    return 0;
  }
  result = xpc_dictionary_get_string(xdict, netrbXPCPortForwardingRuleInternalAddress);
  if (result)
    return (const char *)(inet_pton(a4, result, a5) != 0);
  return result;
}

uint64_t NETRBClientSendNotification(void *a1)
{
  CFIndex Count;
  uint64_t v3;
  xpc_object_t v4;
  void *v5;
  const char *v6;
  uint64_t uint64;
  CFIndex v8;
  uint64_t v9;
  _QWORD *ValueAtIndex;
  _QWORD *v11;
  NSObject *v12;
  _QWORD v14[6];

  if (__netrbClientList
    && (Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) != 0
    && (v3 = Count, (v4 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    v5 = v4;
    v6 = (const char *)netrbClientNotificationKey;
    uint64 = xpc_dictionary_get_uint64(a1, netrbXPCNotification);
    xpc_dictionary_set_uint64(v5, v6, uint64);
    if (v3 >= 1)
    {
      v8 = 0;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v8);
        if (ValueAtIndex)
        {
          v11 = ValueAtIndex;
          if (ValueAtIndex[2])
          {
            if (ValueAtIndex[3])
            {
              xpc_retain(v5);
              CFRetain(v11);
              v12 = v11[2];
              v14[0] = v9;
              v14[1] = 0x40000000;
              v14[2] = __NETRBClientSendNotification_block_invoke;
              v14[3] = &__block_descriptor_tmp_169;
              v14[4] = v11;
              v14[5] = v5;
              dispatch_async(v12, v14);
            }
          }
        }
        ++v8;
      }
      while (v3 != v8);
    }
    xpc_release(v5);
    return 1;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

uint64_t _NETRBClientAddLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 0);
}

uint64_t _NETRBClientModifyLowLatencyFlow(uint64_t a1, void *a2, char a3)
{
  char inited;
  uint64_t v7;
  _QWORD v9[7];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  inited = netrbInitIfnetTrafficDescriptor(a2, 0);
  *((_BYTE *)v12 + 24) = inited;
  if ((inited & 1) == 0)
    goto LABEL_6;
  if (__NETRBClientGetQueue_predQueue != -1)
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_174);
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke;
    v9[3] = &unk_24DC36A18;
    v9[4] = &v11;
    v9[5] = a1;
    v9[6] = a2;
    v10 = a3;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v9);
  }
  else
  {
LABEL_6:
    NETRBErrorLog();
  }
  v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t _NETRBClientRemoveLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 1);
}

uint64_t __NETRBClientRelease(uint64_t a1)
{
  const void *v2;
  NSObject *v3;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    _Block_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(NSObject **)(a1 + 16);
  if (v3)
  {
    dispatch_release(v3);
    *(_QWORD *)(a1 + 16) = 0;
  }
  return NETRBInfoLog();
}

void notification_insert_keys(void *a1, xpc_object_t xdict)
{
  const char *string;
  const uint8_t *uuid;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  BOOL v10;
  const char *v12;
  xpc_object_t value;
  xpc_object_t v14;
  unsigned __int8 v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(xdict, netrbXPCMACAddress);
  if (string)
    xpc_dictionary_set_string(a1, (const char *)netrbClientMACAddress, string);
  *(_OWORD *)v15 = 0uLL;
  uuid = xpc_dictionary_get_uuid(xdict, netrbXPCMACUUID);
  if (uuid)
  {
    *(_OWORD *)v15 = *(_OWORD *)uuid;
    xpc_dictionary_set_uuid(a1, (const char *)netrbClientMACUUID, v15);
  }
  v6 = xpc_dictionary_dup_fd(xdict, netrbXPCInterfaceSocket);
  if (v6 != -1)
    xpc_dictionary_set_uint64(a1, (const char *)netrbClientSocketFD, v6);
  v7 = xpc_dictionary_get_string(xdict, netrbXPCStartAddress);
  v8 = xpc_dictionary_get_string(xdict, netrbXPCEndAddress);
  v9 = xpc_dictionary_get_string(xdict, netrbXPCNetworkMask);
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10 && v9 != 0)
  {
    v12 = v9;
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceStartAddress, v7);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceEndAddress, v8);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceNetworkMask, v12);
  }
  value = xpc_dictionary_get_value(xdict, netrbXPCInterfaceMTU);
  if (value)
    xpc_dictionary_set_value(a1, netrbClientInterfaceMTU, value);
  v14 = xpc_dictionary_get_value(xdict, netrbXPCNat66Param);
  if (v14)
    xpc_dictionary_set_value(a1, (const char *)netrbClientNat66Param, v14);
}

uint64_t NETRBLogCreate()
{
  if (NETRBLogCreate_predLog != -1)
    dispatch_once(&NETRBLogCreate_predLog, &__block_literal_global_12);
  if (NETRBLogCreate_error)
    return 12;
  else
    return 0;
}

uint64_t NETRBErrorLog()
{
  return os_log_with_args();
}

uint64_t NETRBNoticeLog()
{
  return os_log_with_args();
}

uint64_t NETRBInfoLog()
{
  return os_log_with_args();
}

uint64_t NETRBDebugLog()
{
  return os_log_with_args();
}

uint64_t NETRBXPCEndPointCreate(dispatch_queue_t targetq)
{
  xpc_connection_t v2;
  _xpc_connection_s *v3;
  _QWORD handler[6];

  if (__netrbReceiverConnection)
  {
    NETRBDebugLog();
  }
  else
  {
    v2 = xpc_connection_create(0, targetq);
    __netrbReceiverConnection = (uint64_t)v2;
    if (!v2)
    {
      NETRBErrorLog();
      return 0;
    }
    v3 = v2;
    NETRBInfoLog();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __NETRBXPCEndPointCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_61;
    handler[4] = v3;
    handler[5] = targetq;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume((xpc_connection_t)__netrbReceiverConnection);
  }
  return 1;
}

BOOL NETRBXPCCreate(dispatch_queue_t targetq, uint64_t a2)
{
  _BOOL8 result;
  _QWORD handler[6];

  if (__netrbConnection)
  {
    NETRBDebugLog();
    return 1;
  }
  __netrbConnection = (uint64_t)xpc_connection_create_mach_service((const char *)netrbXPCService, targetq, 2uLL);
  if (!__netrbConnection)
    goto LABEL_7;
  if (MEMORY[0x220738B88]() != MEMORY[0x24BDACF88])
  {
    if (__netrbConnection)
    {
      xpc_release((xpc_object_t)__netrbConnection);
LABEL_8:
      result = 0;
      __netrbConnection = 0;
      return result;
    }
LABEL_7:
    NETRBErrorLog();
    goto LABEL_8;
  }
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __NETRBXPCCreate_block_invoke;
  handler[3] = &__block_descriptor_tmp_66;
  handler[4] = __netrbConnection;
  handler[5] = a2;
  xpc_connection_set_event_handler((xpc_connection_t)__netrbConnection, handler);
  NETRBInfoLog();
  xpc_connection_resume((xpc_connection_t)__netrbConnection);
  return __netrbConnection != 0;
}

BOOL NETRBXPCCleanup()
{
  uint64_t v0;

  v0 = __netrbConnection;
  if (__netrbConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbConnection);
    xpc_release((xpc_object_t)__netrbConnection);
    __netrbConnection = 0;
  }
  return v0 != 0;
}

BOOL NETRBXPCSetupAndSend(NSObject *a1, xpc_object_t xdict, uint64_t a3)
{
  _BOOL8 v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD handler[5];

  if (xpc_dictionary_get_uint64(xdict, netrbXPCKey) == 1000)
  {
    if (!__netrbReceiverConnection)
      return 0;
    xpc_dictionary_set_connection(xdict, (const char *)netrbXPCClientComm, (xpc_connection_t)__netrbReceiverConnection);
  }
  if (a1)
  {
    v6 = __netrbConnection != 0;
    if (__netrbConnection)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ____NETRBXPCSendMessage_block_invoke;
      handler[3] = &unk_24DC36B70;
      handler[4] = a3;
      xpc_connection_send_message_with_reply((xpc_connection_t)__netrbConnection, xdict, a1, handler);
    }
    else
    {
      NETRBDebugLog();
    }
    return v6;
  }
  if (!__netrbConnection)
  {
    NETRBDebugLog();
    return 0;
  }
  v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)__netrbConnection, xdict);
  v8 = v7;
  v9 = MEMORY[0x24BDACFA0];
  if (v7)
  {
    v10 = MEMORY[0x220738B88](v7);
    if (v10 != MEMORY[0x24BDACFB8])
    {
      v11 = v10;
      if (v10 == v9)
      {
        if (xpc_dictionary_get_uint64(v8, netrbXPCResponse) == 2002)
        {
          NETRBErrorLog();
          NETRBXPCCleanup();
        }
        v11 = MEMORY[0x24BDACFA0];
      }
      else
      {
        NETRBErrorLog();
        NETRBXPCCleanup();
      }
      goto LABEL_18;
    }
    xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x24BDACF40]);
    NETRBErrorLog();
    NETRBXPCCleanup();
  }
  else
  {
    NETRBXPCCleanup();
    NETRBErrorLog();
  }
  v11 = MEMORY[0x24BDACFB8];
LABEL_18:
  if (v11 == v9)
    v12 = v8;
  else
    v12 = 0;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v12);
  if (v8)
    xpc_release(v8);
  return 1;
}

BOOL NETRBEndPointCleanup()
{
  uint64_t v0;

  v0 = __netrbReceiverConnection;
  if (__netrbReceiverConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbReceiverConnection);
    xpc_release((xpc_object_t)__netrbReceiverConnection);
    __netrbReceiverConnection = 0;
  }
  return v0 != 0;
}

uint64_t _MISAttach(_QWORD *a1)
{
  NSObject *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;

  if (!a1)
    return 22;
  if (__MISDGetQueue_predQueue != -1)
    dispatch_once(&__MISDGetQueue_predQueue, &__block_literal_global_4);
  v2 = __MISDGetQueue___misdQueue;
  if (!__MISDGetQueue___misdQueue)
    return 12;
  *a1 = 0;
  v3 = _NETRBClientCreate(v2, &__block_literal_global_13, 0);
  if (!v3)
    return 12;
  v4 = v3;
  result = 0;
  *a1 = v4;
  return result;
}

uint64_t _MISDetach(uint64_t a1)
{
  uint64_t v1;

  v1 = 22;
  if (a1)
  {
    if (_NETRBClientDestroy(a1))
      return 0;
    else
      return 22;
  }
  return v1;
}

uint64_t _MISIsServiceAvailable(uint64_t result)
{
  uint64_t v1;
  int GlobalServiceState;
  void *v3;
  int started;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v5 = 0;
    GlobalServiceState = _NETRBClientGetGlobalServiceState(result, (_DWORD *)&v5 + 1, &v5);
    result = 0;
    if (GlobalServiceState)
    {
      if (HIDWORD(v5) == 1022)
        return 0;
      if (HIDWORD(v5) == 1023)
        return 1;
      result = (uint64_t)xpc_dictionary_create(0, 0, 0);
      if (result)
      {
        v3 = (void *)result;
        xpc_dictionary_set_uint64((xpc_object_t)result, netrbClientDeviceType, 1uLL);
        started = _NETRBClientStartService(v1, 0, 201, 301, v3);
        xpc_release(v3);
        if (started)
        {
          result = _NETRBClientGetGlobalServiceState(v1, (_DWORD *)&v5 + 1, &v5);
          if ((_DWORD)result)
            return HIDWORD(v5) == 1023;
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t _MISGetGlobalServiceState(uint64_t a1, _DWORD *a2, int *a3)
{
  uint64_t v3;
  int v5;

  v5 = 0;
  v3 = 22;
  if (a1)
  {
    if (!a3)
      a3 = &v5;
    if (_NETRBClientGetGlobalServiceState(a1, a2, a3))
      return 0;
    else
      return 22;
  }
  return v3;
}

uint64_t _MISGetDynamicStoreKey(uint64_t a1, char *a2)
{
  _OWORD v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  memset(v4, 0, sizeof(v4));
  if (!_NETRBClientGetDynamicStoreKey(a1, (char *)v4))
    return 22;
  snprintf(a2, 0x100uLL, "%s", (const char *)v4);
  return 0;
}

uint64_t _MISSetGlobalServiceState(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 22;
  if (a1)
  {
    if (_NETRBClientSetGlobalServiceState(a1, a2))
      return 0;
    else
      return 22;
  }
  return v2;
}

uint64_t _MISStartServiceDHCP(uint64_t a1, const char *a2, _OWORD *a3)
{
  xpc_object_t v5;
  void *v6;
  const char *v7;
  size_t v8;
  uint64_t v9;
  int started;

  if (!a1)
    return 22;
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
    return 12;
  v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  v7 = netrbClientDeviceType;
  v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8))
    v9 = 3;
  else
    v9 = 0;
  xpc_dictionary_set_uint64(v6, v7, v9);
  started = _NETRBClientStartService(a1, 0, 201, 302, v6);
  xpc_release(v6);
  if (started)
    return 0;
  else
    return 22;
}

uint64_t _MISStartServiceDHCPLocal(uint64_t a1, const char *a2, _OWORD *a3)
{
  xpc_object_t v5;
  void *v6;
  const char *v7;
  size_t v8;
  uint64_t v9;
  int started;

  if (!a1)
    return 22;
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
    return 12;
  v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  v7 = netrbClientDeviceType;
  v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8))
    v9 = 3;
  else
    v9 = 0;
  xpc_dictionary_set_uint64(v6, v7, v9);
  started = _NETRBClientStartService(a1, 0, 203, 302, v6);
  xpc_release(v6);
  if (started)
    return 0;
  else
    return 22;
}

uint64_t _MISStartServiceDHCPCustom(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, int a5, _OWORD *a6)
{
  xpc_object_t v11;
  void *v12;
  const char *v13;
  size_t v14;
  uint64_t v15;
  int v16;
  int started;

  if (!a1)
    return 22;
  a6[14] = 0u;
  a6[15] = 0u;
  a6[12] = 0u;
  a6[13] = 0u;
  a6[10] = 0u;
  a6[11] = 0u;
  a6[8] = 0u;
  a6[9] = 0u;
  a6[6] = 0u;
  a6[7] = 0u;
  a6[4] = 0u;
  a6[5] = 0u;
  a6[2] = 0u;
  a6[3] = 0u;
  *a6 = 0u;
  a6[1] = 0u;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
    return 12;
  v12 = v11;
  xpc_dictionary_set_string(v11, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceMTU, a3);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceInstance, a4);
  v13 = netrbClientDeviceType;
  v14 = strlen(a2);
  if (!strncmp("ap1", a2, v14))
    v15 = 3;
  else
    v15 = 0;
  xpc_dictionary_set_uint64(v12, v13, v15);
  if (a5 == 1)
    v16 = 203;
  else
    v16 = 201;
  started = _NETRBClientStartService(a1, 0, v16, 302, v12);
  xpc_release(v12);
  if (started)
    return 0;
  else
    return 22;
}

uint64_t _MISStartServiceDHCPWithOptions(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8, _OWORD *a9)
{
  xpc_object_t v15;
  void *v16;
  int v17;
  int started;

  if (!a1)
    return 22;
  a9[14] = 0u;
  a9[15] = 0u;
  a9[12] = 0u;
  a9[13] = 0u;
  a9[10] = 0u;
  a9[11] = 0u;
  a9[8] = 0u;
  a9[9] = 0u;
  a9[6] = 0u;
  a9[7] = 0u;
  a9[4] = 0u;
  a9[5] = 0u;
  a9[2] = 0u;
  a9[3] = 0u;
  *a9 = 0u;
  a9[1] = 0u;
  v15 = xpc_dictionary_create(0, 0, 0);
  if (!v15)
    return 12;
  v16 = v15;
  xpc_dictionary_set_string(v15, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v16, netrbClientDeviceType, a3);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceMTU, a4);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceInstance, a5);
  if (a6 == 1)
    v17 = 203;
  else
    v17 = 201;
  started = _NETRBClientStartService(a1, 0, v17, 302, v16);
  xpc_release(v16);
  if (started)
    return 0;
  else
    return 22;
}

uint64_t _MISStopService(uint64_t a1)
{
  uint64_t v1;

  v1 = 22;
  if (a1)
  {
    if (_NETRBClientStopService(a1))
      return 0;
    else
      return 22;
  }
  return v1;
}

uint64_t _MISSetFixtureForwardedPorts(uint64_t a1, unsigned int a2, unsigned int a3)
{
  xpc_object_t v6;
  void *v7;
  int v8;

  if (!a1)
    return 22;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
    return 12;
  v7 = v6;
  xpc_dictionary_set_uint64(v6, netrbClientForwardedLowPort, a2);
  xpc_dictionary_set_uint64(v7, netrbClientForwardedHighPort, a3);
  v8 = _NETRBClientSetFixtureForwardedPorts(a1, (uint64_t)v7);
  xpc_release(v7);
  if (v8)
    return 0;
  else
    return 22;
}

uint64_t _MISGetFixtureForwardedPorts(void *a1, _WORD *a2, _WORD *a3)
{
  void *v5;
  void *v6;
  uint64_t result;
  __int16 uint64;

  if (!a1)
    return 22;
  v5 = _NETRBClientCopyFixtureForwardedPorts(a1);
  if (!v5)
    return 22;
  v6 = v5;
  if (MEMORY[0x220738B88]() != MEMORY[0x24BDACFA0])
    return 22;
  *a2 = xpc_dictionary_get_uint64(v6, netrbClientForwardedLowPort);
  uint64 = xpc_dictionary_get_uint64(v6, netrbClientForwardedHighPort);
  result = 0;
  *a3 = uint64;
  return result;
}

uint64_t _MISIsAllowedMoreHost(uint64_t a1)
{
  if (a1)
    return _NETRBClientIsAllowedMoreHost(a1);
  else
    return 22;
}

uint64_t _MISAddHost(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int v3;

  v2 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5)
      v3 = a2 + 1;
    else
      v3 = 0;
    if (_NETRBClientAddHost(a1, v3))
      return 0;
    else
      return 22;
  }
  return v2;
}

uint64_t _MISRemoveHost(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int v3;

  v2 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5)
      v3 = a2 + 1;
    else
      v3 = 0;
    if (_NETRBClientRemoveHost(a1, v3))
      return 0;
    else
      return 22;
  }
  return v2;
}

uint64_t _MISGetHostCount(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3;

  v3 = 22;
  if (a1)
  {
    if (_NETRBClientGetHostCount(a1, a2, a3))
      return 0;
    else
      return 22;
  }
  return v3;
}

uint64_t _MISSetHostCount(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  int v4;

  v3 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5)
      v4 = a2 + 1;
    else
      v4 = 0;
    if (_NETRBClientSetHostCount(a1, v4, a3))
      return 0;
    else
      return 22;
  }
  return v3;
}

uint64_t _MISGetExt(uint64_t a1, char *a2)
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v4[0] = 0;
  v4[1] = 0;
  if (!_NETRBClientGetExtName(a1, (uint64_t)v4))
    return 22;
  snprintf(a2, 0x10uLL, "%s", (const char *)v4);
  return 0;
}

uint64_t __getW5ClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getW5LogItemRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getW5LogItemRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getW5DiagnosticsTestRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getW5DiagnosticsTestRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __NETRBLogCreate_block_invoke_cold_1(v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x24BDBC158](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC940](userNotification);
}

uint64_t CNNetworkCopyPluginNames()
{
  return MEMORY[0x24BE14AC0]();
}

uint64_t CNNetworkGetPassword()
{
  return MEMORY[0x24BE14AC8]();
}

uint64_t CNNetworkGetPluginBundleID()
{
  return MEMORY[0x24BE14AD0]();
}

uint64_t CNNetworkGetSSIDString()
{
  return MEMORY[0x24BE14AD8]();
}

uint64_t CNScanListFilterStart()
{
  return MEMORY[0x24BE14AE8]();
}

uint64_t CNScanListFilterStop()
{
  return MEMORY[0x24BE14AF0]();
}

CFDateRef DHCPInfoGetLeaseExpirationTime(CFDictionaryRef info)
{
  return (CFDateRef)MEMORY[0x24BDF5630](info);
}

uint64_t EAPSecIdentityHandleCreate()
{
  return MEMORY[0x24BE2E2D8]();
}

uint64_t EAPSecIdentityHandleCreateSecIdentity()
{
  return MEMORY[0x24BE2E2E0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFDictionaryRef SCDynamicStoreCopyDHCPInfo(SCDynamicStoreRef store, CFStringRef serviceID)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5650](store, serviceID);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x24BDF5690](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

Boolean SCNetworkInterfaceForceConfigurationRefresh(SCNetworkInterfaceRef interface)
{
  return MEMORY[0x24BDF5710](interface);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x24BDF5728](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5750](protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return MEMORY[0x24BDF5758](protocol, config);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x24BDF57B8](service, protocolType);
}

SCNetworkServiceRef SCNetworkServiceCreate(SCPreferencesRef prefs, SCNetworkInterfaceRef interface)
{
  return (SCNetworkServiceRef)MEMORY[0x24BDF57C0](prefs, interface);
}

Boolean SCNetworkServiceEstablishDefaultConfiguration(SCNetworkServiceRef service)
{
  return MEMORY[0x24BDF57C8](service);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x24BDF57D0](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x24BDF57D8](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x24BDF57E0](service);
}

Boolean SCNetworkServiceRemove(SCNetworkServiceRef service)
{
  return MEMORY[0x24BDF57E8](service);
}

Boolean SCNetworkServiceSetName(SCNetworkServiceRef service, CFStringRef name)
{
  return MEMORY[0x24BDF57F0](service, name);
}

Boolean SCNetworkSetAddService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return MEMORY[0x24BDF57F8](set, service);
}

CFArrayRef SCNetworkSetCopyAll(SCPreferencesRef prefs)
{
  return (CFArrayRef)MEMORY[0x24BDF5800](prefs);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x24BDF5808](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x24BDF5810](set);
}

SCNetworkSetRef SCNetworkSetCreate(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x24BDF5818](prefs);
}

CFStringRef SCNetworkSetGetName(SCNetworkSetRef set)
{
  return (CFStringRef)MEMORY[0x24BDF5820](set);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x24BDF5828](set);
}

CFStringRef SCNetworkSetGetSetID(SCNetworkSetRef set)
{
  return (CFStringRef)MEMORY[0x24BDF5830](set);
}

Boolean SCNetworkSetRemove(SCNetworkSetRef set)
{
  return MEMORY[0x24BDF5838](set);
}

Boolean SCNetworkSetSetCurrent(SCNetworkSetRef set)
{
  return MEMORY[0x24BDF5840](set);
}

Boolean SCNetworkSetSetName(SCNetworkSetRef set, CFStringRef name)
{
  return MEMORY[0x24BDF5848](set, name);
}

Boolean SCNetworkSetSetServiceOrder(SCNetworkSetRef set, CFArrayRef newOrder)
{
  return MEMORY[0x24BDF5850](set, newOrder);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5858](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5860](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5870](allocator, name, prefsID, authorization);
}

uint64_t SCPreferencesCreateWithOptions()
{
  return MEMORY[0x24BDF5878]();
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x24BDF5888](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x24BDF58C8](prefs);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF58D0](prefs);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x24BDE8948]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

uint64_t WFCapabilityIsChinaDevice()
{
  return MEMORY[0x24BEC29B0]();
}

uint64_t WFCurrentDeviceCapability()
{
  return MEMORY[0x24BEC29B8]();
}

uint64_t WFHasWAPICapability()
{
  return MEMORY[0x24BEC29C0]();
}

uint64_t WFPowerStateToggleToString()
{
  return MEMORY[0x24BEC29C8]();
}

uint64_t WFSignalBarsFromScaledRSSI()
{
  return MEMORY[0x24BEC29D8]();
}

uint64_t WiFiCloudSyncEngineIsRunning()
{
  return MEMORY[0x24BEC28C8]();
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x24BE678D0]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x24BE67900]();
}

uint64_t WiFiDeviceClientGasStartAsync()
{
  return MEMORY[0x24BE67910]();
}

uint64_t WiFiDeviceClientNotifySoftError()
{
  return MEMORY[0x24BE67930]();
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback()
{
  return MEMORY[0x24BE67938]();
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback()
{
  return MEMORY[0x24BE67940]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x24BE67948]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x24BE67950]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x24BE67958]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x24BE679C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientCreatePrivateMacAddress()
{
  return MEMORY[0x24BE679E0]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x24BE679E8]();
}

uint64_t WiFiManagerClientDispatchNotificationResponse()
{
  return MEMORY[0x24BE679F8]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x24BE67A00]();
}

uint64_t WiFiManagerClientGetHardwareFailure()
{
  return MEMORY[0x24BE67A18]();
}

uint64_t WiFiManagerClientGetMISDiscoveryState()
{
  return MEMORY[0x24BE67A20]();
}

uint64_t WiFiManagerClientGetMISState()
{
  return MEMORY[0x24BE67A28]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x24BE67A30]();
}

uint64_t WiFiManagerClientIsInfraAllowed()
{
  return MEMORY[0x24BE67A48]();
}

uint64_t WiFiManagerClientIsManagedAppleID()
{
  return MEMORY[0x24BE67A50]();
}

uint64_t WiFiManagerClientIsMfpCapableDevice()
{
  return MEMORY[0x24BE67A58]();
}

uint64_t WiFiManagerClientIsPowerModificationDisabled()
{
  return MEMORY[0x24BE67A70]();
}

uint64_t WiFiManagerClientIsRestrictionPolicyActive()
{
  return MEMORY[0x24BE67A78]();
}

uint64_t WiFiManagerClientIsWPA3EnterpriseSupported()
{
  return MEMORY[0x24BE67A88]();
}

uint64_t WiFiManagerClientIsWPA3PersonalSupported()
{
  return MEMORY[0x24BE67A90]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x24BE67AA8]();
}

uint64_t WiFiManagerClientRegisterManagedAppleIDStateChangedCallback()
{
  return MEMORY[0x24BE67AB0]();
}

uint64_t WiFiManagerClientRegisterNotificationCallback()
{
  return MEMORY[0x24BE67AB8]();
}

uint64_t WiFiManagerClientRegisterPreferredNetworksChangedCallback()
{
  return MEMORY[0x24BE67AC0]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x24BE67AC8]();
}

uint64_t WiFiManagerClientRegisterUserAutoJoinStateChangedCallback()
{
  return MEMORY[0x24BE67AD0]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x24BE67AE8]();
}

uint64_t WiFiManagerClientSetMISDiscoveryState()
{
  return MEMORY[0x24BE67B00]();
}

uint64_t WiFiManagerClientSetMISState()
{
  return MEMORY[0x24BE67B10]();
}

uint64_t WiFiManagerClientSetPrivateMacPrefForScanRecord()
{
  return MEMORY[0x24BE67B30]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x24BE67B68]();
}

uint64_t WiFiNetworkArchiveToPath()
{
  return MEMORY[0x24BE67B78]();
}

uint64_t WiFiNetworkCanExposeIMSI()
{
  return MEMORY[0x24BE67B80]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x24BE67B88]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x24BE67B98]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x24BE67BA0]();
}

uint64_t WiFiNetworkCreateCopy()
{
  return MEMORY[0x24BE67BA8]();
}

uint64_t WiFiNetworkCreateCoreWiFiNetworkProfile()
{
  return MEMORY[0x24BE67BB0]();
}

uint64_t WiFiNetworkCreateCoreWiFiScanResult()
{
  return MEMORY[0x24BE67BB8]();
}

uint64_t WiFiNetworkCreateFromCoreWiFiNetworkProfile()
{
  return MEMORY[0x24BE67BC0]();
}

uint64_t WiFiNetworkGetAPEnv()
{
  return MEMORY[0x24BE67BC8]();
}

uint64_t WiFiNetworkGetAssociationDate()
{
  return MEMORY[0x24BE67BD0]();
}

uint64_t WiFiNetworkGetBundleIdentifier()
{
  return MEMORY[0x24BE67BD8]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x24BE67BE0]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x24BE67BE8]();
}

uint64_t WiFiNetworkGetDirectedState()
{
  return MEMORY[0x24BE67BF0]();
}

uint64_t WiFiNetworkGetHS2NetworkBadge()
{
  return MEMORY[0x24BE67BF8]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x24BE67C00]();
}

uint64_t WiFiNetworkGetNetworkQualityDate()
{
  return MEMORY[0x24BE67C08]();
}

uint64_t WiFiNetworkGetNetworkQualityResponsiveness()
{
  return MEMORY[0x24BE67C10]();
}

uint64_t WiFiNetworkGetOriginator()
{
  return MEMORY[0x24BE67C20]();
}

uint64_t WiFiNetworkGetPhyMode()
{
  return MEMORY[0x24BE67C28]();
}

uint64_t WiFiNetworkGetPrivacyProxyEnabled()
{
  return MEMORY[0x24BE67C30]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x24BE67C38]();
}

uint64_t WiFiNetworkGetRSSI()
{
  return MEMORY[0x24BE67C40]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x24BE67C48]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x24BE67C60]();
}

uint64_t WiFiNetworkIsAdHoc()
{
  return MEMORY[0x24BE67C68]();
}

uint64_t WiFiNetworkIsApplePersonalHotspot()
{
  return MEMORY[0x24BE67C70]();
}

uint64_t WiFiNetworkIsCarPlay()
{
  return MEMORY[0x24BE67C80]();
}

uint64_t WiFiNetworkIsCarrierBundleBased()
{
  return MEMORY[0x24BE67C88]();
}

uint64_t WiFiNetworkIsEnabled()
{
  return MEMORY[0x24BE67C98]();
}

uint64_t WiFiNetworkIsHotspot20()
{
  return MEMORY[0x24BE67CA0]();
}

uint64_t WiFiNetworkIsInSaveDataMode()
{
  return MEMORY[0x24BE67CA8]();
}

uint64_t WiFiNetworkIsProvisionedHS20Network()
{
  return MEMORY[0x24BE67CB8]();
}

uint64_t WiFiNetworkIsSSIDAmbiguous()
{
  return MEMORY[0x24BE67CC0]();
}

uint64_t WiFiNetworkIsWAPICERT()
{
  return MEMORY[0x24BE67CC8]();
}

uint64_t WiFiNetworkIsWAPIPSK()
{
  return MEMORY[0x24BE67CD0]();
}

uint64_t WiFiNetworkMerge()
{
  return MEMORY[0x24BE67CE8]();
}

uint64_t WiFiNetworkMergeForAssociation()
{
  return MEMORY[0x24BE67CF0]();
}

uint64_t WiFiNetworkRemovePassword()
{
  return MEMORY[0x24BE67CF8]();
}

uint64_t WiFiNetworkRequiresOneTimePassword()
{
  return MEMORY[0x24BE67D08]();
}

uint64_t WiFiNetworkRequiresPassword()
{
  return MEMORY[0x24BE67D10]();
}

uint64_t WiFiNetworkRequiresUsername()
{
  return MEMORY[0x24BE67D18]();
}

uint64_t WiFiNetworkSetAssociationDate()
{
  return MEMORY[0x24BE67D20]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x24BE67D28]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x24BE67D30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x24BED3BC8]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x24BED3BD8]();
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

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x24BDAE1D8](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF0]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x24BDAF3A0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB08E0](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
  MEMORY[0x24BDB0980](xdict, key, connection);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}


uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A32E34](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A32E28]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _WiFiDeviceClientDiagnosticsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "updateInfo:", a2);
}

objc_class *WFManagedConfigurationUIClassFromString(void *a1)
{
  NSString *v1;
  Class v2;
  void *v3;
  objc_class *v4;

  v1 = a1;
  v2 = NSClassFromString(v1);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PreferenceBundles/ManagedConfigurationUI.bundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "load");
    v2 = NSClassFromString(v1);

  }
  v4 = v2;

  return v4;
}

BOOL WFCapabilityIsChinaDevice(uint64_t a1)
{
  return a1 == 4 || (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

const __CFString *WFStringFromDeviceCapability(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("WFDeviceCapabilityNone");
  if (a1 == 3)
    v1 = CFSTR("WFDeviceCapabilityChinaGreenTea");
  if (a1 == 2)
    return CFSTR("WFDeviceCapabilityChinaWiFiOnly");
  else
    return v1;
}

uint64_t WFSignalBarsFromScaledRSSI(float a1)
{
  unint64_t v3;

  if (a1 < 0.0 || a1 > 1.0)
    return 0;
  v3 = vcvtps_u32_f32(a1 * 3.0);
  if (v3 <= 1)
    v3 = 1;
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

void *WFScanRecordAlphaSortCompartor()
{
  return &__block_literal_global;
}

void *WFScanRecordDefaultSortCompartor()
{
  return &__block_literal_global_8;
}

uint64_t WFCurrentDeviceCapability()
{
  if (WFIsGreenTeaDevice___greenTeaCapabilityToken != -1)
    dispatch_once(&WFIsGreenTeaDevice___greenTeaCapabilityToken, &__block_literal_global_15);
  if (WFIsGreenTeaDevice___greenTea)
    return 3;
  if (WFHasWAPICapability___wapiEnabledCapabilityToken != -1)
    dispatch_once(&WFHasWAPICapability___wapiEnabledCapabilityToken, &__block_literal_global_18);
  if (!WFHasWAPICapability___wapiCapability)
    return 1;
  if (WFIsWAPINotAvailable___wapiDisabledToken != -1)
    dispatch_once(&WFIsWAPINotAvailable___wapiDisabledToken, &__block_literal_global_10);
  if (WFIsWAPINotAvailable___wapiDisabled)
    return 4;
  else
    return 2;
}

uint64_t WFIsGreenTeaDevice()
{
  if (WFIsGreenTeaDevice___greenTeaCapabilityToken != -1)
    dispatch_once(&WFIsGreenTeaDevice___greenTeaCapabilityToken, &__block_literal_global_15);
  return WFIsGreenTeaDevice___greenTea;
}

uint64_t WFHasWAPICapability()
{
  if (WFHasWAPICapability___wapiEnabledCapabilityToken != -1)
    dispatch_once(&WFHasWAPICapability___wapiEnabledCapabilityToken, &__block_literal_global_18);
  return WFHasWAPICapability___wapiCapability;
}

uint64_t WFIsWAPINotAvailable()
{
  if (WFIsWAPINotAvailable___wapiDisabledToken != -1)
    dispatch_once(&WFIsWAPINotAvailable___wapiDisabledToken, &__block_literal_global_10);
  return WFIsWAPINotAvailable___wapiDisabled;
}

id WFWiFiTitleString()
{
  void *v0;
  uint64_t v1;
  const __CFString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("WFAirportViewController")));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = WFCurrentDeviceCapability();
  if ((v1 & 6) == 2 || v1 == 4)
    v3 = CFSTR("kWFLocWiFiPowerTitleCH");
  else
    v3 = CFSTR("kWFLocWiFiPowerTitle");
  objc_msgSend(v0, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t WFPowerStateToggleToString(unint64_t a1)
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1 < 4)
    return (uint64_t)*(&off_24DB37238 + a1);
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "WFPowerStateToggleToString";
    v7 = 2048;
    v8 = a1;
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: %lu is invalid WFPowerState", (uint8_t *)&v5, 0x16u);
  }

  return 0;
}

id WFWiFiSecurityModeLocalizedStringFromOtherSecurityMode(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.WiFiKitUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((unint64_t)(a1 - 1) > 9)
    v4 = CFSTR("kWFLocSecurityNoneTitle");
  else
    v4 = *(&off_24DB37258 + a1 - 1);
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t _WFIsSupportedContentSizeCategoryForInsetTableView(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE098]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE090]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE058]) ^ 1;
  }

  return v2;
}

uint64_t WFShouldUseInsetTableView()
{
  void *v0;
  double v1;
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;

  if (!_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  if (v1 <= 320.0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  if (v4 > 320.0)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _WFIsSupportedContentSizeCategoryForInsetTableView(v6);

LABEL_6:
    return v5;
  }
  return 0;
}

__CFString *WFCurrentDeviceType()
{
  __CFString *v0;

  v0 = (__CFString *)MGCopyAnswer();
  if (-[__CFString isEqualToString:](v0, "isEqualToString:", CFSTR("Unknown")))
  {

    v0 = CFSTR("iPhone");
  }
  return v0;
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
    return qword_219758C88[a1 - 1];
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
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
              *(_OWORD *)v28 = xmmword_24DB372D0;
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

float WFScaleRSSI(uint64_t a1)
{
  float v1;
  float v2;

  v1 = (float)a1 + 77.5;
  v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
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
    return off_24DB372E8[a1];
}

uint64_t _WFOpenSettingsPathWithPathType(unint64_t a1)
{
  __CFString *v1;

  if (a1 > 3)
    v1 = 0;
  else
    v1 = off_24DB372E8[a1];
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
    && (_WFNetworkUsesSecurityCiphers(v2, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"), CFSTR("IE_KEY_WPA_UCIPHERS"), &unk_24DB59D70) & 1) != 0|| v3&& (_WFNetworkUsesSecurityCiphers(v3, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), CFSTR("IE_KEY_RSN_UCIPHERS"), &unk_24DB59D88) & 1) != 0)
  {
    v4 = 1;
  }
  else if (v2
         && (_WFNetworkUsesSecurityCiphers(v2, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"), CFSTR("IE_KEY_WPA_UCIPHERS"), &unk_24DB59DA0) & 1) != 0|| v3&& _WFNetworkUsesSecurityCiphers(v3, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), CFSTR("IE_KEY_RSN_UCIPHERS"), &unk_24DB59DB8))
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
    v4 = &stru_24DB39F78;
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
        _os_log_impl(&dword_2196CC000, v12, v13, "%@%@", buf, 0x16u);
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

void sub_2196D3AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2196D4530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_2196D5A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2196D60E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2196D6754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *__WFNetworkListNetworkChangeReasonToString(uint64_t a1)
{
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return CFSTR("automatic");
  if (a1 == 1)
    return CFSTR("user initiated");
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v5 = 136315394;
    v6 = "__WFNetworkListNetworkChangeReasonToString";
    v7 = 2048;
    v8 = a1;
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: %lu is invalid WFNetworkListNetworkChangeReason", (uint8_t *)&v5, 0x16u);
  }

  return 0;
}

void sub_2196DC758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  uint64_t v58;

  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 176), 8);
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

void sub_2196DD5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2196DE9CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2196E5CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2196E6DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2196E9584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2196F1CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

void sub_2196F7154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2196F90F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2196FAD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_2196FB270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_2196FF70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL WFSecurityTypeRequiresUsername(uint64_t a1)
{
  return a1 == 10 || (a1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

BOOL WFSecurityTypeRequiresPassword(uint64_t a1)
{
  return a1 != 0;
}

void sub_219701B78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_219702AEC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

__CFString *WFDescriptionFromIdentity(void *a1)
{
  id v1;
  void *v2;
  CFTypeID v3;
  __CFString *v4;
  CFTypeID v5;
  SecCertificateRef certificateRef;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_8;
  v3 = CFGetTypeID(v1);
  if (v3 != SecIdentityGetTypeID())
  {
    v5 = CFGetTypeID(v2);
    if (v5 == SecCertificateGetTypeID())
    {
      v4 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)v2);
      goto LABEL_9;
    }
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  certificateRef = 0;
  v4 = 0;
  if (!SecIdentityCopyCertificate((SecIdentityRef)v2, &certificateRef) && certificateRef)
  {
    v4 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    CFRelease(certificateRef);
  }
LABEL_9:

  return v4;
}

void sub_219705A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v26 - 104));
  _Unwind_Resume(a1);
}

void sub_219705EBC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_2197062A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2197067F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  uint64_t v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v22 - 88));
  _Unwind_Resume(a1);
}

void sub_219706BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219708B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219708ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2197092A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21970968C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219709A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21970CFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21970D2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21970D520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219710FDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_219713A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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
      v5 = &stru_24DB39F78;
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
      v2 = &stru_24DB39F78;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t WFSetExtraLoggingEnabled(uint64_t result)
{
  __extraLoggingEnabled = result;
  return result;
}

uint64_t OSLogForWFLogLevel(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x201011000uLL >> (8 * a1);
  if (a1 >= 5)
    LOBYTE(v1) = 0;
  return v1;
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

id WFLogForCategory(unint64_t a1)
{
  id v2;
  id v3;

  if (WFLogForCategory_onceToken != -1)
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_7);
  v2 = (id)MEMORY[0x24BDACB70];
  v3 = MEMORY[0x24BDACB70];
  if (a1 <= 8)
  {
    v2 = (id)*off_24DB38100[a1];

  }
  return v2;
}

void sub_219722110(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_219724820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a33, 8);
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

void sub_219725168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  uint64_t v56;

  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_219725C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WiFiPlacardView.body.getter(uint64_t a1)
{
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  id result;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  type metadata accessor for PlacardCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    v5 = result;
    MobileGestalt_get_wapiCapability();

    v6 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
    v7 = (void *)sub_219752984();
    v8 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v6, 0, v7);

    sub_2197529A8();
    v9 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
    result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      v10 = result;
      MobileGestalt_get_wapiCapability();

      v11 = (void *)sub_219752984();
      swift_bridgeObjectRelease();
      v12 = (void *)sub_219752984();
      v13 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v11, 0, v12);

      sub_2197529A8();
      sub_2197283A8(a1);
      return (id)sub_219752924();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PlacardCell()
{
  return objc_opt_self();
}

void sub_2197282C8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_21975236C();
  sub_219731364(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_21972996C(&qword_255095FC8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_219759530);
  v2 = (id)sub_219752930();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

uint64_t sub_2197283A8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2197283C0()
{
  return sub_2197527D4();
}

id sub_2197283D8()
{
  uint64_t *v0;

  return WiFiPlacardView.body.getter(*v0);
}

uint64_t variable initialization expression of PlacardCell.navigationItem()
{
  return 0;
}

id PlacardCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id PlacardCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2197292A8(a2, a3);
}

uint64_t sub_2197284A0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t inited;
  void **v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];

  v34 = a2;
  v5 = sub_219752900();
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)MEMORY[0x219A32F30](a1 + OBJC_IVAR___WFPlacardCell_navigationItem);
  v12 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v13 = objc_msgSend(v12, sel_init, v34);
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_219752984();
  v16 = objc_msgSend(v14, sel_preferredFontForTextStyle_, v15);

  objc_msgSend(v13, sel_setFont_, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255095F90);
  inited = swift_initStackObject();
  v18 = (void **)MEMORY[0x24BEBB368];
  *(_OWORD *)(inited + 16) = xmmword_219758F50;
  v19 = *v18;
  *(_QWORD *)(inited + 32) = *v18;
  v20 = (void *)objc_opt_self();
  v21 = v13;
  swift_bridgeObjectRetain();
  v22 = v19;
  v23 = objc_msgSend(v20, sel_labelColor);
  v24 = objc_msgSend(v23, sel_colorWithAlphaComponent_, a3);

  *(_QWORD *)(inited + 64) = sub_2197298EC(0, &qword_255095F98);
  *(_QWORD *)(inited + 40) = v24;
  sub_219731380(inited);
  v25 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v26 = (void *)sub_219752984();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_21972996C((unint64_t *)&unk_255095FA0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_219759574);
  v27 = (void *)sub_219752930();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

  objc_msgSend(v21, sel_setAttributedText_, v28);
  sub_2197298EC(0, (unint64_t *)&qword_2550964A0);
  v29 = (void *)sub_219752A68();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v11;
  *(_QWORD *)(v30 + 24) = v21;
  aBlock[4] = sub_219729950;
  aBlock[5] = v30;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor;
  v31 = _Block_copy(aBlock);
  v32 = v11;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v31);

  _Block_release(v31);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v10, v36);
}

id PlacardCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void PlacardCell.init(coder:)()
{
  void *v0;

  swift_unknownObjectWeakInit();

  sub_219752B70();
  __break(1u);
}

id PlacardCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlacardCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of NetworkListRowView._network()
{
  return 0;
}

double variable initialization expression of NetworkListRowView.verticalPadding()
{
  return 0.0;
}

uint64_t variable initialization expression of NetworkListRowView._isEditing()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListRowView.networkListDidTransitBackToScanListNotificationPublisher()
{
  return sub_219728CFC(&qword_255095E88, (id *)&qword_255098610);
}

uint64_t variable initialization expression of NetworkListRowView.networkListDidTapPersonalHotspotNotificationPublisher()
{
  return sub_219728CFC(&qword_255095E90, (id *)&qword_255098618);
}

uint64_t variable initialization expression of NetworkListRowView.networkListResetPersonalHotspotConnectionStatusNotificationPublisher()
{
  return sub_219728CFC(&qword_255095E98, (id *)&qword_255098620);
}

uint64_t variable initialization expression of NetworkListRow.config()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._currentNetwork()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._currentNetworkRowConfig()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._listMode()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._knownNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._publicNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._infraNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._adhocNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._unConfiguredNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._managedPreferredNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._editablePreferredNetworks()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource._isScanning()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._unconfiguredNetworksSectionTitle()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.networksToBeDeleted()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListDataSource.networkTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.infoButtonTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.associationHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.pendingDeletingNetworksChangedCallback()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.otherNetworkTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.scanResults()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerState()
{
  return 2;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._dataUsageHidden()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._WAPISwitchHidden()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._WAPIEnabled()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._askToJoinMode()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._autoInstantHotspotOption()
{
  return 2;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._networkModificationRestrictionOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerModificationRestrictionOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.userAutoJoinEnabled()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.autoInstantHotspotTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.askToJoinModeTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.WAPISwitchHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.dataUsageTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.isChinaDevice()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.isCellularDevice()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.powerToggleHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.autoUnlockEnabled()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkListViewController.hostingController()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._network()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._subtitle()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._connectionState()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._problematicConnection()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._signalBars()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.context()
{
  return 1;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.hideConnectionState()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.showInfoButton()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.isEditable()
{
  return 1;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.infoButtonHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkList.networkListScrollToTopNotificationPublisher()
{
  return sub_219728CFC(&qword_255095EA0, (id *)&qword_255098628);
}

uint64_t sub_219728CFC(_QWORD *a1, id *a2)
{
  id v4;
  id v5;

  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  return sub_219752A80();
}

uint64_t variable initialization expression of NetworkList.topOfListID()
{
  return 0x4C20664F20706F54;
}

uint64_t sub_219728DAC(uint64_t a1, uint64_t a2)
{
  return sub_219728F08(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_219728DCC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_219752990();
  *a2 = 0;
  return result;
}

uint64_t sub_219728E40(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21975299C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_219728EBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2197529A8();
  v2 = sub_219752984();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_219728EFC(uint64_t a1, uint64_t a2)
{
  return sub_219728F08(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_219728F08(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2197529A8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_219728F44()
{
  sub_2197529A8();
  sub_2197529C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_219728F84()
{
  uint64_t v0;

  sub_2197529A8();
  sub_219752C00();
  sub_2197529C0();
  v0 = sub_219752C18();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_219728FF4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_219729008@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_219729018(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_219729024(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_21972902C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_219729040(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_219729070(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_219729084(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_21972909C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2197529A8();
  v2 = v1;
  if (v0 == sub_2197529A8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_219752BE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_219729124@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_219729134()
{
  sub_21972996C(&qword_255095FC8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_219759530);
  sub_21972996C(&qword_255096018, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_219759484);
  return sub_219752BB8();
}

uint64_t sub_2197291B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_219752984();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2197291FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2197529A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_219729224()
{
  sub_21972996C((unint64_t *)&unk_255095FA0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_219759574);
  sub_21972996C((unint64_t *)&unk_255096020, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_219759370);
  return sub_219752BB8();
}

id sub_2197292A8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  id result;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26[5];
  objc_super v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255095F78);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  if (a2)
  {
    v8 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (objc_class *)type metadata accessor for PlacardCell();
  v27.receiver = v2;
  v27.super_class = v9;
  v10 = objc_msgSendSuper2(&v27, sel_initWithStyle_reuseIdentifier_, 0, v8);

  v11 = v10;
  objc_msgSend(v11, sel_setSelectionStyle_, 0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    v15 = result;
    MobileGestalt_get_wapiCapability();

    v16 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
    v17 = (void *)sub_219752984();
    v18 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v16, 0, v17);

    v19 = sub_2197529A8();
    v21 = v20;

    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v11;
    v22[3] = v19;
    v22[4] = v21;
    v23 = MEMORY[0x24BDAC7A8](v22);
    *(&v25 - 2) = (uint64_t)sub_21972987C;
    *(&v25 - 1) = v23;
    sub_219729894();
    v24 = v11;
    sub_21975269C();
    sub_219752708();
    v26[3] = v4;
    v26[4] = sub_2197299AC(&qword_255095F88, &qword_255095F78, MEMORY[0x24BDEFEA0]);
    __swift_allocate_boxed_opaque_existential_1(v26);
    sub_219752690();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    MEMORY[0x219A324D4](v26);

    swift_release();
    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2197295A0()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *destroy for WiFiPlacardView(_QWORD *result)
{
  if (*result)
    return (_QWORD *)swift_release();
  return result;
}

_QWORD *_s9WiFiKitUI15WiFiPlacardViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  if (*a2)
  {
    v3 = a2[1];
    *a1 = *a2;
    a1[1] = v3;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

_QWORD *assignWithCopy for WiFiPlacardView(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for WiFiPlacardView(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WiFiPlacardView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiPlacardView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiPlacardView()
{
  return &type metadata for WiFiPlacardView;
}

uint64_t sub_2197297AC()
{
  return sub_2197299AC(&qword_255095F38, &qword_255095F40, MEMORY[0x24BE855C8]);
}

void type metadata accessor for WFNetworkRowContext(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F48);
}

void type metadata accessor for WFShowNetworkSettingsContext(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F50);
}

void type metadata accessor for WFAutoInstantHotspotJoinOption(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F58);
}

void type metadata accessor for WFAskToJoinMode(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F60);
}

void type metadata accessor for WFPowerState(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F68);
}

void type metadata accessor for WFNetworkState(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095F70);
}

uint64_t sub_219729850()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21972987C(double a1)
{
  uint64_t v1;

  return sub_2197284A0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_219729888@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_retain();
}

unint64_t sub_219729894()
{
  unint64_t result;

  result = qword_255095F80;
  if (!qword_255095F80)
  {
    result = MEMORY[0x219A32E40](&protocol conformance descriptor for WiFiPlacardView, &type metadata for WiFiPlacardView);
    atomic_store(result, (unint64_t *)&qword_255095F80);
  }
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095FD8);
}

uint64_t sub_2197298EC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_219729924()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_219729950()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
  return result;
}

uint64_t sub_21972996C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A32E40](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2197299AC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x219A32E40](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095FD0);
}

void type metadata accessor for BatteryState(uint64_t a1)
{
  sub_219729A14(a1, &qword_255095FE0);
}

void sub_219729A14(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_219729A58()
{
  return sub_21972996C(&qword_255095FE8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_219759334);
}

uint64_t sub_219729A84()
{
  return sub_21972996C(&qword_255095FF0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_219759308);
}

uint64_t sub_219729AB0()
{
  return sub_21972996C(&qword_255095FF8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_219759448);
}

uint64_t sub_219729ADC()
{
  return sub_21972996C(&qword_255096000, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21975941C);
}

uint64_t sub_219729B08()
{
  return sub_21972996C(&qword_255096008, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2197594B8);
}

uint64_t sub_219729B34()
{
  return sub_21972996C(&qword_255096010, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2197593A4);
}

void WFBatteryView.body.getter(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 257;
}

uint64_t sub_219729B94()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_219729BA4@<D0>(uint64_t a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *(double *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 257;
  return result;
}

ValueMetadata *type metadata accessor for WFBatteryView()
{
  return &type metadata for WFBatteryView;
}

unint64_t sub_219729BD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550960F0;
  if (!qword_2550960F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550960F8);
    v2[0] = sub_219729C40();
    v2[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550960F0);
  }
  return result;
}

unint64_t sub_219729C40()
{
  unint64_t result;

  result = qword_255096100;
  if (!qword_255096100)
  {
    result = MEMORY[0x219A32E40](&unk_2197596D8, &type metadata for WFBatteryViewWrapper);
    atomic_store(result, (unint64_t *)&qword_255096100);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WFBatteryViewWrapper(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WFBatteryViewWrapper(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WFBatteryViewWrapper()
{
  return &type metadata for WFBatteryViewWrapper;
}

id sub_219729CE4()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB88]), sel_init);
  objc_msgSend(v0, sel_setSizeCategory_, 1);
  objc_msgSend(v0, sel_setShowsInlineChargingIndicator_, 1);
  return v0;
}

id sub_219729D40(void *a1)
{
  double *v1;
  double v3;
  uint64_t v4;

  v3 = *v1;
  v4 = *((_QWORD *)v1 + 1);
  objc_msgSend(a1, sel_setChargePercent_, v3);
  return objc_msgSend(a1, sel_setChargingState_, v4 == 2);
}

uint64_t sub_219729D94()
{
  return sub_219752600();
}

uint64_t sub_219729DD4()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_219729DE0()
{
  sub_219729EA4();
  return sub_219752660();
}

uint64_t sub_219729E30()
{
  sub_219729EA4();
  return sub_21975260C();
}

void sub_219729E80()
{
  sub_219729EA4();
  sub_219752654();
  __break(1u);
}

unint64_t sub_219729EA4()
{
  unint64_t result;

  result = qword_255096108;
  if (!qword_255096108)
  {
    result = MEMORY[0x219A32E40](&unk_219759648, &type metadata for WFBatteryViewWrapper);
    atomic_store(result, (unint64_t *)&qword_255096108);
  }
  return result;
}

uint64_t sub_219729EEC()
{
  return 1;
}

uint64_t sub_219729EF4()
{
  sub_219752C00();
  sub_219752C0C();
  return sub_219752C18();
}

uint64_t sub_219729F34()
{
  return sub_219752C0C();
}

uint64_t sub_219729F58()
{
  sub_219752C00();
  sub_219752C0C();
  return sub_219752C18();
}

const char *sub_219729F94()
{
  return "WiFiKit";
}

const char *sub_219729FA8()
{
  return "SwiftUINetworkList";
}

uint64_t property wrapper backing initializer of NetworkListRowView.config()
{
  type metadata accessor for WFNetworkRowConfigModel();
  sub_21972996C((unint64_t *)&unk_255096110, (uint64_t (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel, (uint64_t)&protocol conformance descriptor for WFNetworkRowConfigModel);
  return sub_21975248C();
}

uint64_t property wrapper backing initializer of NetworkListRowView.network()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255096480);
  sub_219752858();
  return v1;
}

void NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  double v19;
  __int128 v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255096480);
  sub_219752858();
  sub_219752858();
  *(_BYTE *)(a6 + 72) = v24;
  *(_QWORD *)(a6 + 80) = *((_QWORD *)&v24 + 1);
  type metadata accessor for NetworkListRowView();
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_255095E88 != -1)
    swift_once();
  v10 = (id)qword_255098610;
  sub_219752A80();
  v11 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_255095E90 != -1)
    swift_once();
  v12 = (id)qword_255098618;
  sub_219752A80();
  v13 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_255095E98 != -1)
    swift_once();
  v14 = (id)qword_255098620;
  sub_219752A80();
  type metadata accessor for WFNetworkRowConfigModel();
  sub_21972996C((unint64_t *)&unk_255096110, (uint64_t (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel, (uint64_t)&protocol conformance descriptor for WFNetworkRowConfigModel);
  v15 = a1;
  *(_QWORD *)a6 = sub_21975248C();
  *(_QWORD *)(a6 + 8) = v16;
  sub_219752858();
  swift_unknownObjectRelease();
  swift_release();
  *(_OWORD *)(a6 + 16) = v24;
  *(_QWORD *)(a6 + 32) = a2;
  *(_QWORD *)(a6 + 40) = a3;
  v17 = &v15[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  v18 = *(_QWORD *)v17;

  v19 = -4.0;
  if (!v18)
    v19 = 0.0;
  *(double *)(a6 + 48) = v19;
  *(_QWORD *)(a6 + 56) = a4;
  *(_QWORD *)(a6 + 64) = a5;
}

uint64_t type metadata accessor for NetworkListRowView()
{
  uint64_t result;

  result = qword_2550961D0;
  if (!qword_2550961D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t NetworkListRowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _OWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (**v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(uint64_t);
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (**v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;

  v2 = v1;
  v82 = (int *)type metadata accessor for NetworkListRowView();
  v78 = *((_QWORD *)v82 - 1);
  MEMORY[0x24BDAC7A8](v82);
  v81 = v4;
  v77 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219752A8C();
  v73 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096120);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096128);
  MEMORY[0x24BDAC7A8](v67);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096130);
  MEMORY[0x24BDAC7A8](v68);
  v70 = (uint64_t)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096138);
  MEMORY[0x24BDAC7A8](v69);
  v72 = (uint64_t)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096140);
  MEMORY[0x24BDAC7A8](v71);
  v76 = (uint64_t)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096148);
  v79 = *(_QWORD *)(v80 - 8);
  v16 = MEMORY[0x24BDAC7A8](v80);
  v75 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v74 = (uint64_t)&v64 - v18;
  v19 = *(void **)(v2 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v20 = v19;
  sub_219752408();

  swift_release();
  swift_release();
  v21 = (void *)v83;
  v22 = 1;
  if ((_QWORD)v83)
  {
    *(_QWORD *)v10 = sub_21975257C();
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096150);
    sub_21972AB24(v2, v21, (uint64_t)&v10[*(int *)(v23 + 44)]);
    v24 = sub_2197526CC();
    v25 = sub_2197526D8();
    v26 = sub_2197526F0();
    sub_2197526F0();
    if (sub_2197526F0() != v24)
      v26 = sub_2197526F0();
    sub_2197526F0();
    v27 = sub_2197526F0();
    v66 = a1;
    v65 = v21;
    if (v27 != v25)
      v26 = sub_2197526F0();
    sub_21975242C();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    sub_219731034((uint64_t)v10, (uint64_t)v12, &qword_255096120);
    v36 = &v12[*(int *)(v67 + 36)];
    *v36 = v26;
    *((_QWORD *)v36 + 1) = v29;
    *((_QWORD *)v36 + 2) = v31;
    *((_QWORD *)v36 + 3) = v33;
    *((_QWORD *)v36 + 4) = v35;
    v36[40] = 0;
    sub_219731078((uint64_t)v10, &qword_255096120);
    sub_2197528D0();
    sub_2197524E0();
    v37 = v70;
    sub_219731034((uint64_t)v12, v70, &qword_255096128);
    v38 = (_OWORD *)(v37 + *(int *)(v68 + 36));
    v39 = v88;
    v38[4] = v87;
    v38[5] = v39;
    v38[6] = v89;
    v40 = v84;
    *v38 = v83;
    v38[1] = v40;
    v41 = v86;
    v38[2] = v85;
    v38[3] = v41;
    sub_219731078((uint64_t)v12, &qword_255096128);
    v42 = v73;
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
    v43(v7, v2 + v82[10], v5);
    v44 = v77;
    sub_219730C60(v2, v77, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v45 = v5;
    v46 = *(unsigned __int8 *)(v78 + 80);
    v64 = v2;
    v67 = ((v46 + 16) & ~v46) + v81;
    v68 = (v46 + 16) & ~v46;
    v78 = v46 | 7;
    v47 = swift_allocObject();
    sub_21972F7F8(v44, v47 + ((v46 + 16) & ~v46));
    v48 = v72;
    sub_219731034(v37, v72, &qword_255096130);
    v49 = v69;
    v43((char *)(v48 + *(int *)(v69 + 52)), (uint64_t)v7, v45);
    v50 = (uint64_t (**)(uint64_t))(v48 + *(int *)(v49 + 56));
    *v50 = sub_21972F83C;
    v50[1] = (uint64_t (*)(uint64_t))v47;
    v73 = *(_QWORD *)(v42 + 8);
    ((void (*)(char *, uint64_t))v73)(v7, v45);
    sub_219731078(v37, &qword_255096130);
    v51 = v64;
    v43(v7, v64 + v82[11], v45);
    sub_219730C60(v51, v44, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v52 = swift_allocObject();
    *(_QWORD *)(v52 + 16) = v65;
    sub_21972F7F8(v44, v52 + ((v46 + 24) & ~v46));
    v53 = v76;
    sub_219731034(v48, v76, &qword_255096138);
    v54 = v71;
    v43((char *)(v53 + *(int *)(v71 + 52)), (uint64_t)v7, v45);
    v55 = (uint64_t (**)(uint64_t))(v53 + *(int *)(v54 + 56));
    *v55 = sub_21972F940;
    v55[1] = (uint64_t (*)(uint64_t))v52;
    v56 = (void (*)(char *, uint64_t))v73;
    ((void (*)(char *, uint64_t))v73)(v7, v45);
    sub_219731078(v48, &qword_255096138);
    v43(v7, v51 + v82[12], v45);
    sub_219730C60(v51, v44, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v57 = swift_allocObject();
    sub_21972F7F8(v44, v57 + v68);
    v58 = v75;
    sub_219731034(v53, v75, &qword_255096140);
    v59 = v80;
    v43((char *)(v58 + *(int *)(v80 + 52)), (uint64_t)v7, v45);
    v60 = (uint64_t (**)(uint64_t))(v58 + *(int *)(v59 + 56));
    *v60 = sub_21972F984;
    v60[1] = (uint64_t (*)(uint64_t))v57;
    v56(v7, v45);
    sub_219731078(v53, &qword_255096140);
    v61 = v74;
    sub_2197310EC(v58, v74, &qword_255096148);
    v62 = v61;
    a1 = v66;
    sub_2197310EC(v62, v66, &qword_255096148);
    v22 = 0;
  }
  else
  {
    v59 = v80;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(a1, v22, 1, v59);
}

uint64_t sub_21972AB24@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int *v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE v122[144];
  _BYTE v123[144];
  uint64_t v124;
  __int128 v125;
  ValueMetadata *v126;
  unint64_t v127;
  uint64_t v128;
  _QWORD v129[22];
  unsigned __int8 v130;
  uint64_t v131;
  unsigned __int8 v132;
  uint64_t v133;
  uint64_t v134;

  v103 = a2;
  v5 = sub_219752480();
  v6 = *(_QWORD *)(v5 - 8);
  v98 = v5;
  v99 = v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v93 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v97 = (char *)&v90 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096288);
  v95 = *(_QWORD *)(v10 - 8);
  v96 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v94 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096290);
  v113 = *(_QWORD *)(v12 - 8);
  v114 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v100 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096298);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v118 = (uint64_t)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v119 = (uint64_t)&v90 - v17;
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962A0);
  MEMORY[0x24BDAC7A8](v104);
  v19 = (uint64_t *)((char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962A8);
  MEMORY[0x24BDAC7A8](v102);
  v21 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962B0);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v117 = (uint64_t)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v120 = (uint64_t)&v90 - v25;
  v26 = type metadata accessor for NetworkListRowView();
  v91 = *(_QWORD *)(v26 - 8);
  v27 = *(_QWORD *)(v91 + 64);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v92 = (uint64_t)&v90 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v101 = (uint64_t)&v90 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (id *)((char *)&v90 - v31);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962B8);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v116 = (uint64_t)&v90 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v121 = (uint64_t)&v90 - v36;
  v129[3] = &type metadata for SwiftListFeatureFlags;
  v37 = sub_21973073C();
  v129[4] = v37;
  v38 = sub_2197523B4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v129);
  sub_219730C60(a1, (uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  if ((v38 & 1) != 0)
  {
    v39 = (char *)v32[1];
    sub_219730CA4((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v40 = &v39[OBJC_IVAR___WFNetworkRowConfig_isEditable];
    swift_beginAccess();
    LOBYTE(v40) = *v40;

    if ((v40 & 1) != 0)
    {
      v41 = v121;
      sub_21972B65C(v121);
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962C8);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 0, 1, v42);
      goto LABEL_6;
    }
  }
  else
  {
    sub_219730CA4((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  }
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v121, 1, 1, v43);
LABEL_6:
  v44 = *(char **)(a1 + 8);
  v45 = &v44[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
  swift_beginAccess();
  if ((*v45 & 1) != 0)
  {
    v109 = 0;
    v110 = 0;
    v107 = 0;
    v108 = 0;
    v105 = 0;
    v106 = 0;
    v111 = 2;
    v112 = 0;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v46 = v44;
    sub_219752408();

    swift_release();
    swift_release();
    v112 = v129[0];
    sub_2197528D0();
    v111 = 1;
    sub_219752450();
    v109 = v130;
    v110 = v129[21];
    v107 = v132;
    v108 = v131;
    v105 = v134;
    v106 = v133;
  }
  v47 = v103;
  sub_21972B870((uint64_t)&v124);
  sub_2197310EC((uint64_t)&v124, (uint64_t)v129, &qword_2550962D0);
  v48 = objc_msgSend(v47, sel_isInstantHotspot);
  v115 = a3;
  if (v48)
  {
    v49 = sub_21975257C();
    sub_21972DE44(v47, (uint64_t)&v124);
    v50 = v124;
    v51 = (char)v126;
    v52 = v127;
    v53 = v128;
    v54 = v125;
    *(_QWORD *)v21 = v49;
    *((_QWORD *)v21 + 1) = 0;
    v21[16] = 1;
    *((_QWORD *)v21 + 3) = v50;
    *((_OWORD *)v21 + 2) = v54;
    v21[48] = v51;
    *((_QWORD *)v21 + 7) = v52;
    *((_QWORD *)v21 + 8) = v53;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550962D8);
    sub_2197299AC(&qword_2550962E0, &qword_2550962D8, MEMORY[0x24BDF4498]);
    sub_2197299AC(&qword_2550962E8, &qword_2550962A0, MEMORY[0x24BDF5428]);
    sub_219752678();
  }
  else
  {
    sub_21972BEF4(v47, v19);
    sub_219731034((uint64_t)v19, (uint64_t)v21, &qword_2550962A0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550962D8);
    sub_2197299AC(&qword_2550962E0, &qword_2550962D8, MEMORY[0x24BDF4498]);
    sub_2197299AC(&qword_2550962E8, &qword_2550962A0, MEMORY[0x24BDF5428]);
    sub_219752678();
    sub_219731078((uint64_t)v19, &qword_2550962A0);
  }
  v56 = v113;
  v55 = v114;
  v126 = &type metadata for SwiftListFeatureFlags;
  v127 = v37;
  v57 = sub_2197523B4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v124);
  v58 = 1;
  if ((v57 & 1) != 0)
  {
    v59 = *(_QWORD *)(a1 + 80);
    LOBYTE(v124) = *(_BYTE *)(a1 + 72);
    *(_QWORD *)&v125 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255096158);
    sub_219752864();
    v60 = v123[0];
    v61 = v101;
    sub_219730C60(a1, v101, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    if (v60 == 1)
    {
      v62 = (char *)*(id *)(v61 + 8);
      sub_219730CA4(v61, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v63 = &v62[OBJC_IVAR___WFNetworkRowConfig_isEditable];
      swift_beginAccess();
      LOBYTE(v63) = *v63;

      v64 = (uint64_t)v100;
      if ((v63 & 1) != 0)
      {
        v65 = v92;
        sub_219730C60(a1, v92, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
        v66 = (*(unsigned __int8 *)(v91 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
        v67 = swift_allocObject();
        sub_21972F7F8(v65, v67 + v66);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255096300);
        sub_2197309EC();
        v68 = v94;
        sub_21975287C();
        v69 = v97;
        sub_219752474();
        v70 = v98;
        (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v93, v69, v98);
        sub_21972996C(&qword_255096340, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC860], MEMORY[0x24BDEC858]);
        v114 = sub_21975245C();
        v71 = v95;
        v72 = v96;
        (*(void (**)(uint64_t, char *, uint64_t))(v95 + 16))(v64, v68, v96);
        v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962F8);
        *(_QWORD *)(v64 + *(int *)(v73 + 36)) = v114;
        (*(void (**)(char *, uint64_t))(v99 + 8))(v69, v70);
        (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v72);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56))(v64, 0, 1, v73);
LABEL_18:
        sub_2197310EC(v64, v119, &qword_255096290);
        v58 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      sub_219730CA4(v61, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v64 = (uint64_t)v100;
    }
    v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550962F8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v64, 1, 1, v74);
    goto LABEL_18;
  }
LABEL_19:
  v75 = v119;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v119, v58, 1, v55);
  v76 = v116;
  sub_219731034(v121, v116, &qword_2550962B8);
  sub_2197310EC((uint64_t)v129, (uint64_t)v122, &qword_2550962D0);
  v77 = v120;
  v78 = v117;
  sub_219731034(v120, v117, &qword_2550962B0);
  v79 = v118;
  sub_219731034(v75, v118, &qword_255096298);
  v80 = v115;
  sub_219731034(v76, v115, &qword_2550962B8);
  v81 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2550962F0);
  v82 = (_QWORD *)(v80 + v81[12]);
  v83 = v111;
  *v82 = v112;
  v82[1] = v83;
  v84 = v109;
  v82[2] = v110;
  v82[3] = v84;
  v85 = v107;
  v82[4] = v108;
  v82[5] = v85;
  v86 = v105;
  v82[6] = v106;
  v82[7] = v86;
  v87 = v80 + v81[16];
  sub_2197310EC((uint64_t)v122, (uint64_t)v123, &qword_2550962D0);
  sub_2197310EC((uint64_t)v123, v87, &qword_2550962D0);
  v88 = v80 + v81[20];
  *(_QWORD *)v88 = 0;
  *(_BYTE *)(v88 + 8) = 1;
  sub_219731034(v78, v80 + v81[24], &qword_2550962B0);
  sub_219731034(v79, v80 + v81[28], &qword_255096298);
  sub_219730894((uint64_t)v123, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_2197307A0);
  sub_219730894((uint64_t)v129, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_2197307A0);
  sub_219731078(v75, &qword_255096298);
  sub_219731078(v77, &qword_2550962B0);
  sub_219730894((uint64_t)v129, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_2197308F8);
  sub_219731078(v121, &qword_2550962B8);
  sub_219731078(v79, &qword_255096298);
  sub_219731078(v78, &qword_2550962B0);
  sub_2197310EC((uint64_t)v122, (uint64_t)&v124, &qword_2550962D0);
  sub_219730894((uint64_t)&v124, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_2197308F8);
  return sub_219731078(v76, &qword_2550962B8);
}

uint64_t sub_21972B65C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];
  ValueMetadata *v20;
  unint64_t v21;

  v3 = type metadata accessor for NetworkListRowView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096348);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v20 = &type metadata for SwiftListFeatureFlags;
  v21 = sub_21973073C();
  v10 = sub_2197523B4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  if ((v10 & 1) != 0)
  {
    v11 = (_BYTE *)(*(_QWORD *)(v1 + 8) + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
    swift_beginAccess();
    if (*v11 == 1)
    {
      sub_219730C60(v1, (uint64_t)&v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v13 = swift_allocObject();
      sub_21972F7F8((uint64_t)&v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v13 + v12);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255096358);
      sub_219730B40();
      sub_21975287C();
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096350);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 0, 1, v14);
    }
    else
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096350);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
    }
    sub_2197310EC((uint64_t)v9, a1, &qword_255096348);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, v15, 1, v6);
}

uint64_t sub_21972B870@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  _BYTE v62[144];
  __int128 v63;
  _BYTE v64[32];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _OWORD v77[2];
  id v78[20];

  v2 = v1;
  v4 = type metadata accessor for NetworkListRowView();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v52 - v8;
  v10 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = v10;
  sub_219752408();

  swift_release();
  swift_release();
  if (v78[0]
    && (v12 = objc_msgSend(v78[0], sel_title), swift_unknownObjectRelease(), v12))
  {
    v13 = sub_2197529A8();
    v15 = v14;

    sub_219730C60(v2, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    if (v15)
    {
      v58 = a1;
      goto LABEL_9;
    }
  }
  else
  {
    sub_219730C60(v1, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  }
  v70 = *((_OWORD *)v9 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096278);
  sub_219752864();
  if ((_QWORD)v63)
  {
    v16 = objc_msgSend((id)v63, sel_title);
    swift_unknownObjectRelease();
    if (v16)
    {
      v58 = a1;
      v13 = sub_2197529A8();
      v15 = v17;

LABEL_9:
      sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v18 = *(void **)(v2 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v19 = v18;
      sub_219752408();

      swift_release();
      swift_release();
      v20 = *((_QWORD *)&v70 + 1);
      sub_219730C60(v2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      if (!v20)
      {
        v33 = (void *)*((_QWORD *)v7 + 1);
        swift_getKeyPath();
        swift_getKeyPath();
        v34 = v33;
        sub_219752408();

        swift_release();
        swift_release();
        if (!(_QWORD)v70
          || (v35 = objc_msgSend((id)v70, sel_subtitle),
              swift_unknownObjectRelease(),
              !v35))
        {
          sub_219730CA4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
          *(_QWORD *)&v70 = v13;
          *((_QWORD *)&v70 + 1) = v15;
          sub_21972F9DC();
          v36 = sub_219752798();
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v43 = sub_2197526CC();
          v44 = sub_2197526D8();
          v45 = sub_2197526F0();
          sub_2197526F0();
          if (sub_2197526F0() != v43)
            v45 = sub_2197526F0();
          sub_2197526F0();
          v46 = sub_2197526F0();
          a1 = v58;
          if (v46 != v44)
            v45 = sub_2197526F0();
          sub_21975242C();
          *(_QWORD *)&v63 = v36;
          *((_QWORD *)&v63 + 1) = v38;
          v64[0] = v40 & 1;
          *(_QWORD *)&v64[8] = v42;
          v64[16] = v45;
          *(_QWORD *)&v64[24] = v47;
          *(_QWORD *)&v65 = v48;
          *((_QWORD *)&v65 + 1) = v49;
          *(_QWORD *)&v66 = v50;
          BYTE8(v66) = 0;
          sub_2197310E0((uint64_t)&v63);
          sub_2197310EC((uint64_t)&v63, (uint64_t)v62, &qword_255096440);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255096448);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255096450);
          sub_219731130();
          sub_2197311B4(&qword_255096470, &qword_255096450, MEMORY[0x24BDECC60], MEMORY[0x24BDED308]);
          sub_219752678();
          goto LABEL_24;
        }
        sub_2197529A8();

      }
      sub_219730CA4((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v57 = sub_2197525D0();
      sub_21972DCC8(v13, v15, v2, (uint64_t)&v70);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v70;
      v22 = v71;
      v23 = *((_QWORD *)&v71 + 1);
      v24 = v72;
      v55 = v73;
      v56 = *((_QWORD *)&v72 + 1);
      v54 = BYTE8(v73);
      v53 = v74;
      v25 = sub_2197526CC();
      v26 = sub_2197526D8();
      v27 = sub_2197526F0();
      sub_2197526F0();
      if (sub_2197526F0() != v25)
        v27 = sub_2197526F0();
      sub_2197526F0();
      if (sub_2197526F0() != v26)
        v27 = sub_2197526F0();
      sub_21975242C();
      v61 = 1;
      v60 = v22;
      v59 = 0;
      v63 = (unint64_t)v57;
      v64[0] = 1;
      *(_OWORD *)&v64[8] = v21;
      v64[24] = v22;
      *(_QWORD *)&v65 = v23;
      *((_QWORD *)&v65 + 1) = v24;
      *(_QWORD *)&v66 = v56;
      *((_QWORD *)&v66 + 1) = v55;
      LOBYTE(v67) = v54;
      *((_QWORD *)&v67 + 1) = v53;
      LOBYTE(v68) = v27;
      *((_QWORD *)&v68 + 1) = v28;
      *(_QWORD *)&v69[0] = v29;
      *((_QWORD *)&v69[0] + 1) = v30;
      *(_QWORD *)&v69[1] = v31;
      BYTE8(v69[1]) = 0;
      sub_21973121C((uint64_t)&v63);
      sub_2197310EC((uint64_t)&v63, (uint64_t)v62, &qword_255096440);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255096448);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255096450);
      sub_219731130();
      sub_2197311B4(&qword_255096470, &qword_255096450, MEMORY[0x24BDECC60], MEMORY[0x24BDED308]);
      sub_219752678();
      a1 = v58;
LABEL_24:
      v68 = v76;
      v69[0] = v77[0];
      *(_OWORD *)((char *)v69 + 10) = *(_OWORD *)((char *)v77 + 10);
      *(_OWORD *)&v64[16] = v72;
      v65 = v73;
      v66 = v74;
      v67 = v75;
      v63 = v70;
      *(_OWORD *)v64 = v71;
      nullsub_1(&v63);
      v32 = &v63;
      goto LABEL_25;
    }
  }
  sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  sub_2197310B4((uint64_t)&v70);
  v32 = &v70;
LABEL_25:
  sub_2197310EC((uint64_t)v32, (uint64_t)v78, &qword_2550962D0);
  return sub_2197310EC((uint64_t)v78, a1, &qword_2550962D0);
}

uint64_t sub_21972BEF4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t KeyPath;
  uint64_t *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;

  v132 = a2;
  v4 = sub_2197524F8();
  v120 = *(_QWORD *)(v4 - 8);
  v121 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v119 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_219752438();
  v117 = *(_QWORD *)(v118 - 8);
  MEMORY[0x24BDAC7A8](v118);
  v116 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_2197525C4();
  v111 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v110 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for NetworkListRowView();
  v96 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v97 = v9;
  v98 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096350);
  v107 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v105 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096378);
  v106 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  v103 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096380);
  MEMORY[0x24BDAC7A8](v99);
  v104 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096388);
  MEMORY[0x24BDAC7A8](v100);
  v112 = (uint64_t)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096390);
  MEMORY[0x24BDAC7A8](v102);
  v115 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096398);
  v128 = *(_QWORD *)(v15 - 8);
  v129 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v114 = (char *)&v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963A0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v131 = (uint64_t)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v130 = (char *)&v91 - v20;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963A8);
  MEMORY[0x24BDAC7A8](v92);
  v22 = (uint64_t *)((char *)&v91 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963B0);
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963B8);
  MEMORY[0x24BDAC7A8](v124);
  v25 = (char *)&v91 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963C0);
  MEMORY[0x24BDAC7A8](v123);
  v27 = (char *)&v91 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963C8);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v91 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963D0);
  v31 = MEMORY[0x24BDAC7A8](v122);
  v33 = (char *)&v91 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v91 - v34;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963D8);
  v37 = MEMORY[0x24BDAC7A8](v36);
  v127 = (uint64_t)&v91 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v133 = (uint64_t)&v91 - v39;
  v40 = objc_msgSend(a1, sel_isSecure);
  v41 = 0;
  v42 = 0;
  if (v40)
  {
    if ((objc_msgSend(a1, sel_isInstantHotspot) & 1) != 0)
    {
      v41 = 0;
      v42 = 0;
    }
    else
    {
      v41 = sub_21975284C();
      v42 = (sub_219752684() << 32) | 0x101;
    }
  }
  v125 = v42;
  v126 = v41;
  v43 = objc_msgSend(a1, sel_iOSHotspot);
  v101 = v2;
  if (v43)
  {
    sub_21972E108();
    v44 = sub_219752714();
    KeyPath = swift_getKeyPath();
    sub_219731034((uint64_t)v30, (uint64_t)v33, &qword_2550963C8);
    v46 = (uint64_t *)&v33[*(int *)(v122 + 36)];
    *v46 = KeyPath;
    v46[1] = v44;
    sub_219731078((uint64_t)v30, &qword_2550963C8);
    sub_2197310EC((uint64_t)v33, (uint64_t)v35, &qword_2550963D0);
    sub_219731034((uint64_t)v35, (uint64_t)v27, &qword_2550963D0);
    swift_storeEnumTagMultiPayload();
    sub_219730D74();
    sub_219730DF8();
    sub_219752678();
    sub_219731078((uint64_t)v35, &qword_2550963D0);
    v47 = *(char **)(v2 + 8);
    v48 = (uint64_t)v130;
  }
  else
  {
    v47 = *(char **)(v2 + 8);
    v49 = &v47[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
    swift_beginAccess();
    if ((*v49 & 1) != 0)
    {
      v50 = 1;
      v48 = (uint64_t)v130;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v51 = v47;
      sub_219752408();

      swift_release();
      swift_release();
      if (v134 == 1)
      {
        sub_21972E270(3, (uint64_t)v30);
        sub_219731034((uint64_t)v30, (uint64_t)v22, &qword_2550963C8);
        swift_storeEnumTagMultiPayload();
        sub_219730CF0();
        v52 = (uint64_t)v93;
        sub_219752678();
        sub_219731078((uint64_t)v30, &qword_2550963C8);
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        v53 = v51;
        sub_219752408();

        swift_release();
        swift_release();
        sub_21972F448(v134, (uint64_t)v30);
        sub_219730CF0();
        v54 = sub_21972E528(v28);
        sub_219731078((uint64_t)v30, &qword_2550963C8);
        *v22 = v54;
        swift_storeEnumTagMultiPayload();
        v52 = (uint64_t)v93;
        sub_219752678();
      }
      v48 = (uint64_t)v130;
      sub_2197310EC(v52, (uint64_t)v25, &qword_2550963B0);
      v50 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v25, v50, 1, v95);
    sub_219731034((uint64_t)v25, (uint64_t)v27, &qword_2550963B8);
    swift_storeEnumTagMultiPayload();
    sub_219730D74();
    sub_219730DF8();
    sub_219752678();
    sub_219731078((uint64_t)v25, &qword_2550963B8);
  }
  v55 = &v47[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  v56 = v129;
  if (*v55 == 1)
  {
    v57 = v98;
    sub_219730C60(v101, v98, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v58 = (*(unsigned __int8 *)(v96 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
    v59 = swift_allocObject();
    sub_21972F7F8(v57, v59 + v58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255096358);
    sub_219730B40();
    v60 = v105;
    sub_21975287C();
    v61 = v110;
    sub_2197525B8();
    sub_2197299AC(&qword_255096420, &qword_255096350, MEMORY[0x24BDF43B0]);
    sub_21972996C(&qword_255096428, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEDC8], MEMORY[0x24BDEEDB8]);
    v62 = v103;
    v63 = v109;
    v64 = v113;
    sub_2197527C8();
    (*(void (**)(char *, uint64_t))(v111 + 8))(v61, v64);
    (*(void (**)(char *, uint64_t))(v107 + 8))(v60, v63);
    v65 = v106;
    v66 = (uint64_t)v104;
    v67 = v108;
    (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v104, v62, v108);
    *(_WORD *)(v66 + *(int *)(v99 + 36)) = 256;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v67);
    LODWORD(v67) = sub_219752684();
    v68 = v112;
    sub_219731034(v66, v112, &qword_255096380);
    *(_DWORD *)(v68 + *(int *)(v100 + 36)) = v67;
    sub_219731078(v66, &qword_255096380);
    v69 = v117;
    v70 = v116;
    v71 = v118;
    (*(void (**)(char *, _QWORD, uint64_t))(v117 + 104))(v116, *MEMORY[0x24BDEB480], v118);
    v72 = swift_getKeyPath();
    v73 = (uint64_t)v115;
    v74 = (uint64_t *)&v115[*(int *)(v102 + 36)];
    v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096430);
    (*(void (**)(char *, char *, uint64_t))(v69 + 16))((char *)v74 + *(int *)(v75 + 28), v70, v71);
    *v74 = v72;
    sub_219731034(v68, v73, &qword_255096388);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
    sub_219731078(v68, &qword_255096388);
    v76 = v119;
    sub_2197524EC();
    v77 = swift_getKeyPath();
    v78 = (uint64_t)v114;
    v79 = (uint64_t *)&v114[*(int *)(v56 + 36)];
    v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096438);
    v82 = v120;
    v81 = v121;
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))((char *)v79 + *(int *)(v80 + 28), v76, v121);
    *v79 = v77;
    sub_219731034(v73, v78, &qword_255096390);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v76, v81);
    sub_219731078(v73, &qword_255096390);
    sub_2197310EC(v78, v48, &qword_255096398);
    v83 = 0;
  }
  else
  {
    v83 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56))(v48, v83, 1, v56);
  v84 = v133;
  v85 = v127;
  sub_219731034(v133, v127, &qword_2550963D8);
  v86 = v131;
  sub_219731034(v48, v131, &qword_2550963A0);
  v87 = v132;
  v88 = v125;
  *v132 = v126;
  v87[1] = v88;
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096418);
  sub_219731034(v85, (uint64_t)v87 + *(int *)(v89 + 48), &qword_2550963D8);
  sub_219731034(v86, (uint64_t)v87 + *(int *)(v89 + 64), &qword_2550963A0);
  swift_retain();
  sub_219731078(v48, &qword_2550963A0);
  sub_219731078(v84, &qword_2550963D8);
  sub_219731078(v86, &qword_2550963A0);
  sub_219731078(v85, &qword_2550963D8);
  return swift_release();
}

uint64_t sub_21972CC88()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096158);
  return sub_219752870();
}

uint64_t sub_21972CCD8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  id v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;

  v5 = sub_219752348();
  if (!v5)
  {
    v21 = 0u;
    v22 = 0u;
LABEL_14:
    sub_219731078((uint64_t)&v21, &qword_255096280);
    v10 = 0;
    v11 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  *(_QWORD *)&v21 = 0x4E6B726F7774656ELL;
  *((_QWORD *)&v21 + 1) = 0xEB00000000656D61;
  sub_219752AEC();
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_2197395C0((uint64_t)v20), (v8 & 1) != 0))
  {
    sub_219730700(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v21);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2197306CC((uint64_t)v20);
  if (!*((_QWORD *)&v22 + 1))
    goto LABEL_14;
  v9 = swift_dynamicCast();
  if (v9)
    v10 = v20[0];
  else
    v10 = 0;
  if (v9)
    v11 = v20[1];
  else
    v11 = 0;
LABEL_15:
  v12 = objc_msgSend(a2, sel_ssid);
  if (!v12)
  {
    if (!v11)
      goto LABEL_26;
    return swift_bridgeObjectRelease();
  }
  v13 = v12;
  v14 = sub_2197529A8();
  v16 = v15;

  if (!v11)
  {
    if (!v16)
      goto LABEL_26;
    return swift_bridgeObjectRelease();
  }
  if (!v16)
    return swift_bridgeObjectRelease();
  if (v10 == v14 && v11 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = sub_219752BE8();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
      return result;
  }
LABEL_26:
  v19 = *(id *)(a3 + 8);
  sub_2197432BC(1);
  swift_getKeyPath();
  swift_getKeyPath();
  v20[0] = 1;
  return sub_219752414();
}

uint64_t sub_21972CEF4(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  char **v22;
  unsigned int v23;
  id v24;
  void (*v25)(char *, id, uint64_t);
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  int v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  unsigned int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t result;
  uint64_t v50;
  int v51;
  id v52;
  id v53;
  char v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  char v61;
  id v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  id v67;
  id v68[6];
  __int128 v69;
  __int128 v70;

  v67 = a1;
  v3 = type metadata accessor for NetworkListRowView();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v62 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v62 - v10;
  v12 = sub_219752354();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v65 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v66 = (char *)&v62 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v62 - v18;
  v20 = *(void **)(a2 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v21 = v20;
  sub_219752408();

  swift_release();
  swift_release();
  v22 = &selRef__showRecommendationSupportLink;
  v64 = v6;
  if (v68[0])
  {
    v23 = objc_msgSend(v68[0], sel_isInstantHotspot);
    swift_unknownObjectRelease();
  }
  else
  {
    v23 = 0;
  }
  v24 = v67;
  v25 = *(void (**)(char *, id, uint64_t))(v13 + 16);
  v25(v19, v67, v12);
  sub_219730C60(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  if (!v23)
  {
    sub_219730CA4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30 = *(void (**)(char *, uint64_t))(v13 + 8);
    v30(v19, v12);
    v31 = v66;
LABEL_34:
    sub_219730C60(a2, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v25(v31, v24, v12);
    goto LABEL_35;
  }
  v26 = sub_219752348();
  v63 = a2;
  if (!v26)
  {
    v69 = 0u;
    v70 = 0u;
LABEL_18:
    sub_219731078((uint64_t)&v69, &qword_255096280);
    v62 = 0;
    v34 = 0;
    goto LABEL_19;
  }
  v27 = v26;
  *(_QWORD *)&v69 = 0x4E6B726F7774656ELL;
  *((_QWORD *)&v69 + 1) = 0xEB00000000656D61;
  sub_219752AEC();
  if (*(_QWORD *)(v27 + 16) && (v28 = sub_2197395C0((uint64_t)v68), (v29 & 1) != 0))
  {
    sub_219730700(*(_QWORD *)(v27 + 56) + 32 * v28, (uint64_t)&v69);
  }
  else
  {
    v69 = 0u;
    v70 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2197306CC((uint64_t)v68);
  if (!*((_QWORD *)&v70 + 1))
    goto LABEL_18;
  v32 = swift_dynamicCast();
  v33 = v68[0];
  if (!v32)
    v33 = 0;
  v62 = v33;
  if (v32)
    v34 = v68[1];
  else
    v34 = 0;
LABEL_19:
  v35 = (void *)*((_QWORD *)v11 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  v36 = v35;
  sub_219752408();

  swift_release();
  swift_release();
  v37 = v68[0];
  if (v68[0])
  {
    v38 = objc_msgSend(v68[0], sel_ssid);
    swift_unknownObjectRelease();
    if (v38)
    {
      v39 = sub_2197529A8();
      v37 = v40;

      if (!v34)
      {
LABEL_29:
        sub_219730CA4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
        v30 = *(void (**)(char *, uint64_t))(v13 + 8);
        v30(v19, v12);
        a2 = v63;
        if (v37)
        {
          swift_bridgeObjectRelease();
LABEL_33:
          v31 = v66;
          v24 = v67;
          v22 = &selRef__showRecommendationSupportLink;
          goto LABEL_34;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v39 = 0;
      v37 = 0;
      if (!v34)
        goto LABEL_29;
    }
  }
  else
  {
    v39 = 0;
    if (!v34)
      goto LABEL_29;
  }
  if (!v37)
  {
    swift_bridgeObjectRetain();
    sub_219730CA4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30 = *(void (**)(char *, uint64_t))(v13 + 8);
    v30(v19, v12);
    swift_bridgeObjectRelease_n();
    a2 = v63;
    goto LABEL_33;
  }
  if (v62 == (id)v39 && v34 == v37)
  {
    swift_bridgeObjectRelease();
    sub_219730CA4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30 = *(void (**)(char *, uint64_t))(v13 + 8);
    v30(v19, v12);
    swift_bridgeObjectRelease();
    a2 = v63;
LABEL_31:
    v31 = v66;
    v41 = v67;
    sub_219730C60(a2, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v25(v31, v41, v12);
LABEL_51:
    v30(v31, v12);
    sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    goto LABEL_52;
  }
  v54 = sub_219752BE8();
  swift_bridgeObjectRelease();
  sub_219730CA4((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  v30 = *(void (**)(char *, uint64_t))(v13 + 8);
  v30(v19, v12);
  swift_bridgeObjectRelease();
  a2 = v63;
  sub_219730C60(v63, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  v31 = v66;
  v25(v66, v67, v12);
  v22 = &selRef__showRecommendationSupportLink;
  if ((v54 & 1) != 0)
    goto LABEL_51;
LABEL_35:
  *(_OWORD *)v68 = *((_OWORD *)v9 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096278);
  sub_219752864();
  if (!(_QWORD)v69)
  {
    v43 = v65;
    v25(v65, v31, v12);
    v44 = (uint64_t)v64;
    sub_219730C60((uint64_t)v9, (uint64_t)v64, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    goto LABEL_42;
  }
  v42 = objc_msgSend((id)v69, v22[482]);
  swift_unknownObjectRelease();
  v43 = v65;
  v25(v65, v31, v12);
  v44 = (uint64_t)v64;
  sub_219730C60((uint64_t)v9, (uint64_t)v64, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  if (!v42)
  {
LABEL_42:
    sub_219730CA4(v44, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30(v43, v12);
    v30(v31, v12);
    return sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  }
  v45 = sub_219752348();
  if (!v45)
  {
    v50 = v44;
    v69 = 0u;
    v70 = 0u;
LABEL_54:
    sub_219731078((uint64_t)&v69, &qword_255096280);
    v67 = 0;
    v53 = 0;
    goto LABEL_55;
  }
  v46 = v45;
  *(_QWORD *)&v69 = 0x4E6B726F7774656ELL;
  *((_QWORD *)&v69 + 1) = 0xEB00000000656D61;
  sub_219752AEC();
  if (*(_QWORD *)(v46 + 16) && (v47 = sub_2197395C0((uint64_t)v68), (v48 & 1) != 0))
  {
    sub_219730700(*(_QWORD *)(v46 + 56) + 32 * v47, (uint64_t)&v69);
  }
  else
  {
    v69 = 0u;
    v70 = 0u;
  }
  v50 = v44;
  swift_bridgeObjectRelease();
  sub_2197306CC((uint64_t)v68);
  if (!*((_QWORD *)&v70 + 1))
    goto LABEL_54;
  v51 = swift_dynamicCast();
  v52 = v68[0];
  if (!v51)
    v52 = 0;
  v67 = v52;
  if (v51)
    v53 = v68[1];
  else
    v53 = 0;
LABEL_55:
  *(_OWORD *)v68 = *(_OWORD *)(v50 + 16);
  sub_219752864();
  v56 = (id)v69;
  if (!(_QWORD)v69)
  {
    v59 = 0;
    if (v53)
      goto LABEL_63;
    goto LABEL_59;
  }
  v57 = a2;
  v58 = objc_msgSend((id)v69, sel_ssid);
  swift_unknownObjectRelease();
  if (v58)
  {
    v59 = sub_2197529A8();
    v56 = v60;

  }
  else
  {
    v59 = 0;
    v56 = 0;
  }
  a2 = v57;
  v31 = v66;
  if (!v53)
  {
LABEL_59:
    sub_219730CA4(v50, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30(v65, v12);
    v30(v31, v12);
    sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    if (v56)
      return swift_bridgeObjectRelease();
LABEL_52:
    v55 = *(id *)(a2 + 8);
    sub_2197432BC(0);
    swift_getKeyPath();
    swift_getKeyPath();
    v68[0] = 0;
    return sub_219752414();
  }
LABEL_63:
  if (v56)
  {
    if (v67 == (id)v59 && v53 == v56)
    {
      swift_bridgeObjectRelease();
      sub_219730CA4(v50, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      v30(v65, v12);
      v30(v31, v12);
      sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    v61 = sub_219752BE8();
    swift_bridgeObjectRelease();
    sub_219730CA4(v50, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30(v65, v12);
    v30(v31, v12);
    sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    result = swift_bridgeObjectRelease();
    if ((v61 & 1) != 0)
      goto LABEL_52;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_219730CA4(v50, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    v30(v65, v12);
    v30(v31, v12);
    sub_219730CA4((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_21972D84C(uint64_t a1)
{
  void (*v1)(void);

  v1 = *(void (**)(void))(a1 + 56);
  if (v1)
    v1();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096158);
  sub_219752864();
  sub_219752870();
  return swift_release();
}

uint64_t sub_21972D8EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _OWORD *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096338);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (uint64_t)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_2197524D4();
  MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v5 = sub_219752360();
  v7 = v6;

  v39 = v5;
  v40 = v7;
  sub_21972F9DC();
  v8 = sub_219752798();
  v10 = v9;
  v12 = v11 & 1;
  sub_219752804();
  v13 = sub_219752774();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release();
  LOBYTE(v5) = v17 & 1;
  sub_21972FA20(v8, v10, v12);
  swift_bridgeObjectRelease();
  v20 = sub_2197527F8();
  v21 = sub_2197526C0();
  v22 = v35;
  v23 = &v35[*(int *)(v36 + 20)];
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_219752594();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  __asm { FMOV            V0.2D, #5.0 }
  *v22 = _Q0;
  v31 = v37;
  sub_219730C60((uint64_t)v22, v37, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v31 + *(int *)(v38 + 36)) = 256;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096300);
  sub_219731034(v31, a1 + *(int *)(v32 + 36), &qword_255096338);
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v19;
  *(_QWORD *)(a1 + 32) = v20;
  *(_BYTE *)(a1 + 40) = v21;
  sub_219730884(v13, v15, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_219731078(v31, &qword_255096338);
  sub_219730CA4((uint64_t)v22, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  sub_21972FA20(v13, v15, v5);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21972DBAC()
{
  sub_2197528E8();
  sub_219752468();
  return swift_release();
}

uint64_t sub_21972DC08()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096158);
  sub_219752864();
  sub_219752870();
  return swift_release();
}

uint64_t sub_21972DCA4@<X0>(uint64_t *a1@<X8>)
{
  return sub_21972E5BC(MEMORY[0x24BDF3C78], a1);
}

uint64_t sub_21972DCC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  id v14;
  __int128 v16;
  uint64_t v17;

  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  sub_21972F9DC();
  swift_bridgeObjectRetain();
  v6 = sub_219752798();
  v8 = v7;
  v10 = v9;
  v12 = v11 & 1;
  v13 = *(void **)(a3 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v14 = v13;
  sub_219752408();

  swift_release();
  swift_release();
  sub_219752858();
  sub_219752858();
  *(_QWORD *)a4 = v6;
  *(_QWORD *)(a4 + 8) = v8;
  *(_BYTE *)(a4 + 16) = v12;
  *(_QWORD *)(a4 + 24) = v10;
  *(_OWORD *)(a4 + 32) = v16;
  *(_QWORD *)(a4 + 48) = v17;
  *(_BYTE *)(a4 + 56) = v16;
  *(_QWORD *)(a4 + 64) = *((_QWORD *)&v16 + 1);
  sub_219730884(v6, v8, v12);
  swift_bridgeObjectRetain();
  sub_21972FA20(v6, v8, v12);
  return swift_bridgeObjectRelease();
}

void sub_21972DE44(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  id v36;

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedImageCache);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  v6 = (void *)sub_219752984();
  v7 = objc_msgSend(a1, sel_hotspotSignalStrength);
  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v8 = v7;
  objc_msgSend(v7, sel_doubleValue);
  v10 = v9;

  v11 = objc_msgSend(v5, sel_imageNamed_variableValue_, v6, fmin(v10 * 0.25, 1.0));
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v35 = sub_219752834();
  v12 = objc_msgSend(a1, sel_hotspotCellularProtocol);
  v36 = a1;
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13 = v12;
  sub_2197529A8();

  sub_21972F9DC();
  v14 = sub_219752798();
  v16 = v15;
  v18 = v17 & 1;
  sub_219752714();
  v19 = sub_21975278C();
  v21 = v20;
  v23 = v22;
  swift_release();
  sub_21972FA20(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_21975281C();
  v24 = sub_219752774();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  swift_release();
  sub_21972FA20(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v36, sel_hotspotBatteryLife);
  if (v31)
  {
    v32 = v31;
    objc_msgSend(v31, sel_doubleValue);
    v34 = v33;

    *(_QWORD *)a2 = v35;
    *(_QWORD *)(a2 + 8) = v24;
    *(_QWORD *)(a2 + 16) = v26;
    *(_BYTE *)(a2 + 24) = v28 & 1;
    *(_QWORD *)(a2 + 32) = v30;
    *(double *)(a2 + 40) = v34 / 100.0;
    swift_retain();
    sub_219730884(v24, v26, v28 & 1);
    swift_bridgeObjectRetain();
    sub_21972FA20(v24, v26, v28 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_21972E108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];

  v0 = sub_2197525AC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_21975284C();
  sub_219752588();
  sub_2197527E0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2197525A0();
  sub_2197524B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_219731078((uint64_t)v6, &qword_2550963C8);
}

uint64_t sub_21972E270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15[1] = a2;
  v3 = sub_2197525AC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2197523A8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_219752978();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_219752960();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_219752840();
  sub_219752954();
  sub_219752948();
  v16 = a1;
  sub_21975293C();
  sub_219752948();
  sub_21975296C();
  sub_219752378();
  v16 = sub_2197529B4();
  v17 = v13;
  sub_21972F9DC();
  sub_2197527EC();
  swift_release();
  swift_bridgeObjectRelease();
  sub_2197525A0();
  sub_2197524B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_219731078((uint64_t)v12, &qword_2550963C8);
}

uint64_t sub_21972E528(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
  return sub_219752894();
}

uint64_t sub_21972E5A4@<X0>(uint64_t *a1@<X8>)
{
  return sub_21972E5BC(MEMORY[0x24BDF3D88], a1);
}

uint64_t sub_21972E5BC@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = sub_21975284C();
  v5 = a1();
  result = swift_getKeyPath();
  *a2 = v4;
  a2[1] = result;
  a2[2] = v5;
  return result;
}

uint64_t property wrapper backing initializer of NetworkSubtitleView.text()
{
  uint64_t v1;

  sub_219752858();
  return v1;
}

uint64_t _s9WiFiKitUI18NetworkListRowViewV9isEditing33_CE11F58EAA9817AD86B6658FF4D95328LLSbvpfP_0()
{
  unsigned __int8 v1;

  sub_219752858();
  return v1;
}

double NetworkSubtitleView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  double result;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255096158);
  sub_219752864();
  *(_QWORD *)&v36 = *(_QWORD *)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096160);
  sub_219752864();
  if (v34 == 1)
  {
    *((_QWORD *)&v35 + 1) = *((_QWORD *)&v34 + 1);
    sub_21972F9DC();
    v3 = sub_219752798();
    v5 = v4;
    v7 = v6 & 1;
    sub_219752744();
    v8 = sub_21975278C();
    v10 = v9;
    v12 = v11;
    swift_release();
    sub_21972FA20(v3, v5, v7);
    swift_bridgeObjectRelease();
    sub_21975272C();
    v13 = sub_219752768();
    v15 = v14;
    v17 = v16 & 1;
    sub_21972FA20(v8, v10, v12 & 1);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v35 = sub_219752810();
    sub_219752780();
    sub_21972FA20(v13, v15, v17);
    swift_release();
  }
  else
  {
    v35 = v34;
    sub_21972F9DC();
    v18 = sub_219752798();
    v20 = v19;
    v22 = v21 & 1;
    sub_219752744();
    v23 = sub_21975278C();
    v25 = v24;
    v27 = v26;
    swift_release();
    sub_21972FA20(v18, v20, v22);
    swift_bridgeObjectRelease();
    sub_219752738();
    v28 = sub_219752768();
    v30 = v29;
    v32 = v31 & 1;
    sub_21972FA20(v23, v25, v27 & 1);
    swift_bridgeObjectRelease();
    LODWORD(v35) = sub_219752684();
    sub_219752780();
    sub_21972FA20(v28, v30, v32);
  }
  swift_bridgeObjectRelease();
  sub_219752678();
  result = *(double *)&v35;
  *(_OWORD *)a1 = v35;
  *(_OWORD *)(a1 + 16) = v36;
  *(_BYTE *)(a1 + 32) = v37;
  return result;
}

Swift::Void __swiftcall NetworkListRow.prepareForReuse()()
{
  void *v0;
  _OWORD v1[2];
  uint64_t v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NetworkListRow();
  objc_msgSendSuper2(&v3, sel_prepareForReuse);
  v2 = 0;
  memset(v1, 0, sizeof(v1));
  MEMORY[0x219A324D4](v1);
}

void *NetworkListRow.config.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void NetworkListRow.config.setter(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;

  v3 = (id *)(v1 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*v3)
  {
    v6 = *v3;
    sub_21972F07C(v6);

    v5 = v6;
  }

}

void (*NetworkListRow.config.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___WFNetworkListRow_config;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_21972EC94;
}

void sub_21972EC94(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  id v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      v5 = v4;
      sub_21972F07C(v5);

    }
  }
  free(v3);
}

id NetworkListRow.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id NetworkListRow.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  void *v4;
  id v5;
  objc_super v7;

  *(_QWORD *)&v3[OBJC_IVAR___WFNetworkListRow_config] = 0;
  if (a3)
  {
    v4 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for NetworkListRow();
  v5 = objc_msgSendSuper2(&v7, sel_initWithStyle_reuseIdentifier_, 0, v4);

  return v5;
}

id NetworkListRow.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NetworkListRow.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR___WFNetworkListRow_config] = 0;

  sub_219752B70();
  __break(1u);
}

Swift::Void __swiftcall NetworkListRow.configure(_:)(WFNetworkRowConfig *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  WFNetworkRowConfig *v5;
  void *v6;
  WFNetworkRowConfig *v7;

  v3 = (void **)(v1 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = *v3;
  v7 = v5;
  if (v6)
  {
    v7 = v6;
    sub_21972F07C(v7);

  }
  sub_21972F07C(v5);
}

void sub_21972F07C(void *a1)
{
  char *v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11[5];

  type metadata accessor for WFNetworkRowConfigModel();
  v2 = static WFNetworkRowConfigModel.modelFrom(rowConfig:)(a1);
  if (v2)
  {
    v3 = v2;
    MEMORY[0x24BDAC7A8](v2);
    v11[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255096260);
    v11[4] = sub_2197299AC(&qword_255096268, &qword_255096260, MEMORY[0x24BDEFEA0]);
    __swift_allocate_boxed_opaque_existential_1(v11);
    type metadata accessor for NetworkListRowView();
    sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
    sub_21975269C();
    MEMORY[0x219A324D4](v11);

  }
  else
  {
    if (qword_255095E80 != -1)
      swift_once();
    v4 = sub_2197523D8();
    __swift_project_value_buffer(v4, (uint64_t)qword_255098550);
    v10 = a1;
    v5 = sub_2197523C0();
    v6 = sub_219752A50();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v11[0] = (uint64_t)v10;
      v9 = v10;
      sub_219752A98();
      *v8 = v10;

      _os_log_impl(&dword_2196CC000, v5, v6, "Fail to construct WFNetworkRowConfigModel from config: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255096258);
      swift_arrayDestroy();
      MEMORY[0x219A32EB8](v8, -1, -1);
      MEMORY[0x219A32EB8](v7, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_21972F308@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v13;

  v6 = type metadata accessor for NetworkListRowView();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a2, sel_network);
  v10 = (uint64_t (*)())objc_msgSend(a2, sel_infoButtonHandler);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_2197306BC;
  }
  else
  {
    v11 = 0;
  }
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)v10, v11, 0, 0, (uint64_t)v8);
  return sub_21972F7F8((uint64_t)v8, a3);
}

id NetworkListRow.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListRow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21972F448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15[1] = a2;
  v3 = sub_2197525AC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2197523A8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_219752978();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_219752960();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550963C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_219752840();
  sub_219752954();
  sub_219752948();
  v16 = a1;
  sub_21975293C();
  sub_219752948();
  sub_21975296C();
  sub_219752378();
  v16 = sub_2197529B4();
  v17 = v13;
  sub_21972F9DC();
  sub_2197527EC();
  swift_release();
  swift_bridgeObjectRelease();
  sub_2197525A0();
  sub_2197524B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_219731078((uint64_t)v12, &qword_2550963C8);
}

uint64_t sub_21972F6F8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21972F774(uint64_t a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *a2;
  v3 = (void *)swift_unknownObjectRetain();
  sub_2197427F4(v3);
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  return sub_219752414();
}

uint64_t sub_21972F7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NetworkListRowView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21972F83C(uint64_t a1)
{
  return sub_21972F990(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21972CC88);
}

uint64_t sub_21972F848()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for NetworkListRowView();
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  swift_unknownObjectRelease();
  v3 = v0 + v2;

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + v2 + 32))
    swift_release();
  if (*(_QWORD *)(v3 + 56))
    swift_release();
  swift_release();
  v4 = v3 + v1[10];
  v5 = sub_219752A8C();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + v1[11], v5);
  v6(v3 + v1[12], v5);
  return swift_deallocObject();
}

uint64_t sub_21972F940(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkListRowView() - 8) + 80);
  return sub_21972CCD8(a1, *(void **)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_21972F984(uint64_t a1)
{
  return sub_21972F990(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21972CEF4);
}

uint64_t sub_21972F990(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkListRowView() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_21972F9DC()
{
  unint64_t result;

  result = qword_2550965C0;
  if (!qword_2550965C0)
  {
    result = MEMORY[0x219A32E40](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2550965C0);
  }
  return result;
}

uint64_t sub_21972FA20(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for NetworkListRow()
{
  return objc_opt_self();
}

uint64_t sub_21972FA50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21972FA60()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for NetworkListRowView(_QWORD *a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v10 = a2 + 4;
    v9 = a2[4];
    v11 = v7;
    swift_unknownObjectRetain();
    swift_retain();
    if (v9)
    {
      v12 = a2[5];
      v4[4] = v9;
      v4[5] = v12;
      swift_retain();
    }
    else
    {
      *((_OWORD *)v4 + 2) = *v10;
    }
    v14 = a2[7];
    v4[6] = a2[6];
    if (v14)
    {
      v15 = a2[8];
      v4[7] = v14;
      v4[8] = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v4 + 7) = *(_OWORD *)(a2 + 7);
    }
    *((_BYTE *)v4 + 72) = *((_BYTE *)a2 + 72);
    v4[10] = a2[10];
    v16 = a3[10];
    v17 = (char *)v4 + v16;
    v18 = (uint64_t)a2 + v16;
    v19 = sub_219752A8C();
    v20 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    swift_retain();
    v20(v17, v18, v19);
    v20((char *)v4 + a3[11], (uint64_t)a2 + a3[11], v19);
    v20((char *)v4 + a3[12], (uint64_t)a2 + a3[12], v19);
  }
  return v4;
}

uint64_t destroy for NetworkListRowView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(a1 + 32))
    swift_release();
  if (*(_QWORD *)(a1 + 56))
    swift_release();
  swift_release();
  v4 = a1 + a2[10];
  v5 = sub_219752A8C();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  v7(a1 + a2[11], v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + a2[12], v5);
}

uint64_t initializeWithCopy for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);

  v6 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = (_OWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 32);
  v10 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  if (v8)
  {
    v11 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *v9;
  }
  v12 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  if (v12)
  {
    v13 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v12;
    *(_QWORD *)(a1 + 64) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v14 = a3[10];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_219752A8C();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  swift_retain();
  v18(v15, v16, v17);
  v18(a1 + a3[11], a2 + a3[11], v17);
  v18(a1 + a3[12], a2 + a3[12], v17);
  return a1;
}

uint64_t assignWithCopy for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(void **)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v8 = v6;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 40) = v10;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v9)
  {
    v11 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v11;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_8:
  v12 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v13 = *(_QWORD *)(a2 + 56);
  if (!v12)
  {
    if (v13)
    {
      v15 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v13;
      *(_QWORD *)(a1 + 64) = v15;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_14;
  }
  v14 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v14;
  swift_retain();
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  v16 = a3[10];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_219752A8C();
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(a1 + a3[11], a2 + a3[11], v19);
  v20(a1 + a3[12], a2 + a3[12], v19);
  return a1;
}

uint64_t initializeWithTake for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = v9;
    *(_QWORD *)(a1 + 64) = v10;
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v11 = a3[10];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_219752A8C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(a1 + a3[11], a2 + a3[11], v14);
  v15(a1 + a3[12], a2 + a3[12], v14);
  return a1;
}

uint64_t assignWithTake for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v8 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v8;
      *(_QWORD *)(a1 + 40) = v9;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 40) = v10;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_8:
  v11 = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  if (!v12)
  {
    if (v11)
    {
      v14 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v11;
      *(_QWORD *)(a1 + 64) = v14;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_14;
  }
  v13 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v13;
  swift_release();
LABEL_15:
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  v15 = a3[10];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_219752A8C();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[11], a2 + a3[11], v18);
  v19(a1 + a3[12], a2 + a3[12], v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkListRowView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2197301F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_219752A8C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for NetworkListRowView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_219730280(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_219752A8C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2197302F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_219752A8C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for NetworkSubtitleView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NetworkSubtitleView()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for NetworkSubtitleView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NetworkSubtitleView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for NetworkSubtitleView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkSubtitleView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkSubtitleView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkSubtitleView()
{
  return &type metadata for NetworkSubtitleView;
}

unint64_t sub_2197305C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255096230;
  if (!qword_255096230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096238);
    v2 = sub_2197299AC((unint64_t *)&unk_255096240, &qword_255096148, MEMORY[0x24BDEDA68]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255096230);
  }
  return result;
}

uint64_t sub_219730644()
{
  return sub_2197311B4((unint64_t *)&qword_255096C30, &qword_255096250, MEMORY[0x24BDF1F80], MEMORY[0x24BDEF3E0]);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_219730690@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21972F308(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_219730698()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2197306BC()
{
  uint64_t v0;

  return sub_21974258C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2197306CC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_219730700(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21973073C()
{
  unint64_t result;

  result = qword_2550962C0;
  if (!qword_2550962C0)
  {
    result = MEMORY[0x219A32E40](&unk_219759B70, &type metadata for SwiftListFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2550962C0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2197307A0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned __int16 a18)
{
  if (HIBYTE(a18) <= 0xFEu)
    return sub_2197307F8(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, (unsigned __int16)(a18 & 0x1FF) >> 8);
  return result;
}

uint64_t sub_2197307F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, char a19)
{
  if ((a19 & 1) != 0)
  {
    sub_219730884(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  else
  {
    sub_219730884(a4, a5, a6 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
}

uint64_t sub_219730884(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_219730894(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))
{
  __int16 v4;

  v4 = *(_WORD *)(a1 + 136);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), v4);
  return a1;
}

uint64_t sub_2197308F8(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned __int16 a18)
{
  if (HIBYTE(a18) <= 0xFEu)
    return sub_219730950(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, (unsigned __int16)(a18 & 0x1FF) >> 8);
  return result;
}

uint64_t sub_219730950(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, char a19)
{
  if ((a19 & 1) != 0)
  {
    sub_21972FA20(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_21972FA20(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_2197309E0()
{
  return sub_219730B04(sub_21972D84C);
}

unint64_t sub_2197309EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096308;
  if (!qword_255096308)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096300);
    v2[0] = sub_219730A70();
    v2[1] = sub_2197299AC(&qword_255096330, &qword_255096338, MEMORY[0x24BDEB950]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096308);
  }
  return result;
}

unint64_t sub_219730A70()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255096310;
  if (!qword_255096310)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096318);
    v2 = sub_2197299AC(&qword_255096320, &qword_255096328, MEMORY[0x24BDF06D0]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096310);
  }
  return result;
}

uint64_t sub_219730AF8()
{
  return sub_219730B04((uint64_t (*)(uint64_t))sub_21972DBAC);
}

uint64_t sub_219730B04(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkListRowView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

unint64_t sub_219730B40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255096360;
  if (!qword_255096360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096358);
    v2 = sub_2197299AC((unint64_t *)&unk_255096B60, &qword_255096370, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096360);
  }
  return result;
}

uint64_t sub_219730BC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2197524F8();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_219752540();
}

uint64_t sub_219730C48()
{
  return sub_21972DC08();
}

uint64_t sub_219730C60(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_219730CA4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_219730CF0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2550963E0;
  if (!qword_2550963E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550963C8);
    v2 = sub_21972996C(&qword_2550963E8, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2550963E0);
  }
  return result;
}

unint64_t sub_219730D74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2550963F0;
  if (!qword_2550963F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550963D0);
    v2[0] = sub_219730CF0();
    v2[1] = sub_2197299AC((unint64_t *)&unk_255096B70, &qword_255096400, MEMORY[0x24BDF1028]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550963F0);
  }
  return result;
}

unint64_t sub_219730DF8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255096408;
  if (!qword_255096408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550963B8);
    v2 = sub_219730E5C();
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255096408);
  }
  return result;
}

unint64_t sub_219730E5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096410;
  if (!qword_255096410)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550963B0);
    v2[0] = sub_219730CF0();
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096410);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for NetworkListRowView();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v2 + 32))
    swift_release();
  if (*(_QWORD *)(v2 + 56))
    swift_release();
  swift_release();
  v3 = v2 + v1[10];
  v4 = sub_219752A8C();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v2 + v1[11], v4);
  v5(v2 + v1[12], v4);
  return swift_deallocObject();
}

uint64_t sub_219730FBC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(void);

  result = type metadata accessor for NetworkListRowView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = *(uint64_t (**)(void))(v0 + ((v2 + 16) & ~v2) + 32);
  if (v3)
    return v3();
  return result;
}

uint64_t sub_219731008()
{
  return sub_219752534();
}

uint64_t sub_219731034(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_219731078(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_2197310B4(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_WORD *)(a1 + 136) = -256;
  return result;
}

uint64_t sub_2197310E0(uint64_t result)
{
  *(_BYTE *)(result + 137) = 1;
  return result;
}

uint64_t sub_2197310EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_219731130()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096458;
  if (!qword_255096458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096448);
    v2[0] = sub_2197299AC(&qword_255096460, &qword_255096468, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096458);
  }
  return result;
}

uint64_t sub_2197311B4(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = MEMORY[0x24BDF1F80];
    v9[1] = a3;
    result = MEMORY[0x219A32E40](a4, v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21973121C(uint64_t result)
{
  *(_BYTE *)(result + 137) = 0;
  return result;
}

uint64_t getEnumTagSinglePayload for SwiftListFeatureFlags(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SwiftListFeatureFlags(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2197312B8 + 4 * byte_219759730[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2197312D8 + 4 * byte_219759735[v4]))();
}

_BYTE *sub_2197312B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2197312D8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2197312E0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2197312E8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2197312F0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2197312F8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_219731304()
{
  return 0;
}

ValueMetadata *type metadata accessor for SwiftListFeatureFlags()
{
  return &type metadata for SwiftListFeatureFlags;
}

unint64_t sub_219731320()
{
  unint64_t result;

  result = qword_255096478;
  if (!qword_255096478)
  {
    result = MEMORY[0x219A32E40](&unk_219759B48, &type metadata for SwiftListFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_255096478);
  }
  return result;
}

unint64_t sub_219731364(uint64_t a1)
{
  return sub_21973139C(a1, &qword_255096620, &qword_255096628, (uint64_t (*)(uint64_t))sub_219739540);
}

unint64_t sub_219731380(uint64_t a1)
{
  return sub_21973139C(a1, &qword_255096610, &qword_255096618, (uint64_t (*)(uint64_t))sub_219739540);
}

unint64_t sub_21973139C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_219752BA0();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_219731034(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_21973D204(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2197314C4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D8);
  v2 = (_QWORD *)sub_219752BA0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2197395F0(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2197315E4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.currentNetwork(uint64_t a1)
{
  return sub_21973163C(a1, &qword_255096480);
}

uint64_t sub_21973161C()
{
  return sub_219731690();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.currentNetworkRowConfig(uint64_t a1)
{
  return sub_21973163C(a1, &qword_255096488);
}

uint64_t sub_21973163C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return sub_2197523FC();
}

uint64_t sub_21973167C()
{
  return sub_219731690();
}

uint64_t sub_219731690()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t property wrapper backing initializer of NetworkListDataSource.listMode()
{
  return sub_2197523FC();
}

uint64_t sub_219731728()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21973179C()
{
  return sub_219731690();
}

uint64_t sub_2197317B4()
{
  return sub_219731690();
}

uint64_t sub_2197317CC()
{
  return sub_219731690();
}

uint64_t sub_2197317E4()
{
  return sub_219731690();
}

uint64_t sub_2197317FC()
{
  return sub_219731690();
}

uint64_t sub_219731814()
{
  return sub_219731690();
}

uint64_t _s9WiFiKitUI21NetworkListDataSourceC13knownNetworksSayAA23WFNetworkRowConfigModelCGvpfP_0()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  return sub_2197523FC();
}

uint64_t sub_219731870()
{
  return sub_219731690();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.isScanning()
{
  return sub_2197523FC();
}

uint64_t sub_2197318B0()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t property wrapper backing initializer of NetworkListDataSource.unconfiguredNetworksSectionTitle()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096790);
  return sub_2197523FC();
}

uint64_t sub_219731964()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NetworkListDataSource.networksToBeDeleted.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t NetworkListDataSource.networksToBeDeleted.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void (**v4)(uint64_t);
  uint64_t result;
  void (*v6)(uint64_t);
  uint64_t v7;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  v4 = (void (**)(uint64_t))(v1 + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    sub_2197283A8((uint64_t)v6);
    v7 = swift_bridgeObjectRetain();
    v6(v7);
    sub_219731D9C((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*NetworkListDataSource.networksToBeDeleted.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_219731B28;
}

void sub_219731B28(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void (**v4)(uint64_t);
  void (*v5)(uint64_t);
  uint64_t v6;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (void (**)(uint64_t))(v3[3]
                                       + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
    swift_beginAccess();
    v5 = *v4;
    if (*v4)
    {
      sub_2197283A8((uint64_t)v5);
      v6 = swift_bridgeObjectRetain();
      v5(v6);
      sub_219731D9C((uint64_t)v5);
      swift_bridgeObjectRelease();
    }
  }
  free(v3);
}

uint64_t NetworkListDataSource.networkTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_networkTapHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListDataSource.networkTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_networkTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListDataSource.networkTapHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.infoButtonTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListDataSource.infoButtonTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListDataSource.infoButtonTapHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.associationHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_associationHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListDataSource.associationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_associationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListDataSource.associationHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.pendingDeletingNetworksChangedCallback.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListDataSource.pendingDeletingNetworksChangedCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListDataSource.pendingDeletingNetworksChangedCallback.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.otherNetworkTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (void (*)(_QWORD, _QWORD))sub_2197283A8);
}

uint64_t NetworkListDataSource.otherNetworkTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_219731D9C);
}

uint64_t sub_219731D9C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*NetworkListDataSource.otherNetworkTapHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t sub_219731E08(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t sub_219731E7C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_219731F1C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char **v19;
  void *v20;
  unint64_t v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  char **v25;
  void *v26;
  char *v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  char **v31;
  uint64_t i;
  void *v33;
  unint64_t v34;
  id v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  unint64_t v41;
  id v42;
  _QWORD *v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _QWORD *v68;
  void *v69;
  id v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t result;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t aBlock[8];

  v1 = sub_219752900();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v78 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_219752918();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2197523D8();
  v6 = *(_QWORD *)(v5 - 8);
  v83 = v5;
  v84 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v87 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = OBJC_IVAR___WFNetworkListDataSource_scanResults;
  v8 = v0;
  v9 = swift_bridgeObjectRetain();
  v10 = 0;
  v11 = sub_21973AEAC(v9);
  swift_bridgeObjectRelease();

  if (v11 < 0 || (v11 & 0x4000000000000000) != 0)
  {
    v27 = v8;
    v28 = swift_bridgeObjectRetain();
    v12 = (uint64_t)sub_21973996C(v28);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v11 & 0xFFFFFFFFFFFFFF8;
    v13 = v8;
    swift_bridgeObjectRetain();
  }
  aBlock[0] = v12;
  v14 = v8;
  sub_21973BE9C(aBlock, (void *)v14);
  v79 = v2;
  swift_bridgeObjectRelease();

  v82 = aBlock[0];
  v15 = *(_QWORD *)&v0[v89];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v80 = v1;
  if ((unint64_t)v15 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_219752B7C();
  }
  else
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v17 = (unint64_t)&selRef__showRecommendationSupportLink;
  v88 = v0;
  if (v16)
  {
    if (v16 < 1)
    {
      __break(1u);
      goto LABEL_115;
    }
    v85 = v14;
    v18 = 0;
    v19 = &selRef__showRecommendationSupportLink;
    do
    {
      if ((v15 & 0xC000000000000001) != 0)
      {
        v20 = (void *)MEMORY[0x219A32588](v18, v15);
      }
      else
      {
        v20 = *(void **)(v15 + 8 * v18 + 32);
        swift_unknownObjectRetain();
      }
      if (!objc_msgSend(v20, sel_isPopular)
        || (objc_msgSend(v20, sel_isKnown) & 1) != 0
        || (objc_msgSend(v20, sel_isInstantHotspot) & 1) != 0
        || (objc_msgSend(v20, v19[465]) & 1) != 0
        || (objc_msgSend(v20, sel_isUnconfiguredAccessory) & 1) != 0)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        sub_219752B28();
        v86 = v10;
        sub_219752B40();
        v10 = v86;
        sub_219752B4C();
        sub_219752B34();
        v19 = &selRef__showRecommendationSupportLink;
      }
      ++v18;
    }
    while (v16 != v18);
    swift_bridgeObjectRelease();
    v21 = aBlock[0];
    v0 = v88;
    v14 = v85;
  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
  }
  v14 = (uint64_t)(id)v14;
  swift_retain();
  if ((v21 & 0x8000000000000000) != 0 || (v22 = (_QWORD *)v21, (v21 & 0x4000000000000000) != 0))
  {
    v22 = sub_21973996C(v21);
    swift_release();
  }
  aBlock[0] = (uint64_t)v22;
  v23 = (id)v14;
  sub_21973BE9C(aBlock, v23);
  if (v10)
  {

    goto LABEL_125;
  }
  swift_release();

  v86 = aBlock[0];
  v15 = *(_QWORD *)&v0[v89];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  if (!((unint64_t)v15 >> 62))
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_27;
LABEL_47:
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
    goto LABEL_48;
  }
  if (v15 < 0)
    v14 = v15;
  else
    v14 = v15 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v16 = sub_219752B7C();
  if (!v16)
    goto LABEL_47;
LABEL_27:
  if (v16 < 1)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  v81 = (uint64_t)v23;
  v24 = 0;
  v25 = &selRef__showRecommendationSupportLink;
  do
  {
    if ((v15 & 0xC000000000000001) != 0)
    {
      v26 = (void *)MEMORY[0x219A32588](v24, v15);
    }
    else
    {
      v26 = *(void **)(v15 + 8 * v24 + 32);
      swift_unknownObjectRetain();
    }
    if ((objc_msgSend(v26, sel_isInstantHotspot) & 1) != 0
      || (objc_msgSend(v26, v25[465]) & 1) != 0
      || (objc_msgSend(v26, sel_isUnconfiguredAccessory) & 1) != 0
      || (objc_msgSend(v26, sel_isPopular) & 1) != 0
      || (objc_msgSend(v26, sel_isKnown) & 1) != 0)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      sub_219752B28();
      v85 = v10;
      sub_219752B40();
      v10 = v85;
      sub_219752B4C();
      sub_219752B34();
      v25 = &selRef__showRecommendationSupportLink;
    }
    ++v24;
  }
  while (v16 != v24);
  swift_bridgeObjectRelease();
  v17 = aBlock[0];
  v0 = v88;
  v23 = (id)v81;
LABEL_48:
  v29 = v23;
  swift_retain();
  if ((v17 & 0x8000000000000000) != 0 || (v15 = v17, (v17 & 0x4000000000000000) != 0))
  {
    v15 = (uint64_t)sub_21973996C(v17);
    swift_release();
  }
  aBlock[0] = v15;
  v14 = (uint64_t)v29;
  sub_21973BE9C(aBlock, (void *)v14);
  if (v10)
  {

LABEL_125:
    result = swift_release();
    __break(1u);
    return result;
  }
  swift_release();

  v85 = aBlock[0];
  v16 = *(_QWORD *)&v0[v89];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  if (!((unint64_t)v16 >> 62))
  {
    v30 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v31 = &selRef__showRecommendationSupportLink;
    if (v30)
      goto LABEL_53;
LABEL_65:
    swift_bridgeObjectRelease();
    v34 = MEMORY[0x24BEE4AF8];
    goto LABEL_66;
  }
  swift_bridgeObjectRetain();
  v30 = sub_219752B7C();
  v31 = &selRef__showRecommendationSupportLink;
  if (!v30)
    goto LABEL_65;
LABEL_53:
  if (v30 < 1)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  for (i = 0; i != v30; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0)
    {
      v33 = (void *)MEMORY[0x219A32588](i, v16);
    }
    else
    {
      v33 = *(void **)(v16 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend(v33, v31[465]))
    {
      sub_219752B28();
      sub_219752B40();
      sub_219752B4C();
      sub_219752B34();
      v31 = &selRef__showRecommendationSupportLink;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  v34 = aBlock[0];
LABEL_66:
  v35 = (id)v14;
  swift_retain();
  v36 = v88;
  if ((v34 & 0x8000000000000000) != 0 || (v37 = (_QWORD *)v34, (v34 & 0x4000000000000000) != 0))
  {
    v37 = sub_21973996C(v34);
    swift_release();
  }
  aBlock[0] = (uint64_t)v37;
  v16 = (uint64_t)v35;
  sub_21973BE9C(aBlock, (void *)v16);
  swift_release();

  v81 = aBlock[0];
  v17 = *(_QWORD *)&v36[v89];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  v14 = (uint64_t)&selRef__showRecommendationSupportLink;
  if (!(v17 >> 62))
  {
    v38 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v38)
      goto LABEL_70;
LABEL_82:
    swift_bridgeObjectRelease();
    v41 = MEMORY[0x24BEE4AF8];
    goto LABEL_83;
  }
  swift_bridgeObjectRetain();
  v38 = sub_219752B7C();
  if (!v38)
    goto LABEL_82;
LABEL_70:
  if (v38 < 1)
  {
LABEL_117:
    __break(1u);
LABEL_118:
    swift_once();
    goto LABEL_90;
  }
  for (j = 0; j != v38; ++j)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      v40 = (void *)MEMORY[0x219A32588](j, v17);
    }
    else
    {
      v40 = *(void **)(v17 + 8 * j + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend(v40, sel_isUnconfiguredAccessory))
    {
      sub_219752B28();
      sub_219752B40();
      sub_219752B4C();
      sub_219752B34();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  v41 = aBlock[0];
LABEL_83:
  v42 = (id)v16;
  swift_retain();
  if ((v41 & 0x8000000000000000) != 0 || (v43 = (_QWORD *)v41, (v41 & 0x4000000000000000) != 0))
  {
    v43 = sub_21973996C(v41);
    swift_release();
  }
  aBlock[0] = (uint64_t)v43;
  v17 = (unint64_t)v42;
  sub_21973BE9C(aBlock, (void *)v17);
  swift_release();

  v10 = aBlock[0];
  v16 = v84;
  if (aBlock[0] < 0 || (aBlock[0] & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v14 = sub_219752B7C();
    swift_release();
  }
  else
  {
    v14 = *(_QWORD *)(aBlock[0] + 16);
  }
  v44 = v87;
  v15 = (uint64_t)&unk_255095000;
  if (v14 < 1)
    goto LABEL_93;
  if (qword_255095E80 != -1)
    goto LABEL_118;
LABEL_90:
  __swift_project_value_buffer(v83, (uint64_t)qword_255098550);
  v45 = sub_2197523C0();
  v46 = sub_219752A44();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)v47 = 136315138;
    v90 = sub_219738DB8(0x757365526E616373, 0xEB0000000073746CLL, aBlock);
    v16 = v84;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v45, v46, "%s:updating UnconfiguredSectionTitle because there's at least one unconfiguredNetworks", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v48, -1, -1);
    MEMORY[0x219A32EB8](v47, -1, -1);
  }

  sub_2197370A4();
  v44 = v87;
LABEL_93:
  v88 = (char *)v14;
  v89 = v17;
  if (*(_QWORD *)(v15 + 3712) != -1)
    swift_once();
  v49 = v83;
  v50 = __swift_project_value_buffer(v83, (uint64_t)qword_255098550);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v44, v50, v49);
  swift_retain_n();
  v51 = v82;
  swift_retain_n();
  v52 = v86;
  swift_retain_n();
  v53 = v85;
  swift_retain_n();
  v54 = v81;
  swift_retain_n();
  v55 = sub_2197523C0();
  v56 = sub_219752A44();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)v57 = 136316418;
    v90 = sub_219738DB8(0x757365526E616373, 0xEB0000000073746CLL, aBlock);
    sub_219752A98();
    *(_WORD *)(v57 + 12) = 2048;
    if (v51 < 0 || (v51 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v59 = sub_219752B7C();
      swift_release();
    }
    else
    {
      v59 = *(_QWORD *)(v51 + 16);
    }
    v60 = v56;
    swift_release();
    v90 = v59;
    sub_219752A98();
    swift_release();
    *(_WORD *)(v57 + 22) = 2048;
    v61 = v49;
    if (v86 < 0 || (v86 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v62 = sub_219752B7C();
      swift_release();
    }
    else
    {
      v62 = *(_QWORD *)(v86 + 16);
    }
    v63 = v55;
    swift_release();
    v90 = v62;
    sub_219752A98();
    swift_release();
    *(_WORD *)(v57 + 32) = 2048;
    v64 = (void *)v89;
    if (v85 < 0 || (v85 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v65 = sub_219752B7C();
      swift_release();
    }
    else
    {
      v65 = *(_QWORD *)(v85 + 16);
    }
    swift_release();
    v90 = v65;
    sub_219752A98();
    swift_release();
    *(_WORD *)(v57 + 42) = 2048;
    v54 = v81;
    if (v81 < 0 || (v81 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v66 = sub_219752B7C();
      swift_release();
    }
    else
    {
      v66 = *(_QWORD *)(v81 + 16);
    }
    swift_release();
    v90 = v66;
    sub_219752A98();
    swift_release();
    *(_WORD *)(v57 + 52) = 2048;
    swift_release();
    v90 = (uint64_t)v88;
    sub_219752A98();
    swift_release();
    _os_log_impl(&dword_2196CC000, v63, v60, "%s: known networks count:%ld, public networks count: %ld, infraNetworks count: %ld, adhocNetworks count: %ld, unconfiguredNetworks count: %ld", (uint8_t *)v57, 0x3Eu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v58, -1, -1);
    MEMORY[0x219A32EB8](v57, -1, -1);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v87, v61);
    v51 = v82;
    v53 = v85;
    v52 = v86;
  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v44, v49);
    v64 = (void *)v89;
  }
  sub_219739420();
  v67 = (void *)sub_219752A68();
  v68 = (_QWORD *)swift_allocObject();
  v68[2] = v64;
  v68[3] = v51;
  v68[4] = v52;
  v68[5] = v53;
  v68[6] = v54;
  v68[7] = v10;
  aBlock[4] = (uint64_t)sub_21973D2C0;
  aBlock[5] = (uint64_t)v68;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_173;
  v69 = _Block_copy(aBlock);
  v70 = v64;
  swift_release();
  v71 = v75;
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  v72 = v78;
  v73 = v80;
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v71, v72, v69);
  _Block_release(v69);

  (*(void (**)(char *, uint64_t))(v79 + 8))(v72, v73);
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v71, v77);
}

uint64_t sub_219732F54()
{
  sub_2197528E8();
  sub_219752468();
  return swift_release();
}

uint64_t sub_219732FB8(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t result;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v36 = MEMORY[0x24BEE4AF8];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_219752B7C();
    v12 = result;
  }
  else
  {
    v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v35 = a6;
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
      goto LABEL_63;
    }
    for (i = 0; i != v12; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0)
        MEMORY[0x219A32588](i, a2);
      else
        swift_unknownObjectRetain();
      WFNetworkListRecord.settingsModel.getter();
      v15 = swift_unknownObjectRelease();
      MEMORY[0x219A3245C](v15);
      if (*(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_219752A14();
      sub_219752A2C();
      sub_219752A08();
    }
  }
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v16 = a1;
  sub_219752414();
  v37 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_219752B7C();
    v17 = result;
    if (!result)
      goto LABEL_25;
  }
  else
  {
    v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v17)
      goto LABEL_25;
  }
  if (v17 < 1)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  for (j = 0; j != v17; ++j)
  {
    if ((a3 & 0xC000000000000001) != 0)
      MEMORY[0x219A32588](j, a3);
    else
      swift_unknownObjectRetain();
    WFNetworkListRecord.settingsModel.getter();
    v19 = swift_unknownObjectRelease();
    MEMORY[0x219A3245C](v19);
    if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_219752A14();
    sub_219752A2C();
    sub_219752A08();
  }
LABEL_25:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v20 = v16;
  sub_219752414();
  v38 = MEMORY[0x24BEE4AF8];
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_219752B7C();
    v21 = result;
    if (!result)
      goto LABEL_37;
  }
  else
  {
    v21 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v21)
      goto LABEL_37;
  }
  if (v21 < 1)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  for (k = 0; k != v21; ++k)
  {
    if ((a4 & 0xC000000000000001) != 0)
      MEMORY[0x219A32588](k, a4);
    else
      swift_unknownObjectRetain();
    WFNetworkListRecord.settingsModel.getter();
    v23 = swift_unknownObjectRelease();
    MEMORY[0x219A3245C](v23);
    if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_219752A14();
    sub_219752A2C();
    sub_219752A08();
  }
LABEL_37:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v24 = v20;
  sub_219752414();
  v39 = MEMORY[0x24BEE4AF8];
  v25 = a5;
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_219752B7C();
    v26 = result;
    if (!result)
      goto LABEL_49;
  }
  else
  {
    v26 = *(_QWORD *)((a5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v26)
      goto LABEL_49;
  }
  if (v26 < 1)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  v27 = 0;
  do
  {
    if ((a5 & 0xC000000000000001) != 0)
      MEMORY[0x219A32588](v27, v25);
    else
      swift_unknownObjectRetain();
    WFNetworkListRecord.settingsModel.getter();
    v28 = swift_unknownObjectRelease();
    MEMORY[0x219A3245C](v28);
    if (*(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_219752A14();
    ++v27;
    sub_219752A2C();
    sub_219752A08();
    v25 = a5;
  }
  while (v26 != v27);
LABEL_49:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v29 = v24;
  sub_219752414();
  v40 = MEMORY[0x24BEE4AF8];
  v30 = v35;
  if (!(v35 >> 62))
  {
    v31 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v31)
      goto LABEL_51;
LABEL_61:
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    v34 = v29;
    return sub_219752414();
  }
  swift_bridgeObjectRetain();
  result = sub_219752B7C();
  v31 = result;
  if (!result)
    goto LABEL_61;
LABEL_51:
  if (v31 >= 1)
  {
    v32 = 0;
    do
    {
      if ((v35 & 0xC000000000000001) != 0)
        MEMORY[0x219A32588](v32, v30);
      else
        swift_unknownObjectRetain();
      WFNetworkListRecord.settingsModel.getter();
      v33 = swift_unknownObjectRelease();
      MEMORY[0x219A3245C](v33);
      if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_219752A14();
      ++v32;
      sub_219752A2C();
      sub_219752A08();
      v30 = v35;
    }
    while (v31 != v32);
    goto LABEL_61;
  }
LABEL_66:
  __break(1u);
  return result;
}

void WFNetworkListRecord.settingsModel.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  void *v7;
  char *v8;
  float v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v1 = v0;
  v2 = sub_2197523D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WFNetworkRowConfigModel();
  v6 = static WFNetworkRowConfigModel.settingsNetworkRowConfig()();
  v7 = (void *)swift_unknownObjectRetain();
  sub_2197427F4(v7);
  swift_getKeyPath();
  swift_getKeyPath();
  v39 = (uint64_t)v1;
  v8 = v6;
  sub_219752414();
  objc_msgSend(v1, sel_scaledRSSI);
  v10 = sub_2197451A8(v9);
  sub_219743C14(v10);
  swift_getKeyPath();
  swift_getKeyPath();
  v39 = v10;
  v11 = v8;
  sub_219752414();
  v12 = objc_msgSend(v1, sel_subtitle);
  if (v12)
  {
    v13 = v12;
    v14 = sub_2197529A8();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  sub_219742D28(v14, v16);
  swift_getKeyPath();
  swift_getKeyPath();
  v39 = v14;
  v40 = v16;
  v17 = v11;
  sub_219752414();
  if (qword_255095E80 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v18, v2);
  swift_unknownObjectRetain_n();
  v19 = v17;
  v20 = sub_2197523C0();
  v21 = sub_219752A44();
  if (os_log_type_enabled(v20, v21))
  {
    v35 = v5;
    v36 = v3;
    v37 = v2;
    v22 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    v38 = v34;
    *(_DWORD *)v22 = 136315906;
    v39 = sub_219738DB8(0x73676E6974746573, 0xED00006C65646F4DLL, &v38);
    sub_219752A98();
    *(_WORD *)(v22 + 12) = 2080;
    v23 = objc_msgSend(v1, sel_ssid);
    if (v23)
    {
      v24 = v23;
      v25 = sub_2197529A8();
      v27 = v26;

      v39 = sub_219738DB8(v25, v27, &v38);
      sub_219752A98();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 22) = 2048;
      objc_msgSend(v1, sel_scaledRSSI);
      v29 = sub_2197451A8(v28);
      swift_unknownObjectRelease();
      v39 = v29;
      sub_219752A98();
      swift_unknownObjectRelease();
      *(_WORD *)(v22 + 32) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_219752408();
      swift_release();
      swift_release();
      if (v40)
        v30 = v39;
      else
        v30 = 0;
      if (v40)
        v31 = v40;
      else
        v31 = 0xE000000000000000;
      v39 = sub_219738DB8(v30, v31, &v38);
      sub_219752A98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2196CC000, v20, v21, "%s: network: %s, signal bar: %lu, subtitle: %s", (uint8_t *)v22, 0x2Au);
      v32 = v34;
      swift_arrayDestroy();
      MEMORY[0x219A32EB8](v32, -1, -1);
      MEMORY[0x219A32EB8](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
    }
    else
    {
      swift_unknownObjectRelease_n();

      __break(1u);
    }
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall NetworkListDataSource.updateCurrentNetworkConfig(newConfig:)(WFNetworkRowConfig_optional *newConfig)
{
  void *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFNetworkRowConfig_optional *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v3 = sub_219752900();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_219752918();
  v7 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2197376F0(newConfig);
  sub_219739420();
  v10 = (void *)sub_219752A68();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  *(_QWORD *)(v11 + 24) = newConfig;
  aBlock[4] = sub_219739488;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor_0;
  v12 = _Block_copy(aBlock);
  v13 = newConfig;
  v14 = v1;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v15);
}

uint64_t sub_219733DE0()
{
  sub_2197528E8();
  sub_219752468();
  return swift_release();
}

uint64_t sub_219733E3C(void *a1, id a2)
{
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;

  v4 = objc_msgSend(a2, sel_network);
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a1;
  sub_219752414();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v6 = (unint64_t)v4;
  v7 = a2;
  v8 = sub_21973BF80(v6, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  v9 = v5;
  sub_219752414();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v10 = v8;
  v11 = v7;
  v12 = sub_21973BF80(v10, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  v13 = v9;
  sub_219752414();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v14 = v11;
  v15 = sub_21973BF80(v12, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  v16 = v13;
  sub_219752414();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v17 = v14;
  sub_21973BF80(v15, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  v18 = v16;
  return sub_219752414();
}

uint64_t NetworkListDataSource.updateCurrentNetwork(newCurrentNetwork:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v3 = sub_219752900();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_219752918();
  v7 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219739420();
  v10 = (void *)sub_219752A68();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_2197394BC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor_20;
  v12 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  v13 = v1;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v15);
}

uint64_t sub_219734414(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  v2 = a1;
  return sub_219752414();
}

Swift::Void __swiftcall NetworkListDataSource.updateScanResults(newScanResults:)(Swift::OpaquePointer newScanResults)
{
  uint64_t v1;

  *(Swift::OpaquePointer *)(v1 + OBJC_IVAR___WFNetworkListDataSource_scanResults) = newScanResults;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_219731F1C();
}

Swift::Void __swiftcall NetworkListDataSource.updateScanning(newState:)(Swift::Bool newState)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v22 = v5;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v25 = sub_219738DB8(0xD000000000000019, 0x8000000219765530, aBlock);
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v25) = newState;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set scanning status: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    v17 = v16;
    v5 = v22;
    MEMORY[0x219A32EB8](v17, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v18 = (void *)sub_219752A68();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v2;
  *(_BYTE *)(v19 + 24) = newState;
  aBlock[4] = (uint64_t)sub_219739534;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_26;
  v20 = _Block_copy(aBlock);
  v21 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
}

uint64_t sub_219734914(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

uint64_t NetworkListDataSource.updateOtherNetworkTapHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (void (*)(uint64_t, uint64_t))sub_2197283A8, (uint64_t (*)(uint64_t, uint64_t))sub_219731D9C);
}

uint64_t NetworkListDataSource.updateInfoButtonHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t NetworkListDataSource.updateAssociationHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_associationHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t NetworkListDataSource.updatependingDeletingNetworksChangedCallback(newCallback:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

void sub_219734C80(uint64_t a1, uint64_t a2)
{
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
  v3 = (id)sub_2197529F0();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t NetworkListDataSource.updateUnconfiguredNetworksSectionTitleDelegate(newDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t sub_219734CF4(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v10 = (uint64_t *)(v5 + *a3);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = a1;
  v10[1] = a2;
  a4(a1, a2);
  return a5(v11, v12);
}

uint64_t sub_219734E0C(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
  v3 = (void *)sub_2197529F0();
  v4 = (id)(*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v3);

  v5 = sub_2197529A8();
  return v5;
}

Swift::Void __swiftcall NetworkListDataSource.updateManagedPreferredNetworks(newManagedPreferredNetworks:)(Swift::OpaquePointer newManagedPreferredNetworks)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14[3];
  uint64_t v15;

  if (((unint64_t)newManagedPreferredNetworks._rawValue & 0x8000000000000000) != 0
    || ((unint64_t)newManagedPreferredNetworks._rawValue & 0x4000000000000000) != 0)
  {
    v11 = v1;
    v12 = swift_bridgeObjectRetain();
    v2 = (uint64_t)sub_21973996C(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = (unint64_t)newManagedPreferredNetworks._rawValue & 0xFFFFFFFFFFFFFF8;
    v3 = v1;
    swift_bridgeObjectRetain();
  }
  v14[0] = v2;
  sub_21973BE9C(v14, v1);

  v4 = v14[0];
  v15 = MEMORY[0x24BEE4AF8];
  if ((v14[0] & 0x8000000000000000) == 0 && (v14[0] & 0x4000000000000000) == 0)
  {
    v5 = *(_QWORD *)(v14[0] + 16);
    swift_retain();
    if (v5)
      goto LABEL_7;
LABEL_18:
    swift_release();
    v10 = MEMORY[0x24BEE4AF8];
LABEL_19:
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v15 = v10;
    v13 = v1;
    sub_219752414();
    return;
  }
  swift_retain();
  v5 = sub_219752B7C();
  if (!v5)
    goto LABEL_18;
LABEL_7:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        MEMORY[0x219A32588](i, v4);
      else
        swift_unknownObjectRetain();
      WFNetworkListRecord.knownNetworksModel.getter();
      v8 = (_BYTE *)(v7 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
      swift_beginAccess();
      *v8 = 0;
      v9 = swift_unknownObjectRelease();
      MEMORY[0x219A3245C](v9);
      if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_219752A14();
      sub_219752A2C();
      sub_219752A08();
    }
    swift_release();
    v10 = v15;
    goto LABEL_19;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

void WFNetworkListRecord.knownNetworksModel.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v1 = v0;
  v2 = sub_2197523D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WFNetworkRowConfigModel();
  v6 = static WFNetworkRowConfigModel.knownNetworkRowConfig()();
  v7 = (void *)swift_unknownObjectRetain();
  sub_2197427F4(v7);
  swift_getKeyPath();
  swift_getKeyPath();
  v34 = (uint64_t)v1;
  v8 = v6;
  sub_219752414();
  v9 = objc_msgSend(v1, sel_subtitle);
  if (v9)
  {
    v10 = v9;
    v11 = sub_2197529A8();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  sub_219742D28(v11, v13);
  swift_getKeyPath();
  swift_getKeyPath();
  v34 = v11;
  v35 = v13;
  v14 = v8;
  sub_219752414();
  if (qword_255095E80 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  swift_unknownObjectRetain_n();
  v16 = v14;
  v17 = sub_2197523C0();
  v18 = sub_219752A44();
  if (os_log_type_enabled(v17, v18))
  {
    v30 = v5;
    v31 = v3;
    v32 = v2;
    v19 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    v33 = v29;
    *(_DWORD *)v19 = 136315650;
    v34 = sub_219738DB8(0xD000000000000012, 0x8000000219765550, &v33);
    sub_219752A98();
    *(_WORD *)(v19 + 12) = 2080;
    v20 = objc_msgSend(v1, sel_ssid);
    if (v20)
    {
      v21 = v20;
      v22 = sub_2197529A8();
      v24 = v23;

      v34 = sub_219738DB8(v22, v24, &v33);
      sub_219752A98();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 22) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_219752408();
      swift_release();
      swift_release();
      if (v35)
        v25 = v34;
      else
        v25 = 0;
      if (v35)
        v26 = v35;
      else
        v26 = 0xE000000000000000;
      v34 = sub_219738DB8(v25, v26, &v33);
      sub_219752A98();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2196CC000, v17, v18, "%s: network: %s, subtitle: %s", (uint8_t *)v19, 0x20u);
      v27 = v29;
      swift_arrayDestroy();
      MEMORY[0x219A32EB8](v27, -1, -1);
      MEMORY[0x219A32EB8](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v32);
    }
    else
    {
      swift_unknownObjectRelease();

      __break(1u);
    }
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall NetworkListDataSource.updateEditablePreferredNetworks(newEditablePreferredNetworks:)(Swift::OpaquePointer newEditablePreferredNetworks)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  if (((unint64_t)newEditablePreferredNetworks._rawValue & 0x8000000000000000) != 0
    || ((unint64_t)newEditablePreferredNetworks._rawValue & 0x4000000000000000) != 0)
  {
    v9 = v1;
    v10 = swift_bridgeObjectRetain();
    v2 = (uint64_t)sub_21973996C(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = (unint64_t)newEditablePreferredNetworks._rawValue & 0xFFFFFFFFFFFFFF8;
    v3 = v1;
    swift_bridgeObjectRetain();
  }
  v12 = v2;
  sub_21973BE9C(&v12, v1);

  v4 = v12;
  v12 = MEMORY[0x24BEE4AF8];
  if ((v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v5 = *(_QWORD *)(v4 + 16);
    swift_retain();
    if (v5)
      goto LABEL_7;
LABEL_18:
    swift_release();
    v8 = MEMORY[0x24BEE4AF8];
LABEL_19:
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    v12 = v8;
    v11 = v1;
    sub_219752414();
    return;
  }
  swift_retain();
  v5 = sub_219752B7C();
  if (!v5)
    goto LABEL_18;
LABEL_7:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        MEMORY[0x219A32588](i, v4);
      else
        swift_unknownObjectRetain();
      WFNetworkListRecord.knownNetworksModel.getter();
      v7 = swift_unknownObjectRelease();
      MEMORY[0x219A3245C](v7);
      if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_219752A14();
      sub_219752A2C();
      sub_219752A08();
    }
    swift_release();
    v8 = v12;
    goto LABEL_19;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

uint64_t sub_219735730(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6;
  id v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
  v6 = sub_2197529FC();
  v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall NetworkListDataSource.startEditingPreferredNetworks()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t aBlock[6];

  v1 = v0;
  v2 = sub_219752900();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_219752918();
  v22 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255095E80 != -1)
    swift_once();
  v9 = sub_2197523D8();
  __swift_project_value_buffer(v9, (uint64_t)qword_255098550);
  v10 = sub_2197523C0();
  v11 = sub_219752A44();
  if (os_log_type_enabled(v10, v11))
  {
    v20 = v1;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v21 = v3;
    v14 = v13;
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136315138;
    v23 = sub_219738DB8(0xD00000000000001FLL, 0x8000000219765570, aBlock);
    v1 = v20;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v10, v11, "%s: Transit to preferred network list.", v12, 0xCu);
    swift_arrayDestroy();
    v15 = v14;
    v3 = v21;
    MEMORY[0x219A32EB8](v15, -1, -1);
    MEMORY[0x219A32EB8](v12, -1, -1);
  }

  sub_219739420();
  v16 = (void *)sub_219752A68();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v1;
  aBlock[4] = (uint64_t)sub_21973C7B8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_44;
  v18 = _Block_copy(aBlock);
  v19 = v1;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
}

uint64_t sub_219735AE0()
{
  sub_2197528E8();
  sub_219752468();
  return swift_release();
}

uint64_t sub_219735B3C(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

Swift::Void __swiftcall NetworkListDataSource.switchToScanList()()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD aBlock[6];

  v1 = sub_219752900();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219752918();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219739420();
  v9 = (void *)sub_219752A68();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_21973C7C0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor_50;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_219735DE8(uint64_t a1)
{
  _QWORD *v2;
  void (**v3)(uint64_t);
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v2 = (_QWORD *)(a1 + OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted);
  swift_beginAccess();
  *v2 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v3 = (void (**)(uint64_t))(a1 + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    sub_2197283A8((uint64_t)v4);
    v5 = swift_bridgeObjectRetain();
    v4(v5);
    sub_219731D9C((uint64_t)v4);
    swift_bridgeObjectRelease();
  }
  if (qword_255095E80 != -1)
    swift_once();
  v6 = sub_2197523D8();
  __swift_project_value_buffer(v6, (uint64_t)qword_255098550);
  v7 = sub_2197523C0();
  v8 = sub_219752A44();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_219738DB8(0xD000000000000012, 0x8000000219765850, &v13);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v7, v8, "%s: Clearing network deletion buffer and transit back to scan list", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v10, -1, -1);
    MEMORY[0x219A32EB8](v9, -1, -1);
  }

  MEMORY[0x24BDAC7A8](v11);
  sub_2197528E8();
  sub_219752468();
  swift_release();
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_255095E88 != -1)
    swift_once();
  objc_msgSend(v12, sel_postNotificationName_object_userInfo_, qword_255098610, 0, 0);

}

uint64_t sub_2197360B8(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

id NetworkListDataSource.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NetworkListDataSource.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  objc_class *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;
  uint64_t v56;
  uint64_t v57;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550967B0);
  v53 = *(_QWORD *)(v1 - 8);
  v54 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v52 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E0);
  v50 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v49 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E8);
  v48 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964F0);
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964F8);
  v44 = *(_QWORD *)(v11 - 8);
  v45 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096500);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v0[OBJC_IVAR___WFNetworkListDataSource__currentNetwork];
  v56 = 0;
  v19 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096480);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v17, v14);
  v20 = &v19[OBJC_IVAR___WFNetworkListDataSource__currentNetworkRowConfig];
  v56 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096488);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v20, v13, v45);
  v21 = &v19[OBJC_IVAR___WFNetworkListDataSource__listMode];
  LOBYTE(v56) = 0;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v21, v10, v47);
  v22 = &v19[OBJC_IVAR___WFNetworkListDataSource__knownNetworks];
  v23 = MEMORY[0x24BEE4AF8];
  v56 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  sub_2197523FC();
  v24 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  v24(v22, v7, v5);
  v25 = &v19[OBJC_IVAR___WFNetworkListDataSource__publicNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v25, v7, v5);
  v26 = &v19[OBJC_IVAR___WFNetworkListDataSource__infraNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v26, v7, v5);
  v27 = &v19[OBJC_IVAR___WFNetworkListDataSource__adhocNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v27, v7, v5);
  v28 = &v19[OBJC_IVAR___WFNetworkListDataSource__unConfiguredNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v28, v7, v5);
  v29 = &v19[OBJC_IVAR___WFNetworkListDataSource__managedPreferredNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v29, v7, v5);
  v30 = &v19[OBJC_IVAR___WFNetworkListDataSource__editablePreferredNetworks];
  v56 = v23;
  sub_2197523FC();
  v24(v30, v7, v5);
  v31 = &v19[OBJC_IVAR___WFNetworkListDataSource__isScanning];
  LOBYTE(v56) = 0;
  v32 = v49;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v31, v32, v51);
  v33 = &v19[OBJC_IVAR___WFNetworkListDataSource__unconfiguredNetworksSectionTitle];
  v56 = 0;
  v57 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096790);
  v34 = v52;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v33, v34, v54);
  *(_QWORD *)&v19[OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted] = v23;
  v35 = &v19[OBJC_IVAR___WFNetworkListDataSource_networkTapHandler];
  *(_QWORD *)v35 = 0;
  *((_QWORD *)v35 + 1) = 0;
  v36 = &v19[OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler];
  *(_QWORD *)v36 = 0;
  *((_QWORD *)v36 + 1) = 0;
  v37 = &v19[OBJC_IVAR___WFNetworkListDataSource_associationHandler];
  *(_QWORD *)v37 = 0;
  *((_QWORD *)v37 + 1) = 0;
  v38 = &v19[OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback];
  *(_QWORD *)v38 = 0;
  *((_QWORD *)v38 + 1) = 0;
  v39 = &v19[OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler];
  *(_QWORD *)v39 = 0;
  *((_QWORD *)v39 + 1) = 0;
  v40 = &v19[OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate];
  *(_QWORD *)v40 = 0;
  *((_QWORD *)v40 + 1) = 0;
  *(_QWORD *)&v19[OBJC_IVAR___WFNetworkListDataSource_scanResults] = v23;

  v41 = (objc_class *)type metadata accessor for NetworkListDataSource();
  v55.receiver = v19;
  v55.super_class = v41;
  return objc_msgSendSuper2(&v55, sel_init);
}

uint64_t NetworkListDataSource.addPendingDeletingNetwork(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  void (**v10)(uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[2];

  v2 = v1;
  v4 = sub_2197523D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)(v1 + OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted);
  swift_beginAccess();
  v9 = swift_unknownObjectRetain();
  MEMORY[0x219A3245C](v9);
  if (*(_QWORD *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_219752A14();
  sub_219752A2C();
  sub_219752A08();
  swift_endAccess();
  v10 = (void (**)(uint64_t))(v2 + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  swift_beginAccess();
  v11 = *v10;
  if (*v10)
  {
    sub_2197283A8((uint64_t)v11);
    v12 = swift_bridgeObjectRetain();
    v11(v12);
    sub_219731D9C((uint64_t)v11);
    swift_bridgeObjectRelease();
  }
  if (qword_255095E80 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_255098550);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  swift_unknownObjectRetain_n();
  v14 = sub_2197523C0();
  v15 = sub_219752A44();
  if (!os_log_type_enabled(v14, v15))
  {

    swift_unknownObjectRelease_n();
    v23 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_11;
  }
  v26 = v5;
  v27 = v4;
  v28 = v2;
  v16 = swift_slowAlloc();
  v25 = swift_slowAlloc();
  v30[0] = v25;
  *(_DWORD *)v16 = 136315394;
  v29 = sub_219738DB8(0xD00000000000001DLL, 0x8000000219765590, v30);
  sub_219752A98();
  *(_WORD *)(v16 + 12) = 2080;
  v17 = objc_msgSend(a1, sel_ssid);
  if (v17)
  {
    v18 = v17;
    v19 = sub_2197529A8();
    v21 = v20;

    v29 = sub_219738DB8(v19, v21, v30);
    sub_219752A98();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2196CC000, v14, v15, "%s: Adding pending deleting network: %s", (uint8_t *)v16, 0x16u);
    v22 = v25;
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v22, -1, -1);
    MEMORY[0x219A32EB8](v16, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v7, v27);
    v2 = v28;
LABEL_11:
    MEMORY[0x24BDAC7A8](v23);
    *(&v25 - 2) = v2;
    *(&v25 - 1) = (uint64_t)a1;
    sub_2197528E8();
    sub_219752468();
    return swift_release();
  }
  result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_219736A58(void *a1, void *a2)
{
  unint64_t v4;
  id v5;
  id v6;
  unint64_t v8;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  swift_unknownObjectRetain();
  v4 = sub_21973C27C(v8, a2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a1;
  sub_219752414();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  swift_unknownObjectRetain();
  sub_21973C27C(v4, a2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  return sub_219752414();
}

void sub_219736C08(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_255095E90 != -1)
    swift_once();
  v3 = qword_255098618;
  sub_219736CE4(a1);
  v4 = (id)sub_219752930();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_postNotificationName_object_userInfo_, v3, 0, v4);

}

uint64_t sub_219736CE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550965E0);
    v2 = sub_219752BA0();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_21973D204(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_21973D204(v35, v36);
    sub_21973D204(v36, &v32);
    result = sub_219752AD4();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_21973D204(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_21973D214();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2197370A4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(uint64_t);
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  _QWORD *v26;
  void *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t aBlock[9];

  v1 = v0;
  v2 = sub_219752900();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_219752918();
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v8 = aBlock[0];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_219752B7C();
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v34 = v6;
  v35 = v5;
  v36 = v0;
  if (v9)
  {
    if (v9 < 1)
    {
      __break(1u);
LABEL_25:
      swift_once();
      goto LABEL_18;
    }
    v31 = v3;
    for (i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x219A32588](i, v8);
      else
        v11 = *(id *)(v8 + 8 * i + 32);
      v12 = v11;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_219752408();

      swift_release();
      v13 = swift_release();
      if (aBlock[6])
      {
        MEMORY[0x219A3245C](v13);
        if (*(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
          sub_219752A14();
        sub_219752A2C();
        sub_219752A08();
      }
    }
    swift_bridgeObjectRelease();
    v14 = aBlock[0];
    v3 = v31;
    v1 = v36;
  }
  else
  {
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v15 = &v1[OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate];
  swift_beginAccess();
  v16 = *(uint64_t (**)(uint64_t))v15;
  if (!*(_QWORD *)v15)
    return swift_bridgeObjectRelease();
  swift_retain();
  v9 = v16(v14);
  v8 = v17;
  swift_bridgeObjectRelease();
  sub_219731D9C((uint64_t)v16);
  if (qword_255095E80 != -1)
    goto LABEL_25;
LABEL_18:
  v18 = sub_2197523D8();
  __swift_project_value_buffer(v18, (uint64_t)qword_255098550);
  swift_bridgeObjectRetain_n();
  v19 = sub_2197523C0();
  v20 = sub_219752A44();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)v21 = 136315394;
    v37 = sub_219738DB8(0xD000000000000020, 0x8000000219765800, aBlock);
    sub_219752A98();
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    v37 = sub_219738DB8(v9, v8, aBlock);
    sub_219752A98();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2196CC000, v19, v20, "%s: UPdating unconfigured network section title to: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    v23 = v22;
    v1 = v36;
    MEMORY[0x219A32EB8](v23, -1, -1);
    MEMORY[0x219A32EB8](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_219739420();
  v25 = (void *)sub_219752A68();
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = v1;
  v26[3] = v9;
  v26[4] = v8;
  aBlock[4] = (uint64_t)sub_21973CF6C;
  aBlock[5] = (uint64_t)v26;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_62;
  v27 = _Block_copy(aBlock);
  v28 = v1;
  swift_release();
  v29 = v32;
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  v30 = v35;
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v29, v30, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v30, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v29, v34);
}

uint64_t sub_219737670(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v2 = a1;
  return sub_219752414();
}

void sub_2197376F0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  char *v18;
  id v19;
  char *v20;
  id v21;
  char *v22;
  id v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  id aBlock;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  uint64_t (*v62)();
  uint64_t v63;

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for WFNetworkRowConfigModel();
    v13 = a1;
    v14 = static WFNetworkRowConfigModel.modelFrom(rowConfig:)(v13);
    if (qword_255095E80 != -1)
      swift_once();
    v15 = sub_2197523D8();
    __swift_project_value_buffer(v15, (uint64_t)qword_255098550);
    v16 = v14;
    v17 = v2;
    v18 = v16;
    v19 = v17;
    v20 = v18;
    v21 = v19;
    v22 = v20;
    v23 = v21;
    v24 = sub_2197523C0();
    v25 = sub_219752A44();
    if (!os_log_type_enabled(v24, (os_log_type_t)v25))
    {

LABEL_32:
      MEMORY[0x24BDAC7A8](v41);
      *(&v53 - 2) = (uint64_t)v23;
      *(&v53 - 1) = (uint64_t)v14;
      sub_2197528E8();
      sub_219752468();

      swift_release();
      return;
    }
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v57 = v27;
    *(_DWORD *)v26 = 136316162;
    aBlock = (id)sub_219738DB8(0xD000000000000021, 0x8000000219765960, &v57);
    sub_219752A98();
    *(_WORD *)(v26 + 12) = 2080;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_219752408();
    swift_release();
    swift_release();
    v28 = aBlock;
    LODWORD(v55) = v25;
    v54 = v27;
    if (aBlock)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_219752408();

      swift_release();
      swift_release();
      v28 = aBlock;
      if (aBlock)
      {
        v29 = objc_msgSend(aBlock, sel_ssid);
        swift_unknownObjectRelease();
        if (v29)
        {
          v28 = (id)sub_2197529A8();
          v31 = v30;

LABEL_17:
          aBlock = (id)sub_219738DB8((uint64_t)v28, v31, &v57);
          sub_219752A98();

          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 22) = 2080;
          swift_getKeyPath();
          swift_getKeyPath();
          sub_219752408();
          swift_release();
          swift_release();
          v42 = aBlock;
          v56 = v13;
          if (aBlock
            && (swift_getKeyPath(),
                swift_getKeyPath(),
                sub_219752408(),
                v42,
                swift_release(),
                swift_release(),
                (v43 = v59) != 0))
          {
            v44 = (uint64_t)aBlock;
          }
          else
          {
            swift_bridgeObjectRelease();
            v44 = 0;
            v43 = 0xE000000000000000;
          }
          aBlock = (id)sub_219738DB8(v44, v43, &v57);
          sub_219752A98();

          swift_bridgeObjectRelease();
          *(_WORD *)(v26 + 32) = 2080;
          if (v14)
          {
            swift_getKeyPath();
            swift_getKeyPath();
            sub_219752408();
            swift_release();
            swift_release();
            v45 = (uint64_t)aBlock;
            if (!aBlock)
            {
LABEL_26:
              v48 = 0xE000000000000000;
LABEL_27:
              aBlock = (id)sub_219738DB8(v45, v48, &v57);
              sub_219752A98();

              swift_bridgeObjectRelease();
              *(_WORD *)(v26 + 42) = 2080;
              if (v14
                && (swift_getKeyPath(),
                    swift_getKeyPath(),
                    sub_219752408(),
                    swift_release(),
                    swift_release(),
                    (v49 = v59) != 0))
              {
                v50 = (uint64_t)aBlock;
              }
              else
              {
                swift_bridgeObjectRelease();
                v50 = 0;
                v49 = 0xE000000000000000;
              }
              v13 = v56;
              v51 = v55;
              v52 = v54;
              aBlock = (id)sub_219738DB8(v50, v49, &v57);
              sub_219752A98();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_2196CC000, v24, v51, "%s: Updating current network row config: old ssid=' %s', subtitle='%s' -> new ssid='%s', subtitle='%s'", (uint8_t *)v26, 0x34u);
              swift_arrayDestroy();
              MEMORY[0x219A32EB8](v52, -1, -1);
              MEMORY[0x219A32EB8](v26, -1, -1);

              goto LABEL_32;
            }
            v46 = objc_msgSend(aBlock, sel_ssid);
            swift_unknownObjectRelease();
            if (v46)
            {
              v45 = sub_2197529A8();
              v48 = v47;

              goto LABEL_27;
            }
          }
          v45 = 0;
          goto LABEL_26;
        }
        v28 = 0;
      }
    }
    v31 = 0xE000000000000000;
    goto LABEL_17;
  }
  v56 = (id)v10;
  if (qword_255095E80 != -1)
    swift_once();
  v32 = sub_2197523D8();
  __swift_project_value_buffer(v32, (uint64_t)qword_255098550);
  v33 = sub_2197523C0();
  v34 = sub_219752A44();
  if (os_log_type_enabled(v33, v34))
  {
    v55 = v2;
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = (void *)swift_slowAlloc();
    aBlock = v36;
    v54 = v5;
    *(_DWORD *)v35 = 136315138;
    v57 = sub_219738DB8(0xD000000000000021, 0x8000000219765960, (uint64_t *)&aBlock);
    v5 = v54;
    v2 = v55;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v33, v34, "%s: Clearing current network row config", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v36, -1, -1);
    MEMORY[0x219A32EB8](v35, -1, -1);
  }

  sub_219739420();
  v37 = (void *)sub_219752A68();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v2;
  v62 = sub_21973D308;
  v63 = v38;
  aBlock = (id)MEMORY[0x24BDAC760];
  v59 = 1107296256;
  v60 = sub_2197315E4;
  v61 = &block_descriptor_254;
  v39 = _Block_copy(&aBlock);
  v40 = v2;
  swift_release();
  sub_21975290C();
  aBlock = (id)MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v12, v7, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, id))(v9 + 8))(v12, v56);
}

uint64_t sub_219738014(void *a1)
{
  id v2;

  type metadata accessor for NetworkListDataSource();
  sub_21972996C((unint64_t *)&unk_255096820, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
  sub_2197523E4();
  sub_2197523F0();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

uint64_t sub_2197380C4(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v4 = sub_219752900();
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_219752918();
  v7 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219739420();
  v10 = (void *)sub_219752A68();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  aBlock[4] = sub_21973D328;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor_260;
  v12 = _Block_copy(aBlock);
  v13 = a2;
  v14 = a1;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

uint64_t sub_2197382D4(void *a1, void *a2)
{
  id v4;
  id v5;

  type metadata accessor for NetworkListDataSource();
  sub_21972996C((unint64_t *)&unk_255096820, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
  v4 = a2;
  sub_2197523E4();
  sub_2197523F0();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = a1;
  return sub_219752414();
}

id NetworkListDataSource.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_219738600@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for NetworkListDataSource();
  result = sub_2197523E4();
  *a1 = result;
  return result;
}

uint64_t sub_21973863C()
{
  uint64_t v0;

  v0 = sub_2197523D8();
  __swift_allocate_value_buffer(v0, qword_255098550);
  __swift_project_value_buffer(v0, (uint64_t)qword_255098550);
  return sub_2197523CC();
}

uint64_t sub_2197386B8@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_2197386CC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  v3 = v2;
  return sub_219752414();
}

uint64_t sub_219738740@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219738754(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219738768@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973877C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2197387F4(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  type metadata accessor for NetworkListDataSource();
  sub_21972996C((unint64_t *)&unk_255096820, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
  v4 = v2;
  sub_2197523E4();
  sub_2197523F0();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = v3;
  return sub_219752414();
}

uint64_t sub_2197388B0@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_2197388C4(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_2197388D8@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_2197388EC(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_219738900@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219738914(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_219738928@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973893C(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_219738950@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219738964(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_219738978@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973898C(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_2197389A0@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_2197389B4(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_2197389C8(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_219752414();
}

uint64_t sub_219738A38@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219738A4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_219738AC4(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219738AD8(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_219752414();
}

double sub_219738B40@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_219738BBC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_219752414();
}

uint64_t sub_219738C38(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_219738C6C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_219738C7C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_219752BAC();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_219738D10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_219738D30(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_219738DB8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_219752A98();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_219738DB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_219738E88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_219730700((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_219730700((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_219738E88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_219752AA4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_219739040(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_219752B1C();
  if (!v8)
  {
    sub_219752B64();
    __break(1u);
LABEL_17:
    result = sub_219752BAC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_219739040(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2197390D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2197392AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2197392AC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2197390D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_219739248(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_219752B04();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_219752B64();
      __break(1u);
LABEL_10:
      v2 = sub_2197529D8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_219752BAC();
    __break(1u);
LABEL_14:
    result = sub_219752B64();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_219739248(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096608);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2197392AC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255096608);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_219752BAC();
  __break(1u);
  return result;
}

uint64_t sub_2197393F8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_219739420()
{
  unint64_t result;

  result = qword_2550964A0;
  if (!qword_2550964A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2550964A0);
  }
  return result;
}

uint64_t sub_21973945C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219739488()
{
  return sub_219733DE0();
}

uint64_t sub_219739490()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2197394BC()
{
  uint64_t v0;

  return sub_219734414(*(void **)(v0 + 16));
}

uint64_t sub_2197394C4(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_2197394E8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_219739510()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219739534()
{
  uint64_t v0;

  return sub_219734914(*(void **)(v0 + 16));
}

unint64_t sub_219739540(uint64_t a1)
{
  uint64_t v2;

  sub_2197529A8();
  sub_219752C00();
  sub_2197529C0();
  v2 = sub_219752C18();
  swift_bridgeObjectRelease();
  return sub_219739654(a1, v2);
}

unint64_t sub_2197395C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_219752AD4();
  return sub_2197397C8(a1, v2);
}

unint64_t sub_2197395F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219752C00();
  sub_2197529C0();
  v4 = sub_219752C18();
  return sub_21973988C(a1, a2, v4);
}

unint64_t sub_219739654(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2197529A8();
    v8 = v7;
    if (v6 == sub_2197529A8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_219752BE8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2197529A8();
          v15 = v14;
          if (v13 == sub_2197529A8() && v15 == v16)
            break;
          v18 = sub_219752BE8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_2197397C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21973D370(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x219A32558](v9, a1);
      sub_2197306CC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_21973988C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_219752BE8() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_219752BE8() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_21973996C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2550965F0);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_21973AB94((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_219752B7C();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_219739A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  void *v5;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;

  v5 = a5;
  *(_QWORD *)(swift_allocObject() + 16) = a5;
  v48 = a2;
  if (a3 == a2)
  {
    v9 = v5;
    swift_release();
    goto LABEL_32;
  }
  v47 = v5;
  v10 = *a4;
  v46 = v5;
  v51 = v10;
  v11 = v10 + 8 * a3 - 8;
  v12 = &selRef_setTintColor_;
  while (2)
  {
    v13 = *(void **)(v51 + 8 * a3);
    v14 = a1;
    v50 = v11;
    while (1)
    {
      v15 = *(void **)v11;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v16 = objc_msgSend(v13, v12[101]);
      if (!v16)
      {
        __break(1u);
LABEL_34:

        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return;
      }
      v17 = v16;
      v18 = sub_2197529A8();
      v20 = v19;

      swift_bridgeObjectRelease();
      v21 = HIBYTE(v20) & 0xF;
      if ((v20 & 0x2000000000000000) == 0)
        v21 = v18 & 0xFFFFFFFFFFFFLL;
      if (!v21)
      {
        v22 = objc_msgSend(v15, v12[101]);
        if (!v22)
          goto LABEL_39;
        v23 = v22;
        v24 = sub_2197529A8();
        v26 = v25;

        swift_bridgeObjectRelease();
        v27 = HIBYTE(v26) & 0xF;
        if ((v26 & 0x2000000000000000) == 0)
          v27 = v24 & 0xFFFFFFFFFFFFLL;
        if (!v27)
          goto LABEL_28;
      }
      v28 = objc_msgSend(v13, v12[101]);
      if (!v28)
        goto LABEL_35;
      v29 = v28;
      v30 = sub_2197529A8();
      v32 = v31;

      swift_bridgeObjectRelease();
      v33 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0)
        v33 = v30 & 0xFFFFFFFFFFFFLL;
      if (!v33)
      {
LABEL_28:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (!v51)
          goto LABEL_34;
        goto LABEL_29;
      }
      v34 = objc_msgSend(v15, v12[101]);
      if (!v34)
        goto LABEL_36;
      v35 = v34;
      v36 = sub_2197529A8();
      v38 = v37;

      swift_bridgeObjectRelease();
      v39 = HIBYTE(v38) & 0xF;
      if ((v38 & 0x2000000000000000) == 0)
        v39 = v36 & 0xFFFFFFFFFFFFLL;
      if (!v39)
        break;
      v40 = objc_msgSend(v13, v12[101]);
      if (!v40)
        goto LABEL_37;
      v41 = v40;
      sub_2197529A8();

      v42 = objc_msgSend(v15, v12[101]);
      if (!v42)
        goto LABEL_38;
      v43 = v42;
      sub_2197529A8();

      sub_21972F9DC();
      v44 = sub_219752AB0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v12 = &selRef_setTintColor_;
      swift_bridgeObjectRelease();
      if (v44 != -1)
        goto LABEL_5;
      if (!v51)
        goto LABEL_34;
LABEL_29:
      v45 = *(void **)v11;
      v13 = *(void **)(v11 + 8);
      *(_QWORD *)v11 = v13;
      *(_QWORD *)(v11 + 8) = v45;
      v11 -= 8;
      if (a3 == ++v14)
        goto LABEL_5;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_5:
    ++a3;
    v11 = v50 + 8;
    if (a3 != v48)
      continue;
    break;
  }
  swift_release();
  v5 = v47;
LABEL_32:

}

uint64_t sub_219739DB0(void **a1, void **a2, unint64_t a3, void **a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  id v16;
  void **v17;
  void **v18;
  void *v19;
  void *v20;
  char v21;
  void **v22;
  id v23;
  void **v24;
  void **v25;
  void **v26;
  void **v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t result;
  void **__dst;
  char *v35;
  void **v36;
  void **v37;

  *(_QWORD *)(swift_allocObject() + 16) = a5;
  v9 = (char *)a2 - (char *)a1;
  v10 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v10 = (char *)a2 - (char *)a1;
  v11 = v10 >> 3;
  v12 = a3 - (_QWORD)a2;
  v13 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v13 = a3 - (_QWORD)a2;
  v14 = v13 >> 3;
  v37 = a1;
  __dst = a4;
  v36 = a4;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (a4 != a2 || &a2[v14] <= a4)
        memmove(a4, a2, 8 * v14);
      v23 = a5;
      v24 = &a4[v14];
      v35 = (char *)v24;
      v37 = a2;
      if (v12 >= 8 && a1 < a2)
      {
        v25 = (void **)(a3 - 8);
        v26 = a2;
        do
        {
          v27 = v25 + 1;
          v28 = *(v24 - 1);
          v29 = *--v26;
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          v30 = sub_21973C508(v28, v29);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if ((v30 & 1) != 0)
          {
            if (v27 != a2 || v25 >= a2)
              *v25 = *v26;
            v37 = v26;
          }
          else
          {
            v35 = (char *)(v24 - 1);
            if (v27 < v24 || v25 >= v24 || v27 != v24)
              *v25 = *(v24 - 1);
            v26 = a2;
            --v24;
          }
          if (v24 <= __dst)
            break;
          --v25;
          a2 = v26;
        }
        while (v26 > a1);
      }
      goto LABEL_43;
    }
  }
  else if (v9 >= -7)
  {
    v15 = a1;
    if (a4 != a1 || &a1[v11] <= a4)
      memmove(a4, a1, 8 * v11);
    v16 = a5;
    v17 = &a4[v11];
    v35 = (char *)v17;
    if (v9 >= 8 && (unint64_t)a2 < a3)
    {
      v18 = a4;
      do
      {
        v19 = *a2;
        v20 = *v18;
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        v21 = sub_21973C508(v19, v20);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if ((v21 & 1) != 0)
        {
          v22 = a2 + 1;
          if (v15 < a2 || v15 >= v22 || v15 != a2)
            *v15 = *a2;
        }
        else
        {
          if (v15 != v18)
            *v15 = *v18;
          v36 = ++v18;
          v22 = a2;
        }
        ++v15;
        if (v18 >= v17)
          break;
        a2 = v22;
      }
      while ((unint64_t)v22 < a3);
      v37 = v15;
    }
LABEL_43:
    sub_21973A1D0((void **)&v37, (const void **)&v36, &v35);

    swift_release();
    return 1;
  }
  swift_release();
  result = sub_219752BAC();
  __break(1u);
  return result;
}

char *sub_21973A0D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550965E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21973A1D0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_219752BAC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_21973A278(uint64_t a1)
{
  return sub_21973A0D8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21973A28C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2197395F0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21973A9DC();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_21973A694(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21973A370(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D8);
  v42 = a2;
  v6 = sub_219752B94();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_219752C00();
    sub_2197529C0();
    result = sub_219752C18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21973A694(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_219752AC8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_219752C00();
        swift_bridgeObjectRetain();
        sub_2197529C0();
        v9 = sub_219752C18();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21973A868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_2197395F0(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_21973A9DC();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21973A370(v17, a5 & 1);
  v23 = sub_2197395F0(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_219752BF4();
  __break(1u);
  return result;
}

void *sub_21973A9DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D8);
  v2 = *v0;
  v3 = sub_219752B88();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21973AB94(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_219752B7C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_219752B7C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2197299AC(&qword_255096600, &qword_2550965F8, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2550965F8);
          v12 = sub_21973ADA4(v16, i, a3);
          v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_219752BAC();
  __break(1u);
  return result;
}

void (*sub_21973ADA4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21973AE24(v6, a2, a3);
  return sub_21973ADF8;
}

void sub_21973ADF8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_21973AE24(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x219A32588](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return sub_21973AE90;
  }
  __break(1u);
  return result;
}

uint64_t sub_21973AE90()
{
  return swift_unknownObjectRelease();
}

void sub_21973AE98()
{
  JUMPOUT(0x219A32648);
}

uint64_t sub_21973AEAC(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t i;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v2 = v1;
  v20 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_34:
    v4 = sub_219752B7C();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      v17 = v2;
      v18 = v4;
      for (i = 0; ; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (void *)MEMORY[0x219A32588](i, a1);
          v7 = i + 1;
          if (__OFADD__(i, 1))
          {
LABEL_31:
            __break(1u);
            return v20;
          }
        }
        else
        {
          if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_34;
          }
          v6 = *(void **)(a1 + 8 * i + 32);
          swift_unknownObjectRetain();
          v7 = i + 1;
          if (__OFADD__(i, 1))
            goto LABEL_31;
        }
        if ((objc_msgSend(v6, sel_isKnown, v17) & 1) != 0
          || objc_msgSend(v6, sel_isInstantHotspot))
        {
          v8 = objc_msgSend(v6, sel_ssid);
          if (v8)
          {
            v9 = v8;
            v2 = sub_2197529A8();
            v11 = v10;

          }
          else
          {
            v2 = 0;
            v11 = 0;
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_219752408();
          swift_release();
          swift_release();
          v12 = v19;
          if (v19)
          {
            v13 = objc_msgSend(v19, sel_ssid);
            swift_unknownObjectRelease();
            if (v13)
            {
              v14 = sub_2197529A8();
              v12 = v15;

              v4 = v18;
              if (!v11)
                goto LABEL_24;
            }
            else
            {
              v14 = 0;
              v12 = 0;
              v4 = v18;
              if (!v11)
              {
LABEL_24:
                if (v12)
                {
LABEL_25:
                  swift_bridgeObjectRelease();
LABEL_26:
                  sub_219752B28();
                  v2 = *(_QWORD *)(v20 + 16);
                  sub_219752B40();
                  sub_219752B4C();
                  sub_219752B34();
                  goto LABEL_5;
                }
                goto LABEL_4;
              }
            }
          }
          else
          {
            v14 = 0;
            v4 = v18;
            if (!v11)
              goto LABEL_24;
          }
          if (!v12)
            goto LABEL_25;
          if (v2 == v14 && v11 == v12)
          {
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          v2 = sub_219752BE8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v2 & 1) == 0)
            goto LABEL_26;
        }
LABEL_4:
        swift_unknownObjectRelease();
LABEL_5:
        if (v7 == v4)
          return v20;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21973B188(uint64_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t result;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  unint64_t v90;
  unint64_t v91;
  char *v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  uint64_t v116;
  char v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  unint64_t v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void **v156;
  id v157;
  uint64_t v158;
  char v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v4 = a1[1];
  v157 = a2;
  v5 = sub_219752BDC();
  if (v5 >= v4)
  {
    if (v4 < 0)
      goto LABEL_183;
    if (v4)
    {
      v9 = v157;
      sub_219739A60(0, v4, 1, a1, v9);

    }
    else
    {

    }
    return swift_release();
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_203;
  v151 = a1;
  v152 = v5;
  if (v4 < 2)
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
    v164 = MEMORY[0x24BEE4AF8];
    v156 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_149:
      if (v14 >= 2)
      {
        v142 = *v151;
        v163 = *v151;
        do
        {
          v143 = v14 - 2;
          if (v14 < 2)
            goto LABEL_178;
          if (!v142)
            goto LABEL_202;
          v144 = *(_QWORD *)&v11[16 * v143 + 32];
          v145 = *(_QWORD *)&v11[16 * v14 + 24];
          sub_219739DB0((void **)(v142 + 8 * v144), (void **)(v142 + 8 * *(_QWORD *)&v11[16 * v14 + 16]), v142 + 8 * v145, v156, v157);
          if (v161)
            break;
          if (v145 < v144)
            goto LABEL_179;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v11 = sub_21973A278((uint64_t)v11);
          if (v143 >= *((_QWORD *)v11 + 2))
            goto LABEL_180;
          v146 = &v11[16 * v143 + 32];
          *(_QWORD *)v146 = v144;
          *((_QWORD *)v146 + 1) = v145;
          v147 = *((_QWORD *)v11 + 2);
          if (v14 > v147)
            goto LABEL_181;
          memmove(&v11[16 * v14 + 16], &v11[16 * v14 + 32], 16 * (v147 - v14));
          *((_QWORD *)v11 + 2) = v147 - 1;
          v14 = v147 - 1;
          v142 = v163;
        }
        while (v147 > 2);
      }
LABEL_160:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v164 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_219752A08();

      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v7 = v6 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
    v8 = sub_219752A20();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v156 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v164 = v8;
  }
  v12 = 0;
  v13 = *a1;
  v148 = *a1 - 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v155 = v4;
  v162 = *a1;
LABEL_16:
  v15 = v12 + 1;
  if (v12 + 1 >= v4)
    goto LABEL_61;
  v16 = *(void **)(v13 + 8 * v15);
  v17 = *(void **)(v13 + 8 * v12);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v159 = sub_21973C508(v16, v17);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v18 = v12 + 2;
  if (v12 + 2 >= v4)
  {
LABEL_51:
    v15 = v18;
    if ((v159 & 1) != 0)
    {
      if (v18 < v12)
        goto LABEL_186;
LABEL_53:
      if (v12 < v18)
      {
        v50 = (uint64_t *)(v148 + 8 * v18);
        v51 = v18;
        v52 = v12;
        v53 = (uint64_t *)(v13 + 8 * v12);
        do
        {
          if (v52 != --v51)
          {
            if (!v13)
              goto LABEL_198;
            v54 = *v53;
            *v53 = *v50;
            *v50 = v54;
          }
          ++v52;
          --v50;
          ++v53;
        }
        while (v52 < v51);
      }
      v15 = v18;
    }
LABEL_61:
    if (v15 >= v4)
      goto LABEL_100;
    if (__OFSUB__(v15, v12))
      goto LABEL_182;
    if (v15 - v12 >= v152)
      goto LABEL_100;
    if (__OFADD__(v12, v152))
      goto LABEL_184;
    if (v12 + v152 >= v4)
      v55 = v4;
    else
      v55 = v12 + v152;
    if (v55 < v12)
    {
LABEL_185:
      __break(1u);
      goto LABEL_186;
    }
    if (v15 == v55)
      goto LABEL_100;
    v150 = v11;
    v56 = v148 + 8 * v15;
    v158 = v12;
    v153 = v55;
LABEL_74:
    v57 = *(void **)(v13 + 8 * v15);
    v160 = v56;
    while (1)
    {
      v58 = v15;
      v59 = *(void **)v56;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v60 = objc_msgSend(v57, sel_title);
      if (!v60)
        goto LABEL_187;
      v61 = v60;
      v62 = sub_2197529A8();
      v64 = v63;

      swift_bridgeObjectRelease();
      v65 = HIBYTE(v64) & 0xF;
      if ((v64 & 0x2000000000000000) == 0)
        v65 = v62 & 0xFFFFFFFFFFFFLL;
      if (!v65)
      {
        v66 = objc_msgSend(v59, sel_title);
        if (!v66)
          goto LABEL_193;
        v67 = v66;
        v68 = sub_2197529A8();
        v70 = v69;

        swift_bridgeObjectRelease();
        v71 = HIBYTE(v70) & 0xF;
        if ((v70 & 0x2000000000000000) == 0)
          v71 = v68 & 0xFFFFFFFFFFFFLL;
        if (!v71)
          goto LABEL_96;
      }
      v72 = objc_msgSend(v57, sel_title);
      if (!v72)
        goto LABEL_189;
      v73 = v72;
      v74 = sub_2197529A8();
      v76 = v75;

      swift_bridgeObjectRelease();
      v77 = HIBYTE(v76) & 0xF;
      if ((v76 & 0x2000000000000000) == 0)
        v77 = v74 & 0xFFFFFFFFFFFFLL;
      if (v77)
      {
        v78 = objc_msgSend(v59, sel_title);
        if (!v78)
          goto LABEL_190;
        v79 = v78;
        v80 = sub_2197529A8();
        v82 = v81;

        swift_bridgeObjectRelease();
        v83 = HIBYTE(v82) & 0xF;
        if ((v82 & 0x2000000000000000) == 0)
          v83 = v80 & 0xFFFFFFFFFFFFLL;
        if (!v83)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
LABEL_72:
          v15 = v58;
LABEL_73:
          ++v15;
          v12 = v158;
          v56 = v160 + 8;
          if (v15 != v153)
            goto LABEL_74;
          v15 = v153;
          v11 = v150;
          v4 = v155;
LABEL_100:
          if (v15 < v12)
            goto LABEL_177;
          v154 = v15;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v11 = sub_21973A0D8(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
          v91 = *((_QWORD *)v11 + 2);
          v90 = *((_QWORD *)v11 + 3);
          v14 = v91 + 1;
          if (v91 >= v90 >> 1)
            v11 = sub_21973A0D8((char *)(v90 > 1), v91 + 1, 1, v11);
          *((_QWORD *)v11 + 2) = v14;
          v92 = v11 + 32;
          v93 = &v11[16 * v91 + 32];
          *(_QWORD *)v93 = v12;
          *((_QWORD *)v93 + 1) = v154;
          if (v91)
          {
            while (2)
            {
              v94 = v14 - 1;
              if (v14 >= 4)
              {
                v99 = &v92[16 * v14];
                v100 = *((_QWORD *)v99 - 8);
                v101 = *((_QWORD *)v99 - 7);
                v105 = __OFSUB__(v101, v100);
                v102 = v101 - v100;
                if (v105)
                  goto LABEL_166;
                v104 = *((_QWORD *)v99 - 6);
                v103 = *((_QWORD *)v99 - 5);
                v105 = __OFSUB__(v103, v104);
                v97 = v103 - v104;
                v98 = v105;
                if (v105)
                  goto LABEL_167;
                v106 = v14 - 2;
                v107 = &v92[16 * v14 - 32];
                v109 = *(_QWORD *)v107;
                v108 = *((_QWORD *)v107 + 1);
                v105 = __OFSUB__(v108, v109);
                v110 = v108 - v109;
                if (v105)
                  goto LABEL_169;
                v105 = __OFADD__(v97, v110);
                v111 = v97 + v110;
                if (v105)
                  goto LABEL_172;
                if (v111 >= v102)
                {
                  v129 = &v92[16 * v94];
                  v131 = *(_QWORD *)v129;
                  v130 = *((_QWORD *)v129 + 1);
                  v105 = __OFSUB__(v130, v131);
                  v132 = v130 - v131;
                  if (v105)
                    goto LABEL_176;
                  v122 = v97 < v132;
                }
                else
                {
LABEL_119:
                  if ((v98 & 1) != 0)
                    goto LABEL_168;
                  v106 = v14 - 2;
                  v112 = &v92[16 * v14 - 32];
                  v114 = *(_QWORD *)v112;
                  v113 = *((_QWORD *)v112 + 1);
                  v115 = __OFSUB__(v113, v114);
                  v116 = v113 - v114;
                  v117 = v115;
                  if (v115)
                    goto LABEL_171;
                  v118 = &v92[16 * v94];
                  v120 = *(_QWORD *)v118;
                  v119 = *((_QWORD *)v118 + 1);
                  v105 = __OFSUB__(v119, v120);
                  v121 = v119 - v120;
                  if (v105)
                    goto LABEL_174;
                  if (__OFADD__(v116, v121))
                    goto LABEL_175;
                  if (v116 + v121 < v97)
                    goto LABEL_131;
                  v122 = v97 < v121;
                }
                if (v122)
                  v94 = v106;
              }
              else
              {
                if (v14 == 3)
                {
                  v96 = *((_QWORD *)v11 + 4);
                  v95 = *((_QWORD *)v11 + 5);
                  v105 = __OFSUB__(v95, v96);
                  v97 = v95 - v96;
                  v98 = v105;
                  goto LABEL_119;
                }
                v123 = *((_QWORD *)v11 + 4);
                v124 = *((_QWORD *)v11 + 5);
                v105 = __OFSUB__(v124, v123);
                v116 = v124 - v123;
                v117 = v105;
LABEL_131:
                if ((v117 & 1) != 0)
                  goto LABEL_170;
                v125 = &v92[16 * v94];
                v127 = *(_QWORD *)v125;
                v126 = *((_QWORD *)v125 + 1);
                v105 = __OFSUB__(v126, v127);
                v128 = v126 - v127;
                if (v105)
                  goto LABEL_173;
                if (v128 < v116)
                  goto LABEL_15;
              }
              v133 = v94 - 1;
              if (v94 - 1 >= v14)
              {
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_166:
                __break(1u);
LABEL_167:
                __break(1u);
LABEL_168:
                __break(1u);
LABEL_169:
                __break(1u);
LABEL_170:
                __break(1u);
LABEL_171:
                __break(1u);
LABEL_172:
                __break(1u);
LABEL_173:
                __break(1u);
LABEL_174:
                __break(1u);
LABEL_175:
                __break(1u);
LABEL_176:
                __break(1u);
LABEL_177:
                __break(1u);
LABEL_178:
                __break(1u);
LABEL_179:
                __break(1u);
LABEL_180:
                __break(1u);
LABEL_181:
                __break(1u);
LABEL_182:
                __break(1u);
LABEL_183:
                __break(1u);
LABEL_184:
                __break(1u);
                goto LABEL_185;
              }
              if (!v13)
                goto LABEL_194;
              v134 = v13;
              v135 = &v92[16 * v133];
              v136 = *(_QWORD *)v135;
              v137 = v94;
              v138 = &v92[16 * v94];
              v139 = *((_QWORD *)v138 + 1);
              sub_219739DB0((void **)(v134 + 8 * *(_QWORD *)v135), (void **)(v134 + 8 * *(_QWORD *)v138), v134 + 8 * v139, v156, v157);
              if (v161)
                goto LABEL_160;
              if (v139 < v136)
                goto LABEL_163;
              if (v137 > *((_QWORD *)v11 + 2))
                goto LABEL_164;
              v140 = v137;
              *(_QWORD *)v135 = v136;
              *(_QWORD *)&v92[16 * v133 + 8] = v139;
              v141 = *((_QWORD *)v11 + 2);
              if (v137 >= v141)
                goto LABEL_165;
              v14 = v141 - 1;
              memmove(v138, v138 + 16, 16 * (v141 - 1 - v140));
              *((_QWORD *)v11 + 2) = v141 - 1;
              v4 = v155;
              v13 = v162;
              if (v141 <= 2)
                goto LABEL_15;
              continue;
            }
          }
          v14 = 1;
LABEL_15:
          v12 = v154;
          if (v154 >= v4)
            goto LABEL_149;
          goto LABEL_16;
        }
        v84 = objc_msgSend(v57, sel_title);
        if (!v84)
          goto LABEL_192;
        v85 = v84;
        sub_2197529A8();

        v86 = objc_msgSend(v59, sel_title);
        if (!v86)
          goto LABEL_191;
        v87 = v86;
        sub_2197529A8();

        sub_21972F9DC();
        v88 = sub_219752AB0();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 = v162;
        if (v88 != -1)
          goto LABEL_72;
        if (!v162)
          goto LABEL_188;
      }
      else
      {
LABEL_96:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (!v13)
          goto LABEL_188;
      }
      v15 = v58;
      v89 = *(void **)v56;
      v57 = *(void **)(v56 + 8);
      *(_QWORD *)v56 = v57;
      *(_QWORD *)(v56 + 8) = v89;
      v56 -= 8;
      if (v58 == ++v12)
        goto LABEL_73;
    }
  }
  v149 = v11;
  v19 = *(void **)(v13 + 8 * v18);
  v20 = *(void **)(v13 + 8 * (v12 + 1));
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v21 = objc_msgSend(v19, sel_title);
  if (!v21)
    goto LABEL_195;
  v22 = v21;
  while (1)
  {
    v23 = sub_2197529A8();
    v25 = v24;

    swift_bridgeObjectRelease();
    v26 = HIBYTE(v25) & 0xF;
    if ((v25 & 0x2000000000000000) == 0)
      v26 = v23 & 0xFFFFFFFFFFFFLL;
    if (!v26)
    {
      v27 = objc_msgSend(v20, sel_title);
      if (!v27)
        goto LABEL_199;
      v28 = v27;
      v29 = sub_2197529A8();
      v31 = v30;

      swift_bridgeObjectRelease();
      v32 = HIBYTE(v31) & 0xF;
      if ((v31 & 0x2000000000000000) == 0)
        v32 = v29 & 0xFFFFFFFFFFFFLL;
      if (!v32)
        break;
    }
    v33 = objc_msgSend(v19, sel_title);
    if (!v33)
      goto LABEL_196;
    v34 = v33;
    v35 = sub_2197529A8();
    v37 = v36;

    swift_bridgeObjectRelease();
    v38 = HIBYTE(v37) & 0xF;
    if ((v37 & 0x2000000000000000) == 0)
      v38 = v35 & 0xFFFFFFFFFFFFLL;
    if (!v38)
      break;
    v39 = objc_msgSend(v20, sel_title);
    if (!v39)
      goto LABEL_197;
    v40 = v39;
    v41 = sub_2197529A8();
    v43 = v42;

    swift_bridgeObjectRelease();
    v44 = HIBYTE(v43) & 0xF;
    if ((v43 & 0x2000000000000000) == 0)
      v44 = v41 & 0xFFFFFFFFFFFFLL;
    if (v44)
    {
      v45 = objc_msgSend(v19, sel_title);
      if (!v45)
        goto LABEL_200;
      v46 = v45;
      sub_2197529A8();

      v47 = objc_msgSend(v20, sel_title);
      if (!v47)
        goto LABEL_201;
      v48 = v47;
      sub_2197529A8();

      sub_21972F9DC();
      v49 = sub_219752AB0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v159 & 1) == (v49 != -1))
      {
        v11 = v149;
        v13 = v162;
        goto LABEL_51;
      }
      v15 = v18 + 1;
      v13 = v162;
      if (v18 + 1 >= v4)
      {
        ++v18;
        v11 = v149;
        goto LABEL_51;
      }
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      v13 = v162;
      if ((v159 & 1) != 0)
        goto LABEL_48;
      v15 = v18 + 1;
      if (v18 + 1 >= v4)
      {
        v11 = v149;
        goto LABEL_61;
      }
    }
LABEL_20:
    v19 = *(void **)(v13 + 8 * v15);
    v20 = *(void **)(v13 + 8 * v18);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v18 = v15;
    v22 = objc_msgSend(v19, sel_title);
    if (!v22)
      goto LABEL_195;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((v159 & 1) == 0)
  {
    v15 = v18;
    v11 = v149;
    v13 = v162;
    goto LABEL_61;
  }
  v15 = v18 + 1;
  v13 = v162;
  if (v18 + 1 < v4)
    goto LABEL_20;
  ++v18;
LABEL_48:
  v11 = v149;
  if (v18 >= v12)
    goto LABEL_53;
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:

  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:

  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  __break(1u);
LABEL_197:
  __break(1u);
LABEL_198:

  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  __break(1u);
LABEL_202:

  __break(1u);
LABEL_203:

  swift_release();
  result = sub_219752B64();
  __break(1u);
  return result;
}

uint64_t sub_21973BE9C(uint64_t *a1, void *a2)
{
  uint64_t v4;
  id v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  id v8;
  uint64_t v10[2];

  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v4 = *a1;
  v5 = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_21973AE98();
  v7 = *(_QWORD *)(v4 + 16);
  v10[0] = v4 + 32;
  v10[1] = v7;
  v8 = v5;
  sub_21973B188(v10, v8);

  sub_219752B34();
  return swift_release();
}

uint64_t sub_21973BF80(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v3 = v2;
  v5 = a1;
  v26 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_38;
  v24 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v24)
  {
    while (1)
    {
      v20 = v3;
      v21 = a2;
      v6 = 0;
      v22 = v5 & 0xFFFFFFFFFFFFFF8;
      v23 = v5 & 0xC000000000000001;
      while (v23)
      {
        v7 = (id)MEMORY[0x219A32588](v6, v5);
LABEL_9:
        v8 = v7;
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_37;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_219752408();
        swift_release();
        swift_release();
        v3 = (uint64_t)v25;
        if (v25)
        {
          v10 = objc_msgSend(v25, sel_ssid);
          swift_unknownObjectRelease();
          if (v10)
          {
            v3 = sub_2197529A8();
            v12 = v11;

            if (!a2)
              goto LABEL_19;
          }
          else
          {
            v3 = 0;
            v12 = 0;
            if (!a2)
            {
LABEL_19:
              v17 = 0;
              v14 = 0;
              if (!v12)
                goto LABEL_22;
              goto LABEL_26;
            }
          }
        }
        else
        {
          v12 = 0;
          if (!a2)
            goto LABEL_19;
        }
        v13 = objc_msgSend(a2, sel_network, v20);
        v14 = v13;
        if (v13)
        {
          v15 = v5;
          v16 = objc_msgSend(v13, sel_ssid);
          swift_unknownObjectRelease();
          if (v16)
          {
            v17 = sub_2197529A8();
            v14 = v18;

          }
          else
          {
            v17 = 0;
            v14 = 0;
          }
          v5 = v15;
          a2 = v21;
          if (!v12)
          {
LABEL_22:
            if (v14)
              goto LABEL_30;
            goto LABEL_4;
          }
        }
        else
        {
          v17 = 0;
          if (!v12)
            goto LABEL_22;
        }
LABEL_26:
        if (!v14)
        {
LABEL_30:
          swift_bridgeObjectRelease();
LABEL_31:
          sub_219752B28();
          v3 = *(_QWORD *)(v26 + 16);
          sub_219752B40();
          sub_219752B4C();
          sub_219752B34();
          goto LABEL_5;
        }
        if (v3 == v17 && v12 == v14)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        v3 = sub_219752BE8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0)
          goto LABEL_31;
LABEL_4:

LABEL_5:
        ++v6;
        if (v9 == v24)
          return v26;
      }
      if (v6 < *(_QWORD *)(v22 + 16))
        break;
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      v24 = sub_219752B7C();
      if (!v24)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v5 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21973C27C(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;

  v3 = v2;
  v24 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_32;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v20 = v3;
      v21 = v5;
      v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (id)MEMORY[0x219A32588](v6, a1);
LABEL_9:
        v8 = v7;
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_31;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_219752408();
        swift_release();
        swift_release();
        v3 = (uint64_t)v23;
        if (v23)
        {
          v10 = objc_msgSend(v23, sel_ssid);
          swift_unknownObjectRelease();
          if (v10)
          {
            v3 = sub_2197529A8();
            v12 = v11;

            goto LABEL_15;
          }
          v3 = 0;
        }
        v12 = 0;
LABEL_15:
        v13 = objc_msgSend(a2, sel_ssid, v20);
        if (v13)
        {
          v14 = v13;
          v15 = sub_2197529A8();
          v17 = v16;

          if (v12)
          {
            v18 = v21;
            if (!v17)
              goto LABEL_24;
            if (v3 == v15 && v12 == v17)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_5;
            }
            v3 = sub_219752BE8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v3 & 1) == 0)
              goto LABEL_25;
          }
          else
          {
            v18 = v21;
            if (v17)
            {
LABEL_24:
              swift_bridgeObjectRelease();
LABEL_25:
              sub_219752B28();
              v3 = *(_QWORD *)(v24 + 16);
              sub_219752B40();
              sub_219752B4C();
              sub_219752B34();
              goto LABEL_5;
            }
          }
        }
        else
        {
          v18 = v21;
          if (v12)
            goto LABEL_24;
        }

LABEL_5:
        ++v6;
        if (v9 == v18)
          return v24;
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      v5 = sub_219752B7C();
      if (!v5)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21973C508(void *a1, void *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;

  result = (uint64_t)objc_msgSend(a1, sel_title);
  if (!result)
  {
    __break(1u);
    goto LABEL_24;
  }
  v5 = (void *)result;
  v6 = sub_2197529A8();
  v8 = v7;

  swift_bridgeObjectRelease();
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v9)
  {
    result = (uint64_t)objc_msgSend(a2, sel_title);
    if (!result)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v10 = (void *)result;
    v11 = sub_2197529A8();
    v13 = v12;

    swift_bridgeObjectRelease();
    v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0)
      v14 = v11 & 0xFFFFFFFFFFFFLL;
    if (!v14)
      return 1;
  }
  result = (uint64_t)objc_msgSend(a1, sel_title);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v15 = (void *)result;
  v16 = sub_2197529A8();
  v18 = v17;

  swift_bridgeObjectRelease();
  v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0)
    v19 = v16 & 0xFFFFFFFFFFFFLL;
  if (!v19)
    return 1;
  result = (uint64_t)objc_msgSend(a2, sel_title);
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v20 = (void *)result;
  v21 = sub_2197529A8();
  v23 = v22;

  swift_bridgeObjectRelease();
  v24 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0)
    v24 = v21 & 0xFFFFFFFFFFFFLL;
  if (v24)
  {
    result = (uint64_t)objc_msgSend(a1, sel_title);
    if (result)
    {
      v25 = (void *)result;
      sub_2197529A8();

      result = (uint64_t)objc_msgSend(a2, sel_title);
      if (result)
      {
        v26 = (void *)result;
        sub_2197529A8();

        sub_21972F9DC();
        v27 = sub_219752AB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v27 == -1;
      }
      goto LABEL_28;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t sub_21973C728@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973C74C(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973C770@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973C794(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973C7B8()
{
  return sub_219735AE0();
}

void sub_21973C7C0()
{
  uint64_t v0;

  sub_219735DE8(*(_QWORD *)(v0 + 16));
}

uint64_t type metadata accessor for NetworkListDataSource()
{
  uint64_t result;

  result = qword_255096580;
  if (!qword_255096580)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21973C804()
{
  uint64_t v0;

  return sub_219736A58(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t _s9WiFiKitUI21NetworkListDataSourceC16setAssociatingPH03newK0ySo09WFNetworkF6Record_pSg_tF_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t aBlock[6];
  uint64_t v43;

  v2 = sub_219752900();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_219752918();
  v39 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BEE4AF8];
  v10 = sub_2197314C4(MEMORY[0x24BEE4AF8]);
  v43 = v10;
  if (a1 && (v11 = v10, (v12 = objc_msgSend(a1, sel_ssid)) != 0))
  {
    v13 = v12;
    v14 = sub_2197529A8();
    v15 = v9;
    v17 = v16;

    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v11;
    v43 = 0x8000000000000000;
    v19 = v17;
    v9 = v15;
    sub_21973A868(v14, v19, 0x4E6B726F7774656ELL, 0xEB00000000656D61, isUniquelyReferenced_nonNull_native);
    v43 = aBlock[0];
  }
  else
  {
    sub_21973A28C(0x4E6B726F7774656ELL, 0xEB00000000656D61);
  }
  swift_bridgeObjectRelease();
  if (qword_255095E80 != -1)
    swift_once();
  v20 = sub_2197523D8();
  __swift_project_value_buffer(v20, (uint64_t)qword_255098550);
  swift_unknownObjectRetain_n();
  v21 = sub_2197523C0();
  v22 = sub_219752A44();
  if (os_log_type_enabled(v21, v22))
  {
    v36 = v5;
    v37 = v3;
    v38 = v2;
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    aBlock[0] = v24;
    *(_DWORD *)v23 = 136315394;
    v41 = sub_219738DB8(0xD000000000000018, 0x8000000219765830, aBlock);
    sub_219752A98();
    *(_WORD *)(v23 + 12) = 2080;
    if (a1 && (v25 = objc_msgSend(a1, sel_ssid)) != 0)
    {
      v26 = v25;
      v27 = sub_2197529A8();
      v29 = v28;

    }
    else
    {
      v27 = 0;
      v29 = 0xE000000000000000;
    }
    v41 = sub_219738DB8(v27, v29, aBlock);
    sub_219752A98();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2196CC000, v21, v22, "%s: posting tap PH notification for : %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v24, -1, -1);
    MEMORY[0x219A32EB8](v23, -1, -1);

    v3 = v37;
    v2 = v38;
    v5 = v36;
    v9 = MEMORY[0x24BEE4AF8];
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_219739420();
  v30 = (void *)sub_219752A68();
  v31 = v43;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v31;
  aBlock[4] = (uint64_t)sub_21973D1FC;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_137;
  v33 = _Block_copy(aBlock);
  swift_release();
  sub_21975290C();
  aBlock[0] = v9;
  sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197299AC((unint64_t *)&qword_255095FC0, (uint64_t *)&unk_2550964B0, MEMORY[0x24BEE12C8]);
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v8, v5, v33);
  _Block_release(v33);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v8, v40);
}

uint64_t sub_21973CCD0()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_21973CCDC()
{
  return type metadata accessor for NetworkListDataSource();
}

void sub_21973CCE4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_21973CEAC(319, &qword_255096590, &qword_255096480);
  if (v0 <= 0x3F)
  {
    sub_21973CEAC(319, &qword_255096598, &qword_255096488);
    if (v1 <= 0x3F)
    {
      sub_21973CE68(319, &qword_2550965A0);
      if (v2 <= 0x3F)
      {
        sub_21973CEAC(319, &qword_2550965A8, (uint64_t *)&unk_255096490);
        if (v3 <= 0x3F)
        {
          sub_21973CE68(319, (unint64_t *)&qword_2550965B0);
          if (v4 <= 0x3F)
          {
            sub_21973CEAC(319, &qword_255096800, &qword_255096790);
            if (v5 <= 0x3F)
              swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_21973CE68(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_219752420();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_21973CEAC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_219752420();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_21973CEF8@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973CF1C(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973CF40()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21973CF6C()
{
  uint64_t v0;

  return sub_219737670(*(void **)(v0 + 16));
}

uint64_t sub_21973CF80@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_21973CFA4(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_21973CFC8@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973CFEC(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973D010@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973D034(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973D058@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973D07C(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973D0A0@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973D0C4(uint64_t a1, void **a2)
{
  return sub_2197389C8(a1, a2);
}

uint64_t sub_21973D0E8@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_21973D10C(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_21973D130@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973D158@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21973D180()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21973D1A4(uint64_t a1)
{
  uint64_t v1;

  return sub_219734E0C(a1, *(_QWORD *)(v1 + 16));
}

void sub_21973D1AC(uint64_t a1)
{
  uint64_t v1;

  sub_219734C80(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21973D1B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21973D1C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21973D1D8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21973D1FC()
{
  uint64_t v0;

  sub_219736C08(*(_QWORD *)(v0 + 16));
}

_OWORD *sub_21973D204(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21973D214()
{
  return swift_release();
}

uint64_t sub_21973D21C()
{
  uint64_t v0;

  return sub_2197360B8(*(void **)(v0 + 16));
}

uint64_t sub_21973D234()
{
  uint64_t v0;

  return sub_219735B3C(*(void **)(v0 + 16));
}

uint64_t sub_21973D24C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21973D274()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21973D2C0()
{
  return sub_219732F54();
}

uint64_t sub_21973D2D0()
{
  uint64_t v0;

  return sub_219732FB8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_21973D2F0()
{
  uint64_t v0;

  return sub_219733E3C(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_21973D308()
{
  uint64_t v0;

  return sub_219738014(*(void **)(v0 + 16));
}

uint64_t sub_21973D310()
{
  uint64_t v0;

  return sub_2197380C4(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21973D328()
{
  uint64_t v0;

  return sub_2197382D4(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21973D370(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21973D48C()
{
  uint64_t v0;
  uint64_t result;
  void (**v2)(_QWORD);
  void (*v3)(_QWORD);
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  if (v4 != v4)
  {
    v2 = (void (**)(_QWORD))(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler);
    result = swift_beginAccess();
    v3 = *v2;
    if (*v2)
    {
      swift_retain();
      v3(v4);
      return sub_219731D9C((uint64_t)v3);
    }
  }
  return result;
}

uint64_t sub_21973D594()
{
  return sub_21973D808();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.powerState(uint64_t a1)
{
  return sub_21973D78C(a1, type metadata accessor for WFPowerState);
}

uint64_t sub_21973D5B4()
{
  void *v0;
  uint64_t result;
  id v2;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v3 == 1
    || (swift_getKeyPath(), swift_getKeyPath(), sub_219752408(), swift_release(), result = swift_release(), !v3))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v0;
    sub_219752414();
    return sub_21973D48C();
  }
  return result;
}

uint64_t sub_21973D6E4()
{
  return sub_219731690();
}

uint64_t sub_21973D6F8()
{
  return sub_21973D808();
}

uint64_t sub_21973D70C()
{
  return sub_21973D808();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.WAPIEnabled()
{
  return sub_2197523FC();
}

uint64_t sub_21973D74C()
{
  return sub_21973D808();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.askToJoinMode(uint64_t a1)
{
  return sub_21973D78C(a1, type metadata accessor for WFAskToJoinMode);
}

uint64_t sub_21973D76C()
{
  return sub_219731690();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.autoInstantHotspotOption(uint64_t a1)
{
  return sub_21973D78C(a1, type metadata accessor for WFAutoInstantHotspotJoinOption);
}

uint64_t sub_21973D78C(uint64_t a1, void (*a2)(_QWORD))
{
  a2(0);
  return sub_2197523FC();
}

uint64_t sub_21973D7CC()
{
  return sub_219731690();
}

uint64_t sub_21973D7E0()
{
  return sub_21973D808();
}

uint64_t sub_21973D7F4()
{
  return sub_21973D808();
}

uint64_t sub_21973D808()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NetworkListConfigDataSource.userAutoJoinEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.userAutoJoinEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.userAutoJoinEnabled.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.autoInstantHotspotTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListConfigDataSource.autoInstantHotspotTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListConfigDataSource.autoInstantHotspotTapHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.askToJoinModeTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListConfigDataSource.askToJoinModeTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListConfigDataSource.askToJoinModeTapHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.WAPISwitchHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListConfigDataSource.WAPISwitchHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListConfigDataSource.WAPISwitchHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.dataUsageTapHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (void (*)(_QWORD, _QWORD))sub_2197283A8);
}

uint64_t NetworkListConfigDataSource.dataUsageTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_219731D9C);
}

uint64_t (*NetworkListConfigDataSource.dataUsageTapHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.isChinaDevice.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.isChinaDevice.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.isChinaDevice.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.isCellularDevice.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.isCellularDevice.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.isCellularDevice.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.powerToggleHandler.getter()
{
  return sub_219731E08(&OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (void (*)(_QWORD, _QWORD))sub_21973D3AC);
}

uint64_t NetworkListConfigDataSource.powerToggleHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_219731E7C(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t (*NetworkListConfigDataSource.powerToggleHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.autoUnlockEnabled.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.autoUnlockEnabled.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.autoUnlockEnabled.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall NetworkListConfigDataSource.setNetworkModificationRestriction(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _BYTE v22[4];
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock[6];

  v2 = v1;
  v3 = a1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_219752918();
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v24 = v8;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v23 = v3;
    v26 = sub_219738DB8(0xD000000000000025, 0x8000000219765C20, aBlock);
    LOBYTE(v3) = v23;
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set networkModificationRestriction: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    v17 = v16;
    v8 = v24;
    MEMORY[0x219A32EB8](v17, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v18 = (void *)sub_219752A68();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v2;
  *(_BYTE *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_219740860;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  v20 = _Block_copy(aBlock);
  v21 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(_BYTE *, uint64_t))(v25 + 8))(v10, v8);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setPowerModificationRestriction(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _BYTE v22[4];
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock[6];

  v2 = v1;
  v3 = a1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_219752918();
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v24 = v8;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v23 = v3;
    v26 = sub_219738DB8(0xD000000000000023, 0x8000000219765C50, aBlock);
    LOBYTE(v3) = v23;
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set powerModificationRestriction: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    v17 = v16;
    v8 = v24;
    MEMORY[0x219A32EB8](v17, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v18 = (void *)sub_219752A68();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v2;
  *(_BYTE *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_219740920;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_6;
  v20 = _Block_copy(aBlock);
  v21 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(_BYTE *, uint64_t))(v25 + 8))(v10, v8);
}

uint64_t NetworkListConfigDataSource.setPowerState(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)v14 = 136315394;
    v21[1] = v14 + 4;
    v25 = sub_219738DB8(0xD000000000000011, 0x8000000219765C80, aBlock);
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 2048;
    v25 = a1;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set PowerState: %lu", (uint8_t *)v14, 0x16u);
    v15 = v22;
    swift_arrayDestroy();
    v8 = v23;
    MEMORY[0x219A32EB8](v15, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v16 = (void *)sub_219752A68();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v2;
  *(_QWORD *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_21974094C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  v18 = _Block_copy(aBlock);
  v19 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t sub_21973E830(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  sub_219752414();
  return sub_21973D5B4();
}

uint64_t NetworkListConfigDataSource.setAskToJoinOption(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)v14 = 136315394;
    v21[1] = v14 + 4;
    v25 = sub_219738DB8(0xD000000000000016, 0x8000000219765CA0, aBlock);
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 2048;
    v25 = a1;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set AskToJoinOption: %ld", (uint8_t *)v14, 0x16u);
    v15 = v22;
    swift_arrayDestroy();
    v8 = v23;
    MEMORY[0x219A32EB8](v15, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v16 = (void *)sub_219752A68();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v2;
  *(_QWORD *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_219740978;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_18;
  v18 = _Block_copy(aBlock);
  v19 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t NetworkListConfigDataSource.setAutoInstantHotspotOption(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)v14 = 136315394;
    v21[1] = v14 + 4;
    v25 = sub_219738DB8(0xD00000000000001FLL, 0x8000000219765CC0, aBlock);
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 2048;
    v25 = a1;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set autoInstantHotspotOption: %ld", (uint8_t *)v14, 0x16u);
    v15 = v22;
    swift_arrayDestroy();
    v8 = v23;
    MEMORY[0x219A32EB8](v15, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v16 = (void *)sub_219752A68();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v2;
  *(_QWORD *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_2197409A0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_24;
  v18 = _Block_copy(aBlock);
  v19 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t sub_21973EFDC(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

uint64_t NetworkListConfigDataSource.setAutoInstantHotspotOptionChangedHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t NetworkListConfigDataSource.setAsktoJoinModeChangedHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t NetworkListConfigDataSource.setWAPISwitchHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

uint64_t NetworkListConfigDataSource.setDataUsageTapHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (void (*)(uint64_t, uint64_t))sub_2197283A8, (uint64_t (*)(uint64_t, uint64_t))sub_219731D9C);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setIsChinaDevice(_:)(Swift::Bool a1)
{
  sub_21973F8A0(a1, 0xD000000000000014, 0x8000000219765CE0, "%s: set isChinaDevice status: %{BOOL}d", &OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setIsCellularDevice(_:)(Swift::Bool a1)
{
  sub_21973F8A0(a1, 0xD000000000000017, 0x8000000219765D00, "%s: set autoUnlockEnabled status: %{BOOL}d", &OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setAutoUnlockEnabled(_:)(Swift::Bool a1)
{
  sub_21973F8A0(a1, 0xD000000000000018, 0x8000000219765D20, "%s: set autoUnlockEnabled status: %{BOOL}d", &OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setWAPIEnabled(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _BYTE v22[4];
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock[6];

  v2 = v1;
  v3 = a1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_219752918();
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_255095E80 != -1)
    swift_once();
  v11 = sub_2197523D8();
  __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
  v12 = sub_2197523C0();
  v13 = sub_219752A44();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v24 = v8;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136315394;
    v23 = v3;
    v26 = sub_219738DB8(0xD000000000000012, 0x8000000219765D40, aBlock);
    LOBYTE(v3) = v23;
    sub_219752A98();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v12, v13, "%s: set WAPIEnabled status: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    v17 = v16;
    v8 = v24;
    MEMORY[0x219A32EB8](v17, -1, -1);
    MEMORY[0x219A32EB8](v14, -1, -1);
  }

  sub_219739420();
  v18 = (void *)sub_219752A68();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v2;
  *(_BYTE *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_2197409C8;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2197315E4;
  aBlock[3] = (uint64_t)&block_descriptor_30;
  v20 = _Block_copy(aBlock);
  v21 = v2;
  swift_release();
  sub_21975290C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21974088C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
  sub_2197408D4();
  sub_219752ABC();
  MEMORY[0x219A324EC](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(_BYTE *, uint64_t))(v25 + 8))(v10, v8);
}

uint64_t sub_21973F7CC(void *a1)
{
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  v2 = a1;
  return sub_219752414();
}

Swift::Void __swiftcall NetworkListConfigDataSource.setUserAutoJoinEnabled(_:)(Swift::Bool a1)
{
  sub_21973F8A0(a1, 0xD00000000000001ALL, 0x8000000219765D60, "%s: set UserAutoJoinEnabled: %{BOOL}d", &OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
}

uint64_t sub_21973F8A0(char a1, uint64_t a2, unint64_t a3, const char *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t result;
  uint64_t v19[3];

  v10 = v5;
  if (qword_255095E80 != -1)
    swift_once();
  v12 = sub_2197523D8();
  __swift_project_value_buffer(v12, (uint64_t)qword_255098550);
  v13 = sub_2197523C0();
  v14 = sub_219752A44();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v19[0] = v16;
    *(_DWORD *)v15 = 136315394;
    sub_219738DB8(a2, a3, v19);
    sub_219752A98();
    *(_WORD *)(v15 + 12) = 1024;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v13, v14, a4, (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v16, -1, -1);
    MEMORY[0x219A32EB8](v15, -1, -1);
  }

  v17 = (_BYTE *)(v10 + *a5);
  result = swift_beginAccess();
  *v17 = a1 & 1;
  return result;
}

Swift::Void __swiftcall NetworkListConfigDataSource.setDataUsageHidden(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v2 = v1;
  if (qword_255095E80 != -1)
    swift_once();
  v4 = sub_2197523D8();
  __swift_project_value_buffer(v4, (uint64_t)qword_255098550);
  v5 = sub_2197523C0();
  v6 = sub_219752A44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136315394;
    sub_219738DB8(0xD000000000000016, 0x8000000219765D80, &v10);
    sub_219752A98();
    *(_WORD *)(v7 + 12) = 1024;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: set DataUsageHidden: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v8, -1, -1);
    MEMORY[0x219A32EB8](v7, -1, -1);
  }

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v10) = a1;
  v9 = v2;
  sub_219752414();
}

Swift::Void __swiftcall NetworkListConfigDataSource.setWAPISwitchHidden(_:)(Swift::Bool a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v2 = v1;
  if (qword_255095E80 != -1)
    swift_once();
  v4 = sub_2197523D8();
  __swift_project_value_buffer(v4, (uint64_t)qword_255098550);
  v5 = sub_2197523C0();
  v6 = sub_219752A44();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136315394;
    sub_219738DB8(0xD000000000000017, 0x8000000219765DA0, &v10);
    sub_219752A98();
    *(_WORD *)(v7 + 12) = 1024;
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v5, v6, "%s: set WAPISwitchHidden: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v8, -1, -1);
    MEMORY[0x219A32EB8](v7, -1, -1);
  }

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v10) = a1;
  v9 = v2;
  sub_219752414();
}

uint64_t NetworkListConfigDataSource.setPowerToggleHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_219734CF4(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (void (*)(uint64_t, uint64_t))sub_21973D3AC, (uint64_t (*)(uint64_t, uint64_t))sub_21973D3B0);
}

id NetworkListConfigDataSource.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NetworkListConfigDataSource.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  objc_class *v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint64_t v39;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096640);
  v36 = *(_QWORD *)(v1 - 8);
  v37 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096648);
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096650);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v0[OBJC_IVAR___WFNetworkListConfigDataSource__powerOn];
  LOBYTE(v39) = 0;
  v15 = v0;
  sub_2197523FC();
  v16 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v16(v14, v13, v10);
  v17 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__powerState];
  v39 = 2;
  type metadata accessor for WFPowerState(0);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v9, v6);
  v18 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__dataUsageHidden];
  LOBYTE(v39) = 1;
  sub_2197523FC();
  v16(v18, v13, v10);
  v19 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__WAPISwitchHidden];
  LOBYTE(v39) = 1;
  sub_2197523FC();
  v16(v19, v13, v10);
  v20 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__WAPIEnabled];
  LOBYTE(v39) = 1;
  sub_2197523FC();
  v16(v20, v13, v10);
  v21 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__askToJoinMode];
  v39 = 1;
  type metadata accessor for WFAskToJoinMode(0);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v21, v5, v34);
  v22 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__autoInstantHotspotOption];
  v39 = 2;
  type metadata accessor for WFAutoInstantHotspotJoinOption(0);
  v23 = v35;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v22, v23, v37);
  v24 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__networkModificationRestrictionOn];
  LOBYTE(v39) = 0;
  sub_2197523FC();
  v16(v24, v13, v10);
  v25 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__powerModificationRestrictionOn];
  LOBYTE(v39) = 0;
  sub_2197523FC();
  v16(v25, v13, v10);
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled] = 1;
  v26 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  v27 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler];
  *(_QWORD *)v27 = 0;
  *((_QWORD *)v27 + 1) = 0;
  v28 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler];
  *(_QWORD *)v28 = 0;
  *((_QWORD *)v28 + 1) = 0;
  v29 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler];
  *(_QWORD *)v29 = 0;
  *((_QWORD *)v29 + 1) = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice] = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice] = 0;
  v30 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler];
  *(_QWORD *)v30 = 0;
  *((_QWORD *)v30 + 1) = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled] = 0;

  v31 = (objc_class *)type metadata accessor for NetworkListConfigDataSource();
  v38.receiver = v15;
  v38.super_class = v31;
  return objc_msgSendSuper2(&v38, sel_init);
}

id NetworkListConfigDataSource.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListConfigDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_219740568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for NetworkListConfigDataSource();
  result = sub_2197523E4();
  *a1 = result;
  return result;
}

uint64_t sub_2197405A4@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_2197405B8(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_2197405CC@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_2197405E0(uint64_t a1, void **a2)
{
  void *v2;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  sub_219752414();
  return sub_21973D48C();
}

uint64_t sub_219740658@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_21974066C(uint64_t a1, void **a2)
{
  void *v2;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  sub_219752414();
  return sub_21973D5B4();
}

uint64_t sub_2197406E4@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_2197406F8(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_21974070C@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740720(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740734@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219740748(uint64_t a1, void **a2)
{
  return sub_219740784(a1, a2);
}

uint64_t sub_21974075C@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219740770(uint64_t a1, void **a2)
{
  return sub_219740784(a1, a2);
}

uint64_t sub_219740784(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_219752414();
}

uint64_t sub_2197407EC@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740800(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740814@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740828(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_21974083C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219740860()
{
  uint64_t v0;

  return sub_21973F7CC(*(void **)(v0 + 16));
}

unint64_t sub_21974088C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255095FB0;
  if (!qword_255095FB0)
  {
    v1 = sub_219752900();
    result = MEMORY[0x219A32E40](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255095FB0);
  }
  return result;
}

unint64_t sub_2197408D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255095FC0;
  if (!qword_255095FC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2550964B0);
    result = MEMORY[0x219A32E40](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255095FC0);
  }
  return result;
}

uint64_t sub_219740920()
{
  uint64_t v0;

  return sub_21973F7CC(*(void **)(v0 + 16));
}

uint64_t sub_21974094C()
{
  uint64_t v0;

  return sub_21973E830(*(void **)(v0 + 16));
}

uint64_t sub_219740954()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219740978()
{
  uint64_t v0;

  return sub_21973EFDC(*(void **)(v0 + 16));
}

uint64_t sub_2197409A0()
{
  uint64_t v0;

  return sub_21973EFDC(*(void **)(v0 + 16));
}

uint64_t sub_2197409C8()
{
  uint64_t v0;

  return sub_21973F7CC(*(void **)(v0 + 16));
}

uint64_t sub_2197409F4@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740A18(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740A3C@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740A60(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t type metadata accessor for NetworkListConfigDataSource()
{
  uint64_t result;

  result = qword_2550966B8;
  if (!qword_2550966B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_219740AC0()
{
  return type metadata accessor for NetworkListConfigDataSource();
}

void sub_219740AC8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_219740BDC();
  if (v0 <= 0x3F)
  {
    sub_219740C30(319, &qword_2550966C8, type metadata accessor for WFPowerState);
    if (v1 <= 0x3F)
    {
      sub_219740C30(319, &qword_2550966D0, type metadata accessor for WFAskToJoinMode);
      if (v2 <= 0x3F)
      {
        sub_219740C30(319, &qword_2550966D8, type metadata accessor for WFAutoInstantHotspotJoinOption);
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

void sub_219740BDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2550965B0)
  {
    v0 = sub_219752420();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2550965B0);
  }
}

void sub_219740C30(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_219752420();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_219740C7C@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740CA0(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740CC4@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740CE8(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740D0C@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219740D30(uint64_t a1, void **a2)
{
  return sub_219740784(a1, a2);
}

uint64_t sub_219740D54@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219740D78(uint64_t a1, void **a2)
{
  return sub_219740784(a1, a2);
}

uint64_t sub_219740D9C@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740DC0(uint64_t a1, void **a2)
{
  return sub_219738AD8(a1, a2);
}

uint64_t sub_219740DE4@<X0>(_QWORD *a1@<X8>)
{
  return sub_21973877C(a1);
}

uint64_t sub_219740E0C@<X0>(_BYTE *a1@<X8>)
{
  return sub_219738A4C(a1);
}

uint64_t sub_219740E34()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_219740E58(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

ValueMetadata *type metadata accessor for AssociationStateView()
{
  return &type metadata for AssociationStateView;
}

uint64_t sub_219740EDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_219740EEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v2 = sub_219752438();
  v41 = *(_QWORD *)(v2 - 8);
  v42 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v40 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2197526B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096B90);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550966E0);
  v38 = *(_QWORD *)(v12 - 8);
  v39 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v37 - v20;
  switch(a1)
  {
    case 0:
      v43 = 0;
      LOBYTE(v44) = 1;
      return sub_219752894();
    case 1:
      v37 = v19;
      sub_219752444();
      sub_2197526A8();
      sub_2197299AC(&qword_255096BC0, (uint64_t *)&unk_255096B90, MEMORY[0x24BDEBC00]);
      sub_21974134C();
      sub_2197527BC();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      v23 = v40;
      v22 = v41;
      v24 = v42;
      (*(void (**)(char *, _QWORD, uint64_t))(v41 + 104))(v40, *MEMORY[0x24BDEB490], v42);
      KeyPath = swift_getKeyPath();
      v26 = (uint64_t *)&v21[*(int *)(v37 + 36)];
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096430);
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))((char *)v26 + *(int *)(v27 + 28), v23, v24);
      *v26 = KeyPath;
      v29 = v38;
      v28 = v39;
      (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v21, v14, v39);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v28);
      sub_2197414A4((uint64_t)v21, (uint64_t)v18);
      sub_2197414EC();
      v30 = sub_219752894();
      sub_2197415D0((uint64_t)v21);
      return v30;
    case 2:
      v31 = sub_21975284C();
      v32 = sub_21975281C();
      v33 = swift_getKeyPath();
      sub_219752714();
      v34 = sub_219752720();
      swift_release();
      v35 = swift_getKeyPath();
      v43 = v31;
      v44 = v33;
      v45 = v32;
      v46 = v35;
      v47 = v34;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096B50);
      sub_219741700();
      return sub_219752894();
  }
  v43 = 0;
  v44 = 0xE000000000000000;
  sub_219752AF8();
  sub_2197529CC();
  v48 = a1;
  type metadata accessor for WFNetworkState(0);
  sub_219752B58();
  result = sub_219752B70();
  __break(1u);
  return result;
}

uint64_t sub_219741324@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = sub_219740EEC(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_21974134C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550966E8;
  if (!qword_2550966E8)
  {
    v1 = sub_2197526B4();
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF07A8], v1);
    atomic_store(result, (unint64_t *)&qword_2550966E8);
  }
  return result;
}

uint64_t sub_219741394@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21975254C();
  *a1 = result;
  return result;
}

uint64_t sub_2197413BC()
{
  swift_retain();
  return sub_219752558();
}

uint64_t sub_2197413E4()
{
  return sub_219752504();
}

uint64_t sub_219741404()
{
  return sub_219752504();
}

uint64_t sub_219741424(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_219752438();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x219A31F88](v4);
}

uint64_t sub_2197414A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2197414EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2550966F0;
  if (!qword_2550966F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096BA0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255096B90);
    v2[3] = sub_2197526B4();
    v2[4] = sub_2197299AC(&qword_255096BC0, (uint64_t *)&unk_255096B90, MEMORY[0x24BDEBC00]);
    v2[5] = sub_21974134C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_2197299AC(&qword_2550966F8, &qword_255096430, MEMORY[0x24BDF1028]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2550966F0);
  }
  return result;
}

uint64_t sub_2197415D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_219741610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21975251C();
  *a1 = result;
  return result;
}

uint64_t sub_219741638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21975251C();
  *a1 = result;
  return result;
}

uint64_t sub_219741660()
{
  swift_retain();
  return sub_219752528();
}

uint64_t sub_219741688()
{
  swift_retain();
  return sub_219752528();
}

uint64_t sub_2197416B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21975254C();
  *a1 = result;
  return result;
}

uint64_t sub_2197416D8()
{
  swift_retain();
  return sub_219752558();
}

unint64_t sub_219741700()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096700;
  if (!qword_255096700)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255096B50);
    v2[0] = sub_219730B40();
    v2[1] = sub_2197299AC((unint64_t *)&unk_255096B70, &qword_255096400, MEMORY[0x24BDF1028]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096700);
  }
  return result;
}

uint64_t sub_219741784()
{
  return MEMORY[0x24BDF4760];
}

id WFNetworkListViewController.networkListDataSource.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___WFNetworkListViewController_networkListDataSource);
  swift_beginAccess();
  return *v1;
}

void WFNetworkListViewController.networkListDataSource.setter(void *a1)
{
  sub_219741874(a1, &OBJC_IVAR___WFNetworkListViewController_networkListDataSource);
}

uint64_t (*WFNetworkListViewController.networkListDataSource.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id WFNetworkListViewController.networkConfigDataSource.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource);
  swift_beginAccess();
  return *v1;
}

void WFNetworkListViewController.networkConfigDataSource.setter(void *a1)
{
  sub_219741874(a1, &OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource);
}

void sub_219741874(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*WFNetworkListViewController.networkConfigDataSource.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall WFNetworkListViewController.viewDidLoad()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t *v7;
  objc_class *v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  _BYTE v48[24];
  objc_super v49;

  v1 = v0;
  v2 = type metadata accessor for NetworkList();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = &v48[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t *)&v48[-v6];
  v8 = (objc_class *)type metadata accessor for WFNetworkListViewController();
  v49.receiver = v1;
  v49.super_class = v8;
  objc_msgSendSuper2(&v49, sel_viewDidLoad);
  v9 = (void **)&v1[OBJC_IVAR___WFNetworkListViewController_networkListDataSource];
  swift_beginAccess();
  v10 = *v9;
  v11 = (void **)&v1[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource];
  swift_beginAccess();
  v12 = *v11;
  v13 = (void *)objc_opt_self();
  v14 = v10;
  v15 = v12;
  v16 = objc_msgSend(v13, sel_defaultCenter);
  if (qword_255095EA0 != -1)
    swift_once();
  v17 = (id)qword_255098628;
  sub_219752A80();
  v18 = (uint64_t *)((char *)v7 + *(int *)(v2 + 28));
  *v18 = 0x4C20664F20706F54;
  v18[1] = 0xEB00000000747369;
  type metadata accessor for NetworkListDataSource();
  sub_21972996C((unint64_t *)&unk_255096820, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
  v19 = v14;
  *v7 = sub_21975248C();
  v7[1] = v20;
  type metadata accessor for NetworkListConfigDataSource();
  sub_21972996C(&qword_255096718, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
  v21 = sub_21975248C();
  v23 = v22;

  v7[2] = v21;
  v7[3] = v23;
  sub_219742048((uint64_t)v7, (uint64_t)v5);
  v24 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255096720));
  v25 = sub_2197525DC();
  v26 = OBJC_IVAR___WFNetworkListViewController_hostingController;
  v27 = *(void **)&v1[OBJC_IVAR___WFNetworkListViewController_hostingController];
  *(_QWORD *)&v1[OBJC_IVAR___WFNetworkListViewController_hostingController] = v25;

  v28 = *(void **)&v1[v26];
  if (!v28)
    goto LABEL_10;
  v29 = v28;
  objc_msgSend(v1, sel_addChildViewController_, v29);
  v30 = objc_msgSend(v29, sel_view);
  if (!v30)
  {
    __break(1u);
    goto LABEL_12;
  }
  v31 = v30;
  v32 = objc_msgSend(v1, sel_view);
  if (!v32)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v33 = v32;
  objc_msgSend(v32, sel_bounds);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  objc_msgSend(v31, sel_setFrame_, v35, v37, v39, v41);
  v42 = objc_msgSend(v29, sel_view);
  if (!v42)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v43 = v42;
  objc_msgSend(v42, sel_setAutoresizingMask_, 18);

  v44 = objc_msgSend(v1, sel_view);
  if (!v44)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v45 = v44;
  v46 = objc_msgSend(v29, sel_view);
  if (v46)
  {
    v47 = v46;
    objc_msgSend(v45, sel_addSubview_, v46);

    objc_msgSend(v29, sel_didMoveToParentViewController_, v1);
LABEL_10:
    sub_21974208C((uint64_t)v7);
    return;
  }
LABEL_15:
  __break(1u);
}

id WFNetworkListViewController.__allocating_init(networkListDataSource:networkListConfigDataSource:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___WFNetworkListViewController_hostingController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___WFNetworkListViewController_networkListDataSource] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

id WFNetworkListViewController.init(networkListDataSource:networkListConfigDataSource:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR___WFNetworkListViewController_hostingController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___WFNetworkListViewController_networkListDataSource] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

id WFNetworkListViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void WFNetworkListViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WFNetworkListViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFNetworkListViewController()
{
  return objc_opt_self();
}

uint64_t sub_219742048(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21974208C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *static WFNetworkRowConfigModel.settingsNetworkRowConfig()()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char *v3;

  v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  *v2 = 1;
  v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(_QWORD *)v3 = 1;
  return v1;
}

char *static WFNetworkRowConfigModel.modelFrom(rowConfig:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  char *v21;
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t (*v26)();
  uint64_t *v27;
  uint64_t v28;

  v3 = objc_msgSend(a1, sel_network);
  swift_unknownObjectRelease();
  if (v3)
  {
    v4 = objc_msgSend(objc_allocWithZone(v1), sel_init);
    sub_2197427F4(objc_msgSend(a1, sel_network));
    swift_getKeyPath();
    swift_getKeyPath();
    v5 = v4;
    sub_219752414();
    v6 = objc_msgSend(a1, sel_subtitle);
    if (v6)
    {
      v7 = v6;
      v8 = sub_2197529A8();
      v10 = v9;

    }
    else
    {
      v8 = 0;
      v10 = 0;
    }
    sub_219742D28(v8, v10);
    swift_getKeyPath();
    swift_getKeyPath();
    v16 = v5;
    sub_219752414();
    sub_2197432BC((uint64_t)objc_msgSend(a1, sel_connectionState));
    swift_getKeyPath();
    swift_getKeyPath();
    v17 = v16;
    sub_219752414();
    sub_219743768((char)objc_msgSend(a1, sel_problematicConnection));
    swift_getKeyPath();
    swift_getKeyPath();
    v18 = v17;
    sub_219752414();
    sub_219743C14((uint64_t)objc_msgSend(a1, sel_signalBars));
    swift_getKeyPath();
    swift_getKeyPath();
    v15 = (char *)v18;
    sub_219752414();
    v19 = objc_msgSend(a1, sel_context);
    v20 = &v15[OBJC_IVAR___WFNetworkRowConfig_context];
    swift_beginAccess();
    *(_QWORD *)v20 = v19;
    LOBYTE(v19) = objc_msgSend(a1, sel_hideConnectionState);
    v21 = &v15[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
    swift_beginAccess();
    *v21 = (char)v19;
    LOBYTE(v19) = objc_msgSend(a1, sel_showInfoButton);
    v22 = &v15[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
    swift_beginAccess();
    *v22 = (char)v19;
    v23 = objc_msgSend(a1, sel_infoButtonHandler);
    if (v23)
    {
      v24 = v23;
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = v24;
      v26 = sub_219744D00;
    }
    else
    {
      v26 = 0;
      v25 = 0;
    }
    v27 = (uint64_t *)&v15[OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler];
    swift_beginAccess();
    v28 = *v27;
    *v27 = (uint64_t)v26;
    v27[1] = v25;
    sub_219731D9C(v28);
  }
  else
  {
    if (qword_255095E80 != -1)
      swift_once();
    v11 = sub_2197523D8();
    __swift_project_value_buffer(v11, (uint64_t)qword_255098550);
    v12 = sub_2197523C0();
    v13 = sub_219752A50();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2196CC000, v12, v13, "nil network passed in when trying to construct network model.", v14, 2u);
      MEMORY[0x219A32EB8](v14, -1, -1);
    }

    return 0;
  }
  return v15;
}

uint64_t sub_21974258C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

char *static WFNetworkRowConfigModel.knownNetworkRowConfig()()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;

  v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
  swift_beginAccess();
  *v2 = 1;
  v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  *v3 = 1;
  v4 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(_QWORD *)v4 = 1;
  return v1;
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.network()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096480);
  return sub_2197523FC();
}

uint64_t sub_219742708()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

void sub_2197427F4(id a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v24 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_219752918();
  v7 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v10 = aBlock[0];
  if (aBlock[0])
  {
    v11 = objc_msgSend(aBlock[0], sel_ssid);
    swift_unknownObjectRelease();
    if (v11)
    {
      v12 = sub_2197529A8();
      v10 = v13;

      if (!a1)
      {
LABEL_10:
        v16 = 0;
        if (v10)
          goto LABEL_11;
LABEL_16:
        if (!a1)
          return;
        goto LABEL_17;
      }
    }
    else
    {
      v12 = 0;
      v10 = 0;
      if (!a1)
        goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
    if (!a1)
      goto LABEL_10;
  }
  v14 = objc_msgSend(a1, sel_ssid);
  if (v14)
  {
    v15 = v14;
    v16 = sub_2197529A8();
    a1 = v17;

    if (v10)
      goto LABEL_11;
    goto LABEL_16;
  }
  v16 = 0;
  a1 = 0;
  if (!v10)
    goto LABEL_16;
LABEL_11:
  if (!a1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_19:
    sub_219739420();
    v19 = (void *)sub_219752A68();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v2;
    aBlock[4] = sub_219744F4C;
    aBlock[5] = v20;
    aBlock[0] = (id)MEMORY[0x24BDAC760];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_2197315E4;
    aBlock[3] = &block_descriptor_60;
    v21 = _Block_copy(aBlock);
    v22 = v2;
    swift_release();
    sub_21975290C();
    aBlock[0] = (id)MEMORY[0x24BEE4AF8];
    sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
    sub_2197408D4();
    sub_219752ABC();
    MEMORY[0x219A324EC](0, v9, v6, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
    return;
  }
  if (v12 == v16 && v10 == a1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v18 = sub_219752BE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
    goto LABEL_19;
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.subtitle()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096790);
  return sub_2197523FC();
}

uint64_t sub_219742C24()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_219742D28(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t aBlock;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  uint64_t v26;

  v3 = v2;
  v6 = sub_219752900();
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_219752918();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  if (!v22)
  {
    if (!a2)
      return result;
LABEL_10:
    sub_219739420();
    v15 = (void *)sub_219752A68();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v3;
    v25 = sub_219744F4C;
    v26 = v16;
    aBlock = MEMORY[0x24BDAC760];
    v22 = 1107296256;
    v23 = sub_2197315E4;
    v24 = &block_descriptor_54;
    v17 = _Block_copy(&aBlock);
    v18 = v3;
    swift_release();
    sub_21975290C();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
    sub_2197408D4();
    sub_219752ABC();
    MEMORY[0x219A324EC](0, v12, v8, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  if (!a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (aBlock == a1 && v22 == a2)
    return swift_bridgeObjectRelease();
  v14 = sub_219752BE8();
  result = swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
    goto LABEL_10;
  return result;
}

uint64_t sub_219742FC0()
{
  type metadata accessor for WFNetworkRowConfigModel();
  sub_21972996C((unint64_t *)&unk_255096110, (uint64_t (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel, (uint64_t)&protocol conformance descriptor for WFNetworkRowConfigModel);
  sub_2197523E4();
  sub_2197523F0();
  return swift_release();
}

double sub_21974301C@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_219743098(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  swift_bridgeObjectRetain();
  sub_219742D28(v2, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = v4;
  return sub_219752414();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.connectionState()
{
  type metadata accessor for WFNetworkState(0);
  return sub_2197523FC();
}

uint64_t sub_2197431DC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2197432BC(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  if (aBlock[0] != a1)
  {
    sub_219739420();
    v13 = (void *)sub_219752A68();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v2;
    aBlock[4] = sub_219744F4C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2197315E4;
    aBlock[3] = &block_descriptor_48;
    v15 = _Block_copy(aBlock);
    v16 = v2;
    swift_release();
    sub_21975290C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
    sub_2197408D4();
    sub_219752ABC();
    MEMORY[0x219A324EC](0, v11, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_2197434F0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21974356C(uint64_t *a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  sub_2197432BC(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_219752414();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.problematicConnection()
{
  return sub_2197523FC();
}

uint64_t sub_219743688()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_219743768(char a1)
{
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  v2 = a1 & 1;
  v3 = sub_219752900();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_219752918();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  if (LOBYTE(aBlock[0]) != v2)
  {
    sub_219739420();
    v12 = (void *)sub_219752A68();
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v1;
    aBlock[4] = sub_219744F4C;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2197315E4;
    aBlock[3] = &block_descriptor_42;
    v14 = _Block_copy(aBlock);
    v15 = v1;
    swift_release();
    sub_21975290C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
    sub_2197408D4();
    sub_219752ABC();
    MEMORY[0x219A324EC](0, v10, v6, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return result;
}

uint64_t sub_21974399C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_219743A18(char *a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  sub_219743768(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_219752414();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.signalBars()
{
  return sub_2197523FC();
}

uint64_t sub_219743B34()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_219743C14(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_219752900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_219752918();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  if (aBlock[0] != a1)
  {
    sub_219739420();
    v13 = (void *)sub_219752A68();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v2;
    aBlock[4] = sub_219744F04;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2197315E4;
    aBlock[3] = &block_descriptor_36;
    v15 = _Block_copy(aBlock);
    v16 = v2;
    swift_release();
    sub_21975290C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21972996C((unint64_t *)&qword_255095FB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550964B0);
    sub_2197408D4();
    sub_219752ABC();
    MEMORY[0x219A324EC](0, v11, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_219743E48@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_219743EC4(uint64_t *a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  sub_219743C14(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_219752414();
}

uint64_t WFNetworkRowConfigModel.context.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___WFNetworkRowConfig_context;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t WFNetworkRowConfigModel.context.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___WFNetworkRowConfig_context);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.context.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.hideConnectionState.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.hideConnectionState.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.hideConnectionState.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.showInfoButton.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_showInfoButton);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.showInfoButton.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkRowConfig_showInfoButton);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.showInfoButton.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.isEditable.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.isEditable.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.isEditable.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.infoButtonHandler.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_2197283A8(*v1);
  return v2;
}

uint64_t WFNetworkRowConfigModel.infoButtonHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_219731D9C(v6);
}

uint64_t (*WFNetworkRowConfigModel.infoButtonHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id WFNetworkRowConfigModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *static WFNetworkRowConfigModel.setupNetworkRowConfig()()
{
  objc_class *v0;
  char *v1;
  char *v2;
  char *v3;

  v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  *v2 = 0;
  v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(_QWORD *)v3 = 2;
  return v1;
}

id WFNetworkRowConfigModel.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  objc_class *v25;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096798);
  v33 = *(_QWORD *)(v1 - 8);
  v34 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v32 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E0);
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550967A8);
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550967B0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096500);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v0[OBJC_IVAR___WFNetworkRowConfig__network];
  v36 = 0;
  v17 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096480);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  v18 = &v17[OBJC_IVAR___WFNetworkRowConfig__subtitle];
  v36 = 0;
  v37 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096790);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v18, v11, v8);
  v19 = &v17[OBJC_IVAR___WFNetworkRowConfig__connectionState];
  v36 = 0;
  type metadata accessor for WFNetworkState(0);
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v19, v7, v28);
  v20 = &v17[OBJC_IVAR___WFNetworkRowConfig__problematicConnection];
  LOBYTE(v36) = 0;
  v21 = v29;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v20, v21, v31);
  v22 = &v17[OBJC_IVAR___WFNetworkRowConfig__signalBars];
  v36 = 0;
  v23 = v32;
  sub_2197523FC();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v22, v23, v34);
  *(_QWORD *)&v17[OBJC_IVAR___WFNetworkRowConfig_context] = 1;
  v17[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState] = 0;
  v17[OBJC_IVAR___WFNetworkRowConfig_showInfoButton] = 0;
  v17[OBJC_IVAR___WFNetworkRowConfig_isEditable] = 1;
  v24 = &v17[OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler];
  *(_QWORD *)v24 = 0;
  *((_QWORD *)v24 + 1) = 0;

  v25 = (objc_class *)type metadata accessor for WFNetworkRowConfigModel();
  v35.receiver = v17;
  v35.super_class = v25;
  return objc_msgSendSuper2(&v35, sel_init);
}

id WFNetworkRowConfigModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFNetworkRowConfigModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_219744C68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for WFNetworkRowConfigModel();
  result = sub_2197523E4();
  *a1 = result;
  return result;
}

uint64_t sub_219744CA4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_219744CDC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_219744D00()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t type metadata accessor for WFNetworkRowConfigModel()
{
  uint64_t result;

  result = qword_2550967E8;
  if (!qword_2550967E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_219744D48()
{
  return type metadata accessor for WFNetworkRowConfigModel();
}

void sub_219744D50()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_21973CEAC(319, &qword_255096590, &qword_255096480);
  if (v0 <= 0x3F)
  {
    sub_21973CEAC(319, &qword_255096800, &qword_255096790);
    if (v1 <= 0x3F)
    {
      sub_219744E8C();
      if (v2 <= 0x3F)
      {
        sub_21973CE68(319, (unint64_t *)&qword_2550965B0);
        if (v3 <= 0x3F)
        {
          sub_21973CE68(319, &qword_255096818);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_219744E8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255096808)
  {
    type metadata accessor for WFNetworkState(255);
    v0 = sub_219752420();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255096808);
  }
}

uint64_t sub_219744EE0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_219744F04()
{
  return sub_219742FC0();
}

uint64_t sub_219744F60(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0x7473694C6E616373;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0x80000002197651F0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0x7473694C6E616373;
  if ((a2 & 1) != 0)
    v6 = 0x80000002197651F0;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_219752BE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_219745004(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x219A32588](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_219752B28();
          sub_219752B40();
          v4 = v15;
          sub_219752B4C();
          sub_219752B34();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_219752B7C();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2197451A8(float a1)
{
  BOOL v1;
  BOOL v2;
  uint64_t result;
  float v4;
  uint64_t v5;

  if (a1 >= 0.0)
  {
    v2 = a1 == 1.0;
    v1 = a1 >= 1.0;
  }
  else
  {
    v1 = 1;
    v2 = 0;
  }
  if (!v2 && v1)
    return 0;
  v4 = ceilf(a1 * 3.0);
  if ((~LODWORD(v4) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v4 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v4 >= 9.2234e18)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  v5 = (uint64_t)v4;
  if ((uint64_t)v4 >= 3)
    v5 = 3;
  if (v5 <= 1)
    return 1;
  else
    return v5;
}

void NetworkList.init(networkDataSource:configDataSource:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for NetworkList();
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_255095EA0 != -1)
    swift_once();
  v6 = (id)qword_255098628;
  sub_219752A80();
  v7 = (uint64_t *)((char *)a2 + *(int *)(v4 + 28));
  *v7 = 0x4C20664F20706F54;
  v7[1] = 0xEB00000000747369;
  type metadata accessor for NetworkListDataSource();
  sub_21972996C((unint64_t *)&unk_255096820, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
  v8 = a1;
  *a2 = sub_21975248C();
  a2[1] = v9;
  type metadata accessor for NetworkListConfigDataSource();
  sub_21972996C(&qword_255096718, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
  v10 = sub_21975248C();
  v12 = v11;

  a2[2] = v10;
  a2[3] = v12;
}

uint64_t type metadata accessor for NetworkList()
{
  uint64_t result;

  result = qword_255096890;
  if (!qword_255096890)
    return swift_getSingletonMetadata();
  return result;
}

WiFiKitUI::NetworkListMode_optional __swiftcall NetworkListMode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  WiFiKitUI::NetworkListMode_optional v2;

  v1 = sub_219752BC4();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = WiFiKitUI_NetworkListMode_preferredNetworkList;
  else
    v2.value = WiFiKitUI_NetworkListMode_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t NetworkListMode.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x7473694C6E616373;
}

uint64_t sub_219745454(char *a1, char *a2)
{
  return sub_219744F60(*a1, *a2);
}

uint64_t sub_219745460()
{
  return sub_219745468();
}

uint64_t sub_219745468()
{
  sub_219752C00();
  sub_2197529C0();
  swift_bridgeObjectRelease();
  return sub_219752C18();
}

uint64_t sub_2197454EC()
{
  return sub_2197454F4();
}

uint64_t sub_2197454F4()
{
  sub_2197529C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_219745550()
{
  return sub_219745558();
}

uint64_t sub_219745558()
{
  sub_219752C00();
  sub_2197529C0();
  swift_bridgeObjectRelease();
  return sub_219752C18();
}

uint64_t sub_2197455D8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_219752BC4();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_219745634@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = NetworkListMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21974565C()
{
  uint64_t result;

  result = sub_219752984();
  qword_255098610 = result;
  return result;
}

uint64_t sub_219745690()
{
  uint64_t result;

  result = sub_219752984();
  qword_255098618 = result;
  return result;
}

uint64_t sub_2197456C4()
{
  uint64_t result;

  result = sub_219752984();
  qword_255098620 = result;
  return result;
}

uint64_t sub_2197456F8()
{
  uint64_t result;

  result = sub_219752984();
  qword_255098628 = result;
  return result;
}

uint64_t property wrapper backing initializer of NetworkList.networkDataSource(uint64_t a1)
{
  return sub_219745764(a1, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListDataSource, (unint64_t *)&unk_255096820, (uint64_t)&protocol conformance descriptor for NetworkListDataSource);
}

uint64_t property wrapper backing initializer of NetworkList.configDataSource(uint64_t a1)
{
  return sub_219745764(a1, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, &qword_255096718, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
}

uint64_t sub_219745764(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  a2(0);
  sub_21972996C(a3, a2, a4);
  return sub_21975248C();
}

uint64_t NetworkList.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v3 = type metadata accessor for NetworkList();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  sub_219730C60(v1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  result = sub_219745FA8((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a1 = sub_219745FEC;
  a1[1] = v8;
  return result;
}

uint64_t sub_219745878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t (**v68)();
  _BYTE *v69;
  uint64_t v70;
  _BYTE *v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE v76[12];
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(_BYTE *, uint64_t, uint64_t);
  uint64_t v86;
  _BYTE *v87;
  _BYTE *v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  _BYTE *v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  uint64_t v103;
  char v104;
  char v105;
  char v106;
  _BYTE v107[224];
  _BYTE v108[224];
  __int128 v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  _QWORD v136[2];
  char v137;
  uint64_t v138;

  v99 = a3;
  v5 = type metadata accessor for NetworkList();
  v92 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v92 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v96 = &v76[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v93 = sub_2197524C8();
  v91 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v86 = v7;
  v88 = &v76[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v100 = sub_219752A8C();
  v103 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v87 = &v76[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550968E0);
  v90 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v102 = &v76[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550968E8);
  MEMORY[0x24BDAC7A8](v98);
  v95 = &v76[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550968F0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v97 = &v76[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v89 = &v76[-v15];
  MEMORY[0x24BDAC7A8](v14);
  v101 = &v76[-v16];
  v17 = *(void **)(a2 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v18 = v17;
  sub_219752408();

  swift_release();
  swift_release();
  if (LOBYTE(v136[0]) == 1)
  {
    sub_219746048((uint64_t)v136);
    v84 = v136[1];
    v85 = (void (*)(_BYTE *, uint64_t, uint64_t))v136[0];
    v19 = v137;
    v83 = v138;
    v82 = sub_2197526E4();
    sub_21975242C();
    v80 = v21;
    v81 = v20;
    v78 = v23;
    v79 = v22;
    v77 = sub_2197526FC();
    sub_21975242C();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v106 = v19;
    v105 = 0;
    v104 = 0;
    v32 = sub_2197526CC();
    sub_21975242C();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v41 = v106;
    v42 = v105;
    v43 = a1;
    v44 = v104;
    v107[0] = 0;
    v45 = sub_2197526D8();
    sub_21975242C();
    v108[0] = 0;
    *(_QWORD *)&v109 = v85;
    *((_QWORD *)&v109 + 1) = v84;
    v110 = v41;
    v111 = v83;
    v112 = v82;
    v113 = v81;
    v114 = v80;
    v115 = v79;
    v116 = v78;
    v117 = v42;
    v118 = v77;
    v119 = v25;
    v120 = v27;
    v121 = v29;
    v122 = v31;
    v123 = v44;
    a1 = v43;
    v124 = v32;
    v125 = v34;
    v126 = v36;
    v127 = v38;
    v128 = v40;
    v129 = v107[0];
    v130 = v45;
    v131 = v46;
    v132 = v47;
    v133 = v48;
    v134 = v49;
    v135 = 0;
    nullsub_1(&v109);
  }
  else
  {
    sub_219750AB4(&v109);
  }
  v50 = sub_2197310EC((uint64_t)&v109, (uint64_t)v136, &qword_2550968F8);
  MEMORY[0x24BDAC7A8](v50);
  *(_QWORD *)&v76[-16] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096900);
  sub_2197516FC(&qword_255096908, &qword_255096900, (uint64_t (*)(void))sub_219750AE4, MEMORY[0x24BDF5578]);
  sub_21975275C();
  v51 = a2 + *(int *)(v5 + 24);
  v85 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v103 + 16);
  v52 = v87;
  v53 = v100;
  v85(v87, v51, v100);
  v54 = v91;
  v55 = v88;
  v56 = a1;
  v57 = v93;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v91 + 16))(v88, v56, v93);
  v58 = a2;
  v59 = v96;
  sub_219730C60(v58, (uint64_t)v96, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v60 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  v61 = (v86 + *(unsigned __int8 *)(v92 + 80) + v60) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  v62 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v54 + 32))(v62 + v60, v55, v57);
  sub_219745FA8((uint64_t)v59, v62 + v61);
  v63 = v90;
  v64 = v94;
  v65 = (uint64_t)v95;
  v66 = v102;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v90 + 16))(v95, v102, v94);
  v67 = v98;
  v85((_BYTE *)(v65 + *(int *)(v98 + 52)), (uint64_t)v52, v53);
  v68 = (uint64_t (**)())(v65 + *(int *)(v67 + 56));
  *v68 = sub_219750C6C;
  v68[1] = (uint64_t (*)())v62;
  (*(void (**)(_BYTE *, uint64_t))(v103 + 8))(v52, v53);
  (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v66, v64);
  sub_219752588();
  sub_2197299AC(&qword_255096940, &qword_2550968E8, MEMORY[0x24BDEDA68]);
  v69 = v89;
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_219731078(v65, &qword_2550968E8);
  v70 = (uint64_t)v69;
  v71 = v101;
  sub_2197310EC(v70, (uint64_t)v101, &qword_2550968F0);
  sub_2197310EC((uint64_t)v136, (uint64_t)v107, &qword_2550968F8);
  v72 = v97;
  sub_219731034((uint64_t)v71, (uint64_t)v97, &qword_2550968F0);
  sub_2197310EC((uint64_t)v107, (uint64_t)v108, &qword_2550968F8);
  v73 = v99;
  sub_2197310EC((uint64_t)v108, v99, &qword_2550968F8);
  v74 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096948);
  sub_219731034((uint64_t)v72, v73 + *(int *)(v74 + 48), &qword_2550968F0);
  sub_219750D04((uint64_t)v108, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_219750CD4);
  sub_219731078((uint64_t)v71, &qword_2550968F0);
  sub_219731078((uint64_t)v72, &qword_2550968F0);
  sub_2197310EC((uint64_t)v107, (uint64_t)&v109, &qword_2550968F8);
  return sub_219750D04((uint64_t)&v109, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_219750D80);
}

uint64_t sub_219745FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_219745FF4()
{
  unint64_t result;

  result = qword_255096830;
  if (!qword_255096830)
  {
    result = MEMORY[0x219A32E40](&protocol conformance descriptor for NetworkListMode, &type metadata for NetworkListMode);
    atomic_store(result, (unint64_t *)&qword_255096830);
  }
  return result;
}

uint64_t sub_219746038()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_219746048@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_219752360();
  swift_bridgeObjectRelease();

  sub_21972F9DC();
  v4 = sub_219752798();
  v6 = v5;
  v8 = v7 & 1;
  sub_219752750();
  v9 = sub_21975278C();
  v11 = v10;
  v13 = v12;
  swift_release();
  v14 = v13 & 1;
  sub_21972FA20(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_219752828();
  v15 = sub_219752774();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_release();
  sub_21972FA20(v9, v11, v14);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v15;
  *(_QWORD *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 16) = v19 & 1;
  *(_QWORD *)(a1 + 24) = v21;
  return result;
}

uint64_t sub_219746254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  char v85;
  void *v86;
  id v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  void *v164;
  id v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int *v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char v197;
  void *v198;
  id v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v220;
  char *v221;
  char *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  char *v227;
  char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  char *v234;
  uint64_t v235;
  char *v236;
  char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  char *v265;
  char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;

  v269 = a2;
  v268 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096938);
  MEMORY[0x24BDAC7A8](v268);
  v221 = (char *)&v221 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096958);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v225 = (uint64_t)&v221 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v224 = (uint64_t)&v221 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v226 = (char *)&v221 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v234 = (char *)&v221 - v11;
  v263 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096960);
  MEMORY[0x24BDAC7A8](v263);
  v265 = (char *)&v221 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v264 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096928);
  MEMORY[0x24BDAC7A8](v264);
  v261 = (uint64_t)&v221 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096900);
  MEMORY[0x24BDAC7A8](v14);
  v266 = (char *)&v221 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v260 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096968);
  MEMORY[0x24BDAC7A8](v260);
  v235 = (uint64_t)&v221 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096970);
  MEMORY[0x24BDAC7A8](v257);
  v259 = (uint64_t)&v221 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v258 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096978);
  MEMORY[0x24BDAC7A8](v258);
  v19 = (char *)&v221 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096980);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v241 = (uint64_t)&v221 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v252 = (uint64_t)&v221 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096988);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v240 = (uint64_t)&v221 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v251 = (uint64_t)&v221 - v27;
  v243 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096990);
  v242 = *(_QWORD *)(v243 - 8);
  v28 = MEMORY[0x24BDAC7A8](v243);
  v223 = (char *)&v221 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v228 = (char *)&v221 - v30;
  v245 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096998);
  v250 = *(_QWORD *)(v245 - 8);
  v31 = MEMORY[0x24BDAC7A8](v245);
  v222 = (char *)&v221 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v227 = (char *)&v221 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969A0);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v233 = (char *)&v221 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v254 = (uint64_t)&v221 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v267 = (uint64_t)&v221 - v39;
  v239 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969A8);
  v238 = *(_QWORD *)(v239 - 8);
  MEMORY[0x24BDAC7A8](v239);
  v237 = (char *)&v221 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v262 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969B0);
  v244 = *(_QWORD *)(v262 - 8);
  MEMORY[0x24BDAC7A8](v262);
  v236 = (char *)&v221 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969B8);
  v43 = MEMORY[0x24BDAC7A8](v42);
  v232 = (uint64_t)&v221 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v253 = (uint64_t)&v221 - v46;
  MEMORY[0x24BDAC7A8](v45);
  v276 = (uint64_t)&v221 - v47;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969C0);
  v49 = MEMORY[0x24BDAC7A8](v48);
  v249 = (uint64_t)&v221 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v49);
  v275 = (uint64_t)&v221 - v51;
  v229 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969C8);
  MEMORY[0x24BDAC7A8](v229);
  v53 = (char *)&v221 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v231 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969D0);
  v230 = *(_QWORD *)(v231 - 8);
  MEMORY[0x24BDAC7A8](v231);
  v55 = (char *)&v221 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969D8);
  v57 = MEMORY[0x24BDAC7A8](v56);
  v270 = (uint64_t)&v221 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v57);
  v274 = (uint64_t)&v221 - v59;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969E0);
  v61 = MEMORY[0x24BDAC7A8](v60);
  v246 = (uint64_t)&v221 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = MEMORY[0x24BDAC7A8](v61);
  v248 = (uint64_t)&v221 - v64;
  v65 = MEMORY[0x24BDAC7A8](v63);
  v247 = (uint64_t)&v221 - v66;
  v67 = MEMORY[0x24BDAC7A8](v65);
  v271 = (uint64_t)&v221 - v68;
  v69 = MEMORY[0x24BDAC7A8](v67);
  v273 = (uint64_t)&v221 - v70;
  MEMORY[0x24BDAC7A8](v69);
  v272 = (uint64_t)&v221 - v71;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969E8);
  v73 = MEMORY[0x24BDAC7A8](v72);
  v255 = (uint64_t)&v221 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v73);
  v256 = (char *)&v221 - v75;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969F0);
  MEMORY[0x24BDAC7A8](v76);
  v78 = (char *)&v221 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550969F8);
  v80 = MEMORY[0x24BDAC7A8](v79);
  v277 = (uint64_t)&v221 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v80);
  v278 = (uint64_t)&v221 - v82;
  v83 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v84 = v83;
  sub_219752408();

  swift_release();
  swift_release();
  if ((v279 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v85 = sub_219752BE8();
  swift_bridgeObjectRelease();
  if ((v85 & 1) != 0)
  {
LABEL_6:
    v234 = v19;
    sub_2197483D0();
    v88 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NetworkList() + 28));
    v90 = *v88;
    v89 = v88[1];
    v91 = v277;
    sub_219731034((uint64_t)v78, v277, &qword_2550969F0);
    v92 = (_QWORD *)(v91 + *(int *)(v79 + 52));
    *v92 = v90;
    v92[1] = v89;
    swift_bridgeObjectRetain();
    sub_219731078((uint64_t)v78, &qword_2550969F0);
    sub_2197310EC(v91, v278, &qword_2550969F8);
    v93 = *(void **)(a1 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    v94 = v93;
    sub_219752408();

    swift_release();
    swift_release();
    if (v279 == 1)
    {
      v95 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v96 = v95;
      sub_219752408();

      swift_release();
      swift_release();
      if (v279 >> 62)
      {
        swift_bridgeObjectRetain();
        v97 = sub_219752B7C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v97 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v97 < 1)
      {
        v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v128 - 8) + 56))(v272, 1, 1, v128);
      }
      else
      {
        v98 = v272;
        sub_21974856C();
        v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v98, 0, 1, v99);
      }
      v129 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v130 = v129;
      sub_219752408();

      swift_release();
      swift_release();
      if (v279 >> 62)
      {
        swift_bridgeObjectRetain();
        v131 = sub_219752B7C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v131 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v131 < 1)
      {
        v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        v134 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v135 - 8) + 56))(v273, 1, 1, v135);
      }
      else
      {
        v132 = v273;
        sub_219748780();
        v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        v134 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v133 - 8) + 56))(v132, 0, 1, v133);
      }
      MEMORY[0x24BDAC7A8](v134);
      *(&v221 - 2) = (char *)a1;
      *(_QWORD *)v53 = sub_21975257C();
      *((_QWORD *)v53 + 1) = 0;
      v53[16] = 1;
      v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A68);
      sub_21974EBCC(a1, (uint64_t)&v53[*(int *)(v136 + 44)]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255096A70);
      sub_2197299AC(&qword_255096A78, &qword_2550969C8, MEMORY[0x24BDF4498]);
      sub_2197299AC(&qword_255096A80, &qword_255096A70, MEMORY[0x24BDF5428]);
      sub_2197528AC();
      sub_219752588();
      sub_219750F48();
      v137 = v270;
      v138 = v231;
      sub_2197527E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v230 + 8))(v55, v138);
      sub_2197310EC(v137, v274, &qword_2550969D8);
      v139 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v140 = v139;
      sub_219752408();

      swift_release();
      swift_release();
      if (v279 >> 62)
      {
        swift_bridgeObjectRetain();
        v141 = sub_219752B7C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v141 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v142 = v245;
      v143 = v262;
      v144 = v244;
      swift_bridgeObjectRelease();
      if (v141 < 1)
      {
        v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v147 - 8) + 56))(v271, 1, 1, v147);
      }
      else
      {
        v145 = v271;
        sub_219748994();
        v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A60);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v146 - 8) + 56))(v145, 0, 1, v146);
      }
      v148 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v149 = v148;
      sub_219752408();

      swift_release();
      swift_release();
      if (v279 >> 62)
      {
        swift_bridgeObjectRetain();
        v150 = sub_219752B7C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v150 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v150 < 1)
      {
        v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A90);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v153 - 8) + 56))(v275, 1, 1, v153);
      }
      else
      {
        v151 = v275;
        sub_219748BAC();
        v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A90);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v152 - 8) + 56))(v151, 0, 1, v152);
      }
      v154 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      v155 = v154;
      sub_219752408();

      swift_release();
      v156 = swift_release();
      if ((v279 & 1) != 0)
      {
        v157 = 1;
      }
      else
      {
        MEMORY[0x24BDAC7A8](v156);
        *(&v221 - 2) = (char *)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255096A10);
        sub_2197299AC(&qword_255096A18, &qword_255096A10, MEMORY[0x24BDF43B0]);
        v158 = v142;
        v159 = v237;
        sub_2197528B8();
        sub_219752588();
        sub_219750DF8();
        v160 = (uint64_t)v236;
        v161 = v239;
        sub_2197527E0();
        v143 = v262;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v162 = v159;
        v142 = v158;
        (*(void (**)(char *, uint64_t))(v238 + 8))(v162, v161);
        sub_2197310EC(v160, v276, &qword_2550969B0);
        v157 = 0;
      }
      v163 = 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v144 + 56))(v276, v157, 1, v143);
      v164 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      v165 = v164;
      sub_219752408();

      swift_release();
      v166 = swift_release();
      if ((v279 & 1) == 0)
      {
        MEMORY[0x24BDAC7A8](v166);
        *(&v221 - 2) = (char *)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255096A28);
        sub_2197299AC(&qword_255096A30, &qword_255096A28, MEMORY[0x24BDF46D0]);
        v167 = v228;
        sub_2197528B8();
        sub_219752588();
        sub_219750EA8();
        v168 = (uint64_t)v227;
        v169 = v243;
        sub_2197527E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v242 + 8))(v167, v169);
        sub_2197310EC(v168, v267, &qword_255096998);
        v163 = 0;
      }
      v170 = v267;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v250 + 56))(v267, v163, 1, v142);
      v171 = v251;
      sub_219748DC4();
      v172 = v252;
      sub_219748F50();
      v173 = v247;
      sub_219731034(v272, v247, &qword_2550969E0);
      v174 = v248;
      sub_219731034(v273, v248, &qword_2550969E0);
      v175 = v270;
      sub_219731034(v274, v270, &qword_2550969D8);
      v176 = v246;
      sub_219731034(v271, v246, &qword_2550969E0);
      sub_219731034(v275, v249, &qword_2550969C0);
      v177 = v253;
      sub_219731034(v276, v253, &qword_2550969B8);
      v178 = v170;
      v179 = v254;
      sub_219731034(v178, v254, &qword_2550969A0);
      v180 = v240;
      sub_219731034(v171, v240, &qword_255096988);
      v181 = v241;
      sub_219731034(v172, v241, &qword_255096980);
      v182 = (uint64_t)v234;
      sub_219731034(v173, (uint64_t)v234, &qword_2550969E0);
      v183 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255096A98);
      sub_219731034(v174, v182 + v183[12], &qword_2550969E0);
      sub_219731034(v175, v182 + v183[16], &qword_2550969D8);
      sub_219731034(v176, v182 + v183[20], &qword_2550969E0);
      v184 = v249;
      sub_219731034(v249, v182 + v183[24], &qword_2550969C0);
      sub_219731034(v177, v182 + v183[28], &qword_2550969B8);
      sub_219731034(v179, v182 + v183[32], &qword_2550969A0);
      sub_219731034(v180, v182 + v183[36], &qword_255096988);
      sub_219731034(v181, v182 + v183[40], &qword_255096980);
      sub_219731078(v181, &qword_255096980);
      sub_219731078(v180, &qword_255096988);
      sub_219731078(v179, &qword_2550969A0);
      sub_219731078(v177, &qword_2550969B8);
      sub_219731078(v184, &qword_2550969C0);
      sub_219731078(v246, &qword_2550969E0);
      sub_219731078(v270, &qword_2550969D8);
      sub_219731078(v248, &qword_2550969E0);
      sub_219731078(v247, &qword_2550969E0);
      sub_219731034(v182, v259, &qword_255096978);
      swift_storeEnumTagMultiPayload();
      v185 = MEMORY[0x24BDF5428];
      sub_2197299AC(&qword_255096A48, &qword_255096978, MEMORY[0x24BDF5428]);
      sub_2197299AC(&qword_255096A50, &qword_255096968, v185);
      v125 = (uint64_t)v256;
      sub_219752678();
      sub_219731078(v182, &qword_255096978);
      sub_219731078(v252, &qword_255096980);
      sub_219731078(v251, &qword_255096988);
      sub_219731078(v267, &qword_2550969A0);
      sub_219731078(v276, &qword_2550969B8);
      sub_219731078(v275, &qword_2550969C0);
      sub_219731078(v271, &qword_2550969E0);
      sub_219731078(v274, &qword_2550969D8);
      sub_219731078(v273, &qword_2550969E0);
      v126 = v272;
      v127 = &qword_2550969E0;
    }
    else
    {
      v100 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      v101 = v100;
      sub_219752408();

      swift_release();
      v102 = swift_release();
      v103 = v244;
      if ((v279 & 1) != 0)
      {
        v104 = 1;
        v105 = v245;
        v106 = v232;
      }
      else
      {
        MEMORY[0x24BDAC7A8](v102);
        *(&v221 - 2) = (char *)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255096A10);
        sub_2197299AC(&qword_255096A18, &qword_255096A10, MEMORY[0x24BDF43B0]);
        v107 = v237;
        sub_2197528B8();
        sub_219752588();
        sub_219750DF8();
        v108 = v236;
        v109 = v239;
        sub_2197527E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v238 + 8))(v107, v109);
        v110 = (uint64_t)v108;
        v106 = v232;
        sub_2197310EC(v110, v232, &qword_2550969B0);
        v104 = 0;
        v105 = v245;
      }
      v111 = 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v103 + 56))(v106, v104, 1, v262);
      v112 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      v113 = v112;
      sub_219752408();

      swift_release();
      v114 = swift_release();
      v115 = (uint64_t)v233;
      if ((v279 & 1) == 0)
      {
        MEMORY[0x24BDAC7A8](v114);
        *(&v221 - 2) = (char *)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255096A28);
        sub_2197299AC(&qword_255096A30, &qword_255096A28, MEMORY[0x24BDF46D0]);
        v116 = v223;
        sub_2197528B8();
        sub_219752588();
        sub_219750EA8();
        v117 = (uint64_t)v222;
        v118 = v243;
        sub_2197527E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v242 + 8))(v116, v118);
        sub_2197310EC(v117, v115, &qword_255096998);
        v111 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v250 + 56))(v115, v111, 1, v105);
      v119 = v253;
      sub_219731034(v106, v253, &qword_2550969B8);
      v120 = v254;
      sub_219731034(v115, v254, &qword_2550969A0);
      v121 = v106;
      v122 = v235;
      sub_219731034(v119, v235, &qword_2550969B8);
      v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A40);
      sub_219731034(v120, v122 + *(int *)(v123 + 48), &qword_2550969A0);
      sub_219731078(v120, &qword_2550969A0);
      sub_219731078(v119, &qword_2550969B8);
      sub_219731034(v122, v259, &qword_255096968);
      swift_storeEnumTagMultiPayload();
      v124 = MEMORY[0x24BDF5428];
      sub_2197299AC(&qword_255096A48, &qword_255096978, MEMORY[0x24BDF5428]);
      sub_2197299AC(&qword_255096A50, &qword_255096968, v124);
      v125 = (uint64_t)v256;
      sub_219752678();
      sub_219731078(v122, &qword_255096968);
      sub_219731078(v115, &qword_2550969A0);
      v126 = v121;
      v127 = &qword_2550969B8;
    }
    sub_219731078(v126, v127);
    v187 = (uint64_t)v265;
    v186 = v266;
    v188 = v277;
    v189 = v278;
    sub_219731034(v278, v277, &qword_2550969F8);
    v190 = v255;
    sub_219731034(v125, v255, &qword_2550969E8);
    v191 = v261;
    sub_219731034(v188, v261, &qword_2550969F8);
    v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A58);
    sub_219731034(v190, v191 + *(int *)(v192 + 48), &qword_2550969E8);
    sub_219731078(v190, &qword_2550969E8);
    sub_219731078(v188, &qword_2550969F8);
    sub_219731034(v191, v187, &qword_255096928);
    swift_storeEnumTagMultiPayload();
    v193 = v125;
    v194 = MEMORY[0x24BDF5428];
    sub_2197299AC(&qword_255096920, &qword_255096928, MEMORY[0x24BDF5428]);
    sub_2197299AC(&qword_255096930, &qword_255096938, v194);
    sub_219752678();
    sub_219731078(v191, &qword_255096928);
    sub_219731078(v193, &qword_2550969E8);
    sub_219731078(v189, &qword_2550969F8);
    v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096918);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v195 - 8) + 56))(v186, 0, 1, v195);
    v196 = (uint64_t)v186;
    return sub_2197310EC(v196, v269, &qword_255096900);
  }
  v86 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v87 = v86;
  sub_219752408();

  swift_release();
  swift_release();
  if (v279 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v197 = sub_219752BE8();
    swift_bridgeObjectRelease();
    if ((v197 & 1) == 0)
    {
      v220 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096918);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v220 - 8) + 56))(v269, 1, 1, v220);
    }
  }
  v198 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v199 = v198;
  sub_219752408();

  swift_release();
  swift_release();
  if (v279 >> 62)
  {
    swift_bridgeObjectRetain();
    v200 = sub_219752B7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v200 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v202 = (uint64_t)v265;
  v201 = v266;
  v203 = (uint64_t)v221;
  swift_bridgeObjectRelease();
  if (v200 < 1)
  {
    v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A00);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v206 - 8) + 56))(v234, 1, 1, v206);
  }
  else
  {
    v204 = (uint64_t)v234;
    sub_2197490BC();
    v205 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A00);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v205 - 8) + 56))(v204, 0, 1, v205);
  }
  v207 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v208 = v207;
  sub_219752408();

  swift_release();
  swift_release();
  if (v279 >> 62)
  {
    swift_bridgeObjectRetain();
    v209 = sub_219752B7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v209 = *(_QWORD *)((v279 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v209 < 1)
  {
    v212 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A00);
    v210 = (uint64_t)v226;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v212 - 8) + 56))(v226, 1, 1, v212);
  }
  else
  {
    v210 = (uint64_t)v226;
    sub_2197492DC();
    v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A00);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v211 - 8) + 56))(v210, 0, 1, v211);
  }
  v213 = (uint64_t)v234;
  v214 = v224;
  sub_219731034((uint64_t)v234, v224, &qword_255096958);
  v215 = v225;
  sub_219731034(v210, v225, &qword_255096958);
  sub_219731034(v214, v203, &qword_255096958);
  v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A08);
  sub_219731034(v215, v203 + *(int *)(v216 + 48), &qword_255096958);
  sub_219731078(v215, &qword_255096958);
  sub_219731078(v214, &qword_255096958);
  sub_219731034(v203, v202, &qword_255096938);
  swift_storeEnumTagMultiPayload();
  v217 = MEMORY[0x24BDF5428];
  sub_2197299AC(&qword_255096920, &qword_255096928, MEMORY[0x24BDF5428]);
  sub_2197299AC(&qword_255096930, &qword_255096938, v217);
  sub_219752678();
  sub_219731078(v203, &qword_255096938);
  sub_219731078(v210, &qword_255096958);
  sub_219731078(v213, &qword_255096958);
  v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096918);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v218 - 8) + 56))(v201, 0, 1, v218);
  v196 = (uint64_t)v201;
  return sub_2197310EC(v196, v269, &qword_255096900);
}

uint64_t sub_2197483D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;
  __int128 v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C08);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v0;
  sub_21974A0FC((uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096C10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096C18);
  sub_2197299AC(&qword_255096C20, &qword_255096C10, MEMORY[0x24BDF5428]);
  sub_2197516FC(&qword_255096C28, &qword_255096C18, (uint64_t (*)(void))sub_219751760, MEMORY[0x24BDF5578]);
  sub_2197528C4();
  sub_219752588();
  sub_2197517BC();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_21974856C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_219752360();
  v9 = v8;

  v16 = v7;
  v17 = v9;
  sub_21972F9DC();
  v16 = sub_219752798();
  v17 = v10;
  v18 = v11 & 1;
  v19 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA8);
  sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_2197510BC();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_219748780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_219752360();
  v9 = v8;

  v16 = v7;
  v17 = v9;
  sub_21972F9DC();
  v16 = sub_219752798();
  v17 = v10;
  v18 = v11 & 1;
  v19 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA8);
  sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_2197510BC();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_219748994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_219752360();
  v9 = v8;

  v16 = v7;
  v17 = v9;
  sub_21972F9DC();
  v16 = sub_219752798();
  v17 = v10;
  v18 = v11 & 1;
  v19 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA8);
  sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_2197510BC();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_219748BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096B00);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = v0;
  v5 = *(void **)(v0 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_219752408();

  swift_release();
  swift_release();
  v7 = v16;
  if (v16)
  {
    sub_21972F9DC();
    v8 = sub_219752798();
    v7 = v11 & 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  v15 = v8;
  v16 = v9;
  v17 = v7;
  v18 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096B08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA8);
  sub_219751AF8(&qword_255096B10, &qword_255096B08, MEMORY[0x24BDF1F80], MEMORY[0x24BDF5578]);
  sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_2197512A4();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_219748DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;
  __int128 v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096B80);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v0;
  sub_21974BAF4((uint64_t *)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096B28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096B08);
  sub_2197299AC(&qword_255096B30, &qword_255096B28, MEMORY[0x24BDF43B0]);
  sub_219751AF8(&qword_255096B10, &qword_255096B08, MEMORY[0x24BDF1F80], MEMORY[0x24BDF5578]);
  sub_2197528C4();
  sub_219752588();
  sub_21975154C();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_219748F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v6[16];
  uint64_t v7;
  __int128 v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096B20);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v0;
  sub_21974BE20((uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096B28);
  sub_2197299AC(&qword_255096B30, &qword_255096B28, MEMORY[0x24BDF43B0]);
  sub_2197528C4();
  sub_219752588();
  sub_2197513A0();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2197490BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096CC0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_219752360();
  v9 = v8;

  v16 = v7;
  v17 = v9;
  sub_21972F9DC();
  v16 = sub_219752798();
  v17 = v10;
  v18 = v11 & 1;
  v19 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096CC8);
  sub_219751AF8(&qword_255096CD0, &qword_255096CC8, MEMORY[0x24BDF4760], MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_219751B54();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2197492DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096CC0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = v0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = sub_219752360();
  v9 = v8;

  v16 = v7;
  v17 = v9;
  sub_21972F9DC();
  v16 = sub_219752798();
  v17 = v10;
  v18 = v11 & 1;
  v19 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096CC8);
  sub_219751AF8(&qword_255096CD0, &qword_255096CC8, MEMORY[0x24BDF4760], MEMORY[0x24BDF4A08]);
  sub_2197528AC();
  sub_219752588();
  sub_219751B54();
  sub_2197527E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2197494FC()
{
  sub_2197528E8();
  sub_219752468();
  return swift_release();
}

uint64_t sub_219749558()
{
  type metadata accessor for NetworkList();
  swift_bridgeObjectRetain();
  sub_2197528F4();
  sub_2197524BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2197495E4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unsigned __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  unsigned __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int16 v53;
  __int128 v54;
  unsigned __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C48);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - v8;
  v10 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v11 = v10;
  sub_219752408();

  swift_release();
  swift_release();
  v44 = v7;
  v43 = v9;
  v40 = a2;
  if (v54 == 1)
  {
    sub_219749B0C((void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))sub_21974F95C, (uint64_t)&v54);
    v47 = v54;
    v48 = v55;
    v49 = v56;
    v50 = v57;
    v51 = v58;
    v52 = v59;
    v53 = v60;
  }
  else
  {
    sub_219749B0C((void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))sub_21975007C, (uint64_t)&v54);
    v47 = v54;
    v48 = v55;
    v49 = v56;
    v50 = v57;
    v51 = v58;
    v52 = v59;
    LOBYTE(v53) = v60;
    HIBYTE(v53) = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096C50);
  sub_219751874();
  sub_219752678();
  v12 = *((_QWORD *)&v54 + 1);
  v42 = v54;
  v13 = v55;
  v14 = v56;
  v15 = *((_QWORD *)&v57 + 1);
  v41 = v57;
  v45 = *((_QWORD *)&v58 + 1);
  v46 = v58;
  v32 = *((_QWORD *)&v59 + 1);
  v33 = v59;
  v31 = v60;
  v30 = v61;
  v16 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v17 = v16;
  sub_219752408();

  swift_release();
  swift_release();
  if (v54 != 1)
    goto LABEL_7;
  v18 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v19 = v18;
  sub_219752408();

  swift_release();
  swift_release();
  v20 = v54;

  if (v20)
  {
    v21 = (uint64_t)v43;
    sub_219749F28((uint64_t)v43);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C70);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
LABEL_7:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C70);
    v21 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v43, 1, 1, v23);
  }
  v24 = (uint64_t)v44;
  sub_219731034(v21, (uint64_t)v44, &qword_255096C48);
  v25 = v40;
  *v40 = v42;
  v25[1] = v12;
  v34 = v12;
  *((_OWORD *)v25 + 1) = v13;
  v39 = v13 >> 64;
  v35 = v13;
  v38 = v14;
  *((_OWORD *)v25 + 2) = v14;
  v37 = *((_QWORD *)&v14 + 1);
  v25[6] = v41;
  v25[7] = v15;
  v36 = v15;
  v26 = v45;
  v25[8] = v46;
  v25[9] = v26;
  v45 = v26;
  v27 = v32;
  v25[10] = v33;
  v25[11] = v27;
  *((_BYTE *)v25 + 96) = v31;
  *((_BYTE *)v25 + 97) = v30;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C78);
  sub_219731034(v24, (uint64_t)v25 + *(int *)(v28 + 48), &qword_255096C48);
  sub_2197518F8();
  sub_219731078((uint64_t)v43, &qword_255096C48);
  sub_219731078((uint64_t)v44, &qword_255096C48);
  return sub_21975192C();
}

uint64_t sub_219749B0C@<X0>(void (*a1)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  void (*v30)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;

  v30 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C80);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - v8;
  v10 = *(void **)(v2 + 24);
  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata, v30);
  v13 = sub_219752360();
  v15 = v14;

  swift_getKeyPath();
  swift_getKeyPath();
  v16 = v10;
  sub_219752408();

  swift_release();
  swift_release();
  v17 = v37;
  v18 = sub_21975257C();
  v19 = v18;
  if (v17 == 2)
  {
    *(_QWORD *)v9 = v18;
    *((_QWORD *)v9 + 1) = 0;
    v9[16] = 1;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C88);
    sub_21974FC28(v13, v15, (uint64_t)&v9[*(int *)(v20 + 44)]);
    swift_bridgeObjectRelease();
    sub_219731034((uint64_t)v9, (uint64_t)v7, &qword_255096C80);
    v21 = MEMORY[0x24BDF4498];
    sub_2197299AC(&qword_255096C90, &qword_255096C80, MEMORY[0x24BDF4498]);
    v22 = sub_219752894();
    sub_219731078((uint64_t)v9, &qword_255096C80);
    v31 = v22;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    memset(v36, 0, 25);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255096C68);
    sub_2197299AC(&qword_255096C60, &qword_255096C68, v21);
  }
  else
  {
    v30(&v37, v2, v13, v15);
    swift_bridgeObjectRelease();
    v31 = v19;
    v32 = xmmword_21975A750;
    *(_QWORD *)&v33 = v37;
    *((_QWORD *)&v33 + 1) = BYTE8(v37);
    *(_QWORD *)&v34 = v38;
    *((_QWORD *)&v34 + 1) = BYTE8(v38);
    *(_QWORD *)&v35 = v39;
    *((_QWORD *)&v35 + 1) = BYTE8(v39);
    v36[0] = v40;
    *(_QWORD *)&v36[1] = v41;
    BYTE8(v36[1]) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255096C68);
    sub_2197299AC(&qword_255096C60, &qword_255096C68, MEMORY[0x24BDF4498]);
  }
  result = sub_219752678();
  v24 = v38;
  v25 = v39;
  v26 = v40;
  v27 = v41;
  v28 = v42;
  v29 = v43;
  *(_OWORD *)a2 = v37;
  *(_OWORD *)(a2 + 16) = v24;
  *(_OWORD *)(a2 + 32) = v25;
  *(_OWORD *)(a2 + 48) = v26;
  *(_OWORD *)(a2 + 64) = v27;
  *(_OWORD *)(a2 + 80) = v28;
  *(_BYTE *)(a2 + 96) = v29;
  return result;
}

uint64_t sub_219749F28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = type metadata accessor for NetworkList();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v7 = v6;
  sub_219752408();

  swift_release();
  swift_release();
  v8 = v16;
  if (v16)
  {
    sub_219730C60(v1, (uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
    v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v10 = swift_allocObject();
    v11 = sub_219745FA8((uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
    MEMORY[0x24BDAC7A8](v11);
    *(&v15 - 2) = (uint64_t)v8;
    *(&v15 - 1) = v1;
    type metadata accessor for NetworkListRowView();
    sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
    sub_21975287C();

    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
}

uint64_t sub_21974A0FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  char *v4;
  char *v5;
  uint64_t result;
  __int128 v7;
  char v8;
  __int128 v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  char v16;

  v3 = *(void **)(v1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v3;
  sub_219752408();

  swift_release();
  swift_release();
  if ((v15[0] & 1) == 0)
  {
    sub_21974F5D0();
    type metadata accessor for WFNetworkListViewController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v12 = sub_219752360();
    v14 = v13;
    swift_bridgeObjectRelease();

    *(_QWORD *)&v15[0] = v12;
    *((_QWORD *)&v15[0] + 1) = v14;
    sub_21972F9DC();
    sub_219752798();
LABEL_6:
    result = sub_219752678();
    v7 = v15[0];
    v9 = v15[1];
    v8 = v16;
    goto LABEL_7;
  }
  v5 = &v4[OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled];
  result = swift_beginAccess();
  if ((*v5 & 1) == 0)
  {
    sub_21974F480((uint64_t)v15);
    goto LABEL_6;
  }
  v7 = 0uLL;
  v8 = -1;
  v9 = 0uLL;
LABEL_7:
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_21974A2E0@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v30 = a3;
  v5 = type metadata accessor for NetworkList();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  sub_219730C60(a2, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  sub_219745FA8((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  v31 = v18;
  v32 = a2;
  type metadata accessor for NetworkListRowView();
  sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
  v21 = v18;
  sub_21975287C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_2197299AC(&qword_255096AF8, (uint64_t *)&unk_255096AE8, MEMORY[0x24BDF43B0]);
  v22 = sub_219752894();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v35 = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v33
    && (v23 = objc_msgSend(v33, sel_title), swift_unknownObjectRelease(), v23))
  {
    v24 = sub_2197529A8();
    v26 = v25;

    v27 = v30;
  }
  else
  {
    v27 = v30;
    v26 = 0xED00006B726F7774;
    v24 = 0x654E206E776F6E4BLL;
  }
  v33 = (id)v24;
  v34 = v26;
  sub_21972F9DC();
  sub_2197527EC();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_2197310EC((uint64_t)v17, v27, (uint64_t *)&unk_255096AC0);
}

uint64_t sub_21974A600@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v30 = a3;
  v5 = type metadata accessor for NetworkList();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  sub_219730C60(a2, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  sub_219745FA8((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  v31 = v18;
  v32 = a2;
  type metadata accessor for NetworkListRowView();
  sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
  v21 = v18;
  sub_21975287C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_2197299AC(&qword_255096AF8, (uint64_t *)&unk_255096AE8, MEMORY[0x24BDF43B0]);
  v22 = sub_219752894();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v35 = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v33
    && (v23 = objc_msgSend(v33, sel_title), swift_unknownObjectRelease(), v23))
  {
    v24 = sub_2197529A8();
    v26 = v25;

    v27 = v30;
  }
  else
  {
    v27 = v30;
    v26 = 0xED00006B726F7774;
    v24 = 0x654E20726568744FLL;
  }
  v33 = (id)v24;
  v34 = v26;
  sub_21972F9DC();
  sub_2197527EC();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_2197310EC((uint64_t)v17, v27, (uint64_t *)&unk_255096AC0);
}

uint64_t sub_21974A920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v50 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BD0);
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)v40 - v6;
  v7 = type metadata accessor for NetworkList();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096AA8);
  v44 = *(_QWORD *)(v11 - 8);
  v45 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BD8);
  v14 = MEMORY[0x24BDAC7A8](v43);
  v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v41 = a1;
  v42 = (uint64_t)v40 - v17;
  v18 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v19 = v18;
  sub_219752408();

  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_219730C60(a1, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v20 = *(unsigned __int8 *)(v8 + 80);
  v21 = (v20 + 16) & ~v20;
  v40[1] = v20 | 7;
  v22 = swift_allocObject();
  sub_219745FA8((uint64_t)v10, v22 + v21);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  sub_2197299AC(&qword_255096AE0, (uint64_t *)&unk_255096490, MEMORY[0x24BEE12D8]);
  sub_219751038();
  sub_2197528A0();
  v23 = sub_2197528DC();
  v25 = v44;
  v24 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v16, v13, v45);
  v26 = (uint64_t *)&v16[*(int *)(v43 + 36)];
  *v26 = v23;
  v26[1] = 1;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v24);
  v27 = v42;
  sub_2197310EC((uint64_t)v16, v42, &qword_255096BD8);
  v28 = v41;
  sub_219730C60(v41, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v29 = swift_allocObject();
  sub_219745FA8((uint64_t)v10, v29 + v21);
  v51 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096BE0);
  sub_2197299AC(&qword_255096BE8, &qword_255096BE0, MEMORY[0x24BDF4498]);
  v30 = v46;
  sub_21975287C();
  v31 = v27;
  sub_219731034(v27, (uint64_t)v16, &qword_255096BD8);
  v32 = v47;
  v33 = v48;
  v34 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  v35 = v49;
  v34(v47, v30, v49);
  v36 = v50;
  sub_219731034((uint64_t)v16, v50, &qword_255096BD8);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BF0);
  v34((char *)(v36 + *(int *)(v37 + 48)), v32, v35);
  v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v30, v35);
  sub_219731078(v31, &qword_255096BD8);
  v38(v32, v35);
  return sub_219731078((uint64_t)v16, &qword_255096BD8);
}

uint64_t sub_21974AD64@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v30 = a3;
  v5 = type metadata accessor for NetworkList();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  sub_219730C60(a2, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  sub_219745FA8((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  v31 = v18;
  v32 = a2;
  type metadata accessor for NetworkListRowView();
  sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
  v21 = v18;
  sub_21975287C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_2197299AC(&qword_255096AF8, (uint64_t *)&unk_255096AE8, MEMORY[0x24BDF43B0]);
  v22 = sub_219752894();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v35 = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v33
    && (v23 = objc_msgSend(v33, sel_title), swift_unknownObjectRelease(), v23))
  {
    v24 = sub_2197529A8();
    v26 = v25;

    v27 = v30;
  }
  else
  {
    v27 = v30;
    v26 = 0xED00006B726F7774;
    v24 = 0x654E206172666E49;
  }
  v33 = (id)v24;
  v34 = v26;
  sub_21972F9DC();
  sub_2197527EC();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_2197310EC((uint64_t)v17, v27, (uint64_t *)&unk_255096AC0);
}

uint64_t sub_21974B084@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v30 = a3;
  v5 = type metadata accessor for NetworkList();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  sub_219730C60(a2, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v18;
  sub_219745FA8((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  v31 = v18;
  v32 = a2;
  type metadata accessor for NetworkListRowView();
  sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
  v21 = v18;
  sub_21975287C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_2197299AC(&qword_255096AF8, (uint64_t *)&unk_255096AE8, MEMORY[0x24BDF43B0]);
  v22 = sub_219752894();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v35 = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v33
    && (v23 = objc_msgSend(v33, sel_title), swift_unknownObjectRelease(), v23))
  {
    v24 = sub_2197529A8();
    v26 = v25;

    v27 = v30;
  }
  else
  {
    v27 = v30;
    v26 = 0xEE006B726F777465;
    v24 = 0x4E20636F68206441;
  }
  v33 = (id)v24;
  v34 = v26;
  sub_21972F9DC();
  sub_2197527EC();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_2197310EC((uint64_t)v17, v27, (uint64_t *)&unk_255096AC0);
}

uint64_t sub_21974B3A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for NetworkList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_219752408();

  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_219730C60(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  sub_219745FA8((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  sub_2197299AC(&qword_255096AE0, (uint64_t *)&unk_255096490, MEMORY[0x24BEE12D8]);
  sub_219751038();
  return sub_2197528A0();
}

uint64_t sub_21974B548@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;

  v30 = a3;
  v5 = type metadata accessor for NetworkList();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AE8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096AC0);
  MEMORY[0x24BDAC7A8](v15);
  v29 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  sub_219730C60(a2, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v18 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  sub_219745FA8((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  v31 = v17;
  v32 = a2;
  type metadata accessor for NetworkListRowView();
  sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
  v20 = v17;
  sub_21975287C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_2197299AC(&qword_255096AF8, (uint64_t *)&unk_255096AE8, MEMORY[0x24BDF43B0]);
  v21 = sub_219752894();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v35 = v21;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  v22 = 0x80000002197664C0;
  if (v33
    && (v23 = objc_msgSend(v33, sel_title), swift_unknownObjectRelease(), v23))
  {
    v24 = (void *)sub_2197529A8();
    v22 = v25;

    v26 = v30;
  }
  else
  {
    v26 = v30;
    v24 = (void *)0xD000000000000014;
  }
  v27 = (uint64_t)v29;
  v33 = v24;
  v34 = v22;
  sub_21972F9DC();
  sub_2197527EC();
  swift_bridgeObjectRelease();
  swift_release();
  return sub_2197310EC(v27, v26, (uint64_t *)&unk_255096AC0);
}

uint64_t sub_21974B86C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = type metadata accessor for NetworkList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_219730C60(a1, (uint64_t)&v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_219745FA8((uint64_t)&v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v7 + v6);
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096BF8);
  sub_2197299AC(&qword_255096C00, &qword_255096BF8, MEMORY[0x24BDF4498]);
  return sub_21975287C();
}

uint64_t sub_21974B974()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;

  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_219752360();

  type metadata accessor for NetworkListConfigDataSource();
  sub_21972996C(&qword_255096718, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
  v2 = (void *)sub_219752498();
  swift_getKeyPath();
  sub_2197524A4();
  swift_release();

  sub_21972F9DC();
  return sub_219752888();
}

uint64_t sub_21974BAF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  char *v3;
  char *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;

  v3 = *(char **)(v1 + 24);
  v4 = &v3[OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled];
  result = swift_beginAccess();
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (*v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v10 = v3;
    sub_219752408();

    swift_release();
    result = swift_release();
    if (v27 == -1)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v11 = v10;
      sub_219752408();

      swift_release();
      swift_release();
      sub_21974F770(v27);
      sub_21972F9DC();
      v12 = sub_219752798();
      v14 = v13;
      v16 = v15 & 1;
      sub_219752828();
      v17 = sub_219752774();
      v19 = v18;
      v21 = v20;
      swift_release();
      v22 = v21 & 1;
      sub_21972FA20(v12, v14, v16);
      swift_bridgeObjectRelease();
      sub_219752750();
      v6 = sub_21975278C();
      v7 = v23;
      v25 = v24;
      v9 = v26;
      swift_release();
      v8 = v25 & 1;
      sub_21972FA20(v17, v19, v22);
      result = swift_bridgeObjectRelease();
    }
  }
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  a1[3] = v9;
  return result;
}

uint64_t sub_21974BD10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v2 = type metadata accessor for NetworkList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_219730C60(a1, (uint64_t)&v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_219745FA8((uint64_t)&v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v7 + v6);
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255096B40);
  sub_2197299AC(&qword_255096B48, &qword_255096B40, MEMORY[0x24BDF4498]);
  return sub_21975287C();
}

uint64_t sub_21974BE20@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_219752360();

  swift_bridgeObjectRelease();
  sub_21972F9DC();
  v4 = sub_219752798();
  v6 = v5;
  v8 = v7 & 1;
  sub_219752828();
  v9 = sub_219752774();
  v11 = v10;
  v13 = v12;
  swift_release();
  v14 = v13 & 1;
  sub_21972FA20(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_219752750();
  v15 = sub_21975278C();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_release();
  sub_21972FA20(v9, v11, v14);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v15;
  *(_QWORD *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 16) = v19 & 1;
  *(_QWORD *)(a1 + 24) = v21;
  return result;
}

uint64_t sub_21974C02C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  unint64_t v12;

  v2 = type metadata accessor for NetworkList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_219752408();

  swift_release();
  swift_release();
  v11 = a1;
  v12 = sub_219745004((uint64_t (*)(id *))sub_219751BEC, (uint64_t)v10, v12);
  swift_getKeyPath();
  sub_219730C60(a1, (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  sub_219745FA8((uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  sub_2197299AC(&qword_255096AE0, (uint64_t *)&unk_255096490, MEMORY[0x24BEE12D8]);
  return sub_2197528A0();
}

uint64_t sub_21974C1E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  unint64_t v12;

  v2 = type metadata accessor for NetworkList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_219752408();

  swift_release();
  swift_release();
  v11 = a1;
  v12 = sub_219745004((uint64_t (*)(id *))sub_2197522F4, (uint64_t)v10, v12);
  swift_getKeyPath();
  sub_219730C60(a1, (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  sub_219745FA8((uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096490);
  sub_2197299AC(&qword_255096AE0, (uint64_t *)&unk_255096490, MEMORY[0x24BEE12D8]);
  return sub_2197528A0();
}

BOOL sub_21974C394(void **a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  char v4;

  v1 = *a1;
  swift_beginAccess();
  v2 = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_219752044(v3);
  swift_bridgeObjectRelease();

  return (v4 & 1) == 0;
}

uint64_t sub_21974C42C@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;

  v39 = a5;
  v40 = a6;
  v38 = a4;
  v34 = a3;
  v41 = a7;
  v9 = type metadata accessor for NetworkList();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v33 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - v13;
  v15 = type metadata accessor for NetworkListRowView();
  MEMORY[0x24BDAC7A8](v15);
  v35 = (uint64_t)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096CE0);
  v17 = MEMORY[0x24BDAC7A8](v36);
  v37 = (uint64_t)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v32 - v19;
  v21 = *a1;
  sub_219730C60(a2, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v22 = *(unsigned __int8 *)(v10 + 80);
  v23 = (v22 + 16) & ~v22;
  v24 = swift_allocObject();
  sub_219745FA8((uint64_t)v14, v24 + v23);
  *(_QWORD *)(v24 + ((v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8)) = v21;
  v25 = v33;
  sub_219730C60(a2, v33, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v26 = (v22 + 24) & ~v22;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v21;
  sub_219745FA8(v25, v27 + v26);
  v28 = v21;
  v29 = v35;
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(v28, v39, v24, v40, v27, v35);
  sub_219730C60(v29, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  v20[*(int *)(v36 + 36)] = 0;
  sub_219730CA4(v29, (uint64_t (*)(_QWORD))type metadata accessor for NetworkListRowView);
  sub_219731034((uint64_t)v20, v37, &qword_255096CE0);
  sub_219751CA0();
  v30 = sub_219752894();
  result = sub_219731078((uint64_t)v20, &qword_255096CE0);
  *v41 = v30;
  return result;
}

uint64_t sub_21974C6AC(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  void *v15;
  id v16;
  id v17;
  void (**v18)(id);
  uint64_t result;
  void (*v20)(id);
  id v21;
  id v22;
  id v23;
  id v24[3];

  if (qword_255095E80 != -1)
    swift_once();
  v4 = sub_2197523D8();
  __swift_project_value_buffer(v4, (uint64_t)qword_255098550);
  v5 = a1;
  v6 = sub_2197523C0();
  v7 = sub_219752A38();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = (void *)swift_slowAlloc();
    v24[0] = v9;
    *(_DWORD *)v8 = 136315394;
    v22 = (id)sub_219738DB8(0xD000000000000020, 0x80000002197663F0, (uint64_t *)v24);
    sub_219752A98();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_219752408();
    swift_release();
    swift_release();
    if (v22
      && (v10 = objc_msgSend(v22, sel_ssid), swift_unknownObjectRelease(), v10))
    {
      v11 = sub_2197529A8();
      v13 = v12;

    }
    else
    {
      v11 = 0;
      v13 = 0xE000000000000000;
    }
    v21 = (id)sub_219738DB8(v11, v13, (uint64_t *)v24);
    sub_219752A98();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2196CC000, v6, v7, "%s: Tapped on %s!", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v9, -1, -1);
    MEMORY[0x219A32EB8](v8, -1, -1);

  }
  else
  {

  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v24[0])
  {
    v14 = objc_msgSend(v24[0], sel_isInstantHotspot);
    swift_unknownObjectRelease();
    if (v14)
    {
      v15 = *(void **)(a2 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      v16 = v15;
      sub_219752408();
      swift_release();
      swift_release();
      _s9WiFiKitUI21NetworkListDataSourceC16setAssociatingPH03newK0ySo09WFNetworkF6Record_pSg_tF_0(v24[0]);

      swift_unknownObjectRelease();
    }
  }
  v17 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_255095EA0 != -1)
    swift_once();
  objc_msgSend(v17, sel_postNotificationName_object_userInfo_, qword_255098628, 0, 0, v21);

  v18 = (void (**)(id))(*(_QWORD *)(a2 + 8) + OBJC_IVAR___WFNetworkListDataSource_associationHandler);
  result = swift_beginAccess();
  v20 = *v18;
  if (*v18)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_219752408();
    swift_release();
    swift_release();
    v20(v23);
    sub_219731D9C((uint64_t)v20);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_21974CB04(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD);
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for NetworkList();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  sub_219730C60(a2, (uint64_t)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  sub_219745FA8((uint64_t)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  *(_QWORD *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)sub_2197511C4, v11, 0, 0, a3);
}

uint64_t sub_21974CBEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v4)(uint64_t, uint64_t);
  uint64_t result;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = (void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8)
                                              + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_219752408();
    swift_release();
    swift_release();
    v6(v7, a3);
    sub_219731D9C((uint64_t)v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_21974CCCC(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752408();
  swift_release();
  swift_release();
  if (v4)
  {
    v3 = *(id *)(a2 + 8);
    NetworkListDataSource.addPendingDeletingNetwork(_:)(v4);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_21974CD68(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t result;
  void (*v10)(uint64_t, uint64_t);
  char *v11;
  uint64_t v12;
  uint64_t v13[3];

  if (qword_255095E80 != -1)
    swift_once();
  v2 = sub_2197523D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  v3 = sub_2197523C0();
  v4 = sub_219752A38();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v12 = sub_219738DB8(0xD000000000000011, 0x8000000219766BC0, v13);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: Tapped on current network row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v6, -1, -1);
    MEMORY[0x219A32EB8](v5, -1, -1);
  }

  v7 = *(char **)(a1 + 8);
  v8 = &v7[OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler];
  result = swift_beginAccess();
  v10 = *(void (**)(uint64_t, uint64_t))v8;
  if (*(_QWORD *)v8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21973D3AC((uint64_t)v10);
    v11 = v7;
    sub_219752408();

    swift_release();
    swift_release();
    v10(v12, 1);
    sub_219731D9C((uint64_t)v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_21974CF8C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD);
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for NetworkList();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  sub_219730C60(a2, (uint64_t)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  sub_219745FA8((uint64_t)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)sub_219751AA0, v11, 0, 0, a3);
}

uint64_t sub_21974D060(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t result;
  void (*v4)(uint64_t, uint64_t);
  char *v5;
  uint64_t v6;

  v1 = *(char **)(a1 + 8);
  v2 = &v1[OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler];
  result = swift_beginAccess();
  v4 = *(void (**)(uint64_t, uint64_t))v2;
  if (*(_QWORD *)v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21973D3AC((uint64_t)v4);
    v5 = v1;
    sub_219752408();

    swift_release();
    swift_release();
    v4(v6, 1);
    sub_219731D9C((uint64_t)v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21974D140(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void (**v7)(uint64_t);
  uint64_t result;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11[3];

  if (qword_255095E80 != -1)
    swift_once();
  v2 = sub_2197523D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  v3 = sub_2197523C0();
  v4 = sub_219752A38();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_219738DB8(0x6761735561746164, 0xEC000000776F5265, v11);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: Tapped on date usage row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v6, -1, -1);
    MEMORY[0x219A32EB8](v5, -1, -1);
  }

  v7 = (void (**)(uint64_t))(*(_QWORD *)(a1 + 24)
                                     + OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler);
  result = swift_beginAccess();
  v9 = *v7;
  if (*v7)
  {
    v10 = swift_retain();
    v9(v10);
    return sub_219731D9C((uint64_t)v9);
  }
  return result;
}

__n128 sub_21974D304@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __n128 v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;

  v2 = sub_21975257C();
  sub_21974D390((uint64_t)&v12);
  v3 = v13;
  v4 = v14;
  v5 = v15;
  v6 = v16;
  v7 = v19;
  v8 = v20;
  result = v12;
  v10 = v17;
  v11 = v18;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v10;
  *(_OWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 104) = v7;
  *(_BYTE *)(a1 + 112) = v8;
  return result;
}

uint64_t sub_21974D390@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = sub_219752360();
  v6 = v5;

  v26 = v4;
  v27 = v6;
  sub_21972F9DC();
  v7 = sub_219752798();
  v9 = v8;
  v11 = v10 & 1;
  sub_21975281C();
  v25 = sub_219752774();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_release();
  v18 = v15 & 1;
  sub_21972FA20(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_21974D5A0((uint64_t)&v26);
  v19 = v26;
  v20 = v27;
  v21 = v28;
  v22 = v29;
  v23 = v30;
  LOBYTE(v3) = v31;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v13;
  *(_BYTE *)(a1 + 16) = v18;
  *(_QWORD *)(a1 + 24) = v17;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v20;
  *(_QWORD *)(a1 + 64) = v21;
  *(_QWORD *)(a1 + 72) = v22;
  *(_QWORD *)(a1 + 80) = v23;
  *(_BYTE *)(a1 + 88) = (_BYTE)v3;
  sub_219730884(v25, v13, v18);
  swift_bridgeObjectRetain();
  sub_219751468();
  sub_2197514BC();
  sub_21972FA20(v25, v13, v18);
  return swift_bridgeObjectRelease();
}

double sub_21974D5A0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double result;
  __int128 v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  char v34;

  v2 = sub_219752390();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2197523A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219752378();
  sub_21975239C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = sub_219752384();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v10 == 1)
  {
    v11 = sub_21975284C();
    v12 = sub_219752828();
    KeyPath = swift_getKeyPath();
    v14 = sub_219752750();
    v15 = swift_getKeyPath();
    v25 = v11;
    v26 = KeyPath;
    v27 = v12;
    v28 = v15;
    v29 = v14;
    v30 = 0;
  }
  else
  {
    v16 = sub_21975284C();
    v17 = sub_219752828();
    v18 = swift_getKeyPath();
    v19 = sub_219752750();
    v20 = swift_getKeyPath();
    v25 = v16;
    v26 = v18;
    v27 = v17;
    v28 = v20;
    v29 = v19;
    v30 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096B50);
  sub_219741700();
  sub_219752678();
  result = *(double *)&v31;
  v22 = v32;
  v23 = v33;
  v24 = v34;
  *(_OWORD *)a1 = v31;
  *(_OWORD *)(a1 + 16) = v22;
  *(_QWORD *)(a1 + 32) = v23;
  *(_BYTE *)(a1 + 40) = v24;
  return result;
}

uint64_t sub_21974D794(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t result;
  void (*v10)(uint64_t);
  char *v11;
  uint64_t v12;
  uint64_t v13[3];

  if (qword_255095E80 != -1)
    swift_once();
  v2 = sub_2197523D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  v3 = sub_2197523C0();
  v4 = sub_219752A38();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v12 = sub_219738DB8(0x696F4A6F546B7361, 0xEC000000776F526ELL, v13);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: Tapped on ask to join row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v6, -1, -1);
    MEMORY[0x219A32EB8](v5, -1, -1);
  }

  v7 = *(char **)(a1 + 24);
  v8 = &v7[OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler];
  result = swift_beginAccess();
  v10 = *(void (**)(uint64_t))v8;
  if (*(_QWORD *)v8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21973D3AC((uint64_t)v10);
    v11 = v7;
    sub_219752408();

    swift_release();
    swift_release();
    v10(v12);
    return sub_219731D9C((uint64_t)v10);
  }
  return result;
}

uint64_t sub_21974D9AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  _BYTE v53[7];
  char v54;
  _BYTE v55[7];
  char v56;
  char v57;

  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = sub_219752360();
  v8 = v7;

  v46 = v6;
  v47 = v8;
  sub_21972F9DC();
  v9 = sub_219752798();
  v11 = v10;
  v13 = v12 & 1;
  sub_21975281C();
  v14 = sub_219752774();
  v43 = v15;
  v44 = v14;
  v17 = v16;
  v45 = v18;
  swift_release();
  v19 = v17 & 1;
  sub_21972FA20(v9, v11, v13);
  swift_bridgeObjectRelease();
  v20 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v21 = v20;
  sub_219752408();

  swift_release();
  swift_release();
  v46 = sub_21974DD1C(v46);
  v47 = v22;
  v23 = sub_219752798();
  v25 = v24;
  v27 = v26 & 1;
  sub_219752828();
  v28 = sub_219752774();
  v41 = v29;
  v42 = v28;
  v31 = v30;
  v33 = v32;
  swift_release();
  sub_21972FA20(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_21974D5A0((uint64_t)&v46);
  v34 = v46;
  v35 = v47;
  v36 = v48;
  v37 = v49;
  v38 = v50;
  v57 = v19;
  v56 = 1;
  v54 = v31 & 1;
  v52 = v51;
  *(_DWORD *)(a2 + 17) = v46;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v46 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v55[3];
  v39 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 65) = v39;
  LOBYTE(v39) = v52;
  *(_QWORD *)a2 = v44;
  *(_QWORD *)(a2 + 8) = v43;
  *(_BYTE *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v45;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v42;
  *(_QWORD *)(a2 + 56) = v41;
  *(_BYTE *)(a2 + 64) = v31 & 1;
  *(_QWORD *)(a2 + 72) = v33;
  *(_QWORD *)(a2 + 80) = v34;
  *(_QWORD *)(a2 + 88) = v35;
  *(_QWORD *)(a2 + 96) = v36;
  *(_QWORD *)(a2 + 104) = v37;
  *(_QWORD *)(a2 + 112) = v38;
  *(_BYTE *)(a2 + 120) = v39;
  sub_219730884(v44, v43, v19);
  swift_bridgeObjectRetain();
  sub_219730884(v42, v41, v31 & 1);
  swift_bridgeObjectRetain();
  sub_219751468();
  sub_2197514BC();
  sub_21972FA20(v42, v41, v31 & 1);
  swift_bridgeObjectRelease();
  sub_21972FA20(v44, v43, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21974DD1C(unint64_t a1)
{
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;

  if (a1 > 2)
    return 0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = sub_219752360();

  return v3;
}

uint64_t sub_21974DF08(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t result;
  void (*v10)(uint64_t);
  char *v11;
  uint64_t v12;
  uint64_t v13[3];

  if (qword_255095E80 != -1)
    swift_once();
  v2 = sub_2197523D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  v3 = sub_2197523C0();
  v4 = sub_219752A38();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v12 = sub_219738DB8(0xD000000000000015, 0x80000002197666C0, v13);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: Tapped on auto instant hotspot row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v6, -1, -1);
    MEMORY[0x219A32EB8](v5, -1, -1);
  }

  v7 = *(char **)(a1 + 24);
  v8 = &v7[OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler];
  result = swift_beginAccess();
  v10 = *(void (**)(uint64_t))v8;
  if (*(_QWORD *)v8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_21973D3AC((uint64_t)v10);
    v11 = v7;
    sub_219752408();

    swift_release();
    swift_release();
    v10(v12);
    return sub_219731D9C((uint64_t)v10);
  }
  return result;
}

double sub_21974E11C@<D0>(uint64_t a1@<X0>, void (*a2)(_OWORD *__return_ptr, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[6];
  _OWORD v13[2];
  _BYTE v14[119];

  v6 = sub_21975257C();
  a2(v12, a1);
  *(_OWORD *)&v14[71] = v12[4];
  *(_OWORD *)&v14[87] = v12[5];
  *(_OWORD *)&v14[103] = v13[0];
  *(_OWORD *)&v14[7] = v12[0];
  *(_OWORD *)&v14[23] = v12[1];
  *(_OWORD *)&v14[39] = v12[2];
  *(_OWORD *)&v14[55] = v12[3];
  v7 = *(_OWORD *)&v14[96];
  *(_OWORD *)(a3 + 129) = *(_OWORD *)((char *)v13 + 9);
  v8 = *(_OWORD *)&v14[80];
  *(_OWORD *)(a3 + 81) = *(_OWORD *)&v14[64];
  *(_OWORD *)(a3 + 97) = v8;
  v9 = *(_OWORD *)&v14[32];
  *(_OWORD *)(a3 + 65) = *(_OWORD *)&v14[48];
  *(_OWORD *)(a3 + 49) = v9;
  result = *(double *)&v14[16];
  v11 = *(_OWORD *)v14;
  *(_OWORD *)(a3 + 33) = *(_OWORD *)&v14[16];
  *(_OWORD *)(a3 + 17) = v11;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  *(_OWORD *)(a3 + 113) = v7;
  return result;
}

uint64_t sub_21974E200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  _BYTE v53[7];
  char v54;
  _BYTE v55[7];
  char v56;
  char v57;

  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = sub_219752360();
  v8 = v7;

  v46 = v6;
  v47 = v8;
  sub_21972F9DC();
  v9 = sub_219752798();
  v11 = v10;
  v13 = v12 & 1;
  sub_21975281C();
  v14 = sub_219752774();
  v43 = v15;
  v44 = v14;
  v17 = v16;
  v45 = v18;
  swift_release();
  v19 = v17 & 1;
  sub_21972FA20(v9, v11, v13);
  swift_bridgeObjectRelease();
  v20 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  v21 = v20;
  sub_219752408();

  swift_release();
  swift_release();
  v46 = sub_21974E56C(v46);
  v47 = v22;
  v23 = sub_219752798();
  v25 = v24;
  v27 = v26 & 1;
  sub_219752828();
  v28 = sub_219752774();
  v41 = v29;
  v42 = v28;
  v31 = v30;
  v33 = v32;
  swift_release();
  sub_21972FA20(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_21974D5A0((uint64_t)&v46);
  v34 = v46;
  v35 = v47;
  v36 = v48;
  v37 = v49;
  v38 = v50;
  v57 = v19;
  v56 = 1;
  v54 = v31 & 1;
  v52 = v51;
  *(_DWORD *)(a2 + 17) = v46;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v46 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v55[3];
  v39 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 65) = v39;
  LOBYTE(v39) = v52;
  *(_QWORD *)a2 = v44;
  *(_QWORD *)(a2 + 8) = v43;
  *(_BYTE *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v45;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v42;
  *(_QWORD *)(a2 + 56) = v41;
  *(_BYTE *)(a2 + 64) = v31 & 1;
  *(_QWORD *)(a2 + 72) = v33;
  *(_QWORD *)(a2 + 80) = v34;
  *(_QWORD *)(a2 + 88) = v35;
  *(_QWORD *)(a2 + 96) = v36;
  *(_QWORD *)(a2 + 104) = v37;
  *(_QWORD *)(a2 + 112) = v38;
  *(_BYTE *)(a2 + 120) = v39;
  sub_219730884(v44, v43, v19);
  swift_bridgeObjectRetain();
  sub_219730884(v42, v41, v31 & 1);
  swift_bridgeObjectRetain();
  sub_219751468();
  sub_2197514BC();
  sub_21972FA20(v42, v41, v31 & 1);
  swift_bridgeObjectRelease();
  sub_21972FA20(v44, v43, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21974E56C(unint64_t a1)
{
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;

  if (a1 > 2)
    return 0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = sub_219752360();

  return v3;
}

uint64_t sub_21974E720(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void (**v7)(uint64_t);
  uint64_t result;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11[3];

  if (qword_255095E80 != -1)
    swift_once();
  v2 = sub_2197523D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_255098550);
  v3 = sub_2197523C0();
  v4 = sub_219752A38();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_219738DB8(0x74654E726568746FLL, 0xEF776F526B726F77, v11);
    sub_219752A98();
    _os_log_impl(&dword_2196CC000, v3, v4, "%s: Tapped on other network row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A32EB8](v6, -1, -1);
    MEMORY[0x219A32EB8](v5, -1, -1);
  }

  v7 = (void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler);
  result = swift_beginAccess();
  v9 = *v7;
  if (*v7)
  {
    v10 = swift_retain();
    v9(v10);
    return sub_219731D9C((uint64_t)v9);
  }
  return result;
}

uint64_t sub_21974E8E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t result;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  _BYTE v31[7];
  char v32;
  _BYTE v33[7];
  char v34;
  _BYTE v35[7];
  _BYTE v36[7];

  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_219752360();

  v4 = sub_21975257C();
  sub_21974EAB0((uint64_t)&v18);
  swift_bridgeObjectRelease();
  v5 = v18;
  v6 = v19;
  v7 = v20;
  v8 = v21;
  v9 = v22;
  v10 = v27;
  v11 = v28;
  v12 = v24;
  v13 = v25;
  result = 1;
  v34 = v23;
  v32 = v26;
  v30 = v29;
  *(_DWORD *)(a1 + 17) = v18;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v18 + 3);
  *(_DWORD *)(a1 + 33) = *(_DWORD *)v36;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)&v36[3];
  v15 = *(_DWORD *)v35;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 49) = v15;
  LOBYTE(v15) = v34;
  v16 = *(_DWORD *)v33;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v33[3];
  *(_DWORD *)(a1 + 65) = v16;
  LOBYTE(v16) = v32;
  v17 = *(_DWORD *)v31;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v31[3];
  *(_DWORD *)(a1 + 105) = v17;
  LOBYTE(v17) = v30;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = v15;
  *(_OWORD *)(a1 + 72) = v12;
  *(_OWORD *)(a1 + 88) = v13;
  *(_BYTE *)(a1 + 104) = v16;
  *(_QWORD *)(a1 + 112) = v10;
  *(_QWORD *)(a1 + 120) = v11;
  *(_BYTE *)(a1 + 128) = v17;
  return result;
}

uint64_t sub_21974EAB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  sub_2197528D0();
  sub_219752450();
  sub_21972F9DC();
  swift_bridgeObjectRetain();
  v2 = sub_219752798();
  v4 = v3;
  v5 = v2;
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  v7 = v6 & 1;
  *(_QWORD *)(a1 + 16) = v10;
  *(_BYTE *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v12;
  *(_BYTE *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v14;
  *(_QWORD *)(a1 + 56) = v15;
  *(_QWORD *)(a1 + 64) = v2;
  *(_QWORD *)(a1 + 72) = v3;
  *(_BYTE *)(a1 + 80) = v6 & 1;
  *(_QWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 1;
  sub_219730884(v2, v3, v6 & 1);
  swift_bridgeObjectRetain();
  sub_21972FA20(v5, v4, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21974EBCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t ObjCClassFromMetadata;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t KeyPath;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unsigned __int8 v99;
  uint64_t v100;
  uint64_t v101;

  v4 = sub_219752438();
  v93 = *(_QWORD *)(v4 - 8);
  v94 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2197526B4();
  v86 = *(_QWORD *)(v7 - 8);
  v87 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v85 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096B90);
  v83 = *(_QWORD *)(v9 - 8);
  v84 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v82 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550966E0);
  v89 = *(_QWORD *)(v11 - 8);
  v90 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v88 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA0);
  v13 = MEMORY[0x24BDAC7A8](v81);
  v92 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v91 = (uint64_t)&v71 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v71 - v20;
  v22 = type metadata accessor for NetworkList();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v26 = v25;
  sub_219752408();

  swift_release();
  swift_release();
  if (v96 >> 62)
  {
    swift_bridgeObjectRetain();
    v27 = sub_219752B7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = *(_QWORD *)((v96 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_219730C60(a1, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  if (v27 <= 0)
  {
    v28 = (void *)*((_QWORD *)v24 + 1);
    swift_getKeyPath();
    swift_getKeyPath();
    v29 = v28;
    sub_219752408();

    swift_release();
    swift_release();
    if (v96 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_219752B7C();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_219730CA4((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  }
  else
  {
    sub_219730CA4((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  }
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v31 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v32 = sub_219752360();
  v34 = v33;

  v96 = v32;
  v97 = v34;
  sub_21972F9DC();
  v35 = sub_219752798();
  v37 = v36;
  v95 = v38;
  v40 = v39;
  v41 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v42 = v41;
  sub_219752408();

  swift_release();
  swift_release();
  if (v96 == 1)
  {
    sub_2197528D0();
    sub_219752450();
    v77 = v96;
    v76 = v97;
    v75 = v98;
    v74 = v99;
    v73 = v100;
    v72 = v101;
    v43 = v82;
    sub_219752444();
    v80 = v40;
    v44 = v85;
    sub_2197526A8();
    sub_2197299AC(&qword_255096BC0, (uint64_t *)&unk_255096B90, MEMORY[0x24BDEBC00]);
    sub_21972996C((unint64_t *)&qword_2550966E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C8], MEMORY[0x24BDF07A8]);
    v78 = v37;
    v45 = v88;
    v79 = v35;
    v46 = v84;
    v47 = v87;
    sub_2197527BC();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v44, v47);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v43, v46);
    v48 = v6;
    v49 = a2;
    v50 = v21;
    v51 = v93;
    v52 = v94;
    (*(void (**)(char *, _QWORD, uint64_t))(v93 + 104))(v48, *MEMORY[0x24BDEB490], v94);
    KeyPath = swift_getKeyPath();
    v54 = (uint64_t)v92;
    v55 = (uint64_t *)&v92[*(int *)(v81 + 36)];
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096430);
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))((char *)v55 + *(int *)(v56 + 28), v48, v52);
    *v55 = KeyPath;
    v58 = v89;
    v57 = v90;
    (*(void (**)(uint64_t, char *, uint64_t))(v89 + 16))(v54, v45, v90);
    v59 = *(void (**)(char *, uint64_t))(v51 + 8);
    v21 = v50;
    a2 = v49;
    v60 = v48;
    v40 = v80;
    v59(v60, v52);
    v61 = v45;
    v37 = v78;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v57);
    v62 = v91;
    sub_2197310EC(v54, v91, &qword_255096BA0);
    sub_219731034(v62, v54, &qword_255096BA0);
    *(_QWORD *)v19 = 0;
    v19[8] = 1;
    *((_QWORD *)v19 + 2) = v77;
    v19[24] = v76;
    *((_QWORD *)v19 + 4) = v75;
    v19[40] = v74;
    v63 = v72;
    *((_QWORD *)v19 + 6) = v73;
    *((_QWORD *)v19 + 7) = v63;
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BC8);
    sub_219731034(v54, (uint64_t)&v19[*(int *)(v64 + 48)], &qword_255096BA0);
    sub_219731078(v62, &qword_255096BA0);
    v65 = v54;
    v35 = v79;
    sub_219731078(v65, &qword_255096BA0);
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BB0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v19, 0, 1, v66);
    sub_2197310EC((uint64_t)v19, (uint64_t)v21, &qword_255096BA8);
  }
  else
  {
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v21, 1, 1, v67);
  }
  v68 = v95 & 1;
  sub_219731034((uint64_t)v21, (uint64_t)v19, &qword_255096BA8);
  *(_QWORD *)a2 = v35;
  *(_QWORD *)(a2 + 8) = v37;
  *(_BYTE *)(a2 + 16) = v68;
  *(_QWORD *)(a2 + 24) = v40;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BB8);
  sub_219731034((uint64_t)v19, a2 + *(int *)(v69 + 48), &qword_255096BA8);
  sub_219730884(v35, v37, v68);
  swift_bridgeObjectRetain();
  sub_219731078((uint64_t)v21, &qword_255096BA8);
  sub_219731078((uint64_t)v19, &qword_255096BA8);
  sub_21972FA20(v35, v37, v68);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21974F480@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_219752360();

  swift_bridgeObjectRelease();
  sub_21972F9DC();
  result = sub_219752798();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v7;
  return result;
}

unint64_t sub_21974F5D0()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 *v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (unsigned __int8 *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  swift_beginAccess();
  v3 = *v2;
  v4 = (unsigned __int8 *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  swift_beginAccess();
  v5 = *v4;
  v6 = (_BYTE *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  swift_beginAccess();
  v7 = 0xD00000000000001DLL;
  if (v3)
    v7 = 0xD00000000000001FLL;
  v8 = 0xD000000000000025;
  if (v3)
    v8 = 0xD000000000000027;
  if (v5)
    v7 = v8;
  v9 = 0xD000000000000029;
  if (!v3)
    v9 = 0xD000000000000027;
  v10 = 0xD00000000000002FLL;
  if (v3)
    v10 = 0xD000000000000031;
  if (v5)
    v9 = v10;
  if (*v6 == 1)
    return v9;
  else
    return v7;
}

uint64_t sub_21974F770(unint64_t a1)
{
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;

  if (a1 > 2)
    return 0;
  type metadata accessor for WFNetworkListViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = sub_219752360();

  return v3;
}

uint64_t sub_21974F95C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A28);
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096CA0);
  v9 = MEMORY[0x24BDAC7A8](v28);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  sub_2197528D0();
  sub_219752450();
  v27 = v32;
  v26 = v33;
  v25 = v34;
  v24 = v35;
  v22 = v37;
  v23 = v36;
  v30 = a1;
  v31 = a2;
  type metadata accessor for NetworkListConfigDataSource();
  sub_21972996C(&qword_255096718, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_219752498();
  swift_getKeyPath();
  sub_2197524A4();
  swift_release();

  sub_21972F9DC();
  sub_219752888();
  KeyPath = swift_getKeyPath();
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = 1;
  v17 = v29;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v13, v8, v29);
  v18 = (uint64_t *)&v13[*(int *)(v28 + 36)];
  *v18 = KeyPath;
  v18[1] = (uint64_t)sub_2197519D0;
  v18[2] = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  sub_219731034((uint64_t)v13, (uint64_t)v11, &qword_255096CA0);
  sub_2197519E8();
  v19 = sub_219752894();
  result = sub_219731078((uint64_t)v13, &qword_255096CA0);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = v27;
  *(_BYTE *)(a3 + 24) = v26;
  *(_QWORD *)(a3 + 32) = v25;
  *(_BYTE *)(a3 + 40) = v24;
  v21 = v22;
  *(_QWORD *)(a3 + 48) = v23;
  *(_QWORD *)(a3 + 56) = v21;
  *(_QWORD *)(a3 + 64) = v19;
  return result;
}

uint64_t sub_21974FC28@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t v62;

  v6 = sub_219752438();
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2197526B4();
  v49 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096B90);
  v42 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550966E0);
  v50 = *(_QWORD *)(v14 - 8);
  v51 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096BA0);
  v17 = MEMORY[0x24BDAC7A8](v41);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v38 - v20;
  sub_2197528D0();
  sub_219752450();
  v48 = v57;
  v47 = v58;
  v46 = v59;
  v45 = v60;
  v43 = v62;
  v44 = v61;
  v55 = a1;
  v56 = a2;
  sub_21972F9DC();
  swift_bridgeObjectRetain();
  v39 = sub_219752798();
  v38 = v22;
  v40 = v23;
  LOBYTE(a2) = v24 & 1;
  sub_219752444();
  sub_2197526A8();
  sub_2197299AC(&qword_255096BC0, (uint64_t *)&unk_255096B90, MEMORY[0x24BDEBC00]);
  sub_21972996C((unint64_t *)&qword_2550966E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C8], MEMORY[0x24BDF07A8]);
  sub_2197527BC();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v11);
  v26 = v52;
  v25 = v53;
  v27 = v54;
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v52, *MEMORY[0x24BDEB490], v54);
  KeyPath = swift_getKeyPath();
  v29 = (uint64_t *)&v19[*(int *)(v41 + 36)];
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096430);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))((char *)v29 + *(int *)(v30 + 28), v26, v27);
  *v29 = KeyPath;
  v32 = v50;
  v31 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v19, v16, v51);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v31);
  sub_2197310EC((uint64_t)v19, (uint64_t)v21, &qword_255096BA0);
  sub_219731034((uint64_t)v21, (uint64_t)v19, &qword_255096BA0);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = v48;
  *(_BYTE *)(a3 + 24) = v47;
  *(_QWORD *)(a3 + 32) = v46;
  *(_BYTE *)(a3 + 40) = v45;
  v33 = v43;
  *(_QWORD *)(a3 + 48) = v44;
  *(_QWORD *)(a3 + 56) = v33;
  v34 = v39;
  v35 = v38;
  *(_QWORD *)(a3 + 64) = v39;
  *(_QWORD *)(a3 + 72) = v35;
  *(_BYTE *)(a3 + 80) = a2;
  *(_QWORD *)(a3 + 88) = v40;
  *(_QWORD *)(a3 + 96) = 0;
  *(_BYTE *)(a3 + 104) = 1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096C98);
  sub_219731034((uint64_t)v19, a3 + *(int *)(v36 + 80), &qword_255096BA0);
  sub_219730884(v34, v35, a2);
  swift_bridgeObjectRetain();
  sub_219731078((uint64_t)v21, &qword_255096BA0);
  sub_219731078((uint64_t)v19, &qword_255096BA0);
  sub_21972FA20(v34, v35, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21975007C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096A28);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v18 - v11;
  sub_2197528D0();
  sub_219752450();
  v24 = v27;
  v23 = v28;
  v22 = v29;
  v21 = v30;
  v19 = v32;
  v20 = v31;
  v25 = a1;
  v26 = a2;
  type metadata accessor for NetworkListConfigDataSource();
  sub_21972996C(&qword_255096718, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource, (uint64_t)&protocol conformance descriptor for NetworkListConfigDataSource);
  swift_bridgeObjectRetain();
  v13 = (void *)sub_219752498();
  swift_getKeyPath();
  sub_2197524A4();
  swift_release();

  sub_21972F9DC();
  sub_219752888();
  v14 = v7;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  sub_2197299AC(&qword_255096A30, &qword_255096A28, MEMORY[0x24BDF46D0]);
  v15 = sub_219752894();
  result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v6);
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = v24;
  *(_BYTE *)(a3 + 24) = v23;
  *(_QWORD *)(a3 + 32) = v22;
  *(_BYTE *)(a3 + 40) = v21;
  v17 = v19;
  *(_QWORD *)(a3 + 48) = v20;
  *(_QWORD *)(a3 + 56) = v17;
  *(_QWORD *)(a3 + 64) = v15;
  return result;
}

uint64_t sub_2197502B8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_219730C60(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for NetworkList);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_219745FA8((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_219745FEC;
  a2[1] = v7;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkListMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkListMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21975044C + 4 * byte_21975A765[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_219750480 + 4 * byte_21975A760[v4]))();
}

uint64_t sub_219750480(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_219750488(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x219750490);
  return result;
}

uint64_t sub_21975049C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2197504A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2197504A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2197504B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2197504BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2197504C4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkListMode()
{
  return &type metadata for NetworkListMode;
}

ValueMetadata *type metadata accessor for WiFiListNotifications()
{
  return &type metadata for WiFiListNotifications;
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkList(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  void *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  id v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v7;
    v8 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v8;
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_219752A8C();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v14 = v7;
    v15 = v8;
    v13(v10, v11, v12);
    v16 = *(int *)(a3 + 28);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for NetworkList(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_219752A8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for NetworkList(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_219752A8C();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v13 = v6;
  v14 = v7;
  v12(v9, v10, v11);
  v15 = *(int *)(a3 + 28);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NetworkList(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  *a1 = *a2;
  v6 = (void *)a2[1];
  v7 = (void *)a1[1];
  a1[1] = v6;
  v8 = v6;

  a1[2] = a2[2];
  v9 = (void *)a2[3];
  v10 = (void *)a1[3];
  a1[3] = v9;
  v11 = v9;

  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_219752A8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = *(int *)(a3 + 28);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for NetworkList(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_219752A8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

_QWORD *assignWithTake for NetworkList(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  v8 = a2[3];
  v9 = (void *)a1[3];
  a1[2] = a2[2];
  a1[3] = v8;

  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_219752A8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = *(int *)(a3 + 28);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v18 = *v16;
  v17 = v16[1];
  *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkList()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2197508C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_219752A8C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for NetworkList()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_219750948(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_219752A8C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2197509BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_219752A8C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_219750A30()
{
  return sub_2197299AC(&qword_2550968D0, &qword_2550968D8, MEMORY[0x24BDEDA10]);
}

uint64_t sub_219750A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkList() - 8) + 80);
  return sub_219745878(a1, v2 + ((v5 + 16) & ~v5), a2);
}

double sub_219750AB4(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 201) = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_219750ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_219746254(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_219750AE4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255096910;
  if (!qword_255096910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096918);
    v2 = MEMORY[0x24BDF5428];
    v3[0] = sub_2197299AC(&qword_255096920, &qword_255096928, MEMORY[0x24BDF5428]);
    v3[1] = sub_2197299AC(&qword_255096930, &qword_255096938, v2);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096910);
  }
  return result;
}

uint64_t sub_219750B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = sub_2197524C8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for NetworkList();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  v8 = v0 + v7 + *(int *)(v5 + 24);
  v9 = sub_219752A8C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_219750C6C()
{
  sub_2197524C8();
  type metadata accessor for NetworkList();
  return sub_2197494FC();
}

uint64_t sub_219750CD4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_219730884(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_219750D04(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 216);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    v4);
  return a1;
}

uint64_t sub_219750D80(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21972FA20(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_219750DB0()
{
  return sub_219749558();
}

uint64_t sub_219750DF0()
{
  uint64_t v0;

  return sub_21974B86C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_219750DF8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_255096A20;
  if (!qword_255096A20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550969A8);
    v2 = sub_2197299AC(&qword_255096A18, &qword_255096A10, MEMORY[0x24BDF43B0]);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096A20);
  }
  return result;
}

uint64_t sub_219750E88()
{
  return sub_21974B974();
}

unint64_t sub_219750EA8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_255096A38;
  if (!qword_255096A38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096990);
    v2 = sub_2197299AC(&qword_255096A30, &qword_255096A28, MEMORY[0x24BDF46D0]);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096A38);
  }
  return result;
}

uint64_t sub_219750F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21974A920(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_219750F48()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_255096A88;
  if (!qword_255096A88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550969D0);
    v2[0] = sub_2197299AC(&qword_255096A78, &qword_2550969C8, MEMORY[0x24BDF4498]);
    v2[1] = sub_2197299AC(&qword_255096A80, &qword_255096A70, MEMORY[0x24BDF5428]);
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096A88);
  }
  return result;
}

uint64_t sub_219751000()
{
  uint64_t v0;

  return sub_21974B3A4(*(_QWORD *)(v0 + 16));
}

unint64_t sub_219751038()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255096AB8;
  if (!qword_255096AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255096AC0);
    v2 = sub_21972996C(&qword_2550963E8, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096AB8);
  }
  return result;
}

unint64_t sub_2197510BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_255096AD0;
  if (!qword_255096AD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096AA0);
    v2 = sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096AD0);
  }
  return result;
}

char *keypath_get_selector_hash()
{
  return sel_hash;
}

id sub_219751160@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_hash);
  *a2 = result;
  return result;
}

uint64_t sub_219751194(uint64_t a1)
{
  return sub_21975165C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21974A2E0);
}

uint64_t sub_2197511A4()
{
  return sub_219752004((uint64_t (*)(_QWORD, uint64_t))sub_21974C6AC);
}

void sub_2197511B0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21974CB04(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2197511C4()
{
  return sub_219751C3C(1);
}

uint64_t sub_2197511CC()
{
  uint64_t v0;

  return sub_21974B3A4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_219751208(uint64_t a1)
{
  return sub_21975165C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21974A600);
}

uint64_t sub_219751218()
{
  uint64_t v0;

  return sub_21974B3A4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_219751254(uint64_t a1)
{
  return sub_21975165C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21974B084);
}

uint64_t sub_219751264()
{
  uint64_t v0;

  return sub_21974B3A4(*(_QWORD *)(v0 + 16));
}

unint64_t sub_2197512A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_255096B18;
  if (!qword_255096B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096B00);
    v2[0] = sub_219751AF8(&qword_255096B10, &qword_255096B08, MEMORY[0x24BDF1F80], MEMORY[0x24BDF5578]);
    v2[1] = sub_2197516FC(&qword_255096AB0, &qword_255096AA8, (uint64_t (*)(void))sub_219751038, MEMORY[0x24BDF4A08]);
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096B18);
  }
  return result;
}

uint64_t sub_219751360(uint64_t a1)
{
  return sub_21975165C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21974B548);
}

uint64_t sub_219751370()
{
  uint64_t v0;

  return sub_21974BD10(*(_QWORD *)(v0 + 16));
}

unint64_t sub_2197513A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_255096B38;
  if (!qword_255096B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096B20);
    v2 = sub_2197299AC(&qword_255096B30, &qword_255096B28, MEMORY[0x24BDF43B0]);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096B38);
  }
  return result;
}

uint64_t sub_219751434()
{
  return sub_219751AAC(sub_21974DF08);
}

double sub_219751440@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21974E11C(*(_QWORD *)(v1 + 16), (void (*)(_OWORD *__return_ptr, uint64_t))sub_21974E200, a1);
}

uint64_t sub_219751468()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_2197514BC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21975151C()
{
  uint64_t v0;

  return sub_21974BD10(*(_QWORD *)(v0 + 16));
}

unint64_t sub_21975154C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_255096B88;
  if (!qword_255096B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096B80);
    v2 = sub_2197299AC(&qword_255096B30, &qword_255096B28, MEMORY[0x24BDF43B0]);
    v3 = sub_219751AF8(&qword_255096B10, &qword_255096B08, MEMORY[0x24BDF1F80], MEMORY[0x24BDF5578]);
    v4[0] = MEMORY[0x24BDF5138];
    v4[1] = v2;
    v4[2] = v3;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255096B88);
  }
  return result;
}

uint64_t sub_219751608()
{
  return sub_219751AAC(sub_21974D794);
}

double sub_219751614@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21974E11C(*(_QWORD *)(v1 + 16), (void (*)(_OWORD *__return_ptr, uint64_t))sub_21974D9AC, a1);
}

uint64_t sub_219751650(uint64_t a1)
{
  return sub_21975165C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21974AD64);
}

uint64_t sub_21975165C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkList() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_2197516BC()
{
  return sub_219751AAC(sub_21974E720);
}

uint64_t sub_2197516C8@<X0>(uint64_t a1@<X8>)
{
  return sub_21974E8E8(a1);
}

uint64_t sub_2197516E0()
{
  return sub_219751AAC(sub_21974D140);
}

double sub_2197516EC@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_21974D304(a1).n128_u64[0];
  return result;
}

uint64_t sub_2197516F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2197495E4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2197516FC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x219A32E40](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_219751760()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096C30;
  if (!qword_255096C30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096250);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096C30);
  }
  return result;
}

unint64_t sub_2197517BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_255096C40;
  if (!qword_255096C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096C08);
    v2 = sub_2197299AC(&qword_255096C20, &qword_255096C10, MEMORY[0x24BDF5428]);
    v3 = sub_2197516FC(&qword_255096C28, &qword_255096C18, (uint64_t (*)(void))sub_219751760, MEMORY[0x24BDF5578]);
    v4[0] = MEMORY[0x24BDF5138];
    v4[1] = v2;
    v4[2] = v3;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255096C40);
  }
  return result;
}

unint64_t sub_219751874()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255096C58;
  if (!qword_255096C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096C50);
    v2 = sub_2197299AC(&qword_255096C60, &qword_255096C68, MEMORY[0x24BDF4498]);
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x219A32E40](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096C58);
  }
  return result;
}

uint64_t sub_2197518F8()
{
  return sub_219751918();
}

uint64_t sub_219751918()
{
  return swift_retain();
}

uint64_t sub_21975192C()
{
  return sub_21975194C();
}

uint64_t sub_21975194C()
{
  return swift_release();
}

uint64_t sub_219751970@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_219752564();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21975199C()
{
  return sub_219752570();
}

uint64_t sub_2197519C0()
{
  return swift_deallocObject();
}

_BYTE *sub_2197519D0(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_2197519E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096CA8;
  if (!qword_255096CA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096CA0);
    v2[0] = sub_2197299AC(&qword_255096A30, &qword_255096A28, MEMORY[0x24BDF46D0]);
    v2[1] = sub_2197299AC(&qword_255096CB0, &qword_255096CB8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096CA8);
  }
  return result;
}

uint64_t sub_219751A88()
{
  return sub_219751AAC(sub_21974CD68);
}

void sub_219751A94(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21974CF8C(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_219751AA0()
{
  return sub_219751AAC(sub_21974D060);
}

uint64_t sub_219751AAC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkList() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_219751AF0()
{
  uint64_t v0;

  return sub_21974C02C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_219751AF8(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x219A32E40](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_219751B54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_255096CD8;
  if (!qword_255096CD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096CC0);
    v2 = sub_219751AF8(&qword_255096CD0, &qword_255096CC8, MEMORY[0x24BDF4760], MEMORY[0x24BDF4A08]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x219A32E40](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255096CD8);
  }
  return result;
}

BOOL sub_219751BEC(void **a1)
{
  return sub_21974C394(a1);
}

uint64_t sub_219751C0C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_219751E10(a1, (uint64_t)&unk_24DB39D48, (uint64_t)&unk_24DB39D70, (uint64_t)sub_219751C34, (uint64_t)sub_219751C94, a2);
}

uint64_t sub_219751C34()
{
  return sub_219751C3C(2);
}

uint64_t sub_219751C3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for NetworkList() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_21974CBEC(v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_219751C94()
{
  return sub_219752004((uint64_t (*)(_QWORD, uint64_t))sub_21974CCCC);
}

unint64_t sub_219751CA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255096CE8;
  if (!qword_255096CE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255096CE0);
    v2[0] = sub_21972996C(&qword_255096270, (uint64_t (*)(uint64_t))type metadata accessor for NetworkListRowView, (uint64_t)&protocol conformance descriptor for NetworkListRowView);
    v2[1] = sub_2197299AC(&qword_255096CF0, &qword_255096CF8, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x219A32E40](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255096CE8);
  }
  return result;
}

uint64_t sub_219751D3C()
{
  uint64_t v0;

  return sub_21974C1E0(*(_QWORD *)(v0 + 16));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for NetworkList();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);

  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_219752A8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_219751DEC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_219751E10(a1, (uint64_t)&unk_24DB39DC0, (uint64_t)&unk_24DB39DE8, (uint64_t)sub_219751C34, (uint64_t)sub_219751C94, a2);
}

uint64_t sub_219751E10@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v13;

  v13 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkList() - 8) + 80);
  return sub_21974C42C(a1, v6 + ((v13 + 16) & ~v13), a2, a3, a4, a5, a6);
}

uint64_t objectdestroy_89Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for NetworkList();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;

  v6 = v5 + *(int *)(v1 + 24);
  v7 = sub_219752A8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t objectdestroy_80Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for NetworkList();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;

  v4 = v0 + v3 + *(int *)(v1 + 24);
  v5 = sub_219752A8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_219752004(uint64_t (*a1)(_QWORD, uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NetworkList() - 8) + 80);
  return a1(*(_QWORD *)(v1 + 16), v1 + ((v2 + 24) & ~v2));
}

uint64_t sub_219752044(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;

  v2 = v1;
  v3 = a1;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    v4 = sub_219752B7C();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v21 = v2;
      v22 = v3;
      v23 = v3 & 0xC000000000000001;
      v5 = 4;
      do
      {
        v2 = v5 - 4;
        if (v23)
        {
          v8 = (void *)MEMORY[0x219A32588](v5 - 4, v3);
          v9 = v5 - 3;
          if (__OFADD__(v2, 1))
            goto LABEL_30;
        }
        else
        {
          v8 = *(void **)(v3 + 8 * v5);
          swift_unknownObjectRetain();
          v9 = v5 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        v10 = v4;
        v11 = objc_msgSend(v8, sel_ssid, v21);
        if (v11)
        {
          v12 = v11;
          v13 = sub_2197529A8();
          v15 = v14;

        }
        else
        {
          v13 = 0;
          v15 = 0;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_219752408();
        swift_release();
        swift_release();
        v16 = (uint64_t)v24;
        if (v24)
        {
          v17 = objc_msgSend(v24, sel_ssid);
          swift_unknownObjectRelease();
          if (v17)
          {
            v16 = sub_2197529A8();
            v19 = v18;

            if (!v15)
              goto LABEL_24;
          }
          else
          {
            v16 = 0;
            v19 = 0;
            if (!v15)
            {
LABEL_24:
              if (!v19)
              {
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
                return 1;
              }
LABEL_26:
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_5;
            }
          }
        }
        else
        {
          v19 = 0;
          if (!v15)
            goto LABEL_24;
        }
        if (!v19)
          goto LABEL_26;
        if (v13 == v16 && v15 == v19)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
LABEL_28:
          swift_bridgeObjectRelease();
          return 1;
        }
        v6 = sub_219752BE8();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v6 & 1) != 0)
          goto LABEL_28;
LABEL_5:
        ++v5;
        v4 = v10;
        v7 = v9 == v10;
        v3 = v22;
      }
      while (!v7);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

BOOL sub_2197522F4(void **a1)
{
  return sub_219751BEC(a1);
}

uint64_t sub_219752318()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_219752348()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_219752354()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_219752360()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21975236C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_219752378()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_219752384()
{
  return MEMORY[0x24BDCEE00]();
}

uint64_t sub_219752390()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_21975239C()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_2197523A8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2197523B4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2197523C0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2197523CC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2197523D8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2197523E4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2197523F0()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_2197523FC()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_219752408()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_219752414()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_219752420()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21975242C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_219752438()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_219752444()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_219752450()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_21975245C()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_219752468()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_219752474()
{
  return MEMORY[0x24BDEC850]();
}

uint64_t sub_219752480()
{
  return MEMORY[0x24BDEC860]();
}

uint64_t sub_21975248C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_219752498()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_2197524A4()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_2197524B0()
{
  return MEMORY[0x24BDED290]();
}

uint64_t sub_2197524BC()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_2197524C8()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_2197524D4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2197524E0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2197524EC()
{
  return MEMORY[0x24BDEDC78]();
}

uint64_t sub_2197524F8()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_219752504()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_219752510()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_21975251C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_219752528()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_219752534()
{
  return MEMORY[0x24BDEE138]();
}

uint64_t sub_219752540()
{
  return MEMORY[0x24BDEE140]();
}

uint64_t sub_21975254C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_219752558()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_219752564()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_219752570()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_21975257C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_219752588()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_219752594()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2197525A0()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_2197525AC()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_2197525B8()
{
  return MEMORY[0x24BDEEDC0]();
}

uint64_t sub_2197525C4()
{
  return MEMORY[0x24BDEEDC8]();
}

uint64_t sub_2197525D0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2197525DC()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2197525E8()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2197525F4()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_219752600()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_21975260C()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_219752618()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_219752624()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_219752630()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_21975263C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_219752648()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_219752654()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_219752660()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_21975266C()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_219752678()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_219752684()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_219752690()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_21975269C()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_2197526A8()
{
  return MEMORY[0x24BDF07B8]();
}

uint64_t sub_2197526B4()
{
  return MEMORY[0x24BDF07C8]();
}

uint64_t sub_2197526C0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2197526CC()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2197526D8()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2197526E4()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_2197526F0()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2197526FC()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_219752708()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_219752714()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_219752720()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_21975272C()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_219752738()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_219752744()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_219752750()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_21975275C()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_219752768()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_219752774()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_219752780()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_21975278C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_219752798()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2197527A4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2197527B0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2197527BC()
{
  return MEMORY[0x24BDF20B0]();
}

uint64_t sub_2197527C8()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_2197527D4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2197527E0()
{
  return MEMORY[0x24BDF2B38]();
}

uint64_t sub_2197527EC()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_2197527F8()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_219752804()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_219752810()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_21975281C()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_219752828()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_219752834()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_219752840()
{
  return MEMORY[0x24BDF3F78]();
}

uint64_t sub_21975284C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_219752858()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_219752864()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_219752870()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21975287C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_219752888()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_219752894()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_2197528A0()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2197528AC()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_2197528B8()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_2197528C4()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_2197528D0()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2197528DC()
{
  return MEMORY[0x24BDF4FA8]();
}

uint64_t sub_2197528E8()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_2197528F4()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_219752900()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21975290C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_219752918()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_219752924()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_219752930()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21975293C()
{
  return MEMORY[0x24BDCF908]();
}

uint64_t sub_219752948()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_219752954()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_219752960()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_21975296C()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_219752978()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_219752984()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_219752990()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21975299C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2197529A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2197529B4()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2197529C0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2197529CC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2197529D8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2197529E4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2197529F0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2197529FC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_219752A08()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_219752A14()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_219752A20()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_219752A2C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_219752A38()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_219752A44()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_219752A50()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_219752A5C()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_219752A68()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_219752A74()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_219752A80()
{
  return MEMORY[0x24BDD0060]();
}

uint64_t sub_219752A8C()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_219752A98()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_219752AA4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_219752AB0()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_219752ABC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_219752AC8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_219752AD4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_219752AE0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_219752AEC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_219752AF8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_219752B04()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_219752B10()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_219752B1C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_219752B28()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_219752B34()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_219752B40()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_219752B4C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_219752B58()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_219752B64()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_219752B70()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_219752B7C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_219752B88()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_219752B94()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_219752BA0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_219752BAC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_219752BB8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_219752BC4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_219752BD0()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_219752BDC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_219752BE8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_219752BF4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_219752C00()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_219752C0C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_219752C18()
{
  return MEMORY[0x24BEE4328]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x24BED8680]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
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

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback()
{
  return MEMORY[0x24BE67940]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x24BE67AE8]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x24BE67B68]();
}

uint64_t WiFiNetworkArchiveToPath()
{
  return MEMORY[0x24BE67B78]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x24BE67BA0]();
}

uint64_t WiFiNetworkGetAPEnv()
{
  return MEMORY[0x24BE67BC8]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x24BE67BE8]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x24BE67C38]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}


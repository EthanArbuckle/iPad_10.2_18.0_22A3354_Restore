@implementation WFDevice

- (int64_t)platform
{
  return 0;
}

- (int64_t)idiom
{
  uint64_t v2;

  if (idiom_onceTokenkMGQDeviceClassNumber != -1)
    dispatch_once(&idiom_onceTokenkMGQDeviceClassNumber, &__block_literal_global_136);
  v2 = objc_msgSend((id)idiom_cachedAnswer, "integerValue");
  if ((unint64_t)(v2 - 1) > 0xA)
    return -1;
  else
    return qword_1AF780958[v2 - 1];
}

+ (WFDevice)currentDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__WFDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, block);
  return (WFDevice *)(id)currentDevice_currentDevice;
}

- (NSString)systemVersion
{
  if (systemVersion_onceTokenkMGQProductVersion != -1)
    dispatch_once(&systemVersion_onceTokenkMGQProductVersion, &__block_literal_global_110_12873);
  if (systemVersion_cachedAnswer)
    return (NSString *)(id)systemVersion_cachedAnswer;
  else
    return (NSString *)CFSTR("Unknown");
}

void __25__WFDevice_currentDevice__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = v0;

}

- (WFDevice)init
{
  WFDevice *v2;
  WFDevice *v3;
  WFDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDevice;
  v2 = -[WFDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_capabilitiesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __17__WFDevice_idiom__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)idiom_cachedAnswer;
  idiom_cachedAnswer = (uint64_t)v1;

}

- (CGRect)screenBounds
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (screenBounds_onceTokenkMGQMainScreenWidth != -1)
    dispatch_once(&screenBounds_onceTokenkMGQMainScreenWidth, &__block_literal_global_12881);
  v3 = (id)screenBounds_cachedAnswer;
  if (screenBounds_onceTokenkMGQMainScreenHeight != -1)
    dispatch_once(&screenBounds_onceTokenkMGQMainScreenHeight, &__block_literal_global_101_12882);
  v4 = (id)screenBounds_cachedAnswer_100;
  -[WFDevice screenScale](self, "screenScale");
  if (v5 == 0.0)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v10 = v5;
    objc_msgSend(v3, "doubleValue");
    v8 = v11 / v10;
    objc_msgSend(v4, "doubleValue");
    v6 = 0.0;
    v7 = 0.0;
    v9 = v12 / v10;
  }

  v13 = v6;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)screenScale
{
  double result;

  if (screenScale_onceTokenkMGQMainScreenScale != -1)
    dispatch_once(&screenScale_onceTokenkMGQMainScreenScale, &__block_literal_global_104_12878);
  objc_msgSend((id)screenScale_cachedAnswer, "doubleValue");
  if (result <= 0.0)
    return 1.0;
  return result;
}

- (double)screenCornerRadius
{
  double result;

  if (screenCornerRadius_onceTokenkMGQDeviceCornerRadius != -1)
    dispatch_once(&screenCornerRadius_onceTokenkMGQDeviceCornerRadius, &__block_literal_global_107);
  objc_msgSend((id)screenCornerRadius_cachedAnswer, "doubleValue");
  return result;
}

- (NSString)systemBuildNumber
{
  if (systemBuildNumber_onceTokenkMGQBuildVersion != -1)
    dispatch_once(&systemBuildNumber_onceTokenkMGQBuildVersion, &__block_literal_global_116_12870);
  if (systemBuildNumber_cachedAnswer)
    return (NSString *)(id)systemBuildNumber_cachedAnswer;
  else
    return (NSString *)CFSTR("Unknown");
}

- (NSString)name
{
  if (name_onceTokenkMGQUserAssignedDeviceName != -1)
    dispatch_once(&name_onceTokenkMGQUserAssignedDeviceName, &__block_literal_global_119);
  if (name_cachedAnswer)
    return (NSString *)(id)name_cachedAnswer;
  else
    return (NSString *)CFSTR("Unknown");
}

- (NSString)model
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  if (model_onceTokenkMGQDeviceName != -1)
    dispatch_once(&model_onceTokenkMGQDeviceName, &__block_literal_global_122_12861);
  v2 = (__CFString *)(id)model_cachedAnswer;
  v3 = v2;
  if (v2)
  {
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
      v4 = CFSTR("iPod touch");
    else
      v4 = v3;
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  v5 = v4;

  return v5;
}

- (NSString)systemName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  if (systemName_onceTokenkMGQMarketingProductName != -1)
    dispatch_once(&systemName_onceTokenkMGQMarketingProductName, &__block_literal_global_129);
  v2 = (__CFString *)(id)systemName_cachedAnswer;
  v3 = v2;
  if (!v2)
  {
    if (systemName_onceTokenkMGQProductName != -1)
      dispatch_once(&systemName_onceTokenkMGQProductName, &__block_literal_global_133);
    v2 = (__CFString *)(id)systemName_cachedAnswer_132;
    v3 = v2;
    if (!v2)
      v2 = CFSTR("Unknown");
  }
  v4 = v2;

  return (NSString *)v4;
}

- (NSArray)capabilities
{
  os_unfair_lock_s *p_capabilitiesLock;
  NSArray **p_capabilities;
  void *v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  p_capabilitiesLock = &self->_capabilitiesLock;
  os_unfair_lock_lock(&self->_capabilitiesLock);
  p_capabilities = &self->_capabilities;
  if (!self->_capabilities)
  {
    v5 = (void *)objc_opt_new();
    if (capabilities_onceTokenkMGQVibratorCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQVibratorCapability, &__block_literal_global_140);
    if (capabilities_cachedAnswer)
      objc_msgSend(v5, "addObject:", CFSTR("Vibration"));
    if (capabilities_onceTokenkMGQSupportsForceTouch != -1)
      dispatch_once(&capabilities_onceTokenkMGQSupportsForceTouch, &__block_literal_global_144);
    if (capabilities_cachedAnswer_143)
      objc_msgSend(v5, "addObject:", CFSTR("ForceTouch"));
    if (capabilities_onceTokenkMGQDeviceSupportsHaptics != -1)
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsHaptics, &__block_literal_global_148);
    if (capabilities_cachedAnswer_147)
      objc_msgSend(v5, "addObject:", CFSTR("Haptic"));
    if (MGGetBoolAnswer())
      objc_msgSend(v5, "addObject:", CFSTR("Baseband"));
    if (capabilities_onceTokenkMGQCellularDataCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQCellularDataCapability, &__block_literal_global_154);
    if (capabilities_cachedAnswer_153)
      objc_msgSend(v5, "addObject:", CFSTR("CellularData"));
    if (capabilities_onceTokenkMGQCellularTelephonyCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQCellularTelephonyCapability, &__block_literal_global_158);
    if (capabilities_cachedAnswer_157)
      objc_msgSend(v5, "addObject:", CFSTR("CellularTelephony"));
    if (-[WFDevice idiomSupportsPosters:](self, "idiomSupportsPosters:", -[WFDevice idiom](self, "idiom")))
      objc_msgSend(v5, "addObject:", CFSTR("Posters"));
    if (capabilities_onceTokenkMGQDeviceSupportsAlwaysOnTime != -1)
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsAlwaysOnTime, &__block_literal_global_162);
    if (capabilities_cachedAnswer_161)
      objc_msgSend(v5, "addObject:", CFSTR("AlwaysOnDisplay"));
    if (capabilities_onceTokenkMGQRingerSwitchCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQRingerSwitchCapability, &__block_literal_global_166);
    if (capabilities_cachedAnswer_165)
      objc_msgSend(v5, "addObject:", CFSTR("HardwareRingerSwitch"));
    if (capabilities_onceTokenkMGQWAPICapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQWAPICapability, &__block_literal_global_170);
    if (capabilities_cachedAnswer_169)
      objc_msgSend(v5, "addObject:", CFSTR("WAPI"));
    if (capabilities_onceTokenkMGQRingerButtonCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQRingerButtonCapability, &__block_literal_global_174);
    if (capabilities_cachedAnswer_173)
      objc_msgSend(v5, "addObject:", CFSTR("ActionButton"));
    if (capabilities_onceTokenkMGQHomeButtonType != -1)
      dispatch_once(&capabilities_onceTokenkMGQHomeButtonType, &__block_literal_global_177);
    if (capabilities_cachedHasHomeButton)
      objc_msgSend(v5, "addObject:", CFSTR("HomeButton"));
    if (capabilities_onceTokenkMGQDeviceSupportsApplePencil != -1)
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsApplePencil, &__block_literal_global_181);
    if (capabilities_cachedAnswer_180)
      objc_msgSend(v5, "addObject:", CFSTR("ApplePencil"));
    if (capabilities_onceTokenkMGQPersonalHotspotCapability != -1)
      dispatch_once(&capabilities_onceTokenkMGQPersonalHotspotCapability, &__block_literal_global_185);
    v6 = capabilities_cachedAnswer_184;
    if (VCIsInternalBuild_onceToken != -1)
      dispatch_once(&VCIsInternalBuild_onceToken, &__block_literal_global_15734);
    if (VCIsInternalBuild_isInternal)
    {
      v7 = MGGetBoolAnswer();
      if (!v6)
      {
        if (v7)
          goto LABEL_61;
      }
    }
    if (v6)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v8 = (void *)getMCProfileConnectionClass_softClass;
      v23 = getMCProfileConnectionClass_softClass;
      if (!getMCProfileConnectionClass_softClass)
      {
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __getMCProfileConnectionClass_block_invoke;
        v18 = &unk_1E5FC8858;
        v19 = &v20;
        __getMCProfileConnectionClass_block_invoke((uint64_t)&v15);
        v8 = (void *)v21[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v9, "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPersonalHotspotModificationAllowed");

      if (v11)
LABEL_61:
        objc_msgSend(v5, "addObject:", CFSTR("PersonalHotspot"));
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v12 = (void *)getVKCRemoveBackgroundRequestHandlerClass_softClass_12816;
    v23 = getVKCRemoveBackgroundRequestHandlerClass_softClass_12816;
    if (!getVKCRemoveBackgroundRequestHandlerClass_softClass_12816)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getVKCRemoveBackgroundRequestHandlerClass_block_invoke_12817;
      v18 = &unk_1E5FC8858;
      v19 = &v20;
      __getVKCRemoveBackgroundRequestHandlerClass_block_invoke_12817((uint64_t)&v15);
      v12 = (void *)v21[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v20, 8);
    if (objc_msgSend(v13, "isSupported"))
      objc_msgSend(v5, "addObject:", CFSTR("Scarlett"));
    if (capabilities_onceTokenkMGQDeviceSupportsSingleDisplayEnhancedMultitasking != -1)
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsSingleDisplayEnhancedMultitasking, &__block_literal_global_191);
    if (capabilities_cachedAnswer_190)
      goto LABEL_72;
    if (capabilities_onceTokenkMGQDeviceSupportsEnhancedMultitasking != -1)
      dispatch_once(&capabilities_onceTokenkMGQDeviceSupportsEnhancedMultitasking, &__block_literal_global_195);
    if (capabilities_cachedAnswer_194)
LABEL_72:
      objc_msgSend(v5, "addObject:", CFSTR("StageManager"));
    if (objc_msgSend(getCBClientClass(), "supportsAdaptation"))
      objc_msgSend(v5, "addObject:", CFSTR("TrueTone"));
    if (objc_msgSend(getCBClientClass(), "supportsBlueLightReduction"))
      objc_msgSend(v5, "addObject:", CFSTR("NightShift"));
    v15 = 0;
    if (!os_eligibility_get_domain_answer() && v15 == 4)
      objc_msgSend(v5, "addObject:", CFSTR("GreyMatter"));
    objc_storeStrong((id *)p_capabilities, v5);

  }
  os_unfair_lock_unlock(p_capabilitiesLock);
  return *p_capabilities;
}

- (BOOL)hasCapability:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFDevice capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSString)localizedWiFiDisplayName
{
  __CFString *v2;

  if (-[WFDevice hasCapability:](self, "hasCapability:", CFSTR("WAPI")))
    v2 = CFSTR("WLAN");
  else
    v2 = CFSTR("Wi-Fi");
  WFLocalizedString(v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)marketingName
{
  if (marketingName_onceTokenkMGQMarketingNameString != -1)
    dispatch_once(&marketingName_onceTokenkMGQMarketingNameString, &__block_literal_global_202);
  return (NSString *)(id)marketingName_cachedAnswer;
}

- (NSString)hostname
{
  char v3[255];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (gethostname(v3, 0xFFuLL))
    return (NSString *)0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)chipID
{
  if (chipID_onceTokenkMGQChipID != -1)
    dispatch_once(&chipID_onceTokenkMGQChipID, &__block_literal_global_205);
  return objc_msgSend((id)chipID_cachedAnswer, "longLongValue");
}

- (BOOL)isChineseRegionCelluarDevice
{
  void *v2;
  BOOL v3;

  if (VCIsInternalBuild_onceToken != -1)
    dispatch_once(&VCIsInternalBuild_onceToken, &__block_literal_global_15734);
  if (!VCIsInternalBuild_isInternal)
    return +[WFDevice deviceIsGreenTea](WFDevice, "deviceIsGreenTea");
  +[WFDevice systemShortcutsUserDefaults](WFDevice, "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "BOOLForKey:", CFSTR("WFGreenTeaOverridingKey")) & 1) != 0
    || +[WFDevice deviceIsGreenTea](WFDevice, "deviceIsGreenTea");

  return v3;
}

- (BOOL)hasPairedAndSetUpWatch
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v12 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v8[3] = &unk_1E5FC8858;
    v8[4] = &v9;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSetupCompletedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)idiomSupportsPosters:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (NSString)localStorageDisplayName
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[WFDevice idiom](self, "idiom");
  if (v2 > 4)
    v3 = CFSTR("On My Device");
  else
    v3 = *(&off_1E5FC88F8 + v2);
  WFLocalizedString(v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)symbolName
{
  int64_t v2;

  v2 = -[WFDevice idiom](self, "idiom");
  if ((unint64_t)(v2 - 1) > 3)
    return (NSString *)CFSTR("iphone");
  else
    return (NSString *)off_1E5FC7708[v2 - 1];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)WFDevice;
  -[WFDevice description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDevice marketingName](self, "marketingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDevice systemName](self, "systemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDevice systemVersion](self, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDevice systemBuildNumber](self, "systemBuildNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ (%@ %@ %@)>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (os_unfair_lock_s)capabilitiesLock
{
  return self->_capabilitiesLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
}

void __18__WFDevice_chipID__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)chipID_cachedAnswer;
  chipID_cachedAnswer = (uint64_t)v1;

}

void __25__WFDevice_marketingName__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)marketingName_cachedAnswer;
  marketingName_cachedAnswer = (uint64_t)v1;

}

void __24__WFDevice_capabilities__block_invoke_14()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_194 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_13()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_190 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_12()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_184 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_11()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_180 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

uint64_t __24__WFDevice_capabilities__block_invoke_10()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  capabilities_cachedHasHomeButton = (_DWORD)result != 2;
  return result;
}

void __24__WFDevice_capabilities__block_invoke_9()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_173 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_8()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_169 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_7()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_165 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_6()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_161 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_5()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_157 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_4()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_153 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_3()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_147 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke_2()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer_143 = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __24__WFDevice_capabilities__block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  capabilities_cachedAnswer = v0 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v0)
    CFRelease(v0);
}

void __22__WFDevice_systemName__block_invoke_2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)systemName_cachedAnswer_132;
  systemName_cachedAnswer_132 = (uint64_t)v1;

}

void __22__WFDevice_systemName__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)systemName_cachedAnswer;
  systemName_cachedAnswer = (uint64_t)v1;

}

void __17__WFDevice_model__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)model_cachedAnswer;
  model_cachedAnswer = (uint64_t)v1;

}

void __16__WFDevice_name__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)name_cachedAnswer;
  name_cachedAnswer = (uint64_t)v1;

}

void __29__WFDevice_systemBuildNumber__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)systemBuildNumber_cachedAnswer;
  systemBuildNumber_cachedAnswer = (uint64_t)v1;

}

void __25__WFDevice_systemVersion__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)systemVersion_cachedAnswer;
  systemVersion_cachedAnswer = (uint64_t)v1;

}

void __30__WFDevice_screenCornerRadius__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)screenCornerRadius_cachedAnswer;
  screenCornerRadius_cachedAnswer = (uint64_t)v1;

}

void __23__WFDevice_screenScale__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)screenScale_cachedAnswer;
  screenScale_cachedAnswer = (uint64_t)v1;

}

void __24__WFDevice_screenBounds__block_invoke_2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)screenBounds_cachedAnswer_100;
  screenBounds_cachedAnswer_100 = (uint64_t)v1;

}

void __24__WFDevice_screenBounds__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)screenBounds_cachedAnswer;
  screenBounds_cachedAnswer = (uint64_t)v1;

}

+ (BOOL)deviceIsGreenTea
{
  if (deviceIsGreenTea_onceToken != -1)
    dispatch_once(&deviceIsGreenTea_onceToken, &__block_literal_global_239);
  return deviceIsGreenTea_deviceIsGreenTea;
}

+ (id)systemShortcutsUserDefaults
{
  if (systemShortcutsUserDefaults_onceToken != -1)
    dispatch_once(&systemShortcutsUserDefaults_onceToken, &__block_literal_global_242);
  return (id)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
}

void __39__WFDevice_systemShortcutsUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.siri.shortcuts"));
  v1 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  systemShortcutsUserDefaults_systemShortcutsUserDefaults = v0;

}

uint64_t __28__WFDevice_deviceIsGreenTea__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  deviceIsGreenTea_deviceIsGreenTea = result;
  return result;
}

@end

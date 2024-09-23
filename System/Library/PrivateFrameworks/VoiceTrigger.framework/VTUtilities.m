@implementation VTUtilities

+ (void)forceReload
{
  notify_post("com.apple.coreaudio.BorealisToggled");
}

+ (id)sanitizeEventInfoForLogging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];

  v4 = a3;
  if (v4)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0xBFF0000000000000;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C802FD0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43__VTUtilities_sanitizeEventInfoForLogging___block_invoke;
    v12[3] = &unk_24C7F3870;
    v7 = v6;
    v13 = v7;
    v15 = v17;
    v8 = v5;
    v14 = v8;
    v16 = a1;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
    v9 = v14;
    v10 = v8;

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (double)_round:(double)a3 withPlaces:(int)a4
{
  double v5;

  v5 = __exp10((double)a4);
  return round(v5 * a3) / v5;
}

+ (double)systemUpTime
{
  int v2;
  double result;
  timeval v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v9 = 0x1500000001;
  v7 = 0;
  v8 = 0;
  v6 = 16;
  v2 = sysctl(v9, 2u, &v7, &v6, 0, 0);
  result = -1.0;
  if (v2 != -1 && v7 != 0)
  {
    v5.tv_sec = 0;
    *(_QWORD *)&v5.tv_usec = 0;
    gettimeofday(&v5, 0);
    return (double)(v5.tv_usec - (int)v8) / 1000000.0 + (double)(v5.tv_sec - v7);
  }
  return result;
}

+ (BOOL)isNonUI
{
  if (isNonUI_onceToken != -1)
    dispatch_once(&isNonUI_onceToken, &__block_literal_global);
  return isNonUI_isNonUI;
}

+ (BOOL)isIOS
{
  return 1;
}

+ (BOOL)isNano
{
  return 0;
}

+ (BOOL)VTIsHorseman
{
  if (VTIsHorseman_onceToken != -1)
    dispatch_once(&VTIsHorseman_onceToken, &__block_literal_global_16);
  return VTIsHorseman_isHorseman;
}

+ (BOOL)supportTTS
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportExternalPhraseSpotter
{
  return 1;
}

+ (BOOL)isAlwaysOn
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportBargeIn
{
  if (supportBargeIn_onceToken != -1)
    dispatch_once(&supportBargeIn_onceToken, &__block_literal_global_23);
  return supportBargeIn_bargeInSupported;
}

+ (BOOL)supportPremiumAssets
{
  return +[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn")
      || +[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman");
}

+ (BOOL)supportRemoteDarwinVoiceTrigger
{
  if (supportRemoteDarwinVoiceTrigger_onceToken != -1)
    dispatch_once(&supportRemoteDarwinVoiceTrigger_onceToken, &__block_literal_global_27);
  return supportRemoteDarwinVoiceTrigger_supportDarwinVT;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_30);
  return isInternalInstall_isInternal;
}

+ (id)deviceProductVersion
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer();
  if (!v2)
    v2 = CFSTR("???");
  return v2;
}

+ (id)deviceProductType
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer();
  if (!v2)
    v2 = CFSTR("???");
  return v2;
}

+ (id)deviceSoftwareVersion
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer();
  if (!v2)
    v2 = CFSTR("???");
  return v2;
}

+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (deviceCategoryForDeviceProductType__onceToken != -1)
    dispatch_once(&deviceCategoryForDeviceProductType__onceToken, &__block_literal_global_41);
  if ((objc_msgSend((id)deviceCategoryForDeviceProductType__nonAopDeviceSet, "containsObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if ((objc_msgSend((id)deviceCategoryForDeviceProductType__macOsDeviceSet, "containsObject:", v3) & 1) != 0)
      goto LABEL_6;
    if ((objc_msgSend(v3, "containsString:", CFSTR("iPad")) & 1) != 0
      || (objc_msgSend(v3, "containsString:", CFSTR("iPhone")) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend(v3, "containsString:", CFSTR("Mac")) & 1) != 0)
    {
LABEL_6:
      v4 = 3;
    }
    else
    {
      v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Unknown Device category for deviceProduceType: %@", (uint8_t *)&v7, 0xCu);
      }
      v4 = 0;
    }
  }
LABEL_10:

  return v4;
}

+ (id)getAssetHashFromConfigPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("com_apple_MobileAsset_VoiceTriggerAssets/"));
  v6 = v5;
  v7 = objc_msgSend(v3, "rangeOfString:", CFSTR(".asset"));
  v9 = CFSTR("nohash");
  if (v6 && v8)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + v6, v7 - (v4 + v6));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (double)VTMachAbsoluteTimeGetTimeInterval:(unint64_t)a3
{
  if (VTMachAbsoluteTimeGetTimeInterval__onceToken != -1)
    dispatch_once(&VTMachAbsoluteTimeGetTimeInterval__onceToken, &__block_literal_global_112);
  return *(double *)&VTMachAbsoluteTimeGetTimeInterval__rate * (double)a3 / 1000000000.0;
}

+ (BOOL)isTorpedo
{
  if (isTorpedo_onceToken != -1)
    dispatch_once(&isTorpedo_onceToken, &__block_literal_global_113);
  return isTorpedo_isTorpedo;
}

+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3
{
  id v3;
  unint64_t v4;
  vDSP_Length v5;
  void *v6;
  void *v7;
  id v8;
  const float *v9;
  id v10;
  id v11;
  const float *v12;
  id v13;
  id v14;
  const float *v15;
  id v16;
  float __C;
  float __B;
  float v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4 >> 2;
  v20 = 32767.0;
  __C = 1.0;
  __B = -1.0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v4 & 0xFFFFFFFFFFFFFFFCLL);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 2 * (v4 >> 2));
  v8 = objc_retainAutorelease(v3);
  v9 = (const float *)objc_msgSend(v8, "bytes");

  v10 = objc_retainAutorelease(v6);
  vDSP_vclip(v9, 1, &__B, &__C, (float *)objc_msgSend(v10, "bytes"), 1, v5);
  v11 = objc_retainAutorelease(v10);
  v12 = (const float *)objc_msgSend(v11, "bytes");
  v13 = objc_retainAutorelease(v11);
  vDSP_vsmul(v12, 1, &v20, (float *)objc_msgSend(v13, "bytes"), 1, v5);
  v14 = objc_retainAutorelease(v13);
  v15 = (const float *)objc_msgSend(v14, "bytes");
  v16 = objc_retainAutorelease(v7);
  vDSP_vfix16(v15, 1, (__int16 *)objc_msgSend(v16, "bytes"), 1, v5);

  return v16;
}

+ (unint64_t)horsemanDeviceType
{
  return 0;
}

uint64_t __24__VTUtilities_isTorpedo__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isTorpedo_isTorpedo = result;
  return result;
}

double __49__VTUtilities_VTMachAbsoluteTimeGetTimeInterval___block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1;
    VTMachAbsoluteTimeGetTimeInterval__rate = *(_QWORD *)&result;
  }
  return result;
}

void __50__VTUtilities_deviceCategoryForDeviceProductType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPad3,4"), CFSTR("iPad3,5"), CFSTR("iPad3,6"), CFSTR("iPad4,1"), CFSTR("iPad4,2"), CFSTR("iPad4,3"), CFSTR("iPad4,4"), CFSTR("iPad4,5"), CFSTR("iPad4,6"), CFSTR("iPad4,7"), CFSTR("iPad4,8"), CFSTR("iPad4,9"), CFSTR("iPad5,1"), CFSTR("iPad5,2"), CFSTR("iPad5,3"), CFSTR("iPad5,4"), CFSTR("iPad6,7"),
    CFSTR("iPad6,8"),
    CFSTR("iPad6,11"),
    CFSTR("iPad6,12"),
    CFSTR("iPhone5,1"),
    CFSTR("iPhone5,2"),
    CFSTR("iPhone5,3"),
    CFSTR("iPhone5,4"),
    CFSTR("iPhone6,1"),
    CFSTR("iPhone6,2"),
    CFSTR("iPhone7,1"),
    CFSTR("iPhone7,2"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceCategoryForDeviceProductType__nonAopDeviceSet;
  deviceCategoryForDeviceProductType__nonAopDeviceSet = v0;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("macOS"), CFSTR("Mac"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)deviceCategoryForDeviceProductType__macOsDeviceSet;
  deviceCategoryForDeviceProductType__macOsDeviceSet = v2;

}

void __32__VTUtilities_isInternalInstall__block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  isInternalInstall_isInternal = objc_msgSend(v0, "BOOLValue");

}

uint64_t __46__VTUtilities_supportRemoteDarwinVoiceTrigger__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportRemoteDarwinVoiceTrigger_supportDarwinVT = result;
  return result;
}

uint64_t __29__VTUtilities_supportBargeIn__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportBargeIn_bargeInSupported = result;
  return result;
}

uint64_t __27__VTUtilities_VTIsHorseman__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  VTIsHorseman_isHorseman = result;
  return result;
}

uint64_t __22__VTUtilities_isNonUI__block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  if (result)
  {
    result = CFEqual((CFTypeRef)result, CFSTR("NonUI"));
    isNonUI_isNonUI = (_DWORD)result != 0;
  }
  return result;
}

void __43__VTUtilities_sanitizeEventInfoForLogging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v15)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v8 < 0.0)
    {
      objc_msgSend(v6, "doubleValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9 + -10.0;
      v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    v10 = *(void **)(a1 + 40);
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v12, "_round:withPlaces:", 2, v13 - v8);
    objc_msgSend(v11, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v15);
  }

}

@end

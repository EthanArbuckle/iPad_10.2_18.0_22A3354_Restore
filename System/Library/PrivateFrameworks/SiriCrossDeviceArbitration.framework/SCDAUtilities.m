@implementation SCDAUtilities

+ (BOOL)isDeviceUnlocked
{
  return soft_MKBGetDeviceLockState() == 3 || soft_MKBGetDeviceLockState() == 0;
}

+ (BOOL)_hasPearlCameraCapability
{
  if (_hasPearlCameraCapability_onceToken != -1)
    dispatch_once(&_hasPearlCameraCapability_onceToken, &__block_literal_global_4);
  return _hasPearlCameraCapability_hasPearlCameraCapability;
}

+ (BOOL)accessibilitySupportsAttentionAwareFeatures
{
  uint64_t (*v2)(void);
  uint64_t v3;
  void *v4;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  _BYTE buf[24];
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = (uint64_t (*)(void))get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr;
  v12 = get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr;
  if (!get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke;
    v14 = &unk_25174AB98;
    v15 = &v9;
    __get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke((uint64_t)buf);
    v2 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v3 = v2();
  v4 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[SCDAUtilities accessibilitySupportsAttentionAwareFeatures]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_debug_impl(&dword_246211000, v7, OS_LOG_TYPE_DEBUG, "%s #scda _AXSAttentionAwarenessFeaturesEnabled %@", buf, 0x16u);

  }
  return v3;
}

+ (BOOL)deviceCanMakeEmergencyCall
{
  return +[SCDAUtilities isPhone](SCDAUtilities, "isPhone");
}

+ (BOOL)isATV
{
  return 0;
}

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isIOS
{
  return 1;
}

+ (BOOL)isNano
{
  return 0;
}

+ (BOOL)isReality
{
  return 0;
}

+ (BOOL)isIOSWithoutReality
{
  return objc_msgSend(a1, "isIOS") && !objc_msgSend(a1, "isReality");
}

+ (BOOL)isPhone
{
  if (isPhone_onceToken != -1)
    dispatch_once(&isPhone_onceToken, &__block_literal_global_8);
  return isPhone_isIPhone;
}

+ (BOOL)isHorseman
{
  if (isHorseman_onceToken != -1)
    dispatch_once(&isHorseman_onceToken, &__block_literal_global_11);
  return isHorseman_isHorseman;
}

+ (BOOL)isCommunal
{
  if (isCommunal_onceToken != -1)
    dispatch_once(&isCommunal_onceToken, &__block_literal_global_14);
  return isCommunal_isCommunal;
}

BOOL __27__SCDAUtilities_isCommunal__block_invoke()
{
  _BOOL8 result;

  result = +[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman");
  isCommunal_isCommunal = result;
  return result;
}

uint64_t __27__SCDAUtilities_isHorseman__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isHorseman_isHorseman = result;
  return result;
}

uint64_t __24__SCDAUtilities_isPhone__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isPhone_isIPhone = (_DWORD)result == 1;
  return result;
}

uint64_t __42__SCDAUtilities__hasPearlCameraCapability__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _hasPearlCameraCapability_hasPearlCameraCapability = result;
  return result;
}

@end

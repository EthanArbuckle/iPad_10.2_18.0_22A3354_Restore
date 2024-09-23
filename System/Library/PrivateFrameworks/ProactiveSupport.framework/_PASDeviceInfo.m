@implementation _PASDeviceInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_4);
  return isInternalBuild_isInternalBuild;
}

+ (BOOL)isAudioAccessory
{
  if (isAudioAccessory_onceToken != -1)
    dispatch_once(&isAudioAccessory_onceToken, &__block_literal_global_10);
  return isAudioAccessory_isAudioAccessory;
}

- (_PASDeviceInfo)init
{
  _PASDeviceInfo *v2;
  _PASDeviceInfo *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASDeviceInfo;
  v2 = -[_PASDeviceInfo init](&v6, sel_init);
  v3 = v2;
  if (v2
    && notify_register_check("com.apple.system.lowpowermode", &v2->_lowPowerModeToken)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed notify_register_check.", v5, 2u);
  }
  return v3;
}

- (void)dealloc
{
  int lowPowerModeToken;
  objc_super v4;

  lowPowerModeToken = self->_lowPowerModeToken;
  if (lowPowerModeToken)
    notify_cancel(lowPowerModeToken);
  v4.receiver = self;
  v4.super_class = (Class)_PASDeviceInfo;
  -[_PASDeviceInfo dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1915);
  return (id)sharedInstance___sharedInstance;
}

+ (BOOL)isLowEndHardware
{
  return 0;
}

+ (BOOL)isLowPowerModeEnabled
{
  int *v2;
  uint32_t state;
  uint8_t v5[16];

  objc_msgSend(a1, "sharedInstance");
  v2 = (int *)objc_claimAutoreleasedReturnValue();
  state = notify_get_state(v2[2], (uint64_t *)&isLowPowerModeEnabled_state);

  if (state && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed notify_get_state.", v5, 2u);
  }
  return isLowPowerModeEnabled_state == 1;
}

+ (BOOL)isDemoModeEnabled
{
  if (isDemoModeEnabled_onceToken != -1)
    dispatch_once(&isDemoModeEnabled_onceToken, &__block_literal_global_1);
  return isDemoModeEnabled_isDemoModeEnabled;
}

+ (BOOL)isBetaBuild
{
  if (isBetaBuild_onceToken != -1)
    dispatch_once(&isBetaBuild_onceToken, &__block_literal_global_5);
  return isBetaBuild_isBeta;
}

+ (BOOL)isiPad
{
  if (isiPad_onceToken != -1)
    dispatch_once(&isiPad_onceToken, &__block_literal_global_13);
  return isiPad_isiPad;
}

+ (BOOL)isFaceTimeSupported
{
  return MGGetBoolAnswer();
}

+ (BOOL)isDNUEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed");

  return v3;
}

+ (BOOL)shouldIncludePredictionLogs
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___PASDeviceInfo_shouldIncludePredictionLogs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldIncludePredictionLogs_onceToken != -1)
    dispatch_once(&shouldIncludePredictionLogs_onceToken, block);
  return shouldIncludePredictionLogs_isPredictionLoggingEnabled;
}

+ (id)internalDeviceCode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___PASDeviceInfo_internalDeviceCode__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internalDeviceCode_onceToken != -1)
    dispatch_once(&internalDeviceCode_onceToken, block);
  return (id)internalDeviceCode_deviceCode;
}

+ (id)deviceUUID
{
  if (deviceUUID_onceToken != -1)
    dispatch_once(&deviceUUID_onceToken, &__block_literal_global_21);
  return (id)deviceUUID_deviceUUID;
}

@end

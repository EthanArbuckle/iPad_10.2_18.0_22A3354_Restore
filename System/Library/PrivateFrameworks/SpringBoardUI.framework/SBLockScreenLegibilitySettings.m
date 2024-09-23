@implementation SBLockScreenLegibilitySettings

+ (id)defaultSettings
{
  if (defaultSettings_onceToken != -1)
    dispatch_once(&defaultSettings_onceToken, &__block_literal_global_3);
  return (id)defaultSettings___DefaultSettings;
}

void __49__SBLockScreenLegibilitySettings_defaultSettings__block_invoke()
{
  SBLockScreenLegibilitySettings *v0;
  void *v1;

  v0 = -[SBLockScreenLegibilitySettings initWithStyle:]([SBLockScreenLegibilitySettings alloc], "initWithStyle:", 2);
  v1 = (void *)defaultSettings___DefaultSettings;
  defaultSettings___DefaultSettings = (uint64_t)v0;

}

- (UIColor)backgroundColorHint
{
  return self->_backgroundColorHint;
}

- (void)setBackgroundColorHint:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorHint, a3);
}

- (BOOL)vibrancyDisabled
{
  return self->_vibrancyDisabled;
}

- (void)setVibrancyDisabled:(BOOL)a3
{
  self->_vibrancyDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorHint, 0);
}

@end

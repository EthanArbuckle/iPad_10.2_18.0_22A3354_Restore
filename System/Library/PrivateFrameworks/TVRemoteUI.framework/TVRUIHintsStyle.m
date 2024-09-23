@implementation TVRUIHintsStyle

+ (id)styleProviderForUserInterfaceIdiom:(int64_t)a3 hasHomeButton:(BOOL)a4
{
  __objc2_class *v5;
  TVRUIHintsStylePhone *v6;
  NSObject *v7;

  if (a3 == 1)
  {
    v5 = TVRUIHintsStylePad;
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = TVRUIHintsStylePhone;
LABEL_5:
    v6 = (TVRUIHintsStylePhone *)objc_msgSend([v5 alloc], "initWithHomeButton:", a4);
    return v6;
  }
  _TVRUIHintsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    +[TVRUIHintsStyle styleProviderForUserInterfaceIdiom:hasHomeButton:].cold.1(a3, v7);

  v6 = objc_alloc_init(TVRUIHintsStylePhone);
  return v6;
}

- (TVRUIHintsStyle)initWithHomeButton:(BOOL)a3
{
  TVRUIHintsStyle *v4;
  TVRUIHintsStyle *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRUIHintsStyle;
  v4 = -[TVRUIHintsStyle init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hasHomeButton = a3;
    v6 = SBSUIHardwareButtonHintViewsSupported();
    if (v6)
      LOBYTE(v6) = objc_msgSend(MEMORY[0x24BEB4088], "greymatterEnabled");
    v5->_supportsSBHints = v6;
  }
  return v5;
}

- (BOOL)shouldShowSiriHint
{
  return !-[TVRUIHintsStyle hasHomeButton](self, "hasHomeButton");
}

- (BOOL)shouldShowVolumeHint
{
  return 1;
}

- (double)maximumSymbolPointSize
{
  return 31.0;
}

- (double)animationPresentationDelay
{
  return 0.24;
}

- (double)animationDuration
{
  return 2.4;
}

- (double)activationAnimationDuration
{
  return 0.2;
}

- (double)activationAnimationDismissalDelay
{
  _BOOL4 v2;
  double result;

  v2 = -[TVRUIHintsStyle supportsSBHints](self, "supportsSBHints");
  result = 0.13;
  if (v2)
    return 0.25;
  return result;
}

- (id)siriHintTipContext
{
  return CFSTR("ATVRemoteSiriHint");
}

- (int64_t)userInterfaceStyle
{
  return 2;
}

- (double)preferredTipWidth
{
  return 310.0;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (BOOL)supportsSBHints
{
  return self->_supportsSBHints;
}

- (void)setSupportsSBHints:(BOOL)a3
{
  self->_supportsSBHints = a3;
}

+ (void)styleProviderForUserInterfaceIdiom:(uint64_t)a1 hasHomeButton:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_21B042000, a2, OS_LOG_TYPE_FAULT, "Unsupported UIUserInterfaceIdiom (%ld) requested! Defaulting to Phone", (uint8_t *)&v2, 0xCu);
}

@end

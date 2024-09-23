@implementation UIKBRenderConfig

- (BOOL)lightKeyboard
{
  return self->_lightKeyboard;
}

+ (id)configForAppearance:(int64_t)a3 inputMode:(id)a4 traitEnvironment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v8, "identifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("emoji")),
          v12,
          v13))
    {
      objc_msgSend(a1, "defaultEmojiConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "defaultConfig");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  if (a3 == 13)
  {
    objc_msgSend(v9, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configForAnimatedBackgroundWithLightKeys:", objc_msgSend(v14, "userInterfaceStyle") != 2);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 12)
    {
      if (a3 == 9)
        objc_msgSend(a1, "lowQualityDarkConfig");
      else
        objc_msgSend(a1, "darkConfig");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v16 = (void *)v11;
      goto LABEL_16;
    }
    objc_msgSend(v9, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "clearConfigWithLightKeys:", objc_msgSend(v14, "userInterfaceStyle") == 1);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

LABEL_16:
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "insertionPointColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "buttonBarVisualProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v17);

    }
    else
    {
      objc_msgSend(v16, "buttonBarVisualProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:", 0);
    }

  }
  return v16;
}

- (_UIButtonBarButtonVisualProvider)buttonBarVisualProvider
{
  return self->_buttonBarVisualProvider;
}

+ (id)darkConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__UIKBRenderConfig_darkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ECF0 != -1)
    dispatch_once(&qword_1ECD7ECF0, block);
  return (id)qword_1ECD7ECE8;
}

+ (id)defaultConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__UIKBRenderConfig_defaultConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ECD0 != -1)
    dispatch_once(&qword_1ECD7ECD0, block);
  return (id)qword_1ECD7ECC8;
}

+ (int64_t)backdropStyleForStyle:(int64_t)a3 quality:(int64_t)a4
{
  if (a4 == 10 && a3 == 2030)
    return 2039;
  else
    return a3;
}

- (int64_t)backdropStyle
{
  uint64_t v3;
  int64_t v4;

  if (-[UIKBRenderConfig animatedBackground](self, "animatedBackground"))
  {
    v3 = 3904;
  }
  else if (-[UIKBRenderConfig emptyBackground](self, "emptyBackground"))
  {
    v3 = 3903;
  }
  else if (-[UIKBRenderConfig lightKeyboard](self, "lightKeyboard"))
  {
    if (self->_useEmojiStyles)
      v3 = 3902;
    else
      v3 = 3901;
  }
  else
  {
    v3 = 2030;
  }
  v4 = -[UIKBRenderConfig forceQuality](self, "forceQuality");
  if (!v4)
    v4 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
  return objc_msgSend((id)objc_opt_class(), "backdropStyleForStyle:quality:", v3, v4);
}

- (int64_t)forceQuality
{
  return self->_forceQuality;
}

- (BOOL)whiteText
{
  return !-[UIKBRenderConfig lightKeyboard](self, "lightKeyboard");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  int v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = -[UIKBRenderConfig lightKeyboard](self, "lightKeyboard");
    if (v6 != objc_msgSend(v5, "lightKeyboard"))
      goto LABEL_11;
    v7 = -[UIKBRenderConfig forceQuality](self, "forceQuality");
    if (v7 != objc_msgSend(v5, "forceQuality"))
      goto LABEL_11;
    -[UIKBRenderConfig blurRadius](self, "blurRadius");
    v9 = v8;
    objc_msgSend(v5, "blurRadius");
    if (v9 != v10)
      goto LABEL_11;
    -[UIKBRenderConfig blurSaturation](self, "blurSaturation");
    v12 = v11;
    objc_msgSend(v5, "blurSaturation");
    if (v12 != v13)
      goto LABEL_11;
    -[UIKBRenderConfig keycapOpacity](self, "keycapOpacity");
    v15 = v14;
    objc_msgSend(v5, "keycapOpacity");
    if (v15 == v16
      && (-[UIKBRenderConfig lightKeycapOpacity](self, "lightKeycapOpacity"),
          v18 = v17,
          objc_msgSend(v5, "lightKeycapOpacity"),
          v18 == v19)
      && self->_useEmojiStyles == v5[8]
      && (v20 = -[UIKBRenderConfig isFloating](self, "isFloating"), v20 == objc_msgSend(v5, "isFloating"))
      && self->_controlKeyBackgroundName == (NSString *)*((_QWORD *)v5 + 9))
    {
      v21 = self->_activatedKeyplaneSwitchControlKeyBackgroundName == (NSString *)*((_QWORD *)v5 + 10);
    }
    else
    {
LABEL_11:
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (double)lightKeycapOpacity
{
  return self->_lightKeycapOpacity;
}

- (double)blurSaturation
{
  return self->_blurSaturation;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)keycapOpacity
{
  return self->_keycapOpacity;
}

- (NSString)controlKeyBackgroundName
{
  return self->_controlKeyBackgroundName;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

uint64_t __30__UIKBRenderConfig_darkConfig__block_invoke(uint64_t a1)
{
  UIKBRenderConfig *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1ECD7ECE8;
  qword_1ECD7ECE8 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECD7ECE8, "setLightKeyboard:", 0);
  objc_msgSend((id)qword_1ECD7ECE8, "setBlurRadius:", 20.0);
  objc_msgSend((id)qword_1ECD7ECE8, "setBlurSaturation:", 0.5);
  objc_msgSend((id)qword_1ECD7ECE8, "setKeycapOpacity:", 1.0);
  objc_msgSend((id)qword_1ECD7ECE8, "setLightKeycapOpacity:", 1.0);
  objc_msgSend((id)qword_1ECD7ECE8, "setControlKeyBackgroundName:", CFSTR("UIKBColorKeyGrayKeyDarkBackground"));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "darkKeyboardProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(qword_1ECD7ECE8 + 88);
  *(_QWORD *)(qword_1ECD7ECE8 + 88) = v4;

  objc_msgSend((id)qword_1ECD7ECE8, "setIsFloating:", 0);
  return objc_msgSend((id)qword_1ECD7ECE8, "setActivatedKeyplaneSwitchControlKeyBackgroundName:", CFSTR("UIKBColorWhite_Alpha24"));
}

- (void)setControlKeyBackgroundName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

uint64_t __33__UIKBRenderConfig_defaultConfig__block_invoke(uint64_t a1)
{
  UIKBRenderConfig *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  __CFString **v7;

  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1ECD7ECC8;
  qword_1ECD7ECC8 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECD7ECC8, "setLightKeyboard:", 1);
  objc_msgSend((id)qword_1ECD7ECC8, "setBlurRadius:", 30.0);
  objc_msgSend((id)qword_1ECD7ECC8, "setBlurSaturation:", 0.9);
  objc_msgSend((id)qword_1ECD7ECC8, "setKeycapOpacity:", 0.96);
  objc_msgSend((id)qword_1ECD7ECC8, "setLightKeycapOpacity:", 1.0);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "lightKeyboardProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(qword_1ECD7ECC8 + 88);
  *(_QWORD *)(qword_1ECD7ECC8 + 88) = v4;

  objc_msgSend((id)qword_1ECD7ECC8, "setIsFloating:", 0);
  objc_msgSend((id)qword_1ECD7ECC8, "setActivatedKeyplaneSwitchControlKeyBackgroundName:", CFSTR("UIKBColor10KeyLightActiveKeyplaneSwitch"));
  v6 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
  v7 = UIKBColorGray_Percent55;
  if (v6 != 100)
    v7 = UIKBColorKeyGrayKeyLightBackgroundMedium;
  return objc_msgSend((id)qword_1ECD7ECC8, "setControlKeyBackgroundName:", *v7);
}

- (void)setLightKeycapOpacity:(double)a3
{
  self->_lightKeycapOpacity = a3;
}

- (void)setLightKeyboard:(BOOL)a3
{
  self->_lightKeyboard = a3;
}

- (void)setKeycapOpacity:(double)a3
{
  self->_keycapOpacity = a3;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void)setBlurSaturation:(double)a3
{
  self->_blurSaturation = a3;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (void)setActivatedKeyplaneSwitchControlKeyBackgroundName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

+ (Class)preferredVisualProviderClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBRenderConfig *v4;
  uint64_t v5;
  NSString *controlKeyBackgroundName;
  uint64_t v7;
  NSString *activatedKeyplaneSwitchControlKeyBackgroundName;
  uint64_t v9;
  _UIButtonBarButtonVisualProvider *buttonBarVisualProvider;

  v4 = -[UIKBRenderConfig init](+[UIKBRenderConfig allocWithZone:](UIKBRenderConfig, "allocWithZone:", a3), "init");
  v4->_lightKeyboard = self->_lightKeyboard;
  v4->_forceQuality = self->_forceQuality;
  v4->_blurRadius = self->_blurRadius;
  v4->_blurSaturation = self->_blurSaturation;
  v4->_keycapOpacity = self->_keycapOpacity;
  v4->_lightKeycapOpacity = self->_lightKeycapOpacity;
  v4->_useEmojiStyles = self->_useEmojiStyles;
  -[UIKBRenderConfig setIsFloating:](v4, "setIsFloating:", -[UIKBRenderConfig isFloating](self, "isFloating"));
  v5 = -[NSString copy](self->_controlKeyBackgroundName, "copy");
  controlKeyBackgroundName = v4->_controlKeyBackgroundName;
  v4->_controlKeyBackgroundName = (NSString *)v5;

  v7 = -[NSString copy](self->_activatedKeyplaneSwitchControlKeyBackgroundName, "copy");
  activatedKeyplaneSwitchControlKeyBackgroundName = v4->_activatedKeyplaneSwitchControlKeyBackgroundName;
  v4->_activatedKeyplaneSwitchControlKeyBackgroundName = (NSString *)v7;

  v9 = -[_UIButtonBarButtonVisualProvider copy](self->_buttonBarVisualProvider, "copy");
  buttonBarVisualProvider = v4->_buttonBarVisualProvider;
  v4->_buttonBarVisualProvider = (_UIButtonBarButtonVisualProvider *)v9;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UIKBRenderConfig;
  -[UIKBRenderConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKBRenderConfig lightKeyboard](self, "lightKeyboard"))
    v5 = CFSTR("light");
  else
    v5 = CFSTR("dark");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ keyboard; backdropStyle = %ld, floating = %d"),
    v4,
    v5,
    -[UIKBRenderConfig backdropStyle](self, "backdropStyle"),
    -[UIKBRenderConfig isFloating](self, "isFloating"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultEmojiConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__UIKBRenderConfig_defaultEmojiConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ECE0 != -1)
    dispatch_once(&qword_1ECD7ECE0, block);
  return (id)qword_1ECD7ECD8;
}

uint64_t __38__UIKBRenderConfig_defaultEmojiConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int64_t v5;
  __CFString **v6;

  objc_msgSend(*(id *)(a1 + 32), "defaultConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_1ECD7ECD8;
  qword_1ECD7ECD8 = v2;

  v4 = (void *)qword_1ECD7ECD8;
  *(_BYTE *)(qword_1ECD7ECD8 + 8) = 1;
  objc_msgSend(v4, "setActivatedKeyplaneSwitchControlKeyBackgroundName:", CFSTR("UIKBColorWhite"));
  v5 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
  v6 = UIKBColorGray_Percent37;
  if (v5 != 100)
    v6 = UIKBColorGray_Percent80;
  return objc_msgSend((id)qword_1ECD7ECD8, "setControlKeyBackgroundName:", *v6);
}

+ (id)clearConfigLightKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__UIKBRenderConfig_clearConfigLightKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ED00 != -1)
    dispatch_once(&qword_1ECD7ED00, block);
  return (id)qword_1ECD7ECF8;
}

void __40__UIKBRenderConfig_clearConfigLightKeys__block_invoke(uint64_t a1)
{
  UIKBRenderConfig *v2;
  void *v3;
  int64_t v4;
  __CFString **v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1ECD7ECF8;
  qword_1ECD7ECF8 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECD7ECF8, "setEmptyBackground:", 1);
  objc_msgSend((id)qword_1ECD7ECF8, "setAnimatedBackground:", 0);
  objc_msgSend((id)qword_1ECD7ECF8, "setLightKeyboard:", 1);
  objc_msgSend((id)qword_1ECD7ECF8, "setBlurRadius:", 0.0);
  objc_msgSend((id)qword_1ECD7ECF8, "setBlurSaturation:", 0.9);
  objc_msgSend((id)qword_1ECD7ECF8, "setKeycapOpacity:", 0.96);
  objc_msgSend((id)qword_1ECD7ECF8, "setLightKeycapOpacity:", 1.0);
  objc_msgSend((id)qword_1ECD7ECF8, "setIsFloating:", 0);
  objc_msgSend((id)qword_1ECD7ECF8, "setActivatedKeyplaneSwitchControlKeyBackgroundName:", CFSTR("UIKBColor10KeyLightActiveKeyplaneSwitch"));
  v4 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
  v5 = UIKBColorGray_Percent85;
  if (v4 != 100)
    v5 = UIKBColorKeyGrayKeyLightBackgroundMedium;
  objc_msgSend((id)qword_1ECD7ECF8, "setControlKeyBackgroundName:", *v5);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "lightKeyboardProvider");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(qword_1ECD7ECF8 + 88);
  *(_QWORD *)(qword_1ECD7ECF8 + 88) = v6;

}

+ (id)clearConfigDarkKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIKBRenderConfig_clearConfigDarkKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ED10 != -1)
    dispatch_once(&qword_1ECD7ED10, block);
  return (id)qword_1ECD7ED08;
}

void __39__UIKBRenderConfig_clearConfigDarkKeys__block_invoke(uint64_t a1)
{
  UIKBRenderConfig *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1ECD7ED08;
  qword_1ECD7ED08 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECD7ED08, "setEmptyBackground:", 1);
  objc_msgSend((id)qword_1ECD7ED08, "setLightKeyboard:", 0);
  objc_msgSend((id)qword_1ECD7ED08, "setAnimatedBackground:", 0);
  objc_msgSend((id)qword_1ECD7ED08, "setBlurRadius:", 0.0);
  objc_msgSend((id)qword_1ECD7ED08, "setBlurSaturation:", 0.5);
  objc_msgSend((id)qword_1ECD7ED08, "setKeycapOpacity:", 1.0);
  objc_msgSend((id)qword_1ECD7ED08, "setLightKeycapOpacity:", 1.0);
  objc_msgSend((id)qword_1ECD7ED08, "setIsFloating:", 0);
  objc_msgSend((id)qword_1ECD7ED08, "setControlKeyBackgroundName:", CFSTR("UIKBColorKeyGrayKeyDarkBackground"));
  objc_msgSend((id)qword_1ECD7ED08, "setActivatedKeyplaneSwitchControlKeyBackgroundName:", CFSTR("UIKBColorWhite_Alpha24"));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "darkKeyboardProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(qword_1ECD7ED08 + 88);
  *(_QWORD *)(qword_1ECD7ED08 + 88) = v4;

}

+ (id)clearConfigWithLightKeys:(BOOL)a3
{
  if (a3)
    +[UIKBRenderConfig clearConfigLightKeys](UIKBRenderConfig, "clearConfigLightKeys");
  else
    +[UIKBRenderConfig clearConfigDarkKeys](UIKBRenderConfig, "clearConfigDarkKeys");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)animatedConfigLight
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIKBRenderConfig_animatedConfigLight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ED20 != -1)
    dispatch_once(&qword_1ECD7ED20, block);
  return (id)qword_1ECD7ED18;
}

uint64_t __39__UIKBRenderConfig_animatedConfigLight__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "clearConfigLightKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_1ECD7ED18;
  qword_1ECD7ED18 = v2;

  objc_msgSend((id)qword_1ECD7ED18, "setLightKeyboard:", 1);
  objc_msgSend((id)qword_1ECD7ED18, "setEmptyBackground:", 0);
  objc_msgSend((id)qword_1ECD7ED18, "setAnimatedBackground:", 1);
  objc_msgSend((id)qword_1ECD7ED18, "setKeycapOpacity:", 0.85);
  objc_msgSend((id)qword_1ECD7ED18, "setLightKeycapOpacity:", 0.85);
  return objc_msgSend((id)qword_1ECD7ED18, "setControlKeyBackgroundName:", CFSTR("UIKBColorWhite_Alpha75"));
}

+ (id)animatedConfigDark
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__UIKBRenderConfig_animatedConfigDark__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ED30 != -1)
    dispatch_once(&qword_1ECD7ED30, block);
  return (id)qword_1ECD7ED28;
}

uint64_t __38__UIKBRenderConfig_animatedConfigDark__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "clearConfigDarkKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_1ECD7ED28;
  qword_1ECD7ED28 = v2;

  objc_msgSend((id)qword_1ECD7ED28, "setLightKeyboard:", 0);
  objc_msgSend((id)qword_1ECD7ED28, "setEmptyBackground:", 0);
  objc_msgSend((id)qword_1ECD7ED28, "setAnimatedBackground:", 1);
  objc_msgSend((id)qword_1ECD7ED28, "setKeycapOpacity:", 0.85);
  objc_msgSend((id)qword_1ECD7ED28, "setLightKeycapOpacity:", 0.85);
  return objc_msgSend((id)qword_1ECD7ED28, "setControlKeyBackgroundName:", CFSTR("UIKBColorWhite_Alpha75"));
}

+ (id)configForAnimatedBackgroundWithLightKeys:(BOOL)a3
{
  if (a3)
    +[UIKBRenderConfig animatedConfigLight](UIKBRenderConfig, "animatedConfigLight");
  else
    +[UIKBRenderConfig animatedConfigDark](UIKBRenderConfig, "animatedConfigDark");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)lowQualityDarkConfig
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__UIKBRenderConfig_lowQualityDarkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7ED40 != -1)
    dispatch_once(&qword_1ECD7ED40, block);
  return (id)qword_1ECD7ED38;
}

uint64_t __40__UIKBRenderConfig_lowQualityDarkConfig__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "darkConfig");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_1ECD7ED38;
  qword_1ECD7ED38 = v2;

  return objc_msgSend((id)qword_1ECD7ED38, "setForceQuality:", 10);
}

- (int64_t)keyBackdropStyle
{
  if (-[UIKBRenderConfig animatedBackground](self, "animatedBackground"))
    return 3905;
  else
    return -[UIKBRenderConfig backdropStyle](self, "backdropStyle");
}

- (int64_t)blurEffectStyle
{
  int64_t v2;
  int64_t v3;

  v2 = -[UIKBRenderConfig backdropStyle](self, "backdropStyle");
  v3 = 1000;
  if (v2 == 3902)
    v3 = 502;
  if (v2 == 3901)
    return 501;
  else
    return v3;
}

- (void)setForceQuality:(int64_t)a3
{
  self->_forceQuality = a3;
}

- (NSString)activatedKeyplaneSwitchControlKeyBackgroundName
{
  return self->_activatedKeyplaneSwitchControlKeyBackgroundName;
}

- (BOOL)emptyBackground
{
  return self->_emptyBackground;
}

- (void)setEmptyBackground:(BOOL)a3
{
  self->_emptyBackground = a3;
}

- (BOOL)animatedBackground
{
  return self->_animatedBackground;
}

- (void)setAnimatedBackground:(BOOL)a3
{
  self->_animatedBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBarVisualProvider, 0);
  objc_storeStrong((id *)&self->_activatedKeyplaneSwitchControlKeyBackgroundName, 0);
  objc_storeStrong((id *)&self->_controlKeyBackgroundName, 0);
  objc_storeStrong((id *)&self->_customSymbolImages, 0);
}

- (void)overrideKeycapWithSymbol:(id)a3 forDisplayType:(int)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *customSymbolImages;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  customSymbolImages = self->_customSymbolImages;
  v11 = v6;
  if (v6)
  {
    if (!customSymbolImages)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_customSymbolImages;
      self->_customSymbolImages = v8;

      customSymbolImages = self->_customSymbolImages;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](customSymbolImages, "setObject:forKey:", v11, v10);
    goto LABEL_7;
  }
  if (customSymbolImages)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](customSymbolImages, "removeObjectForKey:", v10);
LABEL_7:

  }
}

- (id)imageNameForType:(int)a3
{
  void *customSymbolImages;
  void *v4;

  customSymbolImages = self->_customSymbolImages;
  if (customSymbolImages)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(customSymbolImages, "objectForKey:", v4);
    customSymbolImages = (void *)objc_claimAutoreleasedReturnValue();

  }
  return customSymbolImages;
}

@end

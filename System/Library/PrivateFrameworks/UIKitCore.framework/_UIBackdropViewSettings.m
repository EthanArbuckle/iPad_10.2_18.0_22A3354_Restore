@implementation _UIBackdropViewSettings

- (double)grayscaleTintAlpha
{
  return self->_grayscaleTintAlpha;
}

- (double)saturationDeltaFactor
{
  return self->_saturationDeltaFactor;
}

- (BOOL)lightenGrayscaleWithSourceOver
{
  return self->_lightenGrayscaleWithSourceOver;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)usesGrayscaleTintView
{
  return self->_usesGrayscaleTintView;
}

- (BOOL)usesDarkeningTintView
{
  return self->_usesDarkeningTintView;
}

- (BOOL)usesColorTintView
{
  return self->_usesColorTintView;
}

- (BOOL)usesColorBurnTintView
{
  return self->_usesColorBurnTintView;
}

- (double)grayscaleTintLevel
{
  return self->_grayscaleTintLevel;
}

- (double)zoom
{
  return self->_zoom;
}

- (NSValue)colorOffsetMatrix
{
  return self->_colorOffsetMatrix;
}

- (double)colorOffsetAlpha
{
  return self->_colorOffsetAlpha;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)usesContentView
{
  return self->_usesContentView;
}

- (BOOL)usesBackdropEffectView
{
  return self->_usesBackdropEffectView;
}

- (void)setBackdrop:(id)a3
{
  self->_backdrop = (_UIBackdropView *)a3;
}

+ (id)settingsForStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "settingsForStyle:graphicsQuality:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIBackdropViewSettings clearRunLoopObserver](self, "clearRunLoopObserver");
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettings;
  -[_UIBackdropViewSettings dealloc](&v3, sel_dealloc);
}

- (void)clearRunLoopObserver
{
  __CFRunLoopObserver *runLoopObserver;

  runLoopObserver = self->_runLoopObserver;
  if (runLoopObserver)
  {
    CFRunLoopObserverInvalidate(runLoopObserver);
    CFRelease(self->_runLoopObserver);
    self->_runLoopObserver = 0;
  }
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  -[_UIBackdropViewSettings setValuesFromModel:](self, "setValuesFromModel:", a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setValuesFromModel:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  id v7;
  int64_t suppressSettingsDidChange;
  int64_t v9;
  int64_t v10;
  BOOL v11;
  int64_t v12;
  void *v13;

  v4 = a3;
  if (self->_style)
  {
    v13 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = v13;
      v7 = v6;
      if (*((_QWORD *)v6 + 3))
      {
        suppressSettingsDidChange = self->_suppressSettingsDidChange;
        if (suppressSettingsDidChange >= 0)
          v9 = suppressSettingsDidChange + 1;
        else
          v9 = 1;
        self->_suppressSettingsDidChange = v9;
        self->_appliesTintAndBlurSettings = *((_BYTE *)v6 + 328);
        self->_backdropVisible = *((_BYTE *)v6 + 75);
        objc_storeStrong((id *)&self->_blurQuality, *((id *)v6 + 30));
        self->_blurRadius = *((double *)v7 + 29);
        objc_storeStrong((id *)&self->_colorTint, *((id *)v7 + 16));
        self->_colorTintAlpha = *((double *)v7 + 17);
        self->_colorTintMaskAlpha = *((double *)v7 + 18);
        objc_storeStrong((id *)&self->_colorTintMaskImage, *((id *)v7 + 19));
        self->_colorBurnTintLevel = *((double *)v7 + 20);
        self->_colorBurnTintAlpha = *((double *)v7 + 21);
        objc_storeStrong((id *)&self->_colorBurnTintMaskImage, *((id *)v7 + 22));
        self->_darkeningTintAlpha = *((double *)v7 + 23);
        self->_darkeningTintHue = *((double *)v7 + 24);
        self->_darkeningTintSaturation = *((double *)v7 + 25);
        self->_darkeningTintBrightness = *((double *)v7 + 26);
        objc_storeStrong((id *)&self->_darkeningTintMaskImage, *((id *)v7 + 27));
        self->_darkenWithSourceOver = *((_BYTE *)v7 + 224);
        self->_enabled = *((_BYTE *)v7 + 74);
        self->_explicitlySetGraphicsQuality = *((_BYTE *)v7 + 40);
        self->_filterMaskAlpha = *((double *)v7 + 32);
        objc_storeStrong((id *)&self->_filterMaskImage, *((id *)v7 + 33));
        self->_graphicsQuality = *((_QWORD *)v7 + 4);
        self->_grayscaleTintAlpha = *((double *)v7 + 12);
        self->_grayscaleTintLevel = *((double *)v7 + 11);
        self->_grayscaleTintMaskAlpha = *((double *)v7 + 13);
        objc_storeStrong((id *)&self->_grayscaleTintMaskImage, *((id *)v7 + 14));
        self->_lightenGrayscaleWithSourceOver = *((_BYTE *)v7 + 120);
        self->_highlighted = *((_BYTE *)v7 + 72);
        objc_storeStrong((id *)&self->_legibleColor, *((id *)v7 + 34));
        self->_renderingHint = *((_QWORD *)v7 + 7);
        self->_requiresColorStatistics = *((_BYTE *)v7 + 41);
        self->_saturationDeltaFactor = *((double *)v7 + 31);
        self->_scale = *((double *)v7 + 36);
        self->_selected = *((_BYTE *)v7 + 73);
        self->_stackingLevel = *((_QWORD *)v7 + 8);
        self->_statisticsInterval = *((double *)v7 + 37);
        self->_style = *((_QWORD *)v7 + 3);
        self->_usesBackdropEffectView = *((_BYTE *)v7 + 304);
        self->_usesColorTintView = *((_BYTE *)v7 + 306);
        self->_usesColorOffset = *((_BYTE *)v7 + 310);
        self->_usesContentView = *((_BYTE *)v7 + 308);
        self->_usesGrayscaleTintView = *((_BYTE *)v7 + 305);
        self->_version = *((_QWORD *)v7 + 45);
        self->_zoom = *((double *)v7 + 10);
        self->_shouldDoRasterizationAndAlphaHack = *((_BYTE *)v7 + 76);
        -[_UIBackdropColorSettings setValuesFromModel:](self->_colorSettings, "setValuesFromModel:", *((_QWORD *)v7 + 6));
        v10 = self->_suppressSettingsDidChange;
        v11 = v10 <= 1;
        v12 = v10 - 1;
        if (v11)
          v12 = 0;
        self->_suppressSettingsDidChange = v12;
        -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
      }

      v4 = v13;
    }
  }

}

- (void)scheduleSettingsDidChangeIfNeeded
{
  __CFRunLoop *Current;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_runLoopObserver && self->_suppressSettingsDidChange <= 0)
  {
    if (self->_backdrop)
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __60___UIBackdropViewSettings_scheduleSettingsDidChangeIfNeeded__block_invoke;
      v4[3] = &unk_1E16B4F18;
      objc_copyWeak(&v5, &location);
      self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v4);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(Current, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (int64_t)graphicsQuality
{
  return self->_graphicsQuality;
}

- (void)setLegibleColor:(id)a3
{
  objc_storeStrong((id *)&self->_legibleColor, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setGrayscaleTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setGrayscaleTintMaskAlpha:(double)a3
{
  self->_grayscaleTintMaskAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setFilterMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_filterMaskImage, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setFilterMaskAlpha:(double)a3
{
  self->_filterMaskAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorTint:(id)a3
{
  objc_storeStrong((id *)&self->_colorTint, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setGrayscaleTintLevel:(double)a3
{
  self->_grayscaleTintLevel = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setGrayscaleTintAlpha:(double)a3
{
  self->_grayscaleTintAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (BOOL)isBackdropVisible
{
  return self->_backdropVisible;
}

- (void)setUsesColorTintView:(BOOL)a3
{
  self->_usesColorTintView = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setSaturationDeltaFactor:(double)a3
{
  self->_saturationDeltaFactor = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setRequiresColorStatistics:(BOOL)a3
{
  self->_requiresColorStatistics = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintMaskImage, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorTintMaskAlpha:(double)a3
{
  self->_colorTintMaskAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorTintAlpha:(double)a3
{
  self->_colorTintAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setBackdropVisible:(BOOL)a3
{
  self->_backdropVisible = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (_UIBackdropViewSettings)initWithDefaultValues
{
  return -[_UIBackdropViewSettings initWithDefaultValuesForGraphicsQuality:](self, "initWithDefaultValuesForGraphicsQuality:", 0);
}

- (UIImage)grayscaleTintMaskImage
{
  return self->_grayscaleTintMaskImage;
}

- (UIImage)filterMaskImage
{
  return self->_filterMaskImage;
}

- (UIImage)colorTintMaskImage
{
  return self->_colorTintMaskImage;
}

- (double)colorTintAlpha
{
  return self->_colorTintAlpha;
}

- (BOOL)requiresColorStatistics
{
  return self->_requiresColorStatistics;
}

- (_UIBackdropColorSettings)colorSettings
{
  return self->_colorSettings;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setColorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_colorSettings, a3);
}

- (void)setLightenGrayscaleWithSourceOver:(BOOL)a3
{
  self->_lightenGrayscaleWithSourceOver = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkeningTintSaturation:(double)a3
{
  self->_darkeningTintSaturation = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkeningTintHue:(double)a3
{
  self->_darkeningTintHue = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkeningTintBrightness:(double)a3
{
  self->_darkeningTintBrightness = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkeningTintAlpha:(double)a3
{
  self->_darkeningTintAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkenWithSourceOver:(BOOL)a3
{
  self->_darkenWithSourceOver = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (UIColor)legibleColor
{
  return self->_legibleColor;
}

- (double)grayscaleTintMaskAlpha
{
  return self->_grayscaleTintMaskAlpha;
}

- (double)filterMaskAlpha
{
  return self->_filterMaskAlpha;
}

- (double)darkeningTintSaturation
{
  return self->_darkeningTintSaturation;
}

- (double)darkeningTintHue
{
  return self->_darkeningTintHue;
}

- (double)darkeningTintBrightness
{
  return self->_darkeningTintBrightness;
}

- (double)darkeningTintAlpha
{
  return self->_darkeningTintAlpha;
}

- (BOOL)darkenWithSourceOver
{
  return self->_darkenWithSourceOver;
}

- (UIColor)colorTint
{
  return self->_colorTint;
}

- (double)colorBurnTintAlpha
{
  return self->_colorBurnTintAlpha;
}

+ (id)settingsForStyle:(int64_t)a3 graphicsQuality:(int64_t)a4
{
  __objc2_class *v5;
  __objc2_class *v6;
  uint64_t v7;
  _UIBackdropViewSettingsColored *v8;
  UIColor *v9;
  _UIBackdropViewSettingsColored *v10;
  UIColor *v12;

  if (a3 <= 3999)
  {
    if (a3 <= 2028)
    {
      if (a3 <= 1000)
      {
        switch(a3)
        {
          case -4:
            v6 = _UIBackdropViewSettingsReplicator;
            break;
          case -3:
            v6 = _UIBackdropViewSettingsCombiner;
            break;
          case -2:
            v6 = _UIBackdropViewSettingsNone;
            break;
          case -1:
            goto LABEL_95;
          case 0:
            goto LABEL_81;
          case 1:
            goto LABEL_53;
          case 2:
            v6 = _UIBackdropViewSettingsBlur;
            break;
          default:
            if (a3 == 1000)
              goto LABEL_81;
            goto LABEL_95;
        }
        goto LABEL_82;
      }
      if (a3 > 1999)
      {
        if (a3 == 2000)
        {
          v6 = _UIBackdropViewSettingsColorSample;
          goto LABEL_82;
        }
        if (a3 == 2010)
          goto LABEL_49;
        if (a3 != 2020)
          goto LABEL_95;
      }
      else
      {
        if (a3 == 1001)
          goto LABEL_53;
        if (a3 != 1003)
        {
          if (a3 != 1100)
            goto LABEL_95;
          goto LABEL_53;
        }
      }
      goto LABEL_81;
    }
    if (a3 <= 2059)
    {
      switch(a3)
      {
        case 2029:
          v6 = _UIBackdropViewSettingsLightLow;
          break;
        case 2030:
          goto LABEL_53;
        case 2031:
          v6 = _UIBackdropViewSettingsDarkWithZoom;
          break;
        case 2032:
          v6 = _UIBackdropViewSettingsUltraDarkWithZoom;
          break;
        case 2033:
        case 2034:
        case 2035:
        case 2036:
        case 2037:
        case 2038:
          goto LABEL_95;
        case 2039:
          v6 = _UIBackdropViewSettingsDarkLow;
          break;
        case 2040:
          v6 = _UIBackdropViewSettingsColored;
          break;
        default:
          if (a3 == 2050)
            goto LABEL_74;
          goto LABEL_95;
      }
      goto LABEL_82;
    }
    if (a3 <= 2079)
    {
      switch(a3)
      {
        case 2060:
          v6 = _UIBackdropViewSettingsAdaptiveLight;
          goto LABEL_82;
        case 2070:
          v6 = _UIBackdropViewSettingsSemiLight;
          goto LABEL_82;
        case 2071:
          v6 = _UIBackdropViewSettingsFlatSemiLight;
          goto LABEL_82;
      }
    }
    else if (a3 > 3900)
    {
      if (a3 == 3901)
      {
        v6 = _UIBackdropViewSettingsLightKeyboard;
        goto LABEL_82;
      }
      if (a3 == 3902)
      {
        v6 = _UIBackdropViewSettingsLightEmojiKeyboard;
        goto LABEL_82;
      }
    }
    else
    {
      if (a3 == 2080)
      {
        v6 = _UIBackdropViewSettingsUltraColored;
        goto LABEL_82;
      }
      if (a3 == 3900)
      {
        v6 = _UIBackdropViewSettingsPasscodePaddle;
        goto LABEL_82;
      }
    }
    goto LABEL_95;
  }
  if (a3 <= 10049)
  {
    switch(a3)
    {
      case 4000:
        v5 = _UIBackdropViewSettingsATVSemiLight;
        break;
      case 4001:
        v5 = _UIBackdropViewSettingsATVMediumLight;
        break;
      case 4002:
        v5 = _UIBackdropViewSettingsATVLight;
        break;
      case 4003:
        v5 = _UIBackdropViewSettingsATVUltraLight;
        break;
      case 4004:
        v5 = _UIBackdropViewSettingsATVMenuLight;
        break;
      case 4005:
        v5 = _UIBackdropViewSettingsATVSemiDark;
        break;
      case 4006:
        v5 = _UIBackdropViewSettingsATVMediumDark;
        break;
      case 4007:
        v5 = _UIBackdropViewSettingsATVDark;
        break;
      case 4008:
        v5 = _UIBackdropViewSettingsATVUltraDark;
        break;
      case 4009:
        v5 = _UIBackdropViewSettingsATVMenuDark;
        break;
      case 4010:
        v5 = _UIBackdropViewSettingsATVAdaptive;
        break;
      case 4011:
        v5 = _UIBackdropViewSettingsATVAdaptiveLighten;
        break;
      case 4012:
        v5 = _UIBackdropViewSettingsATVAccessoryLight;
        break;
      case 4013:
        v5 = _UIBackdropViewSettingsATVAccessoryDark;
        break;
      case 4014:
        v5 = _UIBackdropViewSettingsATVTabBarLight;
        break;
      case 4015:
        v5 = _UIBackdropViewSettingsATVTabBarDark;
        break;
      default:
        goto LABEL_95;
    }
    v10 = (_UIBackdropViewSettingsColored *)objc_alloc_init(v5);
    goto LABEL_83;
  }
  if (a3 <= 10091)
  {
    if (a3 <= 10079)
    {
      if (a3 != 10050 && a3 != 10060)
      {
        v7 = 10070;
        goto LABEL_35;
      }
LABEL_49:
      v6 = _UIBackdropViewSettingsUltraLight;
      goto LABEL_82;
    }
    switch(a3)
    {
      case 10080:
        goto LABEL_49;
      case 10090:
        goto LABEL_81;
      case 10091:
        v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
        _UIBackdropViewSettingsColorAcceptGreen();
        v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
        goto LABEL_90;
    }
LABEL_95:
    NSLog(CFSTR("*** warning: using _UIBackdropView with an unsupported style constant: %d. This is probably not what you want."), a2, a3);
    v6 = +[_UIBackdropView defaultSettingsClass](_UIBackdropView, "defaultSettingsClass");
    goto LABEL_82;
  }
  if (a3 <= 10119)
  {
    if (a3 == 10092)
    {
      v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
      _UIBackdropViewSettingsColorCancelRed();
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      goto LABEL_90;
    }
    if (a3 != 10100)
    {
      v7 = 10110;
LABEL_35:
      if (a3 != v7)
        goto LABEL_95;
      goto LABEL_49;
    }
LABEL_81:
    v6 = _UIBackdropViewSettingsLight;
    goto LABEL_82;
  }
  if (a3 <= 11059)
  {
    if (a3 != 10120)
    {
      if (a3 != 11050)
        goto LABEL_95;
      goto LABEL_53;
    }
    v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
    v9 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.031372549, 0.262745098, 0.560784314, 1.0);
LABEL_90:
    v12 = v9;
    -[_UIBackdropViewSettings setColorTint:](v8, "setColorTint:", v9);

    return v8;
  }
  if (a3 == 11060)
  {
LABEL_53:
    v6 = _UIBackdropViewSettingsDark;
    goto LABEL_82;
  }
  if (a3 != 11070)
    goto LABEL_95;
LABEL_74:
  v6 = _UIBackdropViewSettingsUltraDark;
LABEL_82:
  v10 = (_UIBackdropViewSettingsColored *)objc_msgSend([v6 alloc], "initWithDefaultValuesForGraphicsQuality:", a4);
LABEL_83:
  v8 = v10;
  return v8;
}

- (_UIBackdropViewSettings)initWithDefaultValuesForGraphicsQuality:(int64_t)a3
{
  _UIBackdropViewSettings *v4;
  _UIBackdropViewSettings *v5;
  uint64_t suppressSettingsDidChange;
  uint64_t v7;
  void *v8;
  _UIBackdropColorSettings *v9;
  _UIBackdropColorSettings *colorSettings;
  uint64_t v11;
  BOOL v12;
  int64_t v13;
  _UIBackdropViewSettings *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIBackdropViewSettings;
  v4 = -[_UIBackdropViewSettings init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    suppressSettingsDidChange = v4->_suppressSettingsDidChange;
    if (suppressSettingsDidChange >= 0)
      v7 = suppressSettingsDidChange + 1;
    else
      v7 = 1;
    v4->_suppressSettingsDidChange = v7;
    if (a3)
    {
      v4->_explicitlySetGraphicsQuality = 1;
    }
    else if (_AXSEnhanceBackgroundContrastEnabled())
    {
      a3 = 10;
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v8, "_graphicsQuality");

    }
    v5->_graphicsQuality = a3;
    -[_UIBackdropViewSettings setDefaultValues](v5, "setDefaultValues");
    v9 = objc_alloc_init(_UIBackdropColorSettings);
    colorSettings = v5->_colorSettings;
    v5->_colorSettings = v9;

    -[_UIBackdropColorSettings setParentSettings:](v5->_colorSettings, "setParentSettings:", v5);
    v11 = v5->_suppressSettingsDidChange;
    v12 = v11 <= 1;
    v13 = v11 - 1;
    if (v12)
      v13 = 0;
    v5->_suppressSettingsDidChange = v13;
    v14 = v5;
  }

  return v5;
}

- (void)setDefaultValues
{
  int64_t suppressSettingsDidChange;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t graphicsQuality;
  double v16;
  double v17;
  UIImage *grayscaleTintMaskImage;
  UIColor *colorTint;
  UIImage *colorTintMaskImage;
  UIImage *darkeningTintMaskImage;
  NSString *blurQuality;
  UIImage *filterMaskImage;
  UIColor *v29;
  UIColor *legibleColor;
  int64_t v31;
  BOOL v32;
  int64_t v33;

  suppressSettingsDidChange = self->_suppressSettingsDidChange;
  if (suppressSettingsDidChange >= 0)
    v4 = suppressSettingsDidChange + 1;
  else
    v4 = 1;
  self->_suppressSettingsDidChange = v4;
  self->_version = 1;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = ceil(v7 * 0.5);
  v9 = v8 + v8;
  if (v7 > 1.0)
    v7 = v9;
  v10 = (objc_class *)objc_opt_class();
  if (qword_1ECD7B098 != -1)
    dispatch_once(&qword_1ECD7B098, &__block_literal_global_481);
  v11 = (void *)qword_1ECD7B0A0;
  NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = (int)objc_msgSend(v13, "intValue");
  else
    v14 = 0;

  self->_style = v14;
  *(_WORD *)&self->_usesBackdropEffectView = 257;
  self->_usesColorTintView = 1;
  *(_WORD *)&self->_usesContentView = 1;
  self->_usesColorOffset = 0;
  *(_DWORD *)&self->_highlighted = 16842752;
  graphicsQuality = self->_graphicsQuality;
  if (graphicsQuality == 100)
  {
    v16 = 0.25;
    v17 = 2.0;
  }
  else
  {
    if (graphicsQuality != 10)
      goto LABEL_16;
    self->_usesBackdropEffectView = 0;
    v16 = 1.0;
    v17 = 4.0;
  }
  self->_scale = 1.0 / (v7 * v17);
  self->_statisticsInterval = v16;
LABEL_16:
  self->_requiresColorStatistics = 0;
  self->_appliesTintAndBlurSettings = 1;
  self->_stackingLevel = 0;
  self->_grayscaleTintLevel = 0.0;
  self->_grayscaleTintAlpha = 0.0;
  grayscaleTintMaskImage = self->_grayscaleTintMaskImage;
  self->_grayscaleTintMaskAlpha = 1.0;
  self->_grayscaleTintMaskImage = 0;

  colorTint = self->_colorTint;
  self->_colorTint = 0;

  *(_OWORD *)&self->_colorTintAlpha = xmmword_18666F250;
  colorTintMaskImage = self->_colorTintMaskImage;
  self->_colorTintMaskImage = 0;

  *(_OWORD *)&self->_darkeningTintAlpha = xmmword_186678D60;
  *(_OWORD *)&self->_darkeningTintSaturation = xmmword_186678D70;
  darkeningTintMaskImage = self->_darkeningTintMaskImage;
  self->_darkeningTintMaskImage = 0;

  blurQuality = self->_blurQuality;
  self->_blurRadius = 0.0;
  self->_blurQuality = (NSString *)CFSTR("default");

  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->_saturationDeltaFactor = _Q0;
  filterMaskImage = self->_filterMaskImage;
  self->_filterMaskImage = 0;

  +[UIColor whiteColor](UIColor, "whiteColor");
  v29 = (UIColor *)objc_claimAutoreleasedReturnValue();
  legibleColor = self->_legibleColor;
  self->_legibleColor = v29;

  v31 = self->_suppressSettingsDidChange;
  v32 = v31 <= 1;
  v33 = v31 - 1;
  if (v32)
    v33 = 0;
  self->_suppressSettingsDidChange = v33;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorOffsetMatrix, 0);
  objc_storeStrong((id *)&self->_combinedTintColor, 0);
  objc_storeStrong((id *)&self->_legibleColor, 0);
  objc_storeStrong((id *)&self->_filterMaskImage, 0);
  objc_storeStrong((id *)&self->_blurQuality, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTint, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorSettings, 0);
}

+ (id)settingsPreservingHintsFromSettings:(id)a3 graphicsQuality:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[_UIBackdropViewSettings settingsForStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForStyle:graphicsQuality:", objc_msgSend(v5, "style"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRenderingHint:", objc_msgSend(v5, "renderingHint"));
  objc_msgSend(v6, "setStackingLevel:", objc_msgSend(v5, "stackingLevel"));
  objc_msgSend(v6, "copyAdditionalSettingsFromSettings:", v5);

  return v6;
}

- (int64_t)stackingLevel
{
  return self->_stackingLevel;
}

- (void)setStackingLevel:(int64_t)a3
{
  self->_stackingLevel = a3;
}

- (void)setRenderingHint:(int64_t)a3
{
  self->_renderingHint = a3;
  if (a3 == 1)
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:");
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (int64_t)renderingHint
{
  return self->_renderingHint;
}

- (void)restoreDefaultValues
{
  -[_UIBackdropViewSettings setDefaultValues](self, "setDefaultValues");
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

+ (id)darkeningTintColor
{
  if (qword_1ECD7B088 != -1)
    dispatch_once(&qword_1ECD7B088, &__block_literal_global_49);
  return (id)qword_1ECD7B090;
}

- (void)setAppliesTintAndBlurSettings:(BOOL)a3
{
  self->_appliesTintAndBlurSettings = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setBlurHardEdges:(int64_t)a3
{
  self->_blurHardEdges = a3;
}

- (void)setBlurQuality:(id)a3
{
  NSString *v4;
  NSString *blurQuality;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  blurQuality = self->_blurQuality;
  self->_blurQuality = v4;

  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setBlursWithHardEdges:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 15;
  else
    v3 = 0;
  -[_UIBackdropViewSettings setBlurHardEdges:](self, "setBlurHardEdges:", v3);
}

- (void)setColorBurnTintLevel:(double)a3
{
  self->_colorBurnTintLevel = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorBurnTintAlpha:(double)a3
{
  self->_colorBurnTintAlpha = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setColorBurnTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setDarkeningTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, a3);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setGraphicsQuality:(int64_t)a3
{
  self->_graphicsQuality = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  if (a3)
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (a3)
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:", 1);
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setStackinglevel:(int64_t)a3
{
  self->_stackingLevel = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setStatisticsInterval:(double)a3
{
  self->_statisticsInterval = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setUsesBackdropEffectView:(BOOL)a3
{
  self->_usesBackdropEffectView = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setUsesColorBurnTintView:(BOOL)a3
{
  self->_usesColorBurnTintView = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setUsesColorOffset:(BOOL)a3
{
  self->_usesColorOffset = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setUsesContentView:(BOOL)a3
{
  self->_usesContentView = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setUsesGrayscaleTintView:(BOOL)a3
{
  self->_usesGrayscaleTintView = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (BOOL)zoomsBack
{
  return self->_zoom > 0.0;
}

- (void)setZoomsBack:(BOOL)a3
{
  double v3;

  v3 = 0.05;
  if (a3)
    v3 = 0.0;
  -[_UIBackdropViewSettings setZoom:](self, "setZoom:", v3);
}

- (void)setZoom:(double)a3
{
  self->_zoom = a3;
  -[_UIBackdropViewSettings scheduleSettingsDidChangeIfNeeded](self, "scheduleSettingsDidChangeIfNeeded");
}

- (BOOL)blursWithHardEdges
{
  return self->_blurHardEdges == 15;
}

- (UIColor)combinedTintColor
{
  double grayscaleTintLevel;
  double grayscaleTintAlpha;
  UIColor *v4;
  UIColor *v5;
  double v6;
  double v7;
  void *v8;
  double v10;
  double v11;
  double v12;
  double v13;

  grayscaleTintLevel = self->_grayscaleTintLevel;
  grayscaleTintAlpha = self->_grayscaleTintAlpha;
  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v4 = self->_colorTint;
  v5 = v4;
  if (v4)
  {
    -[UIColor getRed:green:blue:alpha:](v4, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
    v6 = v10;
  }
  else
  {
    v6 = 0.0;
  }
  v7 = 1.0 - (1.0 - grayscaleTintAlpha) * (1.0 - v6);
  if (v7 >= 0.00000011920929)
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v13 / v7, grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v12 / v7, grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v11 / v7);
  else
    +[UIColor clearColor](UIColor, "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v8;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ : %p>\n"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("    graphicsQuality:        %ld\n"), -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality"));
  v4 = -[_UIBackdropViewSettings isBackdropVisible](self, "isBackdropVisible");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("    backdrop visible:       %@\n"), v5);
  -[_UIBackdropViewSettings grayscaleTintLevel](self, "grayscaleTintLevel");
  objc_msgSend(v3, "appendFormat:", CFSTR("    grayscaleTintLevel:     %.2f\n"), v6);
  -[_UIBackdropViewSettings grayscaleTintAlpha](self, "grayscaleTintAlpha");
  objc_msgSend(v3, "appendFormat:", CFSTR("    grayscaleTintAlpha:     %.2f\n"), v7);
  -[_UIBackdropViewSettings grayscaleTintMaskImage](self, "grayscaleTintMaskImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    grayscaleTintMaskImage: %@\n"), v8);

  -[_UIBackdropViewSettings grayscaleTintMaskAlpha](self, "grayscaleTintMaskAlpha");
  objc_msgSend(v3, "appendFormat:", CFSTR("    grayscaleTintMaskAlpha: %.2f\n"), v9);
  -[_UIBackdropViewSettings colorTint](self, "colorTint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    colorTint:              %@\n"), v10);

  -[_UIBackdropViewSettings colorTintAlpha](self, "colorTintAlpha");
  objc_msgSend(v3, "appendFormat:", CFSTR("    colorTintAlpha:         %.2f\n"), v11);
  -[_UIBackdropViewSettings colorTintMaskImage](self, "colorTintMaskImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    colorTintMaskImage:     %@\n"), v12);

  -[_UIBackdropViewSettings colorTintMaskAlpha](self, "colorTintMaskAlpha");
  objc_msgSend(v3, "appendFormat:", CFSTR("    colorTintMaskAlpha:     %.2f\n"), v13);
  -[_UIBackdropViewSettings blurRadius](self, "blurRadius");
  objc_msgSend(v3, "appendFormat:", CFSTR("    blurRadius:             %.2f\n"), v14);
  -[_UIBackdropViewSettings saturationDeltaFactor](self, "saturationDeltaFactor");
  objc_msgSend(v3, "appendFormat:", CFSTR("    saturationDeltaFactor:  %.2f\n"), v15);
  -[_UIBackdropViewSettings filterMaskImage](self, "filterMaskImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    filterMaskImage:        %@\n"), v16);

  -[_UIBackdropViewSettings filterMaskAlpha](self, "filterMaskAlpha");
  objc_msgSend(v3, "appendFormat:", CFSTR("    filterMaskAlpha:        %.2f\n"), v17);
  -[_UIBackdropViewSettings combinedTintColor](self, "combinedTintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    combinedTintColor:      %@\n"), v18);

  return v3;
}

- (_UIBackdropView)backdrop
{
  return self->_backdrop;
}

- (BOOL)explicitlySetGraphicsQuality
{
  return self->_explicitlySetGraphicsQuality;
}

- (void)setExplicitlySetGraphicsQuality:(BOOL)a3
{
  self->_explicitlySetGraphicsQuality = a3;
}

- (double)colorTintMaskAlpha
{
  return self->_colorTintMaskAlpha;
}

- (double)colorBurnTintLevel
{
  return self->_colorBurnTintLevel;
}

- (UIImage)colorBurnTintMaskImage
{
  return self->_colorBurnTintMaskImage;
}

- (UIImage)darkeningTintMaskImage
{
  return self->_darkeningTintMaskImage;
}

- (NSString)blurQuality
{
  return self->_blurQuality;
}

- (int64_t)blurHardEdges
{
  return self->_blurHardEdges;
}

- (double)statisticsInterval
{
  return self->_statisticsInterval;
}

- (int64_t)suppressSettingsDidChange
{
  return self->_suppressSettingsDidChange;
}

- (void)setSuppressSettingsDidChange:(int64_t)a3
{
  self->_suppressSettingsDidChange = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)designMode
{
  return self->_designMode;
}

- (void)setDesignMode:(BOOL)a3
{
  self->_designMode = a3;
}

- (void)setUsesDarkeningTintView:(BOOL)a3
{
  self->_usesDarkeningTintView = a3;
}

- (BOOL)usesColorOffset
{
  return self->_usesColorOffset;
}

- (void)setColorOffsetAlpha:(double)a3
{
  self->_colorOffsetAlpha = a3;
}

- (void)setColorOffsetMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_colorOffsetMatrix, a3);
}

- (BOOL)appliesTintAndBlurSettings
{
  return self->_appliesTintAndBlurSettings;
}

@end

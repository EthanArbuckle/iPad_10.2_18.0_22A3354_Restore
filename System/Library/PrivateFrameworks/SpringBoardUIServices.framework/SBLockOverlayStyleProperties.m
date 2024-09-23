@implementation SBLockOverlayStyleProperties

- (SBLockOverlayStyleProperties)initWithStyle:(unint64_t)a3 quality:(int64_t)a4
{
  SBLockOverlayStyleProperties *v6;
  SBLockOverlayStyleProperties *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBLockOverlayStyleProperties;
  v6 = -[SBLockOverlayStyleProperties init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    v6->_quality = a4;
    -[SBLockOverlayStyleProperties _configure](v6, "_configure");
  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SBLockOverlayStyleProperties _stringForStyle](self, "_stringForStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockOverlayStyleProperties _stringForQuality](self, "_stringForQuality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>             style: %@,             quality: %@,             tintColor: %@,             tintAlpha: %f,             blurRadius: %f             settings: %@"), v4, self, v5, v6, self->_tintColor, *(_QWORD *)&self->_tintAlpha, *(_QWORD *)&self->_blurRadius, self->_settings);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_configure
{
  _UIBackdropViewSettings *v3;
  _UIBackdropViewSettings *settings;
  void *v5;
  double v6;
  void *v7;
  UIColor *v8;
  UIColor *tintColor;
  double v10;

  -[SBLockOverlayStyleProperties _settingsForStyle](self, "_settingsForStyle");
  v3 = (_UIBackdropViewSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v3;

  -[_UIBackdropViewSettings combinedTintColor](self->_settings, "combinedTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alphaComponent");
  self->_tintAlpha = v6;

  -[_UIBackdropViewSettings combinedTintColor](self->_settings, "combinedTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 1.0);
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  self->_tintColor = v8;

  -[_UIBackdropViewSettings blurRadius](self->_settings, "blurRadius");
  self->_blurRadius = v10;
}

- (id)_settingsForStyle
{
  int64_t quality;
  void *v3;
  uint64_t v4;
  id v5;
  __objc2_class *v6;

  switch(self->_style)
  {
    case 0uLL:
      quality = self->_quality;
      v3 = (void *)MEMORY[0x1E0CEAC70];
      v4 = -2;
      goto LABEL_5;
    case 2uLL:
      quality = self->_quality;
      v3 = (void *)MEMORY[0x1E0CEAC70];
      v4 = 11070;
      goto LABEL_5;
    case 3uLL:
      v6 = SBBlackBackdropSettings;
      goto LABEL_8;
    case 4uLL:
      v6 = SBWhiteBackdropSettings;
LABEL_8:
      v5 = objc_alloc_init(v6);
      break;
    default:
      quality = self->_quality;
      v3 = (void *)MEMORY[0x1E0CEAC70];
      v4 = 11050;
LABEL_5:
      objc_msgSend(v3, "settingsForPrivateStyle:graphicsQuality:", v4, quality);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

- (id)_stringForQuality
{
  if (self->_quality == 10)
    return CFSTR("UIDeviceGraphicsQualityLow");
  else
    return CFSTR("UIDeviceGraphicsQualityHigh");
}

- (id)_stringForStyle
{
  unint64_t v2;

  v2 = self->_style - 2;
  if (v2 > 2)
    return CFSTR("SBLockOverlayStyleMedium");
  else
    return off_1E4C40168[v2];
}

- (unint64_t)style
{
  return self->_style;
}

- (int64_t)graphicsQuality
{
  return self->_quality;
}

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end

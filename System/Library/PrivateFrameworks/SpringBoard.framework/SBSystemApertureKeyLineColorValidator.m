@implementation SBSystemApertureKeyLineColorValidator

- (SBSystemApertureKeyLineColorValidator)init
{
  SBSystemApertureKeyLineColorValidator *v2;
  uint64_t v3;
  SBSystemApertureSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureKeyLineColorValidator;
  v2 = -[SBSystemApertureKeyLineColorValidator init](&v6, sel_init);
  if (v2)
  {
    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSystemApertureSettings *)v3;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    -[SBSystemApertureKeyLineColorValidator _applySettingsValues](v2, "_applySettingsValues");
    v2->_labColorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D980]);
    v2->_colorTransformToLAB = (CGColorTransform *)MEMORY[0x1D17E2AA8]();
    v2->_rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    v2->_colorTransformToRGB = (CGColorTransform *)MEMORY[0x1D17E2AA8]();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_labColorSpace);
  CGColorTransformRelease();
  CGColorSpaceRelease(self->_rgbColorSpace);
  CGColorTransformRelease();
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureKeyLineColorValidator;
  -[SBSystemApertureKeyLineColorValidator dealloc](&v3, sel_dealloc);
}

- (id)validateKeyLineColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  CGColor *v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  CGColor *v15;
  CGColor *v16;
  NSObject *v17;
  id v18;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.916, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v6))
    {

    }
    else
    {
      v7 = -[SBSystemApertureSettings activityKeyLineColorEnabled](self->_settings, "activityKeyLineColorEnabled");

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "resolvedColorWithTraitCollection:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v10, "CGColor");
        v11 = (CGColor *)CGColorTransformConvertColor();
        v12 = (uint64_t *)CGColorGetComponents(v11);
        if (CGColorGetNumberOfComponents(v11) != 4)
          goto LABEL_17;
        v13 = 0;
        v14 = 0;
        do
        {
          if (v13 * 8)
          {
            *(_QWORD *)&components[v13] = v12[v13];
          }
          else
          {
            if ((BSFloatEqualToFloat() & 1) != 0)
              goto LABEL_12;
            *(_QWORD *)&components[0] = SBSystemApertureKeyLineFixedLstar;
            v14 = 1;
          }
          ++v13;
        }
        while (v13 != 4);
        if ((v14 & 1) == 0)
          goto LABEL_17;
LABEL_12:
        v15 = CGColorCreate(self->_labColorSpace, components);
        v16 = (CGColor *)CGColorTransformConvertColor();
        CGColorRelease(v15);
        SBLogSystemApertureController();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[SBSystemApertureKeyLineColorValidator validateKeyLineColor:].cold.1(v12, (uint64_t *)components, v17);

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_17:
          v18 = v10;
          v16 = 0;
        }

        CGColorRelease(v16);
        CGColorRelease(v11);

        v5 = v18;
      }
    }
  }

  return v5;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (objc_msgSend(a4, "containsString:", CFSTR("keyLineColorFixedLstar")))
    -[SBSystemApertureKeyLineColorValidator _applySettingsValues](self, "_applySettingsValues");
}

- (void)_applySettingsValues
{
  uint64_t v2;

  -[SBSystemApertureSettings keyLineColorFixedLstar](self->_settings, "keyLineColorFixedLstar");
  SBSystemApertureKeyLineFixedLstar = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)validateKeyLineColor:(os_log_t)log .cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Key Line Lightness Adjusted from %f to %f.", (uint8_t *)&v5, 0x16u);
}

@end

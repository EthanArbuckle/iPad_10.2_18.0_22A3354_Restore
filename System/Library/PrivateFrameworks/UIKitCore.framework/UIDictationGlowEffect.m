@implementation UIDictationGlowEffect

- (void)updateColorWithUserInterfaceStyleChange
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  UIColor *v15;
  UIColor *cachedTintColor;
  int v17;
  UIColor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_glowEffectView);
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = v5;
  v8 = v5 == 2 || v5 == 1000;

  if (self->_cachedDarkMode != v8)
  {
    self->_cachedDarkMode = v8;
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6 == 1000 || v6 == 2)
    {
      objc_msgSend(v9, "darkModeCompositingFiler");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "lightModeCompositingFiler");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    -[TUIGlowEffect layer](self->_glowEffect, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v12);

    if (self->_cachedTintColor && !self->_cachedDarkMode)
    {
      -[UIDictationGlowEffect setTintColor:](self, "setTintColor:");
      _UIDictationGlowEffectLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        cachedTintColor = self->_cachedTintColor;
        v17 = 138412290;
        v18 = cachedTintColor;
        _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "reset dark-mode-tint-color with cached value %@", (uint8_t *)&v17, 0xCu);
      }

      v15 = self->_cachedTintColor;
      self->_cachedTintColor = 0;

    }
  }
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  id TUIGlowEffectClass;
  _BOOL8 cachedDarkMode;
  id v8;
  uint64_t v9;
  UIColor *v10;
  UIColor *cachedTintColor;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  UIColor *v16;
  double v17;
  uint64_t v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (self->_cachedDarkMode)
    {
      v17 = 0.0;
      v18 = 0;
      TUIGlowEffectClass = getTUIGlowEffectClass();
      cachedDarkMode = self->_cachedDarkMode;
      v8 = objc_retainAutorelease(v5);
      v9 = objc_msgSend(v8, "CGColor");
      objc_msgSend(v8, "alphaComponent");
      if (objc_msgSend(TUIGlowEffectClass, "adjustVisibilityForDarkMode:tintColor:alpha:outTintColor:outAlpha:", cachedDarkMode, v9, &v18, &v17))
      {
        v10 = (UIColor *)objc_msgSend(v8, "copy");
        cachedTintColor = self->_cachedTintColor;
        self->_cachedTintColor = v10;

        _UIDictationGlowEffectLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v16 = self->_cachedTintColor;
          *(_DWORD *)buf = 138412290;
          v20 = *(double *)&v16;
          _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "cache tintColor %@", buf, 0xCu);
        }

        +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "colorWithAlphaComponent:", v17);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        _UIDictationGlowEffectLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v20 = v17;
          v21 = 2112;
          v22 = v5;
          _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "setTintColor: with dark-mode-adjusted opacity %f and color %@", buf, 0x16u);
        }

      }
      else
      {
        v5 = v8;
      }
    }
    v15 = objc_retainAutorelease(v5);
    -[TUIGlowEffect setTintColor:](self->_glowEffect, "setTintColor:", objc_msgSend(v15, "CGColor"));

  }
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  -[TUIGlowEffect setBlurRadius:](self->_glowEffect, "setBlurRadius:");
}

- (UIDictationGlowEffect)initWithView:(id)a3
{
  id v4;
  UIDictationGlowEffect *v5;
  UIDictationGlowEffect *v6;
  UIDictationGlowEffect *v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  TUIGlowEffect *glowEffect;
  TUIGlowEffect *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  BOOL v22;
  _BOOL4 cachedDarkMode;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled")
    && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    v29.receiver = self;
    v29.super_class = (Class)UIDictationGlowEffect;
    v6 = -[UIDictationGlowEffect init](&v29, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_glowEffectView, v4);
      v8 = objc_alloc((Class)getTUIGlowEffectClass());
      WeakRetained = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      objc_msgSend(WeakRetained, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "initWithLayer:", v10);
      glowEffect = v7->_glowEffect;
      v7->_glowEffect = (TUIGlowEffect *)v11;

      -[TUIGlowEffect setPulsing:](v7->_glowEffect, "setPulsing:", 0);
      v13 = v7->_glowEffect;
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "minimumRadius");
      -[TUIGlowEffect setMinimumRadius:](v13, "setMinimumRadius:");

      v15 = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      v30[0] = 0x1E1A994B0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v15, "_registerForTraitTokenChanges:withTarget:action:", v16, v7, sel_updateColorWithUserInterfaceStyleChange);

      v18 = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      objc_msgSend(v18, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceStyle");
      v22 = v20 == 2 || v20 == 1000;
      v7->_cachedDarkMode = v22;

      cachedDarkMode = v7->_cachedDarkMode;
      +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (cachedDarkMode)
        objc_msgSend(v24, "darkModeCompositingFiler");
      else
        objc_msgSend(v24, "lightModeCompositingFiler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIGlowEffect layer](v7->_glowEffect, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCompositingFilter:", v26);

    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setTintColor:(id)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  id TUIGlowEffectClass;
  _BOOL8 cachedDarkMode;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  TUIGlowEffect *glowEffect;
  double v20;
  uint64_t v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v8 = a6;
  v10 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_cachedDarkMode)
    {
      v20 = 0.0;
      v21 = 0;
      TUIGlowEffectClass = getTUIGlowEffectClass();
      cachedDarkMode = self->_cachedDarkMode;
      v15 = objc_retainAutorelease(v12);
      v16 = objc_msgSend(v15, "CGColor");
      objc_msgSend(v15, "alphaComponent");
      if (objc_msgSend(TUIGlowEffectClass, "adjustVisibilityForDarkMode:tintColor:alpha:outTintColor:outAlpha:", cachedDarkMode, v16, &v21, &v20))
      {
        +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "colorWithAlphaComponent:", v20);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        _UIDictationGlowEffectLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v23 = v20;
          v24 = 2112;
          v25 = v12;
          _os_log_debug_impl(&dword_185066000, v18, OS_LOG_TYPE_DEBUG, "setTintColor: with dark-mode-adjusted opacity %f and color %@", buf, 0x16u);
        }

      }
      else
      {
        v12 = v15;
      }
    }
    glowEffect = self->_glowEffect;
    v12 = objc_retainAutorelease(v12);
    -[TUIGlowEffect setTintColor:animated:duration:autoreverses:repeatCount:](glowEffect, "setTintColor:animated:duration:autoreverses:repeatCount:", objc_msgSend(v12, "CGColor"), v10, v8, a5, a7);
  }

}

- (void)setPulsing:(BOOL)a3
{
  -[TUIGlowEffect setPulsing:](self->_glowEffect, "setPulsing:", a3);
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
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_cachedTintColor, 0);
  objc_storeStrong((id *)&self->_glowEffect, 0);
  objc_destroyWeak((id *)&self->_glowEffectView);
}

@end

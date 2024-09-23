@implementation PRPosterPreferencesImpl

- (PRPosterPreferencesImpl)init
{
  PRPosterPreferencesImpl *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRPosterPreferencesImpl;
  result = -[PRPosterPreferencesImpl init](&v3, sel_init);
  if (result)
    result->_depthEffectEnabled = 1;
  return result;
}

- (id)_initFromPreferences:(id)a3
{
  id *v4;
  PRPosterPreferencesImpl *v5;
  PRPosterPreferencesImpl *v6;

  v4 = (id *)a3;
  v5 = -[PRPosterPreferencesImpl init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_timeFont, v4[1]);
    objc_storeStrong((id *)&v6->_timeColor, v4[2]);
    objc_storeStrong((id *)&v6->_statusBarTintColor, v4[3]);
    v6->_significantEventTime = (unint64_t)v4[4];
    v6->_significantEventOptions = (unint64_t)v4[5];
    v6->_userTapEventsRequested = *((_BYTE *)v4 + 48);
    v6->_handlesWakeAnimation = *((_BYTE *)v4 + 49);
    objc_storeStrong((id *)&v6->_averageColor, v4[10]);
    v6->_depthEffectEnabled = *((_BYTE *)v4 + 72);
    v6->_parallaxEnabled = *((_BYTE *)v4 + 73);
    v6->_hideChrome = *((_BYTE *)v4 + 50);
    v6->_hideDimmingLayer = *((_BYTE *)v4 + 51);
    objc_storeStrong((id *)&v6->_desiredLegibilitySettings, v4[7]);
    objc_storeStrong((id *)&v6->_preferredProminentColor, v4[8]);
  }

  return v6;
}

- (void)applyToClientSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setFont:", self->_timeFont);
  objc_msgSend(v8, "setColor:", self->_timeColor);
  objc_msgSend(v4, "pr_setTimeDescriptor:", v8);
  -[UIColor BSColor](self->_statusBarTintColor, "BSColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_setStatusBarTintColor:", v5);

  objc_msgSend(v4, "pui_setSignificantEventTime:", self->_significantEventTime);
  objc_msgSend(v4, "pui_setSignificantEventOptions:", self->_significantEventOptions);
  objc_msgSend(v4, "pui_setUserTapEventsRequested:", self->_userTapEventsRequested);
  objc_msgSend(v4, "pr_setHandlesWakeAnimation:", self->_handlesWakeAnimation);
  -[UIColor BSColor](self->_averageColor, "BSColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_setAverageColor:", v6);

  -[UIColor BSColor](self->_preferredProminentColor, "BSColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_setPreferredProminentColor:", v7);

  objc_msgSend(v4, "pr_setDepthEffectDisabled:", !self->_depthEffectEnabled);
  objc_msgSend(v4, "pr_setHideChrome:", self->_hideChrome);
  objc_msgSend(v4, "pr_setHideDimmingLayer:", self->_hideDimmingLayer);
  objc_msgSend(v4, "pr_setDesiredLegibilitySettings:", self->_desiredLegibilitySettings);

}

- (NSDate)nextWakeDate
{
  return 0;
}

- (void)setNextWakeDate:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[PRPosterPreferencesImpl significantEventOptions](self, "significantEventOptions");
  if (v6)
  {
    -[PRPosterPreferencesImpl setSignificantEventOptions:](self, "setSignificantEventOptions:", v4 | 1);
    objc_msgSend(v6, "timeIntervalSinceNow");
    v5 = BSDispatchTimeWithInterval();
  }
  else
  {
    -[PRPosterPreferencesImpl setSignificantEventOptions:](self, "setSignificantEventOptions:", v4 & 0xFFFFFFFFFFFFFFFELL);
    v5 = -1;
  }
  -[PRPosterPreferencesImpl setSignificantEventTime:](self, "setSignificantEventTime:", v5);

}

- (void)setPreferredProminentColor:(id)a3
{
  id v5;
  UIColor **p_preferredProminentColor;
  UIColor *preferredProminentColor;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  preferredProminentColor = self->_preferredProminentColor;
  p_preferredProminentColor = &self->_preferredProminentColor;
  if ((-[UIColor isEqual:](preferredProminentColor, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)p_preferredProminentColor, a3);
    if (v5)
    {
      objc_msgSend(v5, "alphaComponent");
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        PRLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v5;
          _os_log_impl(&dword_18B634000, v8, OS_LOG_TYPE_DEFAULT, "new preferred prominent color %@ has alpha component that is not 1 - so this won't look good. This will default to white.", buf, 0xCu);
        }

      }
      v13 = 0;
      v14 = 0;
      v12 = 0;
      v9 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(MEMORY[0x1E0D7FCC8], "discreteGradientVariatedColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pui_determineVarianceAndLuminanceForColor:amongstColors:outVariance:outLuminance:outSaturation:", v5, v10, &v13, &v14, &v12);

      if (BSFloatIsZero() && BSFloatIsZero())
      {
        PRLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v5;
          _os_log_impl(&dword_18B634000, v11, OS_LOG_TYPE_DEFAULT, "new preferred prominent color %@ may not map cleanly into the style slider. We will try to clamp to a better value but... - please try a new color.  This may default to white.", buf, 0xCu);
        }

      }
    }
  }

}

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (void)setTimeFont:(id)a3
{
  objc_storeStrong((id *)&self->_timeFont, a3);
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeColor, a3);
}

- (UIColor)statusBarTintColor
{
  return self->_statusBarTintColor;
}

- (void)setStatusBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarTintColor, a3);
}

- (UIColor)averageColor
{
  return self->_averageColor;
}

- (void)setAverageColor:(id)a3
{
  objc_storeStrong((id *)&self->_averageColor, a3);
}

- (PRPosterLegibilitySettings)desiredLegibilitySettings
{
  return self->_desiredLegibilitySettings;
}

- (void)setDesiredLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_desiredLegibilitySettings, a3);
}

- (unint64_t)significantEventTime
{
  return self->_significantEventTime;
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  self->_significantEventTime = a3;
}

- (unint64_t)significantEventOptions
{
  return self->_significantEventOptions;
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  self->_significantEventOptions = a3;
}

- (BOOL)userTapEventsRequested
{
  return self->_userTapEventsRequested;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
  self->_userTapEventsRequested = a3;
}

- (BOOL)handlesWakeAnimation
{
  return self->_handlesWakeAnimation;
}

- (void)setHandlesWakeAnimation:(BOOL)a3
{
  self->_handlesWakeAnimation = a3;
}

- (BOOL)hideChrome
{
  return self->_hideChrome;
}

- (void)setHideChrome:(BOOL)a3
{
  self->_hideChrome = a3;
}

- (BOOL)hideDimmingLayer
{
  return self->_hideDimmingLayer;
}

- (void)setHideDimmingLayer:(BOOL)a3
{
  self->_hideDimmingLayer = a3;
}

- (UIColor)preferredProminentColor
{
  return self->_preferredProminentColor;
}

- (BOOL)isDepthEffectEnabled
{
  return self->_depthEffectEnabled;
}

- (void)setDepthEffectEnabled:(BOOL)a3
{
  self->_depthEffectEnabled = a3;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColor, 0);
  objc_storeStrong((id *)&self->_preferredProminentColor, 0);
  objc_storeStrong((id *)&self->_desiredLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_statusBarTintColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

@end

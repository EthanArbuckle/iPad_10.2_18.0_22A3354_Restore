@implementation SBLoginAppContainerView

- (SBLoginAppContainerView)initWithFrame:(CGRect)a3
{
  SBLoginAppContainerView *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *contentHiddenRequesters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBLoginAppContainerView;
  v3 = -[SBLoginAppContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLoginAppContainerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    contentHiddenRequesters = v3->_contentHiddenRequesters;
    v3->_contentHiddenRequesters = v5;

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBLoginAppContainerView;
  -[SBLoginAppContainerView layoutSubviews](&v11, sel_layoutSubviews);
  -[SBLoginAppContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[SBLoginAppContainerOverlayWrapperView setFrame:](self->_thermalWarningView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_pluginView, "setFrame:", v4, v6, v8, v10);
  -[CSBatteryChargingView frame](self->_batteryChargingView, "frame");
  -[CSBatteryChargingView setFrame:](self->_batteryChargingView, "setFrame:", v4, v6, v8, 150.0);
}

- (void)setBatteryChargingView:(id)a3
{
  CSBatteryChargingView **p_batteryChargingView;
  CSBatteryChargingView *batteryChargingView;
  CSBatteryChargingView *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_batteryChargingView = &self->_batteryChargingView;
  batteryChargingView = self->_batteryChargingView;
  if (batteryChargingView)
    -[CSBatteryChargingView removeFromSuperview](batteryChargingView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_batteryChargingView, a3);
  if (*p_batteryChargingView)
  {
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
    v7 = *p_batteryChargingView;
    -[SBLoginAppContainerView legibilitySettings](self, "legibilitySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryChargingView setLegibilitySettings:](v7, "setLegibilitySettings:", v8);

  }
  -[SBLoginAppContainerView setNeedsLayout](self, "setNeedsLayout");
  -[SBLoginAppContainerView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setThermalWarningView:(id)a3
{
  SBLoginAppContainerOverlayWrapperView *thermalWarningView;
  id v6;

  v6 = a3;
  thermalWarningView = self->_thermalWarningView;
  if (thermalWarningView)
    -[SBLoginAppContainerOverlayWrapperView removeFromSuperview](thermalWarningView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_thermalWarningView, a3);
  if (self->_thermalWarningView)
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  -[SBLoginAppContainerView _showOrHidePluginViewAppropriately](self, "_showOrHidePluginViewAppropriately");
  -[SBLoginAppContainerView setNeedsLayout](self, "setNeedsLayout");
  -[SBLoginAppContainerView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setPluginView:(id)a3
{
  UIView *pluginView;
  id v6;

  v6 = a3;
  pluginView = self->_pluginView;
  if (pluginView)
    -[UIView removeFromSuperview](pluginView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_pluginView, a3);
  if (self->_pluginView)
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  -[SBLoginAppContainerView _showOrHidePluginViewAppropriately](self, "_showOrHidePluginViewAppropriately");
  -[SBLoginAppContainerView setNeedsLayout](self, "setNeedsLayout");
  -[SBLoginAppContainerView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setContentView:(id)a3
{
  id *p_contentView;
  UIView *contentView;
  id v7;

  v7 = a3;
  p_contentView = (id *)&self->_contentView;
  contentView = self->_contentView;
  if (contentView)
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_contentView, a3);
  if (*p_contentView)
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  if (-[NSMutableSet count](self->_contentHiddenRequesters, "count"))
    objc_msgSend(*p_contentView, "setAlpha:", 0.0);
  -[SBLoginAppContainerView setNeedsLayout](self, "setNeedsLayout");
  -[SBLoginAppContainerView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setContentHidden:(BOOL)a3 forRequester:(id)a4
{
  _BOOL4 v4;
  int v6;
  double v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = -[NSMutableSet containsObject:](self->_contentHiddenRequesters, "containsObject:");
  if (v4)
  {
    if ((v6 & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_contentHiddenRequesters, "addObject:", v8);
      v7 = 0.0;
LABEL_7:
      -[UIView setAlpha:](self->_contentView, "setAlpha:", v7);
    }
  }
  else if (v6)
  {
    -[NSMutableSet removeObject:](self->_contentHiddenRequesters, "removeObject:", v8);
    if (!-[NSMutableSet count](self->_contentHiddenRequesters, "count"))
    {
      v7 = 1.0;
      goto LABEL_7;
    }
  }

}

- (void)_showOrHidePluginViewAppropriately
{
  double v2;

  v2 = 0.0;
  if (!self->_thermalWarningView)
    v2 = 1.0;
  -[UIView setAlpha:](self->_pluginView, "setAlpha:", v2);
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  v5 = a3;
  -[CSBatteryChargingView setLegibilitySettings:](self->_batteryChargingView, "setLegibilitySettings:", v5);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (CSBatteryChargingView)batteryChargingView
{
  return self->_batteryChargingView;
}

- (SBLoginAppContainerOverlayWrapperView)thermalWarningView
{
  return self->_thermalWarningView;
}

- (SBLockScreenDeviceInformationTextView)deviceInformationTextView
{
  return self->_deviceInformationTextView;
}

- (void)setDeviceInformationTextView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInformationTextView, a3);
}

- (UIView)pluginView
{
  return self->_pluginView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pluginView, 0);
  objc_storeStrong((id *)&self->_deviceInformationTextView, 0);
  objc_storeStrong((id *)&self->_thermalWarningView, 0);
  objc_storeStrong((id *)&self->_batteryChargingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentHiddenRequesters, 0);
}

@end

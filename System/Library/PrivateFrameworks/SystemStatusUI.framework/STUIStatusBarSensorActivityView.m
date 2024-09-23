@implementation STUIStatusBarSensorActivityView

- (void)configureSensorViewWithoutPortalIfNeededForTargetScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  +[STUIStatusBar sensorActivityIndicatorForScreen:](STUIStatusBar, "sensorActivityIndicatorForScreen:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {

    if (v6 != v4)
    {
      -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    -[STUIStatusBarSensorActivityView setSensorActivityView:](self, "setSensorActivityView:", v4);
    -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[STUIStatusBarSensorActivityView addSubview:](self, "addSubview:", v4);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarSensorActivityView centerXAnchor](self, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarSensorActivityView centerYAnchor](self, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

    -[STUIStatusBarSensorActivityView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  else
  {

    if (v6)
    {
      -[STUIStatusBarSensorActivityView sensorActivityView](self, "sensorActivityView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromSuperview");

      -[STUIStatusBarSensorActivityView setSensorActivityView:](self, "setSensorActivityView:", 0);
    }
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  -[STUIStatusBarSensorActivityView _screen](self, "_screen");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self->_portalView)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v15 = (void *)v3;
    +[STUIStatusBar sensorActivityIndicatorForScreen:](STUIStatusBar, "sensorActivityIndicatorForScreen:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "bounds");
      v9 = v8;
      v11 = v10;
      if (self->_iconSize)
        +[STUIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:](STUIStatusBarBatteryView, "_statusBarIntrinsicContentSizeForIconSize:");
      UIRoundToViewScale();
      v13 = v12;
      UIRoundToViewScale();
      -[_UIPortalView setFrame:](self->_portalView, "setFrame:", v13, v14, v9, v11);
    }

    v4 = v15;
  }

}

- (BOOL)configurePortalViewIfNeededForTargetScreen:(id)a3
{
  void *v4;
  _UIPortalView *portalView;
  _UIPortalView *v6;
  _UIPortalView *v7;
  _UIPortalView *v8;

  +[STUIStatusBar sensorActivityIndicatorForScreen:](STUIStatusBar, "sensorActivityIndicatorForScreen:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  portalView = self->_portalView;
  if (v4)
  {
    if (portalView)
    {
      -[_UIPortalView setSourceView:](portalView, "setSourceView:", v4);
    }
    else
    {
      v7 = (_UIPortalView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", v4);
      v8 = self->_portalView;
      self->_portalView = v7;

      -[_UIPortalView setName:](self->_portalView, "setName:", CFSTR("STUIStatusBarSensorActivityView.portal"));
      -[_UIPortalView setMatchesAlpha:](self->_portalView, "setMatchesAlpha:", 0);
      -[STUIStatusBarSensorActivityView addSubview:](self, "addSubview:", self->_portalView);
    }
    -[STUIStatusBarSensorActivityView setNeedsLayout](self, "setNeedsLayout");
  }
  else if (portalView)
  {
    -[_UIPortalView removeFromSuperview](portalView, "removeFromSuperview");
    v6 = self->_portalView;
    self->_portalView = 0;

    -[STUIStatusBarSensorActivityView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

  return v4 != 0;
}

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v4;
  int64_t iconSize;
  BOOL v6;

  v4 = objc_msgSend(a3, "iconSize");
  iconSize = self->_iconSize;
  -[STUIStatusBarSensorActivityView setIconSize:](self, "setIconSize:", v4);
  if (self->_portalView)
    v6 = iconSize == v4;
  else
    v6 = 1;
  if (!v6)
  {
    -[STUIStatusBarSensorActivityView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[STUIStatusBarSensorActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  UIView *sensorActivityView;
  double v5;
  double v6;
  CGSize result;

  if (self->_portalView)
  {
    +[STUIStatusBarBatteryView _statusBarIntrinsicContentSizeForIconSize:](STUIStatusBarBatteryView, "_statusBarIntrinsicContentSizeForIconSize:", self->_iconSize);
    v3 = 7.0;
  }
  else
  {
    sensorActivityView = self->_sensorActivityView;
    if (sensorActivityView)
    {
      -[UIView bounds](sensorActivityView, "bounds");
      v3 = v5;
      v2 = v6;
    }
    else
    {
      v3 = *MEMORY[0x1E0C9D820];
      v2 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  result.height = v2;
  result.width = v3;
  return result;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (UIView)sensorActivityView
{
  return self->_sensorActivityView;
}

- (void)setSensorActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_sensorActivityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end

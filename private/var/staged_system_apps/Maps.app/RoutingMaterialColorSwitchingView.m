@implementation RoutingMaterialColorSwitchingView

- (RoutingMaterialColorSwitchingView)initWithLightMaterial:(int64_t)a3 darkColor:(id)a4
{
  id v7;
  RoutingMaterialColorSwitchingView *v8;
  RoutingMaterialColorSwitchingView *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RoutingMaterialColorSwitchingView;
  v8 = -[RoutingMaterialColorSwitchingView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_lightMaterial = a3;
    objc_storeStrong((id *)&v8->_darkColor, a4);
    -[RoutingMaterialColorSwitchingView _updateForCurrentInterfaceStyle](v9, "_updateForCurrentInterfaceStyle");
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutingMaterialColorSwitchingView;
  v4 = a3;
  -[RoutingMaterialColorSwitchingView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[RoutingMaterialColorSwitchingView _updateForCurrentInterfaceStyle](self, "_updateForCurrentInterfaceStyle");
}

- (void)_updateForCurrentInterfaceStyle
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[RoutingMaterialColorSwitchingView _setLightViewVisible:](self, "_setLightViewVisible:", v4 == (id)1);
  -[RoutingMaterialColorSwitchingView _setDarkViewVisible:](self, "_setDarkViewVisible:", v4 == (id)2);
}

- (UIView)lightView
{
  UIView *lightView;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  lightView = self->_lightView;
  if (!lightView)
  {
    v4 = objc_alloc((Class)UIVisualEffectView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", self->_lightMaterial));
    v6 = (UIView *)objc_msgSend(v4, "initWithEffect:", v5);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAllowsBlurring:](v6, "setAllowsBlurring:", 0);
    v7 = self->_lightView;
    self->_lightView = v6;

    lightView = self->_lightView;
  }
  return lightView;
}

- (void)_setLightViewVisible:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[UIView removeFromSuperview](self->_darkView, "removeFromSuperview");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView lightView](self, "lightView"));
    -[RoutingMaterialColorSwitchingView addSubview:](self, "addSubview:", v4);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView lightView](self, "lightView"));
    LODWORD(v5) = 1148846080;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsEqualToEdgesOfView:priority:", self, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  }
  else
  {
    -[UIView removeFromSuperview](self->_lightView, "removeFromSuperview");
  }
}

- (UIView)darkView
{
  UIView *darkView;
  UIView *v4;
  UIView *v5;

  darkView = self->_darkView;
  if (!darkView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_darkView;
    self->_darkView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_darkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setBackgroundColor:](self->_darkView, "setBackgroundColor:", self->_darkColor);
    darkView = self->_darkView;
  }
  return darkView;
}

- (void)_setDarkViewVisible:(BOOL)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[UIView removeFromSuperview](self->_lightView, "removeFromSuperview");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView darkView](self, "darkView"));
    -[RoutingMaterialColorSwitchingView addSubview:](self, "addSubview:", v4);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutingMaterialColorSwitchingView darkView](self, "darkView"));
    LODWORD(v5) = 1148846080;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_constraintsEqualToEdgesOfView:priority:", self, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  }
  else
  {
    -[UIView removeFromSuperview](self->_darkView, "removeFromSuperview");
  }
}

- (void)setLightView:(id)a3
{
  objc_storeStrong((id *)&self->_lightView, a3);
}

- (void)setDarkView:(id)a3
{
  objc_storeStrong((id *)&self->_darkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkView, 0);
  objc_storeStrong((id *)&self->_lightView, 0);
  objc_storeStrong((id *)&self->_darkColor, 0);
}

@end

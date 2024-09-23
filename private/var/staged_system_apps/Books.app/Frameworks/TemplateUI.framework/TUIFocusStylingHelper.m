@implementation TUIFocusStylingHelper

- (TUIFocusStylingHelper)initWithContainer:(id)a3 reference:(id)a4 style:(id)a5
{
  UIView *v8;
  UIView *v9;
  id v10;
  TUIFocusStylingHelper *v11;
  TUIFocusStylingHelper *v12;
  objc_super v14;

  v8 = (UIView *)a3;
  v9 = (UIView *)a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TUIFocusStylingHelper;
  v11 = -[TUIFocusStylingHelper init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_container = v8;
    v11->_reference = v9;
    objc_storeStrong((id *)&v11->_style, a5);
  }

  return v12;
}

- (void)reset
{
  UIView *effectView;

  -[UIView removeFromSuperview](self->_effectView, "removeFromSuperview");
  effectView = self->_effectView;
  self->_effectView = 0;

  self->_container = 0;
}

- (void)updateStyle:(id)a3
{
  TUIFocusStyle *v5;

  v5 = (TUIFocusStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    if (self->_effectView)
      -[TUIFocusStylingHelper _configureEffectView](self, "_configureEffectView");
  }

}

- (BOOL)wantsFocusRing
{
  return (char *)-[TUIFocusStyle effect](self->_style, "effect") == (char *)&dword_0 + 1;
}

- (id)focusEffect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;

  if ((char *)-[TUIFocusStyle effect](self->_style, "effect") - 1 > (_BYTE *)&dword_0 + 2)
  {
    v22 = 0;
  }
  else
  {
    -[UIView bounds](self->_container, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[TUIFocusStyle insets](self->_style, "insets");
    v12 = v4 + v11;
    v14 = v6 + v13;
    v16 = v8 - (v11 + v15);
    v18 = v10 - (v13 + v17);
    -[TUIFocusStyle cornerRadius](self->_style, "cornerRadius");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFocusStylingHelper _cornerCurve](self, "_cornerCurve"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", v21, v12, v14, v16, v18, v20));

    objc_msgSend(v22, "setReferenceView:", self->_reference);
    objc_msgSend(v22, "setContainerView:", self->_container);
    if ((char *)-[TUIFocusStyle effect](self->_style, "effect") == (char *)&dword_0 + 2)
    {
      v23 = 2;
LABEL_7:
      objc_msgSend(v22, "setPosition:", v23);
      return v22;
    }
    if ((char *)-[TUIFocusStyle effect](self->_style, "effect") == (char *)&dword_0 + 3)
    {
      v23 = 1;
      goto LABEL_7;
    }
  }
  return v22;
}

- (BOOL)_effectNeedsView
{
  return (int *)-[TUIFocusStyle effect](self->_style, "effect") == &dword_4;
}

- (id)_cornerCurve
{
  unsigned int v2;
  id *v3;

  v2 = -[TUIFocusStyle continuousCurve](self->_style, "continuousCurve");
  v3 = (id *)&kCACornerCurveContinuous;
  if (!v2)
    v3 = (id *)&kCACornerCurveCircular;
  return *v3;
}

- (void)_configureEffectView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[UIView bounds](self->_container, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIFocusStyle insets](self->_style, "insets");
  -[UIView setFrame:](self->_effectView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  -[TUIFocusStyle cornerRadius](self->_style, "cornerRadius");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_effectView, "layer"));
  objc_msgSend(v17, "setCornerRadius:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFocusStylingHelper _cornerCurve](self, "_cornerCurve"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_effectView, "layer"));
  objc_msgSend(v19, "setCornerCurve:", v18);

  v22 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFocusStyle color](self->_style, "color"));
  if (v20)
  {
    -[UIView setBackgroundColor:](self->_effectView, "setBackgroundColor:", v20);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "colorWithAlphaComponent:", 0.12));
    -[UIView setBackgroundColor:](self->_effectView, "setBackgroundColor:", v21);

  }
}

- (void)activateEffectWithAnimationCoordinator:(id)a3
{
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *effectView;
  void *v19;
  id v20;

  v20 = a3;
  if (!self->_effectView)
  {
    if (-[TUIFocusStylingHelper _effectNeedsView](self, "_effectNeedsView"))
    {
      -[UIView bounds](self->_container, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[TUIFocusStyle insets](self->_style, "insets");
      v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6 + v13, v8 + v14, v10 - (v13 + v15), v12 - (v14 + v16));
      effectView = self->_effectView;
      self->_effectView = v17;

      -[UIView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_effectView, "layer"));
      objc_msgSend(v19, "setCornerCurve:", kCACornerCurveContinuous);

      -[UIView insertSubview:atIndex:](self->_container, "insertSubview:atIndex:", self->_effectView, 0);
      -[TUIFocusStylingHelper _configureEffectView](self, "_configureEffectView");
      goto LABEL_7;
    }
    if (!self->_effectView)
      goto LABEL_7;
  }
  if (!-[TUIFocusStylingHelper _effectNeedsView](self, "_effectNeedsView"))
  {
    -[UIView removeFromSuperview](self->_effectView, "removeFromSuperview");
    v4 = self->_effectView;
    self->_effectView = 0;

  }
LABEL_7:

}

- (void)deactivateEffectWithAnimationCoordinator:(id)a3
{
  UIView *effectView;

  -[UIView removeFromSuperview](self->_effectView, "removeFromSuperview", a3);
  effectView = self->_effectView;
  self->_effectView = 0;

}

- (BOOL)canBecomeFocused
{
  return -[TUIFocusStyle effect](self->_style, "effect") != 0;
}

- (id)focusGroupIdentifier
{
  return -[TUIFocusStyle groupIdentifier](self->_style, "groupIdentifier");
}

- (UIView)container
{
  return self->_container;
}

- (UIView)reference
{
  return self->_reference;
}

- (TUIFocusStyle)style
{
  return self->_style;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end

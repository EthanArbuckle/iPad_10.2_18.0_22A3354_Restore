@implementation CarMultiButtonView

- (CarMultiButtonView)initWithFrame:(CGRect)a3
{
  CarMultiButtonView *v3;
  UIView *v4;
  UIView *shadowView;
  CarMultiButtonStackView *v6;
  CarMultiButtonStackView *stackView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarMultiButtonView;
  v3 = -[CarMultiButtonView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    shadowView = v3->_shadowView;
    v3->_shadowView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_shadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarMultiButtonView addSubview:](v3, "addSubview:", v3->_shadowView);
    v6 = objc_alloc_init(CarMultiButtonStackView);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    -[CarMultiButtonStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarMultiButtonStackView setClipsToBounds:](v3->_stackView, "setClipsToBounds:", 0);
    -[CarMultiButtonStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[CarMultiButtonStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[CarMultiButtonView _buttonSpacing](v3, "_buttonSpacing");
    -[CarMultiButtonStackView setSpacing:](v3->_stackView, "setSpacing:");
    -[CarMultiButtonStackView setDistribution:](v3->_stackView, "setDistribution:", 1);
    -[UIView addSubview:](v3->_shadowView, "addSubview:", v3->_stackView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsForCenteringInView:](v3->_shadowView, "_maps_constraintsForCenteringInView:", v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonStackView _maps_constraintsForCenteringInView:](v3->_stackView, "_maps_constraintsForCenteringInView:", v3->_shadowView));
    -[CarMultiButtonView addConstraints:](v3, "addConstraints:", v8);
    -[CarMultiButtonView addConstraints:](v3, "addConstraints:", v9);

  }
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarMultiButtonView;
  -[CarMultiButtonView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView window](self, "window"));

  if (v3)
  {
    -[UIView _mapsCar_updateShadow](self->_shadowView, "_mapsCar_updateShadow");
    -[CarMultiButtonView _recalculateShadowAttributes](self, "_recalculateShadowAttributes");
    -[CarMultiButtonView _buttonSpacing](self, "_buttonSpacing");
    -[CarMultiButtonStackView setSpacing:](self->_stackView, "setSpacing:");
  }
}

- (double)_buttonSpacing
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  objc_msgSend(v4, "scale");
  if (v5 == 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
    objc_msgSend(v6, "scale");
    v9 = v10;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView window](self, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
    objc_msgSend(v7, "scale");
    v9 = v8;

  }
  result = 1.0 / v9;
  if (v9 == 0.0)
    return 0.5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarMultiButtonView;
  v4 = a3;
  -[CarMultiButtonView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[UIView _mapsCar_updateShadow](self->_shadowView, "_mapsCar_updateShadow");
}

- (void)setButtons:(id)a3
{
  NSArray *v5;
  NSArray **p_buttons;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = (NSArray *)a3;
  p_buttons = &self->_buttons;
  if (self->_buttons != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_buttons, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = *p_buttons;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "setRoundedCorners:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](*p_buttons, "firstObject"));

          v14 = 0.0;
          v15 = 0.0;
          if (v12 == v13)
          {
            objc_msgSend(v12, "setRoundedCorners:", (unint64_t)objc_msgSend(v12, "roundedCorners") | 3);
            v15 = -8.5;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](*p_buttons, "lastObject"));

          if (v12 == v16)
          {
            objc_msgSend(v12, "setRoundedCorners:", (unint64_t)objc_msgSend(v12, "roundedCorners") | 0xC);
            v14 = -8.5;
          }
          objc_msgSend(v12, "setTouchInsets:", v15, -8.5, v14, -8.5);
          if ((objc_opt_respondsToSelector(v12, "setNeedsLayout") & 1) != 0)
            objc_msgSend(v12, "setNeedsLayout");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[CarMultiButtonStackView _maps_setArrangedSubviews:](self->_stackView, "_maps_setArrangedSubviews:", *p_buttons);
    -[UIView _mapsCar_updateShadow](self->_shadowView, "_mapsCar_updateShadow");
    -[CarMultiButtonView _recalculateShadowAttributes](self, "_recalculateShadowAttributes");
    -[CarMultiButtonView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v17;
  }

}

- (void)_recalculateShadowAttributes
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSArray *buttons;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  int v21;
  const CALayerCornerCurve *v22;
  CALayerCornerCurve v23;
  void *v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
  v4 = objc_msgSend(v3, "roundedCorners");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_buttons, "lastObject"));
  v6 = objc_msgSend(v5, "roundedCorners") | v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
  objc_msgSend(v7, "roundedCornerRadius");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_buttons, "lastObject"));
  objc_msgSend(v10, "roundedCornerRadius");
  buttons = self->_buttons;
  if (v9 > v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](buttons, "firstObject"));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](buttons, "lastObject"));
  v14 = v13;
  objc_msgSend(v13, "roundedCornerRadius");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
  objc_msgSend(v17, "setCornerRadius:", v16);

  v18 = v6 & 0xF;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
  objc_msgSend(v19, "setMaskedCorners:", v18);

  v25 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject"));
  v20 = objc_msgSend(v25, "needsContinuousRoundedCorners");
  if ((v20 & 1) != 0
    || (v18 = objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_buttons, "firstObject")),
        objc_msgSend((id)v18, "needsContinuousRoundedCorners")))
  {
    v21 = v20 ^ 1;
    v22 = &kCACornerCurveContinuous;
  }
  else
  {
    v22 = &kCACornerCurveCircular;
    v21 = 1;
  }
  v23 = *v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_shadowView, "layer"));
  objc_msgSend(v24, "setCornerCurve:", v23);

  if (v21)
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView buttons](self, "buttons"));
  if (objc_msgSend(v3, "count") == (id)1)
  {

    v4 = 28.0;
LABEL_4:
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView buttons](self, "buttons"));
    v8 = (double)((unint64_t)objc_msgSend(v7, "count") - 1);
    -[CarMultiButtonView _buttonSpacing](self, "_buttonSpacing");
    v4 = v4 + v8 * v9;

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarMultiButtonView buttons](self, "buttons"));
  v4 = (double)(unint64_t)objc_msgSend(v5, "count") * 33.0;

  if (v4 > 0.0)
    goto LABEL_4;
LABEL_5:
  v10 = UIRoundToViewScale(self, v6, v4);
  v11 = 28.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[CarMultiButtonStackView pointInside:withEvent:](self->_stackView, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (CarMultiButtonStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end

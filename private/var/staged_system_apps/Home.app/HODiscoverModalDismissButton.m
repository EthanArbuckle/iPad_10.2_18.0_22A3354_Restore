@implementation HODiscoverModalDismissButton

- (HODiscoverModalDismissButton)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithURL:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HODiscoverModalDismissButton.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HODiscoverModalDismissButton initWithCoder:]",
    v7);

  return 0;
}

- (HODiscoverModalDismissButton)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithURL:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HODiscoverModalDismissButton.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HODiscoverModalDismissButton init]",
    v6);

  return 0;
}

- (HODiscoverModalDismissButton)initWithFrame:(CGRect)a3
{
  HODiscoverModalDismissButton *v3;
  HODiscoverModalDismissButton *v4;
  void *v5;
  void *v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *dismissButtonEffectView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  UIView *v18;
  UIView *dismissButtonForegroundView;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  void *v28;
  _QWORD v29[3];

  v27.receiver = self;
  v27.super_class = (Class)HODiscoverModalDismissButton;
  v3 = -[HODiscoverModalDismissButton initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HODiscoverModalDismissButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HODiscoverModalDismissButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[HODiscoverModalDismissButton setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton layer](v4, "layer"));
    objc_msgSend(v5, "setCornerRadius:", 17.5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.3));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.8));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.8));
    v8 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    dismissButtonEffectView = v4->_dismissButtonEffectView;
    v4->_dismissButtonEffectView = v8;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect _effectWithInfiniteRadiusScale:](UIBlurEffect, "_effectWithInfiniteRadiusScale:", 0.0625));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("dismiss-button-color-map")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect colorEffectLuminanceMap:blendingAmount:](UIColorEffect, "colorEffectLuminanceMap:blendingAmount:", v10, 1.0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverModalDismissButton effectMappingColors:whitePoint:](HODiscoverModalDismissButton, "effectMappingColors:whitePoint:", v6, v23));
    v29[0] = v26;
    v29[1] = v25;
    v29[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    -[UIVisualEffectView setBackgroundEffects:](v4->_dismissButtonEffectView, "setBackgroundEffects:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HODiscoverModalDismissButton vibrancyEffectMappingColorsToColors:blackPointOut:whitePointIn:whitePointOut:](HODiscoverModalDismissButton, "vibrancyEffectMappingColorsToColors:blackPointOut:whitePointIn:whitePointOut:", v6, v24, v23, v7));
    v28 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    -[UIVisualEffectView setContentEffects:](v4->_dismissButtonEffectView, "setContentEffects:", v14);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_dismissButtonEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setUserInteractionEnabled:](v4->_dismissButtonEffectView, "setUserInteractionEnabled:", 0);
    -[HODiscoverModalDismissButton addSubview:](v4, "addSubview:", v4->_dismissButtonEffectView);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 20.0));
    v16 = objc_alloc((Class)UIImageView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("multiply"), v15));
    v18 = (UIView *)objc_msgSend(v16, "initWithImage:", v17);
    dismissButtonForegroundView = v4->_dismissButtonForegroundView;
    v4->_dismissButtonForegroundView = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_dismissButtonForegroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
    -[UIView setTintColor:](v4->_dismissButtonForegroundView, "setTintColor:", v20);

    -[UIView setUserInteractionEnabled:](v4->_dismissButtonForegroundView, "setUserInteractionEnabled:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_dismissButtonEffectView, "contentView"));
    objc_msgSend(v21, "addSubview:", v4->_dismissButtonForegroundView);

  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton layoutConstraints](self, "layoutConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton topAnchor](self, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    objc_msgSend(v4, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton bottomAnchor](self, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    objc_msgSend(v4, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton trailingAnchor](self, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    objc_msgSend(v4, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton leadingAnchor](self, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
    objc_msgSend(v4, "addObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonForegroundView](self, "dismissButtonForegroundView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v29));
    objc_msgSend(v4, "addObject:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonForegroundView](self, "dismissButtonForegroundView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverModalDismissButton dismissButtonEffectView](self, "dismissButtonEffectView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v35));
    objc_msgSend(v4, "addObject:", v36);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
    -[HODiscoverModalDismissButton setLayoutConstraints:](self, "setLayoutConstraints:", v4);

  }
  v37.receiver = self;
  v37.super_class = (Class)HODiscoverModalDismissButton;
  -[HODiscoverModalDismissButton updateConstraints](&v37, "updateConstraints");
}

+ (id)effectMappingColors:(id)a3 whitePoint:(id)a4
{
  id v5;
  double v7;
  __int128 v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  double v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;

  v27 = 0.0;
  v28 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v5 = a4;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v28, &v27, &v26, &v25);
  v23 = 0.0;
  v24 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v24, &v23, &v22, &v21);

  v29 = 0uLL;
  v30 = 0uLL;
  v7 = v24 - v28;
  v8 = 0u;
  v9 = 0u;
  v10 = v23 - v27;
  v11 = 0uLL;
  v12 = 0uLL;
  v13 = v22 - v26;
  v14 = 0u;
  v15 = 0u;
  v16 = v21 - v25;
  v17 = v28 * v25;
  v18 = v27 * v25;
  v19 = v26 * v25;
  v20 = v25;
  return (id)objc_claimAutoreleasedReturnValue(+[UIColorEffect colorEffectMatrix:](UIColorEffect, "colorEffectMatrix:", &v7));
}

+ (id)vibrancyEffectMappingColorsToColors:(id)a3 blackPointOut:(id)a4 whitePointIn:(id)a5 whitePointOut:(id)a6
{
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v17;
  uint64_t v18;
  int v19;
  float v20;
  int v21;
  float v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  int v27;
  float v28;
  uint64_t v29;
  int v30;
  float v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v39 = 0.0;
  v40 = 0.0;
  v37 = 0.0;
  v38 = 0.0;
  v7 = a6;
  objc_msgSend(a4, "getRed:green:blue:alpha:", &v40, &v39, &v38, &v37);
  v35 = 0.0;
  v36 = 0.0;
  v34 = 0.0;
  v33 = 0.0;
  objc_msgSend(v7, "getRed:green:blue:alpha:", &v36, &v35, &v34, &v33);

  v8 = v36 - v40;
  v9 = v40 * v37;
  v10 = v35 - v39;
  v11 = v39 * v37;
  v12 = v34 - v38;
  v13 = v38 * v37;
  v14 = v33 - v37;
  v15 = v37;
  v17 = v8;
  v18 = 0;
  v19 = 0;
  v20 = v9;
  v21 = 0;
  v22 = v10;
  v23 = 0;
  v24 = v11;
  v25 = 0;
  v26 = v12;
  v27 = 0;
  v28 = v13;
  v29 = 0;
  v30 = 0;
  v31 = v14;
  v32 = v15;
  return (id)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect _vibrantEffectWithCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithCAColorMatrix:alpha:", &v17, 1.0));
}

- (UIVisualEffectView)dismissButtonEffectView
{
  return self->_dismissButtonEffectView;
}

- (void)setDismissButtonEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButtonEffectView, a3);
}

- (UIView)dismissButtonForegroundView
{
  return self->_dismissButtonForegroundView;
}

- (void)setDismissButtonForegroundView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButtonForegroundView, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_dismissButtonForegroundView, 0);
  objc_storeStrong((id *)&self->_dismissButtonEffectView, 0);
}

@end

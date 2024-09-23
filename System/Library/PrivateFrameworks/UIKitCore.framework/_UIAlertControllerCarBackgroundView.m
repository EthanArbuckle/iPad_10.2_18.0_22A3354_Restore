@implementation _UIAlertControllerCarBackgroundView

- (_UIAlertControllerCarBackgroundView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerCarBackgroundView *v3;
  UIVisualEffectView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)_UIAlertControllerCarBackgroundView;
  v3 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIVisualEffectView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:", 1.5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 10.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    v25[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v4, "setBackgroundEffects:", v5);

    -[UIView addSubview:](v3, "addSubview:", v4);
    v15 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v4, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    -[UIView leftAnchor](v4, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v3, "leftAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v6;
    -[UIView rightAnchor](v4, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v3, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v9;
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v13);

  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (id)_colorForInterfaceStyle:(int64_t)a3
{
  double v3;

  if (a3 == 1)
    v3 = 0.964705882;
  else
    v3 = 0.250980392;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v3, v3, v3, 0.9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerCarBackgroundView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerCarBackgroundView _colorForInterfaceStyle:](self, "_colorForInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

@end

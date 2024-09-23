@implementation _UIAlertControllerModernTVBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2;
  double v3;
  CGSize result;

  v2 = 32.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)contentCornerRadius
{
  return 48.0;
}

+ (double)platterHairlineWidth
{
  return 1.0;
}

+ (id)newBackgroundVisualEffectInAlertGroup
{
  UIVisualEffectView *v2;
  void *v3;

  v2 = objc_alloc_init(UIVisualEffectView);
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 5002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](v2, "setEffect:", v3);
  -[UIVisualEffectView _setGroupName:](v2, "_setGroupName:", CFSTR("_UIAlertControllerModernBackgroundEffectView"));

  return v2;
}

- (_UIAlertControllerModernTVBackgroundView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerModernTVBackgroundView *v3;
  UIVisualEffectView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerModernTVBackgroundView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIVisualEffectView);
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 5002);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v4, "setEffect:", v5);
    -[UIVisualEffectView _setGroupName:](v4, "_setGroupName:", CFSTR("_UIAlertControllerModernBackgroundEffectView"));

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[UIView bounds](v3, "bounds");
    -[UIView setFrame:](v4, "setFrame:");
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v3, "addSubview:", v4);

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerModernTVBackgroundView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIAlertControllerModernTVBackgroundView _configurePlatterHairline](self, "_configurePlatterHairline");
}

- (void)_configurePlatterHairline
{
  void *v3;
  uint64_t v4;
  double v5;
  BOOL v6;
  int v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76988, (uint64_t)CFSTR("TVAlert_DarkModeBackgroundHairlineAlpha")))v5 = 0.1;
  else
    v5 = *(double *)&qword_1ECD76990;
  v6 = v4 == 1000 || v4 == 2;
  if (v6 && v5 > 0.0)
  {
    v7 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_9, (uint64_t)CFSTR("TVAlert_DarkModeBackgroundHairlineWhite"));
    v8 = *(double *)&qword_1ECD76980;
    if (v7)
      v8 = 1.0;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v5);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v10);

    objc_msgSend((id)objc_opt_class(), "platterHairlineWidth");
    v13 = v12;
    -[UIView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v15 = v13;
  }
  else
  {
    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderColor:", 0);

    -[UIView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v15 = 0.0;
  }
  objc_msgSend(v14, "setBorderWidth:", v15);

}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  id v6;

  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  -[UIView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

}

@end

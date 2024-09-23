@implementation _UIInterfaceActionVibrantBorderView

+ (id)newWithRoundedCornerPosition:(unint64_t)a3 continuousCornerRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaskedCorners:", a3);

    objc_msgSend(v7, "_setContinuousCornerRadius:", a4);
  }
  objc_msgSend(v7, "_setupEffectViewWithRoundedCornerPosition:continuousCornerRadius:", a3, a4);
  return v7;
}

- (void)_setupEffectViewWithRoundedCornerPosition:(unint64_t)a3 continuousCornerRadius:(double)a4
{
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  void *v10;
  id v11;

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v11, 120);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v7);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](v8, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](v8, "_setCornerRadius:continuous:maskedCorners:", 1, a3, a4);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](v8, "setFrame:");
  -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self, "addSubview:", v8);

}

@end

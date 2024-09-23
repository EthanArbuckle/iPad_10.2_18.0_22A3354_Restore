@implementation _UIAlertControlleriOSActionSheetCancelBackgroundView

- (_UIAlertControlleriOSActionSheetCancelBackgroundView)initWithFrame:(CGRect)a3
{
  _UIAlertControlleriOSActionSheetCancelBackgroundView *v3;
  UIView *v4;
  uint64_t v5;
  UIView *backgroundView;
  UIView *v7;
  void *v8;
  UIView *v9;
  uint64_t v10;
  UIView *highlightBackgroundView;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  UIVisualEffectView *v16;
  void *v17;
  void *v18;
  UIView *highlightView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)_UIAlertControlleriOSActionSheetCancelBackgroundView;
  v3 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    backgroundView = v3->backgroundView;
    v3->backgroundView = (UIView *)v5;

    v7 = v3->backgroundView;
    +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    highlightBackgroundView = v3->highlightBackgroundView;
    v3->highlightBackgroundView = (UIView *)v10;

    v12 = v3->highlightBackgroundView;
    +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v14, 112);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v15);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v16, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    highlightView = v3->highlightView;
    v3->highlightView = &v16->super;

    -[UIView addSubview:](v3, "addSubview:", v3->backgroundView);
    -[UIView addSubview:](v3, "addSubview:", v3->highlightBackgroundView);
    -[UIView addSubview:](v3, "addSubview:", v3->highlightView);
    -[_UIAlertControlleriOSActionSheetCancelBackgroundView setHighlighted:](v3, "setHighlighted:", 0);
    -[UIView bounds](v3, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[UIView setFrame:](v3->backgroundView, "setFrame:");
    -[UIView setFrame:](v3->highlightBackgroundView, "setFrame:", v21, v23, v25, v27);
    -[UIView setFrame:](v3->highlightView, "setFrame:", v21, v23, v25, v27);
    -[UIView setAutoresizingMask:](v3->backgroundView, "setAutoresizingMask:", 18);
    -[UIView setAutoresizingMask:](v3->highlightBackgroundView, "setAutoresizingMask:", 18);
    -[UIView setAutoresizingMask:](v3->highlightView, "setAutoresizingMask:", 18);
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->backgroundView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->highlightBackgroundView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->highlightView, "_setContinuousCornerRadius:", a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->backgroundView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->highlightBackgroundView, "_setContinuousCornerRadius:", a3);
  -[UIView _setContinuousCornerRadius:](self->highlightView, "_setContinuousCornerRadius:", a3);
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UIView layer](self->backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  -[UIView layer](self->highlightBackgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", a3);

  -[UIView layer](self->highlightView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", a3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;

  v3 = a3;
  -[UIView setHidden:](self->backgroundView, "setHidden:");
  v5 = !v3;
  -[UIView setHidden:](self->highlightBackgroundView, "setHidden:", v5);
  -[UIView setHidden:](self->highlightView, "setHidden:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightView, 0);
  objc_storeStrong((id *)&self->highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->backgroundView, 0);
}

@end

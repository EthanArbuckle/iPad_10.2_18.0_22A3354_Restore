@implementation SFMagicHeadPlaceholderView

- (SFMagicHeadPlaceholderView)initWithFrame:(CGRect)a3
{
  SFMagicHeadPlaceholderView *v3;
  SFMagicHeadPlaceholderView *v4;
  void *v5;
  SFMagicHeadCircleView *v6;
  uint64_t v7;
  SFMagicHeadCircleView *backgroundView;
  void *v9;
  void *v10;
  uint64_t v11;
  UIVisualEffectView *backgroundVisualEffectView;
  void *v13;
  id v14;
  uint64_t v15;
  UILabel *label;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIImageView *imageView;
  void *v22;
  uint64_t v23;
  UIVisualEffectView *contentVisualEffectView;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SFMagicHeadPlaceholderView;
  v3 = -[SFMagicHeadPlaceholderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFMagicHeadPlaceholderView setBounds:](v3, "setBounds:", 0.0, 0.0, 128.0, 128.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadPlaceholderView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = [SFMagicHeadCircleView alloc];
    -[SFMagicHeadPlaceholderView bounds](v4, "bounds");
    v7 = -[SFMagicHeadCircleView initWithFrame:](v6, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (SFMagicHeadCircleView *)v7;

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v9, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v10);
    backgroundVisualEffectView = v4->_backgroundVisualEffectView;
    v4->_backgroundVisualEffectView = (UIVisualEffectView *)v11;

    -[UIVisualEffectView contentView](v4->_backgroundVisualEffectView, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_backgroundView);

    -[SFMagicHeadPlaceholderView addSubview:](v4, "addSubview:", v4->_backgroundVisualEffectView);
    v14 = objc_alloc(MEMORY[0x24BEBD708]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v4->_label;
    v4->_label = (UILabel *)v15;

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    SFFontForTextStyleWithAdditionalSymbolicTraits((void *)*MEMORY[0x24BEBE1F0], 32770);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v17);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 2);
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 5, 2, 64.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("arrow.up"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v19);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v20;

    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v9, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v22);
    contentVisualEffectView = v4->_contentVisualEffectView;
    v4->_contentVisualEffectView = (UIVisualEffectView *)v23;

    -[UIVisualEffectView contentView](v4->_contentVisualEffectView, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v4->_label);

    -[UIVisualEffectView contentView](v4->_contentVisualEffectView, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v4->_imageView);

    -[SFMagicHeadPlaceholderView addSubview:](v4, "addSubview:", v4->_contentVisualEffectView);
    -[SFMagicHeadPlaceholderView updateForCurrentState](v4, "updateForCurrentState");

  }
  return v4;
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  CGFloat v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadPlaceholderView;
  -[SFMagicHeadPlaceholderView layoutSubviews](&v6, sel_layoutSubviews);
  -[SFMagicHeadPlaceholderView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_backgroundVisualEffectView, "setFrame:");
  -[UIVisualEffectView bounds](self->_backgroundVisualEffectView, "bounds");
  v8 = CGRectInset(v7, 30.0, 30.0);
  -[SFMagicHeadCircleView setFrame:](self->_backgroundView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  -[SFMagicHeadPlaceholderView bounds](self, "bounds");
  v10 = CGRectInset(v9, 46.0, 65.0);
  -[UIVisualEffectView setFrame:](self->_contentVisualEffectView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  -[UIVisualEffectView bounds](self->_contentVisualEffectView, "bounds");
  MidX = CGRectGetMidX(v11);
  -[UIVisualEffectView bounds](self->_contentVisualEffectView, "bounds");
  MidY = CGRectGetMidY(v12);
  -[UIVisualEffectView bounds](self->_contentVisualEffectView, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:");
  -[SFMagicHeadCircleView frame](self->_backgroundView, "frame");
  v5 = CGRectGetWidth(v13) * 0.5;
  -[SFMagicHeadCircleView frame](self->_backgroundView, "frame");
  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, CGRectGetHeight(v14) * 0.5);
  -[UIImageView setCenter:](self->_imageView, "setCenter:", MidX, MidY);
}

- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5
{
  if (self->_titledTooFarColor != a3 || self->_useRaiseLabel != a4 || self->_useNoUWBCapableLabel != a5)
  {
    self->_titledTooFarColor = a3;
    self->_useRaiseLabel = a4;
    self->_useNoUWBCapableLabel = 0;
    self->_canShowArrow = 1;
    -[SFMagicHeadPlaceholderView updateForCurrentState](self, "updateForCurrentState");
  }
}

- (void)updateForCurrentState
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE901B8], "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "magicHeadSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_titledTooFarColor)
    objc_msgSend(v7, "guidanceTiltedTooFarAlpha");
  else
    v4 = 1.0;
  -[UIVisualEffectView setAlpha:](self->_backgroundVisualEffectView, "setAlpha:", v4);
  if (self->_useRaiseLabel || self->_useNoUWBCapableLabel)
  {
    SFLocalizedStringForKeyInStringsFileNamed();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_label, "setText:", v5);

    -[UILabel setAlpha:](self->_label, "setAlpha:", 1.0);
    v6 = 0.0;
  }
  else
  {
    -[UILabel setText:](self->_label, "setText:", 0);
    -[UILabel setAlpha:](self->_label, "setAlpha:", 0.0);
    v6 = 0.6;
    if (!self->_canShowArrow)
      v6 = 0.0;
  }
  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v6);
  -[SFMagicHeadPlaceholderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAlpha:(double)a3
{
  -[UIVisualEffectView setAlpha:](self->_backgroundVisualEffectView, "setAlpha:");
  -[UIVisualEffectView setAlpha:](self->_contentVisualEffectView, "setAlpha:", a3);
}

- (double)alpha
{
  double result;

  -[UIVisualEffectView alpha](self->_contentVisualEffectView, "alpha");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
}

@end

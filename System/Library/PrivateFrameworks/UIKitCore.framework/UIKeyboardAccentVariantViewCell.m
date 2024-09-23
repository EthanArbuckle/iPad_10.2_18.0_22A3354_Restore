@implementation UIKeyboardAccentVariantViewCell

- (UIKeyboardAccentVariantViewCell)initWithFrame:(CGRect)a3
{
  UIKeyboardAccentVariantViewCell *v3;
  UILabel *v4;
  UILabel *labelView;
  void *v6;
  UIView *v7;
  UIView *backgroundView;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardAccentVariantViewCell;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 4.0, 4.0, 32.0, 32.0);
    labelView = v3->_labelView;
    v3->_labelView = v4;

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_labelView, "setFont:", v6);

    -[UILabel setTextAlignment:](v3->_labelView, "setTextAlignment:", 1);
    v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v7;

    -[UILabel setFrame:](v3->_labelView, "setFrame:", 4.0, 4.0, 32.0, 32.0);
    -[UIView setHidden:](v3->_backgroundView, "setHidden:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v9);

    -[UIView layer](v3->_backgroundView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 20.0);

    -[UIView layer](v3->_backgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 0;
    objc_msgSend(v11, "setOpacity:", v12);

    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[UIView addSubview:](v3, "addSubview:", v3->_labelView);
  }
  return v3;
}

- (NSString)accentedChar
{
  return -[UILabel text](self->_labelView, "text");
}

- (void)setAccentedChar:(id)a3
{
  -[UILabel setText:](self->_labelView, "setText:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self->_backgroundView, "setHidden:", !a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end

@implementation UIKeyboardEmojiVariantDivider

- (UIKeyboardEmojiVariantDivider)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiVariantDivider *v3;
  UIView *v4;
  UIView *backgroundView;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiVariantDivider;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 3.0, 0.0, 1.0, 38.0);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    -[UIView layer](v3->_backgroundView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 6.0);

    +[UIColor separatorColor](UIColor, "separatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v7);

    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
  }
  return v3;
}

- (void)setRenderConfig:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "lightKeyboard"))
    UIKeyboardGetLightCandidateSeparatorColor();
  else
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v4);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 38.0;
  v3 = 7.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

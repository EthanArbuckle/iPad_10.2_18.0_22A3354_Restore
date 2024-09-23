@implementation PKPeerPaymentMessagesButton

+ (CGSize)referenceSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKPeerPaymentMessagesButton)init
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend((id)objc_opt_class(), "referenceSize");
  return -[PKPeerPaymentMessagesButton initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend((id)objc_opt_class(), "referenceSize");
  return -[PKPeerPaymentMessagesButton initWithFrame:usePlatterColor:](self, "initWithFrame:usePlatterColor:", 1, v4, v5, v6, v7);
}

- (PKPeerPaymentMessagesButton)initWithFrame:(CGRect)a3 usePlatterColor:(BOOL)a4
{
  _BOOL4 v4;
  PKPeerPaymentMessagesButton *v5;
  uint64_t v6;
  UIColor *highlightedBackgroundColor;
  uint64_t v8;
  uint64_t v9;
  UIColor *v10;
  UIColor *backgroundColor;
  void *v12;
  objc_super v14;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentMessagesButton;
  v5 = -[PKPeerPaymentMessagesButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    if (v4)
    {
      +[PKPeerPaymentTheme platterPressedColor](PKPeerPaymentTheme, "platterPressedColor");
      v6 = objc_claimAutoreleasedReturnValue();
      highlightedBackgroundColor = v5->_highlightedBackgroundColor;
      v5->_highlightedBackgroundColor = (UIColor *)v6;

      +[PKPeerPaymentTheme platterColor](PKPeerPaymentTheme, "platterColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v5->_highlightedBackgroundColor;
      v5->_highlightedBackgroundColor = (UIColor *)v9;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    }
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

    -[PKPeerPaymentMessagesButton setHighlighted:](v5, "setHighlighted:", 0);
    -[PKPeerPaymentMessagesButton imageView](v5, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentMode:", 1);

  }
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesButton;
  -[PKPeerPaymentMessagesButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 1;
  if (v3)
    v5 = 0;
  -[PKPeerPaymentMessagesButton setBackgroundColor:](self, "setBackgroundColor:", *(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v5]));
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[PKPeerPaymentMessagesButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  double v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  void *v9;
  UIActivityIndicatorView *v10;
  void *v11;

  self->_showsActivityIndicator = a3;
  spinner = self->_spinner;
  if (a3)
  {
    v5 = 0.0;
    if (!spinner)
    {
      v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v7 = self->_spinner;
      self->_spinner = v6;

      v8 = self->_spinner;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v8, "setColor:", v9);

      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
      -[PKPeerPaymentMessagesButton addSubview:](self, "addSubview:", self->_spinner);
    }
  }
  else
  {
    v5 = 1.0;
    if (spinner)
    {
      -[UIActivityIndicatorView removeFromSuperview](spinner, "removeFromSuperview");
      v10 = self->_spinner;
      self->_spinner = 0;

    }
  }
  -[PKPeerPaymentMessagesButton titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v5);

  -[PKPeerPaymentMessagesButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIActivityIndicatorView *spinner;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesButton;
  -[PKPeerPaymentMessagesButton layoutSubviews](&v8, sel_layoutSubviews);
  -[PKPeerPaymentMessagesButton bounds](self, "bounds");
  UIRectGetCenter();
  spinner = self->_spinner;
  if (spinner)
    -[UIActivityIndicatorView setCenter:](spinner, "setCenter:", v3, v4);
  if (self->_imageSize.width != *MEMORY[0x1E0C9D820]
    || self->_imageSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PKPeerPaymentMessagesButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIRectCenteredAboutPoint();
    objc_msgSend(v7, "setFrame:");

  }
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end

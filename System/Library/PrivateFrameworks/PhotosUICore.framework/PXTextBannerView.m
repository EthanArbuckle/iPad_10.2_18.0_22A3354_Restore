@implementation PXTextBannerView

- (PXTextBannerView)initWithFrame:(CGRect)a3
{
  PXTextBannerView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *backgroundView;
  UILabel *v7;
  UILabel *textLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXTextBannerView;
  v3 = -[PXTextBannerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPhotoViewGradient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v5;

    -[PXTextBannerView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v7;

    v9 = v3->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = v3->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v3->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 2);
    -[PXTextBannerView addSubview:](v3, "addSubview:", v3->_textLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTextBannerView setBackgroundColor:](v3, "setBackgroundColor:", v15);

    -[PXTextBannerView _updateSubviews](v3, "_updateSubviews");
  }
  return v3;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *text;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  v9 = v4;
  if (self->_text != v4 || (v6 = -[NSString isEqualToString:](v4, "isEqualToString:", v4), v5 = v9, !v6))
  {
    v7 = (NSString *)-[NSString copy](v5, "copy");
    text = self->_text;
    self->_text = v7;

    -[PXTextBannerView _updateSubviews](self, "_updateSubviews");
    v5 = v9;
  }

}

- (void)setDestructiveText:(BOOL)a3
{
  if (self->_destructiveText != a3)
  {
    self->_destructiveText = a3;
    -[PXTextBannerView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PXTextBannerView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)_updateSubviews
{
  id v3;

  -[UILabel setText:](self->_textLabel, "setText:", self->_text);
  -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", self->_textAlignment);
  if (self->_destructiveText)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:");
  v7 = 5.0;
  if (self->_textAlignment == 1)
    v7 = 0.0;
  v8 = v6 + v7 * 2.0;
  if (width < v8)
    v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGRect v12;
  CGRect v13;

  -[PXTextBannerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
  if (self->_textAlignment == 1)
    v11 = 0.0;
  else
    v11 = 5.0;
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  v13 = CGRectInset(v12, v11, 0.0);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isDestructiveText
{
  return self->_destructiveText;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

@implementation PKPaymentSetupCardImageHeaderView

- (PKPaymentSetupCardImageHeaderView)initWithFrame:(CGRect)a3
{
  PKPaymentSetupCardImageHeaderView *v3;
  PKPaymentSetupCardImageHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupCardImageHeaderView;
  v3 = -[PKPaymentSetupCardImageHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKPaymentSetupCardImageHeaderView _createSubviews](v3, "_createSubviews");
  return v4;
}

- (void)configureWithUIImage:(id)a3 title:(id)a4 subtitle:(id)a5
{
  UIImage *v8;
  NSString *v9;
  NSString *v10;
  UIImage *image;
  UIImage *v12;
  NSString *title;
  NSString *v14;
  NSString *subtitle;
  NSString *v16;

  v8 = (UIImage *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  image = self->_image;
  self->_image = v8;
  v12 = v8;

  title = self->_title;
  self->_title = v9;
  v14 = v9;

  subtitle = self->_subtitle;
  self->_subtitle = v10;
  v16 = v10;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitle);
  -[UIImageView setImage:](self->_passView, "setImage:", self->_image);

  -[PKPaymentSetupCardImageHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)PKPaymentSetupCardImageHeaderView;
  -[PKPaymentSetupCardImageHeaderView layoutSubviews](&v28, sel_layoutSubviews);
  -[PKPaymentSetupCardImageHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v27 = v5;
  -[PKPaymentSetupCardImageHeaderView _leadingPadding](self, "_leadingPadding");
  v8 = v7;
  v9 = v4 + v7 * -2.0;
  -[PKPaymentSetupCardImageHeaderView _imageSize](self, "_imageSize");
  v11 = v10;
  v13 = v12;
  v14 = v8 + v9 * 0.5;
  v15 = v14 - v10 * 0.5;
  -[UIImageView setFrame:](self->_passView, "setFrame:", v15, 20.0, v10, v12);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, v6);
  v17 = v16;
  v19 = v18;
  v20 = v14 - v16 * 0.5;
  v29.origin.y = 20.0;
  v29.origin.x = v15;
  v29.size.width = v11;
  v29.size.height = v13;
  v21 = CGRectGetMaxY(v29) + 20.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v20, v21, v17, v19);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, v27);
  v23 = v22;
  v25 = v24;
  v26 = v14 - v22 * 0.5;
  v30.origin.x = v20;
  v30.origin.y = v21;
  v30.size.width = v17;
  v30.size.height = v19;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v26, CGRectGetMaxY(v30) + 15.0, v23, v25);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPaymentSetupCardImageHeaderView _leadingPadding](self, "_leadingPadding");
  v7 = width + v6 * -2.0;
  -[PKPaymentSetupCardImageHeaderView _imageSize](self, "_imageSize");
  v9 = v8 + 20.0 + 20.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, height);
  v11 = v9 + v10 + 15.0;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v7, height);
  v13 = v11 + v12 + 40.0;
  v14 = v7;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_createSubviews
{
  id v3;
  UIImage *image;
  void *v5;
  UIImageView *v6;
  UIImageView *passView;
  id v8;
  double v9;
  id v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  UILabel *v15;
  UILabel *subtitleLabel;
  id v17;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  image = self->_image;
  v5 = image;
  if (!image)
  {
    PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v5);
  passView = self->_passView;
  self->_passView = v6;

  if (!image)
  -[UIImageView layer](self->_passView, "layer");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowRadius:", 12.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(v17, "setShadowOffset:", 0.0, 12.0);
  LODWORD(v9) = 1.0;
  objc_msgSend(v17, "setShadowOpacity:", v9);
  objc_msgSend(v17, "setMasksToBounds:", 0);
  -[PKPaymentSetupCardImageHeaderView _imageSize](self, "_imageSize");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "CGColor");
  PKPaymentStyleApplyCorners();

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_passView, "setAccessibilityIgnoresInvertColors:", 1);
  -[PKPaymentSetupCardImageHeaderView addSubview:](self, "addSubview:", self->_passView);
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setFont:](self->_titleLabel, "setFont:", v11);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  -[PKPaymentSetupCardImageHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v15;

  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v14);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 0);
  -[PKPaymentSetupCardImageHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);

}

- (double)_leadingPadding
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "directionalLayoutMargins");
  v4 = v3;

  return v4;
}

- (CGSize)_imageSize
{
  unint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = PKUIGetMinScreenWidthType();
  v3 = dbl_19DF14E90[v2 < 4];
  v4 = dbl_19DF14EA0[v2 < 4];
  if (!v2)
  {
    v4 = 81.0;
    v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupCardImageHeaderView;
  -[PKPaymentSetupCardImageHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UIImageView setImage:](self->_passView, "setImage:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

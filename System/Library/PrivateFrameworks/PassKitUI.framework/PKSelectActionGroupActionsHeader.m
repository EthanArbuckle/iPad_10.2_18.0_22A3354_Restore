@implementation PKSelectActionGroupActionsHeader

- (PKSelectActionGroupActionsHeader)initWithPass:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSelectActionGroupActionsHeader *v11;
  PKSelectActionGroupActionsHeader *v12;
  UILabel *v13;
  UILabel *titleLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  NSString *v18;
  void *v19;
  UILabel *v20;
  UILabel *subtitleLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  PKPassView *v26;
  id v27;
  void *v28;
  uint64_t v29;
  UIImageView *imageView;
  uint64_t v31;
  UIActivityIndicatorView *spinner;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKSelectActionGroupActionsHeader;
  v11 = -[PKSelectActionGroupActionsHeader init](&v34, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isTemplateLayout = 0;
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v13;

    v15 = v12->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setText:](v12->_titleLabel, "setText:", v9);
    v17 = v12->_titleLabel;
    v18 = (NSString *)*MEMORY[0x1E0DC48C8];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v19);

    -[UILabel setNumberOfLines:](v12->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](v12->_titleLabel, "sizeToFit");
    -[UILabel setLineBreakMode:](v12->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v12->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTextAlignment:](v12->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setAlpha:](v12->_titleLabel, "setAlpha:", 1.0);
    -[PKSelectActionGroupActionsHeader addSubview:](v12, "addSubview:", v12->_titleLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v12->_subtitleLabel;
    v12->_subtitleLabel = v20;

    -[UILabel setText:](v12->_subtitleLabel, "setText:", v10);
    v22 = v12->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    v24 = v12->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setNumberOfLines:](v12->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel sizeToFit](v12->_subtitleLabel, "sizeToFit");
    -[UILabel setLineBreakMode:](v12->_subtitleLabel, "setLineBreakMode:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v12->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTextAlignment:](v12->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setAlpha:](v12->_subtitleLabel, "setAlpha:", 1.0);
    -[PKSelectActionGroupActionsHeader addSubview:](v12, "addSubview:", v12->_subtitleLabel);
    v26 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", v8, 5);
    v27 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKSelectActionGroupActionsHeader _imageSize](v12, "_imageSize");
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v26, "snapshotOfFrontFaceWithRequestedSize:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithImage:", v28);
    imageView = v12->_imageView;
    v12->_imageView = (UIImageView *)v29;

    -[PKSelectActionGroupActionsHeader addSubview:](v12, "addSubview:", v12->_imageView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v12->_spinner;
    v12->_spinner = (UIActivityIndicatorView *)v31;

    -[UIActivityIndicatorView startAnimating](v12->_spinner, "startAnimating");
    -[UIActivityIndicatorView setAlpha:](v12->_spinner, "setAlpha:", 0.0);
    -[PKSelectActionGroupActionsHeader addSubview:](v12, "addSubview:", v12->_spinner);

  }
  return v12;
}

- (void)setLoading:(BOOL)a3
{
  UIActivityIndicatorView *spinner;
  double v4;

  self->_loading = a3;
  spinner = self->_spinner;
  v4 = 0.0;
  if (a3)
    v4 = 1.0;
  -[UIActivityIndicatorView setAlpha:](spinner, "setAlpha:", v4);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKSelectActionGroupActionsHeader _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSelectActionGroupActionsHeader;
  -[PKSelectActionGroupActionsHeader layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSelectActionGroupActionsHeader bounds](self, "bounds");
  -[PKSelectActionGroupActionsHeader _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  UIActivityIndicatorView *spinner;
  double v21;
  double v22;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  v6 = a3.origin.x + 20.0;
  v7 = a3.origin.y + 0.0;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = a3.origin.x + 20.0;
  remainder.origin.y = a3.origin.y + 0.0;
  v8 = a3.size.width + -40.0;
  remainder.size.width = a3.size.width + -40.0;
  remainder.size.height = a3.size.height;
  -[PKSelectActionGroupActionsHeader _imageSize](self, "_imageSize");
  v10 = v9;
  v12 = v11;
  v26.origin.x = v6;
  v26.origin.y = v7;
  v26.size.width = width + -40.0;
  v26.size.height = height;
  CGRectDivide(v26, &slice, &remainder, 20.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v12, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    v13 = fmin(v10, v8);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", (width - v13) * 0.5, 20.0, v13, v12);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  v15 = v14;
  CGRectDivide(remainder, &slice, &remainder, 20.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  v17 = v16;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  PKFloatRoundToPixel();
  v19 = v18;
  if (!self->_isTemplateLayout)
  {
    spinner = self->_spinner;
    -[UIActivityIndicatorView frame](spinner, "frame");
    PKRectCenteredIntegralRect();
    -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  }
  v21 = width;
  v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

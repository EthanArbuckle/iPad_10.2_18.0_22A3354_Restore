@implementation PKAccountInvitationAccessLevelContentView

- (PKAccountInvitationAccessLevelContentView)initWithConfiguration:(id)a3
{
  id v4;
  PKAccountInvitationAccessLevelContentView *v5;
  PKAccountInvitationAccessLevelContentView *v6;

  v4 = a3;
  v5 = -[PKAccountInvitationAccessLevelContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[PKAccountInvitationAccessLevelContentView _applyConfiguration:](v5, "_applyConfiguration:", v4);

  return v6;
}

- (PKAccountInvitationAccessLevelContentView)initWithFrame:(CGRect)a3
{
  PKAccountInvitationAccessLevelContentView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIImageView *imageView;
  uint64_t v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  uint64_t v17;
  UILabel *subtitleLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  uint64_t v23;
  UILabel *secondarySubtitleLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKAccountInvitationAccessLevelContentView;
  v3 = -[PKAccountInvitationAccessLevelContentView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v9;

    -[PKAccountInvitationAccessLevelContentView addSubview:](v3, "addSubview:", v3->_imageView);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v11;

    v13 = v3->_titleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKAccountInvitationAccessLevelContentView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v17;

    v19 = v3->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    v21 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKAccountInvitationAccessLevelContentView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    secondarySubtitleLabel = v3->_secondarySubtitleLabel;
    v3->_secondarySubtitleLabel = (UILabel *)v23;

    v25 = v3->_secondarySubtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v25, "setFont:", v26);

    v27 = v3->_secondarySubtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](v3->_secondarySubtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_secondarySubtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    -[PKAccountInvitationAccessLevelContentView addSubview:](v3, "addSubview:", v3->_secondarySubtitleLabel);
    -[PKAccountInvitationAccessLevelContentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D677F8]);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountInvitationAccessLevelContentView;
  -[PKAccountInvitationAccessLevelContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKAccountInvitationAccessLevelContentView bounds](self, "bounds");
  -[PKAccountInvitationAccessLevelContentView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKAccountInvitationAccessLevelContentView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKAccountInvitationAccessLevelContentView _applyConfiguration:](self, "_applyConfiguration:", v4);

}

- (void)_applyConfiguration:(id)a3
{
  UIImageView *imageView;
  void *v6;
  UILabel *titleLabel;
  void *v8;
  UILabel *subtitleLabel;
  void *v10;
  UILabel *secondarySubtitleLabel;
  void *v12;
  id v13;

  v13 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    imageView = self->_imageView;
    objc_msgSend(v13, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](imageView, "setImage:", v6);

    titleLabel = self->_titleLabel;
    objc_msgSend(v13, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](titleLabel, "setText:", v8);

    subtitleLabel = self->_subtitleLabel;
    objc_msgSend(v13, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](subtitleLabel, "setText:", v10);

    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    objc_msgSend(v13, "secondarySubtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](secondarySubtitleLabel, "setText:", v12);

    -[PKAccountInvitationAccessLevelContentView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRectEdge v8;
  __int128 v9;
  void *v10;
  UIImageView *imageView;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect remainder;
  CGSize result;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKAccountInvitationAccessLevelContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v24.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  remainder.origin.x = x + 14.0;
  remainder.origin.y = y + 14.0;
  remainder.size.width = width + -28.0;
  remainder.size.height = height + -28.0;
  -[UIImageView image](self->_imageView, "image", *(_OWORD *)&v24.origin, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v27.origin.x = x + 14.0;
    v27.origin.y = y + 14.0;
    v27.size.width = width + -28.0;
    v27.size.height = height + -28.0;
    CGRectDivide(v27, &v24, &remainder, 46.0, v8);
    if (!self->_isTemplateLayout)
    {
      imageView = self->_imageView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](imageView, "setFrame:");
    }
    CGRectDivide(remainder, &v24, &remainder, 10.0, v8);
  }
  else if (!self->_isTemplateLayout)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[UILabel text](self->_titleLabel, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v14 = v13;
    CGRectDivide(remainder, &v24, &remainder, v13, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    v15 = v14 + 0.0;
  }
  else
  {
    v15 = 0.0;
    if (!self->_isTemplateLayout)
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[UILabel text](self->_subtitleLabel, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v18 = v17;
    CGRectDivide(remainder, &v24, &remainder, 5.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v24, &remainder, v18, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    v15 = v15 + v18 + 5.0;
  }
  else if (!self->_isTemplateLayout)
  {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[UILabel text](self->_secondarySubtitleLabel, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondarySubtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v21 = v20;
    CGRectDivide(remainder, &v24, &remainder, 14.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v24, &remainder, v21, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
      -[UILabel setFrame:](self->_secondarySubtitleLabel, "setFrame:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
    v15 = v15 + v21 + 14.0;
  }
  else if (!self->_isTemplateLayout)
  {
    -[UILabel setFrame:](self->_secondarySubtitleLabel, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v22 = CGRectGetWidth(v28);
  v23 = fmax(v15, 46.0) + 28.0;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UIContentConfiguration)configuration
{
  return self->_configuration;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

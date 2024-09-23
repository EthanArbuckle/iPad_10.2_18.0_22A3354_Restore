@implementation PKCollectionHeaderView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCollectionHeaderView;
  -[PKCollectionHeaderView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKCollectionHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width;
  double v6;
  void (**v7)(void *, UIImageView *, double, double);
  __n128 v8;
  __n128 v9;
  double v10;
  __n128 v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[9];
  BOOL v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  double v22;
  CGSize result;

  width = a3.size.width;
  v19 = 0;
  v20 = (double *)&v19;
  v6 = self->_topPadding + 0.0;
  v21 = 0x2020000000;
  v22 = v6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PKCollectionHeaderView__layoutWithBounds_isTemplateLayout___block_invoke;
  v17[3] = &unk_1E3E62848;
  v17[4] = &v19;
  *(double *)&v17[5] = a3.origin.x + 12.0;
  *(double *)&v17[6] = a3.origin.y + 0.0;
  *(double *)&v17[7] = a3.size.width + -24.0;
  v17[8] = *(_QWORD *)&a3.size.height;
  v18 = a4;
  v7 = (void (**)(void *, UIImageView *, double, double))_Block_copy(v17);
  v7[2](v7, self->_imageView, 90.0, 0.0);
  if (self->_imageView)
    v8.n128_f64[0] = 10.0;
  else
    v8.n128_f64[0] = 0.0;
  ((void (*)(void (**)(void *, UIImageView *, double, double), UILabel *, double, __n128))v7[2])(v7, self->_primaryLabel, 0.0, v8);
  v10 = 4.0;
  v11.n128_u64[0] = 0;
  if (self->_primaryLabel)
    v9.n128_f64[0] = 4.0;
  else
    v9.n128_f64[0] = 0.0;
  ((void (*)(void (**)(void *, UIImageView *, double, double), UILabel *, __n128, __n128))v7[2])(v7, self->_secondaryLabel, v11, v9);
  if (!self->_secondaryLabel)
  {
    if (self->_primaryLabel)
      v10 = 4.0;
    else
      v10 = 0.0;
  }
  v7[2](v7, (UIImageView *)self->_tertiaryLabel, 0.0, v10);
  v12 = v20;
  v13 = v20[3] + 0.0;
  v20[3] = v13;
  v14 = v13 + self->_bottomPadding;
  v12[3] = v14;

  _Block_object_dispose(&v19, 8);
  v15 = width;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

void __61__PKCollectionHeaderView__layoutWithBounds_isTemplateLayout___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  double v8;
  id v9;

  v7 = a2;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v7, "frame");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + a4;
    if (a3 <= 0.0)
      objc_msgSend(v9, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    PKRectCenteredXInRect();
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
    v7 = v9;
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v9, "setFrame:");
      v7 = v9;
    }
  }

}

- (double)heightOfHeaderWithoutText
{
  CGRect v3;

  -[UIImageView frame](self->_imageView, "frame");
  return CGRectGetMaxY(v3);
}

- (void)setPrimaryText:(id)a3
{
  id v5;
  NSString **p_primaryText;
  NSString *primaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *primaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  NSString *v19;

  v5 = a3;
  p_primaryText = &self->_primaryText;
  primaryText = self->_primaryText;
  v19 = (NSString *)v5;
  v8 = primaryText;
  if (v8 == v19)
  {

  }
  else
  {
    if (v19 && v8)
    {
      v9 = -[NSString isEqualToString:](v19, "isEqualToString:", v8);

      v10 = v19;
      if (v9)
        goto LABEL_14;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_primaryText, a3);
    v11 = -[NSString length](*p_primaryText, "length");
    primaryLabel = self->_primaryLabel;
    if (v11)
    {
      if (!primaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_primaryLabel;
        self->_primaryLabel = v14;

        v16 = self->_primaryLabel;
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 1);
        -[PKCollectionHeaderView addSubview:](self, "addSubview:", self->_primaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](primaryLabel, "removeFromSuperview");
      v18 = self->_primaryLabel;
      self->_primaryLabel = 0;

    }
    -[UILabel setText:](self->_primaryLabel, "setText:", *p_primaryText);
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v19;
LABEL_14:

}

- (void)setSecondaryText:(id)a3
{
  id v5;
  NSString **p_secondaryText;
  NSString *secondaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *secondaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_secondaryText = &self->_secondaryText;
  secondaryText = self->_secondaryText;
  v21 = (NSString *)v5;
  v8 = secondaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_14;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_secondaryText, a3);
    v11 = -[NSString length](*p_secondaryText, "length");
    secondaryLabel = self->_secondaryLabel;
    if (v11)
    {
      if (!secondaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_secondaryLabel;
        self->_secondaryLabel = v14;

        v16 = self->_secondaryLabel;
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 1);
        v18 = self->_secondaryLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v18, "setTextColor:", v19);

        -[PKCollectionHeaderView addSubview:](self, "addSubview:", self->_secondaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
      v20 = self->_secondaryLabel;
      self->_secondaryLabel = 0;

    }
    -[UILabel setText:](self->_secondaryLabel, "setText:", *p_secondaryText);
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_14:

}

- (void)setTertiaryText:(id)a3
{
  id v5;
  NSString **p_tertiaryText;
  NSString *tertiaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *tertiaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_tertiaryText = &self->_tertiaryText;
  tertiaryText = self->_tertiaryText;
  v21 = (NSString *)v5;
  v8 = tertiaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_14;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_tertiaryText, a3);
    v11 = -[NSString length](*p_tertiaryText, "length");
    tertiaryLabel = self->_tertiaryLabel;
    if (v11)
    {
      if (!tertiaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_tertiaryLabel;
        self->_tertiaryLabel = v14;

        v16 = self->_tertiaryLabel;
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_tertiaryLabel, "setTextAlignment:", 1);
        v18 = self->_tertiaryLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v18, "setTextColor:", v19);

        -[PKCollectionHeaderView addSubview:](self, "addSubview:", self->_tertiaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](tertiaryLabel, "removeFromSuperview");
      v20 = self->_tertiaryLabel;
      self->_tertiaryLabel = 0;

    }
    -[UILabel setText:](self->_tertiaryLabel, "setText:", *p_tertiaryText);
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_14:

}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_topPadding = a3;
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBottomPadding:(double)a3
{
  if (self->_bottomPadding != a3)
  {
    self->_bottomPadding = a3;
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage **p_image;
  UIImageView *imageView;
  id v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;
  UIImage *v12;

  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    imageView = self->_imageView;
    if (*p_image)
    {
      if (!imageView)
      {
        v8 = objc_alloc(MEMORY[0x1E0DC3890]);
        v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v10 = self->_imageView;
        self->_imageView = v9;

        -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
        -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
        -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 12.0);
        -[PKCollectionHeaderView addSubview:](self, "addSubview:", self->_imageView);
      }
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v11 = self->_imageView;
      self->_imageView = 0;

    }
    -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
    -[PKCollectionHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)prepareForReuse
{
  UILabel *primaryLabel;
  NSString *primaryText;
  UILabel *secondaryLabel;
  NSString *secondaryText;
  UILabel *tertiaryLabel;
  NSString *tertiaryText;
  UIImage *image;
  UIImageView *imageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKCollectionHeaderView;
  -[PKCollectionHeaderView prepareForReuse](&v11, sel_prepareForReuse);
  -[UILabel removeFromSuperview](self->_primaryLabel, "removeFromSuperview");
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = 0;

  primaryText = self->_primaryText;
  self->_primaryText = 0;

  -[UILabel removeFromSuperview](self->_secondaryLabel, "removeFromSuperview");
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;

  -[UILabel removeFromSuperview](self->_tertiaryLabel, "removeFromSuperview");
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = 0;

  tertiaryText = self->_tertiaryText;
  self->_tertiaryText = 0;

  self->_topPadding = 0.0;
  self->_bottomPadding = 0.0;
  image = self->_image;
  self->_image = 0;

  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  imageView = self->_imageView;
  self->_imageView = 0;

}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end

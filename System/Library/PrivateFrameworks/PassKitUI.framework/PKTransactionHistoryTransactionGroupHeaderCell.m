@implementation PKTransactionHistoryTransactionGroupHeaderCell

- (PKTransactionHistoryTransactionGroupHeaderCell)initWithFrame:(CGRect)a3
{
  PKTransactionHistoryTransactionGroupHeaderCell *v3;
  PKTransactionHistoryTransactionGroupHeaderCell *v4;
  void *v5;
  UIView *v6;
  UIView *imageBackgroundView;
  UIImageView *v8;
  UIImageView *imageView;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  UILabel *subtitleLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardCollectionViewCell setWantsCustomAppearance:](v3, "setWantsCustomAppearance:", 1);
    -[PKTransactionHistoryTransactionGroupHeaderCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    imageBackgroundView = v4->_imageBackgroundView;
    v4->_imageBackgroundView = v6;

    objc_msgSend(v5, "addSubview:", v4->_imageBackgroundView);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v8;

    -[PKTransactionHistoryTransactionGroupHeaderCell _setupImageView](v4, "_setupImageView");
    objc_msgSend(v5, "addSubview:", v4->_imageView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    v12 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 1);
    v16 = v4->_subtitleLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTransactionHistoryTransactionGroupHeaderCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKTransactionHistoryTransactionGroupHeaderCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL4 v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UILabel *titleLabel;
  void **v25;
  void *v26;
  CGFloat v27;
  UILabel *v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  UILabel *subtitleLabel;
  CGFloat v36;
  double MaxY;
  double v38;
  CGRect v39;
  CGRect remainder;
  CGSize result;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKTransactionHistoryTransactionGroupHeaderCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UILabel text](self->_subtitleLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {

    memset(&v39, 0, sizeof(v39));
    v9 = 1;
    v10 = -18.0;
    v11 = 18.0;
  }
  else
  {
    -[UIImageView image](self->_imageView, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v39, 0, sizeof(v39));
    v10 = -18.0;
    v11 = 18.0;
    if (!v12)
    {
      v11 = 5.0;
      v10 = -5.0;
    }
    v9 = v12 != 0;
  }
  v13 = y + v11;
  v14 = height + v10;
  remainder.origin.x = x + 18.0;
  remainder.origin.y = y + v11;
  remainder.size.width = width + -36.0;
  remainder.size.height = height + v10;
  -[UIImageView image](self->_imageView, "image", *(_OWORD *)&v39.origin, *(_OWORD *)&v39.size);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v42.origin.x = x + 18.0;
    v42.origin.y = v13;
    v42.size.width = width + -36.0;
    v42.size.height = v14;
    CGRectDivide(v42, &v39, &remainder, 100.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      PKSizeAlignedInRect();
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
      -[UIView setFrame:](self->_imageBackgroundView, "setFrame:", v17, v19, v21, v23);
    }
    CGRectDivide(remainder, &v39, &remainder, 18.0, CGRectMinYEdge);
  }
  titleLabel = self->_titleLabel;
  v25 = (void **)MEMORY[0x1E0DC4B48];
  if (v9)
    v25 = (void **)MEMORY[0x1E0DC4B50];
  PKFontForDefaultDesign(*v25, (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v26);

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v39, &remainder, v27, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    v28 = self->_titleLabel;
    if (!v9)
      PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v28, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v30 = remainder.size.width;
  if (v29 > 0.0)
  {
    v31 = v29;
    v32 = remainder.origin.x;
    v33 = remainder.origin.y;
    v34 = remainder.size.height;
    CGRectDivide(*(CGRect *)(&v30 - 2), &v39, &remainder, 3.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v39, &remainder, v31, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      subtitleLabel = self->_subtitleLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](subtitleLabel, "setFrame:");
    }
  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v36 = CGRectGetWidth(v43);
  MaxY = CGRectGetMaxY(v39);
  v38 = v36;
  result.height = MaxY;
  result.width = v38;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKTransactionHistoryTransactionGroupHeaderCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKTransactionHistoryTransactionGroupHeaderCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PKTransactionHistoryTransactionGroupHeaderCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __79__PKTransactionHistoryTransactionGroupHeaderCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  -[PKTransactionHistoryTransactionGroupHeaderCell _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKTransactionHistoryTransactionGroupHeaderCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[PKTransactionHistoryTransactionGroupHeaderCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
  -[PKTransactionHistoryTransactionGroupHeaderCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUseShadows:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  float v6;
  double v7;
  id v8;

  if (((!self->_useShadows ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_useShadows = a3;
    -[UIView layer](self->_imageBackgroundView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v5 = 0.0;
    if (v3)
    {
      v5 = 20.0;
      v6 = 0.15;
    }
    else
    {
      v6 = 0.0;
    }
    objc_msgSend(v4, "setShadowRadius:", v5);
    *(float *)&v7 = v6;
    objc_msgSend(v8, "setShadowOpacity:", v7);

  }
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_image;
  UIImageView *imageView;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  uint64_t v13;
  void *v14;
  UIImageView *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  UIImageView *v19;
  UIImageView *v20;
  UIImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  UIImageView *v28;
  _QWORD v29[5];
  UIImageView *v30;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    imageView = self->_imageView;
    if (!*p_image)
    {
      -[UIImageView superview](imageView, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

      }
      else
      {
        -[UIView superview](self->_imageBackgroundView, "superview");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
          goto LABEL_21;
      }
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_imageBackgroundView, "removeFromSuperview");
      -[PKTransactionHistoryTransactionGroupHeaderCell setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_21;
    }
    if (imageView)
    {
      if (v4)
      {
        v10 = imageView;
        v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
        v12 = self->_imageView;
        self->_imageView = v11;

        -[PKTransactionHistoryTransactionGroupHeaderCell _setupImageView](self, "_setupImageView");
        -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
        -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
        v13 = MEMORY[0x1E0C809B0];
        v14 = (void *)MEMORY[0x1E0DC3F10];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke;
        v29[3] = &unk_1E3E61388;
        v29[4] = self;
        v30 = v10;
        v27[0] = v13;
        v27[1] = 3221225472;
        v27[2] = __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke_2;
        v27[3] = &unk_1E3E62288;
        v28 = v30;
        v15 = v30;
        objc_msgSend(v14, "pkui_animateUsingOptions:animations:completion:", 4, v29, v27);

      }
      else
      {
        -[UIImageView image](imageView, "image");
        v15 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](self->_imageView, "setImage:", *p_image);
        -[UIImageView image](self->_imageView, "image");
        v19 = (UIImageView *)objc_claimAutoreleasedReturnValue();

        if (v19 == v15)
        {
          -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
          v20 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
          v21 = self->_imageView;
          self->_imageView = v20;

          -[PKTransactionHistoryTransactionGroupHeaderCell _setupImageView](self, "_setupImageView");
        }
      }

    }
    else
    {
      v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *p_image);
      v18 = self->_imageView;
      self->_imageView = v17;

      -[PKTransactionHistoryTransactionGroupHeaderCell _setupImageView](self, "_setupImageView");
    }
    -[UIImageView superview](self->_imageView, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      -[PKTransactionHistoryTransactionGroupHeaderCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", self->_imageView);

    }
    -[UIView superview](self->_imageBackgroundView, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      -[PKTransactionHistoryTransactionGroupHeaderCell contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertSubview:below:", self->_imageBackgroundView, self->_imageView);

LABEL_18:
      -[PKTransactionHistoryTransactionGroupHeaderCell setNeedsLayout](self, "setNeedsLayout");
      -[PKTransactionHistoryTransactionGroupHeaderCell layoutIfNeeded](self, "layoutIfNeeded");
      goto LABEL_21;
    }
    if (!v22)
      goto LABEL_18;
  }
LABEL_21:

}

uint64_t __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_setupImageView
{
  void *v3;
  double v4;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 8.0);
  -[UIImageView layer](self->_imageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_strokeImage)
    v4 = PKUIPixelLength();
  else
    v4 = 0.0;
  objc_msgSend(v3, "setBorderWidth:", v4);

  -[PKTransactionHistoryTransactionGroupHeaderCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
  -[UIView _setContinuousCornerRadius:](self->_imageBackgroundView, "_setContinuousCornerRadius:", 8.0);
}

- (void)setStrokeImage:(BOOL)a3
{
  UIImageView *imageView;
  double v5;
  id v6;

  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    imageView = self->_imageView;
    if (imageView)
    {
      -[UIImageView layer](imageView, "layer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (self->_strokeImage)
        v5 = PKUIPixelLength();
      else
        v5 = 0.0;
      objc_msgSend(v6, "setBorderWidth:", v5);

    }
  }
}

- (BOOL)useShadows
{
  return self->_useShadows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

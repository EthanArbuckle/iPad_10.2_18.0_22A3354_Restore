@implementation PKDataReleaseMerchantCell

- (PKDataReleaseMerchantCell)initWithReuseIdentifier:(id)a3
{
  PKDataReleaseMerchantCell *v3;
  void *v4;
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
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKDataReleaseMerchantCell;
  v3 = -[PKDataReleaseMerchantCell initWithReuseIdentifier:](&v17, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDataReleaseMerchantCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v4);
    -[PKDataReleaseMerchantCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    imageBackgroundView = v3->_imageBackgroundView;
    v3->_imageBackgroundView = v6;

    objc_msgSend(v5, "addSubview:", v3->_imageBackgroundView);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    -[PKDataReleaseMerchantCell _setupImageView](v3, "_setupImageView");
    objc_msgSend(v5, "addSubview:", v3->_imageView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    v12 = v3->_titleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC4938], 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v14 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    objc_msgSend(v5, "addSubview:", v3->_titleLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseMerchantCell;
  -[PKDataReleaseMerchantCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKDataReleaseMerchantCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKDataReleaseMerchantCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSString *v21;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v23;
  CGFloat v24;
  UILabel *titleLabel;
  CGFloat v26;
  double MaxY;
  double v28;
  CGRect v29;
  CGRect remainder;
  CGSize result;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  memset(&v29, 0, sizeof(v29));
  v8 = a3.origin.x + 16.0;
  v9 = a3.origin.y + 0.0;
  v10 = a3.size.width + -32.0;
  remainder.origin.x = a3.origin.x + 16.0;
  remainder.origin.y = a3.origin.y + 0.0;
  remainder.size.width = a3.size.width + -32.0;
  remainder.size.height = a3.size.height;
  -[UIImageView image](self->_imageView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v32.origin.x = v8;
    v32.origin.y = v9;
    v32.size.width = v10;
    v32.size.height = height;
    CGRectDivide(v32, &v29, &remainder, 54.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      PKSizeAlignedInRect();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
      -[UIView setFrame:](self->_imageBackgroundView, "setFrame:", v13, v15, v17, v19);
    }
    CGRectDivide(remainder, &v29, &remainder, 10.0, CGRectMinYEdge);
  }
  -[PKDataReleaseMerchantCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredContentSizeCategory");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

  if (IsAccessibilityCategory)
    v23 = 0;
  else
    v23 = 2;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v23);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v29, &remainder, v24, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  CGRectDivide(remainder, &v29, &remainder, 29.0, CGRectMinYEdge);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v26 = CGRectGetWidth(v33);
  MaxY = CGRectGetMaxY(v29);
  v28 = v26;
  result.height = MaxY;
  result.width = v28;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PKDataReleaseMerchantCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");

  self->_isTemplateLayout = 1;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  PKFloatRoundToPixel();
  -[PKDataReleaseMerchantCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v6, v7, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKDataReleaseMerchantCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PKDataReleaseMerchantCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __58__PKDataReleaseMerchantCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseMerchantCell;
  -[PKDataReleaseMerchantCell _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKDataReleaseMerchantCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[PKDataReleaseMerchantCell setNeedsLayout](self, "setNeedsLayout");
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
  id v6;
  id v7;
  UIImageView *imageView;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;
  uint64_t v12;
  void *v13;
  UIImageView *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  UIImageView *v24;
  _QWORD v25[5];
  UIImageView *v26;

  v4 = a4;
  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    imageView = self->_imageView;
    if (!v6)
    {
      -[UIImageView superview](imageView, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

      }
      else
      {
        -[UIView superview](self->_imageBackgroundView, "superview");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_19;
      }
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
      -[UIView removeFromSuperview](self->_imageBackgroundView, "removeFromSuperview");
      -[PKDataReleaseMerchantCell setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_19;
    }
    if (imageView)
    {
      if (v4)
      {
        v9 = imageView;
        v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
        v11 = self->_imageView;
        self->_imageView = v10;

        -[PKDataReleaseMerchantCell _setupImageView](self, "_setupImageView");
        -[UIImageView setImage:](self->_imageView, "setImage:", v6);
        -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
        v12 = MEMORY[0x1E0C809B0];
        v13 = (void *)MEMORY[0x1E0DC3F10];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke;
        v25[3] = &unk_1E3E61388;
        v25[4] = self;
        v26 = v9;
        v23[0] = v12;
        v23[1] = 3221225472;
        v23[2] = __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke_2;
        v23[3] = &unk_1E3E62288;
        v24 = v26;
        v14 = v26;
        objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v25, v23);

      }
      else
      {
        -[UIImageView setImage:](imageView, "setImage:", v6);
      }
    }
    else
    {
      v16 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      v17 = self->_imageView;
      self->_imageView = v16;

      -[PKDataReleaseMerchantCell _setupImageView](self, "_setupImageView");
    }
    -[UIImageView superview](self->_imageView, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[PKDataReleaseMerchantCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_imageView);

    }
    -[UIView superview](self->_imageBackgroundView, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[PKDataReleaseMerchantCell contentView](self, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "insertSubview:below:", self->_imageBackgroundView, self->_imageView);

LABEL_16:
      -[PKDataReleaseMerchantCell setNeedsLayout](self, "setNeedsLayout");
      -[PKDataReleaseMerchantCell layoutIfNeeded](self, "layoutIfNeeded");
      goto LABEL_19;
    }
    if (!v18)
      goto LABEL_16;
  }
LABEL_19:

}

uint64_t __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_setupImageView
{
  UIImageView *imageView;
  void *v4;
  void *v5;
  double v6;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  imageView = self->_imageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](imageView, "setTintColor:", v4);

  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 12.0);
  -[UIImageView layer](self->_imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_strokeImage)
    v6 = PKUIPixelLength();
  else
    v6 = 0.0;
  objc_msgSend(v5, "setBorderWidth:", v6);

  -[PKDataReleaseMerchantCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
  -[UIView _setContinuousCornerRadius:](self->_imageBackgroundView, "_setContinuousCornerRadius:", 12.0);
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

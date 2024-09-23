@implementation PKBillPaymentCircularView

- (PKBillPaymentCircularView)init
{
  PKBillPaymentCircularView *v2;
  UIView *v3;
  UIView *primaryView;
  UIView *v5;
  UIView *secondaryView;
  UIImageView *v7;
  UIImageView *imageView;
  UIColor *v9;
  UIColor *secondaryColor;
  void *v11;
  id v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKBillPaymentCircularView;
  v2 = -[PKBillPaymentCircularView init](&v15, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    primaryView = v2->_primaryView;
    v2->_primaryView = v3;

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    secondaryView = v2->_secondaryView;
    v2->_secondaryView = v5;

    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v2->_imageView;
    v2->_imageView = v7;

    -[PKBillPaymentCircularView _defaultSecondaryColor](v2, "_defaultSecondaryColor");
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    secondaryColor = v2->_secondaryColor;
    v2->_secondaryColor = v9;

    objc_storeStrong((id *)&v2->_primaryColor, v9);
    -[PKBillPaymentCircularView addSubview:](v2, "addSubview:", v2->_secondaryView);
    -[PKBillPaymentCircularView addSubview:](v2, "addSubview:", v2->_primaryView);
    -[PKBillPaymentCircularView addSubview:](v2, "addSubview:", v2->_imageView);
    -[PKBillPaymentCircularView layer](v2, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setShadowColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(v11, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v11, "setShadowRadius:", 4.0);
    LODWORD(v13) = 0.25;
    objc_msgSend(v11, "setShadowOpacity:", v13);
    __33__PKBillPaymentCircularView_init__block_invoke(v2->_primaryView);
    __33__PKBillPaymentCircularView_init__block_invoke(v2->_secondaryView);
    -[PKBillPaymentCircularView _updateColors](v2, "_updateColors");

  }
  return v2;
}

void __33__PKBillPaymentCircularView_init__block_invoke(void *a1)
{
  id v1;

  if (a1)
  {
    objc_msgSend(a1, "layer");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setMasksToBounds:", 1);
    objc_msgSend(v1, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);

  }
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
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIImage *image;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;

  v31.receiver = self;
  v31.super_class = (Class)PKBillPaymentCircularView;
  -[PKBillPaymentCircularView layoutSubviews](&v31, sel_layoutSubviews);
  -[PKBillPaymentCircularView bounds](self, "bounds");
  PKSizeAlignedInRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = PKUIGetMinScreenWidthType();
  v12 = 3.5;
  if (!v11)
    v12 = 3.0;
  v13 = v4 + v12;
  v14 = v6 + v12;
  v15 = 7.0;
  if (!v11)
    v15 = 6.0;
  v16 = v8 - v15;
  v17 = v10 - v15;
  image = self->_image;
  if (image)
    -[UIImage size](image, "size");
  PKSizeAlignedInRect();
  v29 = v20;
  v30 = v19;
  v27 = v22;
  v28 = v21;
  -[UIView setFrame:](self->_primaryView, "setFrame:", v13, v14, v16, v17);
  -[UIView layer](self->_primaryView, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", v16 * 0.5);

  -[UIView setFrame:](self->_secondaryView, "setFrame:", v4, v6, v8, v10);
  -[UIView layer](self->_secondaryView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v8 * 0.5);

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v30, v29, v28, v27);
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  if (!CGRectEqualToRect(self->_shadowFrame, v32))
  {
    self->_shadowFrame.origin.x = v4;
    self->_shadowFrame.origin.y = v6;
    self->_shadowFrame.size.width = v8;
    self->_shadowFrame.size.height = v10;
    -[PKBillPaymentCircularView layer](self, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v25, "setShadowPath:", objc_msgSend(v26, "CGPath"));

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = fmin(a3.width, a3.height);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImage:(id)a3
{
  -[PKBillPaymentCircularView setImage:applyColor:](self, "setImage:applyColor:", a3, 0);
}

- (void)setImage:(id)a3 applyColor:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage *v8;
  UIColor *primaryColor;
  UIImage *v10;
  UIImage *v11;
  _QWORD v12[5];

  v4 = a4;
  v7 = (UIImage *)a3;
  v8 = v7;
  if (self->_image != v7)
  {
    if (v4)
    {
      primaryColor = self->_primaryColor;
      if (!primaryColor)
        primaryColor = self->_secondaryColor;
      -[UIImage _flatImageWithColor:](v7, "_flatImageWithColor:", primaryColor);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v7;
    }
    v11 = v10;
    objc_storeStrong((id *)&self->_image, a3);
    -[PKBillPaymentCircularView setNeedsLayout](self, "setNeedsLayout");
    if (self->_image)
      -[UIImageView setImage:](self->_imageView, "setImage:", v11);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PKBillPaymentCircularView_setImage_applyColor___block_invoke;
    v12[3] = &unk_1E3E612E8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:delay:animations:completion:", 0, v12, 0, 0.0);

  }
}

uint64_t __49__PKBillPaymentCircularView_setImage_applyColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateColors
{
  UIView *primaryView;
  UIColor *primaryColor;

  primaryView = self->_primaryView;
  primaryColor = self->_primaryColor;
  if (!primaryColor)
    primaryColor = self->_secondaryColor;
  -[UIView setBackgroundColor:](primaryView, "setBackgroundColor:", primaryColor);
  -[UIView setBackgroundColor:](self->_secondaryView, "setBackgroundColor:", self->_secondaryColor);
}

- (UIColor)primaryColor
{
  return -[UIView backgroundColor](self->_primaryView, "backgroundColor");
}

- (void)setPrimaryColor:(id)a3
{
  UIColor *v4;
  UIColor *primaryColor;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    primaryColor = self->_primaryColor;
    self->_primaryColor = v4;

    -[PKBillPaymentCircularView _updateColors](self, "_updateColors");
  }

}

- (void)setSecondaryColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *secondaryColor;
  id v7;

  v4 = a3;
  if (!v4)
  {
    -[PKBillPaymentCircularView _defaultSecondaryColor](self, "_defaultSecondaryColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    v5 = (UIColor *)objc_msgSend(v7, "copy");
    secondaryColor = self->_secondaryColor;
    self->_secondaryColor = v5;

    -[PKBillPaymentCircularView _updateColors](self, "_updateColors");
  }

}

- (id)_defaultSecondaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

@end

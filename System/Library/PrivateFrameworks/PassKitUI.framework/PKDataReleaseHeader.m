@implementation PKDataReleaseHeader

- (double)backgroundViewAlpha
{
  double result;

  -[UIVisualEffectView alpha](self->_headerMaterial, "alpha");
  return result;
}

- (void)setBackgroundViewAlpha:(double)a3
{
  -[UIVisualEffectView setAlpha:](self->_headerMaterial, "setAlpha:");
  -[UIView setAlpha:](self->_separator, "setAlpha:", a3);
}

- (PKDataReleaseHeader)initWithDelegate:(id)a3
{
  id v4;
  PKDataReleaseHeader *v5;
  PKDataReleaseHeader *v6;
  void *v7;
  uint64_t v8;
  UIVisualEffectView *headerMaterial;
  UIImageView *v10;
  UIImageView *logo;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  void *v17;
  UILabel *v18;
  UILabel *label;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  uint64_t v26;
  UIButton *dismissButton;
  UIView *v28;
  UIView *separator;
  UIView *v30;
  void *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKDataReleaseHeader;
  v5 = -[PKDataReleaseHeader init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
    headerMaterial = v6->_headerMaterial;
    v6->_headerMaterial = (UIVisualEffectView *)v8;

    -[PKDataReleaseHeader addSubview:](v6, "addSubview:", v6->_headerMaterial);
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    logo = v6->_logo;
    v6->_logo = v10;

    -[UIImageView setContentMode:](v6->_logo, "setContentMode:", 1);
    -[UIImageView _setContinuousCornerRadius:](v6->_logo, "_setContinuousCornerRadius:", 4.0);
    -[UIImageView layer](v6->_logo, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    -[UIImageView layer](v6->_logo, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", PKUIPixelLength());

    -[UIImageView layer](v6->_logo, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 1);

    v16 = v6->_logo;
    PKUIImageNamed(CFSTR("IdentityPhysicalPresentmentLogo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v16, "setImage:", v17);

    -[PKDataReleaseHeader addSubview:](v6, "addSubview:", v6->_logo);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v6->_label;
    v6->_label = v18;

    v20 = v6->_label;
    PKLocalizedString(CFSTR("WALLET"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v20, "setText:", v21);

    v22 = v6->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    v24 = v6->_label;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[PKDataReleaseHeader addSubview:](v6, "addSubview:", v6->_label);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
    v26 = objc_claimAutoreleasedReturnValue();
    dismissButton = v6->_dismissButton;
    v6->_dismissButton = (UIButton *)v26;

    -[UIButton addTarget:action:forControlEvents:](v6->_dismissButton, "addTarget:action:forControlEvents:", v6, sel__dismiss, 0x2000);
    -[PKDataReleaseHeader addSubview:](v6, "addSubview:", v6->_dismissButton);
    v28 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separator = v6->_separator;
    v6->_separator = v28;

    v30 = v6->_separator;
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    -[UIView setClipsToBounds:](v6->_separator, "setClipsToBounds:", 0);
    -[PKDataReleaseHeader addSubview:](v6, "addSubview:", v6->_separator);

  }
  return v6;
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  UIImageView *logo;
  UILabel *label;
  double v18;
  double v19;
  void *v20;
  void *v21;
  UIButton *dismissButton;
  CGRect v23;
  CGRect slice;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)PKDataReleaseHeader;
  -[PKDataReleaseHeader layoutSubviews](&v25, sel_layoutSubviews);
  memset(&slice, 0, sizeof(slice));
  -[PKDataReleaseHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v23.origin.x = v3;
  v23.origin.y = v5;
  v23.size.width = v7;
  v23.size.height = v9;
  -[UIVisualEffectView setFrame:](self->_headerMaterial, "setFrame:");
  v11 = PKUIPixelLength();
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  CGRectDivide(v26, &slice, &v23, v11, CGRectMaxYEdge);
  -[UIView setFrame:](self->_separator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  if (-[PKDataReleaseHeader _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v12 = 2;
  else
    v12 = 0x200000000;
  CGRectDivide(v23, &slice, &v23, 20.0, (CGRectEdge)v12);
  CGRectDivide(v23, &slice, &v23, 20.0, HIDWORD(v12));
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v23.size.width, v23.size.height);
  v14 = v13;
  CGRectDivide(v23, &slice, &v23, v15, (CGRectEdge)v12);
  logo = self->_logo;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](logo, "setFrame:");
  CGRectDivide(v23, &slice, &v23, 5.0, (CGRectEdge)v12);
  CGRectDivide(v23, &slice, &v23, v14, (CGRectEdge)v12);
  label = self->_label;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](label, "setFrame:");
  -[UIButton sizeToFit](self->_dismissButton, "sizeToFit");
  -[UIButton bounds](self->_dismissButton, "bounds");
  v19 = v18;
  -[UIButton configuration](self->_dismissButton, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "background");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v19 * 0.5);

  CGRectDivide(v23, &slice, &v23, v19, HIDWORD(v12));
  dismissButton = self->_dismissButton;
  PKSizeAlignedInRect();
  -[UIButton setFrame:](dismissButton, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[UIButton sizeThatFits:](self->_dismissButton, "sizeThatFits:", a3.width, a3.height);
  v6 = v5;
  -[UILabel font](self->_label, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  if (v8 > v6)
  {
    -[UILabel font](self->_label, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    v6 = v10;

  }
  v11 = width;
  v12 = v6 + 40.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_dismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataReleaseHeaderDidTapDismiss");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseHeader;
  v4 = a3;
  -[PKDataReleaseHeader traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKDataReleaseHeader traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    -[UIImageView layer](self->_logo, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_headerMaterial, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

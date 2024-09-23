@implementation PKDashboardMessageActionView

- (PKDashboardMessageActionView)initWithSize:(CGSize)a3
{
  return -[PKDashboardMessageActionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (PKDashboardMessageActionView)initWithFrame:(CGRect)a3
{
  PKDashboardMessageActionView *v3;
  PKDashboardMessageActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardMessageActionView;
  v3 = -[PKDashboardMessageActionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKDashboardMessageActionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinnerView;
  id v5;
  void *v6;
  UIImageView *v7;
  UIImageView *disclosureView;
  UIImageView *v9;
  void *v10;

  self->_smallDevice = PKUIGetMinScreenWidthType() == 0;
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 1);
  -[PKDashboardMessageActionView addSubview:](self, "addSubview:", self->_spinnerView);
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  PKUIChevronImage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v6);
  disclosureView = self->_disclosureView;
  self->_disclosureView = v7;

  v9 = self->_disclosureView;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v9, "setTintColor:", v10);

  -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 1);
  -[PKDashboardMessageActionView addSubview:](self, "addSubview:", self->_disclosureView);
  -[PKDashboardMessageActionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *titleText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  titleText = self->_titleText;
  v9 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKDashboardMessageActionView _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setTitleFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[PKDashboardMessageActionView _configureView](self, "_configureView");
  }

}

- (void)setTitleTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[PKDashboardMessageActionView _configureView](self, "_configureView");
  }

}

- (void)setAccessory:(unint64_t)a3
{
  UIImageView *disclosureView;
  uint64_t v5;

  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    switch(a3)
    {
      case 2uLL:
        -[UIImageView setHidden:](self->_disclosureView, "setHidden:", 1);
        -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 0);
        -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
        return;
      case 1uLL:
        disclosureView = self->_disclosureView;
        v5 = 0;
        goto LABEL_9;
      case 0uLL:
        disclosureView = self->_disclosureView;
        v5 = 1;
LABEL_9:
        -[UIImageView setHidden:](disclosureView, "setHidden:", v5);
        -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 1);
        break;
    }
  }
}

- (void)updateWithMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "buttonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageActionView setTitleText:](self, "setTitleText:", v4);

  if ((objc_msgSend(v7, "isDestructiveAction") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageActionView setTitleTextColor:](self, "setTitleTextColor:", v5);

  if ((objc_msgSend(v7, "showSpinner") & 1) != 0)
    v6 = 2;
  else
    v6 = objc_msgSend(v7, "showDisclosure");
  -[PKDashboardMessageActionView setAccessory:](self, "setAccessory:", v6);
  -[PKDashboardMessageActionView _updateFonts](self, "_updateFonts");
  -[PKDashboardMessageActionView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSmallDevice:(BOOL)a3
{
  self->_smallDevice = a3;
  -[PKDashboardMessageActionView _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  void **v3;
  id v4;

  if (self->_smallDevice)
    v3 = (void **)MEMORY[0x1E0DC4A90];
  else
    v3 = (void **)MEMORY[0x1E0DC4A88];
  PKFontForDefaultDesign(*v3, (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMessageActionView setTitleFont:](self, "setTitleFont:", v4);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageActionView;
  -[PKDashboardMessageActionView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDashboardMessageActionView bounds](self, "bounds");
  -[PKDashboardMessageActionView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKDashboardMessageActionView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  CGRectEdge v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  CGRectEdge v22;
  CGSize v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGSize v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat width;
  double v56;
  CGRect slice;
  CGRect remainder;
  CGRect v59;
  CGSize result;

  v6 = a3.origin.x + 13.0;
  v7 = a3.origin.y + 11.0;
  width = a3.size.width;
  v8 = a3.size.width + -24.0;
  memset(&v59, 0, sizeof(v59));
  remainder.origin.x = a3.origin.x + 13.0;
  remainder.origin.y = a3.origin.y + 11.0;
  v9 = a3.size.height + -22.0;
  remainder.size.width = a3.size.width + -24.0;
  remainder.size.height = a3.size.height + -22.0;
  v10 = -[PKDashboardMessageActionView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = CGRectMaxXEdge;
  else
    v11 = CGRectMinXEdge;
  -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v8, 3.40282347e38);
  v13 = v12;
  v15 = v14;
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", v8, 3.40282347e38);
  v17 = fmax(v13, v16);
  v19 = fmax(v15, v18);
  v20 = MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v56 = *MEMORY[0x1E0C9D648];
  if (v17 <= 0.0)
  {
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v53 = v39;
    v54 = v41;
    v51 = *MEMORY[0x1E0C9D648];
    v52 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = v19;
  }
  else
  {
    if (v10)
      v22 = CGRectMinXEdge;
    else
      v22 = CGRectMaxXEdge;
    v50 = v19;
    v23 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v23;
    v24 = v6;
    v23.width = v7;
    v25 = v8;
    v26 = v9;
    CGRectDivide(*(CGRect *)((char *)&v23 - 8), &slice, &remainder, v17, v22);
    CGRectDivide(remainder, &v59, &remainder, 11.0, v22);
    PKContentAlignmentMake();
    v27 = v50;
    PKSizeAlignedInRect();
    slice.origin.x = v28;
    slice.origin.y = v29;
    slice.size.width = v30;
    slice.size.height = v31;
    PKRectCenteredIntegralRect();
    v51 = v32;
    v52 = v33;
    v53 = v34;
    v54 = v35;
    PKRectCenteredIntegralRect();
    v56 = v36;
    v21 = v37;
    v39 = v38;
    v41 = v40;
    v8 = remainder.size.width;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v8, 3.40282347e38, *(_QWORD *)&v50);
  v43 = *(CGSize *)(v20 + 16);
  slice.origin = *(CGPoint *)v20;
  slice.size = v43;
  if (v42 > 0.0)
  {
    CGRectDivide(remainder, &slice, &remainder, v42, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v44;
    slice.origin.y = v45;
    slice.size.width = v46;
    slice.size.height = v47;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v56, v21, v39, v41);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v51, v52, v53, v54);
  }
  v48 = fmax(slice.size.height, v27) + 22.0;
  v49 = width;
  result.height = v48;
  result.width = v49;
  return result;
}

- (void)_configureView
{
  NSString *titleText;
  UILabel *titleLabel;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;

  titleText = self->_titleText;
  titleLabel = self->_titleLabel;
  if (titleText)
  {
    if (!titleLabel)
    {
      v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v6 = self->_titleLabel;
      self->_titleLabel = v5;

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[PKDashboardMessageActionView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setFont:](titleLabel, "setFont:", self->_titleFont);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", self->_titleTextColor);
    -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  }
  else
  {
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    v7 = self->_titleLabel;
    self->_titleLabel = 0;

  }
  -[PKDashboardMessageActionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  UILabel *titleLabel;
  NSString *titleText;
  UIFont *titleFont;
  UIColor *titleTextColor;

  -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  titleText = self->_titleText;
  self->_titleText = 0;

  titleFont = self->_titleFont;
  self->_titleFont = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  -[PKDashboardMessageActionView setAccessory:](self, "setAccessory:", 0);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (BOOL)smallDevice
{
  return self->_smallDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

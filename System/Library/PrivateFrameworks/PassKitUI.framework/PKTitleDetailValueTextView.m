@implementation PKTitleDetailValueTextView

- (PKTitleDetailValueTextView)init
{
  return -[PKTitleDetailValueTextView initWithSize:](self, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PKTitleDetailValueTextView)initWithSize:(CGSize)a3
{
  return -[PKTitleDetailValueTextView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKTitleDetailValueTextView)initWithFrame:(CGRect)a3
{
  PKTitleDetailValueTextView *v3;
  PKTitleDetailValueTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTitleDetailValueTextView;
  v3 = -[PKTitleDetailValueTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKTitleDetailValueTextView _useDefaultFont](v3, "_useDefaultFont");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTitleDetailValueTextView;
  -[PKTitleDetailValueTextView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKTitleDetailValueTextView bounds](self, "bounds");
  -[PKTitleDetailValueTextView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKTitleDetailValueTextView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int v10;
  CGRectEdge v11;
  CGRectEdge v12;
  UIView *accessoryView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGPoint v34;
  CGSize v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  BOOL v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  CGSize v91;
  CGPoint v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect slice;
  CGRect remainder;
  CGRect v100;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[PKTitleDetailValueTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = CGRectMaxXEdge;
  else
    v11 = CGRectMinXEdge;
  if (v10)
    v12 = CGRectMinXEdge;
  else
    v12 = CGRectMaxXEdge;
  v88 = x;
  v89 = y;
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_amountText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", width, height);
    v19 = v18;
    v90 = v20;
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D820];
    v90 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_primaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", width, height);
    v23 = v22;
  }
  else
  {
    v23 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v24 = height;
  memset(&v100, 0, sizeof(v100));
  v25 = 11.0;
  if (!self->_accessoryView)
    v25 = 0.0;
  v87 = v19;
  v26 = v15 + v19 + v23 + v25;
  v27 = fmax(v21, v17);
  v28 = fmax(v21, fmax(v17, v90));
  v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v91 = v29;
  v92 = (CGPoint)*MEMORY[0x1E0C9D648];
  if (v26 <= width)
    v30 = v28;
  else
    v30 = v27;
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v29;
  v31 = v88;
  v32 = v89;
  v33 = width;
  CGRectDivide(*(CGRect *)(&v24 - 3), &slice, &remainder, v30, CGRectMinYEdge);
  v35 = v91;
  v34 = v92;
  v97.origin = v92;
  v97.size = v91;
  if (v15 > 0.0)
  {
    CGRectDivide(slice, &v97, &slice, v15, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v97.origin.x = v36;
    v97.origin.y = v37;
    v97.size.width = v38;
    v97.size.height = v39;
    CGRectDivide(slice, &v100, &slice, 11.0, v12);
    v35 = v91;
    v34 = v92;
  }
  v40 = v30 + 0.0;
  v96.origin = v34;
  v96.size = v35;
  v41 = v26 <= width;
  v95.origin = v34;
  v95.size = v35;
  v42 = v30;
  if (v41)
  {
    if (v87 > 0.0)
    {
      CGRectDivide(slice, &v95, &slice, v87, v12);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v95.origin.x = v55;
      v95.origin.y = v56;
      v35 = v91;
      v34 = v92;
      v95.size.width = v57;
      v95.size.height = v58;
    }
    if (v23 > 0.0)
    {
      CGRectDivide(slice, &v96, &slice, v23, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v96.origin.x = v59;
      v96.origin.y = v60;
      v96.size.width = v61;
      v96.size.height = v62;
      if (self->_centerPrimaryText)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v96.origin.x = v63;
        v96.origin.y = v64;
        v96.size.width = v65;
        v96.size.height = v66;
      }
      v35 = v91;
      v34 = v92;
    }
  }
  else
  {
    if (v23 > 0.0)
    {
      CGRectDivide(slice, &v96, &slice, v23, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v96.origin.x = v43;
      v96.origin.y = v44;
      v35 = v91;
      v34 = v92;
      v96.size.width = v45;
      v96.size.height = v46;
      if (self->_centerPrimaryText)
      {
        PKContentAlignmentMake();
        PKSizeAlignedInRect();
        v96.origin.x = v47;
        v96.origin.y = v48;
        v35 = v91;
        v34 = v92;
        v96.size.width = v49;
        v96.size.height = v50;
      }
    }
    slice.origin = v34;
    slice.size = v35;
    if (v87 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, v90, CGRectMinYEdge);
      CGRectDivide(slice, &v95, &slice, v87, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v95.origin.x = v51;
      v95.origin.y = v52;
      v35 = v91;
      v34 = v92;
      v95.size.width = v53;
      v95.size.height = v54;
    }
    v40 = v90 + v40;
  }
  if (self->_secondaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v68 = v67;
    v70 = v69;
    v35 = v91;
    v34 = v92;
  }
  else
  {
    v68 = *MEMORY[0x1E0C9D820];
    v70 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v94.origin = v34;
  v94.size = v35;
  slice.origin = v34;
  slice.size = v35;
  if (v68 > 0.0)
  {
    if (v42 > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, self->_labelPadding, CGRectMinYEdge);
      v40 = v40 + self->_labelPadding;
    }
    CGRectDivide(remainder, &slice, &remainder, v70, CGRectMinYEdge);
    CGRectDivide(slice, &v94, &slice, v68, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v94.origin.x = v71;
    v94.origin.y = v72;
    v94.size.width = v73;
    v94.size.height = v74;
    v35 = v91;
    v34 = v92;
  }
  if (self->_tertiaryText)
  {
    -[PKIconTextLabel sizeThatFits:](self->_tertiaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v76 = v75;
    v78 = v77;
    v35 = v91;
    v34 = v92;
  }
  else
  {
    v76 = *MEMORY[0x1E0C9D820];
    v78 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v93.origin = v34;
  v93.size = v35;
  slice.origin = v34;
  slice.size = v35;
  if (v76 <= 0.0)
  {
    v80 = v93.size.height;
  }
  else
  {
    if (v42 > 0.0 || v94.size.height > 0.0)
    {
      CGRectDivide(remainder, &slice, &remainder, self->_labelPadding, CGRectMinYEdge);
      v40 = v40 + self->_labelPadding;
    }
    CGRectDivide(remainder, &slice, &remainder, v78, CGRectMinYEdge);
    CGRectDivide(slice, &v93, &slice, v76, v11);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v80 = v79;
    v93.origin.x = v81;
    v93.origin.y = v82;
    v93.size.width = v83;
    v93.size.height = v79;
  }
  v84 = v94.size.height;
  if (!a4)
  {
    -[PKIconTextLabel setFrame:](self->_primaryLabel, "setFrame:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
    -[PKIconTextLabel setFrame:](self->_secondaryLabel, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
    -[PKIconTextLabel setFrame:](self->_tertiaryLabel, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    -[PKIconTextLabel setFrame:](self->_amountLabel, "setFrame:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    -[UIView setFrame:](self->_accessoryView, "setFrame:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
  }
  v85 = v80 + v40 + v84;
  v86 = width;
  result.height = v85;
  result.width = v86;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setAmountText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountText, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setSecondaryText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setTertiaryText:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryText, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }
}

- (void)setLabelPadding:(double)a3
{
  if (self->_labelPadding != a3)
  {
    self->_labelPadding = a3;
    -[PKTitleDetailValueTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrimaryTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryTextColor, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setAmountTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountTextColor, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setSecondaryTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryTextColor, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setTertiaryTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryTextColor, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setPrimaryFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryFont, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setSecondaryFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_secondaryFont, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setTertiaryFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tertiaryFont, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setAmountFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amountFont, a3);
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }

}

- (void)setCenterPrimaryText:(BOOL)a3
{
  if (self->_centerPrimaryText != a3)
  {
    self->_centerPrimaryText = a3;
    -[PKTitleDetailValueTextView _configureView](self, "_configureView");
  }
}

- (void)_configureView
{
  NSAttributedString *primaryText;
  PKIconTextLabel *primaryLabel;
  PKIconTextLabel *v5;
  PKIconTextLabel *v6;
  PKIconTextLabel *v7;
  NSAttributedString *amountText;
  PKIconTextLabel *amountLabel;
  PKIconTextLabel *v10;
  PKIconTextLabel *v11;
  PKIconTextLabel *v12;
  NSAttributedString *secondaryText;
  PKIconTextLabel *secondaryLabel;
  PKIconTextLabel *v15;
  PKIconTextLabel *v16;
  PKIconTextLabel *v17;
  NSAttributedString *tertiaryText;
  PKIconTextLabel *tertiaryLabel;
  PKIconTextLabel *v20;
  PKIconTextLabel *v21;
  PKIconTextLabel *v22;
  unint64_t accessory;
  id v24;
  void *v25;
  UIView *v26;
  UIView *v27;
  UIView *v28;
  void *v29;
  UIView *v30;
  UIView *v31;
  UIView *v32;
  UIView *accessoryView;
  id v34;
  id v35;
  void (**v36)(void *, NSAttributedString *);
  void *v37;
  _QWORD aBlock[4];
  id v39;

  primaryText = self->_primaryText;
  primaryLabel = self->_primaryLabel;
  if (primaryText)
  {
    if (!primaryLabel)
    {
      v5 = objc_alloc_init(PKIconTextLabel);
      v6 = self->_primaryLabel;
      self->_primaryLabel = v5;

      -[PKTitleDetailValueTextView addSubview:](self, "addSubview:", self->_primaryLabel);
      primaryLabel = self->_primaryLabel;
      primaryText = self->_primaryText;
    }
    -[PKIconTextLabel setText:](primaryLabel, "setText:", primaryText);
    -[PKIconTextLabel setTextColor:](self->_primaryLabel, "setTextColor:", self->_primaryTextColor);
    -[PKIconTextLabel setTextFont:](self->_primaryLabel, "setTextFont:", self->_primaryFont);
    -[PKIconTextLabel setIcon:](self->_primaryLabel, "setIcon:", self->_primaryIcon);
    -[PKIconTextLabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  }
  else
  {
    -[PKIconTextLabel removeFromSuperview](primaryLabel, "removeFromSuperview");
    v7 = self->_primaryLabel;
    self->_primaryLabel = 0;

  }
  amountText = self->_amountText;
  amountLabel = self->_amountLabel;
  if (amountText)
  {
    if (!amountLabel)
    {
      v10 = objc_alloc_init(PKIconTextLabel);
      v11 = self->_amountLabel;
      self->_amountLabel = v10;

      -[PKTitleDetailValueTextView addSubview:](self, "addSubview:", self->_amountLabel);
      amountLabel = self->_amountLabel;
      amountText = self->_amountText;
    }
    -[PKIconTextLabel setText:](amountLabel, "setText:", amountText);
    -[PKIconTextLabel setTextColor:](self->_amountLabel, "setTextColor:", self->_amountTextColor);
    -[PKIconTextLabel setTextFont:](self->_amountLabel, "setTextFont:", self->_amountFont);
    -[PKIconTextLabel setAccessibilityIdentifier:](self->_amountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678A8]);
  }
  else
  {
    -[PKIconTextLabel removeFromSuperview](amountLabel, "removeFromSuperview");
    v12 = self->_amountLabel;
    self->_amountLabel = 0;

  }
  secondaryText = self->_secondaryText;
  secondaryLabel = self->_secondaryLabel;
  if (secondaryText)
  {
    if (!secondaryLabel)
    {
      v15 = objc_alloc_init(PKIconTextLabel);
      v16 = self->_secondaryLabel;
      self->_secondaryLabel = v15;

      -[PKTitleDetailValueTextView addSubview:](self, "addSubview:", self->_secondaryLabel);
      secondaryLabel = self->_secondaryLabel;
      secondaryText = self->_secondaryText;
    }
    -[PKIconTextLabel setText:](secondaryLabel, "setText:", secondaryText);
    -[PKIconTextLabel setIcon:](self->_secondaryLabel, "setIcon:", self->_secondaryIcon);
    -[PKIconTextLabel setTextFont:](self->_secondaryLabel, "setTextFont:", self->_secondaryFont);
    -[PKIconTextLabel setTextColor:](self->_secondaryLabel, "setTextColor:", self->_secondaryTextColor);
    -[PKIconTextLabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  }
  else
  {
    -[PKIconTextLabel removeFromSuperview](secondaryLabel, "removeFromSuperview");
    v17 = self->_secondaryLabel;
    self->_secondaryLabel = 0;

  }
  tertiaryText = self->_tertiaryText;
  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryText)
  {
    if (!tertiaryLabel)
    {
      v20 = objc_alloc_init(PKIconTextLabel);
      v21 = self->_tertiaryLabel;
      self->_tertiaryLabel = v20;

      -[PKTitleDetailValueTextView addSubview:](self, "addSubview:", self->_tertiaryLabel);
      tertiaryLabel = self->_tertiaryLabel;
      tertiaryText = self->_tertiaryText;
    }
    -[PKIconTextLabel setText:](tertiaryLabel, "setText:", tertiaryText);
    -[PKIconTextLabel setTextFont:](self->_tertiaryLabel, "setTextFont:", self->_tertiaryFont);
    -[PKIconTextLabel setIcon:](self->_tertiaryLabel, "setIcon:", self->_tertiaryIcon);
    -[PKIconTextLabel setTextColor:](self->_tertiaryLabel, "setTextColor:", self->_tertiaryTextColor);
    -[PKIconTextLabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68108]);
  }
  else
  {
    -[PKIconTextLabel removeFromSuperview](tertiaryLabel, "removeFromSuperview");
    v22 = self->_tertiaryLabel;
    self->_tertiaryLabel = 0;

  }
  accessory = self->_accessory;
  if (accessory)
  {
    if (accessory == 2)
    {
      -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      v32 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      accessoryView = self->_accessoryView;
      self->_accessoryView = v32;

      -[UIView startAnimating](self->_accessoryView, "startAnimating");
      v30 = self->_accessoryView;
      goto LABEL_27;
    }
    if (accessory == 1)
    {
      -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
      v24 = objc_alloc(MEMORY[0x1E0DC3890]);
      PKUIChevronImage();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (UIView *)objc_msgSend(v24, "initWithImage:", v25);
      v27 = self->_accessoryView;
      self->_accessoryView = v26;

      v28 = self->_accessoryView;
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](v28, "setTintColor:", v29);

      v30 = self->_accessoryView;
LABEL_27:
      -[PKTitleDetailValueTextView addSubview:](self, "addSubview:", v30);
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
    v31 = self->_accessoryView;
    self->_accessoryView = 0;

  }
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PKTitleDetailValueTextView__configureView__block_invoke;
  aBlock[3] = &unk_1E3E613D8;
  v39 = v34;
  v35 = v34;
  v36 = (void (**)(void *, NSAttributedString *))_Block_copy(aBlock);
  v36[2](v36, self->_primaryText);
  v36[2](v36, self->_secondaryText);
  v36[2](v36, self->_tertiaryText);
  v36[2](v36, self->_amountText);
  objc_msgSend(v35, "componentsJoinedByString:", CFSTR(","));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTitleDetailValueTextView setAccessibilityLabel:](self, "setAccessibilityLabel:", v37);

  -[PKTitleDetailValueTextView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[PKTitleDetailValueTextView setNeedsLayout](self, "setNeedsLayout");

}

void __44__PKTitleDetailValueTextView__configureView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "string");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC11A8], 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PKLocalizedCocoonString(CFSTR("PAYMENT_SCHEDULE_STRIKETHROUGH"), CFSTR("%@"), v7);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v6);

}

- (void)_useDefaultFont
{
  NSString *v3;
  NSString *v4;
  UIFont *v5;
  UIFont *primaryFont;
  UIFont *v7;
  UIFont *secondaryFont;
  UIFont *v9;
  UIFont *amountFont;

  v3 = (NSString *)*MEMORY[0x1E0DC4A88];
  v4 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  primaryFont = self->_primaryFont;
  self->_primaryFont = v5;

  PKFontForDefaultDesign(v3, v4);
  v7 = (UIFont *)objc_claimAutoreleasedReturnValue();
  secondaryFont = self->_secondaryFont;
  self->_secondaryFont = v7;

  PKFontForDefaultDesign(v3, v4);
  v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
  amountFont = self->_amountFont;
  self->_amountFont = v9;

}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)tertiaryFont
{
  return self->_tertiaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (UIImage)primaryIcon
{
  return self->_primaryIcon;
}

- (void)setPrimaryIcon:(id)a3
{
  objc_storeStrong((id *)&self->_primaryIcon, a3);
}

- (UIImage)secondaryIcon
{
  return self->_secondaryIcon;
}

- (void)setSecondaryIcon:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIcon, a3);
}

- (UIImage)tertiaryIcon
{
  return self->_tertiaryIcon;
}

- (void)setTertiaryIcon:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryIcon, 0);
  objc_storeStrong((id *)&self->_secondaryIcon, 0);
  objc_storeStrong((id *)&self->_primaryIcon, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_tertiaryFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end

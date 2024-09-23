@implementation PKPeerPaymentBankAccountDetailCell

- (PKPeerPaymentBankAccountDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPeerPaymentBankAccountDetailCell *v4;
  uint64_t v5;
  UIListContentConfiguration *referenceConfiguration;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  v4 = -[PKPeerPaymentBankAccountDetailCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    referenceConfiguration = v4->_referenceConfiguration;
    v4->_referenceConfiguration = (UIListContentConfiguration *)v5;

    -[PKPeerPaymentBankAccountDetailCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 0);
    -[PKPeerPaymentBankAccountDetailCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[PKPeerPaymentBankAccountDetailCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    PKProvisioningSecondaryBackgroundColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentBankAccountDetailCell setBackgroundColor:](v4, "setBackgroundColor:", v7);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)*MEMORY[0x1E0DC4A88];
    v10 = (NSString *)*MEMORY[0x1E0DC48F0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v11);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMinimumScaleFactor:", 0.7);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBaselineAdjustment:", 1);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", 0);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfLines:", 0);

    -[PKPeerPaymentBankAccountDetailCell textLabel](v4, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", 0);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSecureTextEntry:", 1);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDisplaySecureTextUsingPlainText:", 1);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign(v9, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v22);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAdjustsFontSizeToFitWidth:", 0);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("REQUIRED"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPlaceholder:", v25);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClearButtonMode:", 1);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAutocorrectionType:", 1);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAutocapitalizationType:", 1);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setKeyboardType:", 11);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v4, "editableTextField");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setInputView:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  -[PKPeerPaymentBankAccountDetailCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PKPeerPaymentBankAccountDetailCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKPeerPaymentBankAccountDetailCell _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 0, v5, v7, v9, v11);
}

- (CGSize)_layoutSubviewsInBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double minimumTextLabelWidth;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGRectEdge v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPeerPaymentBankAccountDetailCell textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentBankAccountDetailCell editableTextField](self, "editableTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[PKPeerPaymentBankAccountDetailCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIListContentConfiguration directionalLayoutMargins](self->_referenceConfiguration, "directionalLayoutMargins");
    if (v12)
      v17 = v16;
    else
      v17 = v14;
    if (!v12)
      v14 = v16;
    v18 = x + v17;
    v19 = y + v13;
    v41 = width;
    v20 = width - (v17 + v14);
    v21 = v13 + v15;
    v22 = height - v21;
    v40 = v21 + 0.0;
    minimumTextLabelWidth = self->_minimumTextLabelWidth;
    memset(&slice, 0, sizeof(slice));
    remainder.origin.x = x + v17;
    remainder.origin.y = v19;
    remainder.size.width = v20;
    remainder.size.height = height - v21;
    if (minimumTextLabelWidth <= v20 + -122.0)
    {
      if (v12)
        v31 = CGRectMaxXEdge;
      else
        v31 = CGRectMinXEdge;
      objc_msgSend(v10, "sizeThatFits:", v20 + -122.0, 3.40282347e38);
      v33 = v32;
      v35 = fmax(v34, self->_minimumTextLabelWidth);
      v49.origin.x = v18;
      v49.origin.y = v19;
      v49.size.width = v20;
      v49.size.height = v22;
      CGRectDivide(v49, &slice, &remainder, v35, v31);
      if (a4)
      {
        CGRectDivide(remainder, &slice, &remainder, 22.0, v31);
      }
      else
      {
        objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
        CGRectDivide(remainder, &slice, &remainder, 22.0, v31);
        objc_msgSend(v11, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      }
      width = v41;
      v30 = v40 + v33;
    }
    else
    {
      v39 = height;
      v45.origin.x = x + v17;
      v45.origin.y = v19;
      v45.size.width = v20;
      v45.size.height = v22;
      objc_msgSend(v10, "sizeThatFits:", CGRectGetWidth(v45), 3.40282347e38);
      v25 = v24;
      v46.origin.x = v18;
      v46.origin.y = v19;
      v46.size.width = v20;
      v46.size.height = v22;
      objc_msgSend(v11, "sizeThatFits:", CGRectGetWidth(v46), 3.40282347e38);
      v27 = v26;
      v28 = v25 + v26;
      v47.origin.x = v18;
      v47.origin.y = v19;
      v47.size.width = v20;
      v47.size.height = v22;
      CGRectDivide(v47, &slice, &remainder, v28, CGRectMinYEdge);
      PKRectCenteredYInRect();
      remainder = v48;
      CGRectDivide(v48, &slice, &remainder, v25, CGRectMinYEdge);
      if (!a4)
        objc_msgSend(v10, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      v29 = v40 + v25;
      CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
      width = v41;
      if (!a4)
        objc_msgSend(v11, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      v30 = v29 + v27;
      height = v39;
    }
  }
  else
  {
    v30 = 0.0;
  }
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v36 = CGRectGetWidth(v50);

  v37 = v36;
  v38 = v30;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)setMinimumTextLabelWidth:(double)a3
{
  if (self->_minimumTextLabelWidth != a3)
  {
    self->_minimumTextLabelWidth = a3;
    -[PKPeerPaymentBankAccountDetailCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)_separatorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentBankAccountDetailCell;
  -[PKPeerPaymentBankAccountDetailCell _separatorFrame](&v15, sel__separatorFrame);
  if (self->_shouldDrawSeperator)
  {
    v5 = v3;
    v6 = v4;
    if (self->_shouldDrawFullWidthSeperator)
    {
      -[PKPeerPaymentBankAccountDetailCell bounds](self, "bounds");
      Width = CGRectGetWidth(v16);
      v8 = 0.0;
    }
    else
    {
      -[UIListContentConfiguration directionalLayoutMargins](self->_referenceConfiguration, "directionalLayoutMargins");
      v10 = v9;
      v11 = -[PKPeerPaymentBankAccountDetailCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      -[PKPeerPaymentBankAccountDetailCell bounds](self, "bounds");
      CGRectGetWidth(v17);
      if (v11)
        v8 = 0.0;
      else
        v8 = v10;
      -[PKPeerPaymentBankAccountDetailCell bounds](self, "bounds");
      Width = CGRectGetWidth(v18) - v10;
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    Width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v12 = v8;
  v13 = v5;
  v14 = v6;
  result.size.height = v14;
  result.size.width = Width;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPeerPaymentBankAccountDetailCell _layoutSubviewsInBounds:isTemplateLayout:](self, "_layoutSubviewsInBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)shouldDrawSeperator
{
  return self->_shouldDrawSeperator;
}

- (void)setShouldDrawSeperator:(BOOL)a3
{
  self->_shouldDrawSeperator = a3;
}

- (BOOL)shouldDrawFullWidthSeperator
{
  return self->_shouldDrawFullWidthSeperator;
}

- (void)setShouldDrawFullWidthSeperator:(BOOL)a3
{
  self->_shouldDrawFullWidthSeperator = a3;
}

- (double)minimumTextLabelWidth
{
  return self->_minimumTextLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceConfiguration, 0);
}

@end

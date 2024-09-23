@implementation PKPeerPaymentActionTransferToBankCell

- (PKPeerPaymentActionTransferToBankCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKPeerPaymentActionTransferToBankCell initWithReuseIdentifier:](self, "initWithReuseIdentifier:", a4);
}

- (PKPeerPaymentActionTransferToBankCell)initWithReuseIdentifier:(id)a3
{
  PKPeerPaymentActionTransferToBankCell *v3;
  PKPeerPaymentActionTransferToBankCell *v4;
  UILabel *v5;
  UILabel *textLabel;
  UILabel *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *detailTextLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  UILabel *feeLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIImageView *checkmarkImageView;
  UIImageView *v32;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentActionTransferToBankCell;
  v3 = -[PKPeerPaymentActionTransferToBankCell initWithStyle:reuseIdentifier:](&v35, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v4 = v3;
  if (v3)
  {
    v3->_isRTL = -[PKPeerPaymentActionTransferToBankCell _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection");
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v5;

    v7 = v4->_textLabel;
    v8 = (NSString *)*MEMORY[0x1E0DC4A88];
    v9 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v10);

    -[UILabel setTextAlignment:](v4->_textLabel, "setTextAlignment:", 4);
    v11 = v4->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v4->_textLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_textLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v13;

    v15 = v4->_detailTextLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setTextAlignment:](v4->_detailTextLabel, "setTextAlignment:", 4);
    v17 = v4->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v4->_detailTextLabel, "setNumberOfLines:", 3);
    -[UILabel setLineBreakMode:](v4->_detailTextLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v4->_detailTextLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    feeLabel = v4->_feeLabel;
    v4->_feeLabel = v19;

    v21 = v4->_feeLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    v23 = v4->_feeLabel;
    PKFontForDefaultDesign(v8, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    -[UILabel setTextAlignment:](v4->_feeLabel, "setTextAlignment:", 2 * !v4->_isRTL);
    -[UILabel setLineBreakMode:](v4->_feeLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v4->_feeLabel, "setNumberOfLines:", 2);
    -[UILabel setAccessibilityIdentifier:](v4->_feeLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    -[PKPeerPaymentActionTransferToBankCell addSubview:](v4, "addSubview:", v4->_textLabel);
    -[PKPeerPaymentActionTransferToBankCell addSubview:](v4, "addSubview:", v4->_detailTextLabel);
    -[PKPeerPaymentActionTransferToBankCell addSubview:](v4, "addSubview:", v4->_feeLabel);
    PKPassKitUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLForResource:withExtension:", CFSTR("Cell_Checkmark"), CFSTR("pdf"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = PKUIScreenScale();
    PKUIImageFromPDF(v26, 15.0, 19.5, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageWithRenderingMode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v29);
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = (UIImageView *)v30;

    v32 = v4->_checkmarkImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v32, "setTintColor:", v33);

    -[PKPeerPaymentActionTransferToBankCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68160]);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGRectEdge v16;
  CGRectEdge v17;
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
  double v29;
  double x;
  double width;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect remainder;
  CGRect slice;
  objc_super v46;
  CGRect v47;
  CGRect v48;

  v46.receiver = self;
  v46.super_class = (Class)PKPeerPaymentActionTransferToBankCell;
  -[PKPeerPaymentActionTransferToBankCell layoutSubviews](&v46, sel_layoutSubviews);
  -[PKPeerPaymentActionTransferToBankCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v9 + -22.0;
  v12 = (v7 - PKTableViewCellTextInset() * 2.0) * 0.3;
  -[UIImageView frame](self->_checkmarkImageView, "frame");
  v14 = v13;
  -[UILabel frame](self->_feeLabel, "frame");
  -[UILabel sizeThatFits:](self->_feeLabel, "sizeThatFits:", v12, v11);
  if (v12 >= v15)
    v12 = v15;
  -[UILabel frame](self->_textLabel, "frame");
  -[UILabel frame](self->_detailTextLabel, "frame");
  v16 = 2 * !self->_isRTL;
  v17 = 2 * self->_isRTL;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v10;
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  CGRectDivide(v47, &slice, &remainder, 16.0, v16);
  v18 = PKTableViewCellTextInset();
  CGRectDivide(remainder, &slice, &remainder, v18, v17);
  CGRectDivide(remainder, &slice, &remainder, v14, v16);
  PKRectCenteredYInRect();
  v42 = v20;
  v43 = v19;
  v40 = v22;
  v41 = v21;
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 16.0, v16);
  CGRectDivide(remainder, &slice, &remainder, v12, v16);
  PKRectCenteredYInRect();
  v38 = v24;
  v39 = v23;
  v37 = v25;
  v27 = v26;
  -[UILabel setFrame:](self->_feeLabel, "setFrame:");
  CGRectDivide(remainder, &slice, &remainder, 16.0, v16);
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", remainder.size.width, v11);
  v29 = v28;
  x = remainder.origin.x;
  width = remainder.size.width;
  -[UILabel setFrame:](self->_textLabel, "setFrame:", remainder.origin.x, 11.0, remainder.size.width, v28);
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", remainder.size.width, v11);
  v33 = v32;
  v34 = remainder.origin.x;
  v48.origin.y = 11.0;
  v48.origin.x = x;
  v48.size.width = width;
  v48.size.height = v29;
  v35 = CGRectGetMaxY(v48) + 2.0;
  v36 = remainder.size.width;
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v34, v35, remainder.size.width, v33);
  -[UILabel setFrame:](self->_feeLabel, "setFrame:", v39, v38, v37, v27);
  -[UILabel setFrame:](self->_textLabel, "setFrame:", x, 11.0, width, v29);
  -[UILabel setFrame:](self->_detailTextLabel, "setFrame:", v34, v35, v36, v33);
  -[UIImageView setFrame:](self->_checkmarkImageView, "setFrame:", v43, v42, v41, v40);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  v5 = a3.width - PKTableViewCellTextInset() * 2.0;
  -[UILabel sizeThatFits:](self->_feeLabel, "sizeThatFits:", v5 * 0.3, 3.40282347e38);
  v8 = v7;
  if (v6 >= v5 * 0.3)
    v6 = v5 * 0.3;
  v9 = v5 + -48.0 - v6;
  -[UILabel sizeThatFits:](self->_detailTextLabel, "sizeThatFits:", v9, 3.40282347e38);
  v11 = v10;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v9, 3.40282347e38);
  v13 = v11 + v12 + 2.0;
  if (v8 > v13)
    v13 = v8;
  v14 = v13 + 22.0;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)setFeeText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_feeText;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_feeText, a3);
    -[UILabel setText:](self->_feeLabel, "setText:", self->_feeText);
    -[UILabel sizeToFit](self->_feeLabel, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_titleText;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_titleText, a3);
    -[UILabel setText:](self->_textLabel, "setText:", self->_titleText);
    -[UILabel sizeToFit](self->_textLabel, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSubtitleText:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  v6 = self->_subtitleText;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_subtitleText, a3);
    -[UILabel setText:](self->_detailTextLabel, "setText:", self->_subtitleText);
    -[UILabel sizeToFit](self->_detailTextLabel, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setShowCheckmark:(BOOL)a3
{
  if (self->_showCheckmark != a3)
  {
    self->_showCheckmark = a3;
    if (a3)
      -[PKPeerPaymentActionTransferToBankCell addSubview:](self, "addSubview:", self->_checkmarkImageView);
    else
      -[UIImageView removeFromSuperview](self->_checkmarkImageView, "removeFromSuperview");
    -[PKPeerPaymentActionTransferToBankCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)feeText
{
  return self->_feeText;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_feeLabel, 0);
}

@end

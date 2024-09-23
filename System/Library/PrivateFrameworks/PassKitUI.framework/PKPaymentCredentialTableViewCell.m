@implementation PKPaymentCredentialTableViewCell

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentCredentialTableViewCell;
  -[PKTableViewCell pk_applyAppearance:](&v6, sel_pk_applyAppearance_, a3);
  -[PKPaymentCredentialTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredentialTableViewCell detailTextLabelColor](self, "detailTextLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (PKPaymentCredentialTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentCredentialTableViewCell *v4;
  PKPaymentCredentialTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UILabel *credentialDetailLabel;
  uint64_t v16;
  UIImageView *snapshotImageView;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentCredentialTableViewCell;
  v4 = -[PKPaymentCredentialTableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKPaymentCredentialTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredentialTableViewCell textLabel](v5, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);
    objc_msgSend(v8, "setFont:", v7);
    v9 = objc_alloc(MEMORY[0x1E0DC3990]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    credentialDetailLabel = v5->_credentialDetailLabel;
    v5->_credentialDetailLabel = (UILabel *)v14;

    -[UILabel setFont:](v5->_credentialDetailLabel, "setFont:", v7);
    -[UILabel setNumberOfLines:](v5->_credentialDetailLabel, "setNumberOfLines:", 2);
    objc_msgSend(v6, "addSubview:", v5->_credentialDetailLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v10, v11, v12, v13);
    snapshotImageView = v5->_snapshotImageView;
    v5->_snapshotImageView = (UIImageView *)v16;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_snapshotImageView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v6, "addSubview:", v5->_snapshotImageView);
    -[UIImageView layer](v5->_snapshotImageView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentStyleApplyCorners();
    objc_msgSend(v18, "setShouldRasterize:", 1);
    objc_msgSend(v18, "setRasterizationScale:", PKUIScreenScale());
    -[PKPaymentCredentialTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    PKProvisioningBackgroundColor();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredentialTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v19);

  }
  return v5;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
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
  uint64_t v18;
  uint64_t v19;
  double v20;
  UILabel *v21;
  double v22;
  double v23;
  double v24;
  double MaxY;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31.receiver = self;
  v31.super_class = (Class)PKPaymentCredentialTableViewCell;
  -[PKPaymentCredentialTableViewCell layoutSubviews](&v31, sel_layoutSubviews);
  v3 = -[PKPaymentCredentialTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPaymentCredentialTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v32);

  -[PKPaymentCredentialTableViewCell snapshotImageView](self, "snapshotImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    v8 = Width + -53.0 + -15.0;
  else
    v8 = 15.0;
  objc_msgSend(v6, "setFrame:", v8, 15.0, 53.0, 32.0);
  if (-[PKPaymentCredentialTableViewCell accessoryType](self, "accessoryType"))
    v9 = 0.0;
  else
    v9 = 40.0;
  v33.origin.y = 15.0;
  v33.origin.x = v8;
  v33.size.width = 53.0;
  v33.size.height = 32.0;
  v10 = Width - CGRectGetWidth(v33) + -30.0 - v9;
  -[PKPaymentCredentialTableViewCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeToFit");
  objc_msgSend(v11, "frame");
  v14 = v13;
  if (v10 >= v12)
    v15 = v12;
  else
    v15 = v10;
  v16 = 15.0;
  v17 = v8;
  v18 = 0x404A800000000000;
  v19 = 0x4040000000000000;
  if (v3)
    v20 = CGRectGetMinX(*(CGRect *)&v17) + -15.0 - v15;
  else
    v20 = CGRectGetMaxX(*(CGRect *)&v17) + 15.0;
  objc_msgSend(v11, "setFrame:", v20, 10.0, v15, v14);
  v21 = self->_credentialDetailLabel;
  -[UILabel sizeThatFits:](v21, "sizeThatFits:", v10, 1.79769313e308);
  v24 = v23;
  if (v10 >= v22)
    v10 = v22;
  v34.origin.y = 10.0;
  v34.origin.x = v20;
  v34.size.width = v15;
  v34.size.height = v14;
  MaxY = CGRectGetMaxY(v34);
  v26 = 15.0;
  v27 = v8;
  v28 = 0x404A800000000000;
  v29 = 0x4040000000000000;
  if (v3)
    v30 = CGRectGetMinX(*(CGRect *)&v27) + -15.0 - v10;
  else
    v30 = CGRectGetMaxX(*(CGRect *)&v27) + 15.0;
  -[UILabel setFrame:](v21, "setFrame:", v30, MaxY, v10, v24);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;

  width = a3.width;
  -[PKPaymentCredentialTableViewCell textLabel](self, "textLabel", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v7 + 20.0;

  if (-[PKPaymentCredentialTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v9 = width + -53.0 + -15.0;
  else
    v9 = 15.0;
  if (-[PKPaymentCredentialTableViewCell accessoryType](self, "accessoryType"))
    v10 = 0.0;
  else
    v10 = 40.0;
  v16.size.width = 53.0;
  v16.size.height = 32.0;
  v16.origin.y = 15.0;
  v16.origin.x = v9;
  -[UILabel sizeThatFits:](self->_credentialDetailLabel, "sizeThatFits:", width - CGRectGetWidth(v16) + -30.0 - v10, 1.79769313e308);
  v12 = v8 + v11;
  v13 = 60.0;
  if (v12 >= 60.0)
    v13 = v12;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (id)detailTextLabelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)setSnapshotImageHasBorder:(BOOL)a3
{
  double v4;
  id v5;
  id v6;

  if (self->_snapshotImageHasBorder != a3)
  {
    self->_snapshotImageHasBorder = a3;
    -[UIImageView layer](self->_snapshotImageView, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_snapshotImageHasBorder)
    {
      +[PKTransactionDataOverlayCardFaceView borderWidth](PKTransactionDataOverlayCardFaceView, "borderWidth");
      if (v4 > 0.0)
        v4 = PKUIPixelLength();
      +[PKTransactionDataOverlayCardFaceView borderColor](PKTransactionDataOverlayCardFaceView, "borderColor", v4);
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "CGColor");
      PKPaymentStyleApplyCorners();

    }
    else
    {
      PKPaymentStyleApplyCorners();
    }

  }
}

+ (CGSize)defaultImageViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 53.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentCredentialTableViewCell;
  -[PKTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PKPaymentCredentialTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[UILabel setText:](self->_credentialDetailLabel, "setText:", 0);
  -[PKPaymentCredentialTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (UILabel)credentialDetailLabel
{
  return self->_credentialDetailLabel;
}

- (BOOL)showingPlaceholder
{
  return self->_showingPlaceholder;
}

- (void)setShowingPlaceholder:(BOOL)a3
{
  self->_showingPlaceholder = a3;
}

- (BOOL)snapshotImageHasBorder
{
  return self->_snapshotImageHasBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialDetailLabel, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
}

@end

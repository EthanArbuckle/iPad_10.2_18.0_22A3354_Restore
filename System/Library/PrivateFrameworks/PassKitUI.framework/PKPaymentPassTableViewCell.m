@implementation PKPaymentPassTableViewCell

- (PKPaymentPassTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKPaymentPassTableViewCell *v4;
  uint64_t v5;
  UIColor *mainLabelColor;
  uint64_t v7;
  UIColor *subTextLabelColor;
  uint64_t v9;
  UIColor *disabledMainLabelColor;
  uint64_t v11;
  UIColor *disabledSubTextLabelColor;
  UILabel *v13;
  UILabel *mainLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *subTextLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  UIView *v23;
  void *v24;
  UIView *cardSnapshotView;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKPaymentPassTableViewCell;
  v4 = -[PKPaymentPassTableViewCell initWithStyle:reuseIdentifier:](&v27, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    mainLabelColor = v4->_mainLabelColor;
    v4->_mainLabelColor = (UIColor *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = objc_claimAutoreleasedReturnValue();
    subTextLabelColor = v4->_subTextLabelColor;
    v4->_subTextLabelColor = (UIColor *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = objc_claimAutoreleasedReturnValue();
    disabledMainLabelColor = v4->_disabledMainLabelColor;
    v4->_disabledMainLabelColor = (UIColor *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v11 = objc_claimAutoreleasedReturnValue();
    disabledSubTextLabelColor = v4->_disabledSubTextLabelColor;
    v4->_disabledSubTextLabelColor = (UIColor *)v11;

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v13;

    v15 = v4->_mainLabel;
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setTextColor:](v4->_mainLabel, "setTextColor:", v4->_mainLabelColor);
    -[PKPaymentPassTableViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_mainLabel);

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subTextLabel = v4->_subTextLabel;
    v4->_subTextLabel = v18;

    v20 = v4->_subTextLabel;
    objc_msgSend((id)objc_opt_class(), "subTitleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setTextColor:](v4->_subTextLabel, "setTextColor:", v4->_subTextLabelColor);
    -[PKPaymentPassTableViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_subTextLabel);

    -[PKPaymentPassTableViewCell setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[PKPaymentPassTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v23);

    -[UIView startAnimating](v23, "startAnimating");
    cardSnapshotView = v4->_cardSnapshotView;
    v4->_cardSnapshotView = v23;

  }
  return v4;
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)subTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (double)heightForCellWithMinimum:(double)a3 hasSubTitle:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double result;

  v4 = a4;
  objc_msgSend(a1, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;

  if (v4)
  {
    objc_msgSend(a1, "subTitleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineHeight");
    v9 = v9 + v11;

  }
  result = v9 + 16.0;
  if (v9 + 16.0 <= a3)
    return a3;
  return result;
}

- (void)setPass:(id)a3
{
  id v5;
  PKPaymentPass **p_pass;
  PKTransitBalanceModel *v7;
  PKTransitBalanceModel *transitBalanceModel;
  PKTransitBalanceModel *v9;
  void *v10;
  void *v11;
  PKPaymentPass *v12;
  double v13;
  _QWORD v14[5];

  v5 = a3;
  p_pass = &self->_pass;
  objc_storeStrong((id *)&self->_pass, a3);
  if (-[PKPaymentPass isStoredValuePass](self->_pass, "isStoredValuePass"))
  {
    v7 = (PKTransitBalanceModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67740]), "initWithPass:", *p_pass);
    transitBalanceModel = self->_transitBalanceModel;
    self->_transitBalanceModel = v7;

    v9 = self->_transitBalanceModel;
    objc_msgSend(MEMORY[0x1E0D67748], "passPropertiesForPass:", *p_pass);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitBalanceModel setTransitProperties:andApplyStoredValueBalances:](v9, "setTransitProperties:andApplyStoredValueBalances:", v10, 1);
  }
  else
  {
    v10 = self->_transitBalanceModel;
    self->_transitBalanceModel = 0;
  }

  -[PKPaymentPassTableViewCell _updateLabelText](self, "_updateLabelText");
  +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *p_pass;
  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__PKPaymentPassTableViewCell_setPass___block_invoke;
  v14[3] = &unk_1E3E613B0;
  v14[4] = self;
  objc_msgSend(v11, "snapshotWithPass:size:completion:", v12, v14, 66.0, v13);

}

void __38__PKPaymentPassTableViewCell_setPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PKPaymentPassTableViewCell_setPass___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __38__PKPaymentPassTableViewCell_setPass___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1080);
  *(_QWORD *)(v2 + 1080) = 0;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1080);
  *(_QWORD *)(v5 + 1080) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassTableViewCell;
  -[PKPaymentPassTableViewCell setUserInteractionEnabled:](&v4, sel_setUserInteractionEnabled_, a3);
  -[PKPaymentPassTableViewCell _updateLabelTextColors](self, "_updateLabelTextColors");
}

- (void)setMainLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    -[PKPaymentPassTableViewCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setSubTextLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_subTextLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subTextLabelColor, a3);
    -[PKPaymentPassTableViewCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setDisabledMainLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_disabledMainLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledMainLabelColor, a3);
    -[PKPaymentPassTableViewCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setDisabledSubTextLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_disabledSubTextLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_disabledSubTextLabelColor, a3);
    -[PKPaymentPassTableViewCell _updateLabelTextColors](self, "_updateLabelTextColors");
    v5 = v6;
  }

}

- (void)setPeerPaymentAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
    -[PKPaymentPassTableViewCell _updateLabelText](self, "_updateLabelText");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGRectEdge v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRectEdge v17;
  CGRectEdge v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat height;
  double v26;
  double MaxY;
  double x;
  double width;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGRect v33;
  CGRect slice;
  CGRect remainder;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)PKPaymentPassTableViewCell;
  -[PKPaymentPassTableViewCell layoutSubviews](&v36, sel_layoutSubviews);
  -[PKPaymentPassTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  if (-[PKPaymentPassTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  CGRectDivide(v37, &slice, &remainder, 20.0, v12);
  -[UIView frame](self->_cardSnapshotView, "frame");
  -[PKPaymentPassTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKSizeAlignedInRect();
  remainder.origin.x = v13;
  remainder.origin.y = v14;
  remainder.size.width = v15;
  remainder.size.height = v16;
  -[UIView setFrame:](self->_cardSnapshotView, "setFrame:");
  memset(&v33, 0, sizeof(v33));
  if (-[PKPaymentPassTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v17 = CGRectMaxXEdge;
  else
    v17 = CGRectMinXEdge;
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  CGRectDivide(v38, &slice, &v33, 96.0, v17);
  if (-[PKPaymentPassTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v18 = CGRectMinXEdge;
  else
    v18 = CGRectMaxXEdge;
  CGRectDivide(v33, &slice, &v33, 0.0, v18);
  -[UILabel frame](self->_mainLabel, "frame");
  -[PKPaymentPassTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKSizeAlignedInRect();
  v33.origin.x = v19;
  v33.origin.y = v20;
  v33.size.width = v21;
  v33.size.height = v22;
  -[UILabel setFrame:](self->_mainLabel, "setFrame:");
  -[UILabel frame](self->_subTextLabel, "frame");
  v24 = v23;
  height = v33.size.height;
  v26 = v11 * 0.5 - (v33.size.height + v24) * 0.5;
  if (v26 <= 8.0)
  {
    v33.origin.y = v11 * 0.5 - (v33.size.height + v24) * 0.5;
    width = v33.size.width;
    x = v33.origin.x;
    v30 = v33.origin.x;
    v31 = v26;
    v32 = v33.size.width;
    MaxY = CGRectGetMaxY(*(CGRect *)(&height - 3));
  }
  else
  {
    v33.origin.y = 8.0;
    MaxY = v11 + -8.0 - v24;
    x = v33.origin.x;
    width = v33.size.width;
  }
  -[UILabel setFrame:](self->_mainLabel, "setFrame:");
  -[UILabel setFrame:](self->_subTextLabel, "setFrame:", x, MaxY, width, v24);
}

- (void)_updateLabelText
{
  UILabel *mainLabel;
  void *v4;
  int v5;
  PKPaymentPass *pass;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  char v18;
  id v19;
  id v20;

  mainLabel = self->_mainLabel;
  -[PKPaymentPass localizedDescription](self->_pass, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](mainLabel, "setText:", v4);

  -[UILabel sizeToFit](self->_mainLabel, "sizeToFit");
  v5 = -[PKPaymentPass isAccessPass](self->_pass, "isAccessPass");
  pass = self->_pass;
  if (v5)
  {
    -[PKPaymentPass fieldForKey:](pass, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPass fieldForKey:](self->_pass, "fieldForKey:", *MEMORY[0x1E0D6ADB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentPass supportsSharing](self->_pass, "supportsSharing"))
      v9 = v7 == 0;
    else
      v9 = 1;
    v10 = v7;
    if (v9 && (v10 = v8) == 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v10, "value");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_10;
  }
  if (!-[PKPaymentPass isStoredValuePass](pass, "isStoredValuePass"))
  {
    if (-[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_pass, "hasAssociatedPeerPaymentAccount"))
    {
      -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      if (v14 == v15)
      {

LABEL_26:
        -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "minimalFormattedStringValue");
        v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

        v11 = (uint64_t)v19;
        goto LABEL_13;
      }
      v16 = v15;
      if (v14)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (!v17)
      {
        v18 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v18 & 1) == 0)
          goto LABEL_27;
        goto LABEL_26;
      }

    }
LABEL_27:
    PKSanitizedPrimaryAccountRepresentationForPass();
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  -[PKTransitBalanceModel displayableListOfBalances](self->_transitBalanceModel, "displayableListOfBalances");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (!v11)
    goto LABEL_27;
LABEL_28:
  v20 = (id)v11;
  -[UILabel setText:](self->_subTextLabel, "setText:", v11);
  -[UILabel sizeToFit](self->_subTextLabel, "sizeToFit");
  -[PKPaymentPassTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateLabelTextColors
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[PKPaymentPassTableViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v4 = 2;
  if (v3)
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v5 = 3;
  }
  -[UILabel setTextColor:](self->_mainLabel, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPaymentPassTableViewCell__mainLabelColor[v4]));
  -[UILabel setTextColor:](self->_subTextLabel, "setTextColor:", *(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPaymentPassTableViewCell__mainLabelColor[v5]));
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subTextLabelColor
{
  return self->_subTextLabelColor;
}

- (UIColor)disabledMainLabelColor
{
  return self->_disabledMainLabelColor;
}

- (UIColor)disabledSubTextLabelColor
{
  return self->_disabledSubTextLabelColor;
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void)setTransitBalanceModel:(id)a3
{
  objc_storeStrong((id *)&self->_transitBalanceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_disabledSubTextLabelColor, 0);
  objc_storeStrong((id *)&self->_disabledMainLabelColor, 0);
  objc_storeStrong((id *)&self->_subTextLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_cardSnapshotView, 0);
  objc_storeStrong((id *)&self->_subTextLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassTableViewCell;
  v4 = a3;
  -[PKTableViewCell pk_applyAppearance:](&v10, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "textColor", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassTableViewCell setMainLabelColor:](self, "setMainLabelColor:", v5);

  objc_msgSend(v4, "altTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassTableViewCell setSubTextLabelColor:](self, "setSubTextLabelColor:", v6);

  objc_msgSend(v4, "altTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassTableViewCell setDisabledMainLabelColor:](self, "setDisabledMainLabelColor:", v7);

  objc_msgSend(v4, "altTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassTableViewCell setDisabledSubTextLabelColor:](self, "setDisabledSubTextLabelColor:", v8);

  objc_msgSend(v4, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPassTableViewCell setTintColor:](self, "setTintColor:", v9);
}

@end

@implementation PKInsitutionTableCell

- (PKInsitutionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKInsitutionTableCell *v9;
  PKInsitutionTableCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKInsitutionTableCell;
  v9 = -[PKInsitutionTableCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[PKInsitutionTableCell setSpecifier:](v9, "setSpecifier:", v8);
    -[PKInsitutionTableCell setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  }

  return v10;
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)subTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

- (void)setConnectedInstitution:(id)a3
{
  FKBankConnectInstitutionsProviderResponse *v5;
  void *v6;
  UIActivityIndicatorView *snapshotSpinner;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PKInsitutionTableCell *v19;
  id v20;
  id v21;

  v5 = (FKBankConnectInstitutionsProviderResponse *)a3;
  if (self->_connectedInstitution != v5)
  {
    objc_storeStrong((id *)&self->_connectedInstitution, a3);
    -[PKInsitutionTableCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    snapshotSpinner = self->_snapshotSpinner;
    if (!snapshotSpinner)
    {
      v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v9 = self->_snapshotSpinner;
      self->_snapshotSpinner = v8;

      -[UIActivityIndicatorView startAnimating](self->_snapshotSpinner, "startAnimating");
      snapshotSpinner = self->_snapshotSpinner;
    }
    objc_msgSend(v6, "addSubview:", snapshotSpinner);
    -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
    v10 = PKUIScreenScale();
    +[PKInsitutionTableCell bankConnectImageProvider](PKInsitutionTableCell, "bankConnectImageProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FKBankConnectInstitutionsProviderResponse institution](self->_connectedInstitution, "institution");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "institutionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke;
    v17[3] = &unk_1E3E626E0;
    v18 = v13;
    v19 = self;
    v20 = v6;
    v21 = v11;
    v14 = v11;
    v15 = v6;
    v16 = v13;
    objc_msgSend(v14, "logoForInstitutionID:size:scale:completion:", v16, v17, 29.0, 29.0, v10);

  }
}

void __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke_2;
  v8[3] = &unk_1E3E62460;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __49__PKInsitutionTableCell_setConnectedInstitution___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1200), "institution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "institutionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v4);

  if ((_DWORD)v2)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 1224);
    if (v5)
    {
      objc_msgSend(v5, "setImage:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *(_QWORD *)(a1 + 48));
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 1224);
      *(_QWORD *)(v7 + 1224) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1224), "setAccessibilityIgnoresInvertColors:", 1);
      objc_msgSend(*(id *)(a1 + 56), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1224));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1224), "setContentMode:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1216), "removeFromSuperview");
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 1216);
    *(_QWORD *)(v9 + 1216) = 0;

    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  }
}

+ (id)bankConnectImageProvider
{
  if (qword_1EE4C83B8 != -1)
    dispatch_once(&qword_1EE4C83B8, &__block_literal_global_5);
  return (id)_MergedGlobals_1_3;
}

void __49__PKInsitutionTableCell_bankConnectImageProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(getFKBankConnectImageProviderClass());
  v1 = (void *)_MergedGlobals_1_3;
  _MergedGlobals_1_3 = (uint64_t)v0;

}

- (void)_configureMainLabelWithText:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  titleLabel = self->_titleLabel;
  v11 = v4;
  if (!titleLabel)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->_titleLabel;
    self->_titleLabel = v6;

    v8 = self->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v4 = v11;
    titleLabel = self->_titleLabel;
  }
  -[UILabel setText:](titleLabel, "setText:", v4);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[PKInsitutionTableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_titleLabel);

}

- (void)_configureSubTextLabelWithText:(id)a3 textColor:(id)a4
{
  id v6;
  UILabel *subTitleLabel;
  void *v8;
  UILabel *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  subTitleLabel = self->_subTitleLabel;
  if (!subTitleLabel)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v10 = self->_subTitleLabel;
    self->_subTitleLabel = v9;

    v11 = self->_subTitleLabel;
    objc_msgSend((id)objc_opt_class(), "subTitleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    subTitleLabel = self->_subTitleLabel;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    -[UILabel setTextColor:](subTitleLabel, "setTextColor:", v6);
    subTitleLabel = self->_subTitleLabel;
  }
LABEL_4:
  -[UILabel setText:](subTitleLabel, "setText:", v13);
  -[UILabel sizeToFit](self->_subTitleLabel, "sizeToFit");
  -[PKInsitutionTableCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_subTitleLabel);

}

- (void)_configureCellWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FKBankConnectInstitutionsProviderResponse institution](self->_connectedInstitution, "institution", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInsitutionTableCell _configureMainLabelWithText:](self, "_configureMainLabelWithText:", v5);

  -[PKInsitutionTableCell setAccessoryType:](self, "setAccessoryType:", 1);
  if (-[FKBankConnectInstitutionsProviderResponse consentStatus](self->_connectedInstitution, "consentStatus") == 1)
  {
    PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_DISCONNECTED"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInsitutionTableCell _configureSubTextLabelWithText:textColor:](self, "_configureSubTextLabelWithText:textColor:", v7, v6);

}

- (void)setSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80600]));
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKInsitutionTableCell;
    -[PSTableCell setSpecifier:](&v8, sel_setSpecifier_, v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkConnectedInsitution"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInsitutionTableCell setConnectedInstitution:](self, "setConnectedInstitution:", v7);
    -[PKInsitutionTableCell _configureCellWithSpecifier:](self, "_configureCellWithSpecifier:", v4);

  }
}

- (void)layoutSubviews
{
  CGRectEdge v3;
  void *v4;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat y;
  double v16;
  void *v17;
  id WeakRetained;
  UIActivityIndicatorView *snapshotSpinner;
  double MidX;
  UIImageView *iconImageView;
  void *v22;
  CGRect rect;
  CGRect slice;
  CGRect remainder;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)PKInsitutionTableCell;
  -[PSTableCell layoutSubviews](&v26, sel_layoutSubviews);
  if (-[PKInsitutionTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v3 = CGRectMaxXEdge;
  else
    v3 = CGRectMinXEdge;
  -[PKInsitutionTableCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  memset(&slice, 0, sizeof(slice));
  memset(&rect, 0, sizeof(rect));
  remainder = v27;
  CGRectDivide(v27, &slice, &remainder, 16.0, v3);
  CGRectDivide(remainder, &rect, &remainder, 29.0, v3);
  CGRectDivide(remainder, &slice, &remainder, 16.0, v3);
  width = remainder.size.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308);
  v7 = v6;
  -[UILabel sizeThatFits:](self->_subTitleLabel, "sizeThatFits:", width, 1.79769313e308);
  v9 = v8;
  v10 = v7 + 8.0 + 2.0 + v8 + 8.0;
  PKSizeAlignedInRect();
  x = v28.origin.x;
  v13 = v12;
  v14 = v28.size.width;
  v28.origin.y = v12 + 8.0;
  y = v28.origin.y;
  v28.size.height = v7;
  -[UILabel setFrame:](self->_subTitleLabel, "setFrame:", v28.origin.x, CGRectGetMaxY(v28) + 2.0, v28.size.width, v9);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", x, y, v14, v7);
  v16 = 60.0;
  if (v10 >= 60.0)
    v16 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16, *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D80600]));
  objc_msgSend(WeakRetained, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D80938]);

  rect.size.height = v10;
  rect.origin.y = v13;
  snapshotSpinner = self->_snapshotSpinner;
  v29.origin.x = rect.origin.x;
  v29.size.width = rect.size.width;
  v29.origin.y = v13;
  v29.size.height = v10;
  MidX = CGRectGetMidX(v29);
  -[UIActivityIndicatorView setCenter:](snapshotSpinner, "setCenter:", MidX, CGRectGetMidY(rect));
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[UIImageView image](iconImageView, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
    }
  }

}

+ (double)estimatedHeightForCell
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a1, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;
  objc_msgSend(a1, "subTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v5 + v7;

  return fmax(fmax(v8 + 2.0 + 16.0, 45.0), 60.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_snapshotSpinner, 0);
  objc_storeStrong((id *)&self->_connectedInstitution, 0);
}

@end

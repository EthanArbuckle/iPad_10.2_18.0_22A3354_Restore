@implementation PKPaymentPassDetailSectionController

- (PKPaymentPassDetailSectionController)init
{
  PKPaymentPassDetailSectionController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassDetailSectionController;
  result = -[PKPaymentPassDetailSectionController init](&v3, sel_init);
  if (result)
    result->_currentSegment = 0;
  return result;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (void)preflight:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (NSArray)allSectionIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 0;
}

- (void)_applyDefaultStaticStylingToCell:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  if (self->_highlightColor)
  {
    v4 = (objc_class *)MEMORY[0x1E0DC3F10];
    v5 = a3;
    v6 = [v4 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v7, "setBackgroundColor:", self->_highlightColor);
    objc_msgSend(v5, "setSelectedBackgroundView:", v7);

  }
  else
  {
    objc_msgSend(a3, "setSelectedBackgroundView:", 0);
  }
  PKAccessibilityIDDefaultCellSet(a3);

}

- (void)_applyDefaultDynamicStylingToCell:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setAccessoryType:", 0);
  objc_msgSend(v3, "setSelectionStyle:", 3);
  PKAccessibilityIDDefaultCellSet(v3);

}

- (id)defaultCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
  }
  -[PKPaymentPassDetailSectionController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v7);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);
  objc_msgSend(v8, "setTextColor:", v6);

  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setAccessoryView:", 0);

  return v7;
}

- (id)value1CellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("Cell-Value1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("Cell-Value1"));
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
  }
  -[PKPaymentPassDetailSectionController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v7);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);
  objc_msgSend(v8, "setTextColor:", v6);

  objc_msgSend(v7, "setAccessoryView:", 0);
  return v7;
}

- (id)subtitleCellForTableView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SubtitleCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SubtitleCell"));
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
  }
  -[PKPaymentPassDetailSectionController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v4);
  return v4;
}

- (id)spinnerCellForTableView:(id)a3
{
  PKLeftAlignedSpinnerCell *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("spinnerCell"));
  v4 = (PKLeftAlignedSpinnerCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[PKLeftAlignedSpinnerCell initWithStyle:reuseIdentifier:]([PKLeftAlignedSpinnerCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("spinnerCell"));
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v4);
    -[PKLeftAlignedSpinnerCell setAccessoryType:](v4, "setAccessoryType:", 0);
    -[PKLeftAlignedSpinnerCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (id)switchCellWithText:(id)a3 forTableView:(id)a4
{
  id v5;
  PKSettingTableCell *v6;
  void *v7;
  UIColor *primaryTextColor;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
  -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v6);
  -[PKSettingTableCell textLabel](v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  primaryTextColor = self->_primaryTextColor;
  -[PKSettingTableCell textLabel](v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (primaryTextColor)
  {
    objc_msgSend(v9, "setTextColor:", self->_primaryTextColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

  }
  return v6;
}

- (id)settingsTableCellWithTitle:(id)a3 action:(SEL)a4 setOn:(BOOL)a5 enabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  PKSettingTableCell *v11;
  UIColor *primaryTextColor;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = -[PKSettingTableCell initWithStyle:reuseIdentifier:]([PKSettingTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKSettingTableCellReuseIdentifier"));
  -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v11);
  primaryTextColor = self->_primaryTextColor;
  -[PKSettingTableCell textLabel](v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (primaryTextColor)
  {
    objc_msgSend(v13, "setTextColor:", self->_primaryTextColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v15);

  }
  -[PKSettingTableCell textLabel](v11, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v10);

  -[PKSettingTableCell setTarget:action:](v11, "setTarget:action:", self, a4);
  -[PKSettingTableCell setOn:](v11, "setOn:", v7);
  -[PKSettingTableCell setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", v6);
  return v11;
}

- (id)textFieldTableCellWithTitle:(id)a3 textValue:(id)a4 action:(SEL)a5 keyboardType:(int64_t)a6
{
  id v10;
  id v11;
  PKTextFieldTableViewCell *v12;
  UIColor *primaryTextColor;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;

  v10 = a4;
  v11 = a3;
  v12 = -[PKTextFieldTableViewCell initWithStyle:reuseIdentifier:]([PKTextFieldTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("PKTextFieldTableCellReuseIdentifier"));
  -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v12);
  primaryTextColor = self->_primaryTextColor;
  -[PKTextFieldTableViewCell textLabel](v12, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (primaryTextColor)
  {
    objc_msgSend(v14, "setTextColor:", self->_primaryTextColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v16);

  }
  -[PKTextFieldTableViewCell textLabel](v12, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v11);
  v18 = v11 != 0;

  -[PKTextFieldTableViewCell setSelectionStyle:](v12, "setSelectionStyle:", 0);
  -[PKTextFieldTableViewCell textField](v12, "textField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextAlignment:", 2 * v18);
  objc_msgSend(v19, "setText:", v10);

  objc_msgSend(v19, "setKeyboardType:", a6);
  objc_msgSend(v19, "setClearButtonMode:", 1);
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, a5, 0x20000);

  return v12;
}

- (id)disabledCellWithText:(id)a3 forTableView:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0DC3658];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "placeholderTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v8);

  objc_msgSend(v10, "setSelectionStyle:", 0);
  return v10;
}

- (id)linkCellWithText:(id)a3 forTableView:(id)a4
{
  UIColor *linkTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", linkTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "systemBlueColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  return v9;
}

- (id)checkmarkCellWithText:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  UIColor *primaryTextColor;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", primaryTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v6);

  if (self->_linkTextColor)
    objc_msgSend(v9, "setTintColor:");

  return v9;
}

- (id)disclosureCellWithTitle:(id)a3 forTableView:(id)a4
{
  UIColor *primaryTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  primaryTextColor = self->_primaryTextColor;
  if (primaryTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", primaryTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "labelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  objc_msgSend(v9, "setAccessoryType:", 1);
  return v9;
}

- (id)infoCellWithDescription:(id)a3 forTableView:(id)a4
{
  UIColor *detailTextColor;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  detailTextColor = self->_detailTextColor;
  if (detailTextColor)
  {
    v7 = a4;
    v8 = a3;
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", detailTextColor, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3658];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "secondaryLabelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController defaultCellWithTextColor:forTableView:](self, "defaultCellWithTextColor:forTableView:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", a3);

  objc_msgSend(v9, "setSelectionStyle:", 0);
  return v9;
}

- (id)infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("CellStyle-%ld"), a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:reuseIdentifier:forTableView:", v13, v12, a5, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)infoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 reuseIdentifier:(id)a6 forTableView:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a7, "dequeueReusableCellWithIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", a5, v12);
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v15);
  }
  -[PKPaymentPassDetailSectionController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v15);
  objc_msgSend(v15, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v14);

  if (self->_primaryTextColor)
  {
    objc_msgSend(v16, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v17);

  }
  objc_msgSend(v16, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  objc_msgSend(v15, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 4);
  objc_msgSend(v18, "setText:", v13);

  if (self->_detailTextColor)
  {
    objc_msgSend(v18, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

  }
  objc_msgSend(v18, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  return v15;
}

- (id)stackedInfoCellWithPrimaryText:(id)a3 detailText:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  id v10;
  id v11;
  PKStackedLabelCell *v12;
  void *v13;
  void *v14;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "dequeueReusableCellWithIdentifier:", CFSTR("StackedInfoCellIdentifier"));
  v12 = (PKStackedLabelCell *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[PKStackedLabelCell initWithStyle:reuseIdentifier:]([PKStackedLabelCell alloc], "initWithStyle:reuseIdentifier:", a5, CFSTR("StackedInfoCellIdentifier"));
    -[PKPaymentPassDetailSectionController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v12);
    if (self->_primaryTextColor)
    {
      -[PKStackedLabelCell setTitleTextColor:](v12, "setTitleTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedLabelCell setTitleTextColor:](v12, "setTitleTextColor:", v13);

    }
    if (self->_detailTextColor)
    {
      -[PKStackedLabelCell setDetailTextColor:](v12, "setDetailTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStackedLabelCell setDetailTextColor:](v12, "setDetailTextColor:", v14);

    }
  }
  -[PKPaymentPassDetailSectionController _applyDefaultDynamicStylingToCell:](self, "_applyDefaultDynamicStylingToCell:", v12);
  -[PKStackedLabelCell setTitleText:](v12, "setTitleText:", v11);

  -[PKStackedLabelCell setDetailText:](v12, "setDetailText:", v10);
  return v12;
}

- (void)showSpinner:(BOOL)a3 inCell:(id)a4 detailText:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[PKPaymentPassDetailSectionController showSpinner:inCell:overrideTextColor:](self, "showSpinner:inCell:overrideTextColor:", v6, v9, 0);
  objc_msgSend(v9, "detailTextLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v8);
}

- (void)showSpinner:(BOOL)a3 inCell:(id)a4 overrideTextColor:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  UIColor *primaryTextColor;
  UIColor *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIColor *v15;

  v6 = a3;
  v15 = (UIColor *)a5;
  v8 = a4;
  objc_msgSend(v8, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  primaryTextColor = v15;
  if (v15 || (primaryTextColor = self->_primaryTextColor) != 0)
  {
    v11 = primaryTextColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (v6)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v13, "startAnimating");
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v9, "setTextColor:", v12);
  objc_msgSend(v8, "setAccessoryView:", v13);

}

- (void)reportPassDetailsAnalyticsForTappedRowTag:(id)a3 additionalAnalytics:(id)a4 pass:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = *MEMORY[0x1E0D68FB8];
    v10 = *MEMORY[0x1E0D68AA0];
    v18[0] = *MEMORY[0x1E0D68F50];
    v18[1] = v10;
    v11 = *MEMORY[0x1E0D68C08];
    v19[0] = v9;
    v19[1] = v11;
    v18[2] = *MEMORY[0x1E0D69438];
    v19[2] = v7;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = a5;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v8)
      objc_msgSend(v15, "addEntriesFromDictionary:", v8);
    v16 = (void *)MEMORY[0x1E0D66A58];
    v17 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v16, "reportDashboardEventIfNecessary:forPass:", v17, v13);

  }
}

- (void)reportPassDetailsAnalyticsForTappedButtonTag:(id)a3 additionalAnalytics:(id)a4 pass:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = *MEMORY[0x1E0D68FB8];
    v10 = *MEMORY[0x1E0D68AA0];
    v18[0] = *MEMORY[0x1E0D68F50];
    v18[1] = v10;
    v11 = *MEMORY[0x1E0D68B18];
    v19[0] = v9;
    v19[1] = v11;
    v18[2] = *MEMORY[0x1E0D68858];
    v19[2] = v7;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = a5;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v8)
      objc_msgSend(v15, "addEntriesFromDictionary:", v8);
    v16 = (void *)MEMORY[0x1E0D66A58];
    v17 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v16, "reportDashboardEventIfNecessary:forPass:", v17, v13);

  }
}

- (void)reportPassDetailsAnalyticsForToggleTag:(id)a3 toggleResult:(BOOL)a4 additionalAnalytics:(id)a5 pass:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v8 = a4;
  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v11 = *MEMORY[0x1E0D68FB8];
    v12 = *MEMORY[0x1E0D68AA0];
    v23[0] = *MEMORY[0x1E0D68F50];
    v23[1] = v12;
    v13 = *MEMORY[0x1E0D68C28];
    v24[0] = v11;
    v24[1] = v13;
    v14 = *MEMORY[0x1E0D695A0];
    v23[2] = *MEMORY[0x1E0D695D8];
    v23[3] = v14;
    v15 = (uint64_t *)MEMORY[0x1E0D695B0];
    if (!v8)
      v15 = (uint64_t *)MEMORY[0x1E0D695A8];
    v16 = *v15;
    v24[2] = v9;
    v24[3] = v16;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = a6;
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if (v10)
      objc_msgSend(v20, "addEntriesFromDictionary:", v10);
    v21 = (void *)MEMORY[0x1E0D66A58];
    v22 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v21, "reportDashboardEventIfNecessary:forPass:", v22, v18);

  }
}

- (unint64_t)currentSegment
{
  return self->_currentSegment;
}

- (void)setCurrentSegment:(unint64_t)a3
{
  self->_currentSegment = a3;
}

- (int64_t)detailViewStyle
{
  return self->_detailViewStyle;
}

- (void)setDetailViewStyle:(int64_t)a3
{
  self->_detailViewStyle = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (void)setDetailTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextColor, a3);
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (void)setLinkTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkTextColor, a3);
}

- (UIColor)warningTextColor
{
  return self->_warningTextColor;
}

- (void)setWarningTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_warningTextColor, a3);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_warningTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
}

@end

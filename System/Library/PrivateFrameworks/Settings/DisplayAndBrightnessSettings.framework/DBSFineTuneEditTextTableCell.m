@implementation DBSFineTuneEditTextTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *validationLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)DBSFineTuneEditTextTableCell;
  -[PSEditableTableCell refreshCellContentsWithSpecifier:](&v43, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceLayoutDirection") != 1;

  -[PSEditableTableCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 2 * v6);
  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSFineTuneEditTextTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v10);

  v11 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  objc_msgSend(v11, "monospacedDigitSystemFontOfSize:weight:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v13);

  v41 = *MEMORY[0x24BE759B0];
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  self->_minValue = v15;

  v16 = *MEMORY[0x24BE759A8];
  v42 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE759A8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  self->_maxValue = v18;

  self->_valueValid = 0;
  objc_msgSend(v7, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    v21 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v21, "setNumberStyle:", 1);
    objc_msgSend(v7, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberFromString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    v26 = self->_minValue + -0.000001 < v25;
    if (self->_maxValue + 0.000001 <= v25)
      v26 = 0;
    self->_valueValid = v26;

  }
  else
  {
    self->_valueValid = 1;
  }
  v27 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v27, "setNumberStyle:", 1);
  if (self->_maxValue >= 1.0)
  {
    objc_msgSend(v27, "setMinimumFractionDigits:", 1);
    objc_msgSend(v27, "setMaximumFractionDigits:", 1);
    objc_msgSend(v27, "setRoundingMode:", 2);
  }
  else
  {
    objc_msgSend(v27, "setMinimumIntegerDigits:", 1);
    objc_msgSend(v27, "setMaximumIntegerDigits:", 1);
    objc_msgSend(v27, "setMinimumFractionDigits:", 4);
    objc_msgSend(v27, "setMaximumFractionDigits:", 4);
  }
  objc_msgSend(v42, "objectForKeyedSubscript:", v41);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringFromNumber:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "objectForKeyedSubscript:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringFromNumber:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  validationLabel = self->_validationLabel;
  self->_validationLabel = v32;

  objc_msgSend(v7, "font");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_validationLabel, "setFont:", v34);

  v35 = (void *)MEMORY[0x24BDD17C8];
  DBS_LocalizedStringForFineTune(CFSTR("VALIDATION_MESSAGE"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", v36, v29, v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_validationLabel, "setText:", v37);

  objc_msgSend(v7, "textColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_validationLabel, "setTextColor:", v38);

  -[UILabel setHidden:](self->_validationLabel, "setHidden:", 0);
  objc_msgSend(v42, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqual:", CFSTR("MEASURED_WHITE_POINT_X")) & 1) != 0
    || (objc_msgSend(v39, "isEqual:", CFSTR("MEASURED_WHITE_POINT_Y")) & 1) != 0
    || (objc_msgSend(v39, "isEqual:", CFSTR("MEASURED_LUMINANCE")) & 1) != 0)
  {
    v40 = 1;
LABEL_13:
    self->_hideIfValid = v40;
    goto LABEL_14;
  }
  if ((objc_msgSend(v39, "isEqual:", CFSTR("TARGET_WHITE_POINT_X")) & 1) != 0
    || (objc_msgSend(v39, "isEqual:", CFSTR("TARGET_WHITE_POINT_Y")) & 1) != 0
    || objc_msgSend(v39, "isEqual:", CFSTR("TARGET_LUMINANCE")))
  {
    v40 = 0;
    goto LABEL_13;
  }
LABEL_14:
  -[DBSFineTuneEditTextTableCell addSubview:](self, "addSubview:", self->_validationLabel);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  unint64_t v27;
  double v28;
  double v29;
  BOOL v31;
  id *v32;
  id WeakRetained;
  uint64_t v34;
  void (*v35)(void *, uint64_t, void *, void *);
  uint64_t v36;
  uint64_t v38;

  length = a4.length;
  location = a4.location;
  v9 = (objc_class *)MEMORY[0x24BDD16F0];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v13 = 1;
  objc_msgSend(v12, "setNumberStyle:", 1);
  objc_msgSend(v12, "groupingSeparator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "decimalSeparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "isEqualToString:", v15) & 1) == 0)
  {
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v17, "componentsSeparatedByString:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_24F026548);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberFromString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v22 = v19 - 1;
      if (objc_msgSend(v20, "containsString:", v15))
      {
        v38 = v19 - 1;
        v23 = objc_msgSend(v17, "rangeOfString:", v15);
        objc_msgSend(v17, "substringFromIndex:", v23 + v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsString:", v14);
        v27 = objc_msgSend(v20, "length");

        v13 = 0;
        if (v27 > 6 || (v26 & 1) != 0 || v38 > 1)
          goto LABEL_21;
      }
      else
      {
        v13 = 0;
        if ((unint64_t)objc_msgSend(v20, "length") > 4 || v22 > 1)
          goto LABEL_21;
      }
      objc_msgSend(v21, "doubleValue");
      v28 = v29;

    }
    else
    {
      v28 = 0.0;
    }
    v31 = self->_minValue + -0.000001 < v28 && self->_maxValue + 0.000001 > v28 || objc_msgSend(v17, "length") == 0;
    self->_valueValid = v31;
    -[DBSFineTuneEditTextTableCell setNeedsLayout](self, "setNeedsLayout");
    -[DBSFineTuneEditTextTableCell layoutIfNeeded](self, "layoutIfNeeded");
    v32 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75698]);
    WeakRetained = objc_loadWeakRetained(v32);
    v34 = (int)*MEMORY[0x24BE756A0];
    v35 = (void (*)(void *, uint64_t, void *, void *))objc_msgSend(WeakRetained, "methodForSelector:", *(Class *)((char *)&self->super.super.super.super.super.super.isa+ v34));

    v20 = objc_loadWeakRetained(v32);
    v36 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v34);
    -[PSTableCell specifier](self, "specifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35(v20, v36, v17, v21);
    v13 = 1;
    goto LABEL_21;
  }
LABEL_22:

  return v13;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 hideIfValid;
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  double v22;
  CGFloat v23;
  void *v24;
  double MidY;
  CGFloat v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v27.receiver = self;
  v27.super_class = (Class)DBSFineTuneEditTextTableCell;
  -[PSEditableTableCell layoutSubviews](&v27, sel_layoutSubviews);
  if (self->_valueValid)
  {
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "altTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSFineTuneEditTextTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_validationLabel, "setTextColor:", v5);

    hideIfValid = self->_hideIfValid;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_validationLabel, "setTextColor:", v7);

    hideIfValid = 0;
  }
  -[UILabel setHidden:](self->_validationLabel, "setHidden:", hideIfValid);
  v8 = -[DBSFineTuneEditTextTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[UILabel frame](self->_validationLabel, "frame");
  v10 = v9;
  -[UILabel sizeThatFits:](self->_validationLabel, "sizeThatFits:", v11, v12);
  v14 = v13;
  v16 = v15;
  -[PSEditableTableCell textField](self, "textField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  if (v8)
  {
    v22 = 100.0;
  }
  else
  {
    v18 = CGRectGetMaxX(*(CGRect *)&v18) - v14;
    v22 = -100.0;
  }
  v23 = v18 + v22;

  -[PSEditableTableCell textField](self, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  MidY = CGRectGetMidY(v28);

  v29.origin.x = v23;
  v29.origin.y = v10;
  v29.size.width = v14;
  v29.size.height = v16;
  v26 = MidY - CGRectGetMidY(v29);
  v30.origin.x = v23;
  v30.origin.y = v10;
  v30.size.width = v14;
  v30.size.height = v16;
  v31 = CGRectOffset(v30, 0.0, v26);
  -[UILabel setFrame:](self->_validationLabel, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationLabel, 0);
}

@end

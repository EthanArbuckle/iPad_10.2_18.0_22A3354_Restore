@implementation BFFSimplePasscodeInputView

- (BFFSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  BFFSimplePasscodeInputView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PSPasscodeField *passcodeField;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BFFSimplePasscodeInputView;
  v5 = -[BFFPasscodeInputView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE75560]), "initWithNumberOfEntryFields:", a4);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = (PSPasscodeField *)v8;

    -[PSPasscodeField setDelegate:](v5->_passcodeField, "setDelegate:", v5);
    -[BFFSimplePasscodeInputView addSubview:](v5, "addSubview:", v5->_passcodeField);
    -[BFFSimplePasscodeInputView setLimitCharactersToNumbers:](v5, "setLimitCharactersToNumbers:", 1);
  }
  return v5;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)layoutSubviews
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double MaxY;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
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
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v48.receiver = self;
  v48.super_class = (Class)BFFSimplePasscodeInputView;
  -[BFFPasscodeInputView layoutSubviews](&v48, sel_layoutSubviews);
  -[BFFSimplePasscodeInputView passcodeField](self, "passcodeField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  -[BFFSimplePasscodeInputView bounds](self, "bounds");
  v12 = v11;
  v13 = 0.0;
  if (!IsAccessibilityCategory)
  {
    -[BFFSimplePasscodeInputView bounds](self, "bounds");
    v13 = floor((v14 - v10) * 0.5);
  }
  -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFSimplePasscodeInputView convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
    MaxY = CGRectGetMaxY(v49);
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_baselineOffsetFromBottom");
    v31 = MaxY - v30 + 36.0 + -7.0;

    if (v13 >= v31)
      v31 = v13;
  }
  else
  {
    -[BFFPasscodeInputView instructions](self, "instructions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v47 = v8;
    v39 = v10;
    v40 = v12;
    v42 = v41;

    v50.origin.x = v34;
    v50.origin.y = v36;
    v50.size.width = v38;
    v50.size.height = v42;
    v43 = CGRectGetMaxY(v50) + 10.0;
    if (v13 >= v43)
      v31 = v13;
    else
      v31 = v43;
    -[BFFPasscodeInputView instructions](self, "instructions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v42;
    v12 = v40;
    v10 = v39;
    v8 = v47;
    objc_msgSend(v44, "setFrame:", v34, v36, v38, v45);

  }
  -[BFFSimplePasscodeInputView passcodeField](self, "passcodeField");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", floor((v12 - v8) * 0.5), v31, v8, v10);

}

- (void)setPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFSimplePasscodeInputView passcodeField](self, "passcodeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

- (id)passcode
{
  void *v2;
  void *v3;

  -[BFFSimplePasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  -[PSPasscodeField setEnabled:](self->_passcodeField, "setEnabled:", a3);
}

- (id)passcodeField:(id)a3 shouldInsertText:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  if (-[BFFSimplePasscodeInputView limitCharactersToNumbers](self, "limitCharactersToNumbers"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invertedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", &stru_24D234A48);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[BFFPasscodeInputView delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[BFFPasscodeInputView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[BFFPasscodeInputView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "passcodeInput:enteredPasscode:", self, v10);

    }
  }

}

- (BOOL)limitCharactersToNumbers
{
  return self->_limitCharactersToNumbers;
}

- (void)setLimitCharactersToNumbers:(BOOL)a3
{
  self->_limitCharactersToNumbers = a3;
}

- (PSPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end

@implementation VSTwoFactorEntryViewModel

- (VSTwoFactorEntryViewModel)init
{
  VSTwoFactorEntryViewModel *v2;
  VSTwoFactorEntryTextField *v3;
  VSTwoFactorEntryTextField *twoFactorTextField;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)VSTwoFactorEntryViewModel;
  v2 = -[VSCuratedViewModel init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSTwoFactorEntryTextField);
    twoFactorTextField = v2->_twoFactorTextField;
    v2->_twoFactorTextField = v3;

    -[VSTwoFactorEntryTextField setReturnKeyType:](v2->_twoFactorTextField, "setReturnKeyType:", 9);
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("twoFactorTextField.text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("originalTwoFacorCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1548];
    v24[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expressionForFunction:arguments:", CFSTR("length:"), v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("twoFactorTextField.expectedLength"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14B8], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v21, 0, 5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14B8], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v20, v19, 0, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD14C0];
    v23[0] = v9;
    v23[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", MEMORY[0x24BDBD1C8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", MEMORY[0x24BDBD1C0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConditional:trueExpression:falseExpression:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BDF8BE8]);
    objc_msgSend(v16, "setObject:", v2);
    objc_msgSend(v16, "setExpression:", v15);
    -[VSTwoFactorEntryViewModel setButtonExpressionEvaluator:](v2, "setButtonExpressionEvaluator:", v16);
    VSMainConcurrencyBindingOptions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSTwoFactorEntryViewModel vs_bind:toObject:withKeyPath:options:](v2, "vs_bind:toObject:withKeyPath:options:", CFSTR("beginValidationButtonEnabled"), v16, CFSTR("value"), v17);

  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "vs_frameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TWO_FACTOR_VERIFY_BUTTON_TITLE"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSCuratedViewModel setBeginValidationButtonTitle:](self, "setBeginValidationButtonTitle:", v7);
  -[VSViewModel identityProvider](self, "identityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceUnwrapObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSViewModel setTitle:](self, "setTitle:", v10);
  v11.receiver = self;
  v11.super_class = (Class)VSTwoFactorEntryViewModel;
  -[VSCuratedViewModel configureWithRequest:](&v11, sel_configureWithRequest_, v5);

}

- (void)setTwoFactorTextField:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_twoFactorTextField, a3);
  v5 = a3;
  objc_msgSend(v5, "setReturnKeyType:", 9);
  objc_msgSend(v5, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[VSTwoFactorEntryViewModel setOriginalTwoFacorCode:](self, "setOriginalTwoFacorCode:", v6);
}

- (void)buttonAtIndexWasPressed:(unint64_t)a3
{
  id v5;

  -[VSTwoFactorEntryViewModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "twoFactorEntryViewModel:didPressButtonAtIndex:", self, a3);

}

- (VSTwoFactorEntryViewModelDelegate)delegate
{
  return (VSTwoFactorEntryViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSTwoFactorEntryTextField)twoFactorTextField
{
  return self->_twoFactorTextField;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)originalTwoFacorCode
{
  return self->_originalTwoFacorCode;
}

- (void)setOriginalTwoFacorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (VSExpressionEvaluator)buttonExpressionEvaluator
{
  return self->_buttonExpressionEvaluator;
}

- (void)setButtonExpressionEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, 0);
  objc_storeStrong((id *)&self->_originalTwoFacorCode, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_twoFactorTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation WFNumberFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFNumberFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFNumberFieldParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *textAlignment;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  WFNumberFieldParameter *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFNumberFieldParameter;
  v5 = -[WFParameter initWithDefinition:](&v20, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("TextAlignment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsDecimalNumbers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsNegativeNumbers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v16 = objc_msgSend(v12, "BOOLValue");
    else
      v16 = objc_msgSend((id)objc_opt_class(), "defaultAllowsDecimalNumbers");
    v5->_allowsDecimalNumbers = v16;
    if (v15)
      v17 = objc_msgSend(v15, "BOOLValue");
    else
      v17 = objc_msgSend((id)objc_opt_class(), "defaultAllowsNegativeNumbers");
    v5->_allowsNegativeNumbers = v17;
    v18 = v5;

  }
  return v5;
}

- (id)defaultSupportedVariableTypes
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", CFSTR("CurrentDate"));
  return v3;
}

- (BOOL)shouldAlignLabels
{
  return 1;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  objc_class *v10;
  void (**v11)(id, void *);
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _QWORD *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v10 = (objc_class *)MEMORY[0x1E0DC7DC8];
  v11 = (void (**)(id, void *))a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v22 = objc_alloc_init(v10);
  objc_msgSend(v13, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setText:", v15);
  -[WFParameter localizedPlaceholder](self, "localizedPlaceholder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPlaceholder:", v16);

  objc_msgSend(v22, "setAllowsNegativeNumbers:", -[WFNumberFieldParameter allowsNegativeNumbers](self, "allowsNegativeNumbers"));
  v17 = -[WFNumberFieldParameter allowsDecimalNumbers](self, "allowsDecimalNumbers");
  v18 = (_QWORD *)MEMORY[0x1E0DC8340];
  if (!v17)
    v18 = (_QWORD *)MEMORY[0x1E0DC8358];
  objc_msgSend(v22, "setKeyboardType:", *v18);
  v19 = objc_alloc(MEMORY[0x1E0DC7B98]);
  -[WFParameter key](self, "key");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTextFieldConfiguration:message:attribution:prompt:parameterKey:", v22, 0, v14, v12, v20);

  v11[2](v11, v21);
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v3;
  void *v4;
  WFNumberStringSubstitutableState *v5;
  void *v6;
  WFNumberStringSubstitutableState *v7;

  v3 = a3;
  objc_msgSend(v3, "inputtedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [WFNumberStringSubstitutableState alloc];
    objc_msgSend(v3, "inputtedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFNumberStringSubstitutableState initWithValue:](v5, "initWithValue:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)allowsDecimalNumbers
{
  return self->_allowsDecimalNumbers;
}

- (BOOL)allowsNegativeNumbers
{
  return self->_allowsNegativeNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAlignment, 0);
}

+ (BOOL)defaultAllowsDecimalNumbers
{
  return 0;
}

+ (BOOL)defaultAllowsNegativeNumbers
{
  return 1;
}

@end

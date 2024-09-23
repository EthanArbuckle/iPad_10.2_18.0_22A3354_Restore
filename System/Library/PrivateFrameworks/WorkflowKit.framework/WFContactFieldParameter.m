@implementation WFContactFieldParameter

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFContactFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFContactFieldParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *textAlignment;
  uint64_t v14;
  NSString *autocapitalizationType;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  WFContactFieldParameter *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFContactFieldParameter;
  v5 = -[WFParameter initWithDefinition:](&v29, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsTextEntry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = (void *)MEMORY[0x1E0C9AAB0];
    v5->_allowsTextEntry = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("TextAlignment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("AutocapitalizationType"));
    v14 = objc_claimAutoreleasedReturnValue();
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableAutocorrection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
    v20 = (id *)MEMORY[0x1E0DC8338];
    if (!v19)
      v20 = (id *)MEMORY[0x1E0DC8330];
    objc_storeStrong((id *)&v5->_autocorrectionType, *v20);

    objc_msgSend(v4, "objectForKey:", CFSTR("HidesLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    WFEnforceClass(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hidesLabel = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsCustomHandles"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    WFEnforceClass(v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsCustomHandles = objc_msgSend(v26, "BOOLValue");

    v27 = v5;
  }

  return v5;
}

- (NSString)keyboardType
{
  void *v2;
  id *v3;
  NSString *v4;

  -[WFContactFieldParameter supportedContactProperties](self, "supportedContactProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") != 1)
    goto LABEL_6;
  if ((objc_msgSend(v2, "containsObject:", CFSTR("Email")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "containsObject:", CFSTR("Phone")) & 1) != 0)
    {
      v3 = (id *)MEMORY[0x1E0DC8360];
      goto LABEL_7;
    }
LABEL_6:
    v3 = (id *)MEMORY[0x1E0DC8348];
    goto LABEL_7;
  }
  v3 = (id *)MEMORY[0x1E0DC8350];
LABEL_7:
  v4 = (NSString *)*v3;

  return v4;
}

- (BOOL)shouldAlignLabels
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;

  -[WFContactFieldParameter textAlignment](self, "textAlignment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0DC8388];
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v4 && v5)
      v7 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v7;
}

- (BOOL)allowsCustomHandles
{
  return self->_allowsCustomHandles;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (NSArray)supportedContactProperties
{
  return self->_supportedContactProperties;
}

- (BOOL)hidesLabel
{
  return self->_hidesLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedContactProperties, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
}

@end

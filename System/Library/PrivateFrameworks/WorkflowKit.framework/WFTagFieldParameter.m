@implementation WFTagFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFTagFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFTagFieldParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *keyboardType;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *textAlignment;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *autocapitalizationType;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *suggestedTags;
  WFTagFieldParameter *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFTagFieldParameter;
  v5 = -[WFParameter initWithDefinition:](&v29, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("KeyboardType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("TextAlignment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("AutocapitalizationType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableAutocorrection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    WFEnforceClass(v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");
    v22 = (id *)MEMORY[0x1E0DC8338];
    if (!v21)
      v22 = (id *)MEMORY[0x1E0DC8330];
    objc_storeStrong((id *)&v5->_autocorrectionType, *v22);

    objc_msgSend(v4, "objectForKey:", CFSTR("SuggestedTags"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    WFEnforceClass(v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    suggestedTags = v5->_suggestedTags;
    v5->_suggestedTags = (NSArray *)v25;

    v27 = v5;
  }

  return v5;
}

- (BOOL)shouldAlignLabels
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  char v7;

  -[WFTagFieldParameter textAlignment](self, "textAlignment");
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

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (NSArray)suggestedTags
{
  return self->_suggestedTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTags, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
}

@end

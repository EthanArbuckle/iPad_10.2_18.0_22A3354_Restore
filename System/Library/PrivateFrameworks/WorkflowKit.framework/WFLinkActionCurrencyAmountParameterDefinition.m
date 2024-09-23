@implementation WFLinkActionCurrencyAmountParameterDefinition

- (WFLinkActionCurrencyAmountParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionCurrencyAmountParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D10];
  v5 = a3;
  objc_msgSend(v4, "currencyAmountValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionCurrencyAmountParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", &unk_1E7B8BDB8, CFSTR("DefaultValue"));
  objc_msgSend(v3, "setValue:forKey:", *MEMORY[0x1E0DC8390], CFSTR("TextAlignment"));
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("AllowsNegativeNumbers"));
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AA8], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PossibleUnits"));
  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionCurrencyAmountParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v8, sel_parameterDefinitionDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "definitionByAddingEntriesInDictionary:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v4;
    else
      v3 = 0;
  }
  v5 = v3;

  return v5;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_alloc(MEMORY[0x1E0CBD848]);
    objc_msgSend(v8, "magnitudeState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decimalNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v9, "initWithAmount:currencyCode:", v11, v12);

    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v20 = v11;
  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = objc_alloc(MEMORY[0x1E0CBD848]);
    objc_msgSend(v20, "magnitude");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unitString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithAmount:currencyCode:", v16, v17);

    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v19, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v3;
  WFNumberStringSubstitutableState *v4;
  void *v5;
  void *v6;
  WFNumberStringSubstitutableState *v7;
  WFQuantityParameterState *v8;
  void *v9;
  WFQuantityParameterState *v10;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [WFNumberStringSubstitutableState alloc];
    objc_msgSend(v3, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFNumberStringSubstitutableState initWithValue:](v4, "initWithValue:", v6);

    v8 = [WFQuantityParameterState alloc];
    objc_msgSend(v3, "currencyCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v8, "initWithMagnitudeState:unitString:", v7, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

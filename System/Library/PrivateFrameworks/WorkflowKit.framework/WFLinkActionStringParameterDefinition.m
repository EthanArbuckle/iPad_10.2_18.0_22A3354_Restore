@implementation WFLinkActionStringParameterDefinition

- (WFLinkActionStringParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionStringParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "stringValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  _BOOL4 v3;
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t v7;
  int64_t v8;
  WFParameterDefinition *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFParameterDefinition *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[7];
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v3 = -[WFLinkActionParameterDefinition BOOLForTypeSpecificMetadataKey:defaultValue:](self, "BOOLForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B50], 1);
  v4 = -[WFLinkActionParameterDefinition BOOLForTypeSpecificMetadataKey:defaultValue:](self, "BOOLForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B68], 0);
  v5 = -[WFLinkActionParameterDefinition BOOLForTypeSpecificMetadataKey:defaultValue:](self, "BOOLForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B70], 1);
  v6 = -[WFLinkActionParameterDefinition BOOLForTypeSpecificMetadataKey:defaultValue:](self, "BOOLForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B78], 1);
  v7 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B60], 4);
  v8 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B58], 2);
  v9 = [WFParameterDefinition alloc];
  v23[0] = *MEMORY[0x1E0DC8390];
  v22[0] = CFSTR("TextAlignment");
  v22[1] = CFSTR("DisableAutocorrection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v22[2] = CFSTR("Multiline");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  v22[3] = CFSTR("DisableSmartDashes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  v22[4] = CFSTR("DisableSmartQuotes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v13;
  v22[5] = CFSTR("KeyboardType");
  -[WFLinkActionStringParameterDefinition keyboardTypeFromStringKeyboardType:](self, "keyboardTypeFromStringKeyboardType:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v14;
  v22[6] = CFSTR("AutocapitalizationType");
  -[WFLinkActionStringParameterDefinition autocapitalizationTypeFromStringCapitalizationType:](self, "autocapitalizationTypeFromStringCapitalizationType:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFParameterDefinition initWithDictionary:](v9, "initWithDictionary:", v16);

  v21.receiver = self;
  v21.super_class = (Class)WFLinkActionStringParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v21, sel_parameterDefinitionDictionary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "definitionByMergingWithDefinition:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "variableString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingVariables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFVariableString *v10;
  WFVariableStringParameterState *v11;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v4);
    v11 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)keyboardTypeFromStringKeyboardType:(int64_t)a3
{
  id *v3;

  if ((unint64_t)a3 > 3)
    v3 = (id *)MEMORY[0x1E0DC8348];
  else
    v3 = (id *)qword_1E7AF8450[a3];
  return *v3;
}

- (id)autocapitalizationTypeFromStringCapitalizationType:(int64_t)a3
{
  id *v3;

  if ((unint64_t)a3 > 3)
    v3 = (id *)MEMORY[0x1E0DC8328];
  else
    v3 = (id *)qword_1E7AF8470[a3];
  return *v3;
}

@end

@implementation WFLinkActionDoubleParameterDefinition

- (WFLinkActionDoubleParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionDoubleParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "doubleValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B18], 1);
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "decimalNumber");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;
      objc_msgSend(v6, "number");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v7;
    if (v7)
    {
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v11.receiver = self;
  v11.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  -[WFLinkActionParameterDefinition linkValueFromParameterState:action:](&v11, sel_linkValueFromParameterState_action_, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

- (id)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  int64_t v6;
  int64_t v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v17;
  BOOL v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43B20], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43B30], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  v6 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B18], 1);
  v7 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B28], 0);
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v8 < 0.0;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((unint64_t)(v7 - 3) <= 1)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v10, "numberWithDouble:", v11 + -2.22507386e-308);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  switch(v6)
  {
    case 0:
      -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "wf_localizedTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v23, CFSTR("StepperDescription"));

      v24 = (void *)MEMORY[0x1E0CB3940];
      -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "wf_localizedTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithFormat:", CFSTR("%@: %@"), v25, CFSTR("%ld"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v26, CFSTR("StepperNoun"));

LABEL_21:
      break;
    case 1:
      objc_msgSend(v9, "setValue:forKey:", *MEMORY[0x1E0DC8390], CFSTR("TextAlignment"));
      objc_msgSend(v9, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AllowsDecimalNumbers"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v27, CFSTR("AllowsNegativeNumbers"));

      goto LABEL_24;
    case 2:
      objc_msgSend(v3, "doubleValue");
      v14 = v13;
      objc_msgSend(v4, "doubleValue");
      if (v14 > 1.0 && v4 == 0)
        v17 = v14 + 1.0;
      else
        v17 = v15;
      v18 = v17 < 0.0 && v3 == 0;
      v19 = v17 + -1.0;
      if (!v18)
        v19 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
      v21 = v4;
      v3 = (void *)v20;
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
  }
  objc_msgSend(v9, "setValue:forKey:", v3, CFSTR("MinimumValue"));
  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("MaximumValue"));
LABEL_24:
  v31.receiver = self;
  v31.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v31, sel_parameterDefinitionDictionary);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "definitionByAddingEntriesInDictionary:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  -[WFLinkActionParameterDefinition defaultSerializedRepresentationFromParameterMetadataDefaultValue:](&v8, sel_defaultSerializedRepresentationFromParameterMetadataDefaultValue_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFNumberSubstitutableState *v10;

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
    v10 = -[WFNumberSubstitutableState initWithNumber:]([WFNumberSubstitutableState alloc], "initWithNumber:", v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    objc_msgSend(v4, "stringFromNumber:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

@implementation WFLinkActionIntParameterDefinition

- (WFLinkActionIntParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionIntParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "intValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionIntParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B18], 1);
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)parameterDefinitionDictionary
{
  _BOOL8 v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = 1;
  v4 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B18], 1);
  v5 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B28], 0);
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43B20], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43B30], objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v3 = v8 < 0.0;
  }
  if ((unint64_t)(v5 - 3) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "integerValue") - 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (!v4)
  {
    objc_msgSend(v10, "setValue:forKey:", v6, CFSTR("MinimumValue"));
    objc_msgSend(v11, "setValue:forKey:", v7, CFSTR("MaximumValue"));
    -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wf_localizedTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v14, CFSTR("StepperDescription"));

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wf_localizedTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", CFSTR("%@: %@"), v16, CFSTR("%ld"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v17, CFSTR("StepperNoun"));

    goto LABEL_9;
  }
  if (v4 == 1)
  {
    objc_msgSend(v10, "setValue:forKey:", *MEMORY[0x1E0DC8390], CFSTR("TextAlignment"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("AllowsNegativeNumbers"));
LABEL_9:

  }
  v21.receiver = self;
  v21.super_class = (Class)WFLinkActionIntParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v21, sel_parameterDefinitionDictionary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "definitionByAddingEntriesInDictionary:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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
  v11.super_class = (Class)WFLinkActionIntParameterDefinition;
  -[WFLinkActionParameterDefinition linkValueFromParameterState:action:](&v11, sel_linkValueFromParameterState_action_, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
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
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "value");
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

@end

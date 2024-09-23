@implementation WFLinkActionDateParameterDefinition

- (WFLinkActionDateParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionDateParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "dateValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDateParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  id v8;
  __CFString **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AC0], 2);
  v4 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AC8], 0);
  v5 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AB0], 2);
  v6 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AB8], 2);
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43AD0], objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setValue:forKey:", *MEMORY[0x1E0DC8390], CFSTR("TextAlignment"));
  if (v3 > 2)
    v9 = WFDateFieldHintDateModeDateAndTime;
  else
    v9 = off_1E7AF01F0[v3];
  objc_msgSend(v8, "setValue:forKey:", *v9, CFSTR("HintDateMode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 == 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("DateFormatterAllowsRelative"));

  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("DateFormatterTemplate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("DateFormatterDateStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("DateFormatterTimeStyle"));

  v16.receiver = self;
  v16.super_class = (Class)WFLinkActionDateParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v16, sel_parameterDefinitionDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "definitionByAddingEntriesInDictionary:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "variableString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingVariables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFLinkActionDateParameterDefinition dateFromStringValue:error:](self, "dateFromStringValue:error:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  id v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)dateFromStringValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D13F28], "datesInString:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v7)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *a4;
      v11 = 136315650;
      v12 = "-[WFLinkActionDateParameterDefinition dateFromStringValue:error:]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get date for parameter value: %@, error: %@", (uint8_t *)&v11, 0x20u);
    }

  }
  return v7;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  WFDateFieldParameter *v10;
  void *v11;
  WFDateFieldParameter *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  WFVariableString *v18;
  WFDateFieldParameterState *v19;

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
    v10 = [WFDateFieldParameter alloc];
    -[WFLinkActionDateParameterDefinition parameterDefinitionDictionary](self, "parameterDefinitionDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFDateFieldParameter initWithDefinition:](v10, "initWithDefinition:", v11);

    v13 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    -[WFDateFieldParameter hintDateFormatter](v12, "hintDateFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v17);
    v19 = -[WFVariableStringParameterState initWithVariableString:]([WFDateFieldParameterState alloc], "initWithVariableString:", v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4;
  WFDateFieldParameter *v5;
  void *v6;
  WFDateFieldParameter *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [WFDateFieldParameter alloc];
  -[WFLinkActionDateParameterDefinition parameterDefinitionDictionary](self, "parameterDefinitionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFDateFieldParameter initWithDefinition:](v5, "initWithDefinition:", v6);

  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[WFDateFieldParameter hintDateFormatter](v7, "hintDateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

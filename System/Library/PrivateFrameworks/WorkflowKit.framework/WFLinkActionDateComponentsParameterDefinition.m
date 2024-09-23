@implementation WFLinkActionDateComponentsParameterDefinition

- (WFLinkActionDateComponentsParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionDateComponentsParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "dateComponentsValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDateComponentsParameterDefinition;
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

  v3 = -[WFLinkActionDateComponentsParameterDefinition dateFormat](self, "dateFormat");
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
  v16.super_class = (Class)WFLinkActionDateComponentsParameterDefinition;
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
      -[WFLinkActionDateComponentsParameterDefinition dateComponentsFromStringValue:error:](self, "dateComponentsFromStringValue:error:", v10, 0);
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
  id v15;
  void *v16;
  id v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = v11;
  v21 = v15;
  if (!v15)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v17 = v21;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v15 = v21;
    if ((isKindOfClass & 1) != 0)
    {
      -[WFLinkActionDateComponentsParameterDefinition dateComponentsFromDateValue:](self, "dateComponentsFromDateValue:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v20, 0);

      goto LABEL_7;
    }
LABEL_6:

    v14[2](v14, 0, 0);
    goto LABEL_7;
  }
  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v16, 0);

LABEL_7:
}

- (id)dateComponentsFromStringValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D13F28], "datesInString:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v11)
      {
        v12 = *a4;
        v17 = 136315650;
        v18 = "-[WFLinkActionDateComponentsParameterDefinition dateComponentsFromStringValue:error:]";
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = v12;
        v13 = "%s Unable to detect dates from parameter string value: %@ with error: %@";
        v14 = v10;
        v15 = 32;
LABEL_8:
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
      }
    }
    else if (v11)
    {
      v17 = 136315394;
      v18 = "-[WFLinkActionDateComponentsParameterDefinition dateComponentsFromStringValue:error:]";
      v19 = 2112;
      v20 = v6;
      v13 = "%s Unable to detect dates from parameter string value: %@";
      v14 = v10;
      v15 = 22;
      goto LABEL_8;
    }

    v9 = 0;
    goto LABEL_10;
  }
  -[WFLinkActionDateComponentsParameterDefinition dateComponentsFromDateValue:](self, "dateComponentsFromDateValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

- (id)dateComponentsFromDateValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFLinkActionDateComponentsParameterDefinition dateFormat](self, "dateFormat");
  v8 = 252;
  if (!v7)
    v8 = 28;
  if (v7 == 1)
    v9 = 224;
  else
    v9 = v8;
  objc_msgSend(v6, "components:fromDate:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  WFDateFieldParameter *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  WFDateFieldParameterState *v21;
  WFDateFieldParameter *v22;
  void *v23;
  WFDateFieldParameter *v24;
  void *v25;
  void *v26;
  WFVariableString *v27;

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
    v10 = -[WFLinkActionDateComponentsParameterDefinition dateFormat](self, "dateFormat");
    v11 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AC8], 0);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    v17 = v16;
    if (v11 == 1)
    {
      objc_msgSend(v16, "setCalendar:", v12);
      objc_msgSend(v17, "setUnitsStyle:", 2);
      v18 = 252;
      if (!v10)
        v18 = 28;
      if (v10 == 1)
        v19 = 224;
      else
        v19 = v18;
      objc_msgSend(v17, "setAllowedUnits:", v19);
      objc_msgSend(v17, "stringFromDateComponents:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = [WFDateFieldParameter alloc];
      -[WFLinkActionDateComponentsParameterDefinition parameterDefinitionDictionary](self, "parameterDefinitionDictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[WFDateFieldParameter initWithDefinition:](v22, "initWithDefinition:", v23);

      objc_msgSend(v12, "dateFromComponents:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFDateFieldParameter hintDateFormatter](v24, "hintDateFormatter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringFromDate:", v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v24;
    }

    v27 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v20);
    v21 = -[WFVariableStringParameterState initWithVariableString:]([WFDateFieldParameterState alloc], "initWithVariableString:", v27);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  WFDateFieldParameter *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  WFDateFieldParameter *v16;
  void *v17;
  WFDateFieldParameter *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = -[WFLinkActionDateComponentsParameterDefinition dateFormat](self, "dateFormat");
  v6 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AC8], 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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

  v11 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v12 = v11;
  if (v6 == 1)
  {
    objc_msgSend(v11, "setCalendar:", v7);
    objc_msgSend(v12, "setUnitsStyle:", 2);
    v13 = 252;
    if (!v5)
      v13 = 28;
    if (v5 == 1)
      v14 = 224;
    else
      v14 = v13;
    objc_msgSend(v12, "setAllowedUnits:", v14);
    objc_msgSend(v12, "stringFromDateComponents:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = [WFDateFieldParameter alloc];
    -[WFLinkActionDateComponentsParameterDefinition parameterDefinitionDictionary](self, "parameterDefinitionDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFDateFieldParameter initWithDefinition:](v16, "initWithDefinition:", v17);

    objc_msgSend(v7, "dateFromComponents:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDateFieldParameter hintDateFormatter](v18, "hintDateFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v18;
  }

  return v15;
}

- (int64_t)dateFormat
{
  return -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43AC0], 2);
}

@end

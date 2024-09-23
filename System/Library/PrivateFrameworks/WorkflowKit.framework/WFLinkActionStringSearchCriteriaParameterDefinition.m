@implementation WFLinkActionStringSearchCriteriaParameterDefinition

- (WFLinkActionStringSearchCriteriaParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionStringSearchCriteriaParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43DE0];
  v5 = a3;
  objc_msgSend(v4, "stringValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringSearchCriteriaParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringSearchCriteriaParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v9, sel_parameterDefinitionDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC8390];
  v10[0] = CFSTR("TextAlignment");
  v10[1] = CFSTR("KeyboardType");
  v4 = *MEMORY[0x1E0DC8348];
  v11[0] = v3;
  v11[1] = v4;
  v5 = *MEMORY[0x1E0DC8328];
  v10[2] = CFSTR("AutocapitalizationType");
  v10[3] = CFSTR("DisableSmartDashes");
  v11[2] = v5;
  v11[3] = MEMORY[0x1E0C9AAA0];
  v10[4] = CFSTR("DisableSmartQuotes");
  v11[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "variableString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByRemovingVariables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D43E00]);
    objc_msgSend(v9, "variableString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingVariables");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithTerm:", v14);

    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  id v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v17 = v11;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43E00]), "initWithTerm:", v17);
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  WFVariableString *v13;
  void *v14;
  WFVariableString *v15;
  WFVariableStringParameterState *v16;

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
    v10 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = [WFVariableString alloc];
    objc_msgSend(v12, "term");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[WFVariableString initWithString:](v13, "initWithString:", v14);
    v16 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end

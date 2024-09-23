@implementation WFLinkActionAttributedStringParameterDefinition

- (WFLinkActionAttributedStringParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionAttributedStringParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43D90];
  v5 = a3;
  objc_msgSend(v4, "attributedStringValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionAttributedStringParameterDefinition;
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
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)WFLinkActionAttributedStringParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v7, sel_parameterDefinitionDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC8390];
  v8[0] = CFSTR("TextAlignment");
  v8[1] = CFSTR("Multiline");
  v9[0] = v3;
  v9[1] = MEMORY[0x1E0C9AAB0];
  v8[2] = CFSTR("ProcessIntoContentItems");
  v9[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "definitionByAddingEntriesInDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  char isKindOfClass;
  void *v12;
  id v13;
  WFVariableStringParameterState *v14;
  WFVariableString *v15;
  void *v16;
  WFVariableString *v17;

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
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      v15 = [WFVariableString alloc];
      objc_msgSend(v10, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFVariableString initWithString:](v15, "initWithString:", v16);

      v14 = -[WFVariableStringParameterState initWithVariableString:]([WFVariableStringParameterState alloc], "initWithVariableString:", v17);
    }

  }
  else
  {
    v14 = 0;
  }

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

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

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
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(id, void *, _QWORD);

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = v11;
  if (!v15)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v17 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v17);
      -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v19, 0);

LABEL_8:
      goto LABEL_10;
    }

    v17 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __163__WFLinkActionAttributedStringParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
      v20[3] = &unk_1E7AF6B88;
      v20[4] = self;
      v21 = v14;
      objc_msgSend(v17, "getRichTextRepresentation:", v20);

      goto LABEL_8;
    }
LABEL_9:

    v14[2](v14, 0, 0);
    goto LABEL_10;
  }
  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v16, 0);

LABEL_10:
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

  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __163__WFLinkActionAttributedStringParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D43E38]);
    objc_msgSend(*(id *)(a1 + 32), "valueType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithValue:valueType:", v10, v8);
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v9, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

@end

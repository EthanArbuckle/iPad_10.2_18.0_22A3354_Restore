@implementation WFOverridableLinkAction

+ (NSString)overrideInputParameterName
{
  return 0;
}

+ (id)overrideInputParameterNames
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "overrideInputParameterName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)inputParameterMetadataWithActionMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(a1, "overrideInputParameterNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__WFOverridableLinkAction_inputParameterMetadataWithActionMetadata___block_invoke;
    v9[3] = &unk_1E7AF5F48;
    v10 = v5;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___WFOverridableLinkAction;
    objc_msgSendSuper2(&v11, sel_inputParameterMetadataWithActionMetadata_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __68__WFOverridableLinkAction_inputParameterMetadataWithActionMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)shouldOverrideParameterLabels
{
  return 0;
}

- (NSDictionary)overrideLabelsByParameter
{
  return 0;
}

- (NSDictionary)overrideDefaultValuesByParameter
{
  return 0;
}

- (NSDictionary)serializationKeysByParameter
{
  return 0;
}

- (NSDictionary)parameterOverrides
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSDictionary *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = (void *)objc_opt_new();
  v4 = -[WFOverridableLinkAction shouldOverrideParameterLabels](self, "shouldOverrideParameterLabels");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    -[WFOverridableLinkAction overrideLabelsByParameter](self, "overrideLabelsByParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke;
    v18[3] = &unk_1E7AF4688;
    v19 = v3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  -[WFOverridableLinkAction overrideDefaultValuesByParameter](self, "overrideDefaultValuesByParameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke_2;
  v16[3] = &unk_1E7AEFE98;
  v8 = v3;
  v17 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);

  -[WFOverridableLinkAction serializationKeysByParameter](self, "serializationKeysByParameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __45__WFOverridableLinkAction_parameterOverrides__block_invoke_3;
  v14[3] = &unk_1E7AF4688;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = (NSDictionary *)v10;

  return v12;
}

- (id)parameterDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFOverridableLinkAction;
  -[WFLinkAction parameterDefinitions](&v10, sel_parameterDefinitions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverridableLinkAction parameterOverrides](self, "parameterOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__WFOverridableLinkAction_parameterDefinitions__block_invoke;
    v8[3] = &unk_1E7AEDB50;
    v9 = v4;
    objc_msgSend(v3, "if_map:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (NSString)appName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[WFAppIntentExecutionAction displayableAppDescriptor](self, "displayableAppDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("CFBundleDisplayName"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "infoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("CFBundleName"), v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (BOOL)isPlatformProvidedUnderstandingAction
{
  return 1;
}

- (BOOL)shouldOverrideSubcategory
{
  return self->_shouldOverrideSubcategory;
}

- (NSString)overrideDescriptionSummary
{
  return self->_overrideDescriptionSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDescriptionSummary, 0);
}

id __47__WFOverridableLinkAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v7 = v3;
    goto LABEL_7;
  }
  v6 = (void *)v5;
  objc_msgSend(v3, "definitionByMergingWithDefinition:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v9[0] = CFSTR("Label");
  v9[1] = CFSTR("Placeholder");
  v10[0] = a3;
  v10[1] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v4, v7, v8);

}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v9 = CFSTR("DefaultValue");
  v10[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v4, v7, v8);

}

void __45__WFOverridableLinkAction_parameterOverrides__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v9 = CFSTR("KeyForSerialization");
  v10[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v4, v7, v8);

}

@end

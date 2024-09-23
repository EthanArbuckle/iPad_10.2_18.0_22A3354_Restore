@implementation WFLinkDeleteEntityAction

- (id)verb
{
  return CFSTR("delete");
}

- (id)entityParameterName
{
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("entity");
  v6[1] = CFSTR("entities");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkEntityAction actualEntityParameterNameFromPossibleNames:](self, "actualEntityParameterNameFromPossibleNames:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)overrideEntityName
{
  objc_class *v2;

  v2 = -[WFLinkEntityAction overrideTypeDescriptions](self, "overrideTypeDescriptions");
  if (v2)
  {
    -[objc_class pluralTypeDescription](v2, "pluralTypeDescription");
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)overrideLabelsByParameter
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFLinkDeleteEntityAction entityParameterName](self, "entityParameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)deletesInput
{
  return 1;
}

- (Class)contentItemClass
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSString *v6;
  Class v7;
  objc_class *v8;

  -[WFLinkAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Types"));
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

  objc_msgSend(v5, "firstObject");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = NSClassFromString(v6);
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)itemsBeingDeleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[WFAction processedParameters](self, "processedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkDeleteEntityAction entityParameterName](self, "entityParameterName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__WFLinkDeleteEntityAction_itemsBeingDeleted__block_invoke;
  v11[3] = &unk_1E7AEDB78;
  v11[4] = self;
  objc_msgSend(v7, "if_compactMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)parameterSummary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  WFActionParameterSummary *v7;
  void *v8;
  WFActionParameterSummary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFLinkDeleteEntityAction;
  -[WFLinkAction parameterSummary](&v11, sel_parameterSummary);
  v3 = objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionConfiguration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5 | v3;

  if (v6)
  {
    v9 = (WFActionParameterSummary *)(id)v3;
  }
  else
  {
    v7 = [WFActionParameterSummary alloc];
    WFLocalizedStringResourceWithKey(CFSTR("Delete ${entities}"), CFSTR("Delete ${entities}"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFActionParameterSummary initWithString:](v7, "initWithString:", v8);

  }
  return v9;
}

id __45__WFLinkDeleteEntityAction_itemsBeingDeleted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "valueType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)overrideInputParameterNames
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("entity");
  v3[1] = CFSTR("entities");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation WFLinkEntityAction

- (id)entityParameterName
{
  return 0;
}

- (id)actualEntityParameterNameFromPossibleNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__WFLinkEntityAction_actualEntityParameterNameFromPossibleNames___block_invoke;
  v11[3] = &unk_1E7AF5F48;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "if_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)entityParameterMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[WFLinkEntityAction entityParameterName](self, "entityParameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__WFLinkEntityAction_entityParameterMetadata__block_invoke;
  v9[3] = &unk_1E7AF5F48;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "if_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LNValueMetadata)entityMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WFAppIntentExecutionAction metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeSpecificMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D43970]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[WFLinkEntityAction entityParameterMetadata](self, "entityParameterMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeSpecificMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v10;

  }
  return (LNValueMetadata *)v5;
}

- (Class)overrideTypeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFLinkEntityAction entityMetadata](self, "entityMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D43C98];
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction appBundleIdentifier](self, "appBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_descriptionClassForEntityType:appBundleIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (id)overrideEntityName
{
  objc_class *v2;

  v2 = -[WFLinkEntityAction overrideTypeDescriptions](self, "overrideTypeDescriptions");
  if (v2)
  {
    -[objc_class typeDescription](v2, "typeDescription");
    v2 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)entityName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WFLinkEntityAction overrideEntityName](self, "overrideEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WFLinkEntityAction entityMetadata](self, "entityMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForLocaleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v11;

  }
  return v3;
}

- (id)lowercaseEntityName
{
  void *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *Class;
  id v7;
  void *v8;

  -[WFLinkEntityAction overrideEntityName](self, "overrideEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[WFLinkEntityAction overrideTypeDescriptions](self, "overrideTypeDescriptions");
    if (v4
      && ((v5 = v4, Class = object_getClass(v4), !class_respondsToSelector(Class, sel_canLowercaseTypeDescription))
       || (-[objc_class canLowercaseTypeDescription](v5, "canLowercaseTypeDescription") & 1) != 0))
    {
      objc_msgSend(v3, "lowercaseString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v3;
    }
  }
  else
  {
    -[WFLinkEntityAction entityName](self, "entityName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)verb
{
  return 0;
}

- (id)capitalizedVerb
{
  void *v2;
  void *v3;

  -[WFLinkEntityAction verb](self, "verb");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capitalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldOverrideParameterLabels
{
  void *v2;
  BOOL v3;

  -[WFLinkEntityAction overrideEntityName](self, "overrideEntityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __45__WFLinkEntityAction_entityParameterMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __65__WFLinkEntityAction_actualEntityParameterNameFromPossibleNames___block_invoke(uint64_t a1, void *a2)
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

@end

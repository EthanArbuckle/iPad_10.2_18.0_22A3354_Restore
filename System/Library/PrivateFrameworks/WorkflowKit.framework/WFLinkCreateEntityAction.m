@implementation WFLinkCreateEntityAction

- (id)verb
{
  return CFSTR("create");
}

- (Class)overrideTypeDescriptions
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFLinkCreateEntityAction;
  v3 = -[WFLinkEntityAction overrideTypeDescriptions](&v12, sel_overrideTypeDescriptions);
  if (!v3)
  {
    -[WFAppIntentExecutionAction metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outputType");
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

    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D43C98];
    -[WFAction appBundleIdentifier](self, "appBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (objc_class *)objc_msgSend(v9, "wf_descriptionClassForEntityType:appBundleIdentifier:", v8, v10);

  }
  return v3;
}

- (BOOL)shouldOverrideParameterLabels
{
  return 1;
}

- (id)overrideLabelsByParameter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringWithKey(CFSTR("%@ Name (createEntityName)"), CFSTR("%@ Name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("name");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

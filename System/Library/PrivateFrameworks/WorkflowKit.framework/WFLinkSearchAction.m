@implementation WFLinkSearchAction

- (id)localizedNameWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("WFLinkSearchAction - Action Name"), CFSTR("Search in %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOverridableLinkAction appName](self, "appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)parameterSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WFActionParameterSummary *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Search ${searchPhrase} in %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverridableLinkAction appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFActionParameterSummary initWithLocalizedString:]([WFActionParameterSummary alloc], "initWithLocalizedString:", v6);
  return v7;
}

- (id)overrideLabelsByParameter
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("searchPhrase");
  WFLocalizedStringWithKey(CFSTR("Text (searchPhrase)"), CFSTR("Text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldOverrideParameterLabels
{
  return 1;
}

- (id)parameterOverrides
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSearchAction;
  -[WFOverridableLinkAction parameterOverrides](&v10, sel_parameterOverrides);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  v11 = CFSTR("Prompt");
  WFLocalizedStringWithKey(CFSTR("What do you want to search for? (searchPhrase)"), CFSTR("What do you want to search for?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v6, CFSTR("searchPhrase"), v8);

  return v6;
}

@end

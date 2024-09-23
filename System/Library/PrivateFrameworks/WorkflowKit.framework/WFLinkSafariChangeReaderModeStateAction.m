@implementation WFLinkSafariChangeReaderModeStateAction

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  void *v3;
  WFActionParameterSummary *v4;

  v2 = [WFActionParameterSummary alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${changeOperation} Safari Reader"), CFSTR("${changeOperation} Safari Reader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFActionParameterSummary initWithString:](v2, "initWithString:", v3);

  return v4;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("SafariSubcategorySafariReader"), CFSTR("Safari Reader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("WFLinkSafariChangeReaderModeStateAction - Action Name"), CFSTR("Show/Hide Reader in Safari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)overrideDefaultValuesByParameter
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)WFLinkSafariChangeReaderModeStateAction;
  -[WFLinkChangeBinarySettingAction overrideDefaultValuesByParameter](&v6, sel_overrideDefaultValuesByParameter);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("setting");
  v8[0] = CFSTR("reader");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_dictionaryByAddingEntriesFromDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)parameterOverrides
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[3];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)WFLinkSafariChangeReaderModeStateAction;
  -[WFOverridableLinkAction parameterOverrides](&v11, sel_parameterOverrides);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v15 = CFSTR("ItemDisplayNames");
  WFLocalizedStringResourceWithKey(CFSTR("Hide (changeOperation)"), CFSTR("Hide"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  WFLocalizedStringResourceWithKey(CFSTR("Show (changeOperation)"), CFSTR("Show"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  WFLocalizedStringResourceWithKey(CFSTR("Toggle (changeOperation)"), CFSTR("Toggle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v3, CFSTR("changeOperation"), v8);

  v12 = CFSTR("Hidden");
  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v3, CFSTR("setting"), v9);

  return v3;
}

@end

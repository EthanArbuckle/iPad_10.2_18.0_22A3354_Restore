@implementation WFLinkRemindersOpenSmartListAction

- (id)localizedNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Open Smart List"), CFSTR("Open Smart List"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parameterOverrides
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)WFLinkRemindersOpenSmartListAction;
  -[WFOverridableLinkAction parameterOverrides](&v8, sel_parameterOverrides);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v9[0] = CFSTR("Class");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = CFSTR("targetEntity");
  v9[1] = CFSTR("KeyForSerialization");
  v9[2] = CFSTR("LegacyKey");
  v10[2] = CFSTR("target");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFAddEntriesToDictionary(v3, CFSTR("target"), v6);

  return v3;
}

@end

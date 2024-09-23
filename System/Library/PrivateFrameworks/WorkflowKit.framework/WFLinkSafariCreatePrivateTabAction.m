@implementation WFLinkSafariCreatePrivateTabAction

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  void *v3;
  WFActionParameterSummary *v4;

  v2 = [WFActionParameterSummary alloc];
  WFLocalizedStringResourceWithKey(CFSTR("Create new private tab"), CFSTR("Create new private tab"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFActionParameterSummary initWithString:](v2, "initWithString:", v3);

  return v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("WFLinkSafariCreatePrivateTabAction - Action Name"), CFSTR("Create New Private Tab"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("SafariSubcategoryTabs"), CFSTR("Tabs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

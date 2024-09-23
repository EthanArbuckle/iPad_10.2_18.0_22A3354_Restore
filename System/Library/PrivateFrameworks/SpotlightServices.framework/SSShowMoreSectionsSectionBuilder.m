@implementation SSShowMoreSectionsSectionBuilder

+ (id)supportedBundleId
{
  __CFString *v3;
  objc_super v5;

  if ((isMacOS() & 1) != 0)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___SSShowMoreSectionsSectionBuilder;
    objc_msgSendSuper2(&v5, sel_supportedBundleId);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("com.apple.other:show_more");
  }
  return v3;
}

- (id)buildSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[SSShowMoreSectionsSectionBuilder buildCardSections](self, "buildCardSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCardSections:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setBundleIdentifier:", CFSTR("com.apple.other:show_more"));
  -[SSShowMoreSectionsSectionBuilder buildBridgedResult](self, "buildBridgedResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResults:", v6);

  return v5;
}

- (id)buildBridgedResult
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryIdent");

  v5 = (void *)objc_opt_new();
  -[SSShowMoreSectionsSectionBuilder buildCardSections](self, "buildCardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCardSections:", v6);

  objc_msgSend(v5, "setQueryId:", v4);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setType:", 2);
  objc_msgSend(v7, "setIdentifier:", CFSTR("com.apple.other:show_more"));
  objc_msgSend(v7, "setResultBundleId:", CFSTR("com.apple.other:show_more"));
  objc_msgSend(v7, "setSectionBundleIdentifier:", CFSTR("com.apple.other:show_more"));
  v8 = (void *)MEMORY[0x1E0D8C7A8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_RESULTS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  objc_msgSend(v7, "setInlineCard:", v5);
  objc_msgSend(v7, "setQueryId:", v4);

  return v7;
}

- (id)buildCardSections
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_MORE_RESULTS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v6);

  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

@implementation SSTopHitAppWithEntitiesSectionBuilder

+ (BOOL)supportsSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.application"));

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  LOBYTE(v10) = 0;
  if (objc_msgSend(v4, "count") == 1 && (v9 & 1) == 0)
  {
    objc_msgSend(v4, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isAppClip") & 1) != 0)
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isWebClip") ^ 1;

    }
  }

  return v10;
}

+ (BOOL)supportsAppTopHitWithoutIndexFor:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "supportsFileProviderFor:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend((id)objc_opt_class(), "supportsBonusSPI:", v3);

  return v4;
}

+ (BOOL)supportsFileProviderFor:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = supportsFileProviderFor__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&supportsFileProviderFor__onceToken, &__block_literal_global_56);
  v5 = objc_msgSend((id)supportsFileProviderFor__supportedBundleIdentifiers, "containsObject:", v4);

  return v5;
}

void __65__SSTopHitAppWithEntitiesSectionBuilder_supportsFileProviderFor___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.DocumentsApp");
  v4[1] = CFSTR("com.apple.Pages");
  v4[2] = CFSTR("com.apple.Keynote");
  v4[3] = CFSTR("com.apple.Numbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportsFileProviderFor__supportedBundleIdentifiers;
  supportsFileProviderFor__supportedBundleIdentifiers = v2;

}

+ (BOOL)supportsBonusSPI:(id)a3
{
  return WFTopHitContextualActionTypeForBundleIdentifier() != 0;
}

- (id)buildBridgedResult
{
  void *v3;
  void *v4;
  void *v5;
  SSApplicationResultBuilder *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SSApplicationResultBuilder initWithResult:]([SSApplicationResultBuilder alloc], "initWithResult:", v5);
  -[SSTopHitAppWithEntitiesSectionBuilder setAppResultBuilder:](self, "setAppResultBuilder:", v6);

  -[SSSectionBuilder queryContext](self, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSTopHitAppWithEntitiesSectionBuilder appResultBuilder](self, "appResultBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryContext:", v7);

  -[SSTopHitAppWithEntitiesSectionBuilder appResultBuilder](self, "appResultBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "buildResult");

  v21.receiver = self;
  v21.super_class = (Class)SSTopHitAppWithEntitiesSectionBuilder;
  -[SSSectionBuilder buildBridgedResult](&v21, sel_buildBridgedResult);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inlineCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInlineCard:", v12);

  objc_msgSend(v11, "compactCard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompactCard:", v13);

  objc_msgSend(v5, "setQueryId:", objc_msgSend(v11, "queryId"));
  objc_msgSend(v11, "sectionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionBundleIdentifier:", v14);

  objc_msgSend(v11, "resultBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultBundleId:", v15);

  objc_msgSend(v11, "applicationBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationBundleIdentifier:", v16);

  -[SSTopHitAppWithEntitiesSectionBuilder appResultBuilder](self, "appResultBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "matchedAlternateName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletion:", v18);

  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:", v5);
  return v19;
}

- (int64_t)maxCardSections
{
  if ((isIpad() & 1) != 0)
    return 6;
  if (isMacOS())
    return 6;
  return 4;
}

- (id)buildCollectionStyle
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setNumberOfColumns:", -[SSTopHitAppWithEntitiesSectionBuilder maxCardSections](self, "maxCardSections"));
  return v3;
}

- (id)buildCardSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SFSearchResult_SpotlightExtras *v8;
  void *v9;
  void *v10;
  void *v11;
  SFSearchResult_SpotlightExtras *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSTopHitAppWithEntitiesSectionBuilder appResultBuilder](self, "appResultBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationBundleIdentifier:", v5);

  -[SSTopHitAppWithEntitiesSectionBuilder appResultBuilder](self, "appResultBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  v8 = [SFSearchResult_SpotlightExtras alloc];
  -[SSSectionBuilder section](self, "section");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFSearchResult_SpotlightExtras initWithResult:](v8, "initWithResult:", v11);
  objc_msgSend(v3, "setSpotlightBackingResult:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v3, "applicationBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setApplicationBundleIdentifier:", v14);

  objc_msgSend(v3, "setCommand:", v13);
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SSApplicationResultBuilder)appResultBuilder
{
  return self->_appResultBuilder;
}

- (void)setAppResultBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_appResultBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appResultBuilder, 0);
}

@end

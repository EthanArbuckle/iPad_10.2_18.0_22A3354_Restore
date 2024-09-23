@implementation SSCachedViewResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;

  v3 = *MEMORY[0x1E0CA6070];
  v4 = a3;
  objc_msgSend(v4, "valueForAttribute:withType:", v3, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = SSAppVendedTopHitViewsEnabled();
  else
    v6 = 0;

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (BOOL)supportsClearingBackendData
{
  return 0;
}

- (id)buildInlineCardSections
{
  SFSearchResult_SpotlightExtras *v3;
  void *v4;
  SFSearchResult_SpotlightExtras *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = [SFSearchResult_SpotlightExtras alloc];
  -[SSResultBuilder result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SFSearchResult_SpotlightExtras initWithResult:](v3, "initWithResult:", v4);

  -[SFSearchResult_SpotlightExtras backendData](v5, "backendData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CA6070];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CA6070]);

  +[SSResultBuilder resultBuilderWithResult:](SSResultBuilder, "resultBuilderWithResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder queryContext](self, "queryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryContext:", v9);

  objc_msgSend(v8, "setIsTopHit:", -[SSResultBuilder isTopHit](self, "isTopHit"));
  v10 = (void *)objc_opt_new();
  -[SSResultBuilder queryContext](self, "queryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchString:", v12);

  objc_msgSend(v10, "setIsTopHit:", -[SSResultBuilder isTopHit](self, "isTopHit"));
  objc_msgSend(v8, "buildInlineCardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFallbackCardSection:", v13);

  objc_msgSend(v8, "buildResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSpotlightBackingResult:", v14);

  -[SSResultBuilder buildDefaultPropertiesForCardSection:](self, "buildDefaultPropertiesForCardSection:", v10);
  v15 = objc_alloc(MEMORY[0x1E0CA6B50]);
  -[SSResultBuilder result](self, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backendData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  v19 = (void *)objc_msgSend(v15, "initWithAttributes:", v18);
  objc_msgSend(v10, "setAttributeSet:", v19);

  -[SSResultBuilder result](self, "result");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForAttribute:withType:", v7, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setArchive:", v21);

  v24[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end

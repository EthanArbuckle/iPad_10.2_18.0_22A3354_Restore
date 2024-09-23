@implementation SearchUIShortcutsAppTopHitAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SearchUIShortcutsAppTopHitAsyncSectionLoader;
  return objc_msgSendSuper2(&v4, sel_supportsSectionModel_, a3);
}

- (id)buildSearchQueryForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader defaultFetchAttributes](self, "defaultFetchAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchAttributes:", v5);

  objc_msgSend(v4, "setMaxCount:", objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities"));
  objc_msgSend(v4, "setDisableSemanticSearch:", 1);
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v22[0] = *MEMORY[0x1E0DA9CF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIShortcutsAppTopHitAsyncSectionLoader shortcutsQueryString](self, "shortcutsQueryString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SearchUIShortcutsAppTopHitAsyncSectionLoader supportsFileProviderRecents](self, "supportsFileProviderRecents"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[SearchUIShortcutsAppTopHitAsyncSectionLoader fileProviderQueryString](self, "fileProviderQueryString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@) || (%@)"), v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    -[SearchUIShortcutsAppTopHitAsyncSectionLoader rankingQueriesForFileprovider](self, "rankingQueriesForFileprovider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v14);

    v15 = *MEMORY[0x1E0DA9CE0];
    v21[0] = *MEMORY[0x1E0DA9CC8];
    v21[1] = v15;
    v16 = *MEMORY[0x1E0DA9CF0];
    v21[2] = *MEMORY[0x1E0DA9CE8];
    v21[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);

    v10 = (void *)v13;
  }
  -[SearchUIShortcutsAppTopHitAsyncSectionLoader rankingQueriesForShortcuts](self, "rankingQueriesForShortcuts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v18);

  objc_msgSend(v4, "setRankingQueries:", v6);
  objc_msgSend(v4, "setBundleIDs:", v9);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v10, v4);

  return v19;
}

- (id)buildCardSectionsForFoundItems:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_13);
  v7.receiver = self;
  v7.super_class = (Class)SearchUIShortcutsAppTopHitAsyncSectionLoader;
  -[SearchUICoreSpotlightAppTopHitAsyncSectionLoader buildCardSectionsForFoundItems:](&v7, sel_buildCardSectionsForFoundItems_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __79__SearchUIShortcutsAppTopHitAsyncSectionLoader_buildCardSectionsForFoundItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v28;
  void *v29;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC8018];
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC8018]);

  objc_msgSend(v5, "domainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v4, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "compare:", v20);
    goto LABEL_12;
  }
  if (v8)
    v21 = -1;
  else
    v21 = 1;
  if (((v8 | v10) & 1) == 0)
  {
    objc_msgSend(v4, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CA6850];
    objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E0CA6850]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v5, "attributeSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attributeForKey:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v25;

    v26 = objc_msgSend(v17, "compare:", v18);
    if (v26)
    {
      v21 = v26;
      goto LABEL_19;
    }
    objc_msgSend(v5, "attributeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastUsedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributeSet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastUsedDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "compare:", v29);

LABEL_12:
LABEL_19:

  }
  return v21;
}

- (id)rankingQueriesForShortcuts
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForShortcuts__block_invoke;
  block[3] = &unk_1EA1F62F0;
  block[4] = self;
  if (rankingQueriesForShortcuts_onceToken != -1)
    dispatch_once(&rankingQueriesForShortcuts_onceToken, block);
  return (id)rankingQueriesForShortcuts_rankingQueries;
}

void __74__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForShortcuts__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "appShortcutTopHitFilterQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v2);

  v3 = objc_msgSend((id)objc_opt_class(), "maxNumOfTopHitEntities");
  if (v3)
  {
    v4 = *MEMORY[0x1E0CA6850];
    do
    {
      v5 = v3 - 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@, %lu, %lu)"), v4, v3 - 1, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v6);

      v3 = v5;
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "userShortcutFilterQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v7);

  v8 = objc_msgSend(v10, "copy");
  v9 = (void *)rankingQueriesForShortcuts_rankingQueries;
  rankingQueriesForShortcuts_rankingQueries = v8;

}

- (id)shortcutsQueryString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *MEMORY[0x1E0CA67F0];
  -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@==%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SearchUIShortcutsAppTopHitAsyncSectionLoader appShortcutTopHitFilterQuery](self, "appShortcutTopHitFilterQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIShortcutsAppTopHitAsyncSectionLoader userShortcutFilterQuery](self, "userShortcutFilterQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("((%@) && ((%@) || (%@)))"), v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)userShortcutFilterQuery
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@ == %@) && (%@ == 1))"), *MEMORY[0x1E0CA6198], *MEMORY[0x1E0DC8018], *MEMORY[0x1E0CA69B8]);
}

- (id)appShortcutTopHitFilterQuery
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@==1"), *MEMORY[0x1E0CA6868]);
}

- (BOOL)supportsFileProviderRecents
{
  void *v2;
  void *v3;
  BOOL *v4;

  v2 = (void *)MEMORY[0x1E0DA9CB8];
  -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (BOOL *)objc_msgSend(v2, "supportsFileProviderFor:", v3);

  return v4;
}

- (id)rankingQueriesForFileprovider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForFileprovider__block_invoke;
  block[3] = &unk_1EA1F62F0;
  block[4] = self;
  if (rankingQueriesForFileprovider_onceToken != -1)
    dispatch_once(&rankingQueriesForFileprovider_onceToken, block);
  return (id)rankingQueriesForFileprovider_rankingQueries;
}

void __77__SearchUIShortcutsAppTopHitAsyncSectionLoader_rankingQueriesForFileprovider__block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  for (i = 0; i != 16; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "dateRangeQueryForUpToSeconds:", 60 * qword_1DAE1D5E8[i]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "futureDateRangeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)rankingQueriesForFileprovider_rankingQueries;
  rankingQueriesForFileprovider_rankingQueries = v5;

}

- (id)fileProviderQueryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIAppTopHitAsyncSectionLoader bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DOCContentTypesReadableByApplicationWithBundleIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "doc_identifiersForContentTypes:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newRecentsCollection");

    objc_msgSend(v7, "setAllowedFileTypes:", v5);
    objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExcludedFileTypes:", v9);

    objc_msgSend(v7, "scopedSearchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toSpotlightQueryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SearchUIShortcutsAppTopHitAsyncSectionLoader dateRangeQueryForUpToSeconds:](self, "dateRangeQueryForUpToSeconds:", 1209600);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIShortcutsAppTopHitAsyncSectionLoader futureDateRangeQuery](self, "futureDateRangeQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@) && ((%@) || (%@))"), v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dateRangeQueryForUpToSeconds:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@, $time.now(-%ld), $time.now)"), *MEMORY[0x1E0CA6450], a3);
}

- (id)futureDateRangeQuery
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ >= $time.now"), *MEMORY[0x1E0CA6450]);
}

@end

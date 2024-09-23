@implementation SSSectionBuilder

+ (id)searchInAppButtonItemWithCommand:(id)a3
{
  return (id)objc_msgSend(a1, "searchInAppButtonItemWithCommand:title:", a3, 0);
}

+ (id)searchInAppButtonItemWithCommand:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSymbolName:", CFSTR("arrow.up.forward.app.fill"));
  objc_msgSend(v7, "setIsTemplate:", 1);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setCommand:", v6);

  if (v5)
  {
    objc_msgSend(v8, "setTitle:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEARCH_IN_APP_BUTTON_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

  }
  objc_msgSend(v8, "setImage:", v7);

  return v8;
}

+ (id)supportedBundleId
{
  return 0;
}

+ (id)supportedBundleIds
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "supportedBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "supportedBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "supportedBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(a1, "supportedBundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v11);

  }
  return v7;
}

- (BOOL)isContactEntitySearch
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContactEntitySearch");

  return v5;
}

- (BOOL)shouldSkipSection
{
  return 0;
}

- (id)bundleId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SSSectionBuilder section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "supportedBundleIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  return 0;
}

- (BOOL)hasEntities
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)buildSection
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  SFMutableResultSection *v15;
  void *v16;
  SFMutableResultSection *v17;
  SFMutableResultSection *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[SSSectionBuilder shouldSkipSection](self, "shouldSkipSection"))
    return 0;
  -[SSSectionBuilder section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "results", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v12, "compactCard");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

        }
        else
        {
          objc_msgSend(v12, "inlineCard");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {

            goto LABEL_16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (!v6)
  {
LABEL_16:
    objc_msgSend(v4, "mutableDeepCopy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
    }
    else if (v16)
    {
      v17 = -[SFMutableResultSection initWithSection:]([SFMutableResultSection alloc], "initWithSection:", v16);
    }
    else
    {
      v17 = (SFMutableResultSection *)objc_opt_new();
    }
    v18 = v17;
    -[SSSectionBuilder buildBridgedResult](self, "buildBridgedResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "queryId");
    if (v20)
    {
      objc_msgSend(v19, "setQueryId:", v20);
    }
    else
    {
      -[SSSectionBuilder queryContext](self, "queryContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setQueryId:", objc_msgSend(v21, "queryIdent"));

    }
    objc_msgSend(v4, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqual:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
    {
      objc_msgSend(v4, "results");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24 >= 2)
      {
        objc_msgSend(v19, "setShouldUseCompactDisplay:", 1);
        objc_msgSend(v19, "setUsesCompactDisplay:", 1);
      }
      if (v19)
        goto LABEL_28;
    }
    else
    {

      if (v19)
      {
LABEL_28:
        -[SFResultSection bundleIdentifier](v18, "bundleIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[SFResultSection setBundleIdentifier:](v18, "setBundleIdentifier:", v25);
        }
        else
        {
          -[SSSectionBuilder bundleId](self, "bundleId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResultSection setBundleIdentifier:](v18, "setBundleIdentifier:", v26);

        }
        objc_msgSend(v19, "sectionBundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v19, "setSectionBundleIdentifier:", v27);
        }
        else
        {
          -[SFResultSection bundleIdentifier](v18, "bundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSectionBundleIdentifier:", v28);

        }
        -[SFResultSection title](v18, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[SFResultSection setTitle:](v18, "setTitle:", v29);
        }
        else
        {
          -[SSSectionBuilder buildTitle](self, "buildTitle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "text");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResultSection setTitle:](v18, "setTitle:", v31);

        }
        v38 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMutableResultSection setResults:](v18, "setResults:", v32);

        -[SSSectionBuilder buildButtonItem](self, "buildButtonItem");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResultSection setButton:](v18, "setButton:", v33);

        -[SFResultSection setMaxInitiallyVisibleResults:](v18, "setMaxInitiallyVisibleResults:", -[SSSectionBuilder buildMaxInitiallyVisibleResults](self, "buildMaxInitiallyVisibleResults"));
        v15 = v18;
        goto LABEL_40;
      }
    }
    v15 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v15 = v4;
LABEL_41:

  return v15;
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
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryIdent");

  -[SSSectionBuilder section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "inlineCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v8, "compactCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cardSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SSSectionBuilder buildCollectionCardSection](self, "buildCollectionCardSection");
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v11, "cardSections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_opt_new();
    v30[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCardSections:", v19);

    objc_msgSend(v18, "setQueryId:", v4);
    objc_msgSend(v8, "setInlineCard:", v18);
    if (-[SSSectionBuilder isContactEntitySearch](self, "isContactEntitySearch"))
      v20 = 0;
    else
      v20 = v18;
    objc_msgSend(v8, "setCompactCard:", v20);
    objc_msgSend(v8, "setQueryId:", v4);
    objc_msgSend(v7, "sectionBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v8, "setSectionBundleIdentifier:", v21);
    }
    else
    {
      -[SSSectionBuilder bundleId](self, "bundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSectionBundleIdentifier:", v23);

    }
    objc_msgSend(v7, "resultBundleId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v8, "setResultBundleId:", v24);
    }
    else
    {
      objc_msgSend(v8, "sectionBundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setResultBundleId:", v25);

    }
    objc_msgSend(v7, "applicationBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setApplicationBundleIdentifier:", v26);

    objc_msgSend(v5, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("bridged_result_"), "stringByAppendingString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v28);

    v22 = v8;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)buildCollectionStyle
{
  void *v3;

  if (-[SSSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setNumberOfRows:", 1);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDrawPlattersIfNecessary:", 1);
  }
  objc_msgSend(v3, "setInitiallyVisibleCardSectionCount:", -[SSSectionBuilder buildMaxInitiallyVisibleResults](self, "buildMaxInitiallyVisibleResults"));
  return v3;
}

- (unint64_t)buildMaxInitiallyVisibleResults
{
  void *v3;
  unint64_t v4;

  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxInitiallyVisibleResults");

  if (-[SSSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI"))
    return 0;
  if (-[SSSectionBuilder hasEntities](self, "hasEntities") || !v4 && !isMacOS())
    return 3;
  return v4;
}

+ (id)detailedRowCardSectionForCardSection:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)visibleTextForCardSection:(id)a3 includeDescriptions:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "detailedRowCardSectionForCardSection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (v7)
    v9 = v7;
  else
    v9 = &stru_1E6E549F0;
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);
  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "descriptions", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "text");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

  }
  v19 = (void *)objc_msgSend(v10, "copy");

  return v19;
}

- (id)buildCollectionCardSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SSSectionBuilder buildButtonItem](self, "buildButtonItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (void *)objc_opt_new();
  -[SSSectionBuilder buildCollectionStyle](self, "buildCollectionStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCollectionStyle:", v9);

  objc_msgSend(v8, "setButtonItem:", v7);
  -[SSSectionBuilder buildTitle](self, "buildTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  objc_msgSend(v8, "collectionStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "initiallyVisibleCardSectionCount");

  -[SSSectionBuilder buildCardSections](self, "buildCardSections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v16)
    {
      v20 = v15;
      goto LABEL_20;
    }
    v17 = v16;
    v31 = v14;
    v32 = v8;
    v33 = v7;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = *(_QWORD *)v36;
    while (2)
    {
      v22 = 0;
      v34 = v18 + v17;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v22), "spotlightBackingResult");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v20, "isEqualToString:", v24) & 1) == 0)
        {
          if (v19 == v12)
          {

            v26 = v18 + v22;
            goto LABEL_17;
          }
          ++v19;
          v25 = v24;

          v20 = v25;
        }

        ++v22;
      }
      while (v17 != v22);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v26 = v34;
      v18 = v34;
      if (v17)
        continue;
      break;
    }
LABEL_17:

    v7 = v33;
    v14 = v31;
    v8 = v32;
    if (v20)
    {
      objc_msgSend(v32, "collectionStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setInitiallyVisibleCardSectionCount:", v26);

LABEL_20:
    }
  }
  if (objc_msgSend(v14, "count"))
  {
    if (v7 && v12 && objc_msgSend(v14, "count") > v12)
    {
      objc_msgSend(v14, "subarrayWithRange:", 0, v12);
      v28 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v28;
    }
    objc_msgSend(v8, "setCardSections:", v14);
    objc_msgSend((id)objc_opt_class(), "disambiguateUIIfNecessary:", v14);
    v29 = v8;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)buildTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SSSectionBuilder section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v2, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)buildCardSections
{
  SSSectionBuilder *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SSSectionBuilder *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v26;
  id obj;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v2 = self;
  v43 = *MEMORY[0x1E0C80C00];
  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSSectionBuilder queryContext](v2, "queryContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v3;
  objc_msgSend(v3, "resultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SSSectionBuilder maxCardSections](v2, "maxCardSections") < 1)
    v6 = -[SSSectionBuilder buildMaxInitiallyVisibleResults](v2, "buildMaxInitiallyVisibleResults");
  else
    v6 = -[SSSectionBuilder maxCardSections](v2, "maxCardSections");
  v26 = v6;
  objc_msgSend(v3, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[SSSectionBuilder buildButtonItem](v2, "buildButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v10)
  {
    v11 = v10;
    v29 = *(_QWORD *)v38;
    v12 = v26 > 0 && v8;
    v28 = v12;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v31, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

        +[SSResultBuilder resultBuilderWithResult:preferAppVendedView:](SSResultBuilder, "resultBuilderWithResult:preferAppVendedView:", v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setQueryContext:", v30);
        objc_msgSend(v17, "setIsTopHit:", v16);
        -[SSSectionBuilder buildCardSectionsWithResult:resultBuilder:](v2, "buildCardSectionsWithResult:resultBuilder:", v14, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v19 = v2;
          objc_msgSend(v32, "addObjectsFromArray:", v18);
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v20 = v18;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v34 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "setSpotlightBackingResult:", v14);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v22);
          }

          v2 = v19;
        }
        if (v28 && objc_msgSend(v32, "count") >= v26)
        {

          goto LABEL_30;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_30:

  return v32;
}

- (id)buildCardSectionsWithResult:(id)a3 resultBuilder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SSSectionBuilder buildCardSectionWithResult:resultBuilder:](self, "buildCardSectionWithResult:resultBuilder:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_4;
  if (-[SSSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI"))
  {
    objc_msgSend(v7, "buildHorizontallyScrollingCardSection");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v9 = (void *)v8;
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "inlineCard");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "buildInlineCardSections");
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v10 = (void *)v19;
  }
LABEL_5:
  v11 = objc_msgSend(v10, "count");
  v12 = v10;
  if (!v11)
  {
    if (v9)
    {
      v20[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v12 = 0;
  }
  v13 = v12;
LABEL_9:
  v14 = v13;

  objc_msgSend(v7, "buildPreviewButtonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreviewButtonItems:", v15);

  return v14;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return 0;
}

- (id)buildButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moreResultsPunchout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "moreResultsPunchout");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v4)
  {
    -[SSSectionBuilder queryContext](self, "queryContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    -[SSSectionBuilder queryContext](self, "queryContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "searchEntities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "searchString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v9)
    {
      objc_msgSend(v9, "userActivityData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activityType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CA5EF8]);

      if (v21)
      {
        v22 = (void *)objc_opt_new();
        -[SSSectionBuilder section](self, "section");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "preMergeBundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v22, "setApplicationBundleIdentifier:", v24);
        }
        else
        {
          -[SSSectionBuilder section](self, "section");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setApplicationBundleIdentifier:", v26);

        }
        objc_msgSend(v22, "setSearchString:", v18);
      }
      else
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "setPunchout:", v9);
      }
      objc_msgSend((id)objc_opt_class(), "searchInAppButtonItemWithCommand:", v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (int64_t)maxCardSections
{
  return -1;
}

- (SFMutableResultSection)section
{
  return (SFMutableResultSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (void)setSection:(id)a3
{
  objc_storeWeak((id *)&self->_section, a3);
}

- (SPSearchQueryContext)queryContext
{
  return (SPSearchQueryContext *)objc_loadWeakRetained((id *)&self->_queryContext);
}

- (void)setQueryContext:(id)a3
{
  objc_storeWeak((id *)&self->_queryContext, a3);
}

- (unint64_t)renderState
{
  return self->_renderState;
}

- (void)setRenderState:(unint64_t)a3
{
  self->_renderState = a3;
}

- (BOOL)isTopHitSection
{
  return self->_isTopHitSection;
}

- (void)setIsTopHitSection:(BOOL)a3
{
  self->_isTopHitSection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queryContext);
  objc_destroyWeak((id *)&self->_section);
}

@end

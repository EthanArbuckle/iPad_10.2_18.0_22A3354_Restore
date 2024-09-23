@implementation SSSectionBuilderHandler

+ (id)buildSectionsWithSections:(id)a3 queryContext:(id)a4 searchInAppInfo:(id)a5 renderState:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setSections:", v11);

  objc_msgSend(v12, "setQueryContext:", v10);
  objc_msgSend(v12, "setSearchInAppInfo:", v9);

  objc_msgSend(v12, "setRenderState:", a6);
  objc_msgSend(v12, "buildSections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (Class)sectionBuilderClassForSection:(id)a3 withQueryContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (sectionBuilderClassForSection_withQueryContext__onceToken != -1)
    dispatch_once(&sectionBuilderClassForSection_withQueryContext__onceToken, &__block_literal_global_5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)sectionBuilderClassForSection_withQueryContext__supportedClasses;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "supportsSection:", v5, (_QWORD)v16) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_11;
      }
    }

    if (v12)
      goto LABEL_14;
  }
  else
  {
LABEL_11:

  }
  objc_msgSend(v6, "searchEntities", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "count");
  v12 = (void *)objc_opt_class();

LABEL_14:
  v14 = v12;

  return v14;
}

void __74__SSSectionBuilderHandler_sectionBuilderClassForSection_withQueryContext___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sectionBuilderClassForSection_withQueryContext__supportedClasses;
  sectionBuilderClassForSection_withQueryContext__supportedClasses = v0;

}

+ (BOOL)isZKWRecentBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.recents"));
}

+ (BOOL)isZKWAutoShortcutBundle:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.actions.fallback.autoshortcut"));
}

+ (id)makeClearProactiveCategoryButtonItemWithCategory:(int)a3 shouldClearWholeSection:(BOOL)a4 result:(id)a5
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3 == 1)
  {
    v5 = a4;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLEAR"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLEAR_ALL_RECENTS"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v10 = v9;
    else
      v10 = v7;
    v11 = v10;
    if (v5)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setSymbolName:", CFSTR("xmark"));
      objc_msgSend(v12, "setIsTemplate:", 1);
    }
    else
    {
      v12 = 0;
    }
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setCategory:", 1);
    objc_msgSend(v14, "setShouldClearWholeSection:", v5);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setTitle:", v11);
    objc_msgSend(v13, "setImage:", v12);
    objc_msgSend(v13, "setCommand:", v14);
    objc_msgSend(v13, "setIsDestructive:", 1);

  }
  else
  {
    v7 = 0;
    v9 = 0;
    v13 = 0;
  }

  return v13;
}

+ (void)injectRecentsOptionsIntoResult:(id)a3
{
  id v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "shouldUseCompactDisplay")
    && (objc_msgSend(v4, "compactCard"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "compactCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "inlineCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "cardSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sectionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isZKWRecentBundle:", v10))
  {
    objc_msgSend(a1, "makeClearProactiveCategoryButtonItemWithCategory:shouldClearWholeSection:result:", 1, 1, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "makeClearProactiveCategoryButtonItemWithCategory:shouldClearWholeSection:result:", 1, 0, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewButtonItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "previewButtonItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObject:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPreviewButtonItems:", v15);

    }
    else
    {
      v20[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPreviewButtonItems:", v14);
    }

    objc_msgSend(v9, "trailingSwipeButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v9, "trailingSwipeButtonItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayByAddingObject:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTrailingSwipeButtonItems:", v18);

    }
    else
    {
      v19 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTrailingSwipeButtonItems:", v17);
    }

  }
}

+ (id)findDistinctPathIdentifiersForSections:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)insertDummySectionsIntoSections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  SSSectionBuilderHandler *v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SFMutableResultSection mutableSectionWithBundleId:](SFMutableResultSection, "mutableSectionWithBundleId:", CFSTR("com.apple.spotlight.contactHeader"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertObject:atIndex:", v5, 0);

  -[SSSectionBuilderHandler searchEntity](self, "searchEntity");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:"))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if ((isMacOS() & 1) == 0 && !v6)
  {
    -[SSSectionBuilderHandler bundleIdentifiersForHiddenSections](self, "bundleIdentifiersForHiddenSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = objc_msgSend(v4, "count") - (v10 != 0);
      +[SFMutableResultSection mutableSectionWithBundleId:](SFMutableResultSection, "mutableSectionWithBundleId:", CFSTR("com.apple.other:show_more"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertObject:atIndex:", v14, v13);

    }
  }
  v30 = self;
  v31 = v10;
  v15 = (void *)v6;
  objc_msgSend(v7, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.spotlight.related_search"));

  if (v7)
    v18 = v17;
  else
    v18 = 0;
  v19 = objc_msgSend(v4, "count");
  v32[0] = CFSTR("com.apple.MobileAddressBook.SocialMedia");
  v32[1] = CFSTR("com.apple.spotlight.contactInfo");
  v32[2] = CFSTR("com.apple.searchd.searchThroughSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  v22 = (v21 - 1);
  if (v21 - 1 >= 0)
  {
    v23 = v19 - v18;
    do
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFMutableResultSection mutableSectionWithBundleId:](SFMutableResultSection, "mutableSectionWithBundleId:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertObject:atIndex:", v25, v23);

      --v22;
      --v21;
    }
    while (v21);
  }
  v26 = v15;
  if ((isMacOS() & 1) == 0)
  {
    -[SSSectionBuilderHandler queryContext](v30, "queryContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v27, "queryKind") - 5) >= 4)
      v28 = objc_msgSend(v26, "isContactEntitySearch") ^ 1;
    else
      v28 = 0;

    if ((v28 & 1) == 0 && !v31)
    {
      +[SFMutableResultSection mutableSectionWithBundleId:](SFMutableResultSection, "mutableSectionWithBundleId:", CFSTR("com.apple.parsec.related_search"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v29);

    }
  }

}

- (id)buildSections
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  SSContactResultBuilder *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SSContactResultBuilder *v24;
  id v25;
  uint64_t j;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t spid;
  void *v45;
  unint64_t v46;
  SSContactResultBuilder *v47;
  id obj;
  id v49;
  uint64_t v50;
  NSObject *log;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  SSGeneralLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  v46 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B86C5000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "buildSections", (const char *)&unk_1B8810841, buf, 2u);
  }
  spid = v4;
  log = v6;

  v7 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[SSSectionBuilderHandler sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v13, "results");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v10);
  }

  if (-[SSSectionBuilderHandler renderState](self, "renderState") != 1)
    -[SSSectionBuilderHandler insertDummySectionsIntoSections:](self, "insertDummySectionsIntoSections:", v7);
  -[SSSectionBuilderHandler queryContext](self, "queryContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSSectionBuilderHandler contactEntity](self, "contactEntity");
  v17 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v17;
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [SSContactResultBuilder alloc];
    objc_msgSend(v18, "contact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    v22 = v18;
    v23 = (void *)v21;
    v24 = -[SSContactResultBuilder initWithResult:contactEntity:contact:](v19, "initWithResult:contactEntity:contact:", 0, v22, v21);

    v47 = v24;
    -[SSResultBuilder setQueryContext:](v24, "setQueryContext:", v16);
  }
  else
  {
    v47 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v25 = v7;
  v52 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v54;
    obj = v25;
    do
    {
      for (j = 0; j != v52; ++j)
      {
        if (*(_QWORD *)v54 != v50)
          objc_enumerationMutation(obj);
        v27 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * j);
        v28 = objc_msgSend((id)objc_opt_class(), "sectionBuilderClassForSection:withQueryContext:", v27, v16);
        v29 = (void *)objc_opt_new();
        objc_msgSend(v29, "setQueryContext:", v16);
        objc_msgSend(v29, "setSection:", v27);
        objc_msgSend(v29, "setRenderState:", -[SSSectionBuilderHandler renderState](self, "renderState"));
        objc_msgSend(v27, "bundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setIsTopHitSection:", objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")));

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v29, "setContactResultBuilder:", v47);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SSSectionBuilderHandler bundleIdentifiersForHiddenSections](self, "bundleIdentifiersForHiddenSections");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setBundleIdentifiersForHiddenSections:", v31);

            -[SSSectionBuilderHandler searchInAppInfo](self, "searchInAppInfo");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setSearchInAppInfo:", v32);

          }
        }
        v33 = os_signpost_id_generate(log);
        v34 = log;
        v35 = v34;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v28;
          _os_signpost_emit_with_name_impl(&dword_1B86C5000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SSSectionBuilder: buildSection", "%@", buf, 0xCu);
        }

        objc_msgSend(v29, "buildSection");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v35;
        v38 = v37;
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v28;
          _os_signpost_emit_with_name_impl(&dword_1B86C5000, v38, OS_SIGNPOST_INTERVAL_END, v33, "SSSectionBuilder: buildSection", "%@", buf, 0xCu);
        }

        objc_msgSend(v36, "results");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        if (v40)
          objc_msgSend(v49, "addObject:", v36);

      }
      v25 = obj;
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v52);
  }

  v41 = log;
  v42 = v41;
  if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_DWORD *)buf = 138412290;
    v62 = (uint64_t)v25;
    _os_signpost_emit_with_name_impl(&dword_1B86C5000, v42, OS_SIGNPOST_INTERVAL_END, spid, "SSSectionBuilder, buildSections", "%@", buf, 0xCu);
  }

  return v49;
}

- (NSSet)bundleIdentifiersForHiddenSections
{
  NSSet *bundleIdentifiersForHiddenSections;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSSet *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  bundleIdentifiersForHiddenSections = self->_bundleIdentifiersForHiddenSections;
  if (!bundleIdentifiersForHiddenSections)
  {
    v4 = (NSSet *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SSSectionBuilderHandler sections](self, "sections", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "isInitiallyHidden"))
          {
            objc_msgSend(v10, "bundleIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSSet addObject:](v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = self->_bundleIdentifiersForHiddenSections;
    self->_bundleIdentifiersForHiddenSections = v4;

    bundleIdentifiersForHiddenSections = self->_bundleIdentifiersForHiddenSections;
  }
  return bundleIdentifiersForHiddenSections;
}

- (SPSearchEntity)searchEntity
{
  SPSearchEntity *searchEntity;
  void *v4;
  void *v5;
  SPSearchEntity *v6;
  SPSearchEntity *v7;

  searchEntity = self->_searchEntity;
  if (!searchEntity)
  {
    -[SSSectionBuilderHandler queryContext](self, "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (SPSearchEntity *)objc_claimAutoreleasedReturnValue();
    v7 = self->_searchEntity;
    self->_searchEntity = v6;

    searchEntity = self->_searchEntity;
  }
  return searchEntity;
}

- (SPSearchContactEntity)contactEntity
{
  SPSearchContactEntity *contactEntity;
  SPSearchContactEntity **p_contactEntity;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  p_contactEntity = &self->_contactEntity;
  contactEntity = self->_contactEntity;
  if (!contactEntity)
  {
    -[SSSectionBuilderHandler searchEntity](self, "searchEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[SSSectionBuilderHandler queryContext](self, "queryContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchEntities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v7, "isContactEntitySearch"))
      v10 = v7;
    else
      v10 = 0;
    objc_storeStrong((id *)p_contactEntity, v10);

    contactEntity = *p_contactEntity;
  }
  return contactEntity;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)searchInAppInfo
{
  return self->_searchInAppInfo;
}

- (void)setSearchInAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInAppInfo, a3);
}

- (void)setBundleIdentifiersForHiddenSections:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, a3);
}

- (void)setContactEntity:(id)a3
{
  objc_storeStrong((id *)&self->_contactEntity, a3);
}

- (void)setSearchEntity:(id)a3
{
  objc_storeStrong((id *)&self->_searchEntity, a3);
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_queryContext, a3);
}

- (unint64_t)renderState
{
  return self->_renderState;
}

- (void)setRenderState:(unint64_t)a3
{
  self->_renderState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_contactEntity, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersForHiddenSections, 0);
  objc_storeStrong((id *)&self->_searchInAppInfo, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end

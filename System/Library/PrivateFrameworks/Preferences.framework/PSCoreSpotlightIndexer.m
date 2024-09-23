@implementation PSCoreSpotlightIndexer

- (void)performYukonManifestMigrationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PSCoreSpolightIndexerHasPerformediOS13Migration"));

  if ((v6 & 1) != 0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PSCoreSpotlightIndexer_performYukonManifestMigrationWithCompletion___block_invoke;
    v7[3] = &unk_1E4A65708;
    v8 = v4;
    -[PSCoreSpotlightIndexer deleteIndexWithCompletionBlock:](self, "deleteIndexWithCompletionBlock:", v7);

  }
}

- (void)deleteIndexWithDomainIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PSCoreSpotlightIndexer prefsSearchableIndex](self, "prefsSearchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke;
  v11[3] = &unk_1E4A657F8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v10, v11);

}

- (id)searchableItemForSpecifier:(id)a3 bundleID:(id)a4 category:(id)a5 keywords:(id)a6 url:(id)a7 description:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setUrl:", v15);
  objc_msgSend(v20, "setBundleID:", v18);

  objc_msgSend(v19, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setName:", v21);

  objc_msgSend(v20, "setContentDescription:", v14);
  objc_msgSend(v20, "setCategory:", v17);

  objc_msgSend(v19, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIdentifier:", v22);

  -[PSCoreSpotlightIndexer _rankingHintScoreForURL:](self, "_rankingHintScoreForURL:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setRankingHint:", v23);
  objc_msgSend(v19, "propertyForKey:", CFSTR("requiredCapabilities"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRequiredCapabilities:", v24);

  objc_msgSend(v19, "propertyForKey:", CFSTR("requiredCapabilitiesOr"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRequiredCapabilitiesOr:", v25);

  objc_msgSend(v20, "setKeywords:", v16);
  objc_msgSend(v19, "propertyForKey:", CFSTR("AppBundleID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    -[PSCoreSpotlightIndexer searchableThirdPartyItemClassIdentifier](self, "searchableThirdPartyItemClassIdentifier");
  else
    -[PSCoreSpotlightIndexer searchableFirstPartyItemClassIdentifier](self, "searchableFirstPartyItemClassIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClassIdentifier:", v27);

  return v20;
}

- (id)searchableFirstPartyItemClassIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PSCoreSpotlightIndexer searchableItemClassIdentifier](self, "searchableItemClassIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.firstParty"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rankingHintScoreForURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("&/#"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 > 100)
  {
    v8 = &unk_1E4A92E38;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100 - v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)searchableItemsFromManifest:(id)a3 specifier:(id)a4 bundle:(id)a5 processCapabilities:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  PSCoreSpotlightIndexer *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v44 = self;
  v13 = -[PSCoreSpotlightIndexer skipManifests](self, "skipManifests");
  v14 = (void *)MEMORY[0x1E0C9AA60];
  v45 = v12;
  if (v12 && !v13)
  {
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v10;
    objc_msgSend(v10, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingPathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v15;
    v41 = v11;
    v39 = v17;
    SearchSpecifiersFromPlistWithCapabilities(v15, v11, v17, v45, a6);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (!v18)
      goto LABEL_21;
    v19 = v18;
    v20 = *(_QWORD *)v48;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (ShouldIndexSpecifier(v22))
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

            if (v25)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
          }
          else
          {

          }
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "length");

            if (v28)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(","));
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_16;
            }
          }
          else
          {
LABEL_16:

          }
          objc_msgSend(v22, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "length");

          if (v31)
          {
            objc_msgSend(v45, "bundleIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("searchSectionID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("keywords"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("searchURL"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("contentDescription"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSCoreSpotlightIndexer searchableItemForSpecifier:bundleID:category:keywords:url:description:](v44, "searchableItemForSpecifier:bundleID:category:keywords:url:description:", v22, v32, v33, v34, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "addObject:", v37);
          }
          continue;
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (!v19)
      {
LABEL_21:
        v14 = (void *)objc_msgSend(v43, "copy");

        v11 = v41;
        v10 = v42;
        break;
      }
    }
  }

  return v14;
}

- (BOOL)skipManifests
{
  return self->_skipManifests;
}

- (void)_indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    PKLogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Indexing %@ items.", buf, 0xCu);

    }
    v10 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), (_QWORD)v18);
          if ((unint64_t)objc_msgSend(v10, "count") >= 0x3E8)
          {
            v16 = (void *)objc_msgSend(v10, "copy");
            -[PSCoreSpotlightIndexer _indexChunkOfSearchableItems:completionHandler:](self, "_indexChunkOfSearchableItems:completionHandler:", v16, 0);

            objc_msgSend(v10, "removeAllObjects");
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v10, "copy");
    -[PSCoreSpotlightIndexer _indexChunkOfSearchableItems:completionHandler:](self, "_indexChunkOfSearchableItems:completionHandler:", v17, v7);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_indexChunkOfSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Indexing chunk of %@ items.", buf, 0xCu);

  }
  -[PSCoreSpotlightIndexer prefsSearchableIndex](self, "prefsSearchableIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PSCoreSpotlightIndexer__indexChunkOfSearchableItems_completionHandler___block_invoke;
  v13[3] = &unk_1E4A657F8;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "indexSearchableItems:completionHandler:", v12, v13);

}

- (CSSearchableIndex)prefsSearchableIndex
{
  return self->_prefsSearchableIndex;
}

- (id)manifestsFromDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 4, &v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;

    if (v7)
    {
      PKLogForCategory(4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PSCoreSpotlightIndexer manifestsFromDirectory:].cold.1();

    }
    v21 = v7;
    v22 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("plist")) & 1) != 0)
          {
            objc_msgSend(v15, "stringByDeletingPathExtension");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("SettingsSearchManifest"));

            if (v18)
              objc_msgSend(v23, "addObject:", v14);
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v11);
    }

    v19 = (void *)objc_msgSend(v23, "copy");
    v3 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)_specifiersForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  id v52;
  objc_class *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  PSCoreSpotlightIndexer *v66;
  PSCoreSpotlightIndexer *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  NSString *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "cellType"))
  {
    v17 = 0;
    goto LABEL_67;
  }
  objc_msgSend(v8, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_26;
  v66 = self;
  objc_msgSend(v8, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("File"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathForResource:ofType:", v13, CFSTR("plist"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13 || v14 == 0)
  {
    v17 = 0;
  }
  else
  {
    v63 = v12;
    v64 = v10;
    v65 = v9;
    v62 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("StringsTable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByDeletingPathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v18;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PreferenceSpecifiers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v73 != v26)
            objc_enumerationMutation(v23);
          +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:](PSAppListController, "specifiersFromDictionary:stringsTable:parentSpecifier:target:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i), v20, v8, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v22, "addObjectsFromArray:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v25);
    }

    if (objc_msgSend(v22, "count"))
      v17 = (void *)objc_msgSend(v22, "copy");
    else
      v17 = 0;
    PKLogForCategory(4);
    v29 = objc_claimAutoreleasedReturnValue();
    v9 = v65;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v78 = v13;
      v79 = 2112;
      v80 = v17;
      _os_log_impl(&dword_1A3819000, v29, OS_LOG_TYPE_DEFAULT, "Got specifiers from 3rd party plist %@: Specifiers: %@", buf, 0x16u);
    }

    v12 = v63;
    v10 = v64;
    v15 = v62;
  }

  self = v66;
  if (!v17)
  {
LABEL_26:
    -[PSCoreSpotlightIndexer _specifiersPlistPathForSpecifier:bundle:parentBundle:](self, "_specifiersPlistPathForSpecifier:bundle:parentBundle:", v8, v9, v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("searchable"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");
      if (!v32 || v33)
      {
        v67 = self;
        objc_msgSend(v30, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByDeletingPathExtension");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        SearchSpecifiersFromPlist(v31, v8, v35, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogForCategory(4);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (NSString *)v35;
          v79 = 2112;
          v80 = v17;
          _os_log_impl(&dword_1A3819000, v36, OS_LOG_TYPE_DEFAULT, "Got specifiers from plist %@: Specifiers: %@", buf, 0x16u);
        }

        self = v67;
      }
      else
      {
        v17 = 0;
      }

      if (v17)
        goto LABEL_67;
    }
    else
    {

    }
    objc_msgSend(v8, "propertyForKey:", CFSTR("dataSourceClass"));
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
      goto LABEL_39;
    v38 = (NSString *)v37;
    objc_msgSend(v9, "load");
    -[objc_class sharedInstance](NSClassFromString(v38), "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "specifiersForSpecifier:observer:", v8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogForCategory(4);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v78 = v38;
      v79 = 2112;
      v80 = v17;
      _os_log_impl(&dword_1A3819000, v40, OS_LOG_TYPE_DEFAULT, "Got specifiers from datasource %@: Specifiers: %@", buf, 0x16u);
    }

    if (!v17)
    {
LABEL_39:
      objc_msgSend(v8, "propertyForKey:", CFSTR("detail"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        objc_msgSend(v8, "propertyForKey:", CFSTR("isController"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "BOOLValue");

        if (!v43
          || (NSStringFromClass((Class)objc_msgSend(v9, "principalClass")),
              (v41 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          NSStringFromClass((Class)objc_msgSend(v8, "detailControllerClass"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41)
            goto LABEL_45;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[PSCoreSpotlightIndexer controllerIsBlacklisted:](self, "controllerIsBlacklisted:", v41))
      {
LABEL_45:
        v17 = 0;
LABEL_66:

        goto LABEL_67;
      }
      -[PSCoreSpotlightIndexer indexFromControllerLog](self, "indexFromControllerLog");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "insertObject:atIndex:", v41, 0);

      v45 = (void *)objc_msgSend(CFSTR("PSCoreSpotlightIndexer indexed these PSlistControllers:\n"), "mutableCopy");
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      -[PSCoreSpotlightIndexer indexFromControllerLog](self, "indexFromControllerLog");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v46, "copy");

      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v69 != v50)
              objc_enumerationMutation(v47);
            objc_msgSend(v45, "appendString:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
            objc_msgSend(v45, "appendString:", CFSTR("\n"));
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v49);
      }

      v52 = objc_retainAutorelease(v45);
      qword_1EE6CD6B8 = objc_msgSend(v52, "UTF8String");
      objc_msgSend(v9, "load");
      v53 = NSClassFromString((NSString *)v41);
      PKLogForCategory(4);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "bundlePath");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "lastPathComponent");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringByDeletingPathExtension");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v78 = (NSString *)v41;
        v79 = 2112;
        v80 = v57;
        _os_log_impl(&dword_1A3819000, v54, OS_LOG_TYPE_DEFAULT, "Trying to get specifiers from controller: %@, in bundle: %@", buf, 0x16u);

      }
      if (v53)
      {
        if ((-[objc_class isSubclassOfClass:](v53, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
          v58 = objc_alloc_init(v53);
          -[NSObject setSpecifier:](v58, "setSpecifier:", v8);
          -[NSObject specifiers](v58, "specifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PKLogForCategory(4);
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v78 = (NSString *)v41;
            v79 = 2112;
            v80 = v17;
            _os_log_impl(&dword_1A3819000, v59, OS_LOG_TYPE_DEFAULT, "Got specifiers from controller %@: Specifiers: %@", buf, 0x16u);
          }

          goto LABEL_65;
        }
        PKLogForCategory(4);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:].cold.2();
      }
      else
      {
        PKLogForCategory(4);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:].cold.1();
      }
      v17 = 0;
LABEL_65:

      goto LABEL_66;
    }
  }
LABEL_67:

  return v17;
}

void __40__PSCoreSpotlightIndexer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  dispatch_queue_t v8;
  NSObject *v9;

  v2 = objc_opt_new();
  v3 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v2;

  v4 = objc_alloc(MEMORY[0x1E0CA6B38]);
  objc_msgSend(*(id *)(a1 + 32), "searchIndexIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:protectionClass:", v5, *MEMORY[0x1E0CB2AC0]);
  objc_msgSend((id)sharedInstance_sharedInstance, "setPrefsSearchableIndex:", v6);

  v7 = (const char *)objc_msgSend(*(id *)(a1 + 32), "spotlightIndexQueueIdentifier");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create(v7, v9);
  objc_msgSend((id)sharedInstance_sharedInstance, "setSpotlightIndexQueue:", v8);

}

- (void)setSpotlightIndexQueue:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightIndexQueue, a3);
}

- (void)setPrefsSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_prefsSearchableIndex, a3);
}

- (void)indexManifestBundlesAtURL:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSCoreSpotlightIndexer indexManifestBundlesAtURLs:withCompletion:](self, "indexManifestBundlesAtURLs:withCompletion:", v9, v7, v10, v11);
}

- (void)indexManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_opt_new();
  v8 = (void *)objc_opt_new();
  -[PSCoreSpotlightIndexer indexManifestBundlesAtURLs:skippingBundles:skippingManifests:withCompletion:](self, "indexManifestBundlesAtURLs:skippingBundles:skippingManifests:withCompletion:", v7, v9, v8, v6);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PSCoreSpotlightIndexer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Deleted existing Settings Spotlight Index for domains: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Started indexing 3rd party specifiers", buf, 2u);
  }

  +[PSSystemPolicyManager thirdPartyApplications](PSSystemPolicyManager, "thirdPartyApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSystemPolicyManager specifiersForThirdPartyApps:](PSSystemPolicyManager, "specifiersForThirdPartyApps:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "csSearchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", v4, 0, 0, 0, *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "searchableThirdPartyItemClassIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_280;
  v12[3] = &unk_1E4A65848;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v9 = *(id *)(a1 + 48);
  v14 = v4;
  v15 = v9;
  v10 = v4;
  v11 = v5;
  objc_msgSend(v6, "deleteIndexWithDomainIdentifiers:completionBlock:", v8, v12);

}

- (id)searchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  PSCoreSpotlightIndexer *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  NSObject *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id obj;
  char v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = v13;
  v16 = v14;
  v65 = a5;
  v61 = a6;
  v64 = a7;
  v17 = a8;
  v63 = v17;
  if (objc_msgSend(v13, "count"))
  {
    v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((unint64_t)objc_msgSend(v17, "count") <= 9)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = v13;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      v19 = self;
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v83;
        v58 = *(_QWORD *)v83;
        v59 = v16;
        do
        {
          v22 = 0;
          v62 = v20;
          do
          {
            if (*(_QWORD *)v83 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v22);
            if (ShouldIndexSpecifier(v23))
            {
              -[PSCoreSpotlightIndexer _bundleForSpecifier:parentBundle:](v19, "_bundleForSpecifier:parentBundle:", v23, v16);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v23;
              if ((objc_msgSend(v24, "isEqual:", v16) & 1) == 0)
              {
                -[PSCoreSpotlightIndexer searchableItemsFromManifestsForSpecifier:bundle:](v19, "searchableItemsFromManifestsForSpecifier:bundle:", v23, v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addObjectsFromArray:", v25);

              }
              v74 = v24;
              -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:](v19, "_specifiersForSpecifier:bundle:parentBundle:", v23, v24, v16);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringByAddingPercentEncodingWithAllowedCharacters:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v72 = v28;
              if (objc_msgSend(v28, "length"))
              {
                objc_msgSend(v23, "propertyForKey:", CFSTR("detail"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  v30 = 0;
                }
                else
                {
                  objc_msgSend(v23, "propertyForKey:", CFSTR("bundle"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                    v30 = 0;
                  else
                    v30 = objc_msgSend(v23, "detailControllerClass") == 0;

                }
                v80 = 0;
                v81 = 0;
                v67 = v30;
                LOBYTE(v57) = v30;
                -[PSCoreSpotlightIndexer _urlForSpecifier:identifier:category:childCategory:prefix:path:baseURL:shouldLinkToRow:](v19, "_urlForSpecifier:identifier:category:childCategory:prefix:path:baseURL:shouldLinkToRow:", v23, v72, v65, &v81, v64, &v80, v61, v57);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = v81;
                v70 = v80;
                v76 = 0u;
                v77 = 0u;
                v78 = 0u;
                v79 = 0u;
                v32 = v73;
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
                if (v33)
                {
                  v34 = v33;
                  v35 = 0;
                  v36 = *(_QWORD *)v77;
                  do
                  {
                    for (i = 0; i != v34; ++i)
                    {
                      if (*(_QWORD *)v77 != v36)
                        objc_enumerationMutation(v32);
                      v38 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                      if (!objc_msgSend(v38, "cellType"))
                      {
                        objc_msgSend(v38, "name");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = objc_msgSend(v39, "length");

                        if (v40)
                        {
                          if (!v35)
                            v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          objc_msgSend(v38, "name");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v35, "addObject:", v41);

                        }
                      }
                    }
                    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
                  }
                  while (v34);
                }
                else
                {
                  v35 = 0;
                }

                objc_msgSend(v75, "name");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = self;
                -[PSCoreSpotlightIndexer _descriptionForSpecifierName:withParentSpecifierNames:](self, "_descriptionForSpecifierName:withParentSpecifierNames:", v42, v63);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v75, "name");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "length");

                if (v45)
                {
                  objc_msgSend(v74, "bundleIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PSCoreSpotlightIndexer searchableItemForSpecifier:bundleID:category:keywords:url:description:](self, "searchableItemForSpecifier:bundleID:category:keywords:url:description:", v75, v46, v65, v35, v71, v43);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v68, "addObject:", v47);
                }
                v48 = v69;
                if (objc_msgSend(v32, "count"))
                {
                  objc_msgSend(v75, "name");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v49)
                  {
                    objc_msgSend(v75, "name");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v63)
                    {
                      objc_msgSend(v63, "arrayByAddingObject:", v50);
                    }
                    else
                    {
                      v90 = v50;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
                    }
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  -[PSCoreSpotlightIndexer searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:](self, "searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", v32, v74, v69, v70, v64, v49);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "addObjectsFromArray:", v51);

                }
                v52 = objc_msgSend(v32, "count");
                v53 = v67;
                if (v52)
                  v53 = 1;
                v16 = v59;
                v20 = v62;
                if ((v53 & 1) == 0)
                {
                  PKLogForCategory(4);
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v75, "name");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v87 = v55;
                    v88 = 2112;
                    v89 = v71;
                    _os_log_impl(&dword_1A3819000, v54, OS_LOG_TYPE_DEFAULT, "Can't find children for \"%@\" URL: %@", buf, 0x16u);

                    v48 = v69;
                  }

                }
                v21 = v58;
              }

            }
            ++v22;
          }
          while (v22 != v20);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
        }
        while (v20);
      }

      v15 = v13;
    }
  }
  else
  {
    v68 = 0;
  }

  return v68;
}

- (id)searchableItemsFromManifestsForSpecifier:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PSCoreSpotlightIndexer skipManifests](self, "skipManifests");
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7 && !v8)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v7, "bundleURL", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSCoreSpotlightIndexer manifestsFromDirectory:](self, "manifestsFromDirectory:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          -[PSCoreSpotlightIndexer searchableItemsFromManifest:specifier:bundle:processCapabilities:](self, "searchableItemsFromManifest:specifier:bundle:processCapabilities:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), v6, v7, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    v9 = (void *)objc_msgSend(v10, "copy");
  }

  return v9;
}

- (void)indexThirdPartyAppsWithPrefix:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *spotlightIndexQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke;
  block[3] = &unk_1E4A65780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(spotlightIndexQueue, block);

}

- (id)csSearchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PSCoreSpotlightIndexer searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:](self, "searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "toCSSearchableItem", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v9, "copy");
  return v16;
}

- (id)_bundleForSpecifier:(id)a3 parentBundle:(id)a4
{
  id v5;
  void *v6;
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
  int AppBooleanValue;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  Boolean keyExistsAndHasValidFormat;

  v5 = a4;
  objc_msgSend(a3, "propertyForKey:", CFSTR("bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB34D0];
    PSBundlePathForPreferenceBundle((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleWithPath:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      SFDeveloperSettingsBundlesDirectoryPath();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("bundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB34D0];
      SFRuntimeAbsoluteFilePathForPath();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleWithPath:", v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "sf_isInternalInstall") & 1) != 0)
        {
          keyExistsAndHasValidFormat = 0;
          AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSShouldIndexInternalSettings"), CFSTR("com.apple.Preferences"), &keyExistsAndHasValidFormat);
          v18 = keyExistsAndHasValidFormat;

          v10 = 0;
          if (v18 && AppBooleanValue)
          {
            objc_msgSend(CFSTR("/AppleInternal/Library/PreferenceBundles/"), "stringByAppendingPathComponent:", v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("bundle"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x1E0CB34D0];
            SFRuntimeAbsoluteFilePathForPath();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "bundleWithPath:", v22);
            v10 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {

          v10 = 0;
        }
      }
    }
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

+ (char)spotlightIndexQueueIdentifier
{
  return "com.apple.preferences.spotlightIndexQueue";
}

+ (id)searchIndexIdentifier
{
  return CFSTR("com.apple.Preferences.SearchableIndex");
}

- (id)blacklistedControllers
{
  return &unk_1E4A92D90;
}

- (BOOL)controllerIsBlacklisted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PSCoreSpotlightIndexer blacklistedControllers](self, "blacklistedControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)needsIndex
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  int v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PSCoreSpolightIndexerNeverIndex"));

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PSCoreSpolightIndexerAlwaysIndex"));

    if (v8)
    {
      PKLogForCategory(4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        v9 = "PSCoreSpolightIndexerAlwaysIndex is set. Always indexing.";
LABEL_11:
        _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, v9, v23, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("PSCoreSpolightIndexerNeedsIndex"));

    if (v11)
    {
      PKLogForCategory(4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        v9 = "indexing because kCoreSpolightIndexerNeedsIndexKey is set.";
        goto LABEL_11;
      }
LABEL_12:
      v6 = 1;
      goto LABEL_43;
    }
    -[PSCoreSpotlightIndexer lastIndexDate](self, "lastIndexDate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v5);
      v14 = v13;

      if (v14 <= 345600.0)
      {
        -[PSCoreSpotlightIndexer lastIndexBuild](self, "lastIndexBuild");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = MGCopyAnswer();
          if ((-[NSObject isEqualToString:](v16, "isEqualToString:", v15) & 1) != 0)
          {

            -[PSCoreSpotlightIndexer lastIndexLanguage](self, "lastIndexLanguage");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndex:", 0);
              v18 = objc_claimAutoreleasedReturnValue();

              if ((-[NSObject isEqualToString:](v18, "isEqualToString:", v16) & 1) != 0)
              {

                PKLogForCategory(4);
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v23 = 0;
                  _os_log_impl(&dword_1A3819000, v18, OS_LOG_TYPE_DEFAULT, "Indexing not needed", v23, 2u);
                }
                v6 = 0;
                goto LABEL_40;
              }
              PKLogForCategory(4);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v23 = 0;
                _os_log_impl(&dword_1A3819000, v21, OS_LOG_TYPE_DEFAULT, "Indexing because language has changed.", v23, 2u);
              }

            }
            else
            {
              PKLogForCategory(4);
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v23 = 0;
                _os_log_impl(&dword_1A3819000, v18, OS_LOG_TYPE_DEFAULT, "Indexing because there's no last known indexed language.", v23, 2u);
              }
            }
            v6 = 1;
LABEL_40:

            goto LABEL_41;
          }
          PKLogForCategory(4);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1A3819000, v20, OS_LOG_TYPE_DEFAULT, "Indexing because build number has changed.", v23, 2u);
          }

        }
        else
        {
          PKLogForCategory(4);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1A3819000, v16, OS_LOG_TYPE_DEFAULT, "Indexing because there's no last known indexed build number.", v23, 2u);
          }
        }
        v6 = 1;
LABEL_41:

        goto LABEL_42;
      }
      PKLogForCategory(4);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        v19 = "Indexing because time interval has passed.";
        goto LABEL_26;
      }
    }
    else
    {
      PKLogForCategory(4);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        v19 = "Indexing because we have never indexed.";
LABEL_26:
        _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, v19, v23, 2u);
      }
    }
    v6 = 1;
LABEL_42:

    goto LABEL_43;
  }
  PKLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "PSCoreSpolightIndexerNeverIndex is set. Never indexing.", v23, 2u);
  }
  v6 = 0;
LABEL_43:

  return v6;
}

- (void)setNeedsIndex:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PSCoreSpolightIndexerNeedsIndex"));

}

- (void)setNeedsIndex
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSCoreSpotlightIndexer setNeedsIndex:](self, "setNeedsIndex:", 1);
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Marking index as outdated", v3, 2u);
  }

}

- (void)setHasIndexed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer setLastIndexDate:](self, "setLastIndexDate:", v3);

  v4 = (void *)MGCopyAnswer();
  -[PSCoreSpotlightIndexer setLastIndexBuild:](self, "setLastIndexBuild:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer setLastIndexLanguage:](self, "setLastIndexLanguage:", v6);

  -[PSCoreSpotlightIndexer setNeedsIndex:](self, "setNeedsIndex:", 0);
}

- (NSDate)lastIndexDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PSCoreSpolightIndexerLastIndexDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastIndexDate:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("PSCoreSpolightIndexerLastIndexDate"));

  PKLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index date: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)lastIndexBuild
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PSCoreSpolightIndexerLastIndexBuild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastIndexBuild:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("PSCoreSpolightIndexerLastIndexBuild"));

  PKLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index build: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)lastIndexLanguage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PSCoreSpolightIndexerLastIndexLanguage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastIndexLanguage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("PSCoreSpolightIndexerLastIndexLanguage"));

  PKLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index language: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)searchableItemAttributeSetClassIdenfitier
{
  return CFSTR("com.apple.Preferences.url");
}

- (id)searchableItemClassIdentifier
{
  return CFSTR("com.apple.Preferences");
}

- (id)searchableThirdPartyItemClassIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PSCoreSpotlightIndexer searchableItemClassIdentifier](self, "searchableItemClassIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.thirdPartyApp"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)hasfirstPartyIndexItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PSCoreSpotlightIndexer *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PSCoreSpotlightIndexer hasItemsQuery](self, "hasItemsQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:attributes:", CFSTR("contentType == \"*firstParty\"), 0);
  -[PSCoreSpotlightIndexer setHasItemsQuery:](self, "setHasItemsQuery:", v6);

  -[PSCoreSpotlightIndexer searchableItemClassIdentifier](self, "searchableItemClassIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer hasItemsQuery](self, "hasItemsQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBundleIDs:", v8);

  v10 = *MEMORY[0x1E0CB2AC0];
  v23[0] = *MEMORY[0x1E0CB2AB0];
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer hasItemsQuery](self, "hasItemsQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProtectionClasses:", v11);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __50__PSCoreSpotlightIndexer_hasfirstPartyIndexItems___block_invoke;
  v20 = &unk_1E4A656C0;
  v21 = self;
  v22 = v4;
  v13 = v4;
  v14 = (void *)MEMORY[0x1A8594D10](&v17);
  -[PSCoreSpotlightIndexer hasItemsQuery](self, "hasItemsQuery", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompletionHandler:", v14);

  -[PSCoreSpotlightIndexer hasItemsQuery](self, "hasItemsQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "start");

}

uint64_t __50__PSCoreSpotlightIndexer_hasfirstPartyIndexItems___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "hasItemsQuery");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "foundItemCount");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (id)fedStatsStringsFromManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *context;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = a4;
  v6 = (void *)objc_opt_new();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v5;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v42)
  {
    v40 = *MEMORY[0x1E0C99A90];
    v41 = *(_QWORD *)v71;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v71 != v41)
          objc_enumerationMutation(obj);
        v44 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v7);
        v43 = (void *)MEMORY[0x1A8594B48]();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v40);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v10, 4, &v69);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v69;

        v45 = v12;
        if (v12)
        {
          PKLogForCategory(4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v78 = v12;
            v79 = 2114;
            v80 = v8;
            _os_log_error_impl(&dword_1A3819000, v13, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
          }

        }
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v47 = v11;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        if (v48)
        {
          v14 = *(_QWORD *)v66;
          v46 = *(_QWORD *)v66;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v66 != v14)
                objc_enumerationMutation(v47);
              v50 = v15;
              v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v15);
              context = (void *)MEMORY[0x1A8594B48]();
              objc_msgSend(v16, "lastPathComponent");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "pathExtension");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("bundle"));

              if (v19)
              {
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v16);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                v64 = 0u;
                -[PSCoreSpotlightIndexer manifestsFromDirectory:](self, "manifestsFromDirectory:", v16);
                v51 = (id)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
                if (v55)
                {
                  v52 = *(_QWORD *)v62;
                  do
                  {
                    v20 = 0;
                    do
                    {
                      if (*(_QWORD *)v62 != v52)
                        objc_enumerationMutation(v51);
                      v56 = v20;
                      v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v20);
                      PKLogForCategory(4);
                      v22 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v78 = v21;
                        _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                      }

                      +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PSCoreSpotlightIndexer searchableItemsFromManifest:specifier:bundle:processCapabilities:](self, "searchableItemsFromManifest:specifier:bundle:processCapabilities:", v21, v23, v54, 0);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v54, "unload");
                      v57 = 0u;
                      v58 = 0u;
                      v59 = 0u;
                      v60 = 0u;
                      v25 = v24;
                      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
                      if (v26)
                      {
                        v27 = v26;
                        v28 = *(_QWORD *)v58;
                        do
                        {
                          for (i = 0; i != v27; ++i)
                          {
                            if (*(_QWORD *)v58 != v28)
                              objc_enumerationMutation(v25);
                            v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                            objc_msgSend(v30, "name");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
                            v32 = (void *)objc_claimAutoreleasedReturnValue();

                            v33 = (void *)MEMORY[0x1E0CB3940];
                            objc_msgSend(v30, "url");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v33, "stringWithFormat:", CFSTR("%@:%@"), v34, v32);
                            v35 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v6, "addObject:", v35);
                          }
                          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
                        }
                        while (v27);
                      }

                      v20 = v56 + 1;
                    }
                    while (v56 + 1 != v55);
                    v55 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
                  }
                  while (v55);
                }

                v14 = v46;
              }
              objc_autoreleasePoolPop(context);
              v15 = v50 + 1;
            }
            while (v50 + 1 != v48);
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
          }
          while (v48);
        }

        objc_autoreleasePoolPop(v43);
        v7 = v44 + 1;
      }
      while (v44 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    }
    while (v42);
  }

  v36 = (void *)objc_msgSend(v6, "copy");
  return v36;
}

- (id)readManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5
{
  id v7;
  id v8;
  id v9;
  __int128 v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  __int128 v57;
  uint64_t v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *context;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  char v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  NSObject *v98;
  __int16 v99;
  NSObject *v100;
  NSObject *v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v72 = (id)objc_opt_new();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v7;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (v61)
  {
    v60 = *(_QWORD *)v91;
    v58 = *MEMORY[0x1E0C99A90];
    *(_QWORD *)&v10 = 138543618;
    v57 = v10;
    v65 = v8;
    v71 = v9;
    do
    {
      for (i = 0; i != v61; i = v22 + 1)
      {
        if (*(_QWORD *)v91 != v60)
          objc_enumerationMutation(obj);
        v64 = i;
        v12 = *(NSObject **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v63 = MEMORY[0x1A8594B48]();
        v89 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v12, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v14, &v89);

        if ((v15 & 1) != 0)
        {
          if (v89)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v58);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = 0;
            objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, v17, 4, &v88);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v88;

            v62 = v19;
            if (v19)
            {
              PKLogForCategory(4);
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                v98 = v19;
                v99 = 2114;
                v100 = v12;
                _os_log_error_impl(&dword_1A3819000, v20, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
              }

LABEL_17:
              v86 = 0u;
              v87 = 0u;
              v84 = 0u;
              v85 = 0u;
              v24 = v18;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
              if (!v25)
                goto LABEL_52;
              v26 = v25;
              v27 = *(_QWORD *)v85;
              v66 = *(_QWORD *)v85;
              v67 = v24;
              while (2)
              {
                v28 = 0;
                v68 = v26;
LABEL_20:
                if (*(_QWORD *)v85 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v28);
                context = (void *)MEMORY[0x1A8594B48]();
                v70 = v28;
                if (objc_msgSend(v8, "containsObject:", v29))
                {
                  PKLogForCategory(4);
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v29, "absoluteString");
                    v31 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v98 = v31;
                    _os_log_impl(&dword_1A3819000, v30, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted bundle %@", buf, 0xCu);

                  }
                  goto LABEL_49;
                }
                objc_msgSend(v29, "lastPathComponent");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "pathExtension");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("bundle"));

                if (v34)
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v29);
                  v30 = objc_claimAutoreleasedReturnValue();
                  v80 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  v83 = 0u;
                  -[PSCoreSpotlightIndexer manifestsFromDirectory:](self, "manifestsFromDirectory:", v29);
                  v75 = (id)objc_claimAutoreleasedReturnValue();
                  v35 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
                  if (v35)
                  {
                    v36 = v35;
                    v37 = *(_QWORD *)v81;
                    do
                    {
                      v38 = 0;
                      v74 = v36;
                      do
                      {
                        if (*(_QWORD *)v81 != v37)
                          objc_enumerationMutation(v75);
                        v39 = *(NSObject **)(*((_QWORD *)&v80 + 1) + 8 * v38);
                        v40 = objc_msgSend(v9, "containsObject:", v39, v57);
                        PKLogForCategory(4);
                        v41 = objc_claimAutoreleasedReturnValue();
                        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
                        if (v40)
                        {
                          if (v42)
                          {
                            -[NSObject absoluteString](v39, "absoluteString");
                            v43 = objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412290;
                            v98 = v43;
                            _os_log_impl(&dword_1A3819000, v41, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted manifest %@", buf, 0xCu);

                          }
                        }
                        else
                        {
                          if (v42)
                          {
                            *(_DWORD *)buf = 138412290;
                            v98 = v39;
                            _os_log_impl(&dword_1A3819000, v41, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                          }

                          +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          -[PSCoreSpotlightIndexer searchableItemsFromManifest:specifier:bundle:processCapabilities:](self, "searchableItemsFromManifest:specifier:bundle:processCapabilities:", v39, v44, v30, 1);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();

                          v46 = v30;
                          -[NSObject unload](v30, "unload");
                          PKLogForCategory(4);
                          v47 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v98 = v39;
                            _os_log_impl(&dword_1A3819000, v47, OS_LOG_TYPE_DEFAULT, "Converting %@", buf, 0xCu);
                          }
                          v48 = v37;

                          v41 = objc_opt_new();
                          v76 = 0u;
                          v77 = 0u;
                          v78 = 0u;
                          v79 = 0u;
                          v49 = v45;
                          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                          if (v50)
                          {
                            v51 = v50;
                            v52 = *(_QWORD *)v77;
                            do
                            {
                              for (j = 0; j != v51; ++j)
                              {
                                if (*(_QWORD *)v77 != v52)
                                  objc_enumerationMutation(v49);
                                objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "toAutomationDictionary");
                                v54 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSObject addObject:](v41, "addObject:", v54);

                              }
                              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                            }
                            while (v51);
                          }

                          -[NSObject absoluteString](v39, "absoluteString");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v72, "setObject:forKey:", v41, v55);

                          v9 = v71;
                          v30 = v46;
                          v37 = v48;
                          v36 = v74;
                        }

                        ++v38;
                      }
                      while (v38 != v36);
                      v36 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
                    }
                    while (v36);
                  }

                  v8 = v65;
                  v27 = v66;
                  v24 = v67;
                  v26 = v68;
LABEL_49:

                }
                objc_autoreleasePoolPop(context);
                v28 = v70 + 1;
                if (v70 + 1 == v26)
                {
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
                  if (!v26)
                  {
LABEL_52:

                    v23 = (void *)v63;
                    v22 = v64;
                    v21 = v62;
                    goto LABEL_53;
                  }
                  continue;
                }
                goto LABEL_20;
              }
            }
          }
          else
          {
            v101 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v62 = 0;
          goto LABEL_17;
        }
        PKLogForCategory(4);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v98 = v12;
          _os_log_error_impl(&dword_1A3819000, v21, OS_LOG_TYPE_ERROR, "path at %{public}@ does not exist", buf, 0xCu);
        }
        v23 = (void *)v63;
        v22 = v64;
LABEL_53:

        objc_autoreleasePoolPop(v23);
      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    }
    while (v61);
  }

  return v72;
}

- (void)indexManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *spotlightIndexQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke;
  block[3] = &unk_1E4A65730;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(spotlightIndexQueue, block);

}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_2;
  v3[3] = &unk_1E4A65730;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v4, "performYukonManifestMigrationWithCompletion:", v3);

}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "searchableFirstPartyItemClassIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_3;
  v7[3] = &unk_1E4A65730;
  v8 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v2, "deleteIndexWithDomainIdentifiers:completionBlock:", v4, v7);

}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_3(id *a1)
{
  NSObject *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  char *v35;
  id *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void *context;
  uint64_t v77;
  NSObject *group;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id *v82;
  _QWORD block[4];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  NSObject *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  char v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  void *v116;
  void *v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Index Deleted. Reindexing Manifests...", buf, 2u);
  }

  group = dispatch_group_create();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = a1[4];
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
  if (v69)
  {
    v68 = *(_QWORD *)v106;
    v66 = *MEMORY[0x1E0C99A90];
    do
    {
      for (i = 0; i != v69; i = v14 + 1)
      {
        if (*(_QWORD *)v106 != v68)
          objc_enumerationMutation(obj);
        v72 = i;
        v4 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        v71 = MEMORY[0x1A8594B48]();
        v104 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "path");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v104);

        if ((v7 & 1) != 0)
        {
          if (v104)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v66);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = 0;
            objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v9, 4, &v103);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (const char *)v103;

            v70 = v11;
            if (v11)
            {
              PKLogForCategory(4);
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v114 = v11;
                v115 = 2114;
                v116 = v4;
                _os_log_error_impl(&dword_1A3819000, v12, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
              }

LABEL_19:
              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v16 = v10;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
              if (!v17)
                goto LABEL_56;
              v18 = v17;
              v19 = *(_QWORD *)v100;
              v73 = *(_QWORD *)v100;
              v74 = v16;
              while (2)
              {
                v20 = 0;
                v75 = v18;
LABEL_22:
                if (*(_QWORD *)v100 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v20);
                context = (void *)MEMORY[0x1A8594B48]();
                v77 = v20;
                if (objc_msgSend(a1[5], "containsObject:", v21))
                {
                  PKLogForCategory(4);
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v21, "absoluteString");
                    v23 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v114 = v23;
                    _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted bundle %@", buf, 0xCu);

                  }
                  goto LABEL_53;
                }
                objc_msgSend(v21, "lastPathComponent");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "pathExtension");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("bundle"));

                if (v26)
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v21);
                  v22 = objc_claimAutoreleasedReturnValue();
                  v95 = 0u;
                  v96 = 0u;
                  v97 = 0u;
                  v98 = 0u;
                  objc_msgSend(a1[6], "manifestsFromDirectory:", v21);
                  v81 = (id)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v96;
                    v79 = *(_QWORD *)v96;
                    do
                    {
                      v30 = 0;
                      v80 = v28;
                      do
                      {
                        if (*(_QWORD *)v96 != v29)
                          objc_enumerationMutation(v81);
                        v31 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v30);
                        v32 = objc_msgSend(a1[7], "containsObject:", v31);
                        PKLogForCategory(4);
                        v33 = objc_claimAutoreleasedReturnValue();
                        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
                        if (v32)
                        {
                          if (v34)
                          {
                            objc_msgSend(v31, "absoluteString");
                            v35 = (char *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412290;
                            v114 = v35;
                            _os_log_impl(&dword_1A3819000, v33, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted manifest %@", buf, 0xCu);

                          }
                        }
                        else
                        {
                          if (v34)
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A3819000, v33, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                          }

                          v36 = a1;
                          v37 = a1[6];
                          +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "searchableItemsFromManifest:specifier:bundle:processCapabilities:", v31, v38, v22, 1);
                          v39 = (void *)objc_claimAutoreleasedReturnValue();

                          v40 = v22;
                          -[NSObject unload](v22, "unload");
                          PKLogForCategory(4);
                          v41 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A3819000, v41, OS_LOG_TYPE_DEFAULT, "Converting %@", buf, 0xCu);
                          }

                          v33 = objc_opt_new();
                          v91 = 0u;
                          v92 = 0u;
                          v93 = 0u;
                          v94 = 0u;
                          v42 = v39;
                          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
                          if (v43)
                          {
                            v44 = v43;
                            v45 = *(_QWORD *)v92;
                            do
                            {
                              for (j = 0; j != v44; ++j)
                              {
                                if (*(_QWORD *)v92 != v45)
                                  objc_enumerationMutation(v42);
                                objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "toCSSearchableItem");
                                v47 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSObject addObject:](v33, "addObject:", v47);

                              }
                              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
                            }
                            while (v44);
                          }

                          PKLogForCategory(4);
                          v48 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A3819000, v48, OS_LOG_TYPE_DEFAULT, "Indexing %@", buf, 0xCu);
                          }

                          dispatch_group_enter(group);
                          a1 = v36;
                          v49 = v36[6];
                          v89[0] = MEMORY[0x1E0C809B0];
                          v89[1] = 3221225472;
                          v89[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_187;
                          v89[3] = &unk_1E4A655B8;
                          v89[4] = v31;
                          v90 = group;
                          objc_msgSend(v49, "_indexSearchableItems:completionHandler:", v33, v89);

                          v22 = v40;
                          v29 = v79;
                          v28 = v80;
                        }

                        ++v30;
                      }
                      while (v30 != v28);
                      v28 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
                    }
                    while (v28);
                  }

                  v19 = v73;
                  v16 = v74;
                  v18 = v75;
LABEL_53:

                }
                objc_autoreleasePoolPop(context);
                v20 = v77 + 1;
                if (v77 + 1 == v18)
                {
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
                  if (!v18)
                  {
LABEL_56:

                    v15 = (void *)v71;
                    v14 = v72;
                    v13 = v70;
                    goto LABEL_57;
                  }
                  continue;
                }
                goto LABEL_22;
              }
            }
          }
          else
          {
            v117 = v4;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v70 = 0;
          goto LABEL_19;
        }
        PKLogForCategory(4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v114 = (const char *)v4;
          _os_log_error_impl(&dword_1A3819000, v13, OS_LOG_TYPE_ERROR, "path at %{public}@ does not exist", buf, 0xCu);
        }
        v15 = (void *)v71;
        v14 = v72;
LABEL_57:

        objc_autoreleasePoolPop(v15);
      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
    }
    while (v69);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "BOOLForKey:", CFSTR("PSCoreSpolightIndexerWriteFedStatsStrings"));

  if (v51)
  {
    v82 = a1;
    objc_msgSend(a1[6], "fedStatsStringsFromManifestBundlesAtURLs:withCompletion:", a1[4], 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(&stru_1E4A69238, "mutableCopy");
    v55 = (void *)objc_opt_new();
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v56 = v53;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v86;
      do
      {
        for (k = 0; k != v58; ++k)
        {
          if (*(_QWORD *)v86 != v59)
            objc_enumerationMutation(v56);
          v61 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k);
          if ((objc_msgSend(v55, "containsObject:", v61) & 1) == 0)
          {
            objc_msgSend(v55, "addObject:", v61);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "appendString:", v62);

          }
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
      }
      while (v58);
    }

    NSTemporaryDirectory();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringByAppendingPathComponent:", CFSTR("fedstats_index_strings.txt"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "writeToFile:atomically:encoding:error:", v64, 1, 4, 0);
    PKLogForCategory(4);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "-[PSCoreSpotlightIndexer indexManifestBundlesAtURLs:skippingBundles:skippingManifests:withCompletion:]_block_invoke_2";
      v115 = 2112;
      v116 = v64;
      _os_log_impl(&dword_1A3819000, v65, OS_LOG_TYPE_DEFAULT, "%s: fedstats index strings file: %@", buf, 0x16u);
    }

    a1 = v82;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_197;
  block[3] = &unk_1E4A65708;
  v84 = a1[8];
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_187(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Indexing Manifest completed for %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_188(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_197(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)topHitSearchForString:(id)a3 keyboardLanguage:(id)a4 foundItemsHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  void *v27;
  uint8_t buf[4];
  PSCoreSpotlightIndexer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancel");

  PKLogForCategory(4);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1A3819000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing top hit search", buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B88]), "initWithSearchString:keyboardLanguage:attributes:hitCount:", v13, v12, &unk_1E4A92DA8, 500);
  -[PSCoreSpotlightIndexer setSearchQuery:](self, "setSearchQuery:", v16);

  -[PSCoreSpotlightIndexer searchableItemClassIdentifier](self, "searchableItemClassIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBundleIDs:", v18);

  v20 = *MEMORY[0x1E0CB2AC0];
  v26[0] = *MEMORY[0x1E0CB2AB0];
  v26[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProtectionClasses:", v21);

  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFoundItemsHandler:", v11);

  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCompletionHandler:", v10);

  -[PSCoreSpotlightIndexer searchQuery](self, "searchQuery");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "start");

}

- (void)reindexSpecifiersIfNeeded:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 setHasIndexed:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *spotlightIndexQueue;
  id *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  void *v26;
  _QWORD block[4];
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (-[PSCoreSpotlightIndexer needsIndex](self, "needsIndex"))
  {
    v18 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke;
    v29[3] = &unk_1E4A657A8;
    v34 = a7;
    v29[4] = self;
    v30 = v14;
    v31 = v15;
    v32 = v16;
    v33 = v17;
    v19 = (void *)MEMORY[0x1A8594D10](v29);
    v20 = v19;
    spotlightIndexQueue = self->_spotlightIndexQueue;
    if (v10)
    {
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_214;
      block[3] = &unk_1E4A65708;
      v22 = &v28;
      v28 = v19;
      v23 = v19;
      dispatch_sync(spotlightIndexQueue, block);
    }
    else
    {
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_2;
      v25[3] = &unk_1E4A65708;
      v22 = &v26;
      v26 = v19;
      v24 = v19;
      dispatch_async(spotlightIndexQueue, v25);
    }

  }
}

void __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setHasIndexed");
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Gathering index items...", buf, 2u);
  }

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setIndexFromControllerLog:", v3);

  objc_msgSend(*(id *)(a1 + 32), "csSearchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Deleting index", buf, 2u);
  }

  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_212;
  v8[3] = &unk_1E4A65780;
  v8[4] = v6;
  v9 = v4;
  v10 = *(id *)(a1 + 64);
  v7 = v4;
  objc_msgSend(v6, "deleteIndexWithCompletionBlock:", v8);

}

void __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Index Deleted. Reindexing...", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_213;
  v5[3] = &unk_1E4A65758;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_indexSearchableItems:completionHandler:", v4, v5);

}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_213(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Indexing completed. Indexed the following PSListControllers:", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "indexFromControllerLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        PKLogForCategory(4);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v8;
          _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)indexSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *spotlightIndexQueue;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke;
    block[3] = &unk_1E4A65730;
    block[4] = self;
    v24 = v12;
    v25 = v13;
    v26 = v14;
    v27 = v15;
    dispatch_sync(spotlightIndexQueue, block);

    v17 = v24;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2;
    v18[3] = &unk_1E4A65730;
    v18[4] = self;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    dispatch_async(spotlightIndexQueue, v18);

    v17 = v19;
  }

}

void __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "csSearchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", a1[5], a1[6], 0, 0, a1[7], 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_indexSearchableItems:completionHandler:", v3, a1[8]);

}

void __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "csSearchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", a1[5], a1[6], 0, 0, a1[7], 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_indexSearchableItems:completionHandler:", v3, a1[8]);

}

- (void)deleteSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *spotlightIndexQueue;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke;
    block[3] = &unk_1E4A65730;
    block[4] = self;
    v24 = v12;
    v25 = v13;
    v26 = v14;
    v27 = v15;
    dispatch_sync(spotlightIndexQueue, block);

    v17 = v24;
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2;
    v18[3] = &unk_1E4A65730;
    v18[4] = self;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    dispatch_async(spotlightIndexQueue, v18);

    v17 = v19;
  }

}

uint64_t __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSpecifiers:bundle:category:pathURL:withURLPrefix:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSpecifiers:bundle:category:pathURL:withURLPrefix:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)deleteIndexWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PSCoreSpotlightIndexer prefsSearchableIndex](self, "prefsSearchableIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E4A657D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "deleteAllSearchableItemsWithCompletionHandler:", v7);

}

void __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  PKLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Deleted existing Settings Spotlight Index", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (id)manifestFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PSCoreSpotlightIndexer searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:](self, "searchableItemsFromSpecifiers:bundle:category:pathURL:withURLPrefix:parentSpecifierNames:", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "toManifestDictionary", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v9, "copy");
  return v16;
}

void __73__PSCoreSpotlightIndexer__indexChunkOfSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "Unable to index items with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "Successfully indexed %@ items.", (uint8_t *)&v8, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)_deleteSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void (**v42)(_QWORD);
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  id obj;
  void *v50;
  _QWORD v51[4];
  id v52;
  void (**v53)(_QWORD);
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v46 = a6;
  v44 = a7;
  v17 = (void (**)(_QWORD))a8;
  if (objc_msgSend(v14, "count"))
  {
    v42 = v17;
    v47 = (void *)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v43 = v14;
    obj = v14;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    v19 = v44;
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v57;
      v45 = *(_QWORD *)v57;
      do
      {
        v22 = 0;
        v48 = v20;
        do
        {
          if (*(_QWORD *)v57 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v22);
          if (ShouldIndexSpecifier(v23))
          {
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v26, "length"))
            {
              objc_msgSend(v23, "propertyForKey:", CFSTR("detail"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = 0;
              }
              else
              {
                objc_msgSend(v23, "propertyForKey:", CFSTR("bundle"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                  v28 = 0;
                else
                  v28 = objc_msgSend(v23, "detailControllerClass") == 0;

              }
              v54 = 0;
              v55 = 0;
              LOBYTE(v41) = v28;
              -[PSCoreSpotlightIndexer _urlForSpecifier:identifier:category:childCategory:prefix:path:baseURL:shouldLinkToRow:](self, "_urlForSpecifier:identifier:category:childCategory:prefix:path:baseURL:shouldLinkToRow:", v23, v26, v16, &v55, v19, &v54, v46, v41);
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = v55;
              v32 = v54;
              v50 = (void *)v30;
              objc_msgSend(v47, "addObject:", v30);
              -[PSCoreSpotlightIndexer _bundleForSpecifier:parentBundle:](self, "_bundleForSpecifier:parentBundle:", v23, v15);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v33, "isEqual:", v15) & 1) == 0)
              {
                -[PSCoreSpotlightIndexer _urlsFromManifestForSpecifier:bundle:](self, "_urlsFromManifestForSpecifier:bundle:", v23, v15);
                v34 = v16;
                v35 = v15;
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObjectsFromArray:", v36);

                v15 = v35;
                v16 = v34;
                v19 = v44;
              }
              -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:](self, "_specifiersForSpecifier:bundle:parentBundle:", v23, v33, v15);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[PSCoreSpotlightIndexer _deleteSpecifiers:bundle:category:pathURL:withURLPrefix:completion:](self, "_deleteSpecifiers:bundle:category:pathURL:withURLPrefix:completion:", v37, v33, v31, v32, v19, 0);

              v21 = v45;
            }

            v20 = v48;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v20);
    }

    -[PSCoreSpotlightIndexer prefsSearchableIndex](self, "prefsSearchableIndex");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v47, "copy");
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke;
    v51[3] = &unk_1E4A657F8;
    v52 = v47;
    v17 = v42;
    v53 = v42;
    v40 = v47;
    objc_msgSend(v38, "deleteSearchableItemsWithIdentifiers:completionHandler:", v39, v51);

    v14 = v43;
  }
  else if (v17)
  {
    v17[2](v17);
  }

}

void __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Deleted index items with identifiers: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (id)_keyValueDictionaryForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PSURLManager sharedManager](PSURLManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyValueDictionaryForURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionForSpecifierName:(id)a3 withParentSpecifierNames:(id)a4
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  if (objc_msgSend(v4, "count"))
  {
    v5 = PSLocaleLanguageDirection();
    v6 = CFSTR("→");
    if (v5 == 2)
      v6 = CFSTR("←");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ "), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("\u200F"));
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)descriptionForCSSearchableItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rankingHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Search item name=%@, rank=%@, uid=%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForCSSearchableItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[PSCoreSpotlightIndexer descriptionForCSSearchableItem:](self, "descriptionForCSSearchableItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v11);

        objc_msgSend(v5, "appendString:", CFSTR("\n"));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_specifiersPlistPathForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "propertyForKey:", CFSTR("searchPlist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "pathForResource:ofType:", v10, CFSTR("plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v7, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathForResource:ofType:", v14, CFSTR("plist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v15 = objc_msgSend(v8, "isEqual:", v9);
    if (!objc_msgSend(v11, "length") && (v15 & 1) == 0)
    {
      objc_msgSend(v8, "bundleURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByDeletingPathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "pathForResource:ofType:", v18, CFSTR("plist"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v19, "length"))
      {
        PKLogForCategory(4);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412546;
          v24 = v21;
          v25 = 2112;
          v26 = v18;
          _os_log_impl(&dword_1A3819000, v20, OS_LOG_TYPE_DEFAULT, "Could not find plist for specifier: %@, in bundle: %@", (uint8_t *)&v23, 0x16u);

        }
      }

      v11 = v19;
    }
  }

  return v11;
}

- (id)_urlForSpecifier:(id)a3 identifier:(id)a4 category:(id)a5 childCategory:(id *)a6 prefix:(id)a7 path:(id *)a8 baseURL:(id)a9 shouldLinkToRow:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  if (objc_msgSend(v17, "length"))
  {
    v20 = objc_retainAutorelease(v17);
    *a6 = v20;
    if (objc_msgSend(v19, "length"))
    {
      if (!a10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v19, v16);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "length");
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:root=%@&path=%@"), v18, v20, *a8);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@#%@"), v19, v16);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = objc_retainAutorelease(v16);
    }
    *a8 = v21;
    if (!objc_msgSend(v19, "length") && a10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:root=%@#%@"), v18, v20, *a8);
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v22 = objc_retainAutorelease(v16);
  *a6 = v22;
  if (a10)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:root=ROOT#%@"), v18, v22, v29);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:root=%@"), v18, v22, v29);
LABEL_14:
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertyForKey:", CFSTR("AppBundleID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "propertyForKey:", CFSTR("AppBundleID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@&thirdPartyBundleID=%@"), v23, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
  }

  return v23;
}

- (id)_urlsFromManifestForSpecifier:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  id obj;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v6;
  objc_msgSend(v6, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCoreSpotlightIndexer manifestsFromDirectory:](self, "manifestsFromDirectory:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v34)
  {
    v31 = *(_QWORD *)v42;
    *(_QWORD *)&v10 = 138412546;
    v29 = v10;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v12, v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByDeletingPathExtension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v15;
        v36 = v13;
        SearchSpecifiersFromPlist(v13, v33, v15, v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogForCategory(4);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v47 = v12;
          v48 = 2112;
          v49 = v16;
          _os_log_impl(&dword_1A3819000, v17, OS_LOG_TYPE_DEFAULT, "Manifest found: %@\nspecifiers: %@", buf, 0x16u);
        }

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v38 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              if (ShouldIndexSpecifier(v23))
              {
                objc_msgSend(v23, "name");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "length");

                if (v25)
                {
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("searchURL"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v26);

                }
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v20);
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v34);
  }

  v27 = (void *)objc_msgSend(v7, "copy");
  return v27;
}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_280(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[16];

  PKLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v2, OS_LOG_TYPE_DEFAULT, "Deleted 3rd party index", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_281;
  v5[3] = &unk_1E4A65820;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_indexSearchableItems:completionHandler:", v4, v5);

}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_281(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  PKLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "Finished indexing %@ 3rd party specifiers", (uint8_t *)&v5, 0xCu);

  }
}

uint64_t __70__PSCoreSpotlightIndexer_performYukonManifestMigrationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("PSCoreSpolightIndexerHasPerformediOS13Migration"));

  PKLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "Deleted index for index domain migration", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setSkipManifests:(BOOL)a3
{
  self->_skipManifests = a3;
}

- (OS_dispatch_queue)spotlightIndexQueue
{
  return self->_spotlightIndexQueue;
}

- (CSTopHitSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (CSSearchQuery)hasItemsQuery
{
  return self->_hasItemsQuery;
}

- (void)setHasItemsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_hasItemsQuery, a3);
}

- (NSMutableArray)indexFromControllerLog
{
  return self->_indexFromControllerLog;
}

- (void)setIndexFromControllerLog:(id)a3
{
  objc_storeStrong((id *)&self->_indexFromControllerLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexFromControllerLog, 0);
  objc_storeStrong((id *)&self->_hasItemsQuery, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_spotlightIndexQueue, 0);
  objc_storeStrong((id *)&self->_prefsSearchableIndex, 0);
}

void __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1A3819000, v0, v1, "Could not completely delete index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1A3819000, v0, v1, "Could not delete index for domains: %@: %@");
  OUTLINED_FUNCTION_11();
}

void __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1A3819000, v0, v1, "Could not delete index items with identifiers: %@\n Error: %@");
  OUTLINED_FUNCTION_11();
}

- (void)manifestsFromDirectory:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1A3819000, v0, v1, "error reading manifest: %{public}@ for path: %{public}@");
  OUTLINED_FUNCTION_11();
}

- (void)_specifiersForSpecifier:bundle:parentBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1A3819000, v0, v1, "Could not load class %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_specifiersForSpecifier:bundle:parentBundle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1A3819000, v0, v1, "Class isn't a subclass of PSListController: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

@end

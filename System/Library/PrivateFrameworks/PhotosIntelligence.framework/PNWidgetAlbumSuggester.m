@implementation PNWidgetAlbumSuggester

- (PNWidgetAlbumSuggester)initWithAlbumLocalIdentifier:(id)a3 widgetIdentifier:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNWidgetAlbumSuggester *v12;
  PNWidgetAlbumSuggester *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PHAssetCollection *assetCollection;
  PHAssetCollection *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *suggestionContext;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PNWidgetAlbumSuggester;
  v12 = -[PNWidgetAlbumSuggester init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widgetIdentifier, a4);
    objc_storeStrong((id *)&v13->_sourceIdentifier, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
    v15 = (void *)MEMORY[0x24BDE3498];
    -[PNWidgetAlbumSuggester sourceIdentifier](v13, "sourceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchAssetCollectionsWithLocalIdentifiers:options:", v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    assetCollection = v13->_assetCollection;
    v13->_assetCollection = (PHAssetCollection *)v19;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v13->_assetCollection;
      v13->_assetCollection = 0;

    }
    if (v13->_assetCollection)
    {
      v13->_suggestionSubtype = objc_msgSend((id)objc_opt_class(), "widgetSuggestionSubtypeForAssetCollectionType:", -[PHAssetCollection assetCollectionSubtype](v13->_assetCollection, "assetCollectionSubtype"));
      v22 = (void *)MEMORY[0x24BDE3498];
      -[PNWidgetAlbumSuggester sourceIdentifier](v13, "sourceIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uuidFromLocalIdentifier:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      suggestionContext = v13->_suggestionContext;
      v13->_suggestionContext = (NSString *)v24;

    }
  }

  return v13;
}

- (id)updatedSuggestionLocalIdentifiersForDate:(id)a3 numberOfSuggestions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PNWidgetAlbumSuggester assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PLMemoriesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[PNWidgetAlbumSuggester sourceIdentifier](self, "sourceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v17;
      _os_log_impl(&dword_243C3E000, v11, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] album not found: %@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_11;
  }
  if (!-[PNWidgetAlbumSuggester suggestionSubtype](self, "suggestionSubtype"))
  {
    PLMemoriesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)MEMORY[0x24BDE3498];
      -[PNWidgetAlbumSuggester assetCollection](self, "assetCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "descriptionForSubtype:", objc_msgSend(v19, "assetCollectionSubtype"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v20;
      _os_log_impl(&dword_243C3E000, v11, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] album subtype not supported found: %@", (uint8_t *)&v23, 0xCu);

    }
LABEL_11:
    v16 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_16;
  }
  -[PNWidgetAlbumSuggester _assetFetchOptions](self, "_assetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDE3488];
  -[PNWidgetAlbumSuggester assetCollection](self, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAssetsInAssetCollection:options:", v10, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = -[NSObject count](v11, "count");
  PLMemoriesGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PNWidgetAlbumSuggester sourceIdentifier](self, "sourceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v15;
      v25 = 1024;
      v26 = -[NSObject count](v11, "count");
      _os_log_impl(&dword_243C3E000, v14, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] source: %@, eligibleAssets: %d", (uint8_t *)&v23, 0x12u);

    }
    -[PNWidgetAlbumSuggester _makeSuggestionsFromAssets:numberOfSuggestions:date:](self, "_makeSuggestionsFromAssets:numberOfSuggestions:date:", v11, a4, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PNWidgetAlbumSuggester sourceIdentifier](self, "sourceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_243C3E000, v14, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] source: %@, no eligible assets", (uint8_t *)&v23, 0xCu);

    }
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }

LABEL_16:
  return v16;
}

- (id)_mutableAssetIndexesForAssetCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

- (void)_shuffleAssetIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BE72430];
  v5 = a3;
  v6 = [v4 alloc];
  -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithSeed:", objc_msgSend(v7, "hash"));

  PFMutableArrayShuffleWithRandomNumberGenerator();
}

- (id)_assetIndexesForDate:(id)a3 count:(unint64_t)a4 from:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    if (v10 < a4)
      a4 = v10;
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v13 = a4 * (unint64_t)(v12 / 86400.0) % v11;
    PLMemoriesGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = v8;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = v11;
      v27 = 1024;
      v28 = a4;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_243C3E000, v14, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] selected assets for date:%@ offset: %d totalAssets: %d numberToChoose: %d widgetIdentifier: %@", (uint8_t *)&v21, 0x28u);

    }
    if (v13 <= v11 - a4)
    {
      objc_msgSend(v9, "subarrayWithRange:", v13, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v11 - v13;
      objc_msgSend(v9, "subarrayWithRange:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subarrayWithRange:", 0, a4 - v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v19;
}

- (id)_makeSuggestionsFromAssets:(id)a3 numberOfSuggestions:(unint64_t)a4 date:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unsigned __int16 v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  uint64_t v34;
  uint32_t denom;
  uint32_t numer;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  char *v42;
  os_signpost_id_t spid;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *context;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  unsigned __int16 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  double v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  context = (void *)MEMORY[0x249506444]();
  PLMemoriesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  info = 0;
  mach_timebase_info(&info);
  v12 = v10;
  v13 = v12;
  v46 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WidgetMakeSuggestionFromAssets", ", buf, 2u);
  }
  spid = v11;
  v49 = v13;

  v45 = mach_absolute_time();
  v14 = objc_msgSend(v8, "count");
  if (v14 >= a4)
    v15 = a4;
  else
    v15 = v14;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v15);
  -[PNWidgetAlbumSuggester _mutableAssetIndexesForAssetCount:](self, "_mutableAssetIndexesForAssetCount:", objc_msgSend(v8, "count"));
  v16 = objc_claimAutoreleasedReturnValue();
  -[PNWidgetAlbumSuggester _shuffleAssetIndexes:](self, "_shuffleAssetIndexes:", v16);
  v51 = v9;
  v48 = (void *)v16;
  -[PNWidgetAlbumSuggester _assetIndexesForDate:count:from:](self, "_assetIndexesForDate:count:from:", v9, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v60;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v60 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v8, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v23), "integerValue", spid));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v21);
  }

  -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNWidgetAlbumSuggester suggestionContext](self, "suggestionContext");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = -[PNWidgetAlbumSuggester suggestionSubtype](self, "suggestionSubtype");
  -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __78__PNWidgetAlbumSuggester__makeSuggestionsFromAssets_numberOfSuggestions_date___block_invoke;
  v53[3] = &unk_2514800E8;
  v29 = v18;
  v54 = v29;
  v30 = v25;
  v55 = v30;
  v58 = v27;
  v31 = (id)v26;
  v56 = v31;
  v32 = v47;
  v57 = v32;
  v52 = 0;
  LOBYTE(v26) = objc_msgSend(v28, "performChangesAndWait:error:", v53, &v52);
  v33 = COERCE_DOUBLE(v52);

  if ((v26 & 1) != 0)
  {
    v34 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v37 = v49;
    v38 = v49;
    v39 = v38;
    if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_243C3E000, v39, OS_SIGNPOST_INTERVAL_END, spid, "WidgetMakeSuggestionFromAssets", ", buf, 2u);
    }

    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "WidgetMakeSuggestionFromAssets";
      v66 = 2048;
      v67 = (float)((float)((float)((float)(v34 - v45) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_243C3E000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v40 = v32;
  }
  else
  {
    PLMemoriesGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
      v42 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v42;
      v66 = 2112;
      v67 = v33;
      _os_log_impl(&dword_243C3E000, v41, OS_LOG_TYPE_ERROR, "[PNWidgetAlbumSuggester] failed to create suggestions for identifier %@, error: %@", buf, 0x16u);

    }
    v40 = (id)MEMORY[0x24BDBD1A8];
    v37 = v49;
  }

  objc_autoreleasePoolPop(context);
  return v40;
}

- (id)_assetFetchOptions
{
  void *v2;
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
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  objc_msgSend(v3, "setIncludeGuestAssets:", 0);
  objc_msgSend(v3, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x24BE72260], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x24BE72260], "maskForGuestAsset"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d && %K != %d"), CFSTR("playbackStyle"), 4, CFSTR("playbackStyle"), 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K & %d) == 0"), CFSTR("kindSubtype"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD14C0];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v12);

  return v3;
}

- (unint64_t)removeSuggestionsNotRelevantForDate:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  char *v25;
  int v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  uint64_t v38;
  void *v39;
  os_signpost_id_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  double v48;
  _QWORD v49[4];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WidgetRemoveSuggestionsNotRelevantForDate", ", buf, 2u);
  }

  v10 = mach_absolute_time();
  -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setWantsIncrementalChangeDetails:", 0);
  -[PNWidgetAlbumSuggester _predicateForFeaturedSuggestions](self, "_predicateForFeaturedSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("relevantUntilDate < %@"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD14C0];
  v49[0] = v13;
  v49[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v17);

  -[PNWidgetAlbumSuggester fetchSuggestionsWithOptions:](self, "fetchSuggestionsWithOptions:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    v38 = v10;
    v39 = v13;
    v40 = v6;
    -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __62__PNWidgetAlbumSuggester_removeSuggestionsNotRelevantForDate___block_invoke;
    v42[3] = &unk_251480110;
    v20 = v18;
    v43 = v20;
    v41 = 0;
    v21 = objc_msgSend(v19, "performChangesAndWait:error:", v42, &v41);
    v22 = v41;

    PLMemoriesGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "count");
        *(_DWORD *)buf = 138412546;
        v46 = v25;
        v47 = 1024;
        LODWORD(v48) = v26;
        v27 = "[PNWidgetAlbumSuggester] widgetIdentifier: %@, deleted non-relevant %d suggestions";
        v28 = v24;
        v29 = OS_LOG_TYPE_DEFAULT;
        v30 = 18;
LABEL_10:
        _os_log_impl(&dword_243C3E000, v28, v29, v27, buf, v30);

      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v25;
      v47 = 2112;
      v48 = *(double *)&v22;
      v27 = "[PNWidgetAlbumSuggester] failed to remove suggestions for widgetIdentifier %@, error: %@";
      v28 = v24;
      v29 = OS_LOG_TYPE_ERROR;
      v30 = 22;
      goto LABEL_10;
    }

    v13 = v39;
    v6 = v40;
    v10 = v38;
  }
  v31 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v34 = v8;
  v35 = v34;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_243C3E000, v35, OS_SIGNPOST_INTERVAL_END, v6, "WidgetRemoveSuggestionsNotRelevantForDate", ", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "WidgetRemoveSuggestionsNotRelevantForDate";
    v47 = 2048;
    v48 = (float)((float)((float)((float)(v31 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_243C3E000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v36 = objc_msgSend(v18, "count");

  return v36;
}

- (id)_predicateForFeaturedSuggestions
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
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), -[PNWidgetAlbumSuggester suggestionSubtype](self, "suggestionSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("featuredState"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("state"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  -[PNWidgetAlbumSuggester suggestionContext](self, "suggestionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("context"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD14C0];
  v14[0] = v3;
  v14[1] = v4;
  v14[2] = v5;
  v14[3] = v6;
  v14[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchSuggestionsWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *context;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x249506444]();
  v23 = v4;
  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "featuresProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("widgetIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[PNWidgetAlbumSuggester widgetIdentifier](self, "widgetIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v13);

        if (v15)
          objc_msgSend(v24, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v16 = objc_alloc(MEMORY[0x24BDE35B0]);
  -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchPropertySets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v24, v17, v18, v19, 0, 0);

  objc_autoreleasePoolPop(context);
  return v20;
}

- (PHFetchResult)suggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[PNWidgetAlbumSuggester photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  -[PNWidgetAlbumSuggester _predicateForFeaturedSuggestions](self, "_predicateForFeaturedSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  -[PNWidgetAlbumSuggester fetchSuggestionsWithOptions:](self, "fetchSuggestionsWithOptions:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v9;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (unsigned)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

uint64_t __62__PNWidgetAlbumSuggester_removeSuggestionsNotRelevantForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDE36A0], "deleteSuggestions:", *(_QWORD *)(a1 + 32));
}

void __78__PNWidgetAlbumSuggester__makeSuggestionsFromAssets_numberOfSuggestions_date___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[128];
  uint8_t buf[4];
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", 86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLMemoriesGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_243C3E000, v4, OS_LOG_TYPE_DEFAULT, "[PNWidgetAlbumSuggester] creating %d suggestions for widgetIdentifier %@", buf, 0x12u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = 0.0;
    do
    {
      v11 = 0;
      v12 = v2;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
        objc_msgSend(v12, "dateByAddingTimeInterval:", v10);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x24BDE36A0];
        v15 = *(unsigned __int16 *)(a1 + 64);
        v29 = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "creationRequestForSuggestionWithType:subtype:keyAssets:representativeAssets:creationDate:relevantUntilDate:version:", 7, v15, v16, 0, v2, v3, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setFeaturedState:", 1);
        objc_msgSend(v17, "setContext:", *(_QWORD *)(a1 + 48));
        v18 = *(_QWORD *)(a1 + 40);
        v27 = CFSTR("widgetIdentifier");
        v28 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFeaturesProperties:", v19);

        objc_msgSend(v17, "markActive");
        objc_msgSend(v17, "placeholderForCreatedSuggestion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v21);
        v10 = v10 + 1.0;

        ++v11;
        v12 = v2;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v8);
  }

}

+ (unsigned)widgetSuggestionSubtypeForAssetCollectionType:(int64_t)a3
{
  __int16 v3;
  unsigned __int16 v4;

  if (a3 == 203)
    v3 = 702;
  else
    v3 = 0;
  if (a3 == 212)
    v4 = 703;
  else
    v4 = v3;
  if (a3 == 2)
    return 701;
  else
    return v4;
}

@end

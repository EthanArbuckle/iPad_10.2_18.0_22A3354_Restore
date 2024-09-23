@implementation PHAWallpaperShuffleDescriptorGenerator

- (PHAWallpaperShuffleDescriptorGenerator)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PHAWallpaperShuffleDescriptorGenerator *v9;
  PHAWallpaperShuffleDescriptorGenerator *v10;
  uint64_t v11;
  PFPseudoRandomNumberGenerator *randomNumberGenerator;
  void *v13;
  uint64_t v14;
  NSObject *loggingConnection;
  objc_super v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PHAWallpaperShuffleDescriptorGenerator;
  v9 = -[PHAWallpaperShuffleDescriptorGenerator init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    objc_msgSend(MEMORY[0x1E0D77EF8], "randomNumberGeneratorForWallpaperDonation");
    v11 = objc_claimAutoreleasedReturnValue();
    randomNumberGenerator = v10->_randomNumberGenerator;
    v10->_randomNumberGenerator = (PFPseudoRandomNumberGenerator *)v11;

    v10->_shuffleMinimumSuggestionRequired = 25;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerForKey:", CFSTR("PHAWallpaperSuggestionShuffleMinimumSuggestionRequired"));

    if (v14 >= 1)
    {
      loggingConnection = v10->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v19 = v14;
        _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] PHAWallpaperSuggestionShuffleMinimumSuggestionRequired overwrite to %d", buf, 8u);
      }
      v10->_shuffleMinimumSuggestionRequired = v14;
    }
  }

  return v10;
}

- (id)shuffleDescriptorsForDonation
{
  OS_os_log *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint32_t denom;
  uint32_t numer;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *loggingConnection;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  mach_timebase_info info;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = self->_loggingConnection;
  v4 = os_signpost_id_generate((os_log_t)v3);
  info = 0;
  mach_timebase_info(&info);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "WallpaperShuffleDescriptorGeneration", ", buf, 2u);
  }

  v7 = mach_absolute_time();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHAWallpaperShuffleDescriptorGenerator shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:](self, "shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:", 653, 0, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addObject:", v9);
  -[PHAWallpaperShuffleDescriptorGenerator shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:](self, "shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:", 654, 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "addObject:", v10);
  -[PHAWallpaperShuffleDescriptorGenerator peopleShufflePosterDescriptors](self, "peopleShufflePosterDescriptors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:");
  v11 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v14 = v6;
  v15 = v14;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v15, OS_SIGNPOST_INTERVAL_END, v4, "WallpaperShuffleDescriptorGeneration", ", buf, 2u);
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "WallpaperShuffleDescriptorGeneration";
    v34 = 2048;
    v35 = (float)((float)((float)((float)(v11 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v19);
  }

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = (const char *)v16;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Generated shuffle descriptors: %@", buf, 0xCu);
  }

  return v17;
}

- (id)shufflePosterDescriptorForShuffleSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5 requireMinimumShuffleCount:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  NSObject *loggingConnection;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int64_t shuffleMinimumSuggestionRequired;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v6 = a6;
  v8 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  PHSuggestionStringWithSubtype();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = (uint64_t)v12;
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Fetching suggestion with subtype (%@), personLocalIdentifiers %@", buf, 0x16u);
  }
  -[PHAWallpaperShuffleDescriptorGenerator fetchSuggestionWithSubtype:personLocalIdentifiers:](self, "fetchSuggestionWithSubtype:personLocalIdentifiers:", v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 && (unint64_t)objc_msgSend(v14, "count") < self->_shuffleMinimumSuggestionRequired)
  {
    v16 = self->_loggingConnection;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_msgSend(v15, "count");
      shuffleMinimumSuggestionRequired = self->_shuffleMinimumSuggestionRequired;
      *(_DWORD *)buf = 134218754;
      v38 = v18;
      v39 = 2112;
      v40 = v12;
      v41 = 2048;
      v42 = shuffleMinimumSuggestionRequired;
      v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %lu %@ suggestions, required %lu, skipping creating shuffle descriptor for %@", buf, 0x2Au);

    }
    v20 = 0;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CD1390];
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAWallpaperShuffleDescriptorGenerator baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:", objc_msgSend((id)objc_opt_class(), "wallpaperTopSubtypeFromShuffleSubtype:", v8), 0, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CD17D0];
    objc_msgSend(v23, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchAssetCollectionsContainingAssets:withType:options:", v26, 8, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "objectAtIndex:", -[PFPseudoRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", objc_msgSend(v27, "count")));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAWallpaperShuffleDescriptorGenerator descriptorForSuggestion:](self, "descriptorForSuggestion:", v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self->_loggingConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        objc_msgSend(v20, "identifier");
        v36 = v10;
        v31 = v12;
        v32 = v11;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = (uint64_t)v33;
        _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created Shuffle Poster Descriptor: %@", buf, 0xCu);

        v11 = v32;
        v12 = v31;
        v10 = v36;

      }
    }
    else
    {
      v34 = self->_loggingConnection;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] No assets exist in both top & shuffle suggestions. Skipping creating shuffle descriptor", buf, 2u);
      }
      v20 = 0;
    }

  }
  return v20;
}

- (id)peopleShufflePosterDescriptors
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *loggingConnection;
  NSObject *v19;
  uint64_t v20;
  PHAWallpaperShuffleDescriptorGenerator *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHAWallpaperShuffleDescriptorGenerator shuffleVIPPersonLocalIdentifiers](self, "shuffleVIPPersonLocalIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperShuffleDescriptorGenerator allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:](self, "allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:");
  v4 = objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "addObject:", v4, v4);
    objc_msgSend(v5, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v7, "suggestionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  -[PHAWallpaperShuffleDescriptorGenerator shuffleDescriptorEligiblePersonLocalIdentifiers](self, "shuffleDescriptorEligiblePersonLocalIdentifiers", v26);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v30)
  {
    v11 = *(_QWORD *)v32;
    v12 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(*(id *)(v12 + 3680), "setWithObject:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAWallpaperShuffleDescriptorGenerator shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:](self, "shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:", 652, v16, v10, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDisplayNameLocalizationKey:", CFSTR("PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_ONE_PERSON"));
        if (v17)
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
          {
            v19 = loggingConnection;
            objc_msgSend(v17, "identifier");
            v20 = v11;
            v21 = self;
            v22 = v10;
            v23 = v3;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v36 = v24;
            _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created Shuffle Poster Descriptor: %@", buf, 0xCu);

            v3 = v23;
            v10 = v22;
            self = v21;
            v11 = v20;
            v12 = 0x1E0C99000;

          }
          objc_msgSend(v3, "addObject:", v17);
        }

        objc_autoreleasePoolPop(v15);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v30);
  }

  return v3;
}

- (id)allVIPShufflePosterDescriptorFromEligiblePersonLocalIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *loggingConnection;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v4, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", -[PFPseudoRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", objc_msgSend(v7, "count")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAWallpaperShuffleDescriptorGenerator shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:](self, "shufflePosterDescriptorForShuffleSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:requireMinimumShuffleCount:", 652, v9, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "shuffleConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPersonLocalIdentifiers:", v4);

      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D751F8], "descriptorTypeStringWithType:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@|%@"), v12, CFSTR("All-VIP"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", v13);

      objc_msgSend(MEMORY[0x1E0D762B8], "peopleShuffleDescriptorTitleWithCount:", objc_msgSend(v7, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDisplayNameLocalizationKey:", v14);

    }
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Created all-vip shuffle poster descriptor %@", buf, 0xCu);
    }

  }
  else
  {
    v5 = self->_loggingConnection;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Less than 2 eligible VIPs. Skip 'All-VIP' shuffle poster descriptor", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)shuffleVIPPersonLocalIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *loggingConnection;
  NSObject *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v3, "personUUIDsWithNegativeFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10), (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 602, self->_photoLibrary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 652, self->_photoLibrary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v12);
  objc_msgSend(v14, "intersectSet:", v13);
  objc_msgSend(v14, "minusSet:", v5);
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = loggingConnection;
    v17 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218242;
    v24 = v17;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %td shuffle VIP. %@", buf, 0x16u);

  }
  return v14;
}

- (id)shuffleDescriptorEligiblePersonLocalIdentifiers
{
  void *v3;
  NSObject *loggingConnection;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t shuffleMinimumSuggestionRequired;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  _QWORD v37[2];
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 602, self->_photoLibrary);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperShuffleDescriptorGenerator baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:", 652);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAWallpaperShuffleDescriptorGenerator suggestionPersonLocalIdentifiersFromSuggestions:](self, "suggestionPersonLocalIdentifiersFromSuggestions:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37[0] = v3;
    _os_log_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Shuffle people local identifiers with count: %@", buf, 0xCu);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __89__PHAWallpaperShuffleDescriptorGenerator_shuffleDescriptorEligiblePersonLocalIdentifiers__block_invoke;
  v33[3] = &unk_1E85212E8;
  v34 = v3;
  v6 = v5;
  v35 = v6;
  v25 = v34;
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v33);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("count"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
      objc_msgSend(v16, "count");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");
      shuffleMinimumSuggestionRequired = self->_shuffleMinimumSuggestionRequired;

      if (v18 >= shuffleMinimumSuggestionRequired)
      {
        objc_msgSend(v16, "personLocalIdentifer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

      }
      if ((unint64_t)objc_msgSend(v10, "count") > 5)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v13)
          goto LABEL_5;
        break;
      }
    }
  }

  v21 = self->_loggingConnection;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 67109378;
    LODWORD(v37[0]) = v23;
    WORD2(v37[0]) = 2112;
    *(_QWORD *)((char *)v37 + 6) = v10;
    _os_log_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_DEFAULT, "[PHAWallpaperShuffleDescriptorGenerator] Found %d people eligible for shuffle descriptor. %@", buf, 0x12u);

  }
  return v10;
}

- (id)descriptorForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PHAWallpaperShuffleDescriptorGenerator *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *loggingConnection;
  void *v30;
  NSObject *v32;
  void *v33;
  void *v34;
  PHAWallpaperShuffleDescriptorGenerator *v35;
  uint8_t buf[4];
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CD1390];
  v35 = self;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchKeyAssetsInAssetCollection:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "subtype");
  v11 = objc_alloc(MEMORY[0x1E0D75220]);
  v34 = v8;
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v12, v9, v10);

  v14 = objc_alloc(MEMORY[0x1E0D751F8]);
  v39[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 2;
  v17 = (void *)objc_msgSend(v14, "initWithDescriptorType:media:", 2, v15);

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = (void *)MEMORY[0x1E0D751F8];
  v38 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptorIdentifierForDescriptorType:uuids:", 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithSubtype();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@|%@"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIdentifier:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75230]), "initWithShuffleType:", 0);
  objc_msgSend(v17, "setShuffleConfiguration:", v24);
  if ((_DWORD)v10 == 604)
  {
    v16 = 4;
    goto LABEL_6;
  }
  if ((_DWORD)v10 == 603)
  {
LABEL_6:
    objc_msgSend(v24, "setShuffleSmartAlbums:", v16);
    goto LABEL_15;
  }
  v25 = v35;
  if ((_DWORD)v10 == 602)
  {
    objc_msgSend(v24, "setShuffleSmartAlbums:", 1);
LABEL_10:
    objc_msgSend(v4, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPersonLocalIdentifiers:", v28);

    }
    else
    {
      loggingConnection = v25->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] Person Suggestion %@ has nil context.", buf, 0xCu);
      }
    }

    goto LABEL_15;
  }
  v26 = v35->_loggingConnection;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v32 = v26;
    PHSuggestionStringWithSubtype();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v33;
    _os_log_error_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] Unsupported shuffle descriptor type: %@", buf, 0xCu);

    v25 = v35;
  }
  objc_msgSend(v24, "setShuffleSmartAlbums:", 0);
  if ((_DWORD)v10 == 652)
    goto LABEL_10;
LABEL_15:
  objc_msgSend((id)objc_opt_class(), "displayNameLocalizationKeyForTopSubtype:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisplayNameLocalizationKey:", v30);

  return v17;
}

- (id)suggestionPersonLocalIdentifiersFromSuggestions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "context", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4 suggestionUUIDsToAvoid:(id)a5
{
  unsigned int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v6 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v13);

  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithArray:", v17);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("context"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v21);

  return v10;
}

- (id)fetchSuggestionWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  void *v4;
  void *v5;

  -[PHAWallpaperShuffleDescriptorGenerator baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:suggestionUUIDsToAvoid:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __89__PHAWallpaperShuffleDescriptorGenerator_shuffleDescriptorEligiblePersonLocalIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _PHAWallpaperSuggestionCount *v4;
  void *v5;
  _PHAWallpaperSuggestionCount *v6;

  v3 = a2;
  v4 = [_PHAWallpaperSuggestionCount alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PHAWallpaperSuggestionCount initWithPersonLocalIdentifier:count:](v4, "initWithPersonLocalIdentifier:count:", v3, v5);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

+ (unsigned)wallpaperTopSubtypeFromShuffleSubtype:(unsigned __int16)a3
{
  int v3;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFC) == 0x28C)
    return a3 - 50;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] wallpaperTopSubtypeFromShuffleSubtype called with %d. This method should only take in non-top wallpaper subtypes.", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (id)displayNameLocalizationKeyForTopSubtype:(unsigned __int16)a3
{
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a3 - 602) < 3)
    return off_1E8521308[(unsigned __int16)(a3 - 602)];
  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAWallpaperShuffleDescriptorGenerator] wallpaperTopSubtypeFromShuffleSubtype called with %d. This method should only take in non-top wallpaper subtypes.", (uint8_t *)v6, 8u);
  }

  return 0;
}

@end

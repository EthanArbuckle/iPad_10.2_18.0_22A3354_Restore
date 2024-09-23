@implementation PNSuggestionWallpaperShuffleUtilities

+ (id)matchingSuggestionInternalPredicateForPosterConfiguration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "personLocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d AND %K IN %@"), CFSTR("subtype"), 652, CFSTR("suggestionContext"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = objc_msgSend(v3, "shuffleSmartAlbums");
  v8 = v7;
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), 653);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    if ((v8 & 4) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), 654);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  if ((v8 & 8) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), 655);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
LABEL_7:
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  PLWallpaperGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "predicateFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_impl(&dword_243C3E000, v13, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] matchingSuggestionPredicate: %@", buf, 0xCu);

  }
  return v10;
}

+ (id)suggestionLocalIdentifiersByFeatureForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __objc2_class_ro **p_info;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v47;
  void *v48;
  id obj;
  id v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  _BYTE v69[14];
  _QWORD v70[5];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v50 = a4;
  v9 = a5;
  PLWallpaperGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v69 = v8;
    _os_log_impl(&dword_243C3E000, v10, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] fetching suggestions for poster configuration %@", buf, 0xCu);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "matchingSuggestionInternalPredicateForPosterConfiguration:", v8);
  v51 = v9;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v12 = v8;
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v15;
    v70[1] = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v17);

    objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLWallpaperGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v69 = v20;
      *(_WORD *)&v69[4] = 2112;
      *(_QWORD *)&v69[6] = v18;
      _os_log_impl(&dword_243C3E000, v19, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Found %d suggestions: %@", buf, 0x12u);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v62 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if (objc_msgSend(v26, "subtype") == 652)
          {
            objc_msgSend(v26, "context");
          }
          else
          {
            objc_msgSend(v26, "subtype");
            PHSuggestionStringWithSubtype();
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v27);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, v27);
          }
          objc_msgSend(v26, "localIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v29);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v23);
    }

    v8 = v12;
    v9 = v51;
  }
  v52 = v11;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v47 = v8;
  objc_msgSend(v8, "albumCloudIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v58;
    p_info = _TtC18PhotosIntelligence11LLMDefaults.info;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v58 != v32)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(p_info + 258, "shuffleUserAlbumForCloudIdentifier:photoLibrary:", v35, v9);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = (void *)objc_msgSend(objc_alloc((Class)(p_info + 258)), "initWithAssetCollection:photoLibrary:", v36, v9);
          objc_msgSend(v37, "updateSuggestionsForDate:numberOfSuggestions:", v50, 16);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v38 = 0;
        }
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v38, "count"));
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v39, v35);
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v40 = v38;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v54;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v54 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "localIdentifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v45);

            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          }
          while (v42);
        }

        v9 = v51;
        p_info = (__objc2_class_ro **)(_TtC18PhotosIntelligence11LLMDefaults + 32);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v31);
  }

  objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_898);
  return v52;
}

+ (id)chosenSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 atDate:(id)a5 usingStrategy:(unint64_t)a6 withRejectedPersonLocalIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  PLWallpaperGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v21 = 138412290;
    v22 = v12;
    _os_log_impl(&dword_243C3E000, v16, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] choosing suggestions for configuration %@", (uint8_t *)&v21, 0xCu);
  }

  if (a6 == 1)
  {
    objc_msgSend(a1, "allPotentialSuggestionLocalIdentifiersForPosterConfiguration:fromSuggestionLocalIdentifiersByFeature:withRejectedPersonLocalIdentifiers:", v12, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "chosenSuggestionLocalIdentifiersIn:atDate:", v17, v14);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
    {
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(a1, "allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration:fromSuggestionLocalIdentifiersByFeature:withRejectedPersonLocalIdentifiers:", v12, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "chosenSuggestionLocalIdentifiersFromGroups:atDate:", v17, v14);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

LABEL_9:
  return v19;
}

+ (void)enumerateFeaturesOfPosterConfiguration:(id)a3 withRejectedPersonLocalIdentifiers:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = objc_msgSend(v7, "shuffleSmartAlbums");
  v11 = v10;
  if ((v10 & 2) == 0)
  {
    if ((v10 & 4) == 0)
      goto LABEL_3;
LABEL_10:
    PHSuggestionStringWithSubtype();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

    if ((v11 & 8) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PHSuggestionStringWithSubtype();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16);

  if ((v11 & 4) != 0)
    goto LABEL_10;
LABEL_3:
  if ((v11 & 8) != 0)
  {
LABEL_4:
    PHSuggestionStringWithSubtype();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

  }
LABEL_5:
  objc_msgSend(v7, "personLocalIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v11 & 1) != 0 && objc_msgSend(v13, "count"))
  {
    if ((v11 & 0xE) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v14, "isSubsetOfSet:", v8);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v22);
          if ((v15 & 1) != 0
            || (objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22)) & 1) == 0)
          {
            v9[2](v9, v23);
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v20);
    }

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "albumCloudIdentifiers", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        v9[2](v9, *(void **)(*((_QWORD *)&v29 + 1) + 8 * v28++));
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v26);
  }

}

+ (id)allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDBCEB8];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __182__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke;
  v18[3] = &unk_25147FD10;
  v19 = v8;
  v13 = v12;
  v20 = v13;
  v14 = v8;
  objc_msgSend(a1, "enumerateFeaturesOfPosterConfiguration:withRejectedPersonLocalIdentifiers:usingBlock:", v11, v10, v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

+ (id)allPotentialSuggestionLocalIdentifiersForPosterConfiguration:(id)a3 fromSuggestionLocalIdentifiersByFeature:(id)a4 withRejectedPersonLocalIdentifiers:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDBCEB8];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __177__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifiersForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke;
  v21 = &unk_25147FD10;
  v22 = v8;
  v13 = v12;
  v23 = v13;
  v14 = v8;
  objc_msgSend(a1, "enumerateFeaturesOfPosterConfiguration:withRejectedPersonLocalIdentifiers:usingBlock:", v11, v10, &v18);

  objc_msgSend(v13, "sortUsingSelector:", sel_compare_, v18, v19, v20, v21);
  v15 = v23;
  v16 = v13;

  return v16;
}

+ (id)chosenSuggestionLocalIdentifiersIn:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7;
    if (v7 >= 0x10)
      v9 = 16;
    else
      v9 = v7;
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v11 = v9 * (unint64_t)(v10 / 86400.0) % v8;
    if (v11 >= v8 - v9)
    {
      v13 = v8 - v11;
      objc_msgSend(v5, "subarrayWithRange:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subarrayWithRange:", 0, v9 - v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "subarrayWithRange:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_243C3E000, v16, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Chosen suggestion localIdentifiers: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

+ (id)chosenSuggestionLocalIdentifiersFromGroups:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v5);
      v9 += objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "count");
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v8);
  if (v9)
  {
    v12 = objc_msgSend(v5, "count");
    if (v9 >= 0x10)
      v13 = 16;
    else
      v13 = v9;
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v15 = v14;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    if (objc_msgSend(v16, "count") < v13)
    {
      v17 = v13 * (unint64_t)(v15 / 86400.0) % v9;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v17 % v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v17 / v12 % objc_msgSend(v18, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v19);

        ++v17;
      }
      while (objc_msgSend(v16, "count") < v13);
    }
    objc_msgSend(v16, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingSelector:", sel_compare_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_16:
    v21 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v21;
}

+ (id)chosenSuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "suggestionLocalIdentifiersByFeatureForPosterConfiguration:atDate:inPhotoLibrary:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE36A8]), "initWithPhotoLibrary:", v8);
  objc_msgSend(v12, "personUUIDsWithNegativeFeedback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "chosenSuggestionLocalIdentifiersForPosterConfiguration:fromSuggestionLocalIdentifiersByFeature:atDate:usingStrategy:withRejectedPersonLocalIdentifiers:", v10, v11, v9, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("localIdentifier"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)mediaFromSuggestions:(id)a3 assetBySuggestionUUID:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = *MEMORY[0x24BDE3710];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  v20 = v5;
  objc_msgSend(MEMORY[0x24BDE3488], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_alloc(MEMORY[0x24BE72428]);
          objc_msgSend(v15, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v17, v14, objc_msgSend(v13, "subtype"));

          objc_msgSend(v8, "addObject:", v18);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8;
}

+ (void)setFeaturedStateOfSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__PNSuggestionWallpaperShuffleUtilities_setFeaturedStateOfSuggestions___block_invoke;
  v9[3] = &unk_251480110;
  v5 = v3;
  v10 = v5;
  v8 = 0;
  v6 = objc_msgSend(v4, "performChangesAndWait:error:", v9, &v8);
  v7 = v8;
  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to set featuredState for suggestions error:%@", buf, 0xCu);
  }

}

void __71__PNSuggestionWallpaperShuffleUtilities_setFeaturedStateOfSuggestions___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x24BDE36A0], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFeaturedState:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __177__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifiersForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
    PLWallpaperGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109378;
      v6[1] = objc_msgSend(v4, "count");
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_243C3E000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Adding %d suggestions for feature '%@'", (uint8_t *)v6, 0x12u);
    }

  }
}

void __182__PNSuggestionWallpaperShuffleUtilities_allPotentialSuggestionLocalIdentifierGroupsForPosterConfiguration_fromSuggestionLocalIdentifiersByFeature_withRejectedPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    PLWallpaperGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109378;
      v6[1] = objc_msgSend(v4, "count");
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_243C3E000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Adding %d suggestions for feature '%@'", (uint8_t *)v6, 0x12u);
    }

  }
}

void __121__PNSuggestionWallpaperShuffleUtilities_suggestionLocalIdentifiersByFeatureForPosterConfiguration_atDate_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = objc_msgSend(v5, "count");
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_243C3E000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperShuffleUtilities] Found %d suggestions for '%@'", (uint8_t *)v7, 0x12u);
  }

}

@end

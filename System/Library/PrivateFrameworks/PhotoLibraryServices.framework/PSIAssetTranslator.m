@implementation PSIAssetTranslator

+ (id)psiAssetFromAsset:(id)a3 graphData:(id)a4 indexingContext:(id)a5 documentObservation:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PLSearchIndexingLazyFetchHelper *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PLSearchIndexingLazyFetchHelper *v19;
  void *v20;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [PLSearchIndexingLazyFetchHelper alloc];
  objc_msgSend(v12, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "libraryServicesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "wellKnownPhotoLibraryIdentifier");
  objc_msgSend(v12, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PLSearchIndexingLazyFetchHelper initWithObject:libraryIdentifier:managedObjectContext:](v13, "initWithObject:libraryIdentifier:managedObjectContext:", v12, v16, v18);

  objc_msgSend(a1, "psiAssetFromAsset:fetchHelper:propertySets:graphData:indexingContext:documentObservation:", v12, v19, 3, v11, v10, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)psiAssetFromAsset:(id)a3 fetchHelper:(id)a4 propertySets:(unint64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  PSIDate *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  PSIAsset *v29;
  void *v30;
  PSIAsset *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  char v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  PSIAsset *v69;
  os_signpost_id_t spid;
  void *v71;
  NSObject *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v14, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = PLIsValidUUIDString();

  if ((a7 & 1) != 0)
  {
    v75 = v16;
    v20 = v15;
    PLSearchIndexGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_generate(v21);
    v23 = v21;
    v24 = v23;
    spid = v22;
    v73 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PSIAssetTranslator: Asset translation time", ", buf, 2u);
    }
    v72 = v24;

    objc_msgSend(v17, "seasonSynonymsBySeason");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "synonymsByIndexCategoryMask");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sceneTaxonomyProvider");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [PSIDate alloc];
    objc_msgSend(v14, "dateCreated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "calendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PSIDate initWithUniversalDate:calendar:](v25, "initWithUniversalDate:calendar:", v26, v27);

    v29 = [PSIAsset alloc];
    objc_msgSend(v14, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)v28;
    v31 = -[PSIAsset initWithUUID:creationDate:](v29, "initWithUUID:creationDate:", v30, v28);

    -[PSIAsset setPropertySets:](v31, "setPropertySets:", a5);
    v15 = v20;
    v16 = v75;
    if ((a5 & 1) != 0)
    {
      v64 = a5;
      v66 = v18;
      v67 = v17;
      v68 = v15;
      objc_msgSend(a1, "_appendGEODataToAsset:forAsset:", v31, v14);
      objc_msgSend(a1, "_appendFilenameToAsset:forAsset:", v31, v14);
      v65 = a1;
      v69 = v31;
      objc_msgSend(a1, "_appendSavedFromAppToAsset:forAsset:", v31, v14);
      a5 = (unint64_t)v14;
      objc_msgSend(v14, "additionalAttributes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "keywords");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v33, "count"));
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      obj = v33;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v80 != v37)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            PLBackendGetLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend((id)a5, "uuid");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v85 = v41;
              _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "keyword for asset: %@", buf, 0xCu);

            }
            objc_msgSend(v39, "title");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v42);

          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        }
        while (v36);
      }

      a1 = v65;
      v31 = v69;
      objc_msgSend(v65, "_appendKeywords:toAsset:", v34, v69);
      objc_msgSend(v76, "objectForKeyedSubscript:", &unk_1E375E9E8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)a5;
      v15 = v68;
      objc_msgSend(v65, "_appendPersonsAndPetsToAsset:withPersonSynonyms:forAsset:fetchHelper:", v69, v43, a5, v68);

      v17 = v67;
      if (objc_msgSend(v67, "isSharedLibraryEnabled"))
      {
        objc_msgSend(v65, "_appendLibraryScopeToAsset:forAsset:", v69, a5);
        objc_msgSend(v65, "_appendContributorToAsset:forAsset:", v69, a5);
      }
      objc_msgSend(v65, "_appendAssetTextDataToAsset:forAsset:", v69, a5);
      objc_msgSend(v65, "_appendDateCreatedToAsset:indexingContext:withSynonyms:forAsset:", v69, v67, v74, a5);
      objc_msgSend(v65, "_appendMediaTypesToAsset:forAsset:", v69, a5);
      objc_msgSend(v65, "_appendFavoriteToAsset:forAsset:", v69, a5);
      objc_msgSend(v65, "_appendExifDataToAsset:forAsset:", v69, a5);
      objc_msgSend(v65, "_appendSceneClassificationsToAsset:sceneTaxonomyProvider:forAsset:fetchHelper:", v69, v77, a5, v68);
      objc_msgSend(v65, "_appendAudioClassificationToAsset:forAsset:", v69, a5);
      objc_msgSend(v65, "_appendHumanActionsToAsset:forAsset:fetchHelper:", v69, a5, v68);
      objc_msgSend(v65, "_appendUtilityTypesToAsset:forAsset:indexingContext:", v69, a5, v67);
      v16 = v75;
      LOBYTE(a5) = v64;
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v67, "csuTaxonomyObjectStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "locale");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendPrivateEncryptedComputeScenes:forAsset:fetchHelper:csuTaxonomyObjectStore:locale:", v69, v14, v68, v44, v45);

      }
      objc_msgSend(v65, "_appendStickerSuggestionsToAsset:fetchHelper:sceneTaxonomyProvider:forAsset:", v69, v68, v77, v14);
      if (_os_feature_enabled_impl())
      {
        PLSearchBackendModelTranslationGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "uuid");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v85 = v47;
          _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEBUG, "PSI using Graph data from photo library storage for asset: %@", buf, 0xCu);

        }
        objc_msgSend(v65, "_appendGraphDataToAsset:forMomentFromFetchHelper:", v69, v68);
      }
      else if (v75)
      {
        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA00);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendSocialGroupIdentifiers:toAsset:", v50, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA18);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendBusinessNames:toAsset:", v51, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA30);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendBusinessCategories:toAsset:", v52, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendPublicEventStrings:toAsset:forSearchIndexCategory:", v53, v69, 1800);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA60);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendPublicEventStrings:toAsset:forSearchIndexCategory:", v54, v69, 1801);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EA78);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", &unk_1E375EA90);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendPublicEventCategories:withSynonyms:toAsset:", v55, v56, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EAA8);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v69;
        objc_msgSend(v76, "objectForKeyedSubscript:", &unk_1E375EAC0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendMeanings:withSynonyms:toAsset:", v57, v58, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EAD8);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendHolidays:toAsset:", v59, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EAF0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "_appendWorkText:toAsset:", v60, v69);

        objc_msgSend(v75, "objectForKeyedSubscript:", &unk_1E375EB08);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v58) = objc_msgSend(v61, "BOOLValue");

        if ((_DWORD)v58)
          objc_msgSend(v65, "_appendHomeToAsset:", v69);
      }

      v18 = v66;
    }
    if ((a5 & 2) != 0)
      objc_msgSend(a1, "_appendOCRTextForAsset:documentObservation:", v31, v18);
    v62 = v72;
    v48 = v62;
    if (v73 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v48, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Asset translation time", ", buf, 2u);
    }

  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "uuid");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v85 = v49;
      _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Invalid Asset UUID: %{public}@. Not inserting Asset into PSI.", buf, 0xCu);

    }
    v31 = 0;
  }

  return v31;
}

+ (void)_appendGraphDataToAsset:(id)a3 forMomentFromFetchHelper:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PSIAssetTranslator__appendGraphDataToAsset_forMomentFromFetchHelper___block_invoke;
  v7[3] = &unk_1E3669D10;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "enumerateMomentSearchEntitiesWithBlock:", v7);

}

+ (void)_appendAudioClassificationToAsset:(id)a3 forAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_msgSend(a4, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporalSceneClassifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PSIAssetTranslator__appendAudioClassificationToAsset_forAsset___block_invoke;
  v9[3] = &unk_1E3669D38;
  v10 = v5;
  v8 = v5;
  PLSearchEnumerateSearchStringsForAudioClassifications(v7, v9);

}

+ (void)_appendHumanActionsToAsset:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a5, "allDetectedFaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "detectionTraits");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __70__PSIAssetTranslator__appendHumanActionsToAsset_forAsset_fetchHelper___block_invoke;
        v14[3] = &unk_1E3669D60;
        v15 = v6;
        PLSearchEnumerateSearchStringsForDetectionTraits(v13, v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

+ (void)_appendUtilityTypesToAsset:(id)a3 forAsset:(id)a4 indexingContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = a4;
  PLSearchIndexGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PSIAssetTranslator: Utility Types V2", ", buf, 2u);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PSIAssetTranslator__appendUtilityTypesToAsset_forAsset_indexingContext___block_invoke;
  v17[3] = &unk_1E3669D88;
  v18 = v7;
  v14 = v7;
  PLSearchEnumerateSearchStringsForUtilityCollections(v9, v8, v17);

  v15 = v13;
  v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v11, "PSIAssetTranslator: Utility Types V2", ", buf, 2u);
  }

}

+ (void)_appendGEODataToAsset:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "locationInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "placeAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeWithAnnotation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v5;
      v11 = v9;
      objc_msgSend(v10, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        __assert_rtn("PLIndexRevGeoPlace", "PSIAssetTranslator.m", 57, "tokens.count == 0");
      v29 = v9;
      v30 = v7;
      v31 = v5;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __PLIndexRevGeoPlace_block_invoke;
      v36[3] = &unk_1E366CC70;
      v27 = v12;
      v37 = v27;
      v28 = v10;
      v38 = v28;
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v36);
      v14 = &qword_199B9BB18;
      do
      {
        v15 = *v14;
        objc_msgSend(v11, "placeInfosForOrderType", v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v33 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "placeName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, uint64_t))v13)[2](v13, v24, v15);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          }
          while (v21);
        }

        --v14;
      }
      while (v14 >= PLIndexRevGeoPlace_PLRevGeoOrderTypes);
      objc_msgSend(v28, "reverse");

      v7 = v30;
      v5 = v31;
      v9 = v29;
      if (objc_msgSend(v30, "isHome"))
      {
        PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_HOME"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v28;
        if (objc_msgSend(v25, "length"))
          objc_msgSend(v26, "addContentString:category:owningCategory:", v25, 1000, 0);

      }
    }

  }
}

+ (void)_appendDateCreatedToAsset:(id)a3 indexingContext:(id)a4 withSynonyms:(id)a5 forAsset:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a6, "dateCreated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchIndexDateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newLocalizedComponentsFromDate:includeMonth:", v10, 0);
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v14, "addContentString:category:owningCategory:", v13, 1101, 0);

  }
  objc_msgSend(v11, "localizedMonthStringsFromDate:", v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
        v21 = v8;
        v22 = v20;
        if (objc_msgSend(v22, "length"))
          objc_msgSend(v21, "addContentString:category:owningCategory:", v22, 1100, 0);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }
  objc_msgSend(v9, "calendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__PSIAssetTranslator__appendDateCreatedToAsset_indexingContext_withSynonyms_forAsset___block_invoke;
  v26[3] = &unk_1E3669DB0;
  v27 = v8;
  v24 = v8;
  PLSearchSeasonStringsForDate(v10, v23, v26);

}

+ (void)_appendSceneClassificationsToAsset:(id)a3 sceneTaxonomyProvider:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  PLSearchIndexGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PSIAssetTranslator: Scenes", ", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v12, "allSceneClassifications");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v11, "additionalAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "sceneAnalysisVersion");

    objc_msgSend(v10, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 && (_DWORD)v21)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        v29 = v21;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Could not open taxonomy for scene analysis version: %i, unable to index scenes for asset: %@", buf, 0x12u);

      }
      goto LABEL_13;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __100__PSIAssetTranslator__appendSceneClassificationsToAsset_sceneTaxonomyProvider_forAsset_fetchHelper___block_invoke;
    v26[3] = &unk_1E3669DD8;
    v27 = v9;
    objc_msgSend(v22, "enumerateKeywordAndSynonymsForScenes:usingBlock:", v19, v26);

  }
  v25 = v16;
  v23 = v25;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v14, "PSIAssetTranslator: Scenes", ", buf, 2u);
  }
LABEL_13:

}

+ (void)_appendPrivateEncryptedComputeScenes:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5 csuTaxonomyObjectStore:(id)a6 locale:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  signed int v18;
  unint64_t v19;
  void *v20;
  int v21;
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  id v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  _BYTE v64[28];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v44 = a4;
  v11 = a5;
  v12 = a6;
  v49 = a7;
  v43 = v11;
  objc_msgSend(v11, "allSceneClassifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  v14 = 0;
  if (v52)
  {
    v15 = 0x1E0CB3000uLL;
    v51 = *(_QWORD *)v60;
    v45 = v12;
    v48 = v13;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v60 != v51)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "classificationType");
        v19 = v18;
        objc_msgSend(*(id *)(v15 + 2024), "numberWithInteger:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(&unk_1E3763A28, "containsObject:", v20);

        if (v18 == 4 || v21 != 0)
        {
          v23 = objc_msgSend(v17, "sceneIdentifier");
          if (v18 <= 7)
          {
            if (((0xDuLL >> v18) & 1) == 0)
            {
              v24 = word_199B9FE40[v18];
              goto LABEL_14;
            }
            PLSearchBackendSceneTaxonomyGetLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v64 = 0;
              *(_WORD *)&v64[4] = 2048;
              *(_QWORD *)&v64[6] = v19;
              *(_WORD *)&v64[14] = 2048;
              *(_QWORD *)&v64[16] = v23;
              _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Victoria: Unsupported scene classification type (%hd) for Scene (%lu, %llu)", buf, 0x1Cu);
            }
LABEL_53:

            continue;
          }
          v24 = 1;
LABEL_14:
          v58 = v14;
          objc_msgSend(v12, "entityForIdentifier:idType:error:", v23, v24, &v58);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v58;

          if (v25)
            v27 = v26 == 0;
          else
            v27 = 0;
          if (!v27)
          {
            PLSearchBackendSceneTaxonomyGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v64 = v19;
              *(_WORD *)&v64[8] = 2048;
              *(_QWORD *)&v64[10] = v23;
              v29 = v28;
              v30 = OS_LOG_TYPE_ERROR;
              v31 = "Victoria: CSU entity not found in MAD database. Skipping Scene (%lu, %llu)";
              goto LABEL_23;
            }
            goto LABEL_52;
          }
          if (-[NSObject sensitiveLocation](v25, "sensitiveLocation"))
          {
            PLSearchBackendSceneTaxonomyGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v64 = v19;
              *(_WORD *)&v64[8] = 2048;
              *(_QWORD *)&v64[10] = v23;
              v29 = v28;
              v30 = OS_LOG_TYPE_DEBUG;
              v31 = "Victoria: CSU entity not eligible for suggestions. Skipping Scene (%lu, %llu)";
LABEL_23:
              _os_log_impl(&dword_199541000, v29, v30, v31, buf, 0x16u);
            }
LABEL_52:

            v14 = v26;
            goto LABEL_53;
          }
          -[NSObject localizedLabelWithLocale:](v25, "localizedLabelWithLocale:", v49);
          v28 = objc_claimAutoreleasedReturnValue();
          PLSearchSceneLookupIdentifier(v19, v23);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 > 7)
          {
            v33 = 1510;
            if (v28)
              goto LABEL_30;
          }
          else
          {
            v33 = qword_199B9F518[v19];
            if (!v28)
              goto LABEL_48;
LABEL_30:
            if (-[NSObject length](v28, "length"))
            {
              objc_msgSend(v53, "addContentString:identifier:category:owningCategory:", v28, v32, (__int16)v33, 0);
              -[NSObject localizedSynonymsWithLocale:](v25, "localizedSynonymsWithLocale:", v49);
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v34 && -[NSObject count](v34, "count"))
              {
                v50 = v23;
                v46 = v26;
                v47 = v25;
                v56 = 0u;
                v57 = 0u;
                v54 = 0u;
                v55 = 0u;
                v35 = v35;
                v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
                if (v36)
                {
                  v37 = v36;
                  v38 = PLSearchIndexSynonymCategoryForCategory(v33);
                  v39 = *(_QWORD *)v55;
                  do
                  {
                    for (j = 0; j != v37; ++j)
                    {
                      if (*(_QWORD *)v55 != v39)
                        objc_enumerationMutation(v35);
                      v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                      if (v41 && objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "length"))
                      {
                        if ((objc_msgSend(v41, "isEqualToString:", v28) & 1) != 0)
                        {
                          PLSearchBackendSceneTaxonomyGetLog();
                          v42 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412802;
                            *(_QWORD *)v64 = v28;
                            *(_WORD *)&v64[8] = 2048;
                            *(_QWORD *)&v64[10] = v19;
                            *(_WORD *)&v64[18] = 2048;
                            *(_QWORD *)&v64[20] = v50;
                            _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Victoria: Duplicate PrivateEncryptedCompute label: '%@' found in synonyms for Scene (%lu, %llu)", buf, 0x20u);
                          }

                        }
                        else
                        {
                          objc_msgSend(v53, "addSynonym:lookupIdentifier:category:originalContentString:", v41, v32, v38, v28);
                        }
                      }
                    }
                    v37 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
                  }
                  while (v37);
                }

                v12 = v45;
                v26 = v46;
                v15 = 0x1E0CB3000;
                v25 = v47;
              }
              else
              {
                v15 = 0x1E0CB3000;
              }
              goto LABEL_51;
            }
          }
LABEL_48:
          PLSearchBackendSceneTaxonomyGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          v15 = 0x1E0CB3000;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v64 = v19;
            *(_WORD *)&v64[8] = 2048;
            *(_QWORD *)&v64[10] = v23;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Victoria: Failed to get localized text from CSU for Scene (%lu, %llu)", buf, 0x16u);
          }
LABEL_51:

          v13 = v48;
          goto LABEL_52;
        }
      }
      v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v52);
  }

}

+ (void)_appendStickerSuggestionsToAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5 forAsset:(id)a6
{
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  CGSize v22;
  double v23;
  double v24;
  double MidX;
  double MidY;
  double v27;
  _BOOL4 v28;
  float v29;
  float v30;
  unint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  NSObject *v51;
  id v52;
  double v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v65;
  os_signpost_id_t spid;
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGRect rect;
  double v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v69 = a4;
  v68 = a5;
  v9 = a6;
  PLSearchIndexGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  v65 = v11 - 1;
  spid = v11;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PSIAssetTranslator: Stickers", ", buf, 2u);
  }

  if (objc_msgSend(v9, "kind") || objc_msgSend(v9, "kindSubtype") == 10)
    goto LABEL_104;
  objc_msgSend(v9, "mediaAnalysisAttributes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "visualSearchAttributes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v61, "stickerConfidenceAlgorithmVersion") < 1)
    goto LABEL_103;
  objc_msgSend(v9, "stickerConfidenceScore");
  v15 = v14;
  if (PLStickerSuggestionConfidenceThreshold_token != -1)
    dispatch_once(&PLStickerSuggestionConfidenceThreshold_token, &__block_literal_global_55830);
  if (v15 < *(float *)&PLStickerSuggestionConfidenceThreshold_stickerSuggestionConfidenceThreshold)
    goto LABEL_103;
  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v69, "allSceneClassifications");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v60, "count"))
    goto LABEL_102;
  objc_msgSend(v9, "additionalAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sceneAnalysisVersion");

  if (!PLSearchIsAssetSafeForStickers(v60, v19))
    goto LABEL_102;
  objc_msgSend(v68, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v19);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63 && (_DWORD)v19)
  {
    PLSearchBackendStickerSuggestionsGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v67, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v19;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to load scene taxonomy for scene analysis version: %i. Unable to index Sticker Category Suggestions for Asset: %@", buf, 0x12u);

    }
    goto LABEL_101;
  }
  v80 = 0.0;
  v22 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v22;
  if (PLStickerSuggestionDominantSceneAreaMinThreshold_token != -1)
    dispatch_once(&PLStickerSuggestionDominantSceneAreaMinThreshold_token, &__block_literal_global_186);
  v23 = *(double *)&PLStickerSuggestionDominantSceneAreaMinThreshold_threshold;
  if (PLStickerSuggestionDominantSceneAreaMaxThreshold_token != -1)
    dispatch_once(&PLStickerSuggestionDominantSceneAreaMaxThreshold_token, &__block_literal_global_189_55847);
  v24 = *(double *)&PLStickerSuggestionDominantSceneAreaMaxThreshold_threshold;
  if (v63)
  {
    PLSearchDominantSceneWithIdentifierInSceneClassifications(v60, PLSearchDominantSceneAny, v63, &v80, &rect);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = 0;
  }
  MidX = CGRectGetMidX(rect);
  MidY = CGRectGetMidY(rect);
  if (PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_token != -1)
    dispatch_once(&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_token, &__block_literal_global_195_55858);
  v27 = *(float *)&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_stickerSuggestionConfidenceThreshold;
  if (MidX <= *(float *)&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_stickerSuggestionConfidenceThreshold)
  {
    v58 = 0;
  }
  else
  {
    v28 = MidX < 1.0 - v27;
    if (MidY <= v27)
      v28 = 0;
    if (MidY >= 1.0 - v27)
      v28 = 0;
    v58 = v28;
  }
  objc_msgSend(v62, "videoStickerSuggestionScore");
  v30 = v29;
  v31 = objc_msgSend(v62, "mediaAnalysisVersion");
  if (objc_msgSend(v9, "playbackStyle") == 3 && v31 >= 0x31)
  {
    if (PLLiveStickerSuggestionConfidenceThreshold_token != -1)
      dispatch_once(&PLLiveStickerSuggestionConfidenceThreshold_token, &__block_literal_global_183_55836);
    v32 = !v58;
    if (v30 < *(float *)&PLLiveStickerSuggestionConfidenceThreshold_liveStickerSuggestionConfidenceThreshold)
      v32 = 1;
    if ((v32 & 1) == 0 && v80 > v23)
    {
      v77 = 0u;
      v78 = 0u;
      v76 = 0u;
      v75 = 0u;
      v33 = v60;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v76;
LABEL_43:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v76 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v36);
          if (objc_msgSend(v37, "sceneIdentifier") == 2147482079)
          {
            objc_msgSend(v37, "confidence");
            if (v38 >= 0.55)
              break;
          }
          if (v34 == ++v36)
          {
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
            if (v34)
              goto LABEL_43;
            goto LABEL_50;
          }
        }
      }
      else
      {
LABEL_50:

        PLSearchLookupIdentifierForStickerSuggestionType(3);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addIdentifier:category:owningCategory:", v33, 2700, 0);
      }

    }
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v39 = v60;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
  if (!v40)
  {
LABEL_96:

    goto LABEL_97;
  }
  v41 = *(_QWORD *)v72;
LABEL_54:
  v42 = 0;
  while (1)
  {
    if (*(_QWORD *)v72 != v41)
      objc_enumerationMutation(v39);
    v43 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v42);
    v44 = objc_msgSend(v43, "sceneIdentifier");
    if ((unint64_t)(v44 - 15) > 0x6E5)
      goto LABEL_80;
    v45 = qword_199B9BDE8[v44 - 15];
    if (!v45)
      goto LABEL_80;
    if (!objc_msgSend(v63, "nodeRefForExtendedSceneClassId:", v44))
    {
      PLSearchBackendStickerSuggestionsGetLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v44;
        _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_ERROR, "Failed to find taxonomy node for Sticker SceneID: %llu", buf, 0xCu);
      }

      goto LABEL_80;
    }
    if (PFSceneTaxonomyNodeIsIndexed())
    {
      PFSceneTaxonomyNodeSearchThreshold();
      v47 = v46;
      objc_msgSend(v43, "confidence");
      if (v48 >= v47)
        break;
    }
LABEL_80:
    if (v40 == ++v42)
    {
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
      if (v40)
        goto LABEL_54;
      goto LABEL_96;
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v82 = __Block_byref_object_copy__41048;
  v83 = __Block_byref_object_dispose__41049;
  v84 = 0;
  if (v80 > v23)
  {
    v70 = v59;
    PFSceneTaxonomyNodeVisitDetectors();

  }
  if (!v58 || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    if (!v59 && v45 == 6)
      goto LABEL_83;
    goto LABEL_79;
  }
  if ((v80 >= v24 || v45 != 7) && v45 == 7)
  {
LABEL_79:
    _Block_object_dispose(buf, 8);

    goto LABEL_80;
  }
LABEL_83:
  _Block_object_dispose(buf, 8);

  if ((v45 & 0xFFFFFFFFFFFFFFFDLL) != 5)
  {
    v54 = v45;
    if (v45 == 1)
    {
      if ((objc_msgSend(a1, "_containsPersonWithSceneTaxonomyProvider:forAsset:", v68, v9) & 1) != 0)
        goto LABEL_97;
      v54 = 1;
    }
    goto LABEL_91;
  }
  *(_QWORD *)buf = 0;
  v52 = PLSearchDominantSceneWithIdentifierInSceneClassifications(v39, 881, v63, (double *)buf, 0);
  v53 = *(double *)buf;
  if (PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_token != -1)
    dispatch_once(&PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_token, &__block_literal_global_192);
  v54 = v45;
  if (v53 <= *(double *)&PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_threshold)
  {
LABEL_91:
    PLSearchLookupIdentifierForStickerSuggestionType(v54);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "length"))
    {
      objc_msgSend(v67, "addIdentifier:category:owningCategory:", v39, 2700, 0);
    }
    else
    {
      PLSearchBackendStickerSuggestionsGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v45;
        _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "Failed to get search lookup identifier for StickerSuggestionType: %lu", buf, 0xCu);
      }

    }
    goto LABEL_96;
  }
LABEL_97:
  v56 = v13;
  v57 = v56;
  if (v65 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v57, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Stickers", ", buf, 2u);
  }

LABEL_101:
LABEL_102:

LABEL_103:
LABEL_104:

}

+ (BOOL)_containsPersonWithSceneTaxonomyProvider:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  double v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "detectedFaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "detectionType") == 1)
        {
          LOBYTE(v15) = 1;
          goto LABEL_27;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "additionalAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "sceneAnalysisVersion");
  objc_msgSend(v5, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "sceneClassifications", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (objc_msgSend(v18, "sceneIdentifier") == 881)
          {
            if (objc_msgSend(v13, "nodeRefForExtendedSceneClassId:", 881))
            {
              objc_msgSend(v18, "confidence");
              v20 = v19;
              PFSceneTaxonomyNodeSearchThreshold();
              if (v20 > v21)
              {
                LOBYTE(v15) = 1;
                goto LABEL_26;
              }
            }
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v15)
          continue;
        break;
      }
    }
  }
  else
  {
    PLSearchBackendStickerSuggestionsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v33 = v12;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to load scene taxonomy for scene analysis version: %i.", buf, 8u);
    }
    LOBYTE(v15) = 0;
  }
LABEL_26:

LABEL_27:
  return v15;
}

+ (void)_appendSavedFromAppToAsset:(id)a3 forAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = a4;
  objc_msgSend(v5, "importedByBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importedByDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (PLShouldConstructDisplayNameForAppBundle(v6, (uint64_t)v7))
  {
    PLSyndicatedDisplayNameForAppBundle(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = v11;
      v10 = v8;
      if (objc_msgSend(v10, "length"))
        objc_msgSend(v9, "addContentString:category:owningCategory:", v10, 2200, 0);

    }
  }

}

+ (void)_appendKeywords:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = v6;
        v13 = v11;
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v12, "addContentString:category:owningCategory:", v13, 1200, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (void)_appendMediaTypesToAsset:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  int v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "RAWBadgeAttribute") - 1 <= 2)
  {
    PLServicesLocalizedFrameworkString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v8, "addContentString:category:owningCategory:", v7, 1902, 0);

  }
  v9 = objc_msgSend(v6, "kind");
  if (v9 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    if (objc_msgSend(v10, "length"))
    {
      v12 = v15;
      v13 = v10;
      v14 = 1901;
      goto LABEL_11;
    }
  }
  else
  {
    if (v9)
      goto LABEL_13;
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    if (objc_msgSend(v10, "length"))
    {
      v12 = v11;
      v13 = v10;
      v14 = 1900;
LABEL_11:
      objc_msgSend(v12, "addContentString:category:owningCategory:", v13, v14, 0);
    }
  }

LABEL_13:
  v16 = objc_msgSend(v6, "kindSubtype");
  v17 = v16;
  if (v16 > 100)
  {
    if (v16 == 103)
    {
      PLServicesLocalizedFrameworkString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v5;
      if (objc_msgSend(v18, "length"))
      {
        v20 = v26;
        v21 = v18;
        v22 = 1910;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v16 == 102)
    {
      PLServicesLocalizedFrameworkString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v5;
      if (objc_msgSend(v18, "length"))
      {
        v20 = v27;
        v21 = v18;
        v22 = 1909;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v16 != 101)
      goto LABEL_34;
    PLServicesLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    if (!objc_msgSend(v18, "length"))
      goto LABEL_33;
    v20 = v23;
    v21 = v18;
    v22 = 1905;
LABEL_32:
    objc_msgSend(v20, "addContentString:category:owningCategory:", v21, v22, 0);
    goto LABEL_33;
  }
  if (v16 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    if (!objc_msgSend(v18, "length"))
      goto LABEL_33;
    v20 = v24;
    v21 = v18;
    v22 = 1908;
    goto LABEL_32;
  }
  if (v16 != 2)
  {
    if (v16 != 10)
      goto LABEL_34;
    PLServicesLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    if (!objc_msgSend(v18, "length"))
      goto LABEL_33;
    v20 = v19;
    v21 = v18;
    v22 = 1907;
    goto LABEL_32;
  }
  PLServicesLocalizedFrameworkString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  if (objc_msgSend(v18, "length"))
  {
    v20 = v25;
    v21 = v18;
    v22 = 1906;
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  if (objc_msgSend(v6, "playbackVariation") == 3)
  {
    PLServicesLocalizedFrameworkString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v5;
    if (objc_msgSend(v28, "length"))
      objc_msgSend(v29, "addContentString:category:owningCategory:", v28, 1911, 0);

  }
  v30 = objc_msgSend(v6, "playbackStyle");
  if (v30 != 5)
  {
    if (v30 == 3)
    {
      v31 = v5;
      if (objc_msgSend(CFSTR("PLSearchIndexIdentifierLivePhotoPlaybackStyleEnabled"), "length"))
        objc_msgSend(v31, "addIdentifier:category:owningCategory:", CFSTR("PLSearchIndexIdentifierLivePhotoPlaybackStyleEnabled"), 1906, 0);
      goto LABEL_46;
    }
    if (v30 != 2)
      goto LABEL_47;
  }
  PLServicesLocalizedFrameworkString();
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  if (objc_msgSend(v31, "length"))
    objc_msgSend(v32, "addContentString:category:owningCategory:", v31, 1912, 0);

LABEL_46:
LABEL_47:
  if ((objc_msgSend(v6, "avalanchePickType") & 0x10) != 0)
  {
    PLServicesLocalizedFrameworkString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v5;
    if (objc_msgSend(v33, "length"))
      objc_msgSend(v34, "addContentString:category:owningCategory:", v33, 1913, 0);

  }
  v35 = objc_msgSend(v6, "depthType");
  if (v35 == 2)
  {
    PLServicesLocalizedFrameworkString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v5;
    if (objc_msgSend(v38, "length"))
    {
      v40 = v43;
      v41 = v38;
      v42 = 1903;
      goto LABEL_60;
    }
LABEL_61:

    goto LABEL_62;
  }
  if ((unsigned __int16)v35 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v5;
    if (objc_msgSend(v36, "length"))
      objc_msgSend(v37, "addContentString:category:owningCategory:", v36, 1914, 0);

    if (v17 == 2)
    {
      PLServicesLivePortraitLocalizedFrameworkString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      if (objc_msgSend(v38, "length"))
      {
        v40 = v39;
        v41 = v38;
        v42 = 1918;
LABEL_60:
        objc_msgSend(v40, "addContentString:category:owningCategory:", v41, v42, 0);
        goto LABEL_61;
      }
      goto LABEL_61;
    }
  }
LABEL_62:
  if (objc_msgSend(v6, "spatialType"))
  {
    PLServicesLocalizedFrameworkString();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v5;
    if (objc_msgSend(v44, "length"))
      objc_msgSend(v45, "addContentString:category:owningCategory:", v44, 1919, 0);

  }
  if (objc_msgSend(v6, "isMagicCarpet"))
  {
    PLServicesLocalizedFrameworkString();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v5;
    if (objc_msgSend(v46, "length"))
      objc_msgSend(v47, "addContentString:category:owningCategory:", v46, 1904, 0);

  }
  objc_msgSend(v6, "additionalAttributes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "cameraCaptureDevice");

  if (v49 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v5;
    if (objc_msgSend(v50, "length"))
      objc_msgSend(v51, "addContentString:category:owningCategory:", v50, 1915, 0);

    v52 = v51;
    v53 = v50;
    PLSearchLocalizedSynonymsForKey(CFSTR("ALL_SELFIES"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v60 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(v52, "addSynonym:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), 1916, v53);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v56);
    }

  }
}

+ (void)_appendFavoriteToAsset:(id)a3 forAsset:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(a4, "favorite"))
  {
    PLServicesLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v6, "addContentString:category:owningCategory:", v5, 2000, 0);

  }
}

+ (void)_appendPersonsAndPetsToAsset:(id)a3 withPersonSynonyms:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t spid;
  NSObject *v35;
  unint64_t v36;
  void *v37;
  id v39;
  id v40;
  id obj;
  void *v42;
  _QWORD v43[4];
  NSObject *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a4;
  v40 = a6;
  PLSearchIndexGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v36 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PSIAssetTranslator: Persons & Pets", ", buf, 2u);
  }
  v35 = v12;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "mutableCopy");
  v15 = v14;
  v37 = v8;
  spid = v10;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = v16;

  objc_msgSend(v40, "allDetectedFaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v21, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "personUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "shouldIndexForSearch") & 1) != 0)
          {
            objc_msgSend(v42, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(v24, "mutableCopy");
            v26 = v25;
            if (v25)
              v27 = v25;
            else
              v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v28 = v27;

            if ((_os_feature_enabled_impl() & 1) == 0)
            {
              v29 = objc_msgSend(v21, "ageType");
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __91__PSIAssetTranslator__appendPersonsAndPetsToAsset_withPersonSynonyms_forAsset_fetchHelper___block_invoke;
              v43[3] = &unk_1E3669E30;
              v30 = v28;
              v44 = v30;
              PLSearchSearchStringsForPersonAgeType(v29, v43);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v30, v23);

            }
            v31 = objc_msgSend(v22, "detectionType");
            if ((v31 - 3) >= 2)
            {
              if (v31 == 1 && (objc_msgSend(v13, "containsObject:", v23) & 1) == 0)
              {
                objc_msgSend(v13, "addObject:", v23);
                objc_msgSend(a1, "_appendPerson:fetchHelper:toAsset:withPersonSynonyms:", v22, v40, v39, v42);
              }
            }
            else if ((objc_msgSend(v13, "containsObject:", v23) & 1) == 0)
            {
              objc_msgSend(v13, "addObject:", v23);
              objc_msgSend(a1, "_appendPet:fetchHelper:toAsset:", v22, v40, v39);
            }
          }
          else
          {
            PLSearchBackendModelTranslationGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v23;
              _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Person not valid for indexing: %@", buf, 0xCu);
            }
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v18);
    }
  }
  v32 = v35;
  v33 = v32;
  if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Persons & Pets", ", buf, 2u);
  }

}

+ (void)_appendPerson:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5 withPersonSynonyms:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "detectionType") == 1)
  {
    objc_msgSend(v9, "personUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v11;
    v17 = v14;
    v18 = v15;
    if (objc_msgSend(v17, "length") || -[NSObject length](v18, "length"))
      objc_msgSend(v16, "addContentString:identifier:category:owningCategory:", v17, v18, 1300, 0);

    if (_os_feature_enabled_impl())
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke;
      v35[3] = &unk_1E3669E80;
      v36 = v16;
      v37 = v18;
      v38 = v17;
      objc_msgSend(v10, "enumerateSearchEntityRelationsForPerson:block:", v9, v35);

      v19 = v36;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v22)
      {
        v23 = v22;
        v28 = v12;
        v29 = v11;
        v30 = v10;
        v24 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v19);
            v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v27 = v18;
            objc_msgSend(v16, "addSynonym:lookupIdentifier:category:originalContentString:", v26, v27, 1301, v17);

          }
          v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v23);
        v11 = v29;
        v10 = v30;
        v12 = v28;
      }
    }

  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v9, "detectionType");
      objc_msgSend(v9, "personUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v41 = v20;
      v42 = 2112;
      v43 = v21;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unexpected detection type (%hd) for person: %@", buf, 0x12u);

    }
  }

}

+ (void)_appendPet:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "detectionType") == 3
    || objc_msgSend(v7, "detectionType") == 4
    || objc_msgSend(v7, "detectionType") == 2)
  {
    objc_msgSend(v7, "personUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v9;
    v14 = v11;
    v15 = v12;
    if (objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
      objc_msgSend(v13, "addContentString:identifier:category:owningCategory:", v14, v15, 1330, 0);

    PLServicesLocalizedFrameworkString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    objc_msgSend(v13, "addSynonym:lookupIdentifier:category:originalContentString:", v16, v17, 1331, v14);

    PLServicesLocalizedFrameworkString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    objc_msgSend(v13, "addSynonym:lookupIdentifier:category:originalContentString:", v18, v19, 1331, v14);

    if (_os_feature_enabled_impl())
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke;
      v22[3] = &unk_1E3669E80;
      v23 = v13;
      v24 = v19;
      v25 = v14;
      objc_msgSend(v8, "enumerateSearchEntityRelationsForPerson:block:", v7, v22);

    }
  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v7, "detectionType");
      objc_msgSend(v7, "personUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Unexpected detection type (%hd) for pet: %@", buf, 0x12u);

    }
  }

}

+ (void)_appendExifDataToAsset:(id)a3 forAsset:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "formattedCameraModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v8;
    v7 = v5;
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v6, "addContentString:category:owningCategory:", v7, 2300, 0);

  }
}

+ (void)_appendLibraryScopeToAsset:(id)a3 forAsset:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(a4, "hasLibraryScope"))
  {
    PLServicesSharedLibraryLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (objc_msgSend(v5, "length"))
    {
      v7 = v6;
      v8 = v5;
      v9 = 2400;
LABEL_6:
      objc_msgSend(v7, "addContentString:category:owningCategory:", v8, v9, 0);
    }
  }
  else
  {
    PLServicesSharedLibraryLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (objc_msgSend(v5, "length"))
    {
      v7 = v10;
      v8 = v5;
      v9 = 2401;
      goto LABEL_6;
    }
  }

}

+ (void)_appendContributorToAsset:(id)a3 forAsset:(id)a4
{
  uint64_t v5;
  uint64_t i;
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
  id v20;
  id v21;
  id obj;
  uint64_t v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = a4;
  objc_msgSend(v21, "libraryScopeContributors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v5)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(a1, "_nameForContributor:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emailAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "phoneNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_new();
        if (objc_msgSend(v7, "isCurrentUser"))
        {
          PLServicesSharedLibraryLocalizedFrameworkString();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);
          PLServicesSharedLibraryLocalizedFrameworkString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v13);

        }
        PLServicesSharedLibraryLocalizedFrameworkString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          PFStringWithValidatedFormat();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v15, v8);

        }
        if (objc_msgSend(v9, "length"))
        {
          PFStringWithValidatedFormat();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v16, v9);

        }
        if (objc_msgSend(v10, "length"))
        {
          PFStringWithValidatedFormat();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17, v10);

        }
        objc_msgSend(v7, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("contributor"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__41048;
        v30[4] = __Block_byref_object_dispose__41049;
        v31 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __57__PSIAssetTranslator__appendContributorToAsset_forAsset___block_invoke;
        v26[3] = &unk_1E366C950;
        v27 = v25;
        v20 = v19;
        v28 = v20;
        v29 = v30;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);

        _Block_object_dispose(v30, 8);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

}

+ (id)_nameForContributor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Search Index: No name for contributor: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

+ (void)_appendAssetTextDataToAsset:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "additionalAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v9, "addContentString:category:owningCategory:", v8, 1201, 0);

  objc_msgSend(v6, "longDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v11, "addContentString:category:owningCategory:", v10, 1202, 0);

}

+ (void)_appendOCRTextForAsset:(id)a3 documentObservation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  NSObject *v31;
  unint64_t v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[16];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    PLSearchIndexGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);
    v9 = v7;
    v10 = v9;
    v32 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PSIAssetTranslator: OCR", ", buf, 2u);
    }
    spid = v8;
    v31 = v10;

    v33 = v6;
    +[PLSearchOCRUtilities ocrTextLinesFromDocumentObservation:](PLSearchOCRUtilities, "ocrTextLinesFromDocumentObservation:", v6);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v48;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v48 != v35)
            objc_enumerationMutation(obj);
          v37 = v11;
          v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v12, "candidates");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v44;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v44 != v15)
                  objc_enumerationMutation(v38);
                v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                v42 = 0u;
                objc_msgSend(v17, "words");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v40;
                  do
                  {
                    v22 = 0;
                    do
                    {
                      if (*(_QWORD *)v40 != v21)
                        objc_enumerationMutation(v18);
                      v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v22);
                      v24 = v5;
                      v25 = v23;
                      if (objc_msgSend(v25, "length"))
                        objc_msgSend(v24, "addContentString:category:owningCategory:", v25, 1203, 0);

                      ++v22;
                    }
                    while (v20 != v22);
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
                  }
                  while (v20);
                }

                ++v16;
              }
              while (v16 != v14);
              v14 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            }
            while (v14);
          }

          v11 = v37 + 1;
        }
        while (v37 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v36);
    }
    v6 = v33;
    if (objc_msgSend(obj, "count"))
    {
      PLServicesLocalizedFrameworkString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v5;
      if (objc_msgSend(v26, "length"))
        objc_msgSend(v27, "addContentString:category:owningCategory:", v26, 1205, 0);

    }
    v28 = v31;
    v29 = v28;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: OCR", ", buf, 2u);
    }

  }
}

+ (void)_appendSocialGroupIdentifiers:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        PLSearchSocialGroupLookupIdentifier(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v6;
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v12, "addIdentifier:category:owningCategory:", v11, 1310, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

+ (void)_appendBusinessNames:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = v6;
        v13 = v11;
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v12, "addContentString:category:owningCategory:", v13, 1700, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (void)_appendBusinessCategories:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = v6;
        v13 = v11;
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v12, "addContentString:category:owningCategory:", v13, 1701, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (void)_appendPublicEventCategories:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  v8 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        v14 = v8;
        v15 = v13;
        if (objc_msgSend(v15, "length"))
          objc_msgSend(v14, "addContentString:category:owningCategory:", v15, 1802, 0);

        objc_msgSend(v22, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v14, "addSynonym:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), 1803, v15);
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v18);
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

}

+ (void)_appendPublicEventStrings:(id)a3 toAsset:(id)a4 forSearchIndexCategory:(unint64_t)a5
{
  __int16 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = v5;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = v8;
        v16 = v14;
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v15, "addContentString:category:owningCategory:", v16, v12, 0);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

+ (void)_appendMeanings:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  v8 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        v14 = v8;
        v15 = v13;
        if (objc_msgSend(v15, "length"))
          objc_msgSend(v14, "addContentString:category:owningCategory:", v15, 1600, 0);

        objc_msgSend(v22, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v14, "addSynonym:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), 1601, v15);
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v18);
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

}

+ (void)_appendHolidays:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = v6;
        v13 = v11;
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v12, "addContentString:category:owningCategory:", v13, 1103, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (void)_appendHomeToAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_HOME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v5, "addContentString:category:owningCategory:", v4, 1000, 0);

}

+ (void)_appendWorkText:(id)a3 toAsset:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v6 = v5;
    v7 = v8;
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v6, "addContentString:category:owningCategory:", v7, 1001, 0);

  }
}

void __57__PSIAssetTranslator__appendContributorToAsset_forAsset___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a2;
  v7 = (void *)a1[4];
  v8 = a1[5];
  v9 = v6;
  if (a3)
  {
    objc_msgSend(v7, "addSynonym:lookupIdentifier:category:originalContentString:", v6, v8, 1321, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  }
  else
  {
    objc_msgSend(v7, "addContentString:identifier:category:owningCategory:", v6, v8, 1320, 0);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke_2;
  v4[3] = &unk_1E3669E58;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  PLSearchStringsForPersonRelation(a2, v4);

}

void __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v7, "addSynonym:lookupIdentifier:category:originalContentString:", v5, v8, 1331, *(_QWORD *)(a1 + 48));

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = *(void **)(a1 + 32);
        v16 = *(id *)(a1 + 40);
        objc_msgSend(v15, "addSynonym:lookupIdentifier:category:originalContentString:", v14, v16, 1331, *(_QWORD *)(a1 + 48), (_QWORD)v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

void __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke_2;
  v4[3] = &unk_1E3669E58;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  PLSearchStringsForPersonRelation(a2, v4);

}

void __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v7, "addSynonym:lookupIdentifier:category:originalContentString:", v5, v8, 1301, *(_QWORD *)(a1 + 48));

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = *(void **)(a1 + 32);
        v16 = *(id *)(a1 + 40);
        objc_msgSend(v15, "addSynonym:lookupIdentifier:category:originalContentString:", v14, v16, 1301, *(_QWORD *)(a1 + 48), (_QWORD)v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

void __91__PSIAssetTranslator__appendPersonsAndPetsToAsset_withPersonSynonyms_forAsset_fetchHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
}

BOOL __98__PSIAssetTranslator__appendStickerSuggestionsToAsset_fetchHelper_sceneTaxonomyProvider_forAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = objc_msgSend(*(id *)(a1 + 32), "sceneIdentifier");
  if (v4 == v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  return v4 == v5;
}

void __100__PSIAssetTranslator__appendSceneClassificationsToAsset_sceneTaxonomyProvider_forAsset_fetchHelper___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%llu"), CFSTR("scene"), a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", v8, v10, 1500, 0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      v15 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqualToString:", v8) & 1) != 0)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v24 = v8;
              v25 = 2048;
              v26 = a5;
              _os_log_error_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Search Indexing: duplicate scene keyword: '%@' found in scene synonyms array for scene ID: %llu", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "addSynonym:lookupIdentifier:category:originalContentString:", v17, v10, 1501, v8);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v13);
    }

    v9 = v18;
  }

}

void __86__PSIAssetTranslator__appendDateCreatedToAsset_indexingContext_withSynonyms_forAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("season"), a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", v7, v9, 1104, 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "addSynonym:lookupIdentifier:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v9, 1105, v7);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

uint64_t __74__PSIAssetTranslator__appendUtilityTypesToAsset_forAsset_indexingContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", a3, a4, 2800, 0);
}

void __70__PSIAssetTranslator__appendHumanActionsToAsset_forAsset_fetchHelper___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a2, "value");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%u"), CFSTR("humanAction"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", v7, v10, 2600, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 32), "addSynonym:lookupIdentifier:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v10, 2601, v7);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

void __65__PSIAssetTranslator__appendAudioClassificationToAsset_forAsset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(a2, "sceneIdentifier");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%llu"), CFSTR("audio"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", v7, v10, 2500, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 32), "addSynonym:lookupIdentifier:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v10, 2501, v7);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

void __71__PSIAssetTranslator__appendGraphDataToAsset_forMomentFromFetchHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "type");
  v6 = v5;
  if (v5 > 1699)
  {
    if (v5 == 1802)
      v8 = 1802;
    else
      v8 = 0;
    if (v5 == 1801)
      v8 = 1801;
    if (v5 == 1800)
      v8 = 1800;
    if (v5 == 1701)
      v9 = 1701;
    else
      v9 = 0;
    if (v5 == 1700)
      v9 = 1700;
    v7 = 0;
    if (v5 <= 1799)
      v6 = v9;
    else
      v6 = v8;
  }
  else if (v5 <= 1101)
  {
    if (v5 == 1000 || v5 == 1001)
    {
      v7 = 0;
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
  }
  else if (v5 == 1102)
  {
    v7 = 0;
    v6 = 1103;
  }
  else if (v5 == 1600)
  {
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("meaning"), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1600;
  }
  else
  {
    v7 = 0;
    if (v5 != 1610)
      v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "addContentString:identifier:category:owningCategory:", v4, v7, (__int16)v6, 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "synonyms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = PLSearchIndexSynonymCategoryForCategory(v6);
    v16 = *(_QWORD *)v20;
    v17 = v15;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "addSynonym:lookupIdentifier:category:originalContentString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v7, v17, v4);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

@end

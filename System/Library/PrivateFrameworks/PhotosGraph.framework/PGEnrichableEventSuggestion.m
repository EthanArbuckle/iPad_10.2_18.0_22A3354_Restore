@implementation PGEnrichableEventSuggestion

- (PGEnrichableEventSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 enrichableEvent:(id)a5 sharingSuggestionResults:(id)a6 photoLibrary:(id)a7 curationManager:(id)a8 curationContext:(id)a9 loggingConnection:(id)a10 titleGenerationContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  PGEnrichableEventSuggestion *v23;
  PGEnrichableEventSuggestion *v24;
  uint64_t v25;
  NSDate *universalStartDate;
  uint64_t v27;
  NSDate *universalEndDate;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PGEnrichableEventSuggestion *v36;
  NSArray *representativeAssets;
  uint64_t v38;
  uint64_t v39;
  NSArray *keyAssets;
  PGCollectionTitleGenerator *v41;
  void *v42;
  PGCollectionTitleGenerator *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSString *title;
  void *v49;
  uint64_t v50;
  NSString *subtitle;
  uint64_t v52;
  NSSet *features;
  void *v54;
  void *v55;
  uint64_t v56;
  NSArray *suggestedPersonLocalIdentifiers;
  PGCollectionTitleGenerator *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  objc_super v69;
  uint64_t v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v17 = a5;
  v68 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v69.receiver = self;
  v69.super_class = (Class)PGEnrichableEventSuggestion;
  v23 = -[PGEnrichableEventSuggestion init](&v69, sel_init);
  v24 = v23;
  if (!v23)
  {
LABEL_22:
    v36 = v24;
    goto LABEL_23;
  }
  v67 = v20;
  v23->_type = a3;
  v23->_subtype = a4;
  objc_msgSend(v17, "universalStartDate");
  v25 = objc_claimAutoreleasedReturnValue();
  universalStartDate = v24->_universalStartDate;
  v24->_universalStartDate = (NSDate *)v25;

  objc_msgSend(v17, "universalEndDate");
  v27 = objc_claimAutoreleasedReturnValue();
  universalEndDate = v24->_universalEndDate;
  v24->_universalEndDate = (NSDate *)v27;

  objc_msgSend(v17, "fetchAssetCollectionInPhotoLibrary:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichableEventSuggestion assetCollectionToShareForAssetCollection:loggingConnection:](v24, "assetCollectionToShareForAssetCollection:loggingConnection:", v29, v21);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setIncludeGuestAssets:", 0);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("additionalAttributes.syndicationIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setInternalPredicate:", v33);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v34, "count") <= 0x100)
      objc_msgSend(v34, "fetchedObjects");
    else
      +[PGCurationManager representativeAssetsForAssetCollection:curationContext:progressBlock:](PGCurationManager, "representativeAssetsForAssetCollection:curationContext:progressBlock:", v31, v67, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    representativeAssets = v24->_representativeAssets;
    v24->_representativeAssets = (NSArray *)v35;

    v66 = -[NSArray count](v24->_representativeAssets, "count");
    if (v66)
    {
      objc_msgSend(v19, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v31, 0, 0, 0, v67);
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        -[NSArray firstObject](v24->_representativeAssets, "firstObject");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v17;
          v73 = 2112;
          v74 = v64;
          _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "No key asset found for creating suggestions with enrichableEvent %@. Taking the first representative asset %@.", buf, 0x16u);
        }
        v38 = v64;
      }
      v60 = v34;
      v61 = v29;
      v65 = (void *)v38;
      v70 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v39 = objc_claimAutoreleasedReturnValue();
      keyAssets = v24->_keyAssets;
      v24->_keyAssets = (NSArray *)v39;

      v41 = [PGCollectionTitleGenerator alloc];
      -[PGEnrichableEventSuggestion _whitelistedMeaningLabels](v24, "_whitelistedMeaningLabels");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[PGCollectionTitleGenerator initWithCollection:whitelistedMeaningLabels:titleGenerationContext:](v41, "initWithCollection:whitelistedMeaningLabels:titleGenerationContext:", v17, v42, v22);

      v59 = v43;
      -[PGCollectionTitleGenerator titleTuple](v43, "titleTuple");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      v62 = v22;
      v63 = v19;
      if (v44)
      {
        objc_msgSend(v44, "title");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringValue");
        v47 = objc_claimAutoreleasedReturnValue();
        title = v24->_title;
        v24->_title = (NSString *)v47;

        objc_msgSend(v45, "subtitle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringValue");
        v50 = objc_claimAutoreleasedReturnValue();
        subtitle = v24->_subtitle;
        v24->_subtitle = (NSString *)v50;

      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v17;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Failed to generate title/subtitle for %@.", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v52 = objc_claimAutoreleasedReturnValue();
      features = v24->_features;
      v24->_features = (NSSet *)v52;

      buf[0] = 0;
      objc_msgSend(v17, "eventEnrichmentMomentNodes");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "array");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGAbstractSuggester suggestedPersonLocalIdentifiersFromSharingSuggestionResults:forMomentNodes:containsUnverifiedPersons:](PGAbstractSuggester, "suggestedPersonLocalIdentifiersFromSharingSuggestionResults:forMomentNodes:containsUnverifiedPersons:", v68, v55, buf);
      v56 = objc_claimAutoreleasedReturnValue();

      suggestedPersonLocalIdentifiers = v24->_suggestedPersonLocalIdentifiers;
      v24->_suggestedPersonLocalIdentifiers = (NSArray *)v56;

      v24->_containsUnverifiedPersons = buf[0];
      v22 = v62;
      v19 = v63;
      v34 = v60;
      v29 = v61;
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v17;
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "No representative assets for creating suggestions with enrichableEvent %@", buf, 0xCu);
    }

    v20 = v67;
    if (!v66)
    {
      v36 = 0;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = v17;
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_DEFAULT, "No shareable assets found in %@", buf, 0xCu);
  }

  v36 = 0;
LABEL_23:

  return v36;
}

- (id)assetCollectionToShareForAssetCollection:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  double v24;
  const char *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  _QWORD v35[2];
  _QWORD v36[5];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(additionalAttributes.importedBy != %d) && kindSubtype != %d && kindSubtype != %d"), 7, 10, 103);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3528];
  v35[0] = v13;
  v35[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      v22 = *MEMORY[0x1E0D77DF0];
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "curationScore");
          if (v24 > v22)
          {

            objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v18, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v20)
          continue;
        break;
      }
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      v25 = "Asset collection %@ only contains junk assets.";
LABEL_15:
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v5;
    v25 = "Asset collection %@ only contains received assets from moment share(s).";
    goto LABEL_15;
  }
  v26 = 0;
LABEL_17:

  return v26;
}

- (id)_whitelistedMeaningLabels
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Performance"), CFSTR("Concert"), CFSTR("Birthday"), CFSTR("Restaurant"), CFSTR("Breakfast"), CFSTR("Lunch"), CFSTR("Dinner"), 0);
}

- (int64_t)version
{
  return 3;
}

- (NSDate)creationDate
{
  return 0;
}

- (unsigned)state
{
  return 0;
}

- (id)recipe
{
  return 0;
}

- (unint64_t)relevanceDurationInDays
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGEnrichableEventSuggestion;
  -[PGEnrichableEventSuggestion description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithSubtype();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichableEventSuggestion keyAssets](self, "keyAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichableEventSuggestion representativeAssets](self, "representativeAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": type=%@, subtype=%@, keyAssets=%@, representativeAssets=%lu, features=%@"), v4, v5, v6, objc_msgSend(v7, "count"), self->_features);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(unsigned __int16)a3
{
  self->_notificationState = a3;
}

- (NSSet)features
{
  return self->_features;
}

- (NSArray)suggestedPersonLocalIdentifiers
{
  return self->_suggestedPersonLocalIdentifiers;
}

- (BOOL)containsUnverifiedPersons
{
  return self->_containsUnverifiedPersons;
}

- (unsigned)notificationQuality
{
  return self->_notificationQuality;
}

- (void)setNotificationQuality:(unsigned __int8)a3
{
  self->_notificationQuality = a3;
}

- (NSArray)keyAssets
{
  return self->_keyAssets;
}

- (NSArray)representativeAssets
{
  return self->_representativeAssets;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_representativeAssets, 0);
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_suggestedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end

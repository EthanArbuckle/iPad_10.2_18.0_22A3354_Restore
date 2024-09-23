@implementation PXCMMPhotoKitContext

- (PXCMMPhotoKitContext)initWithAssets:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  PXCMMPhotoKitContext *v12;
  void *v14;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets"));

  }
  objc_msgSend(MEMORY[0x1E0CD1390], "px_orderedAssetsFromAssets:sortDescriptors:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXCMMPhotoKitContext initWithAssetCollection:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithAssetCollection:activityType:sourceType:optionalPeopleFetchResult:", v11, a4, a5, 0);

  return v12;
}

- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  return -[PXCMMPhotoKitContext initWithAssetCollection:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithAssetCollection:activityType:sourceType:optionalPeopleFetchResult:", a3, a4, a5, 0);
}

- (PXCMMPhotoKitContext)initWithAssetCollection:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  id v11;
  id v12;
  PXCMMPhotoKitContext *v13;
  PXCMMPhotoKitContext *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  if (objc_msgSend(v11, "assetCollectionType") == 7)
  {
    v13 = -[PXCMMPhotoKitContext initWithMomentShare:activityType:sourceType:](self, "initWithMomentShare:activityType:sourceType:", v11, a4, a5);
  }
  else
  {
    if (objc_msgSend(v11, "assetCollectionType") != 8)
    {
      v15 = objc_alloc(MEMORY[0x1E0CD1620]);
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, v17, *MEMORY[0x1E0CD1B98], 0, 0, 0);

      v14 = -[PXCMMPhotoKitContext initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:", v18, a4, a5, v12);
      goto LABEL_9;
    }
    v13 = -[PXCMMPhotoKitContext initWithSuggestion:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithSuggestion:activityType:sourceType:optionalPeopleFetchResult:", v11, a4, a5, v12);
  }
  v14 = v13;
LABEL_9:

  return v14;
}

- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  return -[PXCMMPhotoKitContext initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:", a3, a4, a5, 0);
}

- (PXCMMPhotoKitContext)initWithFetchResult:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  PXRecipient *v31;
  PXRecipient *v32;
  void *v33;
  _BOOL4 v34;
  PXPhotosDataSourceConfiguration *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
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
  id *v60;
  id *v61;
  id v62;
  id v63;
  PXCMMPhotoKitContext *v64;
  PXCMMPhotoKitContext *v65;
  void *v66;
  void *v67;
  void *v68;
  PXCMMPhotoKitContext *v69;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v81;
  void *v82;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v83;
  void *v84;
  PXPhotoKitAssetsDataSourceManager *v85;
  void *v87;
  void *v88;
  PXPhotoKitUIMediaProvider *v89;
  PXPhotosDataSource *v90;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t);
  void *v104;
  id v105;
  __int128 *p_buf;
  void *v107;
  void *v108;
  _QWORD v109[2];
  uint64_t v110;
  uint64_t v111;
  uint8_t v112[128];
  __int128 buf;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  void *v118;
  _QWORD v119[4];

  v119[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v81 = a6;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

    v8 = 0;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v74 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult.count == 1"));

    v8 = v74;
  }
  v9 = v8;
  objc_msgSend(v8, "photoLibrary");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fetchResult.firstObject isKindOfClass:[PHMoment class]]"));

    }
    PXMap();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moment.uuid IN %@"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInternalPredicate:", v15);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortDescriptors:", v17);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v9, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transientAssetCollectionWithAssetFetchResult:title:", v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc(MEMORY[0x1E0CD1620]);
    v118 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v23, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v24, v92, *MEMORY[0x1E0CD1B98], 0, 0, 0);

  }
  v88 = v10;
  objc_msgSend(v10, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "assetCollectionSubtype") == 101)
  {
    if (a4 == 2)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v114 = 0x3032000000;
      v115 = __Block_byref_object_copy__115547;
      v116 = __Block_byref_object_dispose__115548;
      v117 = 0;
      v101 = MEMORY[0x1E0C809B0];
      v102 = 3221225472;
      v103 = __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_151;
      v104 = &unk_1E5148AA8;
      v105 = v25;
      p_buf = &buf;
      px_dispatch_on_main_queue_sync();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v27 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v98 != v29)
              objc_enumerationMutation(v27);
            v31 = -[PXRecipient initWithEmailAddress:phoneNumber:nameComponents:]([PXRecipient alloc], "initWithEmailAddress:phoneNumber:nameComponents:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i), 0, 0);
            v32 = v31;
            if (v31)
            {
              -[PXRecipient invalidAddressString](v31, "invalidAddressString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (v34)
                objc_msgSend(v26, "addObject:", v32);
            }

          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
        }
        while (v28);
      }

      -[PXCMMContext setRecipients:](self, "setRecipients:", v26);
      v111 = *MEMORY[0x1E0CD1988];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&buf, 8);
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if (a4 == 2)
  {
    v110 = *MEMORY[0x1E0CD1988];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (a4 != 1 || a5)
  {
LABEL_25:
    v87 = 0;
LABEL_27:
    v82 = 0;
    v83 = 0;
    goto LABEL_28;
  }
  if (v81)
    v83 = -[PXPhotoKitPeopleSuggestionsDataSourceManager initWithPeopleFetchResult:]([PXPhotoKitPeopleSuggestionsDataSourceManager alloc], "initWithPeopleFetchResult:", v81);
  else
    v83 = 0;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "peopleSuggestionsDataSourceType");

  if (v72 == 1)
  {
    +[PXPhotoKitPeopleSuggestionsDataSourceManager photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:](PXPhotoKitPeopleSuggestionsDataSourceManager, "photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:", v25);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v72)
    {
      v87 = 0;
      v82 = 0;
      goto LABEL_28;
    }
    +[PXPhotoKitPeopleSuggestionsDataSourceManager mockDataSourceManagerFromPeopleInPhotosInAssetCollection:](PXPhotoKitPeopleSuggestionsDataSourceManager, "mockDataSourceManagerFromPeopleInPhotosInAssetCollection:", v25);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87 = 0;
LABEL_28:
  v35 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v10, 0);
  -[PXPhotosDataSourceConfiguration setPhotoLibrary:](v35, "setPhotoLibrary:", v92);
  -[PXPhotosDataSourceConfiguration setFilterPredicate:](v35, "setFilterPredicate:", 0);
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v35, "setFetchPropertySets:", v87);
  -[PXPhotosDataSourceConfiguration setCurationType:](v35, "setCurationType:", 0);
  v90 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v35);
  -[PXPhotosDataSource startBackgroundFetchIfNeeded](v90, "startBackgroundFetchIfNeeded");
  v85 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v90);
  v89 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  objc_msgSend(v92, "librarySpecificFetchOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v37;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSortDescriptors:", v39);

  objc_msgSend(v36, "setInternalPredicate:", 0);
  if (objc_msgSend(v25, "assetCollectionType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v25, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v41, v36);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v43 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v25, "assetCollectionType") == 8)
    {
      objc_msgSend(MEMORY[0x1E0CD17D0], "px_keyAssetFilteringPredicate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setInternalPredicate:", v44);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v25, v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v25, "assetCollectionType") == 3)
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v25, v36);
      else
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v25, v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v43 = v45;
  }

  if (v43)
    goto LABEL_41;
  PLSharingGetLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v25;
    _os_log_impl(&dword_1A6789000, v46, OS_LOG_TYPE_ERROR, "No key asset found for %@\n Falling back to any asset.", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v25, v36);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstObject");
  v43 = objc_claimAutoreleasedReturnValue();

  if (v43)
  {
LABEL_41:
    objc_msgSend(v25, "startDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v25, "estimatedPhotosCount");
    v78 = objc_msgSend(v25, "estimatedVideosCount");
    v77 = objc_msgSend(v25, "estimatedAssetCount");
    objc_msgSend(v25, "localizedTitle");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      objc_msgSend(v92, "librarySpecificFetchOptions");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setSortDescriptors:", v52);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v25, v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "creationDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v49)
    {
      objc_msgSend(v92, "librarySpecificFetchOptions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setSortDescriptors:", v57);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v25, v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v59, "creationDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v25, "assetCollectionType") == 8)
    {
      v95 = 0;
      v96 = 0;
      PXCMMTitleAndSubtitleForAssetCollection(v25, &v96, &v95);
      v60 = (id *)&v95;
      v61 = (id *)&v96;
    }
    else
    {
      v93 = 0;
      v94 = 0;
      PLCMMTitleAndSubtitleForTitleAndFallbackDates();
      v60 = (id *)&v93;
      v61 = (id *)&v94;
    }
    v62 = *v61;
    v63 = *v60;
    v64 = -[PXCMMPhotoKitContext initWithAssetsDataSourceManager:mediaProvider:activityType:](self, "initWithAssetsDataSourceManager:mediaProvider:activityType:", v85, v89, a4);
    v65 = v64;
    if (v64)
    {
      -[PXCMMContext setPeopleSuggestionsPreviewDataSourceManager:](v64, "setPeopleSuggestionsPreviewDataSourceManager:", v83);
      -[PXCMMContext setPeopleSuggestionsDataSourceManager:](v65, "setPeopleSuggestionsDataSourceManager:", v82);
      v66 = (void *)objc_msgSend(v84, "copy");
      -[PXCMMContext setOriginalTitle:](v65, "setOriginalTitle:", v66);

      v67 = (void *)objc_msgSend(v62, "copy");
      -[PXCMMContext setTitle:](v65, "setTitle:", v67);

      v68 = (void *)objc_msgSend(v63, "copy");
      -[PXCMMContext setSubtitle:](v65, "setSubtitle:", v68);

      -[PXCMMContext setPosterAsset:](v65, "setPosterAsset:", v43);
      -[PXCMMContext setPosterMediaProvider:](v65, "setPosterMediaProvider:", v89);
      -[PXCMMContext setStartDate:](v65, "setStartDate:", v48);
      -[PXCMMContext setEndDate:](v65, "setEndDate:", v49);
      -[PXCMMContext setPhotosCount:](v65, "setPhotosCount:", v79);
      -[PXCMMContext setVideosCount:](v65, "setVideosCount:", v78);
      -[PXCMMContext setCount:](v65, "setCount:", v77);
      -[PXCMMContext setSourceType:](v65, "setSourceType:", a5);
    }
    self = v65;

    v69 = self;
  }
  else
  {
    PLSharingGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_ERROR, "No assets found for %@\n", (uint8_t *)&buf, 0xCu);
    }
    v69 = 0;
  }

  return v69;
}

- (PXCMMPhotoKitContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  PXCMMPhotoKitContext *v5;
  PXCMMPhotoKitActionManager *v6;
  PXCMMPhotoKitActionManager *photoKitActionManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCMMPhotoKitContext;
  v5 = -[PXCMMContext initWithAssetsDataSourceManager:mediaProvider:activityType:](&v9, sel_initWithAssetsDataSourceManager_mediaProvider_activityType_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PXCMMPhotoKitActionManager);
    photoKitActionManager = v5->_photoKitActionManager;
    v5->_photoKitActionManager = v6;

  }
  return v5;
}

- (PXCMMPhotoKitContext)initWithMomentShare:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PXPhotosDataSourceConfiguration *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PXCMMPhotoKitContext *v28;
  void *v29;
  PXCMMPreviewAsset *v30;
  PXCMMPreviewUIImageProvider *v31;
  uint64_t v32;
  PXCMMPhotoKitContext *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  SEL v41;
  PXPhotosDataSource *v44;
  void *v45;
  id v46;
  id v47;
  PXPhotoKitUIMediaProvider *v48;
  PXPhotoKitAssetsDataSourceManager *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v9 = a4;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType == PXCMMActivityTypeReceiving || activityType == PXCMMActivityTypeReview"));

  }
  v41 = a2;
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v8, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v14, v11);
  v15 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v15;
  v16 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v15, 0);
  -[PXPhotosDataSourceConfiguration setPhotoLibrary:](v16, "setPhotoLibrary:", v10);
  v53 = *MEMORY[0x1E0CD1988];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v16, "setFetchPropertySets:", v17);

  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v18, "emulatesEmptyMomentShare");

  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setFilterPredicate:](v16, "setFilterPredicate:", v19);
  }
  else
  {
    +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", v8, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateForUseCase:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setFilterPredicate:](v16, "setFilterPredicate:", v20);

  }
  v44 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v16);
  v49 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v44);
  v48 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  v50 = 0;
  v51 = 0;
  PXCMMTitleAndSubtitleForAssetCollection(v8, &v51, &v50);
  v47 = v51;
  v46 = v50;
  v21 = 0;
  if (objc_msgSend(v8, "px_momentShareType") == 1)
  {
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("role"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPredicate:", v23);

    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", v8, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("PXCMMPhotoKitContext.m"), 320, CFSTR("No owner for moment share: %@"), v8);

      v25 = 0;
    }
    PXRecipientFromShareParticipant(v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v8, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = self;
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[PXCMMPreviewAsset initWithMomentShare:underlyingAsset:]([PXCMMPreviewAsset alloc], "initWithMomentShare:underlyingAsset:", v8, v29);
  v31 = objc_alloc_init(PXCMMPreviewUIImageProvider);
  v32 = -[PXCMMPhotoKitContext initWithAssetsDataSourceManager:mediaProvider:activityType:](v28, "initWithAssetsDataSourceManager:mediaProvider:activityType:", v49, v48, v9);
  v33 = (PXCMMPhotoKitContext *)v32;
  if (v32)
  {
    objc_storeStrong((id *)(v32 + 192), a3);
    -[PXCMMContext setTitle:](v33, "setTitle:", v47);
    -[PXCMMContext setSubtitle:](v33, "setSubtitle:", v46);
    if (v21)
    {
      v52 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMContext setRecipients:](v33, "setRecipients:", v34);

    }
    else
    {
      -[PXCMMContext setRecipients:](v33, "setRecipients:", MEMORY[0x1E0C9AA60]);
    }
    -[PXCMMContext setOriginatorRecipient:](v33, "setOriginatorRecipient:", v21);
    objc_msgSend(v8, "startDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMContext setStartDate:](v33, "setStartDate:", v35);

    objc_msgSend(v8, "endDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMContext setEndDate:](v33, "setEndDate:", v36);

    -[PXCMMContext setPhotosCount:](v33, "setPhotosCount:", objc_msgSend(v8, "photosCount"));
    -[PXCMMContext setVideosCount:](v33, "setVideosCount:", objc_msgSend(v8, "videosCount"));
    -[PXCMMContext setCount:](v33, "setCount:", objc_msgSend(v8, "assetCount"));
    -[PXCMMContext setPosterAsset:](v33, "setPosterAsset:", v30);
    -[PXCMMContext setPosterMediaProvider:](v33, "setPosterMediaProvider:", v31);
    -[PXCMMContext setSourceType:](v33, "setSourceType:", a5);
  }

  return v33;
}

- (PXCMMPhotoKitContext)initWithSuggestion:(id)a3 activityType:(unint64_t)a4 sourceType:(unint64_t)a5 optionalPeopleFetchResult:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PXCMMPhotoKitContext *v18;
  PXCMMPhotoKitContext *v19;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestion"));

  }
  if (a4 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitContext.m"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType == PXCMMActivityTypePublish"));

  }
  v14 = objc_alloc(MEMORY[0x1E0CD1620]);
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v15, v16, *MEMORY[0x1E0CD1B98], 0, 0, 0);

  v18 = -[PXCMMPhotoKitContext initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:](self, "initWithFetchResult:activityType:sourceType:optionalPeopleFetchResult:", v17, a4, a5, v13);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_suggestion, a3);

  return v19;
}

- (id)actionManager
{
  return self->_photoKitActionManager;
}

- (id)createSession
{
  return -[PXCMMPhotoKitSession initWithPhotoKitContext:]([PXCMMPhotoKitSession alloc], "initWithPhotoKitContext:", self);
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (PHMomentShare)originatingMomentShare
{
  return self->_originatingMomentShare;
}

- (void)setOriginatingMomentShare:(id)a3
{
  objc_storeStrong((id *)&self->_originatingMomentShare, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingMomentShare, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_photoKitActionManager, 0);
}

void __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_151(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "cloudAlbumSubscriberRecords");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "inviteeFirstName", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

uint64_t __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __94__PXCMMPhotoKitContext_initWithFetchResult_activityType_sourceType_optionalPeopleFetchResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

@end

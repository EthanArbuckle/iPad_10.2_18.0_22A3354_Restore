@implementation PGHighlightStatisticsEstimator

- (PGHighlightStatisticsEstimator)initWithWorkingContext:(id)a3
{
  id v5;
  PGHighlightStatisticsEstimator *v6;
  PGHighlightStatisticsEstimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGHighlightStatisticsEstimator;
  v6 = -[PGHighlightStatisticsEstimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workingContext, a3);

  return v7;
}

- (id)highlightEstimatesDictionaryWithCurationContext:(id)a3
{
  NSDictionary *highlightEstimatesDictionary;
  NSDictionary *v5;
  NSDictionary *v6;

  highlightEstimatesDictionary = self->_highlightEstimatesDictionary;
  if (!highlightEstimatesDictionary)
  {
    -[PGHighlightStatisticsEstimator _createHighlightEstimatesDictionaryWithCurationContext:](self, "_createHighlightEstimatesDictionaryWithCurationContext:", a3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_highlightEstimatesDictionary;
    self->_highlightEstimatesDictionary = v5;

    highlightEstimatesDictionary = self->_highlightEstimatesDictionary;
  }
  return highlightEstimatesDictionary;
}

- (id)highlightEstimatesDescriptionWithCurationContext:(id)a3
{
  void *v4;
  void *v5;

  -[PGHighlightStatisticsEstimator highlightEstimatesDictionaryWithCurationContext:](self, "highlightEstimatesDictionaryWithCurationContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGHighlightStatisticsEstimator _highlightEstimatesDescriptionWithData:](self, "_highlightEstimatesDescriptionWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createHighlightEstimatesDictionaryWithCurationContext:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PGHighlightStatisticsEstimator *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__50607;
  v20 = __Block_byref_object_dispose__50608;
  v21 = 0;
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke;
  v11[3] = &unk_1E84340C0;
  v7 = v5;
  v12 = v7;
  v13 = self;
  v8 = v4;
  v14 = v8;
  v15 = &v16;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)_isUtilityAsset:(id)a3
{
  double v3;

  objc_msgSend(a3, "clsContentScore");
  return v3 <= *MEMORY[0x1E0D77DF0];
}

- (unint64_t)_numberOfUtilityAssetsForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFetchPropertySets:", v7);

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v11 += -[PGHighlightStatisticsEstimator _isUtilityAsset:](self, "_isUtilityAsset:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_collectDetailsForTripsAndWeekends:(id)a3 inGraph:(id)a4 curationContext:(id)a5
{
  id v8;
  id v9;
  PGTitleGenerationContext *v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  PGHighlightTitleGenerator *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v44;
  PGTitleGenerationContext *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  PGHighlightTitleGenerator *v58;
  void *context;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v47 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v48 = (id)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PGTitleGenerationContext alloc];
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v9;
  v45 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v10, "initWithGraph:serviceManager:", v9, v11);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v8;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v50)
  {
    v44 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v14 = MEMORY[0x1CAA4EB2C]();
        v15 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:]([PGHighlightTitleGenerator alloc], "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v13, 0, 0, 0, v45);
        -[PGHighlightTitleGenerator titleTuple](v15, "titleTuple");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v19 = objc_claimAutoreleasedReturnValue();

        v57 = v16;
        objc_msgSend(v16, "subtitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v21 = objc_claimAutoreleasedReturnValue();

        v55 = (void *)v21;
        v56 = (void *)v19;
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\"%@ – %@\"), v19, v21);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "eventCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "eventMomentNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v23, "numberOfAssets");

        objc_msgSend(v13, "fetchAssetCollectionInPhotoLibrary:", v46);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGCurationOptions defaultOptions](PGCurationOptions, "defaultOptions");
        v25 = objc_claimAutoreleasedReturnValue();
        -[PGManagerWorkingContext curationManager](self->_workingContext, "curationManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)v25;
        objc_msgSend(v26, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v24, v25, v47, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = v27;
        v28 = objc_msgSend(v27, "count");
        objc_msgSend(v13, "eventEnrichmentMomentNodes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "temporarySet");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "momentsResultForMomentNodes:inPhotoLibrary:sortChronologically:", v30, v46, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        v58 = v15;
        context = (void *)v14;
        if (v32)
        {
          v33 = v32;
          v34 = 0;
          v35 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v61 != v35)
                objc_enumerationMutation(v31);
              v34 += -[PGHighlightStatisticsEstimator _numberOfUtilityAssetsForAssetCollection:](self, "_numberOfUtilityAssetsForAssetCollection:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v33);
        }
        else
        {
          v34 = 0;
        }
        v69[0] = v54;
        v68[0] = CFSTR("name");
        v68[1] = CFSTR("assetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v37;
        v68[2] = CFSTR("curatedAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v38;
        v68[3] = CFSTR("utilityAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v39;
        v68[4] = CFSTR("momentCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v69[4] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "addObject:", v41);
        objc_autoreleasePoolPop(context);
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v50);
  }

  return v48;
}

- (id)_collectDetailsForAggregations:(id)a3 inGraph:(id)a4 curationContext:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  PGCurationOptions *v62;
  uint64_t v63;
  void *v64;
  void *context;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  __int128 v88;
  _QWORD v89[6];
  _QWORD v90[6];
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v58 = a4;
  v56 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v57 = (id)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v8;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v10;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v60)
  {
    v55 = *(_QWORD *)v86;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v86 != v55)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v11);
        v13 = MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v59, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v82 != v19)
                objc_enumerationMutation(v15);
              v18 += objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "numberOfAssets");
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }

        objc_msgSend(v15, "count");
        v21 = (double)v18;
        v22 = (double)(unint64_t)objc_msgSend(v15, "count");
        objc_msgSend(v58, "momentsResultForMomentNodes:inPhotoLibrary:sortChronologically:", v15, v67, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "librarySpecificFetchOptions");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setIncludeGuestAssets:", 1);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v68 = v23;
        v24 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        context = (void *)v13;
        v66 = v11;
        v63 = v12;
        v64 = v15;
        if (v24)
        {
          v25 = v24;
          v26 = 0;
          v69 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v78 != v69)
                objc_enumerationMutation(v68);
              v28 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
              v29 = (void *)MEMORY[0x1CAA4EB2C]();
              objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v28, v71);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "fetchedObjects");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObjectsFromArray:", v31);

              v75 = 0u;
              v76 = 0u;
              v73 = 0u;
              v74 = 0u;
              v32 = v30;
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v74;
                do
                {
                  for (k = 0; k != v34; ++k)
                  {
                    if (*(_QWORD *)v74 != v35)
                      objc_enumerationMutation(v32);
                    v26 += -[PGHighlightStatisticsEstimator _isUtilityAsset:](self, "_isUtilityAsset:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k));
                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
                }
                while (v34);
              }

              objc_autoreleasePoolPop(v29);
            }
            v25 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
          }
          while (v25);
        }
        else
        {
          v26 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "sortUsingDescriptors:", v38);

        objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v72, 0, 0, v67);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 2);
        -[PGManagerWorkingContext curationManager](self->_workingContext, "curationManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v70, v62, v56, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v40, "count");

        v41 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v64, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "name");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "lastObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ (%@ - %@)"), v63, v43, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v90[0] = v46;
        v89[0] = CFSTR("name");
        v89[1] = CFSTR("assetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v90[1] = v47;
        v89[2] = CFSTR("curatedAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v90[2] = v48;
        v89[3] = CFSTR("utilityAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v90[3] = v49;
        v89[4] = CFSTR("aggregationAvgAssetCountPerMoment");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 / v22);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v90[4] = v50;
        v89[5] = CFSTR("momentCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v90[5] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 6);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "addObject:", v52);
        objc_autoreleasePoolPop(context);
        v11 = v66 + 1;
      }
      while (v66 + 1 != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v60);
  }

  return v57;
}

- (id)_highlightEstimatesDescriptionWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  id obj;
  id obja;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("generalInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("utilityAssetCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("momentCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("highlightCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avgAssetCountPerMoment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v67 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("avgCuratedAssetCountPerMoment"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v4, "appendFormat:", CFSTR("\nnumber of assets: %lu"), v7);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nnumber of utility assets: %lu"), v9);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nnumber of moments: %lu"), v11);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nnumber of highlights: %lu"), v13);
  objc_msgSend(v4, "appendFormat:", CFSTR("\navg assets per moment: %f"), v16);
  v69 = v4;
  objc_msgSend(v4, "appendFormat:", CFSTR("\navg curated assets per moment: %f"), v19);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\nmoments count per year:"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\navg assets per moment per year:"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("momentsByYear"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("avgAssetsPerMomentByYear"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v22;
  objc_msgSend(v22, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v65 = v24;
  objc_msgSend(v24, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v75 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v73, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        objc_msgSend(v20, "appendFormat:", CFSTR("\n %@: %lu"), v29, v31);
        objc_msgSend(v72, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;

        objc_msgSend(v21, "appendFormat:", CFSTR("\n %@: %f"), v29, v34);
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v26);
  }

  v64 = v20;
  objc_msgSend(v69, "appendString:", v20);
  v60 = v21;
  objc_msgSend(v69, "appendString:", v21);
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("trips"));
  obja = (id)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForTripWeekendDetails:](self, "_stringDescriptionForTripWeekendDetails:", obja);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("\n\n################################\n\nTrip Statistics: %@"), v36);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("weekends"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForTripWeekendDetails:](self, "_stringDescriptionForTripWeekendDetails:", v63);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("\n\n################################\n\nWeekend Statistics: %@"), v38);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "appendString:", v62);
  objc_msgSend(v69, "appendString:", v61);
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("homeAggregations"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForHomeWorkAggregations:](self, "_stringDescriptionForHomeWorkAggregations:", v59);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("\n\n################################\n\nHome Aggregation Statistics:%@"), v40);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("homeSupersetAggregations"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForHomeWorkAggregations:](self, "_stringDescriptionForHomeWorkAggregations:", v58);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("\n\n################################\n\nHome Superset Aggregation Statistics:%@"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("workAggregations"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForHomeWorkAggregations:](self, "_stringDescriptionForHomeWorkAggregations:", v57);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("\n\n################################\n\nWork Aggregation Statistics:%@"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "appendString:", v56);
  objc_msgSend(v69, "appendString:", v46);
  objc_msgSend(v69, "appendString:", v43);
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("singleMoments"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForMomentsDetails:](self, "_stringDescriptionForMomentsDetails:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("Moments that are not in Trips/Weekends/Aggregations: %@"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "appendFormat:", CFSTR("\n\n################################\n\n%@"), v50);
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("moments"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)MEMORY[0x1E0CB3940];
  -[PGHighlightStatisticsEstimator _stringDescriptionForMomentsDetails:](self, "_stringDescriptionForMomentsDetails:", v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "stringWithFormat:", CFSTR("Moment Statistics: %@"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "appendFormat:", CFSTR("\n\n################################\n\n%@"), v54);
  return v69;
}

- (id)_stringDescriptionForTripWeekendDetails:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\tname\tassets\tcurated assets\tutility assets\tmoments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "count");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("curatedAssetCount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("utilityAssetCount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("momentCount"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@\t%lu\t%lu\t%lu\t%lu"), v11, v13, v15, v17, v19);
        v8 = v8 + (double)v13;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(count %lu, avg assets per trip %f)\n%@"), v22, v8 / (double)v22, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_stringDescriptionForHomeWorkAggregations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\t  aggregation identifier\t\t\tassets\tcurated assets\tutility assets\tmoments\tassets per moment"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "count");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v29;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("curatedAssetCount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("aggregationAvgAssetCountPerMoment"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("momentCount"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("utilityAssetCount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        v6 += v20;
        v8 = v8 + (double)v13;
        objc_msgSend(v27, "appendFormat:", CFSTR("\n\t- %@\t%lu\t%lu\t%lu\t%lu\t%.1f"), v11, v13, v15, v22, v20, v18);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v8 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n- number of aggregations: %lu\n- number of moments: %lu\n- avg number of assets per aggregation: %f\n\nDetails:\n%@"), v25, v6, v8 / (double)v25, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_stringDescriptionForMomentsDetails:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\tmomentName\tassets\tcurated assets\tutility assets\tinteresting\tmeanings"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetCount"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("curatedAssetCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("utilityAssetCount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isInteresting"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");
        v18 = CFSTR("NO");
        if (v17)
          v18 = CFSTR("YES");
        v19 = v18;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("meanings"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "appendFormat:", CFSTR("\n\t%@\t%lu\t%lu\t%lu\t%@\t%@"), v9, v11, v13, v15, v19, v21);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightEstimatesDictionary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id obj;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  unint64_t v83;
  void *v84;
  id v85;
  void *v86;
  PGCurationOptions *v87;
  void *v88;
  void *context;
  void *contexta;
  void *v92;
  unint64_t v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[5];
  id v100;
  id v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char v106;
  _QWORD v107[4];
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[10];
  _QWORD v114[10];
  _QWORD v115[6];
  _QWORD v116[6];
  _BYTE v117[128];
  _QWORD v118[6];
  _QWORD v119[6];
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v62 = a2;
  objc_msgSend(v62, "graph");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "momentNodesSortedByDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v72);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "meNodeCollection");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v2;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
  if (!v73)
  {
    v67 = 0;
    v75 = 0;
    v76 = 0;
    v3 = 0.0;
    v4 = 0.0;
    goto LABEL_33;
  }
  v67 = 0;
  v75 = 0;
  v76 = 0;
  v71 = *(_QWORD *)v110;
  v3 = 0.0;
  v4 = 0.0;
  do
  {
    for (i = 0; i != v73; ++i)
    {
      if (*(_QWORD *)v110 != v71)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v72, "momentForMomentNode:inPhotoLibrary:", v6, *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v93 = objc_msgSend(v6, "numberOfAssets");
        v87 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "curationManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v7, v87, *(_QWORD *)(a1 + 48), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v9, "count");

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_2;
        v107[3] = &unk_1E84322A8;
        v85 = v10;
        v108 = v85;
        objc_msgSend(v6, "enumerateMeaningNodesUsingBlock:", v107);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_localizedCompare_);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "sortedArrayUsingDescriptors:", v12);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v6, "isSmartInteresting");
        v79 = objc_msgSend(*(id *)(a1 + 40), "_numberOfUtilityAssetsForAssetCollection:", v7);
        v118[0] = CFSTR("name");
        objc_msgSend(v6, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v14;
        v118[1] = CFSTR("assetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v93);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v15;
        v118[2] = CFSTR("curatedAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v83);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v119[2] = v16;
        v118[3] = CFSTR("utilityAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v79);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v119[3] = v17;
        v118[4] = CFSTR("isInteresting");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v118[5] = CFSTR("meanings");
        v119[4] = v18;
        v119[5] = v81;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "addObject:", v19);
        objc_msgSend(v6, "localStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 + 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v24, v21);

        objc_msgSend(v92, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26 + v93);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setObject:forKeyedSubscript:", v27, v21);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), v21, objc_msgSend(MEMORY[0x1E0D4B130], "weekOfYearFromDate:", v20));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v6, "happensPartiallyAtHomeOrWorkOfPersonNodes:", v77);
        v30 = objc_msgSend(v6, "happensPartiallyAtHomeOfPersonNodes:", v77);
        v103 = 0;
        v104 = &v103;
        v105 = 0x2020000000;
        v106 = 0;
        if (((v30 ^ 1 | v13) & 1) != 0)
        {
          if (((v29 ^ 1 | v13) & 1) != 0)
          {
            if ((v13 & 1) != 0)
              goto LABEL_26;
            objc_msgSend(v6, "addressNodes");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v31, "count") == 1)
            {
              v99[0] = MEMORY[0x1E0C809B0];
              v99[1] = 3221225472;
              v99[2] = __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_3;
              v99[3] = &unk_1E8430CF0;
              v99[4] = v6;
              v100 = v64;
              v101 = v28;
              v102 = &v103;
              objc_msgSend(v63, "enumerateIdentifiersAsCollectionsWithBlock:", v99);

            }
            if ((v29 & 1) != 0)
              goto LABEL_28;
LABEL_22:
            v33 = *((_BYTE *)v104 + 24) ? v13 : 1;
            if ((v33 & 1) != 0)
              goto LABEL_26;
            goto LABEL_28;
          }
          objc_msgSend(v66, "objectForKeyedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v32, v28);
          }
        }
        else
        {
          objc_msgSend(v68, "objectForKeyedSubscript:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v32, v28);
          }
        }
        objc_msgSend(v32, "addObject:", v6);

        if ((v29 & 1) == 0)
          goto LABEL_22;
        if ((_DWORD)v13)
        {
LABEL_26:
          if ((objc_msgSend(v6, "isPartOfTrip") & 1) == 0)
          {
            objc_msgSend(v65, "addObject:", v19);
            ++v67;
          }
        }
LABEL_28:
        _Block_object_dispose(&v103, 8);

        v75 += v93;
        v76 += v79;
        v4 = v4 + (double)v93;
        v3 = v3 + (double)v83;
      }

      objc_autoreleasePoolPop(context);
    }
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
  }
  while (v73);
LABEL_33:

  v80 = objc_msgSend(obj, "count");
  v74 = objc_msgSend(obj, "count");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v92, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v35 = v78;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v96 != v37)
          objc_enumerationMutation(v35);
        v39 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(v35, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "unsignedIntegerValue");

        objc_msgSend(v92, "objectForKeyedSubscript:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v44 = v43;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44 / (double)v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v45, v39);

      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
    }
    while (v36);
  }

  objc_msgSend(v72, "longTripNodes");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "shortTripNodes");
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collectDetailsForTripsAndWeekends:inGraph:curationContext:", v94, v72, *(_QWORD *)(a1 + 48));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collectDetailsForTripsAndWeekends:inGraph:curationContext:", contexta, v72, *(_QWORD *)(a1 + 48));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collectDetailsForAggregations:inGraph:curationContext:", v68, v72, *(_QWORD *)(a1 + 48));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collectDetailsForAggregations:inGraph:curationContext:", v66, v72, *(_QWORD *)(a1 + 48));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_collectDetailsForAggregations:inGraph:curationContext:", v64, v72, *(_QWORD *)(a1 + 48));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v94, "count");
  v48 = objc_msgSend(contexta, "count");
  v49 = objc_msgSend(v68, "count");
  v50 = objc_msgSend(v64, "count");
  v51 = objc_msgSend(v66, "count");
  v115[0] = CFSTR("assetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v75);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v52;
  v115[1] = CFSTR("momentCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v53;
  v115[2] = CFSTR("highlightCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47 + v67 + v48 + v49 + v50 + v51);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v54;
  v115[3] = CFSTR("avgAssetCountPerMoment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 / (double)v80);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v55;
  v115[4] = CFSTR("avgCuratedAssetCountPerMoment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 / (double)v74);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v56;
  v115[5] = CFSTR("utilityAssetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v76);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v57;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v113[0] = CFSTR("generalInfo");
  v113[1] = CFSTR("moments");
  v114[0] = v58;
  v114[1] = v70;
  v113[2] = CFSTR("singleMoments");
  v113[3] = CFSTR("trips");
  v114[2] = v65;
  v114[3] = v88;
  v113[4] = CFSTR("weekends");
  v113[5] = CFSTR("homeAggregations");
  v114[4] = v86;
  v114[5] = v84;
  v113[6] = CFSTR("workAggregations");
  v113[7] = CFSTR("homeSupersetAggregations");
  v114[6] = v82;
  v114[7] = v46;
  v113[8] = CFSTR("momentsByYear");
  v113[9] = CFSTR("avgAssetsPerMomentByYear");
  v114[8] = v35;
  v114[9] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 10);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v61 = *(void **)(v60 + 40);
  *(_QWORD *)(v60 + 40) = v59;

}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __89__PGHighlightStatisticsEstimator__createHighlightEstimatesDictionaryWithCurationContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(a3, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsNode:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 48));
      v8 = v9;
    }
    v10 = v8;
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;

  }
}

@end

@implementation PGTripKeyAssetQuestionFactory

- (unsigned)questionType
{
  return 12;
}

- (int64_t)questionOptions
{
  return 2048;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double Current;
  char v9;
  NSObject *v10;
  double v11;
  char v12;
  void *v13;
  id v14;
  void (**v15)(void *, _BYTE *, double);
  double v16;
  char v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, int, _BYTE *, _BYTE *);
  void *v23;
  PGTripKeyAssetQuestionFactory *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v33[3] >= 0.01)
    {
      v33[3] = Current;
      v31 = 0;
      v7[2](v7, &v31, 0.0);
      v9 = *((_BYTE *)v37 + 24) | v31;
      *((_BYTE *)v37 + 24) = v9;
      if (v9)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_19:
          v18 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_22;
        }
        *(_DWORD *)buf = 67109378;
        v41 = 34;
        v42 = 2080;
        v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
        v10 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_19;
      }
    }
    if (!a3)
    {
      v11 = CFAbsoluteTimeGetCurrent();
      if (v11 - v33[3] < 0.01)
        goto LABEL_19;
      v33[3] = v11;
      v31 = 0;
      v7[2](v7, &v31, 1.0);
      v12 = *((_BYTE *)v37 + 24) | v31;
      *((_BYTE *)v37 + 24) = v12;
      if (!v12 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_19;
      *(_DWORD *)buf = 67109378;
      v41 = 38;
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __74__PGTripKeyAssetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v23 = &unk_1E8427F48;
  v24 = self;
  v14 = v13;
  v25 = v14;
  v29 = a3;
  v15 = v7;
  v26 = v15;
  v27 = &v32;
  v30 = 0x3F847AE147AE147BLL;
  v28 = &v36;
  -[PGTripKeyAssetQuestionFactory _enumerateTrips:](self, "_enumerateTrips:", &v20);
  if (v7
    && (v16 = CFAbsoluteTimeGetCurrent(), v16 - v33[3] >= 0.01)
    && (v33[3] = v16,
        v31 = 0,
        v15[2](v15, &v31, 1.0),
        v17 = *((_BYTE *)v37 + 24) | v31,
        (*((_BYTE *)v37 + 24) = v17) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v41 = 68;
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripKeyAsset/PGTripKeyAssetQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v14, "allObjects", v20, v21, v22, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

- (void)_enumerateTrips:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t k;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void (**v58)(id, void *, void *, uint64_t, uint8_t *, _BYTE *);
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  _BYTE v76[5];
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[5];

  v84[3] = *MEMORY[0x1E0C80C00];
  v58 = (void (**)(id, void *, void *, uint64_t, uint8_t *, _BYTE *))a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(type = %d OR type = %d) AND enrichmentState == %d"), 1, 2, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v11);

  v50 = v6;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = *MEMORY[0x1E0CD19C0];
  v14 = v83;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v13;
  objc_msgSend(v13, "setFetchPropertySets:", v15);

  v51 = v5;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v16;
  objc_msgSend(v16, "setFetchPropertySets:", v17);

  v75 = 0;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v12;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v72;
    v18 = 0x1E0CD1000uLL;
    while (2)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v72 != v55)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(*(id *)(v18 + 912), "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v20, 0, v57);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          buf[0] = 0;
          v58[2](v58, v20, v22, 1, buf, &v75);
          if (v75)
          {

            goto LABEL_26;
          }
          v23 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v20, "objectID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "predicateWithFormat:", CFSTR("highlightBeingKeyAssetPrivate.parentDayGroupPhotosHighlight == %@"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setInternalPredicate:", v25);

          v26 = v18;
          objc_msgSend(*(id *)(v18 + 912), "fetchAssetsWithOptions:", v54);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v29 = v27;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v68 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                if ((objc_msgSend(v34, "isEqual:", v22) & 1) == 0)
                  objc_msgSend(v28, "addObject:", v34);
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
            }
            while (v31);
          }

          if (objc_msgSend(v28, "count"))
            objc_msgSend(v52, "setObject:forKey:", v28, v20);

          v18 = v26;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v20;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil key asset for trip %@", buf, 0xCu);
        }

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      if (v56)
        continue;
      break;
    }
  }
LABEL_26:

  if (!v75)
  {
    v35 = 0uLL;
    while (1)
    {
      v65 = v35;
      v66 = v35;
      v63 = v35;
      v64 = v35;
      objc_msgSend(v52, "keyEnumerator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      if (!v37)
        break;
      v38 = v37;
      v39 = *(_QWORD *)v64;
      v40 = 1;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v64 != v39)
            objc_enumerationMutation(v36);
          v42 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          objc_msgSend(v52, "objectForKey:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v44 = v43;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v60;
            while (2)
            {
              for (m = 0; m != v46; ++m)
              {
                if (*(_QWORD *)v60 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
                buf[0] = 0;
                v58[2](v58, v42, v49, 0, buf, &v75);
                if (v75)
                {

                  goto LABEL_49;
                }
                if (buf[0])
                {
                  v40 = 0;
                  goto LABEL_44;
                }
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
              if (v46)
                continue;
              break;
            }
          }
LABEL_44:

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      }
      while (v38);

      v35 = 0uLL;
      if ((v40 & 1) != 0)
        goto LABEL_50;
    }
LABEL_49:

  }
LABEL_50:

}

void __74__PGTripKeyAssetQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, int a4, _BYTE *a5, _BYTE *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  double v19;
  PGTripKeyAssetQuestion *v20;
  void *v21;
  PGTripKeyAssetQuestion *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  double Current;
  uint64_t v27;

  v11 = a2;
  v12 = a3;
  v13 = (void *)MEMORY[0x1CAA4EB2C]();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "localizedTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedSubtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%@)"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v11, "type") == 1;
  if (a4)
    v19 = 1.0;
  else
    v19 = 0.5;
  v20 = [PGTripKeyAssetQuestion alloc];
  objc_msgSend(v12, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PGTripKeyAssetQuestion initWithKeyAssetUUID:tripName:isLongTrip:localFactoryScore:](v20, "initWithKeyAssetUUID:tripName:isLongTrip:localFactoryScore:", v21, v17, v18, v19);

  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v22, *(_QWORD *)(a1 + 40))&& (objc_msgSend(*(id *)(a1 + 40), "addObject:", v22), *a5 = 1, (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 72)))
  {
    *a6 = 1;
  }
  else
  {
    v23 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (*(_QWORD *)(a1 + 48))
    {
      v24 = v23;
      v25 = *(_QWORD *)(a1 + 72);
      Current = CFAbsoluteTimeGetCurrent();
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (Current - *(double *)(v27 + 24) >= *(double *)(a1 + 80))
      {
        *(double *)(v27 + 24) = Current;
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))((double)v24 / (double)v25);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          *a6 = 1;
      }
    }
  }

  objc_autoreleasePoolPop(v13);
}

@end

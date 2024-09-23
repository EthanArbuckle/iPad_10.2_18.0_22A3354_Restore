@implementation PGLocationRepresentativeAssetQuestionFactory

- (unsigned)questionType
{
  return 27;
}

- (int64_t)questionOptions
{
  return 0x2000000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  void (**v6)(void *, _BYTE *, double);
  double Current;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  if (!v6)
  {
    v8 = 0.0;
    if (!a3)
      goto LABEL_23;
    goto LABEL_10;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v8 = 0.0;
  if (Current < 0.01)
  {
LABEL_9:
    if (!a3)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
        goto LABEL_23;
      v25 = 0;
      v6[2](v6, &v25, 1.0);
      if (!v25 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_23;
      *(_DWORD *)buf = 67109378;
      v27 = 36;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
LABEL_10:
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71860], "predicateForAssetWithLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLocationRepresentativeAssetQuestionFactory _fetchAssetsWithLibrary:internalPredicate:](self, "_fetchAssetsWithLibrary:internalPredicate:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGSurveyQuestionFactory curationSession](self, "curationSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D77E18]);
      -[PGSurveyQuestionFactory setCurationSession:](self, "setCurationSession:", v17);

    }
    -[PGSurveyQuestionFactory curationSession](self, "curationSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "prepareAssets:", v15);

    if (v6)
    {
      v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v8 >= 0.01)
      {
        v25 = 0;
        v6[2](v6, &v25, 0.7);
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v27 = 49;
            v28 = 2080;
            v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_33:

          goto LABEL_34;
        }
        v8 = v19;
      }
    }
    -[PGLocationRepresentativeAssetQuestionFactory _selectAssetsFromAssets:limit:](self, "_selectAssetsFromAssets:limit:", v15, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLocationRepresentativeAssetQuestionFactory _addQuestionsForAssetUUIDs:photoLibrary:](self, "_addQuestionsForAssetUUIDs:photoLibrary:", v22, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (v25 = 0, v6[2](v6, &v25, 1.0), v25))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v27 = 53;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v23, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_33;
  }
  v9 = Current;
  v25 = 0;
  v6[2](v6, &v25, 0.0);
  if (!v25)
  {
    v8 = v9;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v27 = 33;
    v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/LocationRepresentativeAsset/PGLocationRepresentativeAssetQuestionFactory.m";
    v10 = MEMORY[0x1E0C81028];
LABEL_22:
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_23:
  v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_34:

  return v20;
}

- (id)_fetchAssetsWithLibrary:(id)a3 internalPredicate:(id)a4
{
  id v6;
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
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77E98], "requiredFetchPropertySets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(v7, "setFetchLimit:", 1000);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  -[PGSurveyQuestionFactory existingQuestionsByEntityIdentifier](self, "existingQuestionsByEntityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (uuid IN %@)"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_selectAssetsFromAssets:(id)a3 limit:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  unint64_t v30;
  id v31;
  unint64_t v32;
  unint64_t v33;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v6, "count") < a4)
  {
    v8 = 0;
    v30 = 0;
    v32 = (a4 + 1) >> 1;
    v33 = 0;
    v9 = *MEMORY[0x1E0D77FB8];
    v31 = v7;
    do
    {
      if (v8 >= objc_msgSend(v5, "count", v30))
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      v13 = v12;
      v15 = v14;

      objc_msgSend(MEMORY[0x1E0CD1420], "poiGeoHashWithGeoHashSize:latitude:longitude:", v9, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v16) & 1) == 0)
      {
        v17 = v6;
        v18 = a4;
        v19 = v9;
        objc_msgSend(v10, "iconicScoreProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "iconicScore");
        v22 = v21;

        objc_msgSend(v10, "curationModel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "iconicScoreModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "minimumMeaningfulIconicScore");
        v26 = v25;

        if (v22 < v26 || v33 >= v32)
        {
          v6 = v17;
          if (v22 < v26 && v30 < v32)
          {
            objc_msgSend(v10, "localIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v28);

            ++v30;
            v6 = v17;
          }
        }
        else
        {
          objc_msgSend(v10, "localIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v17;
          objc_msgSend(v17, "addObject:", v27);

          ++v33;
        }
        v9 = v19;
        a4 = v18;
        v7 = v31;
      }

      ++v8;
    }
    while (objc_msgSend(v6, "count") < a4);
  }

  return v6;
}

- (id)_addQuestionsForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PGLocationRepresentativeAssetQuestion *v18;
  void *v19;
  PGLocationRepresentativeAssetQuestion *v20;
  void *v22;
  id v23;
  void *v24;
  char v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  objc_msgSend(v23, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = *MEMORY[0x1E0CD1A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  v24 = v6;
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
    {
      v14 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v9, "objectAtIndex:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v15, "photosOneUpProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedGeoDescriptionIsHome:", &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = [PGLocationRepresentativeAssetQuestion alloc];
        objc_msgSend(v15, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[PGLocationRepresentativeAssetQuestion initWithAssetUUID:locationName:](v18, "initWithAssetUUID:locationName:", v19, v17);

        if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v20, v10))
        {
          objc_msgSend(v10, "addObject:", v20);
        }

      }
      objc_autoreleasePoolPop(v14);
    }
  }

  return v10;
}

@end

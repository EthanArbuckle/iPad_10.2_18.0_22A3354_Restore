@implementation PGFeaturedPhotoQuestionFactory

- (PGFeaturedPhotoQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  PGFeaturedPhotoQuestionFactory *v7;
  PGSuggestionSession *v8;
  PGSuggestionSession *suggestionSession;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGFeaturedPhotoQuestionFactory;
  v7 = -[PGSurveyQuestionFactory initWithWorkingContext:questionVersion:](&v11, sel_initWithWorkingContext_questionVersion_, v6, v4);
  if (v7)
  {
    v8 = -[PGSuggestionSession initWithProfile:workingContext:]([PGSuggestionSession alloc], "initWithProfile:workingContext:", 5, v6);
    suggestionSession = v7->_suggestionSession;
    v7->_suggestionSession = v8;

  }
  return v7;
}

- (unsigned)questionType
{
  return 14;
}

- (int64_t)questionOptions
{
  return 0x2000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  double Current;
  char v7;
  NSObject *v8;
  double v9;
  char v10;
  void *v11;
  PGSuggestionOptions *v12;
  double v13;
  void *v14;
  PGSuggestionSession *suggestionSession;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  PGFeaturedPhotoQuestion *v23;
  void *v24;
  void *v25;
  void *v26;
  PGFeaturedPhotoQuestion *v27;
  uint64_t v28;
  unint64_t v29;
  double v30;
  char v31;
  int v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  PGFeaturedPhotoQuestion *v40;
  uint64_t v41;
  unint64_t v42;
  double v43;
  char v44;
  int v45;
  double v46;
  char v47;
  unint64_t v49;
  void *v50;
  id v51;
  PGSuggestionOptions *v52;
  void (**v53)(void *, _BYTE *, double);
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void (**v57)(void *, _BYTE *, double);
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint8_t v76[128];
  uint8_t buf[4];
  int v78;
  __int16 v79;
  const char *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v51 = a4;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = (double *)&v68;
  v70 = 0x2020000000;
  v71 = 0;
  v57 = (void (**)(void *, _BYTE *, double))_Block_copy(v51);
  if (v57)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v69[3] >= 0.01)
    {
      v69[3] = Current;
      v67 = 0;
      v57[2](v57, &v67, 0.0);
      v7 = *((_BYTE *)v73 + 24) | v67;
      *((_BYTE *)v73 + 24) = v7;
      if (v7)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_31:
          v33 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_61;
        }
        *(_DWORD *)buf = 67109378;
        v78 = 59;
        v79 = 2080;
        v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_31;
      }
    }
    if (!a3)
    {
      v9 = CFAbsoluteTimeGetCurrent();
      if (v9 - v69[3] < 0.01)
        goto LABEL_31;
      v69[3] = v9;
      v67 = 0;
      v57[2](v57, &v67, 1.0);
      v10 = *((_BYTE *)v73 + 24) | v67;
      *((_BYTE *)v73 + 24) = v10;
      if (!v10 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_31;
      *(_DWORD *)buf = 67109378;
      v78 = 63;
      v79 = 2080;
      v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    goto LABEL_31;
  }
  v55 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(PGSuggestionOptions);
  -[PGSuggestionOptions setDefaultStartAndEndDatesIfNeeded](v12, "setDefaultStartAndEndDatesIfNeeded");
  v52 = v12;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 301);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addIndex:", 303);
  objc_msgSend(v54, "addIndex:", 304);
  objc_msgSend(v54, "addIndex:", 305);
  objc_msgSend(v54, "addIndex:", 401);
  objc_msgSend(v54, "addIndex:", 501);
  objc_msgSend(v54, "addIndex:", 502);
  v13 = (double)v55;
  v56 = vcvtad_u64_f64((double)v55 * 0.75);
  -[PGSuggestionOptions setMaximumNumberOfSuggestions:](v12, "setMaximumNumberOfSuggestions:");
  +[PGSuggestionSession suggestionTypesWithProfile:](PGSuggestionSession, "suggestionTypesWithProfile:", 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSuggestionOptions setSuggestionTypeWhitelist:](v52, "setSuggestionTypeWhitelist:", v14);

  -[PGSuggestionOptions setSuggestionSubtypeWhitelist:](v52, "setSuggestionSubtypeWhitelist:", v54);
  suggestionSession = self->_suggestionSession;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __75__PGFeaturedPhotoQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v62[3] = &unk_1E8434F30;
  v53 = v57;
  v63 = v53;
  v64 = &v68;
  v65 = &v72;
  v66 = 0x3F847AE147AE147BLL;
  -[PGSuggestionSession suggestionsWithOptions:progress:](suggestionSession, "suggestionsWithOptions:progress:", v52, v62);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v55 - v56;
  while (objc_msgSend(v11, "count", v49) < v56 && objc_msgSend(v16, "count"))
  {
    v17 = (void *)MEMORY[0x1CAA4EB2C]();
    v18 = arc4random_uniform(objc_msgSend(v16, "count"));
    objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", v18);
    objc_msgSend(v19, "keyAssets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20
      || (objc_msgSend(v19, "keyAssets"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "count") == 0,
          v21,
          v20,
          v22))
    {
      v32 = 2;
    }
    else
    {
      v23 = [PGFeaturedPhotoQuestion alloc];
      objc_msgSend(v19, "keyAssets");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PGFeaturedPhotoQuestion initWithAssetUUID:suggestionType:suggestionSubtype:](v23, "initWithAssetUUID:suggestionType:suggestionSubtype:", v26, objc_msgSend(v19, "type"), objc_msgSend(v19, "subtype"));

      if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v27, v11))
      {
        objc_msgSend(v11, "addObject:", v27);
        v28 = objc_msgSend(v11, "count");
        if (v57
          && (v29 = v28, v30 = CFAbsoluteTimeGetCurrent(), v30 - v69[3] >= 0.01)
          && (v69[3] = v30,
              v67 = 0,
              v53[2](v53, &v67, (double)v29 / v13),
              v31 = *((_BYTE *)v73 + 24) | v67,
              (*((_BYTE *)v73 + 24) = v31) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v78 = 107;
            v79 = 2080;
            v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v32 = 1;
        }
        else
        {
          v32 = 0;
        }
      }
      else
      {
        v32 = 2;
      }

    }
    objc_autoreleasePoolPop(v17);
    if ((v32 | 2) != 2)
    {
      v33 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_60;
    }
  }
  -[PGFeaturedPhotoQuestionFactory randomAssetsUUIDsWithLimit:](self, "randomAssetsUUIDsWithLimit:", v49);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v59;
LABEL_34:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v36)
        objc_enumerationMutation(v34);
      v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v37);
      v39 = (void *)MEMORY[0x1CAA4EB2C]();
      v40 = -[PGFeaturedPhotoQuestion initWithAssetUUID:suggestionType:suggestionSubtype:]([PGFeaturedPhotoQuestion alloc], "initWithAssetUUID:suggestionType:suggestionSubtype:", v38, 0, 0);
      if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v40, v11))
      {
        objc_msgSend(v11, "addObject:", v40);
        v41 = objc_msgSend(v11, "count");
        if (!v57)
          goto LABEL_45;
        v42 = v41;
        v43 = CFAbsoluteTimeGetCurrent();
        if (v43 - v69[3] >= 0.01
          && (v69[3] = v43,
              v67 = 0,
              v53[2](v53, &v67, (double)v42 / v13),
              v44 = *((_BYTE *)v73 + 24) | v67,
              (*((_BYTE *)v73 + 24) = v44) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v78 = 121;
            v79 = 2080;
            v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v45 = 1;
        }
        else
        {
LABEL_45:
          v45 = 4 * (objc_msgSend(v11, "count") >= v55);
        }
      }
      else
      {
        v45 = 5;
      }

      objc_autoreleasePoolPop(v39);
      if (v45 != 5)
      {
        if (v45)
          break;
      }
      if (v35 == ++v37)
      {
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
        if (v35)
          goto LABEL_34;
        goto LABEL_50;
      }
    }

    if (v45 != 4)
      goto LABEL_57;
  }
  else
  {
LABEL_50:

  }
  if (v57
    && (v46 = CFAbsoluteTimeGetCurrent(), v46 - v69[3] >= 0.01)
    && (v69[3] = v46,
        v67 = 0,
        v53[2](v53, &v67, 1.0),
        v47 = *((_BYTE *)v73 + 24) | v67,
        (*((_BYTE *)v73 + 24) = v47) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v78 = 129;
      v79 = 2080;
      v80 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Featured/PGFeaturedPhotoQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_57:
    v33 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v11, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_60:
LABEL_61:
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v33;
}

- (id)randomAssetsUUIDsWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind != %d AND (kindSubtype & %d) == 0 AND curationScore > %f"), 1, 1, *MEMORY[0x1E0D77DF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v7);

  v19[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v8);

  objc_msgSend(v6, "setChunkSizeForFetch:", 8);
  objc_msgSend(v6, "setCacheSizeForFetch:", 8);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v11 >= a3)
    v14 = a3;
  else
    v14 = v11;
  while (v13 < v14)
  {
    v15 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v10, "objectAtIndexedSubscript:", arc4random_uniform(v11));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17);

    objc_autoreleasePoolPop(v15);
    v13 = objc_msgSend(v12, "count");
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSession, 0);
}

void __75__PGFeaturedPhotoQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end

@implementation PGTripTitlingQuestionFactory

- (int64_t)questionOptions
{
  return 0x1000000;
}

- (unsigned)questionType
{
  return 26;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PGTripTitlingQuestionFactory *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E84350A0;
  v19 = v6;
  v20 = a3;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performSynchronousConcurrentGraphReadUsingBlock:", &v13);

  objc_msgSend(v9, "allObjects", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double Current;
  char v6;
  NSObject *v7;
  double v8;
  char v9;
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
  void *v20;
  void *v21;
  void *v22;
  double v23;
  char v24;
  PGGraphLocationHelper *v25;
  id v26;
  uint64_t v27;
  void (**v28)(void *, _BYTE *, double);
  id v29;
  uint64_t v30;
  PGGraphLocationHelper *v31;
  NSObject *v32;
  double v33;
  char v34;
  double v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  PGGraphLocationHelper *v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  if (!v4)
  {
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_36;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v54[3] >= 0.01)
  {
    v54[3] = Current;
    v52 = 0;
    v4[2](v4, &v52, 0.0);
    v6 = *((_BYTE *)v58 + 24) | v52;
    *((_BYTE *)v58 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 40;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_13:
    objc_msgSend(v3, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "highlightGroupNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      if (v4)
      {
        v33 = CFAbsoluteTimeGetCurrent();
        if (v33 - v54[3] >= 0.01)
        {
          v54[3] = v33;
          v52 = 0;
          v4[2](v4, &v52, 1.0);
          v34 = *((_BYTE *)v58 + 24) | v52;
          *((_BYTE *)v58 + 24) = v34;
          if (v34)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v62 = 51;
              v63 = 2080;
              v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Qu"
                    "estions/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_35;
    }
    objc_msgSend(*(id *)(a1 + 32), "workingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v11, "localIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetCollectionsWithLocalIdentifiers:options:", v16, v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchKeyAssetByHighlightUUIDForHighlights:options:", v38, v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphHighlightGroupNodeCollection momentsOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "momentsOfHighlightGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adjacencyWithSources:relation:targetsClass:", v11, v21, objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v23 = CFAbsoluteTimeGetCurrent();
      if (v23 - v54[3] >= 0.01)
      {
        v54[3] = v23;
        v52 = 0;
        v4[2](v4, &v52, 0.1);
        v24 = *((_BYTE *)v58 + 24) | v52;
        *((_BYTE *)v58 + 24) = v24;
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v62 = 59;
            v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_34;
        }
      }
    }
    v25 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v10);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_159;
    v40[3] = &unk_1E84315F0;
    v26 = *(id *)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 56);
    v41 = v26;
    v50 = v27;
    v28 = v4;
    v47 = v28;
    v48 = &v53;
    v51 = 0x3F847AE147AE147BLL;
    v49 = &v57;
    v29 = v37;
    v30 = *(_QWORD *)(a1 + 32);
    v42 = v29;
    v43 = v30;
    v44 = v10;
    v31 = v25;
    v45 = v31;
    v46 = v22;
    objc_msgSend(v11, "enumerateUUIDs:", v40);
    if (*((_BYTE *)v58 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_33:

LABEL_34:
LABEL_35:

        goto LABEL_36;
      }
      *(_DWORD *)buf = 67109378;
      v62 = 104;
      v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripTitling/PGTripTitlingQuestionFactory.m";
      v32 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v4)
        goto LABEL_33;
      v35 = CFAbsoluteTimeGetCurrent();
      if (v35 - v54[3] < 0.01)
        goto LABEL_33;
      v54[3] = v35;
      v52 = 0;
      v28[2](v28, &v52, 1.0);
      v36 = *((_BYTE *)v58 + 24) | v52;
      *((_BYTE *)v58 + 24) = v36;
      if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_DWORD *)buf = 67109378;
      v62 = 105;
      v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/TripTitling/PGTripTitlingQuestionFactory.m";
      v32 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_33;
  }
  v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v54[3] >= 0.01)
  {
    v54[3] = v8;
    v52 = 0;
    v4[2](v4, &v52, 1.0);
    v9 = *((_BYTE *)v58 + 24) | v52;
    *((_BYTE *)v58 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v62 = 43;
        v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/TripTitling/PGTripTitlingQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
  }
LABEL_36:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

}

void __73__PGTripTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_159(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double Current;
  uint64_t v12;
  void *v13;
  PGGraphHighlightGroupNodeCollection *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  PGLocationTripTitleUtility *v21;
  void *v22;
  void *v23;
  PGLocationTripTitleUtility *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  double v30;
  PGTripTitlingQuestion *v31;
  void *v32;
  PGTripTitlingQuestion *v33;
  void *v34;
  void *v35;
  void *v36;
  _BYTE *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!*(_QWORD *)(a1 + 80))
    goto LABEL_5;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 104);
  Current = CFAbsoluteTimeGetCurrent();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (Current - *(double *)(v12 + 24) < *(double *)(a1 + 112))
    goto LABEL_5;
  *(double *)(v12 + 24) = Current;
  buf[0] = 0;
  (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))((double)v9 / (double)v10 * 0.9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = [PGGraphHighlightGroupNodeCollection alloc];
      v15 = *(_QWORD *)(a1 + 56);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
      v17 = -[MAElementCollection initWithGraph:elementIdentifiers:](v14, "initWithGraph:elementIdentifiers:", v15, v16);

      v18 = *(_QWORD *)(a1 + 64);
      v39 = 0;
      +[PGTripTitleGenerator titleForTripNodeAsCollection:locationHelper:error:](PGTripTitleGenerator, "titleForTripNodeAsCollection:locationHelper:error:", v17, v18, &v39);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v39;
      if (v19)
      {
        v37 = a4;
        v21 = [PGLocationTripTitleUtility alloc];
        objc_msgSend(*(id *)(a1 + 72), "targetsForSources:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "set");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:locationHelper:](v21, "initWithMomentNodes:filterMomentsAndCities:locationHelper:", v23, 1, *(_QWORD *)(a1 + 64));

        -[PGLocationTripTitleUtility title](v24, "title");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          v38 = v20;
          objc_msgSend(MEMORY[0x1E0D77EC8], "titleWithoutFormattingForTitle:", v19);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D77EC8], "titleWithoutFormattingForTitle:", v26);
          v28 = objc_claimAutoreleasedReturnValue();

          v29 = -[NSObject isEqualToString:](v27, "isEqualToString:", v28);
          if ((_DWORD)v29)
            v30 = 0.5;
          else
            v30 = 1.0;
          v31 = [PGTripTitlingQuestion alloc];
          objc_msgSend(v13, "uuid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[PGTripTitlingQuestion initWithTripTitle:legacyTripTitle:keyAssetUUID:localFactoryScore:duplicatedTitles:](v31, "initWithTripTitle:legacyTripTitle:keyAssetUUID:localFactoryScore:duplicatedTitles:", v27, v28, v32, v29, v30);

          if (objc_msgSend(*(id *)(a1 + 48), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v33, *(_QWORD *)(a1 + 32)))
          {
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v33);
            if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 104))
              *v37 = 1;
          }

          v19 = v27;
          v20 = v38;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "workingContext");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "loggingConnection");
          v28 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v7;
            _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[PGTripTitlingQuestionFactory] No legacy trip title generated from Trip Highlight UUID %@", buf, 0xCu);
          }
        }

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "workingContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "loggingConnection");
        v19 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v7;
          v42 = 2112;
          v43 = v20;
          _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "[PGTripTitlingQuestionFactory] No trip title generated from Trip Highlight UUID %@ with error %@", buf, 0x16u);
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "workingContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v7;
        _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGTripTitlingQuestionFactory] No key asset for Trip Highlight UUID %@", buf, 0xCu);
      }
    }

  }
}

@end

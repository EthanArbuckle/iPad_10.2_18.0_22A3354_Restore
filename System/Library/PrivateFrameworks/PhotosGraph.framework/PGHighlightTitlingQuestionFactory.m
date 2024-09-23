@implementation PGHighlightTitlingQuestionFactory

- (int64_t)questionOptions
{
  return 0x4000000;
}

- (unsigned)questionType
{
  return 28;
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
  PGHighlightTitlingQuestionFactory *v17;
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
  v15 = __78__PGHighlightTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

void __78__PGHighlightTitlingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double Current;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGHighlightTailorContext *v16;
  void *v17;
  void *v18;
  PGTitleGenerationContext *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  id v30;
  PGHighlightTailorHighlightInfo *v31;
  void *v32;
  void *v33;
  void *v34;
  PGGraphMomentNodeCollection *v35;
  void *v36;
  PGGraphMomentNodeCollection *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  PGDayHighlightTitleGenerator *v41;
  void *v42;
  PGDayHighlightTitleGenerator *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PGHighlightTitleGenerator *v48;
  void *v49;
  PGHighlightTitleGenerator *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  void *v58;
  PGHighlightTitlingQuestion *v59;
  PGHighlightTitlingQuestion *v60;
  int v61;
  void *v62;
  PGGraphMomentNodeCollection *v63;
  PGHighlightTitlingQuestion *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void (**v71)(void *, _BYTE *, double);
  PGHighlightTitleGenerator *v72;
  void *v73;
  void *v74;
  void *v75;
  PGTitleGenerationContext *v76;
  uint64_t v77;
  void *v78;
  PGHighlightTailorContext *v79;
  PGDayHighlightTitleGenerator *v80;
  void *v81;
  void *v82;
  void *context;
  char v84;
  uint64_t v85;
  uint8_t buf[4];
  int v87;
  __int16 v88;
  const char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = 0.0;
    if (Current >= 0.01)
    {
      v7 = Current;
      v84 = 0;
      v4[2](v4, &v84, 0.0);
      if (v84)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_66;
        *(_DWORD *)buf = 67109378;
        v87 = 39;
        v88 = 2080;
        v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_54;
      }
      v6 = v7;
    }
    if (!*(_QWORD *)(a1 + 56))
    {
      if (CFAbsoluteTimeGetCurrent() - v6 < 0.01)
        goto LABEL_66;
      v84 = 0;
      v4[2](v4, &v84, 1.0);
      if (!v84 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_66;
      *(_DWORD *)buf = 67109378;
      v87 = 42;
      v88 = 2080;
      v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
      v8 = MEMORY[0x1E0C81028];
LABEL_54:
      _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_66;
    }
  }
  else
  {
    v6 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_66;
  }
  objc_msgSend(*(id *)(a1 + 32), "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v84 = 0;
        v4[2](v4, &v84, 1.0);
        if (v84)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v87 = 51;
            v88 = 2080;
            v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_65;
  }
  v68 = v11;
  v69 = v3;
  objc_msgSend(v3, "graph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [PGHighlightTailorContext alloc];
  objc_msgSend(v14, "serviceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[PGHighlightTailorContext initWithPhotoLibrary:graph:serviceManager:loggingConnection:](v16, "initWithPhotoLibrary:graph:serviceManager:loggingConnection:", v15, v13, v17, v18);

  v19 = [PGTitleGenerationContext alloc];
  v74 = v14;
  objc_msgSend(v14, "serviceManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v19, "initWithGraph:serviceManager:", v13, v20);

  v67 = v15;
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFetchPropertySets:", v22);

  v66 = v21;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", v12, v21);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
LABEL_56:
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v84 = 0;
        v4[2](v4, &v84, 1.0);
        if (v84)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v87 = 134;
            v88 = 2080;
            v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_64;
  }
  v23 = 0;
  v75 = v13;
  v71 = v4;
  v73 = v12;
  v77 = a1;
  while (1)
  {
    v24 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v4)
    {
      v27 = v26;
      v28 = *(_QWORD *)(a1 + 56);
      v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v6 >= 0.01)
        break;
    }
LABEL_17:
    context = v24;
    v30 = v25;
    v31 = -[PGHighlightTailorHighlightInfo initWithHighlight:graph:highlightTailorContext:]([PGHighlightTailorHighlightInfo alloc], "initWithHighlight:graph:highlightTailorContext:", v30, v13, v79);
    -[PGHighlightTailorHighlightInfo highlightNode](v31, "highlightNode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v82 = v33;
      v35 = [PGGraphMomentNodeCollection alloc];
      -[PGHighlightTailorHighlightInfo momentNodes](v31, "momentNodes");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[MAElementCollection initWithSet:graph:](v35, "initWithSet:graph:", v36, v13);

      v38 = objc_msgSend(v32, "sharingComposition");
      if (v38 == 2)
        v39 = 2;
      else
        v39 = v38 == 1;
      +[PGHighlightEnrichmentUtilities filteredSummarizedFeaturesForHighlightWithInfo:sharingFilter:](PGHighlightEnrichmentUtilities, "filteredSummarizedFeaturesForHighlightWithInfo:sharingFilter:", v31, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = [PGDayHighlightTitleGenerator alloc];
      objc_msgSend(v74, "loggingConnection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)v40;
      v43 = -[PGDayHighlightTitleGenerator initWithSummarizedFeatures:momentNodes:titleGenerationContext:loggingConnection:](v41, "initWithSummarizedFeatures:momentNodes:titleGenerationContext:loggingConnection:", v40, v37, v76, v42);

      v80 = v43;
      -[PGDayHighlightTitleGenerator titleTuple](v43, "titleTuple");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        objc_msgSend(v44, "title");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = [PGHighlightTitleGenerator alloc];
          -[PGHighlightTailorHighlightInfo highlightNode](v31, "highlightNode");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:](v48, "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v49, 0, v34, 0, v76);

          v72 = v50;
          -[PGHighlightTitleGenerator titleTuple](v50, "titleTuple");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
          {
            v70 = v51;
            objc_msgSend(v51, "title");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "stringValue");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
            {
              v63 = v37;
              objc_msgSend(MEMORY[0x1E0D77EC8], "titleWithoutFormattingForTitle:", v47);
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0D77EC8], "titleWithoutFormattingForTitle:", v53);
              v55 = objc_claimAutoreleasedReturnValue();

              v56 = objc_msgSend(v54, "isEqualToString:", v55);
              if ((_DWORD)v56)
                v57 = 0.5;
              else
                v57 = 1.0;
              v64 = [PGHighlightTitlingQuestion alloc];
              objc_msgSend(v34, "uuid");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v64;
              v65 = v54;
              v62 = (void *)v55;
              v60 = -[PGHighlightTitlingQuestion initWithHighlightTitle:legacyHighlightTitle:keyAssetUUID:localFactoryScore:duplicatedTitles:](v59, "initWithHighlightTitle:legacyHighlightTitle:keyAssetUUID:localFactoryScore:duplicatedTitles:", v54, v55, v58, v56, v57);

              if (objc_msgSend(*(id *)(v77 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v60, *(_QWORD *)(v77 + 40))&& (objc_msgSend(*(id *)(v77 + 40), "addObject:", v60), (unint64_t)objc_msgSend(*(id *)(v77 + 40), "count") >= *(_QWORD *)(v77 + 56)))
              {
                v61 = 2;
              }
              else
              {
                v61 = 0;
              }
              v4 = v71;
              v37 = v63;

              v47 = v65;
            }
            else
            {
              v61 = 4;
              v4 = v71;
            }
            v51 = v70;
          }
          else
          {
            v61 = 4;
            v4 = v71;
          }

        }
        else
        {
          v61 = 4;
          v4 = v71;
        }
      }
      else
      {
        v61 = 4;
      }

      v12 = v73;
      v33 = v82;
    }
    else
    {
      v61 = 4;
    }

    objc_autoreleasePoolPop(context);
    if (v61 && v61 != 4)
    {
      v13 = v75;
      goto LABEL_56;
    }
    ++v23;
    v13 = v75;
    a1 = v77;
    if (v23 >= objc_msgSend(v12, "count"))
      goto LABEL_56;
  }
  v84 = 0;
  v4[2](v4, &v84, (double)v27 / (double)v28 * 0.9);
  if (!v84)
  {
    v6 = v29;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v87 = 69;
    v88 = 2080;
    v89 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/HighlightTitling/PGHighlightTitlingQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v24);
LABEL_64:

  v11 = v68;
  v3 = v69;
LABEL_65:

LABEL_66:
}

@end

@implementation PGMeaningQuestionFactory

- (unsigned)questionType
{
  return 3;
}

- (int64_t)questionOptions
{
  return 4;
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
  PGMeaningQuestionFactory *v17;
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
  v15 = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (void)_updateMeaningQuestionsIfNeededWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  double Current;
  char v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  char v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  PGMeaningQuestionFactory *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *p_buf;
  uint64_t *v50;
  uint64_t *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  int v62;
  _QWORD v63[3];
  uint64_t buf;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSurveyQuestionFactory existingQuestionsByEntityIdentifier](self, "existingQuestionsByEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = _Block_copy(v4);
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = (double *)&v54;
    v56 = 0x2020000000;
    v57 = 0;
    if (v7
      && (v8 = CFAbsoluteTimeGetCurrent(), v8 - v55[3] >= 0.01)
      && (v55[3] = v8,
          LOBYTE(v62) = 0,
          (*((void (**)(void *, int *, double))v7 + 2))(v7, &v62, 0.0),
          v9 = *((_BYTE *)v59 + 24) | v62,
          (*((_BYTE *)v59 + 24) = v9) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x7504000202;
        LOWORD(v65) = 2080;
        *(_QWORD *)((char *)&v65 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      buf = 0;
      *(_QWORD *)&v65 = &buf;
      *((_QWORD *)&v65 + 1) = 0x2020000000;
      v66 = 0;
      -[PGMeaningQuestionFactory _meaningLabelsByParentMeaningLabels](self, "_meaningLabelsByParentMeaningLabels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v10, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSurveyQuestionFactory existingQuestionsByEntityIdentifier](self, "existingQuestionsByEntityIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1.0 / (double)v6;
      v18 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke;
      v43[3] = &unk_1E842F5B0;
      p_buf = &buf;
      v52 = v17;
      v34 = v7;
      v48 = v34;
      v53 = 0x3F847AE147AE147BLL;
      v50 = &v54;
      v51 = &v58;
      v19 = v13;
      v44 = v19;
      v35 = v10;
      v45 = v35;
      v20 = v14;
      v46 = v20;
      v21 = v15;
      v47 = v21;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v43);

      if (*((_BYTE *)v59 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v62 = 67109378;
          LODWORD(v63[0]) = 171;
          WORD2(v63[0]) = 2080;
          *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v62, 0x12u);
        }
      }
      else if (objc_msgSend(v21, "count") || objc_msgSend(v20, "count"))
      {
        -[PGSurveyQuestionFactory workingContext](self, "workingContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "photoLibrary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v18;
        v38[1] = 3221225472;
        v38[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_183;
        v38[3] = &unk_1E8434200;
        v39 = v21;
        v24 = v23;
        v40 = v24;
        v41 = self;
        v42 = v20;
        v37 = 0;
        v25 = objc_msgSend(v33, "performChangesAndWait:error:", v38, &v37);
        v32 = v37;
        if ((v25 & 1) != 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "loggingConnection");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            LOWORD(v62) = 0;
            _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting meaning questions", (uint8_t *)&v62, 2u);
          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "loggingConnection");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v32, "description");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 138412290;
            v63[0] = v31;
            _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for meaning questions: %@", (uint8_t *)&v62, 0xCu);

          }
        }

        if (v7)
        {
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v55[3] >= 0.01)
          {
            v55[3] = Current;
            v36 = 0;
            (*((void (**)(id, char *, double))v34 + 2))(v34, &v36, 1.0);
            v30 = *((_BYTE *)v59 + 24) | v36;
            *((_BYTE *)v59 + 24) = v30;
            if (v30)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v62 = 67109378;
                LODWORD(v63[0]) = 204;
                WORD2(v63[0]) = 2080;
                *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v62, 0x12u);
              }
            }
          }
        }

      }
      _Block_object_dispose(&buf, 8);
    }
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);

  }
}

- (id)_meaningLabelsByParentMeaningLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v15 = CFSTR("Wedding");
  v16[0] = CFSTR("Celebration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v16[1] = CFSTR("Entertainment");
  v5 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = CFSTR("AmusementPark");
  v14[1] = CFSTR("Festival");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("Performance");
  v8 = (void *)MEMORY[0x1E0C99E60];
  v13 = CFSTR("Concert");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_questionsToAddFromMomentNodes:(id)a3 useRepresentativeAssets:(BOOL)a4 localFactoryScore:(double)a5 alreadyGeneratedQuestions:(id)a6 limit:(unint64_t)a7 graph:(id)a8 sceneTaxonomy:(id)a9 progressBlock:(id)a10
{
  id v14;
  id v15;
  void (**v16)(void *, _BYTE *, double);
  double v17;
  double Current;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PGMeaningfulEventProcessorCache *v24;
  PGGraphMomentNodeCollection *v25;
  char **v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  PGMeaningQuestion *v51;
  uint64_t v52;
  unint64_t v53;
  double v54;
  id v55;
  id v56;
  id v58;
  id v59;
  void *v60;
  id v61;
  id obj;
  uint64_t v63;
  char *v64;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  PGMeaningfulEventProcessorCache *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *context;
  char v81;
  uint64_t v82;
  id v84;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  unsigned __int8 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  void *v101;
  uint8_t v102[128];
  uint8_t buf[4];
  int v104;
  __int16 v105;
  const char *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v84 = a6;
  v78 = a8;
  v77 = a9;
  v15 = a10;
  v16 = (void (**)(void *, _BYTE *, double))_Block_copy(v15);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  if (v16)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v98 = 0;
      v16[2](v16, &v98, 0.0);
      if (v98)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v104 = 225;
          v105 = 2080;
          v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Quest"
                 "ions/Survey/Meaning/PGMeaningQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v19 = v60;
        goto LABEL_82;
      }
      v17 = Current;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v82 = objc_msgSend(v84, "count");
    v21 = objc_alloc(MEMORY[0x1E0D77E08]);
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v21, "initWithPhotoLibrary:", v23);

    v24 = [PGMeaningfulEventProcessorCache alloc];
    v25 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v14, v78);
    v76 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:](v24, "initWithMomentNodes:", v25);

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v14;
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
    if (v75)
    {
      v81 = 0;
      v69 = *(_QWORD *)v95;
      v26 = &selRef_collidesWithPersonWithLocalIdentifier_;
      v61 = v60;
      v58 = v15;
      while (2)
      {
        v27 = 0;
        v64 = v26[15];
        do
        {
          if (*(_QWORD *)v95 != v69)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x1CAA4EB2C]();
          -[PGMeaningQuestionFactory meaningLabelsForWhichToGenerateQuestions](self, "meaningLabelsForWhichToGenerateQuestions");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGMeaningQuestionFactory _inferMeaningLabelsForMomentNode:meaningLabels:graph:sceneTaxonomy:cache:](self, "_inferMeaningLabelsForMomentNode:meaningLabels:graph:sceneTaxonomy:cache:", v28, v30, v78, v77, v76);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "count"))
          {
            v79 = v27;
            context = v29;
            if (a4)
            {
              -[PGSurveyQuestionFactory representativeAssetsFromMomentNode:curationContext:](self, "representativeAssetsFromMomentNode:curationContext:", v28, v66);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "allObjects");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              -[PGSurveyQuestionFactory assetsFromMomentNode:curationContext:](self, "assetsFromMomentNode:curationContext:", v28, v66);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v34 = 1;
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v35;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "sortedArrayUsingDescriptors:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "allObjects");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "sortedArrayUsingSelector:", v64);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            v40 = v37;
            v67 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
            if (v67)
            {
              v41 = *(_QWORD *)v91;
              v73 = v31;
              v74 = v30;
              v71 = v39;
              v72 = v33;
              v70 = v40;
              v63 = *(_QWORD *)v91;
              do
              {
                v42 = 0;
                do
                {
                  if (*(_QWORD *)v91 != v41)
                    objc_enumerationMutation(v40);
                  v68 = v42;
                  v43 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v42);
                  v86 = 0u;
                  v87 = 0u;
                  v88 = 0u;
                  v89 = 0u;
                  v44 = v39;
                  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
                  if (!v45)
                    goto LABEL_41;
                  v46 = v45;
                  v47 = *(_QWORD *)v87;
                  while (2)
                  {
                    for (i = 0; i != v46; ++i)
                    {
                      if (*(_QWORD *)v87 != v47)
                        objc_enumerationMutation(v44);
                      v49 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
                      objc_msgSend(v43, "uuid");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = -[PGMeaningQuestion initWithMeaningLabel:assetUUID:localFactoryScore:]([PGMeaningQuestion alloc], "initWithMeaningLabel:assetUUID:localFactoryScore:", v49, v50, a5);
                      if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v51, v84))
                      {
                        objc_msgSend(v20, "addObject:", v51);
                      }
                      v52 = objc_msgSend(v20, "count");
                      if (v16)
                      {
                        v53 = v52;
                        v54 = CFAbsoluteTimeGetCurrent();
                        if (v54 - v17 >= 0.01)
                        {
                          v98 = 0;
                          v16[2](v16, &v98, (double)v53 / (double)a7);
                          if (v98 | v81 & 1)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 67109378;
                              v104 = 263;
                              v105 = 2080;
                              v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                            }
                            v61 = v60;
                            v81 = 1;
                            goto LABEL_56;
                          }
                          v81 = 0;
                        }
                        else
                        {
                          v54 = v17;
                        }
                        if (objc_msgSend(v20, "count") + v82 >= a7)
                        {
                          v17 = CFAbsoluteTimeGetCurrent();
                          if (v17 - v54 < 0.01)
                          {
                            v17 = v54;
                            goto LABEL_54;
                          }
                          v98 = 0;
                          v16[2](v16, &v98, 1.0);
                          if (v98 | v81 & 1)
                          {
                            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 67109378;
                              v104 = 267;
                              v105 = 2080;
                              v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
                              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                            }
                            v61 = v60;
                            v81 = 1;
                          }
                          else
                          {
                            v81 = 0;
LABEL_54:
                            v61 = v20;
                          }
                          v54 = v17;
LABEL_56:
                          v31 = v73;
                          v30 = v74;
                          v39 = v71;
                          v33 = v72;
                          v40 = v70;

                          v34 = 0;
                          v17 = v54;
                          goto LABEL_57;
                        }
                        v17 = v54;
                      }
                      else if (objc_msgSend(v20, "count") + v82 >= a7)
                      {
                        goto LABEL_54;
                      }

                    }
                    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
                    if (v46)
                      continue;
                    break;
                  }
LABEL_41:

                  v42 = v68 + 1;
                  v31 = v73;
                  v30 = v74;
                  v39 = v71;
                  v33 = v72;
                  v40 = v70;
                  v41 = v63;
                }
                while (v68 + 1 != v67);
                v34 = 1;
                v67 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
              }
              while (v67);
            }
LABEL_57:

            if (!v34)
            {

              objc_autoreleasePoolPop(context);
              v15 = v58;
              goto LABEL_80;
            }
            v27 = v79;
            v29 = context;
          }

          objc_autoreleasePoolPop(v29);
          ++v27;
        }
        while (v27 != v75);
        v15 = v58;
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        v26 = &selRef_collidesWithPersonWithLocalIdentifier_;
        if (v75)
          continue;
        break;
      }
    }
    else
    {
      v81 = 0;
    }

    if (v16 && CFAbsoluteTimeGetCurrent() - v17 >= 0.01 && (v98 = 0, v16[2](v16, &v98, 1.0), v98 | v81 & 1))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v104 = 275;
        v105 = 2080;
        v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questio"
               "ns/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v56 = v60;
    }
    else
    {
      v56 = v20;
    }
    v61 = v56;
LABEL_80:

  }
  else
  {
    if (v16 && CFAbsoluteTimeGetCurrent() - v17 >= 0.01 && (v98 = 0, v16[2](v16, &v98, 1.0), v98))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v104 = 232;
        v105 = 2080;
        v106 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questio"
               "ns/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v55 = v60;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v55 = (id)objc_claimAutoreleasedReturnValue();
    }
    v61 = v55;
  }

  v14 = v59;
  v19 = v61;
LABEL_82:

  return v19;
}

- (NSSet)meaningLabelsForWhichToGenerateQuestions
{
  NSSet *meaningLabelsForWhichToGenerateQuestions;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;
  _QWORD v9[25];

  v9[24] = *MEMORY[0x1E0C80C00];
  meaningLabelsForWhichToGenerateQuestions = self->_meaningLabelsForWhichToGenerateQuestions;
  if (!meaningLabelsForWhichToGenerateQuestions)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = CFSTR("Wedding");
    v9[1] = CFSTR("Birthday");
    v9[2] = CFSTR("Anniversary");
    v9[3] = CFSTR("Celebration");
    v9[4] = CFSTR("Concert");
    v9[5] = CFSTR("Festival");
    v9[6] = CFSTR("Theater");
    v9[7] = CFSTR("Dance");
    v9[8] = CFSTR("Museum");
    v9[9] = CFSTR("AmusementPark");
    v9[10] = CFSTR("Performance");
    v9[11] = CFSTR("Hiking");
    v9[12] = CFSTR("Climbing");
    v9[13] = CFSTR("Beaching");
    v9[14] = CFSTR("SportEvent");
    v9[15] = CFSTR("WinterSport");
    v9[16] = CFSTR("Diving");
    v9[17] = CFSTR("Lunch");
    v9[18] = CFSTR("Dinner");
    v9[19] = CFSTR("Breakfast");
    v9[20] = CFSTR("Restaurant");
    v9[21] = CFSTR("NightOut");
    v9[22] = CFSTR("Entertainment");
    v9[23] = CFSTR("HolidayEvent");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_meaningLabelsForWhichToGenerateQuestions;
    self->_meaningLabelsForWhichToGenerateQuestions = v6;

    meaningLabelsForWhichToGenerateQuestions = self->_meaningLabelsForWhichToGenerateQuestions;
  }
  return meaningLabelsForWhichToGenerateQuestions;
}

- (id)_inferMeaningLabelsForMomentNode:(id)a3 meaningLabels:(id)a4 graph:(id)a5 sceneTaxonomy:(id)a6 cache:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v12 = a4;
  v28 = a5;
  v13 = a6;
  v14 = a7;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serviceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v12;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v34 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMeaningfulEventLooseRequiredCriteriaFactory requiredCriteriaForIdentifiers:graph:sceneTaxonomy:](PGMeaningfulEventLooseRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:graph:sceneTaxonomy:", v22, v28, v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGMeaningfulEventProcessor processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:](PGMeaningfulEventProcessor, "processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:", v23, v29, v14, v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
          objc_msgSend(v27, "addObject:", v21);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v18);
  }

  return v27;
}

- (id)_looseCriteriasForCriteria:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PGMeaningfulEventSceneCollectionTrait *v11;
  void *v12;
  PGMeaningfulEventSceneCollectionTrait *v13;
  PGMeaningfulEventRequiredCriteria *v14;
  void *v15;
  int v16;
  PGMeaningfulEventCollectionTrait *v17;
  void *v18;
  void *v19;
  PGMeaningfulEventCollectionTrait *v20;
  PGMeaningfulEventRequiredCriteria *v21;
  void *v22;
  int v23;
  PGMeaningfulEventCollectionTrait *v24;
  void *v25;
  void *v26;
  PGMeaningfulEventCollectionTrait *v27;
  PGMeaningfulEventRequiredCriteria *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  PGMeaningfulEventCollectionTrait *v35;
  PGGraphDateNodeCollection *v36;
  PGMeaningfulEventCollectionTrait *v37;
  PGMeaningfulEventCollectionTrait *v38;
  void *v39;
  void *v40;
  PGMeaningfulEventCollectionTrait *v41;
  PGMeaningfulEventRequiredCriteria *v42;
  void *v43;
  int v44;
  PGMeaningfulEventCollectionTrait *v45;
  void *v46;
  void *v47;
  PGMeaningfulEventCollectionTrait *v48;
  PGMeaningfulEventRequiredCriteria *v49;
  void *v50;
  int v51;
  PGMeaningfulEventLocationMobilityTrait *v52;
  void *v53;
  PGMeaningfulEventLocationMobilityTrait *v54;
  PGMeaningfulEventRequiredCriteria *v55;
  void *v56;
  int v57;
  PGMeaningfulEventCollectionTrait *v58;
  void *v59;
  void *v60;
  PGMeaningfulEventCollectionTrait *v61;
  PGMeaningfulEventRequiredCriteria *v62;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scenesTrait");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isMatchingRequired"))
  {
    v11 = [PGMeaningfulEventSceneCollectionTrait alloc];
    objc_msgSend(v10, "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PGMeaningfulEventSceneCollectionTrait initWithNodes:](v11, "initWithNodes:", v12);

    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfHighConfidenceAssets:](v13, "setMinimumNumberOfHighConfidenceAssets:", 1);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumNumberOfNegativeHighConfidenceAssets:](v13, "setMinimumNumberOfNegativeHighConfidenceAssets:", 0);
    -[PGMeaningfulEventSceneCollectionTrait setMinimumRatioOfHighConfidenceAssets:](v13, "setMinimumRatioOfHighConfidenceAssets:", 0.0);
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 0.00001);
    v14 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setScenesTrait:](v14, "setScenesTrait:", v13);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v14, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v14);

  }
  objc_msgSend(v6, "roisTrait");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isMatchingRequired");

  if (v16)
  {
    v17 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v6, "roisTrait");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v17, "initWithNodes:", v19);

    -[PGMeaningfulEventTrait setMinimumScore:](v20, "setMinimumScore:", 0.00001);
    v21 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setRoisTrait:](v21, "setRoisTrait:", v20);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v21, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v21);

  }
  objc_msgSend(v6, "poisTrait");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isMatchingRequired");

  if (v23)
  {
    v24 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v6, "poisTrait");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "nodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v24, "initWithNodes:", v26);

    -[PGMeaningfulEventTrait setMinimumScore:](v27, "setMinimumScore:", 0.00001);
    v28 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setPoisTrait:](v28, "setPoisTrait:", v27);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v28, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v28);

  }
  objc_msgSend(v6, "datesTrait");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isMatchingRequired"))
  {
    objc_msgSend(v6, "peopleTrait");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isMatchingRequired");

    if (!v31)
      goto LABEL_11;
    objc_msgSend(v6, "datesTrait");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "nodes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "set");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningQuestionFactory _expandedDateNodesFromDateNodes:](self, "_expandedDateNodesFromDateNodes:", v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = [PGMeaningfulEventCollectionTrait alloc];
    v36 = -[MAElementCollection initWithSet:graph:]([PGGraphDateNodeCollection alloc], "initWithSet:graph:", v29, v7);
    v37 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v35, "initWithNodes:", v36);

    -[PGMeaningfulEventTrait setMinimumScore:](v37, "setMinimumScore:", 0.00001);
    v38 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v6, "peopleTrait");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "nodes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v38, "initWithNodes:", v40);

    -[PGMeaningfulEventTrait setMinimumScore:](v41, "setMinimumScore:", 0.00001);
    v42 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setDatesTrait:](v42, "setDatesTrait:", v37);
    -[PGMeaningfulEventCriteria setPeopleTrait:](v42, "setPeopleTrait:", v41);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v42, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v42);

  }
LABEL_11:
  objc_msgSend(v6, "socialGroupsTrait");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isMatchingRequired");

  if (v44)
  {
    v45 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v6, "socialGroupsTrait");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "nodes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v45, "initWithNodes:", v47);

    -[PGMeaningfulEventTrait setMinimumScore:](v48, "setMinimumScore:", 0.00001);
    v49 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setSocialGroupsTrait:](v49, "setSocialGroupsTrait:", v48);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v49, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v49);

  }
  objc_msgSend(v6, "locationMobilityTrait");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isMatchingRequired");

  if (v51)
  {
    v52 = [PGMeaningfulEventLocationMobilityTrait alloc];
    objc_msgSend(v6, "locationMobilityTrait");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[PGMeaningfulEventLocationMobilityTrait initWithMobility:](v52, "initWithMobility:", objc_msgSend(v53, "value"));

    -[PGMeaningfulEventTrait setMinimumScore:](v54, "setMinimumScore:", 0.00001);
    v55 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setLocationMobilityTrait:](v55, "setLocationMobilityTrait:", v54);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v55, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v55);

  }
  objc_msgSend(v6, "publicEventCategoriesTrait");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isMatchingRequired");

  if (v57)
  {
    v58 = [PGMeaningfulEventCollectionTrait alloc];
    objc_msgSend(v6, "publicEventCategoriesTrait");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "nodes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v58, "initWithNodes:", v60);

    -[PGMeaningfulEventTrait setMinimumScore:](v61, "setMinimumScore:", 0.00001);
    v62 = -[PGMeaningfulEventRequiredCriteria initWithIdentifier:minimumScore:graph:]([PGMeaningfulEventRequiredCriteria alloc], "initWithIdentifier:minimumScore:graph:", v9, v7, 0.00001);
    -[PGMeaningfulEventCriteria setPublicEventCategoriesTrait:](v62, "setPublicEventCategoriesTrait:", v61);
    -[PGMeaningfulEventRequiredCriteria setMustBeInteresting:](v62, "setMustBeInteresting:", 0);
    objc_msgSend(v8, "addObject:", v62);

  }
  return v8;
}

- (id)_expandedDateNodesFromDateNodes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(v6);
        -[PGMeaningQuestionFactory _expandedDateNodesFromDateNode:](self, "_expandedDateNodesFromDateNode:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_expandedDateNodesFromDateNode:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  double v16;
  id v17;
  id v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D4B148], "isWeekendDate:", v5))
  {
    v18 = 0;
    v19 = 0.0;
    objc_msgSend(MEMORY[0x1E0D4B148], "rangeOfWeekendLocalStartDate:interval:containingDate:", &v18, &v19, v5);
    v6 = v19;
    v7 = v18;
    objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -2, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0.0;
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v17, &v19, 4, v5);
    v9 = v17;
    v15 = 0;
    v16 = 0.0;
    objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v15, &v16, 0, v5);
    objc_msgSend(v15, "dateByAddingTimeInterval:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningQuestionFactory _dateNodesFromStartDate:toEndDate:inGraph:](self, "_dateNodesFromStartDate:toEndDate:inGraph:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_dateNodesFromStartDate:(id)a3 toEndDate:(id)a4 inGraph:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0CB3588];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithStartDate:endDate:", v10, v9);

  objc_msgSend(v8, "dateNodesForLocalDateInterval:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setMeaningLabelsForWhichToGenerateQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_meaningLabelsForWhichToGenerateQuestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningLabelsForWhichToGenerateQuestions, 0);
}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v10 + 24) = Current,
        v35 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    v23 = v7;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      v16 = *MEMORY[0x1E0D78060];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v18, "additionalInfo", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if (objc_msgSend(v18, "state") == 2)
            {
              objc_msgSend(v11, "addObject:", v20);
            }
            else if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v20))
            {
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v20);
            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

    v7 = v23;
    if (objc_msgSend(v11, "count"))
    {
      v21 = *(void **)(a1 + 40);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_2;
      v25[3] = &unk_1E842F588;
      v26 = v11;
      v27 = v24;
      v28 = *(id *)(a1 + 48);
      v29 = v23;
      v30 = *(id *)(a1 + 56);
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v25);

    }
    v8 = v22;
  }

}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_183(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "questionVersion"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *(id *)(a1 + 56);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
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
        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setState:", 2);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v9);
  }

}

void __77__PGMeaningQuestionFactory__updateMeaningQuestionsIfNeededWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  PGMeaningQuestion *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    }
    else
    {
      v7 = -[PGMeaningQuestion initWithConfirmedMeaningLabel:assetUUID:]([PGMeaningQuestion alloc], "initWithConfirmedMeaningLabel:assetUUID:", v8, *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);

    }
  }

}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double Current;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  double v31;
  char v32;
  double v33;
  char v34;
  double v35;
  char v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint8_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint8_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _QWORD v51[4];
  id v52;
  uint8_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint8_t v65[4];
  int v66;
  __int16 v67;
  const char *v68;
  uint8_t buf[8];
  __int128 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _Block_copy(*(const void **)(a1 + 48));
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  if (!v4
    || (v5 = CFAbsoluteTimeGetCurrent(), v5 - v58[3] < 0.01)
    || (v58[3] = v5,
        v65[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v4 + 2))(v4, v65, 0.0),
        v6 = *((_BYTE *)v62 + 24) | v65[0],
        (*((_BYTE *)v62 + 24) = v6) == 0))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v70 = buf;
    *((_QWORD *)&v70 + 1) = 0x2020000000;
    v71 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "ignoreExistingQuestions") & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_170;
      v51[3] = &unk_1E842F560;
      v53 = buf;
      v52 = v4;
      v54 = &v57;
      v55 = &v61;
      v56 = 0x3F847AE147AE147BLL;
      objc_msgSend(v7, "_updateMeaningQuestionsIfNeededWithProgressBlock:", v51);

    }
    if (*((_BYTE *)v62 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_34:
        _Block_object_dispose(buf, 8);
        goto LABEL_35;
      }
      *(_DWORD *)v65 = 67109378;
      v66 = 63;
      v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      v8 = MEMORY[0x1E0C81028];
LABEL_11:
      _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v65, 0x12u);
      goto LABEL_34;
    }
    if (!*(_QWORD *)(a1 + 56))
    {
      if (!v4)
        goto LABEL_34;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v58[3] < 0.01)
        goto LABEL_34;
      v58[3] = Current;
      v50 = 0;
      (*((void (**)(void *, char *, double))v4 + 2))(v4, &v50, 1.0);
      v22 = *((_BYTE *)v62 + 24) | v50;
      *((_BYTE *)v62 + 24) = v22;
      if (!v22 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_34;
      *(_DWORD *)v65 = 67109378;
      v66 = 67;
      v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_11;
    }
    objc_msgSend(v3, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    objc_msgSend(v9, "meaningfulMomentNodesSortedByDate");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 56);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_173;
    v44[3] = &unk_1E842F560;
    v46 = buf;
    v15 = v4;
    v45 = v15;
    v47 = &v57;
    v48 = &v61;
    v49 = 0x3F847AE147AE147BLL;
    v37 = (void *)v11;
    v16 = v12;
    v17 = v14;
    v18 = v9;
    v19 = (void *)v10;
    objc_msgSend(v13, "_questionsToAddFromMomentNodes:useRepresentativeAssets:localFactoryScore:alreadyGeneratedQuestions:limit:graph:sceneTaxonomy:progressBlock:", v11, 1, v16, v17, v9, v10, 1.0, v44);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v62 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 67109378;
        v66 = 80;
        v67 = 2080;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v65, 0x12u);
      }
      goto LABEL_33;
    }
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v20);
    v23 = objc_msgSend(*(id *)(a1 + 40), "count");
    v24 = *(_QWORD *)(a1 + 56);
    if (v23 >= v24)
    {
      if (v4)
      {
        v31 = CFAbsoluteTimeGetCurrent();
        v19 = (void *)v10;
        if (v31 - v58[3] >= 0.01)
        {
          v58[3] = v31;
          v50 = 0;
          (*((void (**)(id, char *, double))v15 + 2))(v15, &v50, 1.0);
          v32 = *((_BYTE *)v62 + 24) | v50;
          *((_BYTE *)v62 + 24) = v32;
          if (v32)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v65 = 67109378;
              v66 = 84;
              v67 = 2080;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Qu"
                    "estions/Survey/Meaning/PGMeaningQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v65, 0x12u);
            }
          }
        }
      }
      else
      {
        v19 = (void *)v10;
      }
      goto LABEL_33;
    }
    v26 = *(void **)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_174;
    v38[3] = &unk_1E842F560;
    v40 = buf;
    v27 = v15;
    v39 = v27;
    v41 = &v57;
    v42 = &v61;
    v43 = 0x3F847AE147AE147BLL;
    v28 = v24;
    v19 = (void *)v10;
    objc_msgSend(v26, "_questionsToAddFromMomentNodes:useRepresentativeAssets:localFactoryScore:alreadyGeneratedQuestions:limit:graph:sceneTaxonomy:progressBlock:", v37, 0, v25, v28, v18, v10, 0.5, v38);
    v29 = objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v62 + 24))
    {
      v9 = v18;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_27:

        v20 = (void *)v29;
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)v65 = 67109378;
      v66 = 92;
      v67 = 2080;
      v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGMeaningQuestionFactory.m";
      v30 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v29);
      v9 = v18;
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
      {
        if (!v4)
          goto LABEL_27;
        v35 = CFAbsoluteTimeGetCurrent();
        if (v35 - v58[3] < 0.01)
          goto LABEL_27;
        v58[3] = v35;
        v50 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v50, 1.0);
        v36 = *((_BYTE *)v62 + 24) | v50;
        *((_BYTE *)v62 + 24) = v36;
        if (!v36 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_27;
        *(_DWORD *)v65 = 67109378;
        v66 = 96;
        v67 = 2080;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        v30 = MEMORY[0x1E0C81028];
      }
      else
      {
        if (!v4)
          goto LABEL_27;
        v33 = CFAbsoluteTimeGetCurrent();
        if (v33 - v58[3] < 0.01)
          goto LABEL_27;
        v58[3] = v33;
        v50 = 0;
        (*((void (**)(id, char *, double))v27 + 2))(v27, &v50, 1.0);
        v34 = *((_BYTE *)v62 + 24) | v50;
        *((_BYTE *)v62 + 24) = v34;
        if (!v34 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_27;
        *(_DWORD *)v65 = 67109378;
        v66 = 100;
        v67 = 2080;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGMeaningQuestionFactory.m";
        v30 = MEMORY[0x1E0C81028];
      }
    }
    _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v65, 0x12u);
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 53;
    LOWORD(v70) = 2080;
    *(_QWORD *)((char *)&v70 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/Meaning/PGMeaningQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_35:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_170(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.2;
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.2 + 0.2;
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __69__PGMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_174(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.2 + 0.6;
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end

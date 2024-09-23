@implementation PGPersonActivityMeaningQuestionFactory

- (unsigned)questionType
{
  return 19;
}

- (int64_t)questionOptions
{
  return 0x40000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PGPersonActivityMeaningQuestionFactory *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (id)_questionsToAddFromMomentNodes:(id)a3 localFactoryScore:(double)a4 alreadyGeneratedQuestions:(id)a5 limit:(unint64_t)a6 graph:(id)a7 progressBlock:(id)a8
{
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double Current;
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  PGPersonActivityMeaningQuestion *v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  int v35;
  void *v36;
  NSObject *v37;
  id v38;
  __int128 v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  char v51;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  unsigned __int8 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v54 = a5;
  v47 = a7;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(a8);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0.0;
  if (v13)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v63 = 0;
      v13[2](v13, &v63, 0.0);
      if (v63)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v67 = 85;
          v68 = 2080;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questi"
                "ons/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = v41;
        goto LABEL_70;
      }
      v14 = Current;
    }
  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!objc_msgSend(v12, "count"))
  {
    if (!v13 || CFAbsoluteTimeGetCurrent() - v14 < 0.01 || (v63 = 0, v13[2](v13, &v63, 1.0), !v63))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_66;
    *(_DWORD *)buf = 67109378;
    v67 = 91;
    v68 = 2080;
    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
    v37 = MEMORY[0x1E0C81028];
    goto LABEL_65;
  }
  v18 = objc_msgSend(v54, "count");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[PGPersonActivityMeaningQuestionFactory personActivityMeaningLabelsForWhichToGenerateQuestions](self, "personActivityMeaningLabelsForWhichToGenerateQuestions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v46)
  {
    v51 = 0;
    v45 = *(_QWORD *)v60;
    *(_QWORD *)&v19 = 67109378;
    v40 = v19;
    v43 = v12;
    v44 = v41;
    while (2)
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v60 != v45)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabel:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabel:inGraph:", v21, v47, v40);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "featureNodeCollection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphMomentFeaturesEdgeCollection momentFeaturesEdgesFromMomentNodes:toFeatureNodes:](PGGraphMomentFeaturesEdgeCollection, "momentFeaturesEdgesFromMomentNodes:toFeatureNodes:", v12, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v24;
        objc_msgSend(v24, "allRelevantAssetUUIDs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v27)
        {
          v28 = v27;
          v48 = v22;
          v49 = i;
          v29 = *(_QWORD *)v56;
LABEL_16:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(v26);
            v31 = -[PGPersonActivityMeaningQuestion initWithMeaningLabel:assetUUID:localFactoryScore:]([PGPersonActivityMeaningQuestion alloc], "initWithMeaningLabel:assetUUID:localFactoryScore:", v21, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v30), a4);
            if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](self, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v31, v54))
            {
              objc_msgSend(v17, "addObject:", v31);
            }
            v32 = objc_msgSend(v17, "count");
            if (v13)
            {
              v33 = v32;
              v34 = CFAbsoluteTimeGetCurrent();
              if (v34 - v14 >= 0.01)
              {
                v63 = 0;
                v13[2](v13, &v63, (double)v33 / (double)a6);
                if (v63 | v51 & 1)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v40;
                    v67 = 110;
                    v68 = 2080;
                    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  v44 = v41;
                  v51 = 1;
                  goto LABEL_47;
                }
                v51 = 0;
              }
              else
              {
                v34 = v14;
              }
              if (objc_msgSend(v17, "count") + v18 >= a6)
              {
                v14 = CFAbsoluteTimeGetCurrent();
                if (v14 - v34 < 0.01)
                {
                  v14 = v34;
                  goto LABEL_45;
                }
                v63 = 0;
                v13[2](v13, &v63, 1.0);
                if (v63 | v51 & 1)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v40;
                    v67 = 113;
                    v68 = 2080;
                    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  v44 = v41;
                  v51 = 1;
                }
                else
                {
                  v51 = 0;
LABEL_45:
                  v44 = v17;
                }
                v34 = v14;
LABEL_47:
                v12 = v43;
                i = v49;
                v36 = v50;

                v35 = 0;
                v14 = v34;
                v22 = v48;
                goto LABEL_48;
              }
              v14 = v34;
            }
            else if (objc_msgSend(v17, "count") + v18 >= a6)
            {
              goto LABEL_45;
            }

            if (v28 == ++v30)
            {
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
              if (v28)
                goto LABEL_16;
              v35 = 1;
              v12 = v43;
              v22 = v48;
              i = v49;
              goto LABEL_34;
            }
          }
        }
        v35 = 1;
LABEL_34:
        v36 = v50;
LABEL_48:

        if (!v35)
        {

          v16 = v44;
          goto LABEL_69;
        }
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (v46)
        continue;
      break;
    }
  }
  else
  {
    v51 = 0;
  }

  if (v13)
  {
    if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
    {
      v63 = 0;
      v13[2](v13, &v63, 1.0);
      if (v63 | v51 & 1)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_66:
          v38 = v41;
          goto LABEL_68;
        }
        *(_DWORD *)buf = 67109378;
        v67 = 119;
        v68 = 2080;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        v37 = MEMORY[0x1E0C81028];
LABEL_65:
        _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_66;
      }
    }
  }
  v38 = v17;
LABEL_68:
  v16 = v38;
LABEL_69:

LABEL_70:
  return v16;
}

- (NSSet)personActivityMeaningLabelsForWhichToGenerateQuestions
{
  NSSet *personActivityMeaningLabelsForWhichToGenerateQuestions;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  personActivityMeaningLabelsForWhichToGenerateQuestions = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
  if (!personActivityMeaningLabelsForWhichToGenerateQuestions)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = CFSTR("PersonBeachWater");
    v9[1] = CFSTR("PersonToys");
    v9[2] = CFSTR("PersonPlayground");
    v9[3] = CFSTR("PersonActionSwimming");
    v9[4] = CFSTR("PersonActionPlayingOnASwing");
    v9[5] = CFSTR("PersonActionPlayingOnASlide");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
    self->_personActivityMeaningLabelsForWhichToGenerateQuestions = v6;

    personActivityMeaningLabelsForWhichToGenerateQuestions = self->_personActivityMeaningLabelsForWhichToGenerateQuestions;
  }
  return personActivityMeaningLabelsForWhichToGenerateQuestions;
}

- (void)setPersonActivityMeaningLabelsForWhichToGenerateQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_personActivityMeaningLabelsForWhichToGenerateQuestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personActivityMeaningLabelsForWhichToGenerateQuestions, 0);
}

void __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double Current;
  NSObject *v6;
  _QWORD *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  char v23;
  double v24;
  char v25;
  double v26;
  char v27;
  id v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, double);
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = _Block_copy(*(const void **)(a1 + 48));
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v30 = (void (**)(_QWORD, _QWORD, double))v4;
  if (!v4)
  {
    v7 = (_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_18;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v38[3] < 0.01)
  {
    if (*((_BYTE *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v46 = 48;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        v6 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  v38[3] = Current;
  v36 = 0;
  ((void (**)(_QWORD, char *, double))v30)[2](v30, &v36, 0.0);
  v8 = *((_BYTE *)v42 + 24) | v36;
  *((_BYTE *)v42 + 24) = v8;
  if (!v8)
  {
LABEL_12:
    v7 = (_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 56))
    {
      v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v38[3] >= 0.01)
      {
        v38[3] = v24;
        v36 = 0;
        ((void (**)(_QWORD, char *, double))v30)[2](v30, &v36, 1.0);
        v25 = *((_BYTE *)v42 + 24) | v36;
        *((_BYTE *)v42 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 51;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
            v6 = MEMORY[0x1E0C81028];
            goto LABEL_11;
          }
        }
      }
      goto LABEL_18;
    }
LABEL_13:
    objc_msgSend(v3, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMeaningfulEventRequiredCriteriaFactory availablePersonActivityMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availablePersonActivityMeaningLabels");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabels:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabels:inGraph:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)v10;
    v13 = v3;
    v14 = v12;
    objc_msgSend(v12, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 56);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_173;
    v31[3] = &unk_1E8434F30;
    v28 = v30;
    v32 = v28;
    v33 = &v37;
    v34 = &v41;
    v35 = 0x3F847AE147AE147BLL;
    objc_msgSend(v16, "_questionsToAddFromMomentNodes:localFactoryScore:alreadyGeneratedQuestions:limit:graph:progressBlock:", v15, v17, v18, v9, v31, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v42 + 24))
    {
      v3 = v13;
      v20 = v29;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109378;
      v46 = 65;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
      v21 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v19);
      v3 = v13;
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *v7)
      {
        v20 = v29;
        if (!v30)
          goto LABEL_17;
        v26 = CFAbsoluteTimeGetCurrent();
        if (v26 - v38[3] < 0.01)
          goto LABEL_17;
        v38[3] = v26;
        v36 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v36, 1.0);
        v27 = *((_BYTE *)v42 + 24) | v36;
        *((_BYTE *)v42 + 24) = v27;
        if (!v27 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_DWORD *)buf = 67109378;
        v46 = 68;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        v21 = MEMORY[0x1E0C81028];
      }
      else
      {
        v20 = v29;
        if (!v30)
          goto LABEL_17;
        v22 = CFAbsoluteTimeGetCurrent();
        if (v22 - v38[3] < 0.01)
          goto LABEL_17;
        v38[3] = v22;
        v36 = 0;
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v36, 1.0);
        v23 = *((_BYTE *)v42 + 24) | v36;
        *((_BYTE *)v42 + 24) = v23;
        if (!v23 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_17;
        *(_DWORD *)buf = 67109378;
        v46 = 72;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
        v21 = MEMORY[0x1E0C81028];
      }
    }
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v46 = 47;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/Su"
          "rvey/Person Activity Meaning/PGPersonActivityMeaningQuestionFactory.m";
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
LABEL_18:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

}

void __83__PGPersonActivityMeaningQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end

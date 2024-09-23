@implementation PGExhaustiveMomentLabellingQuestionFactory

- (unsigned)questionType
{
  return 25;
}

- (int64_t)questionOptions
{
  return 0x800000;
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
  PGExhaustiveMomentLabellingQuestionFactory *v17;
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
  v15 = __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (id)_questionsToAddWithMomentNodes:(id)a3 graph:(id)a4 localFactoryScore:(double)a5 limit:(unint64_t)a6 sceneTaxonomy:(id)a7 alreadyGeneratedQuestions:(id)a8 progressBlock:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PGMeaningfulEventProcessorCache *v22;
  id v23;
  PGMeaningfulEventProcessorCache *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double Current;
  char v30;
  id v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  char v37;
  _QWORD v38[5];
  id v39;
  PGMeaningfulEventProcessorCache *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _DWORD buf[2];
  __int16 v60;
  const char *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v34 = a9;
  v19 = _Block_copy(v34);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x2020000000;
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "count");
  v22 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:]([PGMeaningfulEventProcessorCache alloc], "initWithMomentNodes:", v36);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __161__PGExhaustiveMomentLabellingQuestionFactory__questionsToAddWithMomentNodes_graph_localFactoryScore_limit_sceneTaxonomy_alreadyGeneratedQuestions_progressBlock___block_invoke;
  v38[3] = &unk_1E842BD38;
  v38[4] = self;
  v23 = v16;
  v39 = v23;
  v24 = v22;
  v40 = v24;
  v25 = v17;
  v41 = v25;
  v47 = a5;
  v26 = v18;
  v42 = v26;
  v27 = v20;
  v43 = v27;
  v48 = a6;
  v28 = v19;
  v44 = v28;
  v45 = &v51;
  v49 = 0x3F847AE147AE147BLL;
  v46 = &v55;
  v50 = v21;
  objc_msgSend(v36, "enumerateNodesUsingBlock:", v38);
  if (v28
    && (Current = CFAbsoluteTimeGetCurrent(), Current - v52[3] >= 0.01)
    && (v52[3] = Current,
        v37 = 0,
        (*((void (**)(id, char *, double))v28 + 2))(v28, &v37, 1.0),
        v30 = *((_BYTE *)v56 + 24) | v37,
        (*((_BYTE *)v56 + 24) = v30) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf[0] = 67109378;
      buf[1] = 128;
      v60 = 2080;
      v61 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    v31 = v35;
  }
  else
  {
    v31 = v27;
  }
  v32 = v31;

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v32;
}

- (id)_inferMeaningLabelsForMomentNode:(id)a3 graph:(id)a4 cache:(id)a5 meaningLabels:(id)a6 sceneTaxonomy:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t j;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  id obj;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v44 = a5;
  v12 = a6;
  v43 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  obj = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v56 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v60 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMeaningfulEventLooseRequiredCriteriaFactory requiredCriteriaForIdentifiers:graph:sceneTaxonomy:](PGMeaningfulEventLooseRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:graph:sceneTaxonomy:", v21, v45, v43);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGMeaningfulEventProcessor processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:](PGMeaningfulEventProcessor, "processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:", v22, v46, v44, v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v52;
          v27 = -2147483650.0;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v52 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "score");
              if (v27 < v29)
                v27 = v29;
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v25);
          if (v27 != -2147483650.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v30, v20);

          }
        }

      }
      v15 = obj;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v17);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v32 = objc_msgSend(v41, "count");
  v33 = MEMORY[0x1E0C809B0];
  if (v32)
  {
    objc_msgSend(v41, "keysSortedByValueUsingSelector:", sel_compare_);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reverseObjectEnumerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v33;
    v49[1] = 3221225472;
    v49[2] = __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke;
    v49[3] = &unk_1E842BD60;
    v50 = v31;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v49);

  }
  if ((unint64_t)objc_msgSend(v31, "count") <= 4)
  {
    do
    {
      objc_msgSend(obj, "objectAtIndex:", arc4random_uniform(objc_msgSend(obj, "count")));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v37);

    }
    while ((unint64_t)objc_msgSend(v31, "count") < 5);
  }
  objc_msgSend(obj, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v33;
  v47[1] = 3221225472;
  v47[2] = __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke_2;
  v47[3] = &unk_1E842BD60;
  v39 = v31;
  v48 = v39;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v47);

  objc_msgSend(v39, "addObject:", PGExhaustiveMomentLabellingNoneOfTheseAnswerString);
  return v39;
}

- (id)_meaningLabelsForWhichToGenerateQuestions
{
  _QWORD v3[25];

  v3[24] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Wedding");
  v3[1] = CFSTR("Birthday");
  v3[2] = CFSTR("Anniversary");
  v3[3] = CFSTR("Celebration");
  v3[4] = CFSTR("Concert");
  v3[5] = CFSTR("Festival");
  v3[6] = CFSTR("Theater");
  v3[7] = CFSTR("Dance");
  v3[8] = CFSTR("Museum");
  v3[9] = CFSTR("AmusementPark");
  v3[10] = CFSTR("Performance");
  v3[11] = CFSTR("Hiking");
  v3[12] = CFSTR("Climbing");
  v3[13] = CFSTR("Beaching");
  v3[14] = CFSTR("SportEvent");
  v3[15] = CFSTR("WinterSport");
  v3[16] = CFSTR("Diving");
  v3[17] = CFSTR("Lunch");
  v3[18] = CFSTR("Dinner");
  v3[19] = CFSTR("Breakfast");
  v3[20] = CFSTR("Restaurant");
  v3[21] = CFSTR("NightOut");
  v3[22] = CFSTR("Entertainment");
  v3[23] = CFSTR("HolidayEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 24);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == 5)
    *a4 = 1;
  return result;
}

void __119__PGExhaustiveMomentLabellingQuestionFactory__inferMeaningLabelsForMomentNode_graph_cache_meaningLabels_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __161__PGExhaustiveMomentLabellingQuestionFactory__questionsToAddWithMomentNodes_graph_localFactoryScore_limit_sceneTaxonomy_alreadyGeneratedQuestions_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  PGExhaustiveMomentLabellingQuestion *v11;
  void *v12;
  PGExhaustiveMomentLabellingQuestion *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double Current;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  objc_msgSend(v5, "_meaningLabelsForWhichToGenerateQuestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inferMeaningLabelsForMomentNode:graph:cache:meaningLabels:sceneTaxonomy:", v8, v6, v7, v9, *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PGExhaustiveMomentLabellingQuestion alloc];
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PGExhaustiveMomentLabellingQuestion initWithMomentUUID:localFactoryScore:meaningLabels:](v11, "initWithMomentUUID:localFactoryScore:meaningLabels:", v12, v10, *(double *)(a1 + 104));
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v13, *(_QWORD *)(a1 + 64)))objc_msgSend(*(id *)(a1 + 72), "addObject:", v13);
  v14 = objc_msgSend(*(id *)(a1 + 72), "count");
  if (*(_QWORD *)(a1 + 80))
  {
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 112);
    Current = CFAbsoluteTimeGetCurrent();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (Current - *(double *)(v18 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v18 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))((double)v15 / (double)v16);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        goto LABEL_10;
    }
  }
  v19 = *(_QWORD *)(a1 + 128);
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 72), "count") + v19) >= *(_QWORD *)(a1 + 112))
  {
    if (*(_QWORD *)(a1 + 80))
    {
      v20 = CFAbsoluteTimeGetCurrent();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      if (v20 - *(double *)(v21 + 24) >= *(double *)(a1 + 120))
      {
        *(double *)(v21 + 24) = v20;
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(1.0);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                              + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
LABEL_10:
          *a3 = 1;
      }
    }
  }

}

void __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, int *, double);
  double Current;
  char v6;
  NSObject *v7;
  _QWORD *v8;
  double v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  double v28;
  char v29;
  double v30;
  char v31;
  void (**v32)(void *, int *, double);
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(void *, int *, double);
  char v37;
  _QWORD v38[4];
  void (**v39)(void *, int *, double);
  uint64_t *p_buf;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  int v52;
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t buf;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, int *, double))_Block_copy(*(const void **)(a1 + 48));
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (!v4)
  {
    v8 = (_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_18;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v45[3] >= 0.01)
  {
    v45[3] = Current;
    LOBYTE(v52) = 0;
    v4[2](v4, &v52, 0.0);
    v6 = *((_BYTE *)v49 + 24) | v52;
    *((_BYTE *)v49 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x3504000202;
        LOWORD(v57) = 2080;
        *(_QWORD *)((char *)&v57 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }
  v8 = (_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_13:
    objc_msgSend(v3, "graph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v13, "setDay:", -30);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v12, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v34 = v13;

    v36 = v4;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v12);
    v17 = (void *)v15;
    v18 = (void *)v12;
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v16, v11);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v16;
    v19 = v3;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
    buf = 0;
    *(_QWORD *)&v57 = &buf;
    *((_QWORD *)&v57 + 1) = 0x2020000000;
    v58 = 0;
    v21 = *(_QWORD *)(a1 + 56);
    v23 = *(void **)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_178;
    v38[3] = &unk_1E842F560;
    p_buf = &buf;
    v32 = v36;
    v39 = v32;
    v41 = &v44;
    v42 = &v48;
    v43 = 0x3F847AE147AE147BLL;
    objc_msgSend(v23, "_questionsToAddWithMomentNodes:graph:localFactoryScore:limit:sceneTaxonomy:alreadyGeneratedQuestions:progressBlock:", v35, v11, v21, v20, v22, v38, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v19;
    v25 = v18;
    v26 = v17;
    if (*((_BYTE *)v49 + 24))
    {
      v4 = v36;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        _Block_object_dispose(&buf, 8);
        goto LABEL_18;
      }
      v52 = 67109378;
      v53 = 79;
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
      v27 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v24);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *v8)
      {
        v4 = v36;
        if (!v36)
          goto LABEL_17;
        v30 = CFAbsoluteTimeGetCurrent();
        if (v30 - v45[3] < 0.01)
          goto LABEL_17;
        v45[3] = v30;
        v37 = 0;
        v32[2](v32, (int *)&v37, 1.0);
        v31 = *((_BYTE *)v49 + 24) | v37;
        *((_BYTE *)v49 + 24) = v31;
        if (!v31 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v52 = 67109378;
        v53 = 83;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        v27 = MEMORY[0x1E0C81028];
      }
      else
      {
        v4 = v36;
        if (!v36)
          goto LABEL_17;
        v28 = CFAbsoluteTimeGetCurrent();
        if (v28 - v45[3] < 0.01)
          goto LABEL_17;
        v45[3] = v28;
        v37 = 0;
        v32[2](v32, (int *)&v37, 1.0);
        v29 = *((_BYTE *)v49 + 24) | v37;
        *((_BYTE *)v49 + 24) = v29;
        if (!v29 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v52 = 67109378;
        v53 = 87;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        v27 = MEMORY[0x1E0C81028];
      }
    }
    _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v52, 0x12u);
    goto LABEL_17;
  }
  v9 = CFAbsoluteTimeGetCurrent();
  if (v9 - v45[3] >= 0.01)
  {
    v45[3] = v9;
    LOBYTE(v52) = 0;
    v4[2](v4, &v52, 1.0);
    v10 = *((_BYTE *)v49 + 24) | v52;
    *((_BYTE *)v49 + 24) = v10;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x3804000202;
        LOWORD(v57) = 2080;
        *(_QWORD *)((char *)&v57 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Meaning/PGExhaustiveMomentLabellingQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
  }
LABEL_18:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

}

void __87__PGExhaustiveMomentLabellingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_178(uint64_t a1, _BYTE *a2, double a3)
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

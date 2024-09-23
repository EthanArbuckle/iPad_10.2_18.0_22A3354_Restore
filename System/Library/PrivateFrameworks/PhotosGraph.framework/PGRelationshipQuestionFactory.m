@implementation PGRelationshipQuestionFactory

+ (id)initialQuestionRelationshipLabelByRelationship
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SIBLING");
  v3[1] = CFSTR("SISTER");
  v4[0] = CFSTR("SIBLING");
  v4[1] = CFSTR("SIBLING");
  v3[2] = CFSTR("BROTHER");
  v3[3] = CFSTR("SON");
  v4[2] = CFSTR("SIBLING");
  v4[3] = CFSTR("CHILD");
  v3[4] = CFSTR("DAUGHTER");
  v3[5] = CFSTR("CHILD");
  v4[4] = CFSTR("CHILD");
  v4[5] = CFSTR("CHILD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipTypesByRelationshipLabel
{
  _QWORD v3[13];
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("FAMILY");
  v3[1] = CFSTR("PARENT");
  v4[0] = &unk_1E84EA810;
  v4[1] = &unk_1E84EA828;
  v3[2] = CFSTR("FATHER");
  v3[3] = CFSTR("MOTHER");
  v4[2] = &unk_1E84EA840;
  v4[3] = &unk_1E84EA858;
  v3[4] = CFSTR("CHILD");
  v3[5] = CFSTR("SON");
  v4[4] = &unk_1E84EA870;
  v4[5] = &unk_1E84EA888;
  v3[6] = CFSTR("DAUGHTER");
  v3[7] = CFSTR("FRIEND");
  v4[6] = &unk_1E84EA8A0;
  v4[7] = &unk_1E84EA8B8;
  v3[8] = CFSTR("COWORKER");
  v3[9] = CFSTR("PARTNER");
  v4[8] = &unk_1E84EA8D0;
  v4[9] = &unk_1E84EA8E8;
  v3[10] = CFSTR("SIBLING");
  v3[11] = CFSTR("SISTER");
  v4[10] = &unk_1E84EA900;
  v4[11] = &unk_1E84EA918;
  v3[12] = CFSTR("BROTHER");
  v4[12] = &unk_1E84EA930;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localFactoryScoreByRelationshipLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[13];
  _QWORD v44[15];

  v44[13] = *MEMORY[0x1E0C80C00];
  v41[0] = &unk_1E84E4E38;
  v41[1] = &unk_1E84E4E50;
  v42[0] = &unk_1E84EB458;
  v42[1] = &unk_1E84EB468;
  v43[0] = CFSTR("PARTNER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v16;
  v43[1] = CFSTR("FAMILY");
  v39[0] = &unk_1E84E4E38;
  v39[1] = &unk_1E84E4E50;
  v40[0] = &unk_1E84EB478;
  v40[1] = &unk_1E84EB488;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v15;
  v43[2] = CFSTR("CHILD");
  v37[0] = &unk_1E84E4E38;
  v37[1] = &unk_1E84E4E50;
  v38[0] = &unk_1E84EB468;
  v38[1] = &unk_1E84EB498;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v14;
  v43[3] = CFSTR("SON");
  v35[0] = &unk_1E84E4E38;
  v35[1] = &unk_1E84E4E50;
  v36[0] = &unk_1E84EB498;
  v36[1] = &unk_1E84EB4A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v13;
  v43[4] = CFSTR("DAUGHTER");
  v33[0] = &unk_1E84E4E38;
  v33[1] = &unk_1E84E4E50;
  v34[0] = &unk_1E84EB498;
  v34[1] = &unk_1E84EB4A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v12;
  v43[5] = CFSTR("FRIEND");
  v31[0] = &unk_1E84E4E38;
  v31[1] = &unk_1E84E4E50;
  v32[0] = &unk_1E84EB4B8;
  v32[1] = &unk_1E84EB4C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v11;
  v43[6] = CFSTR("PARENT");
  v29[0] = &unk_1E84E4E38;
  v29[1] = &unk_1E84E4E50;
  v30[0] = &unk_1E84EB4D8;
  v30[1] = &unk_1E84EB4C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v2;
  v43[7] = CFSTR("FATHER");
  v27[0] = &unk_1E84E4E38;
  v27[1] = &unk_1E84E4E50;
  v28[0] = &unk_1E84EB4E8;
  v28[1] = &unk_1E84EB4E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v3;
  v43[8] = CFSTR("MOTHER");
  v25[0] = &unk_1E84E4E38;
  v25[1] = &unk_1E84E4E50;
  v26[0] = &unk_1E84EB4E8;
  v26[1] = &unk_1E84EB4E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v4;
  v43[9] = CFSTR("SIBLING");
  v23[0] = &unk_1E84E4E38;
  v23[1] = &unk_1E84E4E50;
  v24[0] = &unk_1E84EB4F8;
  v24[1] = &unk_1E84EB508;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v5;
  v43[10] = CFSTR("BROTHER");
  v21[0] = &unk_1E84E4E38;
  v21[1] = &unk_1E84E4E50;
  v22[0] = &unk_1E84EB518;
  v22[1] = &unk_1E84EB528;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v6;
  v43[11] = CFSTR("SISTER");
  v19[0] = &unk_1E84E4E38;
  v19[1] = &unk_1E84E4E50;
  v20[0] = &unk_1E84EB518;
  v20[1] = &unk_1E84EB528;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v7;
  v43[12] = CFSTR("COWORKER");
  v17[0] = &unk_1E84E4E38;
  v17[1] = &unk_1E84E4E50;
  v18[0] = &unk_1E84EB538;
  v18[1] = &unk_1E84EB548;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)relationshipTagForRelatationshipType:(unint64_t)a3
{
  if (a3 > 0x11)
    return 10;
  else
    return qword_1CA8ED490[a3];
}

+ (id)relationshipLabelsRequiringInitialQuestion
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("CHILD");
  v6[1] = CFSTR("DAUGHTER");
  v6[2] = CFSTR("SON");
  v6[3] = CFSTR("SIBLING");
  v6[4] = CFSTR("SISTER");
  v6[5] = CFSTR("BROTHER");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)displayStringForRelationshipLabel:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHILD")) & 1) != 0)
  {
    v4 = CFSTR("👶");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SIBLING")))
  {
    v4 = CFSTR("👧 👦");
  }
  else
  {
    v4 = &stru_1E8436F28;
  }

  return (id)v4;
}

- (unsigned)questionType
{
  return 5;
}

- (int64_t)questionOptions
{
  return 16;
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
  PGRelationshipQuestionFactory *v17;
  id v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  -[PGRelationshipQuestionFactory updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded](self, "updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (id)initialQuestionForRelationshipLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d AND entityType = %d AND entityIdentifier = %@"), 5, 4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateInitialQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PGRelationshipQuestionFactory_updateInitialQuestion___block_invoke;
  v13[3] = &unk_1E8435668;
  v7 = v4;
  v14 = v7;
  v12 = 0;
  v8 = objc_msgSend(v6, "performChangesAndWait:error:", v13, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[Questions] Failed to perform library changes for relationship inital question with error: %@", buf, 0xCu);
    }

  }
}

- (void)updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id obj;
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 5);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("entityType"), 1);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("state"), 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v29 = (void *)v7;
  v30 = (void *)v6;
  v46[0] = v7;
  v46[1] = v6;
  v31 = (void *)v5;
  v46[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v10);

  v32 = v4;
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    v15 = *MEMORY[0x1E0D780D8];
    v34 = *MEMORY[0x1E0D77FD0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v17, "additionalInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("CHILD")))
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            objc_msgSend(v33, "addObject:", v17);
        }

        objc_autoreleasePoolPop(v18);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v33, "count"))
  {
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __92__PGRelationshipQuestionFactory_updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded__block_invoke;
    v37[3] = &unk_1E8435668;
    v38 = v33;
    v36 = 0;
    v24 = objc_msgSend(v23, "performChangesAndWait:error:", v37, &v36);
    v25 = v36;

    if ((v24 & 1) == 0)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "loggingConnection");
      v27 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v25;
        _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[Questions] Failed to perform library changes for relationship inital question with error: %@", buf, 0xCu);
      }

    }
  }

}

void __92__PGRelationshipQuestionFactory_updateOutdatedAnsweredYesChildRelationshipQuestionsIfNeeded__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5), (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setState:", 0);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setCreationDate:", v7);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __55__PGRelationshipQuestionFactory_updateInitialQuestion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCreationDate:", v1);

}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  double Current;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PGRelationshipQuestion *v12;
  PGRelationshipQuestion *v13;
  void *v14;
  void *v15;
  PGRelationshipQuestion *v16;
  void *v17;
  void *v18;
  void *v19;
  PGRelationshipQuestion *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  PGRelationshipQuestion *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  PGRelationshipQuestion *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  PGRelationshipQuestion *v77;
  void *v78;
  double v79;
  double v80;
  NSObject *p_super;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  double v85;
  NSObject *v86;
  int v87;
  int v88;
  int v89;
  void *v90;
  NSObject *v91;
  PGGraphPersonNodeCollection *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  PGRelationshipQuestion *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  double v103;
  BOOL v104;
  char v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  PGRelationshipQuestion *v115;
  id obj;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *context;
  id v122;
  id v123;
  id v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  void *v129;
  uint64_t v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  uint64_t v136;
  void (**v137)(void *, _BYTE *, double);
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[4];
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  id v159;
  _QWORD v160[4];
  PGRelationshipQuestion *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  unsigned __int8 v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint8_t v171[128];
  uint8_t buf[4];
  _BYTE v173[14];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v110 = a2;
  v137 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v137)
  {
    v4 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_159;
    goto LABEL_10;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v4 = 0.0;
  if (Current >= 0.01)
  {
    v5 = Current;
    v166 = 0;
    v137[2](v137, &v166, 0.0);
    if (v166)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v173 = 63;
        *(_WORD *)&v173[4] = 2080;
        *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
        v6 = MEMORY[0x1E0C81028];
LABEL_44:
        _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_159;
      }
      goto LABEL_159;
    }
    v4 = v5;
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_10:
    objc_msgSend(v110, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v7);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v7;
    objc_msgSend(v7, "meNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v8, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuidFromLocalIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v125 = v8;
    v109 = (void *)v11;
    if (v8 && v11)
    {
      v12 = -[PGRelationshipQuestion initWithRelationshipLabel:confirmedPersonUUID:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:confirmedPersonUUID:", CFSTR("ME"), v11);
      if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v12, *(_QWORD *)(a1 + 40)))
      {
        v13 = v12;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
        {
          if (v137)
          {
            v14 = v109;
            if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
            {
              v166 = 0;
              v137[2](v137, &v166, 1.0);
              if (v166)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v173 = 117;
                  *(_WORD *)&v173[4] = 2080;
                  *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
            }
          }
          else
          {
            v14 = v109;
          }
LABEL_158:

          goto LABEL_159;
        }
      }
      else
      {
        v13 = v12;
      }
    }
    else
    {
      objc_msgSend(v112, "meNode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inferredPersonNode");
      v16 = (PGRelationshipQuestion *)objc_claimAutoreleasedReturnValue();

      v13 = v16;
      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CD16C0];
        -[PGRelationshipQuestion localIdentifier](v16, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uuidFromLocalIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:localFactoryScore:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:personUUID:localFactoryScore:", CFSTR("ME"), v19, 1.0);
        if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v20, *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
          {
            v14 = v109;
            if (v137)
            {
              if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
              {
                v166 = 0;
                v137[2](v137, &v166, 1.0);
                if (v166)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v173 = 87;
                    *(_WORD *)&v173[4] = 2080;
                    *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                }
              }
            }
LABEL_157:

            goto LABEL_158;
          }
        }

      }
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      objc_msgSend(v111, "localIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v162, v171, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v163;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v163 != v23)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
            -[PGRelationshipQuestion localIdentifier](v13, "localIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = (void *)v26;
              -[PGRelationshipQuestion localIdentifier](v13, "localIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v25, "isEqualToString:", v28);

              if ((v29 & 1) != 0)
                continue;
            }
            objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v25);
            v20 = (PGRelationshipQuestion *)objc_claimAutoreleasedReturnValue();
            v30 = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:localFactoryScore:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:personUUID:localFactoryScore:", CFSTR("ME"), v20, 0.99);
            if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v30, *(_QWORD *)(a1 + 40)))
            {
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v30);
              if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
              {
                v14 = v109;
                if (v137)
                {
                  if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
                  {
                    v166 = 0;
                    v137[2](v137, &v166, 1.0);
                    if (v166)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v173 = 101;
                        *(_WORD *)&v173[4] = 2080;
                        *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                    }
                  }
                }
                goto LABEL_156;
              }
            }
            v31 = objc_msgSend(*(id *)(a1 + 40), "count");
            if (v137)
            {
              v32 = v31;
              v33 = *(_QWORD *)(a1 + 56);
              v34 = CFAbsoluteTimeGetCurrent();
              if (v34 - v4 >= 0.01)
              {
                v166 = 0;
                v137[2](v137, &v166, (double)v32 / (double)v33);
                if (v166)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v173 = 106;
                    *(_WORD *)&v173[4] = 2080;
                    *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  v14 = v109;
LABEL_156:

                  goto LABEL_157;
                }
                v4 = v34;
              }
            }

          }
          v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v162, v171, 16);
          if (v22)
            continue;
          break;
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "localFactoryScoreByRelationshipLabels");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "relationshipTypesByRelationshipLabel");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = MEMORY[0x1E0C809B0];
    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131;
    v160[3] = &unk_1E84340E8;
    v115 = v35;
    v161 = v115;
    objc_msgSend(v36, "sortedArrayUsingComparator:", v160);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonNodeCollection, "nodesInGraph:", v112);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "relationshipTagNodes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v157[0] = v37;
    v157[1] = 3221225472;
    v157[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_135;
    v157[3] = &unk_1E8434138;
    v124 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v158 = v124;
    v123 = v41;
    v159 = v123;
    v108 = v40;
    objc_msgSend(v40, "enumerateNodesUsingBlock:", v157);
    objc_msgSend((id)objc_opt_class(), "relationshipLabelsRequiringInitialQuestion");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "initialQuestionRelationshipLabelByRelationship");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    obj = v38;
    v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v170, 16);
    if (v118)
    {
      v135 = 0;
      v117 = *(_QWORD *)v154;
      while (1)
      {
        for (j = 0; j != v118; ++j)
        {
          if (*(_QWORD *)v154 != v117)
            objc_enumerationMutation(obj);
          v43 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          if (objc_msgSend(v119, "containsObject:", v43))
          {
            objc_msgSend(v113, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "initialQuestionForRelationshipLabel:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            if (!v45)
            {
              objc_msgSend((id)objc_opt_class(), "displayStringForRelationshipLabel:", v44);
              v51 = j;
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:displayString:localFactoryScore:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:personUUID:displayString:localFactoryScore:", v44, v44, v52, 1.0);
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v53);

              j = v51;
LABEL_59:

              objc_autoreleasePoolPop(context);
              continue;
            }
            if (!objc_msgSend(v45, "state"))
              goto LABEL_59;
            if (objc_msgSend(v46, "state") == 3 || objc_msgSend(v46, "state") == 1)
            {
              objc_msgSend(v46, "creationDate");
              v47 = j;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "timeIntervalSinceNow");
              v50 = v49;

              j = v47;
              if (v50 < -15778800.0)
                objc_msgSend(*(id *)(a1 + 32), "updateInitialQuestion:", v46);
              goto LABEL_59;
            }

          }
          v120 = j;
          -[PGRelationshipQuestion objectForKeyedSubscript:](v115, "objectForKeyedSubscript:", v43);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "objectForKeyedSubscript:", &unk_1E84E4E50);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "doubleValue");
          v56 = v55;

          v136 = v43;
          objc_msgSend(v114, "objectForKeyedSubscript:", v43);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v122 = v57;
          v127 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v149, v169, 16);
          if (!v127)
            goto LABEL_102;
          v126 = *(_QWORD *)v150;
          while (2)
          {
            v58 = 0;
LABEL_64:
            if (*(_QWORD *)v150 != v126)
              objc_enumerationMutation(v122);
            v59 = objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * v58), "unsignedIntegerValue");
            v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v61 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v146[0] = MEMORY[0x1E0C809B0];
            v146[1] = 3221225472;
            v146[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_139;
            v146[3] = &unk_1E8434160;
            v62 = v60;
            v147 = v62;
            v63 = v61;
            v148 = v63;
            objc_msgSend(v125, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", v59, 3, v146);
            +[PGGraphPersonRelationshipTagNode labelForRelationshipTag:](PGGraphPersonRelationshipTagNode, "labelForRelationshipTag:", objc_msgSend((id)objc_opt_class(), "relationshipTagForRelatationshipType:", v59));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "objectForKeyedSubscript:", v64);
            v65 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "objectForKeyedSubscript:", v64);
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v67, "unionSet:", v62);
            objc_msgSend(v67, "unionSet:", v63);
            v134 = (void *)v65;
            objc_msgSend(v67, "unionSet:", v65);
            v132 = (void *)v66;
            objc_msgSend(v67, "unionSet:", v66);
            objc_msgSend(v128, "unionSet:", v67);
            v144 = 0u;
            v145 = 0u;
            v142 = 0u;
            v143 = 0u;
            v68 = v67;
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
            if (!v69)
              goto LABEL_84;
            v70 = v69;
            v71 = *(_QWORD *)v143;
            v130 = v58;
            v131 = v63;
            v129 = v64;
LABEL_68:
            v72 = 0;
            while (1)
            {
              if (*(_QWORD *)v143 != v71)
                objc_enumerationMutation(v68);
              v73 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v72);
              v74 = (void *)MEMORY[0x1E0CD16C0];
              objc_msgSend(v73, "localIdentifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "uuidFromLocalIdentifier:", v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v76)
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "loggingConnection");
                p_super = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v173 = v73;
                  _os_log_error_impl(&dword_1CA237000, p_super, OS_LOG_TYPE_ERROR, "Cannot get uuid for person %@", buf, 0xCu);
                }
                v76 = 0;
                v85 = v4;
                goto LABEL_98;
              }
              if ((objc_msgSend(v62, "containsObject:", v73) & 1) != 0
                || objc_msgSend(v134, "containsObject:", v73))
              {
                v77 = -[PGRelationshipQuestion initWithRelationshipLabel:confirmedPersonUUID:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:confirmedPersonUUID:", v136, v76);
              }
              else
              {
                objc_msgSend(v133, "objectForKeyedSubscript:", &unk_1E84E4E38);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "doubleValue");
                v80 = v79;

                v77 = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:localFactoryScore:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:personUUID:localFactoryScore:", v136, v76, v80);
              }
              p_super = &v77->super.super;
              if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v77, *(_QWORD *)(a1 + 40)))
              {
                objc_msgSend(*(id *)(a1 + 40), "addObject:", p_super);
                if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
                  break;
              }
              v82 = objc_msgSend(*(id *)(a1 + 40), "count");
              if (v137)
              {
                v83 = v82;
                v84 = *(_QWORD *)(a1 + 56);
                v85 = CFAbsoluteTimeGetCurrent();
                if (v85 - v4 >= 0.01)
                {
                  v166 = 0;
                  v137[2](v137, &v166, (double)v83 / (double)v84);
                  if (v166 | v135 & 1)
                  {
                    v91 = MEMORY[0x1E0C81028];
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v173 = 224;
                      *(_WORD *)&v173[4] = 2080;
                      *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                      _os_log_impl(&dword_1CA237000, v91, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                    v135 = 1;
LABEL_98:
                    v63 = v131;

                    v87 = 0;
                    v88 = 0;
                    v89 = 1;
                    v4 = v85;
                    v64 = v129;
                    v58 = v130;
                    goto LABEL_99;
                  }
                  v135 = 0;
                  v4 = v85;
                }
              }

              if (v70 == ++v72)
              {
                v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
                v58 = v130;
                v63 = v131;
                v64 = v129;
                if (v70)
                  goto LABEL_68;
LABEL_84:

                if ((v135 & 1) == 0)
                  goto LABEL_92;
LABEL_85:
                v135 = 1;
                v86 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v173 = 227;
                  *(_WORD *)&v173[4] = 2080;
                  *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                  v135 = 1;
                  _os_log_impl(&dword_1CA237000, v86, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v87 = 0;
                v88 = 0;
                v89 = 1;
                goto LABEL_99;
              }
            }

            v58 = v130;
            v63 = v131;
            v64 = v129;
            if ((v135 & 1) != 0)
              goto LABEL_85;
LABEL_92:
            v135 = 0;
            if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
            {
              v87 = 0;
              v89 = 6;
              v88 = 1;
            }
            else
            {
              v88 = 0;
              v89 = 0;
              v87 = 1;
            }
LABEL_99:

            if (v87)
            {
              if (++v58 == v127)
              {
                v127 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v149, v169, 16);
                if (!v127)
                {
LABEL_102:

                  goto LABEL_104;
                }
                continue;
              }
              goto LABEL_64;
            }
            break;
          }

          if (!v88)
            goto LABEL_131;
LABEL_104:
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
          {

            objc_autoreleasePoolPop(context);
            goto LABEL_140;
          }
          v92 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", v128, v112);
          objc_msgSend(v111, "collectionBySubtracting:", v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v141 = 0u;
          objc_msgSend(v93, "uuids");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v139;
            while (2)
            {
              for (k = 0; k != v96; ++k)
              {
                if (*(_QWORD *)v139 != v97)
                  objc_enumerationMutation(v94);
                v99 = -[PGRelationshipQuestion initWithRelationshipLabel:personUUID:localFactoryScore:]([PGRelationshipQuestion alloc], "initWithRelationshipLabel:personUUID:localFactoryScore:", v136, *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * k), v56);
                if (objc_msgSend(*(id *)(a1 + 32), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v99, *(_QWORD *)(a1 + 40)))
                {
                  objc_msgSend(*(id *)(a1 + 40), "addObject:", v99);
                  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56))
                  {

                    goto LABEL_120;
                  }
                }
                v100 = objc_msgSend(*(id *)(a1 + 40), "count");
                if (v137)
                {
                  v101 = v100;
                  v102 = *(_QWORD *)(a1 + 56);
                  v103 = CFAbsoluteTimeGetCurrent();
                  if (v103 - v4 >= 0.01)
                  {
                    v166 = 0;
                    v137[2](v137, &v166, (double)v101 / (double)v102);
                    if (v166 | v135 & 1)
                    {
                      v107 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v173 = 251;
                        *(_WORD *)&v173[4] = 2080;
                        *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
                        _os_log_impl(&dword_1CA237000, v107, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      v105 = 1;
                      goto LABEL_129;
                    }
                    v135 = 0;
                    v4 = v103;
                  }
                }

              }
              v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
              if (v96)
                continue;
              break;
            }
          }
LABEL_120:

          v104 = (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 56);
          v105 = v104 & v135;
          v89 = 4 * v104;
          if (v104 || (v106 = MEMORY[0x1E0C81028], (v135 & 1) == 0))
          {
            v103 = v4;
          }
          else
          {
            v105 = 1;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v173 = 258;
              *(_WORD *)&v173[4] = 2080;
              *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, v106, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v103 = v4;
LABEL_129:
            v89 = 1;
          }

          v4 = v103;
          v135 = v105;
LABEL_131:

          objc_autoreleasePoolPop(context);
          if (v89 == 5)
          {
            j = v120;
          }
          else
          {
            j = v120;
            if (v89)
            {

              v14 = v109;
              v13 = v115;
              if (v89 != 4)
                goto LABEL_152;
              goto LABEL_141;
            }
          }
        }
        v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v170, 16);
        if (!v118)
          goto LABEL_140;
      }
    }
    v135 = 0;
LABEL_140:

    v14 = v109;
    v13 = v115;
LABEL_141:
    if (v137)
    {
      if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
      {
        v166 = 0;
        v137[2](v137, &v166, 1.0);
        if (v166 | v135 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v173 = 261;
            *(_WORD *)&v173[4] = 2080;
            *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_152:

    goto LABEL_158;
  }
  if (CFAbsoluteTimeGetCurrent() - v4 >= 0.01)
  {
    v166 = 0;
    v137[2](v137, &v166, 1.0);
    if (v166)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v173 = 67;
        *(_WORD *)&v173[4] = 2080;
        *(_QWORD *)&v173[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Questions/Survey/Relationship/PGRelationshipQuestionFactory.m";
        v6 = MEMORY[0x1E0C81028];
        goto LABEL_44;
      }
    }
  }
LABEL_159:

}

BOOL __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_131(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E84E4E38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E84E4E38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  return v10 <= v14;
}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2;
  v5[3] = &unk_1E8434110;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v4, "enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:", v5);

}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(a3, "status");
  v6 = 40;
  if (!v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

void __74__PGRelationshipQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "confidence");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "collection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 1.0)
    v7 = *(void **)(a1 + 48);
  else
    v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

@end

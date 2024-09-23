@implementation PGNamingQuestionFactory

- (PHFetchResult)persons
{
  PHFetchResult *persons;
  void *v4;
  void *v5;
  PHFetchResult *v6;
  PHFetchResult *v7;

  persons = self->_persons;
  if (!persons)
  {
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleQuestionFactoryUtils personsWithPeopleHomeContextForPhotoLibrary:](PGPeopleQuestionFactoryUtils, "personsWithPeopleHomeContextForPhotoLibrary:", v5);
    v6 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v7 = self->_persons;
    self->_persons = v6;

    persons = self->_persons;
  }
  return persons;
}

- (unsigned)questionType
{
  return 1;
}

- (int64_t)questionOptions
{
  return 1;
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
  PGNamingQuestionFactory *v17;
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
  v15 = __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
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

- (BOOL)_shouldAddNewNamingQuestionForPersonUUID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory existingQuestionsForEntityIdentifier:](self, "existingQuestionsForEntityIdentifier:", a3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "state", (_QWORD)v10) == 2)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_persistQuestions:(id)a3 questionsToRemove:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  PGNamingQuestionFactory *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__PGNamingQuestionFactory__persistQuestions_questionsToRemove___block_invoke;
    v19[3] = &unk_1E8434200;
    v20 = v7;
    v21 = v6;
    v11 = v10;
    v22 = v11;
    v23 = self;
    v18 = 0;
    v12 = objc_msgSend(v9, "performChangesAndWait:error:", v19, &v18);
    v13 = v18;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[Questions] Succeeded persisting naming questions", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[Questions] Error performing library changes for naming questions: %@", buf, 0xCu);

    }
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
}

void __63__PGNamingQuestionFactory__persistQuestions_questionsToRemove___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1728], "deleteQuestions:", *(_QWORD *)(a1 + 32));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "persistWithCreationDate:questionVersion:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "questionVersion", (_QWORD)v7));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
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
  id v12;
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
  uint64_t j;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PGNamingQuestion *v35;
  void *v36;
  void *v37;
  PGNamingQuestion *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void (**v54)(void *, _BYTE *, double);
  id obj;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  int v75;
  __int16 v76;
  const char *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  if (!v4)
  {
    v6 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_51;
    goto LABEL_10;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v6 = 0.0;
  if (Current >= 0.01)
  {
    v7 = Current;
    v71 = 0;
    v4[2](v4, &v71, 0.0);
    if (v71)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v75 = 60;
        v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Deprecated/Naming/PGNamingQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
LABEL_42:
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
    v6 = v7;
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_10:
    v54 = v4;
    v51 = v3;
    objc_msgSend(v3, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v68 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v17, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v9;
    objc_msgSend(v9, "personNodesForPersonLocalIdentifiers:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v22;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v64;
      v4 = v54;
      while (2)
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v64 != v56)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          v25 = objc_msgSend(*(id *)(a1 + 40), "count");
          if (v4)
          {
            v26 = v25;
            v27 = *(_QWORD *)(a1 + 56);
            v28 = CFAbsoluteTimeGetCurrent();
            if (v28 - v6 >= 0.01)
            {
              v71 = 0;
              v4[2](v4, &v71, (double)v26 / (double)v27);
              if (v71)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v75 = 87;
                  v76 = 2080;
                  v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Questions/Deprecated/Naming/PGNamingQuestionFactory.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v49 = v50;
                v3 = v51;
                goto LABEL_50;
              }
              v6 = v28;
            }
          }
          objc_msgSend(v24, "localIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            v32 = *(void **)(a1 + 32);
            objc_msgSend(v30, "uuid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v32) = objc_msgSend(v32, "_shouldAddNewNamingQuestionForPersonUUID:", v33);

            if ((_DWORD)v32)
            {
              objc_msgSend(v24, "contactIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v34, "length"))
              {
                v35 = [PGNamingQuestion alloc];
                objc_msgSend(*(id *)(a1 + 32), "workingContext");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "serviceManager");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = -[PGNamingQuestion initWithConfirmedPerson:contactIdentifier:localFactoryScore:serviceManager:](v35, "initWithConfirmedPerson:contactIdentifier:localFactoryScore:serviceManager:", v31, v34, v37, 1.0);

                objc_msgSend(v52, "addObject:", v38);
                v39 = *(void **)(a1 + 32);
                objc_msgSend(v31, "uuid");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "existingQuestionsForEntityIdentifier:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "addObjectsFromArray:", v41);

              }
              else
              {
                v58[0] = MEMORY[0x1E0C809B0];
                v58[1] = 3221225472;
                v58[2] = __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_132;
                v58[3] = &unk_1E8427E80;
                v42 = v31;
                v43 = *(_QWORD *)(a1 + 32);
                v44 = *(void **)(a1 + 40);
                v59 = v42;
                v60 = v43;
                v45 = v44;
                v46 = *(_QWORD *)(a1 + 56);
                v61 = v45;
                v62 = v46;
                objc_msgSend(v24, "enumerateContactSuggestionsSortedByConfidenceMatchingQuery:usingBlock:", 1, v58);
                v47 = objc_msgSend(*(id *)(a1 + 40), "count");
                v48 = *(_QWORD *)(a1 + 56);

                if (v47 >= v48)
                {

                  goto LABEL_44;
                }
              }

              v4 = v54;
            }
          }

        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        if (v57)
          continue;
        break;
      }
    }
    else
    {
LABEL_44:
      v4 = v54;
    }

    objc_msgSend(*(id *)(a1 + 32), "_persistQuestions:questionsToRemove:", v52, v53);
    v49 = v50;
    v3 = v51;
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v71 = 0;
        v4[2](v4, &v71, 1.0);
        if (v71)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v75 = 133;
            v76 = 2080;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Ques"
                  "tions/Deprecated/Naming/PGNamingQuestionFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_50:

    goto LABEL_51;
  }
  if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
  {
    v71 = 0;
    v4[2](v4, &v71, 1.0);
    if (v71)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v75 = 64;
        v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Deprecated/Naming/PGNamingQuestionFactory.m";
        v8 = MEMORY[0x1E0C81028];
        goto LABEL_42;
      }
    }
  }
LABEL_51:

}

void __68__PGNamingQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_132(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  PGNamingQuestion *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  PGNamingQuestion *v15;
  id v16;

  v16 = a3;
  objc_msgSend(a2, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = [PGNamingQuestion alloc];
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "confidence");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 40), "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serviceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGNamingQuestion initWithPerson:contactIdentifier:localFactoryScore:serviceManager:](v9, "initWithPerson:contactIdentifier:localFactoryScore:serviceManager:", v10, v8, v14, v12);

    if (objc_msgSend(*(id *)(a1 + 40), "shouldAddQuestion:toAlreadyGeneratedQuestions:", v15, *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 56))
        *a5 = 1;
    }

  }
}

@end

@implementation PXSurveyQuestionsDataSource

- (PXSurveyQuestionsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsDataSource.m"), 35, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionsDataSource init]");

  abort();
}

- (PXSurveyQuestionsDataSource)initWithPhotoLibrary:(id)a3 predicate:(id)a4
{
  id v8;
  id v9;
  PXSurveyQuestionsDataSource *v10;
  PXSurveyQuestionsDataSource *v11;
  uint64_t v12;
  NSPredicate *predicate;
  uint64_t v14;
  NSMutableSet *answeredGadgetIdentifiers;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsDataSource.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionsDataSource;
  v10 = -[PXSurveyQuestionsDataSource init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    v12 = objc_msgSend(v9, "copy");
    predicate = v11->_predicate;
    v11->_predicate = (NSPredicate *)v12;

    v11->_numberOfQuestionsGenerated = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    answeredGadgetIdentifiers = v11->_answeredGadgetIdentifiers;
    v11->_answeredGadgetIdentifiers = (NSMutableSet *)v14;

  }
  return v11;
}

- (void)resetGeneratedQuestions
{
  NSMutableSet *v3;
  NSMutableSet *answeredGadgetIdentifiers;

  self->_numberOfQuestionsGenerated = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  answeredGadgetIdentifiers = self->_answeredGadgetIdentifiers;
  self->_answeredGadgetIdentifiers = v3;

}

- (void)didGenerateNumberOfGadgets:(unint64_t)a3
{
  self->_numberOfQuestionsGenerated += a3;
}

- (BOOL)didAnswerQuestionForGadgetIdentifier:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_answeredGadgetIdentifiers, "containsObject:", v4);
  if ((v5 & 1) == 0)
    -[NSMutableSet addObject:](self->_answeredGadgetIdentifiers, "addObject:", v4);

  return v5 ^ 1;
}

- (unint64_t)numberOfQuestionsRemainingToBeAnswered
{
  unint64_t numberOfQuestionsGenerated;

  numberOfQuestionsGenerated = self->_numberOfQuestionsGenerated;
  return numberOfQuestionsGenerated - -[NSMutableSet count](self->_answeredGadgetIdentifiers, "count");
}

- (id)fetchSortedAllUnansweredQuestionsWithLimit:(unint64_t)a3
{
  id v5;
  void *v6;
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
  PXSurveyQuestionsDataSource *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unint64_t v34;
  void *v35;
  PXSurveyQuestionsDataSource *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (_os_feature_enabled_impl())
  {
    -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](self, "_fetchOptionsForShouldPrefetchCount:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v10);

    objc_msgSend(v6, "setFetchLimit:", a3);
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);

    a3 -= objc_msgSend(v11, "count");
    if (!a3)
      goto LABEL_7;

  }
  -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](self, "_fetchOptionsForShouldPrefetchCount:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d OR %K == %d"), CFSTR("type"), 20, CFSTR("type"), 23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v17 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v18);

  objc_msgSend(v6, "setFetchLimit:", a3);
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchedObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v19);

  v20 = objc_msgSend(v11, "count");
  if (a3 == v20)
  {
    self = v17;
  }
  else
  {
    v36 = v17;
    v34 = a3 - v20;
    -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](v17, "_fetchOptionsForShouldPrefetchCount:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d AND %K != %d"), CFSTR("type"), 20, CFSTR("type"), 23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v35);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("type"), 30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v23);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPredicate:", v24);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v25;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
    v26 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v27;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSortDescriptors:", v29);

    v5 = v26;
    objc_msgSend(v21, "setFetchLimit:", v34);
    objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v21, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __74__PXSurveyQuestionsDataSource_fetchSortedAllUnansweredQuestionsWithLimit___block_invoke;
    v37[3] = &unk_1E5117690;
    v38 = v26;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v37);

    v6 = v21;
    self = v36;
  }
LABEL_7:
  v31 = objc_alloc(MEMORY[0x1E0CD1620]);
  v32 = (void *)objc_msgSend(v31, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, self->_photoLibrary, *MEMORY[0x1E0CD1BC0], 0, 0, 0);

  return v32;
}

- (unint64_t)fetchTotalNumberOfUnansweredQuestions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](self, "_fetchOptionsForShouldPrefetchCount:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)fetchTotalNumberOfAnsweredYesOrNoQuestions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](self, "_fetchOptionsForShouldPrefetchCount:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredYesOrNoQuestionsWithOptions:validQuestionsOnly:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_fetchOptionsForShouldPrefetchCount:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", self->_predicate);
  objc_msgSend(v5, "setShouldPrefetchCount:", v3);
  return v5;
}

- (id)mostRecentQuestionCreationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PXSurveyQuestionsDataSource _fetchOptionsForShouldPrefetchCount:](self, "_fetchOptionsForShouldPrefetchCount:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)invalidateQuestions:(id)a3
{
  id v4;
  PHPhotoLibrary *photoLibrary;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    photoLibrary = self->_photoLibrary;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PXSurveyQuestionsDataSource_invalidateQuestions___block_invoke;
    v6[3] = &unk_1E5149198;
    v7 = v4;
    -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v6, 0);

  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_answeredGadgetIdentifiers, 0);
}

void __51__PXSurveyQuestionsDataSource_invalidateQuestions___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1728], "changeRequestForQuestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setState:", 4);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __74__PXSurveyQuestionsDataSource_fetchSortedAllUnansweredQuestionsWithLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "type") != 30 || _os_feature_enabled_impl())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end

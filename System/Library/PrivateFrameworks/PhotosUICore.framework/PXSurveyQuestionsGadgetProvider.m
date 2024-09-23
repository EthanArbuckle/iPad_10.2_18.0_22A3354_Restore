@implementation PXSurveyQuestionsGadgetProvider

- (PXSurveyQuestionsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 61, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionsGadgetProvider init]");

  abort();
}

- (PXSurveyQuestionsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 65, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionsGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXSurveyQuestionsGadgetProvider)initWithDataSource:(id)a3 gadgetType:(unint64_t)a4
{
  id v8;
  PXSurveyQuestionsGadgetProvider *v9;
  uint64_t v10;
  PHPhotoLibrary *photoLibrary;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  v9 = -[PXGadgetProvider init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "photoLibrary");
    v10 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v9->_photoLibrary;
    v9->_photoLibrary = (PHPhotoLibrary *)v10;

    -[PHPhotoLibrary px_registerChangeObserver:](v9->_photoLibrary, "px_registerChangeObserver:", v9);
    objc_storeStrong((id *)&v9->_dataSource, a3);
    v9->_gadgetType = a4;
    v9->_currentlyLoadingMoreQuestions = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  -[PXSurveyQuestionsGadgetProvider dealloc](&v3, sel_dealloc);
}

- (void)setLemonadeUIDelegate:(id)a3
{
  id v4;
  void *v5;
  id obj;

  obj = a3;
  -[PXSurveyQuestionsGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_lemonadeUIDelegate, obj);
    v5 = obj;
  }

}

- (void)performChanges:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  -[PXGadgetProvider performChanges:](&v5, sel_performChanges_, a3);
  -[PXSurveyQuestionsGadgetProvider lemonadeUIDelegate](self, "lemonadeUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateGadgets");

}

- (void)resumeLibraryUpdates
{
  -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
}

- (void)pauseLibraryUpdates
{
  -[PHPhotoLibrary px_unregisterChangeObserver:](self->_photoLibrary, "px_unregisterChangeObserver:", self);
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  NSDate *previousMostRecentQuestionCreationDate;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v20;
  PXSurveyQuestionsGadgetProvider *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSurveyQuestionsDataSource mostRecentQuestionCreationDate](self->_dataSource, "mostRecentQuestionCreationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
  if (previousMostRecentQuestionCreationDate)
    goto LABEL_2;
  if (!-[PXSurveyQuestionsDataSource fetchTotalNumberOfUnansweredQuestions](self->_dataSource, "fetchTotalNumberOfUnansweredQuestions"))
  {
    previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
LABEL_2:
    v7 = -[NSDate compare:](previousMostRecentQuestionCreationDate, "compare:", v5) == NSOrderedAscending;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_previousMostRecentQuestionCreationDate, v5);
  v7 = 1;
LABEL_5:
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v7 & 1) == 0)
  {
    v20 = v7;
    v21 = self;
    v22 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (!v9)
      goto LABEL_20;
    v10 = v9;
    v11 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "question");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "configuration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v15, "needsQuestionInvalidationForChange:", v4))
        {
          objc_msgSend(v24, "addObject:", v14);
          v16 = v25;
LABEL_17:
          objc_msgSend(v16, "addObject:", v13);
          goto LABEL_18;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v15, "needsDisplayRefreshForChange:", v4))
        {
          objc_msgSend(v15, "setIsStale:", 1);
          v16 = v23;
          goto LABEL_17;
        }
LABEL_18:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (!v10)
      {
LABEL_20:

        self = v21;
        v5 = v22;
        v7 = v20;
        break;
      }
    }
  }
  -[PXSurveyQuestionsDataSource invalidateQuestions:](self->_dataSource, "invalidateQuestions:", v24);
  v30[0] = CFSTR("GadgetsNeedReset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v17;
  v31[1] = v25;
  v30[1] = CFSTR("GadgetsWithInvalidEntities");
  v30[2] = CFSTR("GadgetsWithStaleContent");
  v31[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PXSurveyQuestionsDataSource *dataSource;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GadgetsNeedReset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    -[PXSurveyQuestionsGadgetProvider _generateGadgetsWithLimit:removeExistingGadgets:](self, "_generateGadgetsWithLimit:removeExistingGadgets:", 10, 1);
    -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PXGadgetProvider rootNavigationHelper](self, "rootNavigationHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigateToSectionWithGadgetType:andGadget:animated:", objc_msgSend(v9, "gadgetType"), v9, 1);

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GadgetsWithInvalidEntities"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __85__PXSurveyQuestionsGadgetProvider_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke;
    v33[3] = &unk_1E5145360;
    v12 = v11;
    v34 = v12;
    -[PXSurveyQuestionsGadgetProvider performChanges:](self, "performChanges:", v33);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          dataSource = self->_dataSource;
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v17), "uniqueGadgetIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXSurveyQuestionsDataSource didRemoveGadgetWithIdentifier:](dataSource, "didRemoveGadgetWithIdentifier:", v19);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v15);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GadgetsWithStaleContent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v24++), "refreshQuestionContentView");
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v22);
  }

}

- (void)_generateGadgetsWithLimit:(unint64_t)a3 removeExistingGadgets:(BOOL)a4
{
  NSDate *v7;
  NSDate *previousMostRecentQuestionCreationDate;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXSurveyQuestionPlaceholderGadget *v19;
  PXSurveyQuestionPlaceholderGadget *placeholderGadget;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;

  -[PXSurveyQuestionsDataSource mostRecentQuestionCreationDate](self->_dataSource, "mostRecentQuestionCreationDate");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  previousMostRecentQuestionCreationDate = self->_previousMostRecentQuestionCreationDate;
  self->_previousMostRecentQuestionCreationDate = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsDataSource fetchSortedAllUnansweredQuestionsWithLimit:](self->_dataSource, "fetchSortedAllUnansweredQuestionsWithLimit:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke;
  v26[3] = &unk_1E5133608;
  v26[4] = self;
  v12 = v9;
  v27 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v26);
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToSet:", v18) & 1) == 0)
    {
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_2;
      v22[3] = &unk_1E5133630;
      v25 = a4;
      v22[4] = self;
      v23 = v12;
      v24 = v14;
      -[PXSurveyQuestionsGadgetProvider performChanges:](self, "performChanges:", v22);

    }
  }
  else
  {
    if (!self->_placeholderGadget)
    {
      v19 = objc_alloc_init(PXSurveyQuestionPlaceholderGadget);
      placeholderGadget = self->_placeholderGadget;
      self->_placeholderGadget = v19;

    }
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_3;
    v21[3] = &unk_1E5145360;
    v21[4] = self;
    -[PXSurveyQuestionsGadgetProvider performChanges:](self, "performChanges:", v21);
  }

}

- (void)_generateGadgetsWithLimit:(unint64_t)a3
{
  -[PXSurveyQuestionsGadgetProvider _generateGadgetsWithLimit:removeExistingGadgets:](self, "_generateGadgetsWithLimit:removeExistingGadgets:", a3, 0);
}

- (void)loadDataForGadgets
{
  +[PXSurveyQuestionGadget preloadResources](PXSurveyQuestionGadget, "preloadResources");
}

- (void)generateGadgets
{
  -[PXSurveyQuestionsGadgetProvider _generateGadgetsWithLimit:](self, "_generateGadgetsWithLimit:", 10);
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (NSArray)surveyGadgets
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXGadgetProvider gadgets](self, "gadgets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "gadgetType") == self->_gadgetType)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_gadgetForSurveyQuestion:(id)a3
{
  id v4;
  PXSurveyQuestionGadget *v5;

  v4 = a3;
  v5 = -[PXSurveyQuestionGadget initWithSurveyQuestion:gadgetType:]([PXSurveyQuestionGadget alloc], "initWithSurveyQuestion:gadgetType:", v4, self->_gadgetType);

  -[PXSurveyQuestionGadget setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (void)didAnswerQuestionForGadget:(id)a3
{
  id v4;
  PXSurveyQuestionsDataSource *dataSource;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;
  id location;

  v4 = a3;
  dataSource = self->_dataSource;
  objc_msgSend(v4, "uniqueGadgetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSurveyQuestionsDataSource didAnswerQuestionForGadgetIdentifier:](dataSource, "didAnswerQuestionForGadgetIdentifier:", v6);

  objc_initWeak(&location, self);
  -[PXSurveyQuestionsGadgetProvider gadgetProviderDelegate](self, "gadgetProviderDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke;
  v10[3] = &unk_1E5144F48;
  v13 = v7;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "didAnswerQuestionForGadgetProvider:completionHandler:", self, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)showViewController:(id)a3 fromGadget:(id)a4
{
  -[PXSurveyQuestionsGadgetProvider gadget:transitionToViewController:animated:completion:](self, "gadget:transitionToViewController:animated:completion:", a4, a3, 1, 0);
}

- (void)_addCongratulationsGadgetWithCompletionHandlerIfNeeded:(id)a3
{
  void (**v4)(id, _QWORD);
  PXSurveyQuestionCongratulationsGadget *v5;
  PXSurveyQuestionCongratulationsGadget *v6;
  _QWORD v7[4];
  PXSurveyQuestionCongratulationsGadget *v8;

  v4 = (void (**)(id, _QWORD))a3;
  if (-[PXSurveyQuestionsDataSource numberOfQuestionsRemainingToBeAnswered](self->_dataSource, "numberOfQuestionsRemainingToBeAnswered"))
  {
    v4[2](v4, 0);
  }
  else
  {
    v5 = -[PXSurveyQuestionCongratulationsGadget initWithType:]([PXSurveyQuestionCongratulationsGadget alloc], "initWithType:", -[PXSurveyQuestionsDataSource fetchTotalNumberOfUnansweredQuestions](self->_dataSource, "fetchTotalNumberOfUnansweredQuestions") != 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__PXSurveyQuestionsGadgetProvider__addCongratulationsGadgetWithCompletionHandlerIfNeeded___block_invoke;
    v7[3] = &unk_1E5145360;
    v8 = v5;
    v6 = v5;
    -[PXSurveyQuestionsGadgetProvider performChanges:](self, "performChanges:", v7);
    v4[2](v4, 1);

  }
}

- (void)didSelectActionButtonForType:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _QWORD v10[4];
  id v11;
  PXSurveyQuestionsGadgetProvider *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    if (-[PXSurveyQuestionsGadgetProvider currentlyLoadingMoreQuestions](self, "currentlyLoadingMoreQuestions"))
      return;
    -[PXSurveyQuestionsGadgetProvider setCurrentlyLoadingMoreQuestions:](self, "setCurrentlyLoadingMoreQuestions:", 1);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[PXGadgetProvider gadgets](self, "gadgets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "gadgetType") == 18)
          {
            v6 = v9;
            goto LABEL_15;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_161;
    v10[3] = &unk_1E5148D08;
    v11 = v6;
    v12 = self;
    v4 = v6;
    -[PXSurveyQuestionsGadgetProvider _reloadGadgetsWithLimit:completionHandler:](self, "_reloadGadgetsWithLimit:completionHandler:", 50, v10);

  }
  else
  {
    if (a3)
      return;
    -[PXSurveyQuestionsGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_186729);
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(v4, block);
  }

}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  return -[PXGadgetProvider gadget:transitionToViewController:animated:completion:](&v7, sel_gadget_transitionToViewController_animated_completion_, a3, a4, a5, a6);
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionsGadgetProvider;
  -[PXGadgetProvider presentGadgetViewController:animated:completion:](&v5, sel_presentGadgetViewController_animated_completion_, a3, a4, a5);
}

- (void)surveyQuestionGadgetsWantsOneUpPresentation:(id)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = -[PXSurveyQuestionsGadgetProvider _prepareForOneUpPresentationForGadget:](self, "_prepareForOneUpPresentationForGadget:", v14);
  v5 = v14;
  if (v4)
  {
    -[PXSurveyQuestionsGadgetProvider _handlePrepareForOneUpPresentationSuccessForGadget:](self, "_handlePrepareForOneUpPresentationSuccessForGadget:", v14);
    -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:

        objc_msgSend(v6, "oneUpPresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDelegate:", self);
        objc_msgSend(v7, "startWithConfigurationHandler:", 0);

        v5 = v14;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v11);
    }

    goto LABEL_4;
  }
LABEL_5:

}

- (void)_handlePrepareForOneUpPresentationSuccessForGadget:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setCurrentlyInOneUp:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setCurrentlyInOneUp:", 1);
}

- (BOOL)_prepareForOneUpPresentationForGadget:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PXPhotosDataSourceConfiguration *v24;
  PXPhotoKitAssetsDataSourceManager *v25;
  PXAssetsDataSourceManager *oneUpDataSourceManager;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  PXAssetReference *v31;
  PXAssetReference *oneUpInitialAssetReference;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  SEL v41;
  PXPhotosDataSource *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _BYTE buf[24];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "question");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      objc_msgSend(v7, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to prepare for one up: Unsupported configuration: %{public}@ for question: %{public}@", buf, 0x16u);

    }
    goto LABEL_7;
  }
  v8 = objc_msgSend(v7, "displayType");
  if (v8)
  {
    v9 = v8;
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v9;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to prepare for one up: Unsupported display type: %u for question: %{public}@", buf, 0x12u);

    }
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "asset");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 440, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetConfiguration.asset"), v37);
LABEL_20:

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject px_descriptionForAssertionMessage](v10, "px_descriptionForAssertionMessage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 440, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetConfiguration.asset"), v37, v39);

    goto LABEL_20;
  }
LABEL_11:
  v45 = 0;
  v46 = 0;
  v14 = objc_msgSend(v7, "px_assetCollectionAndAssetFetchResultForAsset:assetCollection:assetFetchResult:", v10, &v46, &v45);
  v16 = v46;
  v17 = v45;
  v18 = v17;
  if ((v14 & 1) != 0)
  {
    v41 = a2;
    v44 = v16;
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v17, "fetchedObjects");
    v20 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "valueForKeyPath:", CFSTR("uuid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssetUUIDsAssociatedWithGadget:", v23);

    v24 = -[PXPhotosDataSourceConfiguration initWithAssetFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithAssetFetchResult:options:", v20, 0);
    -[PXPhotosDataSourceConfiguration setReferenceAsset:](v24, "setReferenceAsset:", v10);
    v42 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v24);
    v25 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v42);
    oneUpDataSourceManager = self->_oneUpDataSourceManager;
    self->_oneUpDataSourceManager = &v25->super;

    -[PXAssetsDataSourceManager dataSource](self->_oneUpDataSourceManager, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    v28 = objc_msgSend(v20, "indexOfObject:", v10);
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("PXSurveyQuestionsGadgetProvider.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialAssetIndex != NSNotFound"));

    }
    v29 = objc_msgSend(v27, "identifier");
    v30 = objc_alloc((Class)off_1E50B1688);
    *(_QWORD *)buf = v29;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[16] = v28;
    v48 = 0x7FFFFFFFFFFFFFFFLL;
    v31 = (PXAssetReference *)objc_msgSend(v30, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v10, 0, buf);
    oneUpInitialAssetReference = self->_oneUpInitialAssetReference;
    self->_oneUpInitialAssetReference = v31;

    v18 = v43;
    v16 = v44;
  }
  else
  {
    PLUIGetLog();
    v24 = (PXPhotosDataSourceConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
    {
      -[NSObject uuid](v10, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v34;
      _os_log_impl(&dword_1A6789000, &v24->super, OS_LOG_TYPE_ERROR, "Failed to prepare for one up: No collection or fetch result for asset: %{public}@ for question: %{public}@", buf, 0x16u);

    }
  }

LABEL_8:
  return v14;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return self->_oneUpDataSourceManager;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  PXPhotoKitUIMediaProvider *oneUpMediaProvider;
  PXPhotoKitUIMediaProvider *v5;
  PXPhotoKitUIMediaProvider *v6;

  oneUpMediaProvider = self->_oneUpMediaProvider;
  if (!oneUpMediaProvider)
  {
    v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    v6 = self->_oneUpMediaProvider;
    self->_oneUpMediaProvider = v5;

    oneUpMediaProvider = self->_oneUpMediaProvider;
  }
  return oneUpMediaProvider;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  void *v4;
  void *v5;

  -[PXSurveyQuestionsGadgetProvider _targetGadgetForCurrentOneUpPresentation](self, "_targetGadgetForCurrentOneUpPresentation", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionOfInterestForOneUpTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  void *v4;
  void *v5;

  -[PXSurveyQuestionsGadgetProvider _targetGadgetForCurrentOneUpPresentation](self, "_targetGadgetForCurrentOneUpPresentation", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_targetGadgetForCurrentOneUpPresentation
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
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
  -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "currentlyInOneUp"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_oneUpInitialAssetReference;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 0;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "valueForKeyPath:", CFSTR("asset.uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXSurveyQuestionsGadgetProvider surveyGadgets](self, "surveyGadgets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "currentlyInOneUp") & 1) != 0)
        {
          objc_msgSend(v11, "assetUUIDsAssociatedWithGadget");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setContentHidden:", objc_msgSend(v12, "intersectsSet:", v5));

        }
        else
        {
          objc_msgSend(v11, "setContentHidden:", 0);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_reloadGadgetsWithLimit:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXSurveyQuestionsGadgetProvider__reloadGadgetsWithLimit_completionHandler___block_invoke;
  block[3] = &unk_1E5148F60;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (PXSurveyQuestionsDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (PXSurveyQuestionsGadgetProviderDelegate)gadgetProviderDelegate
{
  return (PXSurveyQuestionsGadgetProviderDelegate *)objc_loadWeakRetained((id *)&self->_gadgetProviderDelegate);
}

- (void)setGadgetProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_gadgetProviderDelegate, a3);
}

- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate
{
  return (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate *)objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
}

- (void)setSurveyGadgets:(id)a3
{
  objc_storeStrong((id *)&self->_surveyGadgets, a3);
}

- (BOOL)currentlyLoadingMoreQuestions
{
  return self->_currentlyLoadingMoreQuestions;
}

- (void)setCurrentlyLoadingMoreQuestions:(BOOL)a3
{
  self->_currentlyLoadingMoreQuestions = a3;
}

- (NSDate)previousMostRecentQuestionCreationDate
{
  return self->_previousMostRecentQuestionCreationDate;
}

- (void)setPreviousMostRecentQuestionCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousMostRecentQuestionCreationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMostRecentQuestionCreationDate, 0);
  objc_storeStrong((id *)&self->_surveyGadgets, 0);
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_destroyWeak((id *)&self->_gadgetProviderDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_placeholderGadget, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpMediaProvider, 0);
}

uint64_t __77__PXSurveyQuestionsGadgetProvider__reloadGadgetsWithLimit_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_generateGadgetsWithLimit:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2(uint64_t a1)
{
  void *v1;
  int v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "photoAnalysisClient");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v2 = objc_msgSend(v1, "reportMetricsWithOptions:error:", MEMORY[0x1E0C9AA70], &v10);
  v3 = v10;

  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v6 = "Sent photos challenge metrics";
      v7 = v5;
      v8 = OS_LOG_TYPE_INFO;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    v6 = "Failed to send photos challenge metrics: %@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
    goto LABEL_6;
  }

}

uint64_t __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_161(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "gadgets");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 32));

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2_162;
    v11[3] = &unk_1E5145360;
    v4 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v4, "performChanges:", v11);
    objc_msgSend(*(id *)(a1 + 40), "gadgets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v3 < v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "gadgets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "rootNavigationHelper");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "navigateToSectionWithGadgetType:andGadget:animated:", objc_msgSend(v8, "gadgetType"), v8, 1);

      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "setCurrentlyLoadingMoreQuestions:", 0);
}

void __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke_2_162(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGadgets:", v4, v5, v6);

}

uint64_t __64__PXSurveyQuestionsGadgetProvider_didSelectActionButtonForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

void __90__PXSurveyQuestionsGadgetProvider__addCongratulationsGadgetWithCompletionHandlerIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

void __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke_2;
    v4[3] = &unk_1E5147388;
    objc_copyWeak(&v6, v2);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_addCongratulationsGadgetWithCompletionHandlerIfNeeded:", v4);

    objc_destroyWeak(&v6);
  }
}

void __62__PXSurveyQuestionsGadgetProvider_didAnswerQuestionForGadget___block_invoke_2(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "gadgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "rootNavigationHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained(v4);
    objc_msgSend(v8, "navigateToGadgetWithTypeSurveyCongratulationsWithGadgetType:", objc_msgSend(v9, "gadgetType"));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if (objc_msgSend(v15, "gadgetType", (_QWORD)v26) == 18)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
      v22 = v15;

      if (!v22)
        goto LABEL_17;
      v23 = objc_loadWeakRetained(v4);
      objc_msgSend(v23, "lemonadeUIDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigateToGadget:", v22);

      objc_msgSend(v22, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startConfettiAnimation");

      v10 = v22;
    }
    goto LABEL_16;
  }
  v16 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(a1 + 32)) + 1;
  if (v16 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v10 = (id)v17;
      v18 = objc_loadWeakRetained(v4);
      objc_msgSend(v18, "rootNavigationHelper");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigateToSectionWithGadgetType:andGadget:animated:", objc_msgSend(v10, "gadgetType"), v10, 1);

      v20 = objc_loadWeakRetained(v4);
      objc_msgSend(v20, "lemonadeUIDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "navigateToGadget:", v10);

LABEL_16:
    }
  }
LABEL_17:

}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_gadgetForSurveyQuestion:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "removeAllGadgets");
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetGeneratedQuestions");
LABEL_5:

    goto LABEL_6;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v7[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGadgets:", v5);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v4, "addGadgets:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didGenerateNumberOfGadgets:", *(_QWORD *)(a1 + 48));

}

void __83__PXSurveyQuestionsGadgetProvider__generateGadgetsWithLimit_removeExistingGadgets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "removeAllGadgets");
  v5[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4);

}

uint64_t __85__PXSurveyQuestionsGadgetProvider_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeGadgets:", *(_QWORD *)(a1 + 32));
}

@end

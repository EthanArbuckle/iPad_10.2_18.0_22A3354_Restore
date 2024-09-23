@implementation PXSuggestLessPeopleHelper

- (PXSuggestLessPeopleHelper)initWithUndoManager:(id)a3
{
  id v5;
  PXSuggestLessPeopleHelper *v6;
  PXSuggestLessPeopleHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestLessPeopleHelper;
  v6 = -[PXSuggestLessPeopleHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_undoManager, a3);

  return v7;
}

- (void)suggestLessPeople:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSuggestLessPeopleHelper _showSuggestLessOptionForPerson:completionHandler:](self, "_showSuggestLessOptionForPerson:completionHandler:", v7, v6);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No persons were provided for blocking"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v8);

    }
  }
  else
  {
    -[PXSuggestLessPeopleHelper _showSuggestLessPeopleSelectionForPeople:completionHandler:](self, "_showSuggestLessPeopleSelectionForPeople:completionHandler:", v9, v6);
  }

}

- (void)suggestLessPeopleFromAssets:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CD1570];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchOptionsWithPhotoLibrary:orObject:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v11);

  objc_msgSend(v10, "setPersonContext:", 5);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAssets:options:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggestLessPeopleHelper suggestLessPeople:completionHandler:](self, "suggestLessPeople:completionHandler:", v13, v7);

}

- (void)_showSuggestLessPeopleSelectionForPeople:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _TtC12PhotosUICore40SuggestLessPeopleSelectionViewController *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[SuggestLessPeopleSelectionViewController initWithPeople:delegate:completionHandler:]([_TtC12PhotosUICore40SuggestLessPeopleSelectionViewController alloc], "initWithPeople:delegate:completionHandler:", v7, self, v6);

  -[PXSuggestLessPeopleHelper delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestLessPeopleHelper:presentViewController:", self, v9);

}

- (void)_showSuggestLessOptionForPerson:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userFeedbackProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[PXPeopleUtilities alertControllerForRevertingSuggestLess:completion:](PXPeopleUtilities, "alertControllerForRevertingSuggestLess:completion:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities suggestLessOptionSelectionViewController:delegate:completionHandler:](PXPeopleUtilities, "suggestLessOptionSelectionViewController:delegate:completionHandler:", v11, self, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXSuggestLessPeopleHelper delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suggestLessPeopleHelper:presentViewController:", self, v10);

}

- (void)_suggestLessPeople:(id)a3 withSuggestLessOption:(int64_t)a4 undoManager:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  PXPeopleUserFeedbackAction *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;

  v10 = a4 == 1;
  v11 = a6;
  if (a4 == 2)
    v12 = 3;
  else
    v12 = 2 * v10;
  v13 = a5;
  v14 = a3;
  v15 = -[PXPeopleUserFeedbackAction initWithPeople:feedbackType:]([PXPeopleUserFeedbackAction alloc], "initWithPeople:feedbackType:", v14, v12);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__PXSuggestLessPeopleHelper__suggestLessPeople_withSuggestLessOption_undoManager_completionHandler___block_invoke;
  v17[3] = &unk_1E5126120;
  v18 = v11;
  v19 = v12;
  v17[4] = self;
  v16 = v11;
  -[PXAction executeWithUndoManager:completionHandler:](v15, "executeWithUndoManager:completionHandler:", v13, v17);

}

- (void)completeActionWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", CFSTR("User cancelled confirmation alert"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)dismissViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXSuggestLessPeopleHelper delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestLessPeopleHelper:dismissViewController:completionHandler:", self, v7, v6);

}

- (void)didSelectPersonToSuggestLess:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  if (a3)
    -[PXSuggestLessPeopleHelper _showSuggestLessOptionForPerson:completionHandler:](self, "_showSuggestLessOptionForPerson:completionHandler:", a3, a5);
}

- (void)completeOptionSelectionActionWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", CFSTR("User cancelled confirmation alert"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)dismissOptionSelectionViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXSuggestLessPeopleHelper delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestLessPeopleHelper:dismissViewController:completionHandler:", self, v7, v6);

}

- (PXSuggestLessPeopleHelperDelegate)delegate
{
  return (PXSuggestLessPeopleHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __100__PXSuggestLessPeopleHelper__suggestLessPeople_withSuggestLessOption_undoManager_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
    goto LABEL_11;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 2)
  {
    v7 = PXAnalyticsEventUserFeedbackDislikePerson;
  }
  else
  {
    if (v6 != 3)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v7 = PXAnalyticsEventUserFeedbackAvoidPerson;
  }
  v8 = *v7;
LABEL_8:
  if (-[__CFString length](v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0D09910];
    v13 = *MEMORY[0x1E0D09830];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:withPayload:", v8, v12);

  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)canPerformOnAsset:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "px_isUnsavedSyndicatedAsset") & 1) == 0)
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setPersonContext:", 5);
    v8 = (void *)MEMORY[0x1E0CD16C0];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchPersonsInAssets:options:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

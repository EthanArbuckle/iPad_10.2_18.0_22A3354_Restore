@implementation SnippetUIUtilities

+ (BOOL)supportsConfigurationForCardSection:(id)a3
{
  return +[SearchUIRFCardSectionRowModel supportsConfigurationFor:](SearchUIRFCardSectionRowModel, "supportsConfigurationFor:", a3);
}

+ (id)supportsConfigurationForCombinedRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "cardSectionRowModels", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "cardSection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[SnippetUIUtilities supportsConfigurationForCardSection:](SnippetUIUtilities, "supportsConfigurationForCardSection:", v11);

        if (v12)
        {
          objc_msgSend(v10, "cardSection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)createViewControllersForButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 sourceView:(id)a6 rowModel:(id)a7 delegate:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__onceToken;
  v21 = a6;
  if (v20 != -1)
    dispatch_once(&createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__onceToken, &__block_literal_global_26);
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setSourceView:", v21);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_2;
  v29[3] = &unk_1EA1F7EA8;
  v30 = v22;
  v31 = v18;
  v37 = a5;
  v35 = v19;
  v36 = a1;
  v32 = v15;
  v33 = v17;
  v34 = v16;
  v23 = v19;
  v24 = v16;
  v25 = v17;
  v26 = v15;
  v27 = v18;
  v28 = v22;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v29);

}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories;
  createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories = v0;

}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10[2];
  char v11;
  id location;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setTimeLimitForSubsequentButtonGeneratorUpdates:", 0.5);
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setFeedbackDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories, "addObject:", v2);
  objc_initWeak(&location, v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 88))
    v4 = 4;
  else
    v4 = objc_msgSend(*(id *)(a1 + 48), "count");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_3;
  v5[3] = &unk_1EA1F7E80;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)(a1 + 80);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v11 = *(_BYTE *)(a1 + 88);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "fetchSearchUIButtonitemsWithSFButtonItems:maxButtonItems:shouldReverseButtonOrder:completion:", v3, v4, 0, v5);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[2];
  char v15;
  char v16;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_4;
  v8[3] = &unk_1EA1F7E58;
  objc_copyWeak(v14, (id *)(a1 + 64));
  v6 = v5;
  v7 = *(void **)(a1 + 72);
  v9 = v6;
  v14[1] = v7;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 80);
  v12 = *(id *)(a1 + 48);
  v16 = a3;
  v13 = *(id *)(a1 + 56);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v8);

  objc_destroyWeak(v14);
}

void __122__SnippetUIUtilities_createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = *(void **)(a1 + 80);
        objc_msgSend(v7, "sfButtonItem", WeakRetained);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "buttonAppearance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "searchUIButtonItemViewStyleFromVRXButtonStyle:", objc_msgSend(v10, "style"));

        +[SearchUIButtonItemViewController buttonItemViewControllerForButtonItem:](SearchUIButtonItemViewController, "buttonItemViewControllerForButtonItem:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRowModel:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v12, "setButtonFont:", *(_QWORD *)(a1 + 48));
        objc_msgSend(v12, "setIsCompact:", *(unsigned __int8 *)(a1 + 88));
        objc_msgSend(v12, "setFeedbackDelegate:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v12, "updateWithButtonItem:buttonItemViewType:", v7, v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setButtonViewController:", v12);
        objc_msgSend(v12, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setView:", v14);

        objc_msgSend(v2, "addObject:", v13);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 89))
  {
    objc_msgSend((id)createViewControllersForButtons_buttonFont_isCompact_sourceView_rowModel_delegate_completionHandler__activeFactories, "removeObject:", WeakRetained);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

+ (unint64_t)searchUIButtonItemViewStyleFromVRXButtonStyle:(int)a3
{
  if ((a3 - 2) > 2)
    return 1;
  else
    return qword_1DAE1D798[a3 - 2];
}

+ (void)performSFCommand:(id)a3 rowModel:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    v12 = (id)objc_opt_new();
    objc_msgSend(v12, "setCommand:", v9);

    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v12, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "executeWithTriggerEvent:", 2);
  }
}

+ (void)emitInstrumentationEvent:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "feedbackListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__SnippetUIUtilities_emitInstrumentationEvent_delegate___block_invoke;
    v9[3] = &unk_1EA1F6210;
    v10 = v7;
    v11 = v5;
    v8 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v9);

  }
}

uint64_t __56__SnippetUIUtilities_emitInstrumentationEvent_delegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "emitInstrumentationEvent:", *(_QWORD *)(a1 + 40));
  return result;
}

+ (id)presentingViewController:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "sourceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (!v7)
      {
        objc_msgSend(v5, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rootViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v7;
}

+ (void)reportFeedback:(id)a3 queryId:(unint64_t)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SnippetUIUtilities_reportFeedback_queryId_delegate___block_invoke;
  v11[3] = &unk_1EA1F7420;
  v12 = v8;
  v13 = v7;
  v14 = a4;
  v9 = v7;
  v10 = v8;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v11);

}

void __54__SnippetUIUtilities_reportFeedback_queryId_delegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(id *)(a1 + 40);
    objc_msgSend(v3, "setQueryId:", v2);
    objc_msgSend(*(id *)(a1 + 32), "reportFeedback:queryId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

+ (BOOL)shouldHideViewForCardSection:(id)a3
{
  return +[SearchUIRFCardSectionRowModel shouldHideViewForCardSection:](SearchUIRFCardSectionRowModel, "shouldHideViewForCardSection:", a3);
}

@end

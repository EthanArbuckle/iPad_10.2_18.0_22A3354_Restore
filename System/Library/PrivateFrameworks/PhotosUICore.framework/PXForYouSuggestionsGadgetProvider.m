@implementation PXForYouSuggestionsGadgetProvider

- (PXForYouSuggestionsGadgetProvider)initWithDataSourceManager:(id)a3 localizedTitle:(id)a4
{
  id v7;
  id v8;
  PXForYouSuggestionsGadgetProvider *v9;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSMapTable *keyAssetFetchesBySuggestion;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXForYouSuggestionsGadgetProvider;
  v9 = -[PXGadgetProvider init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    localizedTitle = v9->_localizedTitle;
    v9->_localizedTitle = (NSString *)v10;

    objc_storeStrong((id *)&v9->_dataSourceManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    keyAssetFetchesBySuggestion = v9->_keyAssetFetchesBySuggestion;
    v9->_keyAssetFetchesBySuggestion = (NSMapTable *)v12;

  }
  return v9;
}

- (PXForYouSuggestionsGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsGadgetProvider.m"), 55, CFSTR("%s is not available as initializer"), "-[PXForYouSuggestionsGadgetProvider init]");

  abort();
}

- (PXForYouSuggestionsGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsGadgetProvider.m"), 59, CFSTR("%s is not available as initializer"), "-[PXForYouSuggestionsGadgetProvider initWithIdentifier:]");

  abort();
}

- (void)loadDataForGadgets
{
  +[PXForYouSuggestionGadget preloadResources](PXForYouSuggestionGadget, "preloadResources");
  px_dispatch_on_main_queue();
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  unint64_t v3;

  -[PXForYouSuggestionsGadgetProvider dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsInSection:", 0);

  return v3;
}

- (void)generateGadgets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  PXForYouSuggestionGadget *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];

  self->_hasGeneratedGadgets = 1;
  -[PXForYouSuggestionsGadgetProvider dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        v13[0] = objc_msgSend(v3, "identifier");
        v13[1] = 0;
        v13[2] = i;
        v13[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v3, "objectAtIndexPath:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[PXForYouSuggestionGadget initWithSuggestion:]([PXForYouSuggestionGadget alloc], "initWithSuggestion:", v8);
        -[PXForYouSuggestionsGadgetProvider configureGadget:](self, "configureGadget:", v9);
        objc_msgSend(v6, "addObject:", v9);

      }
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__PXForYouSuggestionsGadgetProvider_generateGadgets__block_invoke;
    v11[3] = &unk_1E5145360;
    v12 = v6;
    v10 = v6;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v11);

  }
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if ((a4 & 0x20) != 0)
  {
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "gadget:didChange:", v6, a4);

      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXForYouSuggestionsGadgetProvider;
    -[PXGadgetProvider gadget:didChange:](&v12, sel_gadget_didChange_, v6, a4);
  }

}

- (id)_gadgetForAssetReference:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  unint64_t v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "indexPath");
    v7 = v15;
  }
  else
  {
    v7 = 0;
  }
  -[PXGadgetProvider gadgets](self, "gadgets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetProvider gadgets](self, "gadgets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsGadgetProvider.m"), 115, CFSTR("%s: Attempted to get gadget at index %ld, but there are only %lu gadgets."), "-[PXForYouSuggestionsGadgetProvider _gadgetForAssetReference:]", v7, objc_msgSend(v14, "count"));

  }
  -[PXGadgetProvider gadgets](self, "gadgets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  PXSuggestionsDataSource *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PXSuggestionsDataSource *v17;
  PXSuggestionsDataSource *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  PXSuggestionsDataSource *v24;
  PXForYouSuggestionsGadgetProvider *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PXSuggestionsDataSource *v30;
  PXForYouSuggestionsGadgetProvider *v31;
  _QWORD v32[4];
  PXSuggestionsDataSource *v33;
  PXForYouSuggestionsGadgetProvider *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  PXForYouSuggestionsGadgetProvider *v38;
  uint64_t v39;

  v7 = (PXSuggestionsDataSource *)a3;
  v8 = a4;
  if (self->_dataSource != v7)
  {
    -[PXForYouSuggestionsGadgetProvider dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_dataSource, a3);
    if (self->_hasGeneratedGadgets)
    {
      objc_msgSend(v8, "itemChangesInSection:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && objc_msgSend(v10, "hasIncrementalChanges"))
      {
        objc_msgSend(v11, "removedIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "changedIndexes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertedIndexes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "identifier");
        v15 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke;
        v36[3] = &unk_1E513F058;
        v38 = self;
        v39 = v14;
        v37 = v9;
        objc_msgSend(v12, "enumerateIndexesUsingBlock:", v36);
        v16 = -[PXSuggestionsDataSource identifier](v7, "identifier");
        v32[0] = v15;
        v32[1] = 3221225472;
        v32[2] = __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_2;
        v32[3] = &unk_1E513F058;
        v17 = v7;
        v34 = self;
        v35 = v16;
        v33 = v17;
        objc_msgSend(v13, "enumerateIndexesUsingBlock:", v32);
        v27[0] = v15;
        v27[1] = 3221225472;
        v27[2] = __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_3;
        v27[3] = &unk_1E513F080;
        v28 = v12;
        v29 = v21;
        v18 = v17;
        v30 = v18;
        v31 = self;
        v19 = v21;
        v20 = v12;
        -[PXGadgetProvider performChanges:](self, "performChanges:", v27);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_4;
        v23[3] = &unk_1E513F058;
        v25 = self;
        v26 = v16;
        v24 = v18;
        objc_msgSend(v13, "enumerateIndexesUsingBlock:", v23);

      }
      else
      {
        -[NSMapTable removeAllObjects](self->_keyAssetFetchesBySuggestion, "removeAllObjects");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_5;
        v22[3] = &unk_1E5145360;
        v22[4] = self;
        -[PXGadgetProvider performChanges:](self, "performChanges:", v22);
      }
    }
    else
    {
      -[PXGadgetProvider delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidateGadgets");
    }

  }
}

- (void)presentOneUpForSuggestion:(id)a3 withMediaProvider:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsGadgetProvider.m"), 184, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXForYouSuggestionsGadgetProvider presentOneUpForSuggestion:withMediaProvider:animated:]", v12);

  abort();
}

- (void)suggestionGadgetsWantsOneUpPresentation:(id)a3 withMediaProvider:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "suggestion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionsGadgetProvider presentOneUpForSuggestion:withMediaProvider:animated:](self, "presentOneUpForSuggestion:withMediaProvider:animated:", v10, v8, v5);

  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logForYouSuggestionViewed1UpCount");

}

- (id)keyAssetForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_keyAssetFetchesBySuggestion, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "fetchKeyAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_keyAssetFetchesBySuggestion, "setObject:forKey:", v5, v4);
  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)DataSourceManagerObservableContext_252069 == a5)
    px_dispatch_on_main_queue();
}

- (PXSuggestionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (PXAssetReference)oneUpInitialAssetReference
{
  return self->_oneUpInitialAssetReference;
}

- (void)setOneUpInitialAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, a3);
}

- (PXAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setOneUpDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, a3);
}

- (PXSuggestionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_keyAssetFetchesBySuggestion, 0);
}

void __66__PXForYouSuggestionsGadgetProvider_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v8, "identifier"), objc_msgSend(v3, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:changeDetails:", v3, v7);

}

void __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];

  v3 = (void *)a1[4];
  v5[0] = a1[6];
  v5[1] = 0;
  v5[2] = a2;
  v5[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "objectAtIndexPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 56), "removeObjectForKey:", v4);

}

void __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];

  v3 = (void *)a1[4];
  v5[0] = a1[6];
  v5[1] = 0;
  v5[2] = a2;
  v5[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "objectAtIndexPath:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 56), "removeObjectForKey:", v4);

}

void __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_3(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXForYouSuggestionGadget *v15;
  PXForYouSuggestionGadget *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "count"))
    objc_msgSend(v3, "removeGadgetsAtIndexes:", a1[4]);
  v4 = objc_msgSend(a1[5], "count");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1[6], "suggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          v15 = [PXForYouSuggestionGadget alloc];
          v16 = -[PXForYouSuggestionGadget initWithSuggestion:](v15, "initWithSuggestion:", v14, (_QWORD)v17);
          objc_msgSend(a1[7], "configureGadget:", v16);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "insertGadgets:atIndexes:", v8, a1[5]);
  }

}

void __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v4 = *(void **)(a1 + 32);
  v8[0] = *(_QWORD *)(a1 + 48);
  v8[1] = 0;
  v8[2] = a2;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v4, "objectAtIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gadgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSuggestion:", v5);
}

uint64_t __65__PXForYouSuggestionsGadgetProvider_setDataSource_changeDetails___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "removeAllGadgets");
  return objc_msgSend(*(id *)(a1 + 32), "generateGadgets");
}

uint64_t __52__PXForYouSuggestionsGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addGadgets:", *(_QWORD *)(a1 + 32));
}

void __55__PXForYouSuggestionsGadgetProvider_loadDataForGadgets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v4, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDataSource:changeDetails:", v3, 0);

  objc_msgSend(v4, "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), DataSourceManagerObservableContext_252069);
}

@end

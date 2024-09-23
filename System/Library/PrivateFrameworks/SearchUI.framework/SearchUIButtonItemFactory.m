@implementation SearchUIButtonItemFactory

- (SearchUIButtonItemFactory)init
{
  SearchUIButtonItemFactory *v2;
  SearchUIButtonItemFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemFactory;
  v2 = -[SearchUIButtonItemFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SearchUIButtonItemFactory setCountMoreButtonTowardsMaxCount:](v2, "setCountMoreButtonTowardsMaxCount:", 1);
  return v3;
}

- (void)fetchSearchUIButtonitemsWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  dispatch_time_t v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27[2];
  BOOL v28;
  id location;

  v10 = a3;
  v11 = a6;
  -[SearchUIButtonItemFactory timeLimitForSubsequentButtonGeneratorUpdates](self, "timeLimitForSubsequentButtonGeneratorUpdates");
  v12 = MEMORY[0x1E0C809B0];
  if (v13 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemFactory setStartTime:](self, "setStartTime:", v14);

    objc_initWeak(&location, self);
    -[SearchUIButtonItemFactory timeLimitForSubsequentButtonGeneratorUpdates](self, "timeLimitForSubsequentButtonGeneratorUpdates");
    v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke;
    block[3] = &unk_1EA1F7728;
    objc_copyWeak(v27, &location);
    v25 = v10;
    v27[1] = (id)a4;
    v28 = a5;
    v26 = v11;
    dispatch_after(v16, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_2;
  v19[3] = &unk_1EA1F77A0;
  v19[4] = self;
  v20 = v10;
  v23 = a5;
  v21 = v11;
  v22 = a4;
  v17 = v11;
  v18 = v10;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v19);

}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "updateCompletionHandlerWithSFButtonItems:maxButtonItems:shouldReverseButtonOrder:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));

}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20[2];
  char v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "count"));
  objc_msgSend(*(id *)(a1 + 32), "setFetchedCommandButtonItemsForButtons:", v2);

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setButtonItemGenerators:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setFullyGeneratedButtonItems:", v4);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "_searchUIButtonItemGeneratorClass");
        v9 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDelegate:", v10);

        objc_msgSend(*(id *)(a1 + 32), "feedbackDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFeedbackDelegate:", v11);

        objc_initWeak(&location, *(id *)(a1 + 32));
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_3;
        v17[3] = &unk_1EA1F7778;
        objc_copyWeak(v20, &location);
        v17[4] = v8;
        v12 = *(id *)(a1 + 40);
        v14 = *(void **)(a1 + 48);
        v13 = *(void **)(a1 + 56);
        v18 = v12;
        v20[1] = v13;
        v21 = *(_BYTE *)(a1 + 64);
        v19 = v14;
        objc_msgSend(v9, "generateSearchUIButtonItemsWithSFButtonItem:completion:", v8, v17);
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "buttonItemGenerators");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v9);

        }
        objc_destroyWeak(v20);
        objc_destroyWeak(&location);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16[2];
  char v17;
  char v18;

  v5 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_4;
  v11[3] = &unk_1EA1F7750;
  objc_copyWeak(v16, (id *)(a1 + 56));
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v17 = a3;
  v9 = v8;
  v10 = *(void **)(a1 + 64);
  v14 = v9;
  v16[1] = v10;
  v18 = *(_BYTE *)(a1 + 72);
  v15 = *(id *)(a1 + 48);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v11);

  objc_destroyWeak(v16);
}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "fetchedCommandButtonItemsForButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(WeakRetained, "fullyGeneratedButtonItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(WeakRetained, "updateCompletionHandlerWithSFButtonItems:maxButtonItems:shouldReverseButtonOrder:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 56));

}

- (void)updateCompletionHandlerWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, void *, uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t j;
  void *v23;
  void *v24;
  SearchUIButtonItem *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v41;
  uint64_t v42;
  _BOOL4 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v43 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, uint64_t))a6;
  v11 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[SearchUIButtonItemFactory fetchedCommandButtonItemsForButtons](self, "fetchedCommandButtonItemsForButtons");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "count"))
          objc_msgSend(v11, "addObjectsFromArray:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v14);
  }

  if (a4 && objc_msgSend(v11, "count") > a4)
  {
    v20 = (void *)objc_opt_new();
    v21 = a4 - -[SearchUIButtonItemFactory countMoreButtonTowardsMaxCount](self, "countMoreButtonTowardsMaxCount");
    for (j = v21 - (v21 == objc_msgSend(v11, "count") - 1); j < objc_msgSend(v11, "count"); ++j)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", j);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

    }
    objc_msgSend(v11, "removeObjectsInArray:", v20);
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setSymbolName:", CFSTR("ellipsis"));
    objc_msgSend(v24, "setIsTemplate:", 1);
    v25 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", 0);
    -[SearchUIButtonItem setImage:](v25, "setImage:", v24);
    -[SearchUIButtonItem setPreviewButtonItems:](v25, "setPreviewButtonItems:", v20);
    -[SearchUIButtonItem setIsOverflowButton:](v25, "setIsOverflowButton:", 1);
    objc_msgSend(v11, "addObject:", v25);

  }
  if (v43)
  {
    objc_msgSend(v11, "reverseObjectEnumerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "mutableCopy");

    v11 = (void *)v28;
  }
  -[SearchUIButtonItemFactory startTime](self, "startTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceNow");
  v31 = v30;
  -[SearchUIButtonItemFactory timeLimitForSubsequentButtonGeneratorUpdates](self, "timeLimitForSubsequentButtonGeneratorUpdates");
  v33 = v32;

  -[SearchUIButtonItemFactory fetchedCommandButtonItemsForButtons](self, "fetchedCommandButtonItemsForButtons");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");
  v36 = objc_msgSend(v12, "count");

  -[SearchUIButtonItemFactory fullyGeneratedButtonItems](self, "fullyGeneratedButtonItems");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");
  v39 = objc_msgSend(v12, "count");

  v41 = v33 < -v31 && v35 == v36;
  v42 = v38 == v39 || v41;
  v10[2](v10, v11, v42);

}

- (SearchUIButtonItemGeneratorViewDelegate)delegate
{
  return (SearchUIButtonItemGeneratorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (double)timeLimitForSubsequentButtonGeneratorUpdates
{
  return self->_timeLimitForSubsequentButtonGeneratorUpdates;
}

- (void)setTimeLimitForSubsequentButtonGeneratorUpdates:(double)a3
{
  self->_timeLimitForSubsequentButtonGeneratorUpdates = a3;
}

- (BOOL)countMoreButtonTowardsMaxCount
{
  return self->_countMoreButtonTowardsMaxCount;
}

- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3
{
  self->_countMoreButtonTowardsMaxCount = a3;
}

- (NSMapTable)fetchedCommandButtonItemsForButtons
{
  return self->_fetchedCommandButtonItemsForButtons;
}

- (void)setFetchedCommandButtonItemsForButtons:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedCommandButtonItemsForButtons, a3);
}

- (NSMutableArray)buttonItemGenerators
{
  return self->_buttonItemGenerators;
}

- (void)setButtonItemGenerators:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemGenerators, a3);
}

- (NSMutableSet)fullyGeneratedButtonItems
{
  return self->_fullyGeneratedButtonItems;
}

- (void)setFullyGeneratedButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_fullyGeneratedButtonItems, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_fullyGeneratedButtonItems, 0);
  objc_storeStrong((id *)&self->_buttonItemGenerators, 0);
  objc_storeStrong((id *)&self->_fetchedCommandButtonItemsForButtons, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

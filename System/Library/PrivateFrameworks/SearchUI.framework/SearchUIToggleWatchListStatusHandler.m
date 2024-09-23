@implementation SearchUIToggleWatchListStatusHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "hasLoaded"))
    v5 = (void *)objc_opt_new();
  else
    v5 = 0;

  return v5;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v7, "watchListDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained(&location);
  objc_msgSend(v9, "watchListState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke;
    v19[3] = &unk_1EA1F7900;
    v11 = &v21;
    objc_copyWeak(&v21, &location);
    v20 = v10;
    objc_msgSend(v20, "toggleStateWithCompletion:", v19);
    v12 = &v20;
  }
  else
  {
    v13 = objc_msgSend(v6, "shouldAddToWatchList");
    objc_msgSend(v6, "watchListItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "watchListIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke_2;
    v16[3] = &unk_1EA1F7928;
    v11 = &v18;
    objc_copyWeak(&v18, &location);
    v17 = 0;
    +[SearchUIWatchListUtilities updateStatusIsInWatchList:watchListItemWithIdentifier:completion:](SearchUIWatchListUtilities, "updateStatusIsInWatchList:watchListItemWithIdentifier:completion:", v13, v15, v16);
    v12 = (id *)&v17;

  }
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "watchListStateDidChange:", *(_QWORD *)(a1 + 32));

}

void __80__SearchUIToggleWatchListStatusHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "watchListStateDidChange:", *(_QWORD *)(a1 + 32));

}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (unint64_t)destination
{
  return 3;
}

@end

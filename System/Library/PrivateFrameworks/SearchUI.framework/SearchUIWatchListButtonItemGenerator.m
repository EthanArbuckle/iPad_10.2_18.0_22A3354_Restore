@implementation SearchUIWatchListButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "watchListItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", objc_msgSend(v7, "type"), objc_msgSend(v7, "isMediaContainer"));
  objc_msgSend(v7, "watchListIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v12[3] = &unk_1EA1F6CC8;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  +[SearchUIWatchListUtilities fetchWatchListStateForWatchListIdentifier:type:completion:](SearchUIWatchListUtilities, "fetchWatchListStateForWatchListIdentifier:type:completion:", v9, v8, v12);

}

void __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  SearchUIWatchListButtonItem *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SearchUIButtonItemLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1((uint64_t)v6, v7);

  }
  if (v5)
  {
    v8 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIWatchListButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 32));
    -[SearchUIButtonItem setStatus:](v8, "setStatus:", objc_msgSend(v5, "isWatchListed"));
    v9 = *(_QWORD *)(a1 + 40);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v10, 1);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "error fetching watch list state for watch list identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end

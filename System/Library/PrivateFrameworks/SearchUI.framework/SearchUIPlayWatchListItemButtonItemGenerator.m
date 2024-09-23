@implementation SearchUIPlayWatchListItemButtonItemGenerator

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
  v12[2] = __103__SearchUIPlayWatchListItemButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  v12[3] = &unk_1EA1F6CF0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:](SearchUIWatchListUtilities, "fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:", v9, v8, 0, v12);

}

void __103__SearchUIPlayWatchListItemButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SearchUIButtonItem *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SearchUISymbolImage *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SearchUIButtonItemLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__SearchUIWatchListButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_cold_1((uint64_t)v6, v7);

  }
  v8 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v14, "buttonType", (_QWORD)v26) == 1)
        {
          objc_msgSend(v14, "punchoutURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)objc_opt_new();
            v17 = (void *)MEMORY[0x1E0D8C5E0];
            objc_msgSend(v14, "punchoutURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "punchoutWithURL:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setPunchout:", v19);

            v20 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 32));
            objc_msgSend(*(id *)(a1 + 32), "title");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              -[SearchUIButtonItem setTitle:](v20, "setTitle:", v21);
            }
            else
            {
              objc_msgSend(v14, "title");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                -[SearchUIButtonItem setTitle:](v20, "setTitle:", v22);
              }
              else
              {
                +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("WATCH_LIVE"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[SearchUIButtonItem setTitle:](v20, "setTitle:", v23);

              }
            }

            objc_msgSend(*(id *)(a1 + 32), "image");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              -[SearchUIButtonItem setImage:](v20, "setImage:", v24);
            }
            else
            {
              v25 = -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", CFSTR("play"));
              -[SearchUIButtonItem setImage:](v20, "setImage:", v25);

            }
            -[SearchUIButtonItem setCommand:](v20, "setCommand:", v16);
            objc_msgSend(v8, "addObject:", v20);

            goto LABEL_25;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_25:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end

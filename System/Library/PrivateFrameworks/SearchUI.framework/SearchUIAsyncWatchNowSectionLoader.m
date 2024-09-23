@implementation SearchUIAsyncWatchNowSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "rowModels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v3, "rowModels");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cardSection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (SearchUIAsyncWatchNowSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  SearchUIAsyncWatchNowSectionLoader *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SFWatchListItem *watchListItem;
  uint64_t v15;
  NSString *cardSectionId;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SearchUIAsyncWatchNowSectionLoader;
  v9 = -[SearchUIAsyncSectionLoader initWithSectionModel:result:queryId:](&v18, sel_initWithSectionModel_result_queryId_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "rowModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "watchListItem");
    v13 = objc_claimAutoreleasedReturnValue();
    watchListItem = v9->_watchListItem;
    v9->_watchListItem = (SFWatchListItem *)v13;

    objc_msgSend(v12, "cardSectionId");
    v15 = objc_claimAutoreleasedReturnValue();
    cardSectionId = v9->_cardSectionId;
    v9->_cardSectionId = (NSString *)v15;

  }
  return v9;
}

- (id)cacheIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIAsyncWatchNowSectionLoader watchListItem](self, "watchListItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "watchListIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)placeholderCardSections
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIAsyncWatchNowSectionLoader watchListItem](self, "watchListItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIWatchNowCardSection placeholderCardForMediaContainer:](SearchUIWatchNowCardSection, "placeholderCardForMediaContainer:", objc_msgSend(v2, "isMediaContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SearchUIAsyncWatchNowSectionLoader watchListItem](self, "watchListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", objc_msgSend(v5, "type"), objc_msgSend(v5, "isMediaContainer"));
  objc_msgSend(v5, "watchListIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SearchUIAsyncWatchNowSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EA1F7E10;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:](SearchUIWatchListUtilities, "fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:", v7, v6, 1, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __77__SearchUIAsyncWatchNowSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id obj;
  id WeakRetained;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setCardSection:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v6, "setAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v30 = a1;
    v31 = v6;
    v7 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v32 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "buttonType");
          if (v13 != 3)
          {
            if (v13 == 2
              && (objc_msgSend(v12, "storeIdentifier"),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  v14,
                  v14))
            {
              v15 = (void *)objc_opt_new();
              objc_msgSend(v12, "storeIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setStoreIdentifier:", v16);
            }
            else
            {
              v15 = (void *)objc_opt_new();
              v17 = (void *)MEMORY[0x1E0D8C5E0];
              objc_msgSend(v12, "punchoutURL");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "punchoutWithURL:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setPunchout:", v18);

            }
            v19 = (void *)objc_opt_new();
            objc_msgSend(v12, "thumbnailImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setImage:", v20);

            v21 = (void *)MEMORY[0x1E0D8C660];
            objc_msgSend(v12, "title");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "textWithString:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setTitle:", v23);

            objc_msgSend(v19, "title");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setMaxLines:", 1);

            v25 = (void *)MEMORY[0x1E0D8C660];
            objc_msgSend(v12, "subtitle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "textWithString:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setSubtitle:", v27);

            objc_msgSend(v19, "subtitle");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setMaxLines:", 2);

            objc_msgSend(v19, "setCommand:", v15);
            objc_msgSend(WeakRetained, "cardSectionId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setCardSectionId:", v29);

            objc_msgSend(v7, "addObject:", v19);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v9);
    }

    v6 = v31;
    objc_msgSend(v31, "setCardSection:", v7);
    (*(void (**)(void))(*(_QWORD *)(v30 + 32) + 16))();

    v5 = v32;
  }

}

- (SFWatchListItem)watchListItem
{
  return (SFWatchListItem *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)cardSectionId
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

@end

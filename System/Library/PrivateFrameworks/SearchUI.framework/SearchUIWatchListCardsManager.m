@implementation SearchUIWatchListCardsManager

- (SearchUIWatchListCardsManager)initWithWatchListIdentifier:(id)a3
{
  id v4;
  SearchUIWatchListCardsManager *v5;
  SearchUIWatchListCardsManager *v6;
  void *v7;
  _QWORD v9[4];
  SearchUIWatchListCardsManager *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIWatchListCardsManager;
  v5 = -[SearchUIWatchListCardsManager init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SearchUIWatchListCardsManager setWatchListIdentifier:](v5, "setWatchListIdentifier:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    -[SearchUIWatchListCardsManager setRowModels:](v6, "setRowModels:", v7);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke;
    v9[3] = &unk_1EA1F6D18;
    v10 = v6;
    +[SearchUIWatchListUtilities generateWatchListReponseForWatchListIdentifier:type:completion:](SearchUIWatchListUtilities, "generateWatchListReponseForWatchListIdentifier:type:completion:", v4, 5, v9);

  }
  return v6;
}

void __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke_2;
  v5[3] = &unk_1EA1F6210;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v5);

}

void __61__SearchUIWatchListCardsManager_initWithWatchListIdentifier___block_invoke_2(uint64_t a1)
{
  SearchUIWatchListState *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SearchUIWatchListIconImage *v11;
  void *v12;
  void *v13;
  SearchUIWatchListIconImage *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setResponse:", *(_QWORD *)(a1 + 40));
  v2 = -[SearchUIWatchListState initWithResponse:]([SearchUIWatchListState alloc], "initWithResponse:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setWatchListState:", v2);

  objc_msgSend(*(id *)(a1 + 32), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsInUpNext:", objc_msgSend(v3, "isWatchListed"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = a1;
  objc_msgSend(*(id *)(a1 + 32), "rowModels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v4)
  {
    v5 = v4;
    v38 = *(_QWORD *)v41;
    v35 = *MEMORY[0x1E0DC89A0];
    v36 = *MEMORY[0x1E0DC89A8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(*(id *)(v39 + 32), "response");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "playables");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(v7, "setHasError:", 1);
          goto LABEL_28;
        }
        v11 = [SearchUIWatchListIconImage alloc];
        objc_msgSend(v10, "channelDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "images");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SearchUIWatchListIconImage initWithArtwork:](v11, "initWithArtwork:", v13);

        +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", 2);
        -[SearchUIWatchListIconImage setSize:](v14, "setSize:");
        objc_msgSend(v10, "channelDetails");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v15, "isAppInstalled");

        if (!(_DWORD)v13)
        {
          objc_msgSend(v10, "channelDetails");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appStoreURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_20;
          objc_msgSend(v10, "channelDetails");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "appStoreURL");
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_msgSend(v10, "punchoutUrls");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v36);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");
        objc_msgSend(v10, "punchoutUrls");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
          v21 = v36;
        else
          v21 = v35;
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v25 = (void *)v23;
          goto LABEL_18;
        }
        v25 = 0;
LABEL_18:

        if (!v25)
        {
LABEL_20:
          v26 = 0;
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        objc_msgSend(v7, "cardSection");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "watchListItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "watchLiveTextFormat");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "channelDetails");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "length"))
          v32 = v29;
        else
          v32 = v31;
        v33 = v32;
        if (objc_msgSend(v29, "length"))
          v34 = v31;
        else
          v34 = 0;
        objc_msgSend(v7, "updateWithTitle:subtitle:image:punchout:", v33, v34, v14, v26);

LABEL_28:
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v5);
  }

}

- (void)addWatchListRowModelObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIWatchListCardsManager rowModels](self, "rowModels");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)isTappable
{
  void *v2;
  BOOL v3;

  -[SearchUIWatchListCardsManager response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSHashTable)rowModels
{
  return self->_rowModels;
}

- (void)setRowModels:(id)a3
{
  objc_storeStrong((id *)&self->_rowModels, a3);
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setWatchListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_watchListIdentifier, a3);
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (SearchUIWatchListState)watchListState
{
  return self->_watchListState;
}

- (void)setWatchListState:(id)a3
{
  objc_storeStrong((id *)&self->_watchListState, a3);
}

- (BOOL)isInUpNext
{
  return self->_isInUpNext;
}

- (void)setIsInUpNext:(BOOL)a3
{
  self->_isInUpNext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchListState, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
  objc_storeStrong((id *)&self->_rowModels, 0);
}

@end

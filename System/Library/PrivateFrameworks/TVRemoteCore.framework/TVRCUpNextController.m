@implementation TVRCUpNextController

- (void)fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[TVRCUpNextController fetchUpNextInfosImpl](self, "fetchUpNextInfosImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRCUpNextController fetchUpNextInfosImpl](self, "fetchUpNextInfosImpl");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  else
  {
    -[TVRCUpNextController _fetchUpNextInfosWithPaginationToken:completion:](self, "_fetchUpNextInfosWithPaginationToken:completion:", v9, v6);
  }

}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1EB0]), "initWithItemID:", v5);
  objc_initWeak(&location, v7);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke;
  v14 = &unk_24DCD6E78;
  objc_copyWeak(&v17, &location);
  v8 = v5;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "setCompletionBlock:", &v11);
  objc_msgSend(MEMORY[0x24BDD1710], "wlkDefaultQueue", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v7);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _TVRCRapportLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1();

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_1;
  v7[3] = &unk_24DCD6E50;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1EC0]), "initWithCanonicalID:", v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke;
  v10[3] = &unk_24DCD6EA0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "makeRequestWithCompletion:", v10);

}

void __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_cold_1();

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_4;
  v8[3] = &unk_24DCD6E50;
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)playItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v6, "hasMediaIdentifierAndKind"))
  {
    objc_msgSend(v6, "mediaIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCUpNextController _playItemForMediaIdentifier:kind:completion:](self, "_playItemForMediaIdentifier:kind:completion:", v8, objc_msgSend(v9, "integerValue"), v7);

LABEL_5:
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "hasURL"))
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCUpNextController _openURL:completion:](self, "_openURL:completion:", v8, v7);
    goto LABEL_5;
  }
  _TVRCRapportLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[TVRCUpNextController playItem:completion:].cold.1(v10);

  v7[2](v7, 0);
LABEL_9:

}

- (void)_playItemForMediaIdentifier:(id)a3 kind:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = 3;
  if (a4 != 1)
    v10 = 1;
  if (a4 == 3)
    v11 = 0;
  else
    v11 = v10;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__TVRCUpNextController__playItemForMediaIdentifier_kind_completion___block_invoke;
  v13[3] = &unk_24DCD6EC8;
  objc_copyWeak(&v15, &location);
  v12 = v9;
  v14 = v12;
  -[TVRCUpNextController _fetchPlayableOpenURLForMediaIdentifier:type:completion:](self, "_fetchPlayableOpenURLForMediaIdentifier:type:completion:", v8, v11, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __68__TVRCUpNextController__playItemForMediaIdentifier_kind_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_openURLString:completion:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_fetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1EA8]), "initWithQueryParameters:", 0);
  objc_initWeak(&location, v8);
  objc_initWeak(&from, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke;
  v11[3] = &unk_24DCD6F18;
  objc_copyWeak(&v13, &from);
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "setCompletionBlock:", v11);
  objc_msgSend(MEMORY[0x24BDD1710], "wlkDefaultQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  v4 = v3;
  if (WeakRetained)
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _TVRCRapportLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_cold_1((uint64_t)v5, v6);

    }
    v20 = v4;
    objc_msgSend(v4, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v7;
    objc_msgSend(v7, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[TVRCUpNextInfo upNextInfoWithDictionary:](TVRCUpNextInfo, "upNextInfoWithDictionary:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_10;
    block[3] = &unk_24DCD6EF0;
    block[4] = WeakRetained;
    v22 = v8;
    v16 = a1[4];
    v23 = v5;
    v24 = v16;
    v17 = v5;
    v18 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v4 = v20;
  }

}

uint64_t __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpNextInfos:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_fetchPlayableOpenURLForMediaIdentifier:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1EA0]), "initWithCanonicalID:", v8);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke;
  v13[3] = &unk_24DCD6F40;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "makeRequestWithCompletion:canonicalType:", v13, a4);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      _TVRCRapportLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_cold_1();
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v5, "playables");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
LABEL_10:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
          if ((objc_msgSend(v17, "isEntitled") & 1) != 0 || (objc_msgSend(v17, "isEntitledAnywhere") & 1) != 0)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v14)
              goto LABEL_10;
            goto LABEL_17;
          }
        }
        v8 = v17;

        if (!v8)
          goto LABEL_20;
        -[NSObject playPunchoutURL](v8, "playPunchoutURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
LABEL_17:

LABEL_20:
      _TVRCRapportLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "playables");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2112;
        v30 = v19;
        _os_log_impl(&dword_21A51B000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find an entitled playable to play %{public}@ - playables=%@", buf, 0x16u);

      }
    }
    v9 = 0;
LABEL_6:

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_12;
    v20[3] = &unk_24DCD6E50;
    v10 = *(id *)(a1 + 40);
    v21 = v9;
    v22 = v10;
    v11 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

  }
}

uint64_t __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_openURLString:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "URLWithString:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    -[TVRCUpNextController _openURL:completion:](self, "_openURL:completion:", v10, v7);
  else
    v7[2](v7, 0);

}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDC15A0]);
  v8 = *MEMORY[0x24BE382E8];
  v16[0] = *MEMORY[0x24BE38310];
  v16[1] = v8;
  v17[0] = MEMORY[0x24BDBD1C8];
  v17[1] = &unk_24DCF9330;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrontBoardOptions:", v9);

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__TVRCUpNextController__openURL_completion___block_invoke;
  v13[3] = &unk_24DCD6F68;
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v10, "openURL:configuration:completionHandler:", v12, v7, v13);

}

void __44__TVRCUpNextController__openURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    _TVRCRapportLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__TVRCUpNextController__openURL_completion___block_invoke_cold_1();

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TVRCUpNextController__openURL_completion___block_invoke_20;
  v8[3] = &unk_24DCD6E50;
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __44__TVRCUpNextController__openURL_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSArray)upNextInfos
{
  return self->_upNextInfos;
}

- (void)setUpNextInfos:(id)a3
{
  objc_storeStrong((id *)&self->_upNextInfos, a3);
}

- (id)fetchUpNextInfosImpl
{
  return self->_fetchUpNextInfosImpl;
}

- (void)setFetchUpNextInfosImpl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchUpNextInfosImpl, 0);
  objc_storeStrong((id *)&self->_upNextInfos, 0);
}

void __68__TVRCUpNextController_markAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error marking %{public}@ as watched: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __65__TVRCUpNextController_removeItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error removing %{public}@ from UpNext: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)playItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A51B000, log, OS_LOG_TYPE_ERROR, "Error playing item - misconfigured?", v1, 2u);
}

void __72__TVRCUpNextController__fetchUpNextInfosWithPaginationToken_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A51B000, a2, OS_LOG_TYPE_ERROR, "Error fetching up next infos: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __80__TVRCUpNextController__fetchPlayableOpenURLForMediaIdentifier_type_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error requesting playables to play %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __44__TVRCUpNextController__openURL_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21A51B000, v0, v1, "Error attempting to openURL %@: %{public}@");
  OUTLINED_FUNCTION_2();
}

@end

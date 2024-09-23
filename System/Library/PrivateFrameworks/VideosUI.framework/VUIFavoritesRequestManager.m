@implementation VUIFavoritesRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1)
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_3);
  return (id)sharedInstance___instance;
}

void __44__VUIFavoritesRequestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIFavoritesRequestManager _init]([VUIFavoritesRequestManager alloc], "_init");
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (id)_init
{
  VUIFavoritesRequestManager *v2;
  uint64_t v3;
  NSMutableDictionary *ongoingEntityIDOperationDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIFavoritesRequestManager;
  v2 = -[VUIFavoritesRequestManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    ongoingEntityIDOperationDictionary = v2->_ongoingEntityIDOperationDictionary;
    v2->_ongoingEntityIDOperationDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (VUIFavoritesRequestManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[VUIFavoritesRequestManager init] not supported, use +sharedInstance instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendRequestForEntityID:(id)a3 teamName:(id)a4 action:(unint64_t)a5 fireBackgroundEvent:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26[2];
  BOOL v27;
  id from;
  id location;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[NSMutableDictionary objectForKey:](self->_ongoingEntityIDOperationDictionary, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && (objc_msgSend(v12, "isCancelled") & 1) == 0)
  {
    v21 = objc_msgSend(v13, "action");
    v22 = 1;
    if (a5 == 1)
      v22 = 2;
    if (a5 == 2)
      v22 = 0;
    if (v21 != v22)
    {
      objc_msgSend(v13, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_ongoingEntityIDOperationDictionary, "removeObjectForKey:", v10);
    }
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0DC8850]);
    v30[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (a5 == 1)
      v16 = 2;
    if (a5 == 2)
      v17 = 0;
    else
      v17 = v16;
    v18 = (void *)objc_msgSend(v14, "initWithAction:ids:", v17, v15);

    if (v18)
    {
      objc_initWeak(&location, v18);
      objc_initWeak(&from, self);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke;
      v23[3] = &unk_1E9F993F8;
      objc_copyWeak(&v25, &location);
      v26[1] = (id)a5;
      v27 = a6;
      objc_copyWeak(v26, &from);
      v19 = v10;
      v24 = v19;
      objc_msgSend(v18, "setCompletionBlock:", v23);
      -[NSMutableDictionary setValue:forKey:](self->_ongoingEntityIDOperationDictionary, "setValue:forKey:", v18, v19);
      objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addOperation:", v18);

      objc_destroyWeak(v26);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }

}

void __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Error"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("Action"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v6, CFSTR("FireBackgroundEvent"));

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke_2;
  block[3] = &unk_1E9F99000;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __89__VUIFavoritesRequestManager_sendRequestForEntityID_teamName_action_fireBackgroundEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "ongoingEntityIDOperationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("VUIFavoritesRequestDidFinishNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (void)getFavoriteTeamsIgnoringCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC8848], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke;
    v7[3] = &unk_1E9F99448;
    v8 = v5;
    objc_msgSend(v6, "getFavoritesIgnoringCache:completion:", v4, v7);

  }
}

void __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v13, "ID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "ID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v20 = __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke_2;
    v21 = &unk_1E9F99420;
    v16 = *(id *)(a1 + 32);
    v22 = v7;
    v23 = v16;
    v17 = (void *)MEMORY[0x1E0CB3978];
    v18 = v7;
    if (objc_msgSend(v17, "isMainThread", v19[0], 3221225472))
      v20((uint64_t)v19);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

void __71__VUIFavoritesRequestManager_getFavoriteTeamsIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (NSMutableDictionary)ongoingEntityIDOperationDictionary
{
  return self->_ongoingEntityIDOperationDictionary;
}

- (void)setOngoingEntityIDOperationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingEntityIDOperationDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingEntityIDOperationDictionary, 0);
}

- (void)sendRequestForEntityID:(os_log_t)log teamName:action:fireBackgroundEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIFavoritesRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end

@implementation SKUISyncWishlistOperation

- (SKUISyncWishlistOperation)init
{
  void *v3;
  SKUISyncWishlistOperation *v4;

  +[SKUIClientContext defaultContext](SKUIClientContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKUISyncWishlistOperation initWithClientContext:](self, "initWithClientContext:", v3);

  return v4;
}

- (SKUISyncWishlistOperation)initWithClientContext:(id)a3
{
  id v5;
  SKUISyncWishlistOperation *v6;
  SKUISyncWishlistOperation *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISyncWishlistOperation initWithClientContext:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUISyncWishlistOperation;
  v6 = -[SKUISyncWishlistOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = dispatch_queue_create("com.apple.StoreKitUI.SKUISyncWishlistOperation", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (id)resultBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__90;
  v10 = __Block_byref_object_dispose__90;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SKUISyncWishlistOperation_resultBlock__block_invoke;
  v5[3] = &unk_1E73A0270;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SKUISyncWishlistOperation_resultBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setResultBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SKUISyncWishlistOperation_setResultBlock___block_invoke;
  v7[3] = &unk_1E73A1578;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__SKUISyncWishlistOperation_setResultBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 264) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v4;

  }
}

- (void)main
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  unsigned __int8 v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DAF6F8]);
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithAccountIdentifier:", objc_msgSend(v6, "longLongValue"));

    -[SKUISyncWishlistOperation _sendLocalChangesForWishlist:](self, "_sendLocalChangesForWishlist:", v7);
    v12 = 0;
    v8 = -[SKUISyncWishlistOperation _loadRemoteItemsForWishlist:didChange:error:](self, "_loadRemoteItemsForWishlist:didChange:error:", v7, &v13, &v12);
    v9 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAFDB0], 1, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  -[SKUISyncWishlistOperation resultBlock](self, "resultBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, _BOOL8, _QWORD, id))(v10 + 16))(v10, v8, v13, v9);

}

- (BOOL)_loadRemoteItemsForWishlist:(id)a3 didChange:(BOOL *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  BOOL v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  id *v29;
  BOOL v30;
  uint64_t v32;
  id v34;
  id obj;
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  BOOL v53[9];

  v34 = a3;
  v53[0] = 0;
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__8;
  v51 = __Block_byref_object_dispose__9;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:error:", CFSTR("viewWishlistBaseUrl"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shouldLog");
    v20 = objc_msgSend(v18, "shouldLogToDisk");
    objc_msgSend(v18, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
      v23 = v19 | 2;
    else
      v23 = v19;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      v24 = v23;
    else
      v24 = v23 & 2;
    if (v24)
    {
      LOWORD(v37) = 0;
      LODWORD(v32) = 2;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_15:

        SSError();
        v26 = objc_claimAutoreleasedReturnValue();
        v9 = v48[5];
        v48[5] = (id)v26;
        v14 = v34;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v37, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog();
    }

    goto LABEL_15;
  }
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v9);
  objc_msgSend(v10, "setCachePolicy:", 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v9);
  +[SSVURLDataConsumer consumer](SKUIWishlistDataConsumer, "consumer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataConsumer:", v12);

  objc_msgSend(v11, "setITunesStoreRequest:", 1);
  -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStoreFrontSuffix:", v13);

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8;
  v41 = __Block_byref_object_dispose__9;
  v42 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __73__SKUISyncWishlistOperation__loadRemoteItemsForWishlist_didChange_error___block_invoke;
  v36[3] = &unk_1E73A8B68;
  v36[4] = &v47;
  v36[5] = &v37;
  v36[6] = &v43;
  objc_msgSend(v11, "setOutputBlock:", v36);
  v14 = v34;
  objc_msgSend(v11, "main");
  if (*((_BYTE *)v44 + 24))
  {
    v15 = v38[5];
    v16 = v48;
    obj = v48[5];
    v17 = -[SKUISyncWishlistOperation _mergeItems:wishlist:didChange:error:](self, "_mergeItems:wishlist:didChange:error:", v15, v34, v53, &obj);
    objc_storeStrong(v16 + 5, obj);
    *((_BYTE *)v44 + 24) = v17;
  }
  _Block_object_dispose(&v37, 8);

LABEL_16:
  v27 = v44;
  v28 = *((unsigned __int8 *)v44 + 24);
  if (!a4)
  {
    v29 = a5;
    if (!a5)
      goto LABEL_24;
    goto LABEL_22;
  }
  v29 = a5;
  if (*((_BYTE *)v44 + 24))
  {
    *a4 = v53[0];
    v28 = *((unsigned __int8 *)v27 + 24);
  }
  if (a5)
  {
LABEL_22:
    if (!v28)
    {
      *v29 = objc_retainAutorelease(v48[5]);
      v28 = *((unsigned __int8 *)v44 + 24);
    }
  }
LABEL_24:
  v30 = v28 != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

void __73__SKUISyncWishlistOperation__loadRemoteItemsForWishlist_didChange_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

- (BOOL)_mergeItems:(id)a3 wishlist:(id)a4 didChange:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  int v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke;
  v17[3] = &unk_1E73A8BE0;
  v11 = v9;
  v18 = v11;
  v20 = &v26;
  v21 = &v22;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v12, "performTransactionWithBlock:", v17);
  v13 = v23;
  v14 = *((unsigned __int8 *)v23 + 24);
  if (a5 && *((_BYTE *)v23 + 24))
  {
    *a5 = *((_BYTE *)v27 + 24);
    v14 = *((unsigned __int8 *)v13 + 24);
  }
  if (a6 && !v14)
  {
    *a6 = 0;
    v14 = *((unsigned __int8 *)v23 + 24);
  }
  v15 = v14 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

BOOL __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:equalToLongLong:", *MEMORY[0x1E0DAFDD8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF700], "queryWithDatabase:predicate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_2;
  v35[3] = &unk_1E73A8B90;
  v8 = v4;
  v36 = v8;
  v26 = v6;
  objc_msgSend(v6, "enumeratePersistentIDsUsingBlock:", v35);
  v9 = *(void **)(a1 + 32);
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_3;
  v31[3] = &unk_1E73A8BB8;
  v10 = v3;
  v32 = v10;
  v11 = v8;
  v33 = v11;
  v34 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v31);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v24 = v11;
    v25 = v5;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1BCCE6C7C]();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF700]), "initWithPersistentID:inDatabase:", objc_msgSend(v17, "longLongValue"), v10);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v19, "deleteFromDatabase");

        objc_autoreleasePoolPop(v18);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v14)
            goto LABEL_4;
          break;
        }
      }
    }

    v11 = v24;
    v5 = v25;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v20 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLastSyncTime:", v21);

    v22 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __66__SKUISyncWishlistOperation__mergeItems_wishlist_didChange_error___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = (void *)MEMORY[0x1BCCE6C7C]();
  SKUIWishlistItemPropertiesWithItem(v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0DAFDD0]);

    objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:equalToLongLong:", *MEMORY[0x1E0DAFDC0], objc_msgSend(v15, "itemIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAF700], "anyInDatabase:predicate:", a1[4], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "setValuesWithDictionary:", v8);
      v13 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v14);

    }
    else
    {
      objc_msgSend(v8, "setObject:forKey:", &unk_1E749B7C8, *MEMORY[0x1E0DAFDD8]);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF700]), "initWithPropertyValues:inDatabase:", v8, a1[4]);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v12 != 0;
      *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) ^ 1;
    }

  }
  objc_autoreleasePoolPop(v7);

}

- (void)_sendLocalChangesForWishlist:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke;
  v23[3] = &unk_1E73A63D0;
  v5 = v4;
  v24 = v5;
  objc_msgSend(v3, "performTransactionWithBlock:", v23);
  if (!objc_msgSend(v5, "count"))
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v8 &= 2u;
  if (!v8)
    goto LABEL_10;
  v10 = objc_msgSend(v5, "count");
  v26 = 134217984;
  v27 = v10;
  LODWORD(v18) = 12;
  v17 = &v26;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v26, v18);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    v17 = (int *)v9;
    SSFileLog();
LABEL_10:

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "main", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v14);
  }

LABEL_19:
}

uint64_t __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0DAFDD8];
  objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:equalToLongLong:", *MEMORY[0x1E0DAFDD8], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF700], "queryWithDatabase:predicate:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)*MEMORY[0x1E0DAFDB8];
  v8 = MEMORY[0x1E0C809B0];
  location[0] = v7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_2;
  v16[3] = &unk_1E73A63A8;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:count:usingBlock:", location, 1, v16);
  objc_msgSend(MEMORY[0x1E0DAF618], "predicateWithProperty:equalToLongLong:", v4, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DAF700], "queryWithDatabase:predicate:", v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong(location, (id)*MEMORY[0x1E0DAFDC0]);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_3;
  v13[3] = &unk_1E73A1938;
  v14 = v3;
  v15 = *(id *)(a1 + 32);
  v11 = v3;
  objc_msgSend(v10, "enumeratePersistentIDsAndProperties:count:usingBlock:", location, 1, v13);

  return 1;
}

void __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  SKUIItem *v7;
  SKUIAddToWishlistOperation *v8;

  v5 = (void *)MEMORY[0x1BCCE6C7C]();
  if (*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", *a3, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SKUIItem initWithCacheRepresentation:]([SKUIItem alloc], "initWithCacheRepresentation:", v6);
      if (v7)
      {
        v8 = -[SKUIAddToWishlistOperation initWithItem:reason:]([SKUIAddToWishlistOperation alloc], "initWithItem:reason:", v7, 1);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

      }
    }

  }
  objc_autoreleasePoolPop(v5);
}

void __58__SKUISyncWishlistOperation__sendLocalChangesForWishlist___block_invoke_3(uint64_t a1, uint64_t a2, id *a3)
{
  void *v6;
  SKUIRemoveFromWishlistOperation *v7;

  v6 = (void *)MEMORY[0x1BCCE6C7C]();
  if (*a3)
  {
    v7 = -[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]([SKUIRemoveFromWishlistOperation alloc], "initWithItemIdentifier:entityIdentifier:reason:", objc_msgSend(*a3, "longLongValue"), a2, 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    v7 = (SKUIRemoveFromWishlistOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF700]), "initWithPersistentID:inDatabase:", a2, *(_QWORD *)(a1 + 32));
    -[SKUIRemoveFromWishlistOperation deleteFromDatabase](v7, "deleteFromDatabase");
  }

  objc_autoreleasePoolPop(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISyncWishlistOperation initWithClientContext:]";
}

@end

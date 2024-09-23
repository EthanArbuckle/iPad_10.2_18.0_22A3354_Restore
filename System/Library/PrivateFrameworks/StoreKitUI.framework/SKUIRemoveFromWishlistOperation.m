@implementation SKUIRemoveFromWishlistOperation

- (SKUIRemoveFromWishlistOperation)initWithItemIdentifier:(int64_t)a3 entityIdentifier:(int64_t)a4 reason:(int64_t)a5
{
  SKUIRemoveFromWishlistOperation *result;
  objc_super v10;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIRemoveFromWishlistOperation;
  result = -[SKUIRemoveFromWishlistOperation init](&v10, sel_init);
  if (result)
  {
    result->_entityID = a4;
    result->_itemID = a3;
    result->_reason = a5;
  }
  return result;
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  SKUIURLConnectionRequest *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  int64_t itemID;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  int v25;
  int64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  NSObject *v39;
  __int128 *v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  int64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DAF5C8]);
  objc_msgSend(v3, "setAllowedRetryCount:", 0);
  objc_msgSend(v3, "setCachePolicy:", 1);
  objc_msgSend(v3, "setITunesStoreRequest:", 1);
  objc_msgSend(v3, "setShouldProcessProtocol:", self->_reason == 0);
  objc_msgSend(v3, "setURLBagKey:", CFSTR("removeFromWishlistBaseUrl"));
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("Software"), *MEMORY[0x1E0DAFA60]);
  SSVDefaultUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("User-Agent"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), self->_itemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forRequestParameter:", v5, CFSTR("ids"));

  v6 = -[SSURLConnectionRequest initWithRequestProperties:]([SKUIURLConnectionRequest alloc], "initWithRequestProperties:", v3);
  -[SSURLConnectionRequest setShouldMescalSign:](v6, "setShouldMescalSign:", 1);
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccount");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF490]), "initWithAccount:", v36);
  -[SSURLConnectionRequest setAuthenticationContext:](v6, "setAuthenticationContext:");
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v9 |= 2u;
  objc_msgSend(v8, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (v11)
  {
    itemID = self->_itemID;
    LODWORD(v45) = 134217984;
    *(_QWORD *)((char *)&v45 + 4) = itemID;
    LODWORD(v32) = 12;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v45, v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();

    }
  }
  else
  {

  }
  *(_QWORD *)&v45 = 0;
  *((_QWORD *)&v45 + 1) = &v45;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__94;
  v48 = __Block_byref_object_dispose__94;
  v49 = 0;
  v15 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __39__SKUIRemoveFromWishlistOperation_main__block_invoke;
  v38[3] = &unk_1E73A8D30;
  v40 = &v45;
  v16 = v15;
  v39 = v16;
  -[SKUIURLConnectionRequest startWithConnectionResponseBlock:](v6, "startWithConnectionResponseBlock:", v38);
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 40);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v17, 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v18, "objectForKey:", CFSTR("status"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    v33 = objc_msgSend(v34, "integerValue");
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "shouldLog");
    v21 = objc_msgSend(v19, "shouldLogToDisk");
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
      v24 = v20 | 2;
    else
      v24 = v20;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      v25 = v24;
    else
      v25 = v24 & 2;
    if (v25)
    {
      v26 = self->_itemID;
      v41 = 134218240;
      v27 = v33;
      v42 = v33;
      v43 = 2048;
      v44 = v26;
      LODWORD(v32) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, &v41, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      free(v28);
      SSFileLog();
    }
    else
    {
      v27 = v33;
    }

LABEL_24:
    if (v27 <= 1)
    {
      v29 = objc_alloc(MEMORY[0x1E0DAF6F8]);
      objc_msgSend(v36, "uniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithAccountIdentifier:", objc_msgSend(v30, "longLongValue"));

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __39__SKUIRemoveFromWishlistOperation_main__block_invoke_27;
      v37[3] = &unk_1E73A63D0;
      v37[4] = self;
      objc_msgSend(v31, "performTransactionWithBlock:", v37);

    }
    goto LABEL_26;
  }
LABEL_28:

  _Block_object_dispose(&v45, 8);
}

intptr_t __39__SKUIRemoveFromWishlistOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "bodyData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __39__SKUIRemoveFromWishlistOperation_main__block_invoke_27(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (objc_class *)MEMORY[0x1E0DAF700];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPersistentID:inDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), v4);

  v6 = objc_msgSend(v5, "deleteFromDatabase");
  return v6;
}

- (void)initWithItemIdentifier:entityIdentifier:reason:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRemoveFromWishlistOperation initWithItemIdentifier:entityIdentifier:reason:]";
}

@end

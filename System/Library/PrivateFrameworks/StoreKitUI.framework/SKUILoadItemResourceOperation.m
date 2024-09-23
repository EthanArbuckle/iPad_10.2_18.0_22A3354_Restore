@implementation SKUILoadItemResourceOperation

- (SKUILoadItemResourceOperation)initWithResourceRequest:(id)a3
{
  id v4;
  SKUILoadItemResourceOperation *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadItemResourceOperation initWithResourceRequest:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadItemResourceOperation;
  v5 = -[SKUILoadResourceOperation initWithResourceRequest:](&v7, sel_initWithResourceRequest_, v4);

  return v5;
}

- (void)main
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;

  -[SKUILoadResourceOperation clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DAF6B0]);
  objc_msgSend(v3, "platformContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPlatformContext:", v5);

  -[SKUILoadResourceOperation resourceRequest](self, "resourceRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageProfile:", v8);

  objc_msgSend(v7, "keyProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyProfile:", v9);

  objc_msgSend(v3, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStoreFrontSuffix:", v10);

  objc_msgSend(v7, "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItemIdentifiers:", v11);
  -[SKUILoadResourceOperation outputBlock](self, "outputBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __37__SKUILoadItemResourceOperation_main__block_invoke;
  v18 = &unk_1E73A6630;
  v19 = v11;
  v20 = v12;
  v13 = v11;
  v14 = v12;
  objc_msgSend(v6, "setResponseBlock:", &v15);
  -[SKUILoadItemResourceOperation setUnderlyingOperation:](self, "setUnderlyingOperation:", v6, v15, v16, v17, v18);
  objc_msgSend(v6, "main");

}

void __37__SKUILoadItemResourceOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SKUILoadItemsResponse *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  SKUIItem *v17;
  void *v18;
  SKUIItem *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = objc_alloc_init(SKUILoadItemsResponse);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v22 = a1;
      v23 = v6;
      v24 = v5;
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v21 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v17 = [SKUIItem alloc];
            objc_msgSend(v16, "lookupDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[SKUIItem initWithLookupDictionary:](v17, "initWithLookupDictionary:", v18);

            if (v19)
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", -[SKUIItem itemIdentifier](v19, "itemIdentifier"));
              objc_msgSend(v10, "setObject:forKey:", v19, v20);
              objc_msgSend(v8, "removeObject:", v20);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v6 = v23;
      v5 = v24;
      a1 = v22;
      v9 = v21;
    }
    else
    {
      v10 = 0;
    }
    -[SKUILoadItemsResponse setInvalidItemIdentifiers:](v7, "setInvalidItemIdentifiers:", v8);
    -[SKUILoadItemsResponse setLoadedItems:](v7, "setLoadedItems:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILoadItemResourceOperation;
  -[SKUILoadResourceOperation cancel](&v4, sel_cancel);
  -[SKUILoadItemResourceOperation underlyingOperation](self, "underlyingOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (SSVPlatformRequestOperation)underlyingOperation
{
  return (SSVPlatformRequestOperation *)objc_loadWeakRetained((id *)&self->_underlyingOperation);
}

- (void)setUnderlyingOperation:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingOperation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_underlyingOperation);
}

- (void)initWithResourceRequest:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadItemResourceOperation initWithResourceRequest:]";
}

@end

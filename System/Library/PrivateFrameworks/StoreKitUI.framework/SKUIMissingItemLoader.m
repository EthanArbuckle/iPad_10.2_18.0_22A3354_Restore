@implementation SKUIMissingItemLoader

- (SKUIMissingItemLoader)init
{
  return -[SKUIMissingItemLoader initWithResourceLoader:](self, "initWithResourceLoader:", 0);
}

- (SKUIMissingItemLoader)initWithResourceLoader:(id)a3
{
  id v5;
  SKUIMissingItemLoader *v6;
  SKUIMissingItemLoader *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *requests;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMissingItemLoader initWithResourceLoader:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMissingItemLoader;
  v6 = -[SKUIMissingItemLoader init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_batchSize = 25;
    objc_storeStrong((id *)&v6->_keyProfile, (id)*MEMORY[0x1E0DAFA90]);
    objc_storeStrong((id *)&v7->_loader, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requests = v7->_requests;
    v7->_requests = v8;

  }
  return v7;
}

- (void)loadItemsForPageComponent:(id)a3 startIndex:(int64_t)a4 reason:(int64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, BOOL *);
  void *v15;
  id v16;
  SKUIMissingItemLoader *v17;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__SKUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke;
  v15 = &unk_1E73A34D0;
  v11 = v10;
  v16 = v11;
  v17 = self;
  objc_msgSend(v9, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", a4, &v12);

  if (objc_msgSend(v11, "count", v12, v13, v14, v15))
    -[SKUIMissingItemLoader loadItemsWithIdentifiers:reason:](self, "loadItemsWithIdentifiers:reason:", v11, a5);

}

uint64_t __69__SKUIMissingItemLoader_loadItemsForPageComponent_startIndex_reason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *a4 = result == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  return result;
}

- (void)loadItemsWithIdentifiers:(id)a3 reason:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[SKUIMissingItemLoader _existingRequestIDForItemID:](self, "_existingRequestIDForItemID:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14
          || !-[SKUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_loader, "trySetReason:forRequestWithIdentifier:", a4, objc_msgSend(v13, "unsignedIntegerValue")))
        {
          objc_msgSend(v7, "addObject:", v13);
          if (objc_msgSend(v7, "count") == self->_batchSize)
          {
            -[SKUIMissingItemLoader _requestItems:withReason:](self, "_requestItems:withReason:", v7, a4);
            objc_msgSend(v7, "removeAllObjects");
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
    -[SKUIMissingItemLoader _requestItems:withReason:](self, "_requestItems:withReason:", v7, a4);

}

- (void)itemRequest:(id)a3 didFinishWithItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v8;
  NSMutableDictionary *requests;
  void *v10;
  id WeakRetained;
  id v12;

  v12 = a4;
  v8 = a5;
  requests = self->_requests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "requestIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](requests, "removeObjectForKey:", v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "missingItemLoader:didLoadItems:invalidItemIdentifiers:", self, v12, v8);

}

- (id)_existingRequestIDForItemID:(id)a3
{
  id v4;
  NSMutableDictionary *requests;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__79;
  v16 = __Block_byref_object_dispose__79;
  v17 = 0;
  requests = self->_requests;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SKUIMissingItemLoader__existingRequestIDForItemID___block_invoke;
  v9[3] = &unk_1E73A7B50;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__SKUIMissingItemLoader__existingRequestIDForItemID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_requestItems:(id)a3 withReason:(int64_t)a4
{
  id v6;
  NSMutableDictionary *requests;
  void *v8;
  SKUIItemResourceRequest *v9;

  v6 = a3;
  v9 = objc_alloc_init(SKUIItemResourceRequest);
  -[SKUIItemResourceRequest setDelegate:](v9, "setDelegate:", self);
  -[SKUIItemResourceRequest setImageProfile:](v9, "setImageProfile:", self->_imageProfile);
  -[SKUIItemResourceRequest setItemIdentifiers:](v9, "setItemIdentifiers:", v6);
  -[SKUIItemResourceRequest setKeyProfile:](v9, "setKeyProfile:", self->_keyProfile);
  requests = self->_requests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v9, "requestIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](requests, "setObject:forKey:", v6, v8);

  -[SKUIResourceLoader loadResourceWithRequest:reason:](self->_loader, "loadResourceWithRequest:reason:", v9, a4);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (SKUIMissingItemDelegate)delegate
{
  return (SKUIMissingItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithResourceLoader:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMissingItemLoader initWithResourceLoader:]";
}

@end

@implementation SFUILoadedMetadataCollection

- (SFUILoadedMetadataCollection)initWithMetadatas:(id)a3
{
  id v4;
  SFUILoadedMetadataCollection *v5;
  uint64_t v6;
  NSArray *metadatas;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFUILoadedMetadataCollection;
  v5 = -[SFUILoadedMetadataCollection init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    metadatas = v5->_metadatas;
    v5->_metadatas = (NSArray *)v6;

    SFUILinkMetadataSerializationForLocalLowFidelityUseOnly(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUILoadedMetadataCollection setLoadedSerializedMetadatas:](v5, "setLoadedSerializedMetadatas:", v8);

    -[SFUILoadedMetadataCollection _listenForMetadataChanges](v5, "_listenForMetadataChanges");
    -[SFUILoadedMetadataCollection _load](v5, "_load");
  }

  return v5;
}

- (void)_listenForMetadataChanges
{
  NSMutableArray *v3;
  NSMutableArray *headerMetadataObservers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id obj;
  _QWORD v13[5];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  headerMetadataObservers = self->_headerMetadataObservers;
  self->_headerMetadataObservers = v3;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SFUILoadedMetadataCollection metadatas](self, "metadatas");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "_populateMetadataForBackwardCompatibility");
        location = 0;
        objc_initWeak(&location, self);
        v10 = objc_alloc(getLPLinkMetadataObserverClass());
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __57__SFUILoadedMetadataCollection__listenForMetadataChanges__block_invoke;
        v13[3] = &unk_24CE0F378;
        objc_copyWeak(&v14, &location);
        v13[4] = v9;
        v11 = (void *)objc_msgSend(v10, "initWithMetadata:callback:", v9, v13);
        -[NSMutableArray addObject:](self->_headerMetadataObservers, "addObject:", v11);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

void __57__SFUILoadedMetadataCollection__listenForMetadataChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_metadataDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)_metadataDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_212728000, v5, OS_LOG_TYPE_DEFAULT, "did update metadata:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SFUILoadedMetadataCollection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataCollection:didChangeMetadata:", self, v4);

}

- (void)_load
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SFUILoadedMetadataCollection *val;
  _QWORD block[4];
  id v15;
  id location;
  _QWORD v17[4];
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  val = self;
  -[SFUILoadedMetadataCollection metadatas](self, "metadatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        dispatch_group_enter(v3);
        objc_msgSend(v4, "addObject:", v11);
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __37__SFUILoadedMetadataCollection__load__block_invoke;
        v17[3] = &unk_24CE0F4B0;
        v18 = v4;
        v19 = v11;
        v20 = v3;
        objc_msgSend(v11, "_loadAsynchronousFieldsWithUpdateHandler:", v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
  {
    location = 0;
    objc_initWeak(&location, val);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __37__SFUILoadedMetadataCollection__load__block_invoke_2;
    block[3] = &unk_24CE0ECE8;
    objc_copyWeak(&v15, &location);
    v12 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SFUILoadedMetadataCollection _didFinishLoading](val, "_didFinishLoading");
  }

}

void __37__SFUILoadedMetadataCollection__load__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __37__SFUILoadedMetadataCollection__load__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didFinishLoading");

}

- (void)_didFinishLoading
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[SFUILoadedMetadataCollection metadatas](self, "metadatas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUILoadedMetadataCollection setLoadedMetadatas:](self, "setLoadedMetadatas:", v3);

  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SFUILoadedMetadataCollection loadedMetadatas](self, "loadedMetadatas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_212728000, v4, OS_LOG_TYPE_DEFAULT, "did finish loading metadata:%@", buf, 0xCu);

  }
  -[SFUILoadedMetadataCollection loadedMetadatas](self, "loadedMetadatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke;
  v7[3] = &unk_24CE0F4D8;
  v7[4] = self;
  SFUILinkMetadataSerializationForLocalUseOnly(v6, v7);

}

void __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  sf_dispatch_on_main_queue();

}

void __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setLoadedSerializedMetadatas:", *(_QWORD *)(a1 + 40));
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "loadedSerializedMetadatas");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_212728000, v2, OS_LOG_TYPE_DEFAULT, "did finish serializing loaded metadata:%@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataCollectionDidFinishLoading:", *(_QWORD *)(a1 + 32));

}

- (NSArray)metadatas
{
  return self->_metadatas;
}

- (SFUILoadedMetadataCollectionDelegate)delegate
{
  return (SFUILoadedMetadataCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)loadedMetadatas
{
  return self->_loadedMetadatas;
}

- (void)setLoadedMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)loadedSerializedMetadatas
{
  return self->_loadedSerializedMetadatas;
}

- (void)setLoadedSerializedMetadatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)headerMetadataObservers
{
  return self->_headerMetadataObservers;
}

- (void)setHeaderMetadataObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerMetadataObservers, 0);
  objc_storeStrong((id *)&self->_loadedSerializedMetadatas, 0);
  objc_storeStrong((id *)&self->_loadedMetadatas, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadatas, 0);
}

@end

@implementation QLFPItemFetcher

- (QLFPItemFetcher)initWithFPItem:(id)a3 shouldZipPackageIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  QLFPItemFetcher *v8;
  QLFPItemFetcher *v9;
  QLFPItemFetcher *v10;

  v4 = a4;
  v7 = a3;
  v8 = -[QLUbiquitousItemFetcher initWithZippingPackageIfNeeded:](self, "initWithZippingPackageIfNeeded:", v4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fpItem, a3);
    v10 = v9;
  }

  return v9;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v18[3] = &unk_1E9EFC4B0;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[QLFPItemFetcher _urlHandler:](self, "_urlHandler:", v18);

}

void __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerItemCollectionIfNeeded");
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v8[3] = &unk_1E9EFC488;
    v8[4] = v4;
    v9 = *(id *)(a1 + 64);
    v7.receiver = v4;
    v7.super_class = (Class)QLFPItemFetcher;
    objc_msgSendSuper2(&v7, sel_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock_, v3, v5, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __92__QLFPItemFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_unregisterItemCollectionIfNeeded");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_registerItemCollectionIfNeeded
{
  void *v2;
  void *v3;
  uint64_t v4;
  FPItemCollection *itemCollection;
  FPItemCollection *v6;
  QLFPItemFetcher *obj;
  _QWORD v8[4];
  id v9;
  QLFPItemFetcher *v10;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_itemCollection)
  {
    objc_sync_exit(obj);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem itemID](obj->_fpItem, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "newCollectionWithItemID:", v3);
    itemCollection = obj->_itemCollection;
    obj->_itemCollection = (FPItemCollection *)v4;

    v6 = obj->_itemCollection;
    obj->_itemCollection = 0;

    objc_sync_exit(obj);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__QLFPItemFetcher__registerItemCollectionIfNeeded__block_invoke;
    v8[3] = &unk_1E9EFBFC8;
    v9 = 0;
    v10 = obj;
    QLRunInMainThread(v8);

  }
}

uint64_t __50__QLFPItemFetcher__registerItemCollectionIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "startObserving");
}

- (void)_unregisterItemCollectionIfNeeded
{
  QLFPItemFetcher *v2;
  FPItemCollection *v3;
  FPItemCollection *itemCollection;
  _QWORD v5[4];
  FPItemCollection *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_itemCollection;
  itemCollection = v2->_itemCollection;
  v2->_itemCollection = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__QLFPItemFetcher__unregisterItemCollectionIfNeeded__block_invoke;
    v5[3] = &unk_1E9EFC370;
    v6 = v3;
    QLRunInMainThread(v5);

  }
}

uint64_t __52__QLFPItemFetcher__unregisterItemCollectionIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "stopObserving");
}

- (void)_urlHandler:(id)a3
{
  id v4;
  void *v5;
  QLURLHandler *fetchedURLHandler;
  void *v7;
  FPItem *fpItem;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  fetchedURLHandler = self->_fetchedURLHandler;
  if (fetchedURLHandler)
  {
    (*((void (**)(id, QLURLHandler *, _QWORD))v4 + 2))(v4, fetchedURLHandler, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    fpItem = self->_fpItem;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__QLFPItemFetcher__urlHandler___block_invoke;
    v9[3] = &unk_1E9EFC4D8;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v7, "fetchURLForItem:completionHandler:", fpItem, v9);

  }
}

void __31__QLFPItemFetcher__urlHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void);
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v13 = (NSObject **)MEMORY[0x1E0D83678];
    v14 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch url for item: %@ error:%@ #Downloading", (uint8_t *)&v16, 0x16u);
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CD3300]);
    v9 = objc_msgSend(v8, "initWithURL:sandboxType:", v5, *MEMORY[0x1E0CD3378]);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = v9;

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

}

- (void)dealloc
{
  objc_super v3;

  -[QLFPItemFetcher _unregisterItemCollectionIfNeeded](self, "_unregisterItemCollectionIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)QLFPItemFetcher;
  -[QLUbiquitousItemFetcher dealloc](&v3, sel_dealloc);
}

- (id)fileURL
{
  return (id)-[QLURLHandler fileURL](self->_fetchedURLHandler, "fileURL");
}

- (id)shareableItem
{
  return (id)-[QLURLHandler fileURL](self->_fetchedURLHandler, "fileURL");
}

- (BOOL)isLongFetchOperation
{
  int v3;

  v3 = -[FPItem isCloudItem](self->_fpItem, "isCloudItem");
  if (v3)
    LOBYTE(v3) = -[FPItem isDownloaded](self->_fpItem, "isDownloaded") ^ 1;
  return v3;
}

- (id)itemSize
{
  return (id)-[FPItem documentSize](self->_fpItem, "documentSize");
}

- (void)prepareShareableItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__QLFPItemFetcher_prepareShareableItem___block_invoke;
  v6[3] = &unk_1E9EFC528;
  v7 = v4;
  v5 = v4;
  -[QLFPItemFetcher _urlHandler:](self, "_urlHandler:", v6);

}

void __40__QLFPItemFetcher_prepareShareableItem___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __40__QLFPItemFetcher_prepareShareableItem___block_invoke_2;
  v1[3] = &unk_1E9EFC500;
  v2 = *(id *)(a1 + 32);
  QLRunInMainThread(v1);

}

uint64_t __40__QLFPItemFetcher_prepareShareableItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLFPItemFetcher;
  v4 = a3;
  -[QLUbiquitousItemFetcher encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fpItem, CFSTR("fpItem"), v5.receiver, v5.super_class);

}

- (QLFPItemFetcher)initWithCoder:(id)a3
{
  id v4;
  QLFPItemFetcher *v5;
  uint64_t v6;
  FPItem *fpItem;
  QLFPItemFetcher *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLFPItemFetcher;
  v5 = -[QLUbiquitousItemFetcher initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    fpItem = v5->_fpItem;
    v5->_fpItem = (FPItem *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  objc_storeStrong((id *)&self->_fpItem, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_fetchedURLHandler, 0);
  objc_storeStrong((id *)&self->_fpItem, 0);
}

@end

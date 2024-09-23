@implementation WFFPItemResolver

- (WFFPItemResolver)initWithDomainID:(id)a3 relativeSubpath:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFFPItemResolver *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  void *v20;
  uint64_t v21;
  id completionHandler;
  NSObject *v23;
  id *v24;
  WFFPItemResolver *v25;
  void *v27;
  uint64_t v28;
  FPItemCollection *collection;
  void *v30;
  void *v31;
  _QWORD block[4];
  WFFPItemResolver *v33;
  _QWORD v34[4];
  WFFPItemResolver *v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFPItemResolver.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainID"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFPItemResolver.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativeSubpath"));

LABEL_3:
  v12 = -[WFFPItemResolver init](self, "init");
  if (v12)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CAACA8], "providerDomainWithID:error:", v9, &v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v36;
    if (v13)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = dispatch_queue_create("com.apple.shortcuts.WFFPItemResolver", v16);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v17;

      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("/"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      v21 = objc_msgSend(v11, "copy");
      completionHandler = v12->_completionHandler;
      v12->_completionHandler = (id)v21;

      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("/")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", &stru_1E7AFA810) & 1) != 0
        || objc_msgSend(v20, "count") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
        v23 = objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke;
        v34[3] = &unk_1E7AEE2D8;
        v24 = (id *)&v35;
        v35 = v12;
        -[NSObject fetchRootItemForProviderDomain:completionHandler:](v23, "fetchRootItemForProviderDomain:completionHandler:", v13, v34);
      }
      else
      {
        objc_msgSend(v20, "removeObjectAtIndex:", 0);
        objc_storeStrong((id *)&v12->_mutableComponents, v20);
        objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rootCollectionForProviderDomain:", v13);
        v28 = objc_claimAutoreleasedReturnValue();
        collection = v12->_collection;
        v12->_collection = (FPItemCollection *)v28;

        -[FPItemCollection setDelegate:](v12->_collection, "setDelegate:", v12);
        -[FPItemCollection setWorkingQueue:](v12->_collection, "setWorkingQueue:", v12->_queue);
        -[WFFPItemResolver queue](v12, "queue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke_2;
        block[3] = &unk_1E7AF94B0;
        v24 = (id *)&v33;
        v33 = v12;
        dispatch_async(v23, block);
      }

      v25 = v12;
    }
    else
    {
      getWFFilesLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[WFFPItemResolver initWithDomainID:relativeSubpath:completionHandler:]";
        v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s Could not get provider domain with error: %@", buf, 0x16u);
      }
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFFilesLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[WFFPItemResolver collectionDidFinishGathering:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Collection Finished gathering with items: %@", (uint8_t *)&v7, 0x16u);

  }
  -[WFFPItemResolver determineNextItemIfPossible](self, "determineNextItemIfPossible");

}

- (void)determineNextItemIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  getWFFilesLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WFFPItemResolver mutableComponents](self, "mutableComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFFPItemResolver determineNextItemIfPossible]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Determining next item with mutable components: %@", buf, 0x16u);

  }
  -[WFFPItemResolver mutableComponents](self, "mutableComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[WFFPItemResolver mutableComponents](self, "mutableComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFFPItemResolver mutableComponents](self, "mutableComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

    -[WFFPItemResolver mutableComponents](self, "mutableComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[WFFPItemResolver collection](self, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = MEMORY[0x1E0C809B0];
      v14 = __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke_2;
      v15 = &v17;
    }
    else
    {
      v18 = MEMORY[0x1E0C809B0];
      v14 = __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke;
      v15 = &v18;
    }
    v15[1] = 3221225472;
    v15[2] = (uint64_t)v14;
    v15[3] = (uint64_t)&unk_1E7AEE300;
    v15[4] = (uint64_t)v8;
    v15[5] = (uint64_t)self;
    v16 = v8;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    -[WFFPItemResolver completionHandler](self, "completionHandler");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

}

- (void)startObservingFolderItemCollection:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFFilesLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFFPItemResolver startObservingFolderItemCollection:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Observing new item: %@", buf, 0x16u);
  }

  -[WFFPItemResolver queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__WFFPItemResolver_startObservingFolderItemCollection___block_invoke;
  v8[3] = &unk_1E7AF92C0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (FPItemCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)mutableComponents
{
  return self->_mutableComponents;
}

- (void)setMutableComponents:(id)a3
{
  objc_storeStrong((id *)&self->_mutableComponents, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableComponents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

void __55__WFFPItemResolver_startObservingFolderItemCollection___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "observing");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopObserving");

  }
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionForFolderItem:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCollection:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWorkingQueue:", v9);

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startObserving");

}

void __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v7 = objc_msgSend(v9, "isFolder");

    v8 = v9;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "startObservingFolderItemCollection:", v9);
      v8 = v9;
      *a4 = 1;
    }
  }
  else
  {

    v8 = v9;
  }

}

void __47__WFFPItemResolver_determineNextItemIfPossible__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a2;
  objc_msgSend(v9, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v9, 0);

    *a4 = 1;
  }

}

void __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void (**v7)(id, id, id);

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "completionHandler");
  v7 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6, v5);

}

uint64_t __71__WFFPItemResolver_initWithDomainID_relativeSubpath_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startObserving");
}

@end

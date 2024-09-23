@implementation SSVMediaContentTasteController

- (SSVMediaContentTasteController)init
{
  SSVMediaContentTasteController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessSerialQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutSerialQueue;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  NSMutableDictionary *contentTasteItemsToRetry;
  uint64_t v11;
  NSMutableDictionary *storeAdamIDToContentTasteItem;
  uint64_t v13;
  NSMutableDictionary *storeAdamIDToPendingContentTasteItem;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SSVMediaContentTasteController;
  v2 = -[SSVMediaContentTasteController init](&v22, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVMediaContentTasteController.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.StoreServices.SSVMediaContentTasteController.calloutSerialQueue", 0);
    calloutSerialQueue = v2->_calloutSerialQueue;
    v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = (const char *)_SSVMediaContentTasteControllerItemsDidChangeGlobalNotificationName;
    v8 = v2->_accessSerialQueue;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __38__SSVMediaContentTasteController_init__block_invoke;
    v19 = &unk_1E47BA110;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v7, &v2->_itemsDidChangeNotifyToken, v8, &v16);
    v2->_havePendingRetryOperation = 0;
    v2->_exponentialBackOffSeconds = 120;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v16, v17, v18, v19);
    v9 = objc_claimAutoreleasedReturnValue();
    contentTasteItemsToRetry = v2->_contentTasteItemsToRetry;
    v2->_contentTasteItemsToRetry = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    storeAdamIDToContentTasteItem = v2->_storeAdamIDToContentTasteItem;
    v2->_storeAdamIDToContentTasteItem = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    storeAdamIDToPendingContentTasteItem = v2->_storeAdamIDToPendingContentTasteItem;
    v2->_storeAdamIDToPendingContentTasteItem = (NSMutableDictionary *)v13;

    -[SSVMediaContentTasteController _refreshContentTasteItems](v2, "_refreshContentTasteItems");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__SSVMediaContentTasteController_init__block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t state64;
  int v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_27;
  state64 = 0;
  notify_get_state(a2, &state64);
  WeakRetained[4] = state64;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  v6 = objc_msgSend(v4, "shouldLogToDisk");
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v5 |= 2u;
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = WeakRetained[3];
  v37 = 138412802;
  v38 = v10;
  v39 = 2048;
  v40 = state64;
  v41 = 2048;
  v42 = v11;
  LODWORD(v35) = 32;
  v34 = &v37;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v37, v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v4, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_11:

  }
  if (WeakRetained[7])
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v19, "shouldLog", v34);
    v21 = objc_msgSend(v19, "shouldLogToDisk");
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
      v20 |= 2u;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      v20 &= 2u;
    if (v20)
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = WeakRetained[7];
      v37 = 138412546;
      v38 = v25;
      v39 = 2048;
      v40 = v26;
      LODWORD(v35) = 22;
      v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
      {
LABEL_23:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v37, v35);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      free(v27);
      SSFileLog(v19, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v23);
    }

    goto LABEL_23;
  }
  if (WeakRetained[3] < state64 || state64 == 0xFFFFFFFF)
    objc_msgSend(WeakRetained, "_refreshContentTasteItems", v34);
LABEL_27:

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_itemsDidChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVMediaContentTasteController;
  -[SSVMediaContentTasteController dealloc](&v3, sel_dealloc);
}

+ (id)defaultMediaTasteController
{
  return 0;
}

- (unint64_t)contentTasteTypeForPlaylistGlobalID:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SSVMediaContentTasteController_contentTasteTypeForPlaylistGlobalID___block_invoke;
  block[3] = &unk_1E47BA138;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(accessSerialQueue, block);
  v7 = objc_msgSend((id)v13[5], "tasteType");

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__SSVMediaContentTasteController_contentTasteTypeForPlaylistGlobalID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 64), "objectForKey:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (unint64_t)contentTasteTypeForStoreAdamID:(int64_t)a3
{
  NSObject *accessSerialQueue;
  unint64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SSVMediaContentTasteController_contentTasteTypeForStoreAdamID___block_invoke;
  block[3] = &unk_1E47BA160;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(accessSerialQueue, block);
  v4 = objc_msgSend((id)v8[5], "tasteType");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__SSVMediaContentTasteController_contentTasteTypeForStoreAdamID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1[4] + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v6 = *(void **)(a1[4] + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (void)setContentTasteType:(unint64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *accessSerialQueue;
  void *v12;
  NSObject *calloutSerialQueue;
  _QWORD block[5];
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E47BA228;
    block[4] = self;
    v15 = v8;
    v17 = a3;
    v16 = v10;
    dispatch_async(accessSerialQueue, block);

    v12 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v9)
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E47BA188;
    v19 = v9;
    dispatch_async(calloutSerialQueue, v18);
    v12 = v19;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  SSVMediaContentTasteItemUpdate *v5;
  SSVMutableMediaContentTasteItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SSVMediaContentTasteItemUpdate *v11;
  _QWORD v12[5];
  id v13;
  SSVMediaContentTasteItemUpdate *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

  }
  v5 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  v6 = objc_alloc_init(SSVMutableMediaContentTasteItem);
  -[SSVMutableMediaContentTasteItem setPlaylistGlobalID:](v6, "setPlaylistGlobalID:", *(_QWORD *)(a1 + 40));
  -[SSVMutableMediaContentTasteItem setContentType:](v6, "setContentType:", 4);
  -[SSVMutableMediaContentTasteItem setTasteType:](v6, "setTasteType:", *(_QWORD *)(a1 + 56));
  -[SSVMediaContentTasteItemUpdate setItem:](v5, "setItem:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVMediaContentTasteItemUpdate setUpdateDate:](v5, "setUpdateDate:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v8 = *(void **)(a1 + 32);
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E47BA200;
  v10 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v11 = v5;
  v14 = v11;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v8, "_sendUpdateWithItemUpdates:completionHandler:", v9, v12);

}

void __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E47BA1B0;
  block[4] = v5;
  v17 = v6;
  v18 = *(id *)(a1 + 48);
  v8 = v3;
  v19 = v8;
  dispatch_async(v7, block);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_5;
  v13[3] = &unk_1E47BA1D8;
  v13[4] = v9;
  v11 = *(id *)(a1 + 56);
  v14 = v8;
  v15 = v11;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 72);
    *(_QWORD *)(v2 + 72) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "_contentTasteForItemUpdate:finishedWithError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __96__SSVMediaContentTasteController_setContentTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVMediaContentTasteControllerItemsDidChangeNotification"), a1[4]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

- (void)setContentTasteType:(unint64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  NSObject *accessSerialQueue;
  void *v13;
  NSObject *calloutSerialQueue;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD block[4];
  id v21;

  v10 = a6;
  v11 = v10;
  if (a4)
  {
    accessSerialQueue = self->_accessSerialQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2;
    v15[3] = &unk_1E47BA2A0;
    v18 = a5;
    v19 = a3;
    v17 = a4;
    v15[4] = self;
    v16 = v10;
    dispatch_async(accessSerialQueue, v15);
    v13 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke;
    block[3] = &unk_1E47BA188;
    v21 = v10;
    dispatch_async(calloutSerialQueue, block);
    v13 = v21;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2(uint64_t a1)
{
  SSVMediaContentTasteItemUpdate *v2;
  SSVMutableMediaContentTasteItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SSVMediaContentTasteItemUpdate *v12;
  _QWORD v13[5];
  SSVMediaContentTasteItemUpdate *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  v3 = objc_alloc_init(SSVMutableMediaContentTasteItem);
  -[SSVMutableMediaContentTasteItem setStoreAdamID:](v3, "setStoreAdamID:", *(_QWORD *)(a1 + 48));
  -[SSVMutableMediaContentTasteItem setContentType:](v3, "setContentType:", *(_QWORD *)(a1 + 56));
  -[SSVMutableMediaContentTasteItem setTasteType:](v3, "setTasteType:", *(_QWORD *)(a1 + 64));
  -[SSVMediaContentTasteItemUpdate setItem:](v2, "setItem:", v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVMediaContentTasteItemUpdate setUpdateDate:](v2, "setUpdateDate:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  v9 = *(void **)(a1 + 32);
  v17[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3;
  v13[3] = &unk_1E47BA278;
  v11 = *(_QWORD *)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 32);
  v16 = v11;
  v12 = v2;
  v14 = v12;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v9, "_sendUpdateWithItemUpdates:completionHandler:", v10, v13);

}

void __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4;
  block[3] = &unk_1E47BA250;
  v8 = *(_QWORD *)(a1 + 56);
  block[4] = v4;
  v20 = v8;
  v18 = v5;
  v9 = v3;
  v19 = v9;
  dispatch_async(v6, block);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_5;
  v14[3] = &unk_1E47BA1D8;
  v14[4] = v10;
  v12 = *(id *)(a1 + 48);
  v15 = v9;
  v16 = v12;
  v13 = v9;
  dispatch_async(v11, v14);

}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_contentTasteForItemUpdate:finishedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __103__SSVMediaContentTasteController_setContentTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVMediaContentTasteControllerItemsDidChangeNotification"), a1[4]);

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

- (void)_handleContentTasteItemsUpdateResponse:(id)a3 allowNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableDictionary *playlistGlobalIDToContentTasteItem;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  NSMutableDictionary *storeAdamIDToContentTasteItem;
  void *v19;
  NSMutableDictionary *v20;
  NSObject *calloutSerialQueue;
  _BOOL4 v22;
  _QWORD block[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "responseRevisionID");
  if (self->_currentResponseRevisionID < v7)
  {
    self->_currentResponseRevisionID = v7;
    -[NSMutableDictionary removeAllObjects](self->_storeAdamIDToContentTasteItem, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_playlistGlobalIDToContentTasteItem, "removeAllObjects");
    v22 = v4;
    objc_msgSend(v6, "contentTasteItems");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "playlistGlobalID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            playlistGlobalIDToContentTasteItem = self->_playlistGlobalIDToContentTasteItem;
            if (!playlistGlobalIDToContentTasteItem)
            {
              v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
              v16 = self->_playlistGlobalIDToContentTasteItem;
              self->_playlistGlobalIDToContentTasteItem = v15;

              playlistGlobalIDToContentTasteItem = self->_playlistGlobalIDToContentTasteItem;
            }
            -[NSMutableDictionary setObject:forKey:](playlistGlobalIDToContentTasteItem, "setObject:forKey:", v12, v13);
          }
          else
          {
            v17 = objc_msgSend(v12, "storeAdamID");
            if (v17)
            {
              storeAdamIDToContentTasteItem = self->_storeAdamIDToContentTasteItem;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](storeAdamIDToContentTasteItem, "setObject:forKey:", v12, v19);

            }
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    if (!-[NSMutableDictionary count](self->_playlistGlobalIDToContentTasteItem, "count"))
    {
      v20 = self->_playlistGlobalIDToContentTasteItem;
      self->_playlistGlobalIDToContentTasteItem = 0;

    }
    if (v22)
    {
      calloutSerialQueue = self->_calloutSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __92__SSVMediaContentTasteController__handleContentTasteItemsUpdateResponse_allowNotifications___block_invoke;
      block[3] = &unk_1E47BA2C8;
      block[4] = self;
      dispatch_async(calloutSerialQueue, block);
    }

  }
}

void __92__SSVMediaContentTasteController__handleContentTasteItemsUpdateResponse_allowNotifications___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SSVMediaContentTasteControllerItemsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_refreshContentTasteItems
{
  SSVMediaContentTasteUpdateRequest *v3;
  _QWORD v4[5];

  v3 = objc_alloc_init(SSVMediaContentTasteUpdateRequest);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke;
  v4[3] = &unk_1E47BA318;
  v4[4] = self;
  -[SSVMediaContentTasteUpdateRequest startWithResponseBlock:](v3, "startWithResponseBlock:", v4);

}

void __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = v5;
  if (v5 && !a3)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke_2;
    v9[3] = &unk_1E47BA2F0;
    v9[4] = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

uint64_t __59__SSVMediaContentTasteController__refreshContentTasteItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleContentTasteItemsUpdateResponse:allowNotifications:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_contentTasteForItemUpdate:(id)a3 finishedWithError:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!v6 || !-[SSVMediaContentTasteController _isRetryableError:](self, "_isRetryableError:", v6))
    goto LABEL_18;
  objc_msgSend(v19, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "storeAdamID");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v19, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "storeAdamID"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v19, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playlistGlobalID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v19, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playlistGlobalID");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;

  if (v14)
  {
    -[NSMutableDictionary objectForKey:](self->_contentTasteItemsToRetry, "objectForKey:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_11:
  v15 = 1;
LABEL_12:
  objc_msgSend(v19, "updateDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    || (objc_msgSend(v13, "updateDate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v16, "compare:", v17),
        v17,
        v18 == 1))
  {
    if ((v15 & 1) == 0)
      -[NSMutableDictionary setObject:forKey:](self->_contentTasteItemsToRetry, "setObject:forKey:", v19, v14);
    -[SSVMediaContentTasteController _scheduleContentTasteUpdateOperationForFailedItems](self, "_scheduleContentTasteUpdateOperationForFailedItems");
  }

LABEL_18:
}

- (void)_retryOperationForItemUpdates:(id)a3 finishedWithError:(id)a4
{
  id v6;
  int exponentialBackOffSeconds;
  int v8;
  uint64_t v9;
  id v10;
  _QWORD v11[6];

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    if (-[SSVMediaContentTasteController _isRetryableError:](self, "_isRetryableError:", v6))
    {
      exponentialBackOffSeconds = self->_exponentialBackOffSeconds;
      if (exponentialBackOffSeconds <= 1799)
        v8 = 2 * exponentialBackOffSeconds;
      else
        v8 = 3600;
      self->_exponentialBackOffSeconds = v8;
      v9 = 1;
    }
    else
    {
      v9 = 0;
      self->_exponentialBackOffSeconds = 0;
    }
  }
  else
  {
    v9 = 0;
    self->_exponentialBackOffSeconds = 120;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__SSVMediaContentTasteController__retryOperationForItemUpdates_finishedWithError___block_invoke;
  v11[3] = &unk_1E47BA340;
  v11[4] = self;
  v11[5] = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __82__SSVMediaContentTasteController__retryOperationForItemUpdates_finishedWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "storeAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "storeAdamID"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "playlistGlobalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v3, "playlistGlobalID");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (!v5)
    goto LABEL_10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "updateDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "compare:", v9);

    if (v10 == 1)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      if (*(_QWORD *)(a1 + 40))
        objc_msgSend(v11, "setObject:forKey:", v12, v6);
      else
        objc_msgSend(v11, "removeObjectForKey:", v6);
    }
  }
LABEL_11:

}

- (BOOL)_isRetryableError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SSErrorDomain")))
    {
      v8 = objc_msgSend(v3, "code");

      if (v8 == 109)
      {
        objc_msgSend(v3, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKey:", CFSTR("SSErrorHTTPStatusCodeKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v10, "integerValue") == 500;

        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = 0;
    goto LABEL_8;
  }
  v6 = ((objc_msgSend(v3, "code") + 1009) & 0xFFFFFFFFFFFFFFF7) == 0;
LABEL_8:

  return v6;
}

- (void)_scheduleContentTasteUpdateOperationForFailedItems
{
  dispatch_time_t v3;
  NSObject *accessSerialQueue;
  _QWORD block[5];

  if (!self->_havePendingRetryOperation)
  {
    self->_havePendingRetryOperation = 1;
    v3 = dispatch_time(0, 1000000000 * self->_exponentialBackOffSeconds);
    accessSerialQueue = self->_accessSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke;
    block[3] = &unk_1E47BA2C8;
    block[4] = self;
    dispatch_after(v3, accessSerialQueue, block);
  }
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 80), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_2;
    v12[3] = &unk_1E47BA368;
    v7 = v5;
    v13 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
    v8 = *(void **)(a1 + 32);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_3;
    v10[3] = &unk_1E47BA3B8;
    v10[4] = v8;
    v9 = v7;
    v11 = v9;
    objc_msgSend(v8, "_sendUpdateWithItemUpdates:completionHandler:", v9, v10);

  }
  else
  {
    *(_BYTE *)(v3 + 40) = 0;
  }
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_2(uint64_t a1, void *a2)
{
  SSVMediaContentTasteItemUpdate *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_alloc_init(SSVMediaContentTasteItemUpdate);
  objc_msgSend(v7, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[SSVMediaContentTasteItemUpdate setItem:](v3, "setItem:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVMediaContentTasteItemUpdate setUpdateDate:](v3, "setUpdateDate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
}

void __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_4;
  block[3] = &unk_1E47BA390;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __84__SSVMediaContentTasteController__scheduleContentTasteUpdateOperationForFailedItems__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_retryOperationForItemUpdates:finishedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleContentTasteUpdateOperationForFailedItems");
  return result;
}

- (void)_sendUpdateWithItemUpdates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  SSVMediaContentTasteUpdateRequest *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  ++self->_pendingMutateRequestCount;
  v8 = objc_alloc_init(SSVMediaContentTasteUpdateRequest);
  -[SSVMediaContentTasteUpdateRequest setContentTasteItemUpdates:](v8, "setContentTasteItemUpdates:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke;
  v10[3] = &unk_1E47BA408;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  -[SSVMediaContentTasteUpdateRequest startWithResponseBlock:](v8, "startWithResponseBlock:", v10);

}

void __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_2;
  block[3] = &unk_1E47BA390;
  v9 = v6;
  v18 = v9;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = v11;
  dispatch_async(v7, block);
  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_3;
    v14[3] = &unk_1E47BA3E0;
    v16 = v12;
    v15 = v9;
    dispatch_async(v13, v14);

  }
}

uint64_t __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v1 = result;
  if (!*(_QWORD *)(result + 32))
  {
    v2 = *(_QWORD *)(result + 40);
    if (v2)
      result = objc_msgSend(*(id *)(result + 48), "_handleContentTasteItemsUpdateResponse:allowNotifications:", v2, 0);
  }
  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(_QWORD *)(v3 + 56);
  v5 = v4 < 1;
  v6 = v4 - 1;
  if (!v5)
  {
    *(_QWORD *)(v3 + 56) = v6;
    result = *(_QWORD *)(v1 + 48);
    if (!*(_QWORD *)(result + 56) && *(_QWORD *)(result + 32) > *(_QWORD *)(result + 24))
      return objc_msgSend((id)result, "_refreshContentTasteItems");
  }
  return result;
}

uint64_t __79__SSVMediaContentTasteController__sendUpdateWithItemUpdates_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAdamIDToPendingContentTasteItem, 0);
  objc_storeStrong((id *)&self->_storeAdamIDToContentTasteItem, 0);
  objc_storeStrong((id *)&self->_contentTasteItemsToRetry, 0);
  objc_storeStrong((id *)&self->_playlistGlobalIDToPendingContentTasteItem, 0);
  objc_storeStrong((id *)&self->_playlistGlobalIDToContentTasteItem, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end

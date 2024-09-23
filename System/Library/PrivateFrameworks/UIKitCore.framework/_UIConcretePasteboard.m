@implementation _UIConcretePasteboard

- (BOOL)_pasteboardCacheQueue_isPersistent
{
  void *v2;
  char v3;

  _pasteboardCacheQueue_existingItemCollectionWithName(self->_name, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPersistent");

  return v3;
}

- (id)_initWithName:(id)a3
{
  id v5;
  _UIConcretePasteboard *v6;
  _UIConcretePasteboard *v7;
  dispatch_group_t v8;
  OS_dispatch_group *saveCompletionGroup;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIConcretePasteboard;
  v6 = -[_UIConcretePasteboard init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = dispatch_group_create();
    saveCompletionGroup = v7->_saveCompletionGroup;
    v7->_saveCompletionGroup = (OS_dispatch_group *)v8;

  }
  return v7;
}

+ (id)generalPasteboard
{
  return (id)objc_msgSend(a1, "_pasteboardNamed:createIfNotFound:", CFSTR("com.apple.UIKit.pboard.general"), 1);
}

+ (id)_pasteboardNamed:(id)a3 createIfNotFound:(BOOL)a4
{
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  char v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__148;
    v26 = __Block_byref_object_dispose__148;
    v27 = 0;
    if ((objc_msgSend((id)UIApp, "_isActivating") & 1) != 0
      || objc_msgSend((id)UIApp, "_isResigningActive"))
    {
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general"));
    }
    else
    {
      v7 = 0;
    }
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    _pasteboardCacheQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke;
    block[3] = &unk_1E16D9EA0;
    v13 = &v22;
    v16 = v7;
    v17 = a4;
    v14 = &v18;
    v15 = a1;
    v12 = v6;
    dispatch_sync(v9, block);

    if (*((_BYTE *)v19 + 24))
      _sendPasteboardChangedNotification((void *)v23[5]);
    v8 = (id)v23[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)itemProviders
{
  return -[_UIConcretePasteboard itemProvidersWithRetryBehavior:](self, "itemProvidersWithRetryBehavior:", 1);
}

- (id)itemProvidersWithRetryBehavior:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UIItemProvider *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  _existingItemCollectionWithName(self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  objc_msgSend((id)objc_opt_class(), "_loadRequestContextForNonBlockingUIKitCall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "items", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    if (v3)
      v13 = &__block_literal_global_407;
    else
      v13 = 0;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = -[UIItemProvider initWithPBItem:loadRequestContext:secureRetryHandler:]([UIItemProvider alloc], "initWithPBItem:loadRequestContext:secureRetryHandler:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), v8, v13);
        objc_msgSend(v7, "addObject:", v15);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v7;
}

+ (id)_loadRequestContextForNonBlockingUIKitCall
{
  return (id)objc_msgSend(a1, "_loadRequestContextForBlockingUIKitCall:", 0);
}

+ (id)_loadRequestContextForBlockingUIKitCall:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (pthread_main_np() == 1)
  {
    if (v3)
      LODWORD(v5) = 3;
    else
      LODWORD(v5) = 1;
    if (objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate"))
      v5 = v5 | 4;
    else
      v5 = v5;
  }
  else
  {
    v5 = 1;
  }
  v6 = objc_alloc(MEMORY[0x1E0D6C0D0]);
  objc_msgSend(a1, "pasteSharingTokenFromOpenURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithOptions:pasteSharingToken:", v5, v7);

  return v8;
}

+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[4];
  id v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v39;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithNSItemProvider:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v14));
          objc_msgSend(v10, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v12);
    }

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__148;
    v36 = __Block_byref_object_dispose__148;
    v37 = 0;
    _pasteboardCacheQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __81___UIConcretePasteboard__pinItemProviders_forPasteboardNamed_withExpirationDate___block_invoke;
    v29 = &unk_1E16BACE0;
    v31 = &v32;
    v18 = v8;
    v30 = v18;
    dispatch_sync(v16, &v26);

    v19 = (void *)objc_msgSend((id)v33[5], "copyWithItems:", v10, v26, v27, v28, v29);
    objc_msgSend(v19, "setName:", v18);
    objc_msgSend(v19, "setLocalOnly:", 1);
    v20 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "setExpirationDate:", v20);
    if (!v9)

    v21 = v18;
    v22 = v19;
    _pasteboardCacheQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = ___setPinnedItemCollectionForName_block_invoke;
    block[3] = &unk_1E16B1B50;
    v43 = v21;
    v44 = v22;
    v24 = v21;
    v25 = v22;
    dispatch_sync(v23, block);

    _Block_object_dispose(&v32, 8);
  }

}

+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    _removePinnedItemCollectionForName(v3);

}

- (BOOL)_pasteboardCacheQueue_saveItemCollection:(id)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v21;

  v8 = a3;
  if (!objc_msgSend(v8, "isPersistent"))
  {
    _pasteboardCacheQueue_setItemCollectionForName(self->_name, v8);
    objc_msgSend(v8, "setChangeCount:", objc_msgSend(v8, "changeCount") + 1);
    v14 = 1;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  dispatch_group_enter((dispatch_group_t)self->_saveCompletionGroup);
  v9 = v8;
  _serverConnection();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataConsumersEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v10, "savePasteboard:dataProviderEndpoint:error:", v9, v11, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v21;
  v14 = v13 == 0;
  if (v13)
  {
    v15 = objc_retainAutorelease(v13);
    v16 = 0;
  }
  else
  {
    v16 = objc_retainAutorelease(v12);
  }

  v17 = v16;
  v18 = v13;
  if (v13)
  {
    objc_msgSend(v9, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not save pasteboard named %@. Error: %@"), v19, v18);
  }
  else
  {
    if (objc_msgSend(v9, "isPersistent"))
      _pasteboardCacheQueue_removeItemCollectionForName(self->_name);
    a4 = objc_msgSend(v17, "notificationState");
    objc_msgSend(v17, "sharingToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIConcretePasteboard setSharingToken:](self, "setSharingToken:", v19);
  }

  dispatch_group_leave((dispatch_group_t)self->_saveCompletionGroup);
  if (a5)
LABEL_13:
    *a5 = a4;
LABEL_14:

  return v14;
}

- (void)_saveItemCollection:(id)a3
{
  id v4;
  NSString *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  id v14;
  NSString *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  NSString *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD block[4];
  NSString *v29;

  v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    v5 = self->_name;
    v6 = objc_msgSend(v4, "isPersistent");
    _pasteboardCacheQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke;
      block[3] = &unk_1E16B1B28;
      v29 = v5;
      v9 = v5;
      dispatch_sync(v7, block);

      dispatch_group_enter((dispatch_group_t)self->_saveCompletionGroup);
      _serverConnection();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataConsumersEndpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_2;
      v26[3] = &unk_1E16D9E78;
      v26[4] = self;
      v27 = v4;
      objc_msgSend(v10, "savePasteboard:dataProviderEndpoint:completionBlock:", v27, v11, v26);

      v12 = v29;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_4;
      v23[3] = &unk_1E16B1B50;
      v24 = v5;
      v14 = v4;
      v25 = v14;
      v15 = v5;
      dispatch_sync(v7, v23);

      objc_msgSend(v14, "setChangeCount:", objc_msgSend(v14, "changeCount") + 1);
      v12 = v24;
    }

    _sendPasteboardChangedNotification(self);
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    _pasteboardCacheQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_5;
    v16[3] = &unk_1E16B9698;
    v18 = &v19;
    v16[4] = self;
    v17 = v4;
    dispatch_sync(v13, v16);

    if (*((_BYTE *)v20 + 24))
      _sendPasteboardChangedNotification(self);

    _Block_object_dispose(&v19, 8);
  }

}

- (void)_pinItemCollection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  _pasteboardCacheQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___UIConcretePasteboard__pinItemCollection___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

+ (void)removePasteboardWithName:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__148;
  v21 = __Block_byref_object_dispose__148;
  v22 = 0;
  _pasteboardCacheQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___UIConcretePasteboard_removePasteboardWithName___block_invoke;
  block[3] = &unk_1E16BACE0;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  dispatch_sync(v4, block);

  _serverConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "deletePersistentPasteboardWithName:error:", v6, &v13);
  v9 = v13;

  if (!v9)
  {
    _notificationStateQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __50___UIConcretePasteboard_removePasteboardWithName___block_invoke_2;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = v8;
    dispatch_sync(v10, v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIPasteboardRemovedNotification"), v18[5], 0);

  }
  _Block_object_dispose(&v17, 8);

}

+ (void)_attemptAuthenticationWithMessage:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  _pasteboardAuthenticatedMessageQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___UIConcretePasteboard__attemptAuthenticationWithMessage___block_invoke;
  block[3] = &unk_1E16B1B28;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

+ (id)_remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  _serverConnection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:error:", a3, v8, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_loadRequestContextForBlockingUIKitCall
{
  return (id)objc_msgSend(a1, "_loadRequestContextForBlockingUIKitCall:", 1);
}

- (BOOL)isPersistent
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  _pasteboardCacheQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___UIConcretePasteboard_isPersistent__block_invoke;
  v5[3] = &unk_1E16BACE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_pasteboardCacheQueue_setPersistent:(BOOL)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  void *v14;
  BOOL v15;

  v7 = a3;
  _pasteboardCacheQueue_existingItemCollectionWithName(self->_name, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setPersistent:", v7);
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
  v11 = (objc_class *)MEMORY[0x1E0D6C0C0];
  v12 = self->_name;
  v13 = [v11 alloc];
  v14 = (void *)objc_msgSend(v13, "initWithItems:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v14, "setName:", v12);
  objc_msgSend(v14, "setPersistent:", 1);
  _pasteboardCacheQueue_setItemCollectionForName(v12, v14);

  v15 = -[_UIConcretePasteboard _pasteboardCacheQueue_saveItemCollection:currentNotificationState:outNewNotificationState:](self, "_pasteboardCacheQueue_saveItemCollection:currentNotificationState:outNewNotificationState:", v14, a4, a5);
LABEL_6:

  return v15;
}

- (void)_setPersistent:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  _pasteboardCacheQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___UIConcretePasteboard__setPersistent___block_invoke;
  block[3] = &unk_1E16D9EC8;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v9 + 24))
    _sendPasteboardChangedNotification(self);
  _Block_object_dispose(&v8, 8);
}

- (int64_t)changeCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _pasteboardCacheQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36___UIConcretePasteboard_changeCount__block_invoke;
  v6[3] = &unk_1E16BC3A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)_changeCountIgnoringPinningActivity
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _pasteboardCacheQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___UIConcretePasteboard__changeCountIgnoringPinningActivity__block_invoke;
  v6[3] = &unk_1E16BC3A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)pasteSharingToken
{
  NSObject *saveCompletionGroup;
  dispatch_time_t v4;

  saveCompletionGroup = self->_saveCompletionGroup;
  v4 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6C178] * 1000000000.0));
  dispatch_group_wait(saveCompletionGroup, v4);
  return -[_UIConcretePasteboard sharingToken](self, "sharingToken");
}

- (void)setItemProviders:(id)a3
{
  -[_UIConcretePasteboard setItemProviders:localOnly:expirationDate:](self, "setItemProviders:localOnly:expirationDate:", a3, 0, 0);
}

- (void)setItemProviders:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0D6C0B8]);
        v16 = (void *)objc_msgSend(v15, "initWithNSItemProvider:", v14, (_QWORD)v17);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", v8, v7, 0);
}

- (void)setItemProviders:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _UIPasteboardOptions *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = objc_alloc(MEMORY[0x1E0D6C0B8]);
        v18 = (void *)objc_msgSend(v17, "initWithNSItemProvider:", v16, (_QWORD)v20);
        objc_msgSend(v10, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v19 = objc_alloc_init(_UIPasteboardOptions);
  -[_UIPasteboardOptions setPinned:](v19, "setPinned:", 0);
  -[_UIPasteboardOptions setLocalOnly:](v19, "setLocalOnly:", v6);
  if (v9)
    -[_UIPasteboardOptions setExpirationDate:](v19, "setExpirationDate:", v9);
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", v10, v19, 0, (_QWORD)v20);

}

- (void)_pinItemProviders:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  _UIPasteboardOptions *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0D6C0B8]);
        v16 = (void *)objc_msgSend(v15, "initWithNSItemProvider:", v14, (_QWORD)v19);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v17 = objc_alloc_init(_UIPasteboardOptions);
  -[_UIPasteboardOptions setPinned:](v17, "setPinned:", 1);
  -[_UIPasteboardOptions setLocalOnly:](v17, "setLocalOnly:", 1);
  if (v7)
  {
    -[_UIPasteboardOptions setExpirationDate:](v17, "setExpirationDate:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPasteboardOptions setExpirationDate:](v17, "setExpirationDate:", v18);

  }
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", v8, v17, 0, (_QWORD)v19);

}

- (void)_clearPinnedItemProviders
{
  _removePinnedItemCollectionForName(self->_name);
}

- (void)setObjects:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0CB36C8]);
        v16 = (void *)objc_msgSend(v15, "initWithObject:", v14, (_QWORD)v17);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[_UIConcretePasteboard setItemProviders:options:](self, "setItemProviders:options:", v8, v7);
}

- (void)setObjects:(id)a3
{
  -[_UIConcretePasteboard setObjects:localOnly:expirationDate:](self, "setObjects:localOnly:expirationDate:", a3, 0, 0);
}

- (void)setObjects:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _UIPasteboardOptions *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = objc_alloc(MEMORY[0x1E0CB36C8]);
        v18 = (void *)objc_msgSend(v17, "initWithObject:", v16, (_QWORD)v20);
        objc_msgSend(v10, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v19 = objc_alloc_init(_UIPasteboardOptions);
  -[_UIPasteboardOptions setLocalOnly:](v19, "setLocalOnly:", v6);
  if (v9)
    -[_UIPasteboardOptions setExpirationDate:](v19, "setExpirationDate:", v9);
  -[_UIConcretePasteboard setItemProviders:options:](self, "setItemProviders:options:", v10, v19, (_QWORD)v20);

}

- (id)availableTypes
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _existingItemCollectionWithName(self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "availableTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_UIConcretePasteboard itemProvidersWithRetryBehavior:](self, "itemProvidersWithRetryBehavior:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "canLoadObjectOfClass:", a3, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)canInstantiateObjectsOfClass:(Class)a3
{
  void *v3;
  BOOL v4;

  -[_UIConcretePasteboard itemProvidersForInstantiatingObjectsOfClass:](self, "itemProvidersForInstantiatingObjectsOfClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (int64_t)numberOfItems
{
  void *v2;
  void *v3;
  int64_t v4;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  _existingItemCollectionWithName(self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    if (!v4)
    {
      v8 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v5, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51___UIConcretePasteboard_pasteboardTypesForItemSet___block_invoke;
    v15[3] = &unk_1E16B2978;
    v16 = v5;
    v11 = v10;
    v17 = v11;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v15);
    v12 = v17;
    v13 = v11;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)containsPasteboardTypes:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  _existingItemCollectionWithName(self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (!v7)
    {
      v10 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v8, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59___UIConcretePasteboard_containsPasteboardTypes_inItemSet___block_invoke;
    v14[3] = &unk_1E16D9F10;
    v15 = v9;
    v16 = v6;
    v17 = &v18;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v14);

  }
  v12 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)itemSetWithPasteboardTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _existingItemCollectionWithName(self->_name);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = 0;
        do
        {
          objc_msgSend(v7, "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v13 = v4;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if (objc_msgSend(v12, "hasRepresentationConformingToType:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)))
                {
                  objc_msgSend(v5, "addIndex:", v10);
                  goto LABEL_15;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_15:

          ++v10;
          objc_msgSend(v7, "items");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

        }
        while (v10 < v19);
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  _existingItemCollectionWithName(self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 && objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      v11 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v8, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__148;
    v26 = __Block_byref_object_dispose__148;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_loadRequestContextForBlockingUIKitCall");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke;
    v17[3] = &unk_1E16D9F60;
    v18 = v8;
    v19 = v6;
    v14 = v13;
    v20 = v14;
    v21 = &v22;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v17);
    v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  _existingItemCollectionWithName(self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 && objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      v11 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v8, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend((id)objc_opt_class(), "_loadRequestContextForBlockingUIKitCall");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__148;
    v26 = __Block_byref_object_dispose__148;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke;
    v17[3] = &unk_1E16D9F60;
    v18 = v8;
    v19 = v6;
    v14 = v13;
    v20 = v14;
    v21 = &v22;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v17);
    v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)items
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  void *v14;
  id obj;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  _existingItemCollectionWithName(self->_name);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_loadRequestContextForBlockingUIKitCall");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v14, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v43;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v43 != v16)
        {
          v4 = v3;
          objc_enumerationMutation(obj);
          v3 = v4;
        }
        v19 = v3;
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v3);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v5, "availableTypes");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v39;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v39 != v8)
                objc_enumerationMutation(v20);
              v10 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v9);
              v32 = 0;
              v33 = &v32;
              v34 = 0x3032000000;
              v35 = __Block_byref_object_copy__148;
              v36 = __Block_byref_object_dispose__148;
              v37 = 0;
              v26 = 0;
              v27 = &v26;
              v28 = 0x3032000000;
              v29 = __Block_byref_object_copy__148;
              v30 = __Block_byref_object_dispose__148;
              v31 = 0;
              v11 = dispatch_semaphore_create(0);
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __30___UIConcretePasteboard_items__block_invoke;
              v22[3] = &unk_1E16DA000;
              v24 = &v32;
              v25 = &v26;
              v22[4] = v10;
              v12 = v11;
              v23 = v12;
              objc_msgSend(v5, "uikit_loadRepresentationAsType:context:completionBlock:", v10, v21, v22);
              dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

              objc_msgSend(v6, "setObject:forKeyedSubscript:", v33[5], v10);
              _recordHangAssertionIfNecessaryForResponseMetadata((void *)v27[5]);
              _Block_object_dispose(&v26, 8);

              _Block_object_dispose(&v32, 8);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v7);
        }

        objc_msgSend(v17, "addObject:", v6);
        v3 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v18);
  }

  return v17;
}

- (void)setItems:(id)a3
{
  -[_UIConcretePasteboard setItems:options:](self, "setItems:options:", a3, MEMORY[0x1E0C9AA70]);
}

- (void)setItems:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v39;
    v24 = *MEMORY[0x1E0C99778];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v6);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.uikit.type-automatic"));
        v8 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v8;
        v31 = v6;
        if (v8)
          v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v8);
        else
          v9 = objc_alloc_init(MEMORY[0x1E0D6C0B8]);
        v10 = v9;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v35 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.uikit.type-automatic")) & 1) == 0)
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v29 = (void *)MEMORY[0x1E0C99DA0];
                                  _NSFullMethodName();
                                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v29, "raise:format:", v24, CFSTR("%@: value for pasteboard type '%@' is not a valid property list type"), v18, v16);

                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                if (v17)
                {
                  ConvertValueToData(v17, v16);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    v32[0] = MEMORY[0x1E0C809B0];
                    v32[1] = 3221225472;
                    v32[2] = __42___UIConcretePasteboard_setItems_options___block_invoke;
                    v32[3] = &unk_1E16DA028;
                    v33 = v19;
                    v20 = v19;
                    objc_msgSend(v10, "uikit_addRepresentationType:loaderBlock:", v16, v32);

                  }
                }

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v13);
        }

        objc_msgSend(v27, "addObject:", v10);
        v6 = v31 + 1;
      }
      while (v31 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v28);
  }

  +[_UIPasteboardOptions optionsWithDictionary:](_UIPasteboardOptions, "optionsWithDictionary:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v27, v21);

}

- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5 dataOwner:(int64_t)a6
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  _UIConcretePasteboard *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _UIConcretePasteboard *v40;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;

  v6 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v43 = a4;
  if (v6)
  {
    v40 = self;
    objc_msgSend((id)objc_opt_class(), "_loadRequestContextForBlockingUIKitCall");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v42;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v67;
      v11 = (void *)*MEMORY[0x1E0CEC618];
      v45 = (void *)*MEMORY[0x1E0CEC658];
      v46 = (void *)*MEMORY[0x1E0CEC518];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v67 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x186DC9484]();
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "hasRepresentationConformingToType:", v15);

          if ((v16 & 1) == 0)
          {
            v17 = objc_opt_class();
            objc_msgSend(v46, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v70[0] = v18;
            objc_msgSend(v45, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v70[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v17) = objc_msgSend(v13, "uikit_canInstantiateObjectOfClass:excludingCoercionsFromTypes:", v17, v20);

            if ((_DWORD)v17)
            {
              v60 = 0;
              v61 = &v60;
              v62 = 0x3032000000;
              v63 = __Block_byref_object_copy__148;
              v64 = __Block_byref_object_dispose__148;
              v65 = 0;
              v54 = 0;
              v55 = &v54;
              v56 = 0x3032000000;
              v57 = __Block_byref_object_copy__148;
              v58 = __Block_byref_object_dispose__148;
              v59 = 0;
              v21 = dispatch_semaphore_create(0);
              v22 = objc_opt_class();
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke;
              v50[3] = &unk_1E16D9F88;
              v52 = &v60;
              v53 = &v54;
              v23 = v21;
              v51 = v23;
              v24 = (id)objc_msgSend(v13, "uikit_loadObjectOfClass:context:completionBlock:", v22, v44, v50);
              dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

              _recordHangAssertionIfNecessaryForResponseMetadata((void *)v55[5]);
              v25 = v61[5];
              if (v25)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v25, 0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "scheme");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "length") == 0;

                if (!v28)
                {
                  _convertURLToDataRepresentation(v26);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "identifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v48[0] = MEMORY[0x1E0C809B0];
                  v48[1] = 3221225472;
                  v48[2] = __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke_2;
                  v48[3] = &unk_1E16DA028;
                  v31 = v29;
                  v49 = v31;
                  objc_msgSend(v13, "uikit_addRepresentationType:loaderBlock:", v30, v48);

                }
              }
              _Block_object_dispose(&v54, 8);

              _Block_object_dispose(&v60, 8);
            }
          }
          objc_autoreleasePoolPop(v14);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v9);
    }

    self = v40;
  }
  v32 = self;
  _existingItemCollectionWithName(self->_name);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33)
    v33 = objc_alloc_init(MEMORY[0x1E0D6C0C0]);
  objc_msgSend(v33, "availableRepresentationTypes", v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "copyWithItems:", v42);
  objc_msgSend(v35, "setName:", self->_name);
  objc_msgSend(v35, "setChangeCount:", objc_msgSend(v33, "changeCount"));
  objc_msgSend(v35, "setOriginatorDataOwner:", a6);
  if (v43)
  {
    v36 = objc_msgSend(v43, "isPinned");
    v37 = objc_msgSend(v43, "isLocalOnly");
    objc_msgSend(v43, "expirationDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = objc_msgSend(v33, "isLocalOnly");
    objc_msgSend(v33, "expirationDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
  }
  objc_msgSend(v35, "setLocalOnly:", v37);
  objc_msgSend(v35, "setExpirationDate:", v38);
  if (v36)
  {
    -[_UIConcretePasteboard _pinItemCollection:](self, "_pinItemCollection:", v35);
  }
  else
  {
    -[_UIConcretePasteboard _saveItemCollection:](self, "_saveItemCollection:", v35);
    objc_msgSend(v35, "availableRepresentationTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIConcretePasteboard _sendPasteboardTypesChangedNotificationOldTypes:newTypes:](v32, "_sendPasteboardTypesChangedNotificationOldTypes:newTypes:", v34, v39);

  }
}

- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:dataOwner:](self, "_setItemsAndSave:options:coerceStringsToURLs:dataOwner:", v9, v8, v5, pthread_getspecific(_dataOwnerKey));

}

- (void)_setItemsAndSave:(id)a3 options:(id)a4
{
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", a3, a4, 1);
}

- (void)addItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  _UIConcretePasteboard *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = self;
  _existingItemCollectionWithName(self->_name);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D6C0C0]);
    objc_msgSend(v5, "setName:", self->_name);
  }
  v23 = v5;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");

  v28 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v40;
    v25 = *MEMORY[0x1E0C99778];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.uikit.type-automatic"));
        v10 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v10;
        v32 = v8;
        if (v10)
          v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v10);
        else
          v11 = objc_alloc_init(MEMORY[0x1E0D6C0B8]);
        v12 = v11;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v13 = v9;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.uikit.type-automatic")) & 1) == 0)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v30 = (void *)MEMORY[0x1E0C99DA0];
                                  _NSFullMethodName();
                                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v30, "raise:format:", v25, CFSTR("%@: value for pasteboard type '%@' is not a valid property list type"), v20, v18);

                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                if (v19)
                {
                  ConvertValueToData(v19, v18);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    v33[0] = MEMORY[0x1E0C809B0];
                    v33[1] = 3221225472;
                    v33[2] = __34___UIConcretePasteboard_addItems___block_invoke;
                    v33[3] = &unk_1E16DA028;
                    v34 = v21;
                    v22 = v21;
                    objc_msgSend(v12, "uikit_addRepresentationType:loaderBlock:", v18, v33);

                  }
                }

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v15);
        }

        objc_msgSend(v28, "addObject:", v12);
        v8 = v32 + 1;
      }
      while (v32 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v29);
  }

  -[_UIConcretePasteboard _setItemsAndSave:options:](v26, "_setItemsAndSave:options:", v28, 0);
}

- (id)pasteboardTypes
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableTypes");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];

  return v6;
}

- (BOOL)containsPasteboardTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _existingItemCollectionWithName(self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v7, "hasRepresentationConformingToType:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)dataForPasteboardType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  objc_msgSend(v4, "indexSetWithIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIConcretePasteboard dataForPasteboardType:inItemSet:](self, "dataForPasteboardType:inItemSet:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)valueForPasteboardType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  objc_msgSend(v4, "indexSetWithIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIConcretePasteboard valuesForPasteboardType:inItemSet:](self, "valuesForPasteboardType:inItemSet:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setValue:(id)a3 forPasteboardType:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImage *v17;

  v17 = (UIImage *)a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v7 = (void *)MEMORY[0x1E0C99DA0];
                v8 = *MEMORY[0x1E0C99778];
                _NSFullMethodName();
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "raise:format:", v8, CFSTR("%@: value is not a valid property list type"), v9);

              }
            }
          }
        }
      }
    }
  }
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v17;
LABEL_17:
      v11 = v10;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIImage dataUsingEncoding:](v17, "dataUsingEncoding:", 4);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_16:
      _UIEncodeObjectToPasteboardData(v17);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v6, "isEqual:", 0x1E1759AC0))
      {
        UIImagePNGRepresentation(v17);
        v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v17, 200, 0, 0);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[UIImage baseURL](v17, "baseURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99D20];
    if (v12)
    {
      -[UIImage relativeString](v17, "relativeString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithObjects:", v14, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[UIImage absoluteString](v17, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithObjects:", v14, &stru_1E16EDF20, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v16, 200, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
LABEL_18:
  -[_UIConcretePasteboard setData:forPasteboardType:](self, "setData:forPasteboardType:", v11, v6);

}

- (void)_sendPasteboardTypesChangedNotificationOldTypes:(id)a3 newTypes:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithArray:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v15);
  v10 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v10, "minusSet:", v8);
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("UIPasteboardChangedTypesAddedKey"));

    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("UIPasteboardChangedTypesRemovedKey"));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("UIPasteboardChangedNotification"), self, v11);

  }
}

- (void)setData:(id)a3 forPasteboardType:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _UIConcretePasteboard *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D6C0B8]);
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC5C8]);
  v11 = 0x1E0D6C000;
  v12 = MEMORY[0x1E0C809B0];
  v13 = &qword_186677000;
  if (!v10)
    goto LABEL_9;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithSerializedRepresentation:", v6);
  if (!v14)
    goto LABEL_9;
  v15 = (void *)v14;
  v28 = self;
  _UITemporaryFolderURL((uint64_t)CFSTR("com.apple.UIKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "stringByAppendingPathExtensionForType:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "writeToURL:options:originalContentsURL:error:", v18, 1, 0, 0);
  v20 = v19;
  if (v19)
  {
    v26 = objc_alloc(MEMORY[0x1E0D6C0C8]);
    v31[0] = v12;
    v31[1] = 3221225472;
    v31[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke;
    v31[3] = &unk_1E16DA050;
    v32 = v18;
    v33 = v16;
    v21 = (void *)objc_msgSend(v26, "initWithType:preferredRepresentation:v3_loader:", v7, 1, v31);
    objc_msgSend(v8, "addRepresentation:", v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeItemAtURL:error:", v16, 0);

  }
  self = v28;
  v12 = MEMORY[0x1E0C809B0];
  v13 = &qword_186677000;
  v11 = 0x1E0D6C000uLL;
  if ((v20 & 1) == 0)
  {
LABEL_9:
    v23 = objc_alloc(*(Class *)(v11 + 200));
    v29[0] = v12;
    v29[1] = v13[481];
    v29[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_3;
    v29[3] = &unk_1E16DA078;
    v30 = v6;
    v24 = (void *)objc_msgSend(v23, "initWithType:preferredRepresentation:v3_loader:", v7, 0, v29);
    objc_msgSend(v8, "addRepresentation:", v24);

  }
  v34[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v25, 0);

}

- (id)_itemsCoercibleToClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _existingItemCollectionWithName(self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        _coerceItemToClass(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v10), (uint64_t)a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)string
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  _coerceItemToClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_clearItems
{
  _UIPasteboardOptions *v3;

  v3 = objc_alloc_init(_UIPasteboardOptions);
  -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", 0, v3);

}

- (void)setString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPasteboardOptions *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      _NSFullMethodName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: Argument is not an object of type NSString [%@]"), v7, v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v4);
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(_UIPasteboardOptions);
    -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v11, v12);

  }
  else
  {
    -[_UIConcretePasteboard _clearItems](self, "_clearItems");
  }

}

- (id)strings
{
  return -[_UIConcretePasteboard _itemsCoercibleToClass:](self, "_itemsCoercibleToClass:", objc_opt_class());
}

- (void)_setItemsAndSaveFromObjects:(id)a3 ofClass:(Class)a4
{
  id v7;
  uint64_t v8;
  _UIPasteboardOptions *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v7 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__148;
  v15 = __Block_byref_object_dispose__148;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___UIConcretePasteboard__setItemsAndSaveFromObjects_ofClass___block_invoke;
  v10[3] = &unk_1E16DA0A0;
  v10[6] = a4;
  v10[7] = a2;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  v8 = v12[5];
  v9 = objc_alloc_init(_UIPasteboardOptions);
  -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v8, v9);

  _Block_object_dispose(&v11, 8);
}

- (void)setStrings:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIConcretePasteboard _setItemsAndSaveFromObjects:ofClass:](self, "_setItemsAndSaveFromObjects:ofClass:", v4, objc_opt_class());

}

- (id)URL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  _coerceItemToClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPasteboardOptions *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      _NSFullMethodName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: Argument is not an object of type NSURL [%@]"), v7, v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v4);
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(_UIPasteboardOptions);
    -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v11, v12);

  }
  else
  {
    -[_UIConcretePasteboard _clearItems](self, "_clearItems");
  }

}

- (id)URLs
{
  return -[_UIConcretePasteboard _itemsCoercibleToClass:](self, "_itemsCoercibleToClass:", objc_opt_class());
}

- (void)setURLs:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIConcretePasteboard _setItemsAndSaveFromObjects:ofClass:](self, "_setItemsAndSaveFromObjects:ofClass:", v4, objc_opt_class());

}

- (id)image
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  _coerceItemToClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPasteboardOptions *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      _NSFullMethodName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: Argument is not an object of type UIImage [%@]"), v7, v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v4);
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(_UIPasteboardOptions);
    -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v11, v12);

  }
  else
  {
    -[_UIConcretePasteboard _clearItems](self, "_clearItems");
  }

}

- (id)images
{
  return -[_UIConcretePasteboard _itemsCoercibleToClass:](self, "_itemsCoercibleToClass:", objc_opt_class());
}

- (void)setImages:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIConcretePasteboard _setItemsAndSaveFromObjects:ofClass:](self, "_setItemsAndSaveFromObjects:ofClass:", v4, objc_opt_class());

}

- (id)color
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  _coerceItemToClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPasteboardOptions *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99778];
      _NSFullMethodName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: Argument is not an object of type UIColor [%@]"), v7, v9);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithObject:", v4);
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(_UIPasteboardOptions);
    -[_UIConcretePasteboard _setItemsAndSave:options:](self, "_setItemsAndSave:options:", v11, v12);

  }
  else
  {
    -[_UIConcretePasteboard _clearItems](self, "_clearItems");
  }

}

- (id)colors
{
  return -[_UIConcretePasteboard _itemsCoercibleToClass:](self, "_itemsCoercibleToClass:", objc_opt_class());
}

- (void)setColors:(id)a3
{
  id v4;

  v4 = a3;
  -[_UIConcretePasteboard _setItemsAndSaveFromObjects:ofClass:](self, "_setItemsAndSaveFromObjects:ofClass:", v4, objc_opt_class());

}

- (BOOL)hasStrings
{
  void *v2;
  char v3;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canInstantiateObjectOfClass:", objc_opt_class());

  return v3;
}

- (BOOL)hasURLs
{
  void *v2;
  char v3;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canInstantiateObjectOfClass:", objc_opt_class());

  return v3;
}

- (BOOL)hasImages
{
  void *v2;
  char v3;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canInstantiateObjectOfClass:", objc_opt_class());

  return v3;
}

- (BOOL)hasColors
{
  void *v2;
  char v3;

  _existingItemCollectionWithName(self->_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canInstantiateObjectOfClass:", objc_opt_class());

  return v3;
}

+ (id)_pasteboardWithUniqueName
{
  void *v3;
  void *v4;
  void *v5;
  _UIPasteboardOptions *v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pasteboardNamed:createIfNotFound:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(_UIPasteboardOptions);
  objc_msgSend(v5, "_setItemsAndSave:options:", MEMORY[0x1E0C9AA60], v6);

  return v5;
}

- (id)_detectedPasteboardTypesForTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  dispatch_semaphore_t v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  _existingItemCollectionWithName(self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke;
    v23[3] = &unk_1E16DA0C8;
    v9 = v8;
    v24 = v9;
    objc_msgSend(v7, "enumeratePatternDetectionsForPatterns:usingBlock:", v4, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = dispatch_semaphore_create(0);
      _serverConnection();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
      v15 = pthread_getspecific(_dataOwnerKey);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_2;
      v19[3] = &unk_1E16DA118;
      v20 = v9;
      v21 = v7;
      v22 = v11;
      v16 = v11;
      objc_msgSend(v12, "requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:", v13, v14, 0, 0, v10, 0, v15, v19);

      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }
    v17 = v9;

  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v17;
}

- (id)_detectedPasteboardTypeStringsForTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  dispatch_semaphore_t v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v4 = a3;
  _existingItemCollectionWithName(self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke;
    v31[3] = &unk_1E16DA140;
    v11 = v8;
    v32 = v11;
    v12 = v9;
    v33 = v12;
    objc_msgSend(v7, "enumeratePatternDetectionsForPatterns:usingBlock:", v4, v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionSet:", v13);

    if (objc_msgSend(v12, "count"))
    {
      v14 = dispatch_semaphore_create(0);
      _serverConnection();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v26 = v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = _pasteboardLastAuthenticatedMessage;
      pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
      v19 = pthread_getspecific(_dataOwnerKey);
      v20 = v10;
      v21 = v19;
      v27[0] = v20;
      v27[1] = 3221225472;
      v27[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_2;
      v27[3] = &unk_1E16DA118;
      v28 = v11;
      v29 = v7;
      v30 = v14;
      v22 = v14;
      objc_msgSend(v15, "requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:", v16, v17, v18, 0, v12, 1, v21, v27);

      v4 = v26;
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

    }
    v23 = v33;
    v24 = v11;

  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA70];
  }

  return v24;
}

+ (void)_detectPatternsForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id *v24;
  id *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD block[4];
  id v40;
  unint64_t v41;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") <= a4)
  {
    _pasteboardCompletionQueue();
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke;
    block[3] = &unk_1E16B2560;
    v40 = v11;
    v41 = a4;
    dispatch_async(v27, block);

    v13 = v40;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2;
    v37[3] = &unk_1E16DA0C8;
    v16 = v14;
    v38 = v16;
    objc_msgSend(v13, "enumeratePatternDetectionsForPatterns:usingBlock:", v9, v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      aBlock[0] = v15;
      aBlock[1] = 3221225472;
      aBlock[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4;
      aBlock[3] = &unk_1E16DA168;
      v33 = v11;
      v31 = v16;
      v32 = v13;
      v29 = v17;
      v18 = _Block_copy(aBlock);
      _serverConnection();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v28 = v11;
      v21 = v16;
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
      objc_msgSend(v19, "requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:", v20, v23, 0, a4, v29, 0, pthread_getspecific(_dataOwnerKey), v18);

      v9 = v22;
      v16 = v21;
      v11 = v28;

      v24 = &v31;
      v25 = &v33;

      v17 = v29;
      v26 = v32;
    }
    else
    {
      _pasteboardCompletionQueue();
      v26 = objc_claimAutoreleasedReturnValue();
      v34[0] = v15;
      v34[1] = 3221225472;
      v34[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3;
      v34[3] = &unk_1E16B2F48;
      v25 = &v36;
      v36 = v11;
      v24 = &v35;
      v35 = v16;
      dispatch_async(v26, v34);
    }

  }
}

+ (id)clientValueForValue:(id)a3 pattern:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (qword_1ECD7B1E8 != -1)
    dispatch_once(&qword_1ECD7B1E8, &__block_literal_global_75_2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend((id)_MergedGlobals_7_8, "objectForKeyedSubscript:", v6, (_QWORD)v20);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
          {
            (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v16);

          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend((id)_MergedGlobals_7_8, "objectForKeyedSubscript:", v6);
    v17 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v17;
    if (v17)
    {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v5);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v5;
    }
    v7 = v18;
  }

  return v7;
}

+ (void)_detectValuesForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id *v36;
  id v37;
  _QWORD aBlock[4];
  id v39;
  NSObject *v40;
  _QWORD v41[2];
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD block[4];
  id v50;
  unint64_t v51;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") <= a4)
  {
    _pasteboardCompletionQueue();
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke;
    block[3] = &unk_1E16B2560;
    v50 = v12;
    v51 = a4;
    dispatch_async(v33, block);

    v14 = v50;
  }
  else
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v17 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2;
    v45[3] = &unk_1E16DA290;
    v18 = v15;
    v46 = v18;
    v48 = a1;
    v19 = v16;
    v47 = v19;
    v37 = v10;
    objc_msgSend(v14, "enumeratePatternDetectionsForPatterns:usingBlock:", v10, v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v20);

    if (objc_msgSend(v19, "count"))
    {
      aBlock[0] = v17;
      aBlock[1] = 3221225472;
      aBlock[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4;
      aBlock[3] = &unk_1E16DA2E0;
      v36 = (id *)v41;
      v41[0] = v12;
      v39 = v18;
      v41[1] = a1;
      v40 = v14;
      v21 = _Block_copy(aBlock);
      _serverConnection();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUID");
      v35 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      v25 = v11;
      v26 = v14;
      v27 = v12;
      v28 = _pasteboardLastAuthenticatedMessage;
      pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
      v29 = pthread_getspecific(_dataOwnerKey);
      v30 = v28;
      v12 = v27;
      v14 = v26;
      v11 = v25;
      v13 = v34;
      objc_msgSend(v22, "requestPatternDetectionsFromPasteboardWithName:UUID:authenticationMessage:itemIndex:patterns:needValues:dataOwner:completionBlock:", v23, v24, v30, a4, v19, 1, v29, v21);

      v18 = v35;
      v31 = &v39;

      v32 = v40;
    }
    else
    {
      _pasteboardCompletionQueue();
      v32 = objc_claimAutoreleasedReturnValue();
      v42[0] = v17;
      v42[1] = 3221225472;
      v42[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3;
      v42[3] = &unk_1E16B2F48;
      v36 = &v44;
      v44 = v12;
      v31 = &v43;
      v43 = v18;
      dispatch_async(v32, v42);
    }

    v10 = v37;
  }

}

+ (void)_asynchronouslyEnumerateItemSet:(id)a3 itemsCompletionHandler:(id)a4 usingItemBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD *);
  uint64_t v10;
  size_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  size_t v25;
  _QWORD v26[4];
  _QWORD v27[4];
  id v28;
  _QWORD block[4];
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD *))a5;
  v10 = objc_msgSend(v7, "count");
  if (v10 == 1)
  {
    v14 = objc_msgSend(v7, "firstIndex");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_2;
    v27[3] = &unk_1E16DA308;
    v28 = v8;
    v9[2](v9, v14, v27);
    v13 = v28;
    goto LABEL_5;
  }
  v11 = v10;
  if (!v10)
  {
    _pasteboardCompletionQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke;
    block[3] = &unk_1E16B1BF8;
    v30 = v8;
    dispatch_async(v12, block);

    v13 = v30;
LABEL_5:

    goto LABEL_9;
  }
  v15 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
  objc_msgSend(v7, "getIndexes:maxCount:inIndexRange:", v15, v11, 0);
  v16 = malloc_type_calloc(v11, 8uLL, 0x80040B8603338uLL);
  v17 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v18 = MEMORY[0x1E0C809B0];
  do
  {
    v19 = v15[v17];
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_3;
    v20[3] = &unk_1E16DA330;
    v22 = v26;
    v23 = v16;
    v24 = v17;
    v25 = v11;
    v21 = v8;
    v9[2](v9, v19, v20);

    ++v17;
  }
  while (v11 != v17);
  free(v15);
  _Block_object_dispose(v26, 8);
LABEL_9:

}

- (void)detectPatternsForPatterns:(id)a3 completionHandler:(id)a4
{
  NSString *name;
  id v6;
  id v7;
  id v8;

  name = self->_name;
  v6 = a4;
  v7 = a3;
  _existingItemCollectionWithName(name);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIConcretePasteboard _detectPatternsForPatterns:atIndex:itemCollection:completionHandler:](_UIConcretePasteboard, "_detectPatternsForPatterns:atIndex:itemCollection:completionHandler:", v7, 0, v8, v6);

}

- (void)detectPatternsForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _existingItemCollectionWithName(self->_name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (!v10)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB36B8]);
    objc_msgSend(v12, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79___UIConcretePasteboard_detectPatternsForPatterns_inItemSet_completionHandler___block_invoke;
  v17[3] = &unk_1E16DA358;
  v18 = v9;
  v19 = v12;
  v15 = v12;
  v16 = v9;
  +[_UIConcretePasteboard _asynchronouslyEnumerateItemSet:itemsCompletionHandler:usingItemBlock:](_UIConcretePasteboard, "_asynchronouslyEnumerateItemSet:itemsCompletionHandler:usingItemBlock:", v13, v11, v17);
  if (!v10)
  {

  }
}

- (void)detectValuesForPatterns:(id)a3 completionHandler:(id)a4
{
  NSString *name;
  id v6;
  id v7;
  id v8;

  name = self->_name;
  v6 = a4;
  v7 = a3;
  _existingItemCollectionWithName(name);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIConcretePasteboard _detectValuesForPatterns:atIndex:itemCollection:completionHandler:](_UIConcretePasteboard, "_detectValuesForPatterns:atIndex:itemCollection:completionHandler:", v7, 0, v8, v6);

}

- (void)detectValuesForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _existingItemCollectionWithName(self->_name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (!v10)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB36B8]);
    objc_msgSend(v12, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77___UIConcretePasteboard_detectValuesForPatterns_inItemSet_completionHandler___block_invoke;
  v17[3] = &unk_1E16DA358;
  v18 = v9;
  v19 = v12;
  v15 = v12;
  v16 = v9;
  +[_UIConcretePasteboard _asynchronouslyEnumerateItemSet:itemsCompletionHandler:usingItemBlock:](_UIConcretePasteboard, "_asynchronouslyEnumerateItemSet:itemsCompletionHandler:usingItemBlock:", v13, v11, v17);
  if (!v10)
  {

  }
}

- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  unint64_t v12;
  int64_t v13;

  v7 = a5;
  _pasteboardAuthenticatedMessageQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke;
  block[3] = &unk_1E16DA380;
  v12 = a3;
  v13 = a4;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UISPasteSharingToken)sharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharingToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_group)saveCompletionGroup
{
  return self->_saveCompletionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveCompletionGroup, 0);
  objc_storeStrong((id *)&self->_sharingToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

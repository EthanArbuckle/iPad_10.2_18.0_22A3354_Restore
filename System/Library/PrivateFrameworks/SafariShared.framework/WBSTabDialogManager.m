@implementation WBSTabDialogManager

- (void)presentNextDialogForSlot:(id)a3
{
  unint64_t var1;
  void *v5;
  id v6;

  var1 = a3.var1;
  -[WBSTabDialogManager cancelAllDialogsBlockingSlot:](self, "cancelAllDialogsBlockingSlot:", *(_QWORD *)&a3.var0);
  -[WBSTabDialogManager _queueForTabID:createIfNeeded:](self, "_queueForTabID:createIfNeeded:", var1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentIfNeeded");

}

- (void)cancelAllDialogsBlockingSlot:(id)a3
{
  void *v4;
  void *v5;

  -[WBSTabDialogManager _dialogBlockingSlot:](self, "_dialogBlockingSlot:", *(_QWORD *)&a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[WBSTabDialogManager _dismissDialog:withResponse:](self, "_dismissDialog:withResponse:", v4, 0);
    v4 = v5;
  }

}

- (id)_queueForTabID:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *tabIDToDialogQueueMapping;
  void *v8;
  void *v9;
  BOOL v10;
  NSMutableDictionary *v11;
  void *v12;

  v4 = a4;
  tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tabIDToDialogQueueMapping, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_tabIDToDialogQueueMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (id)_dialogBlockingSlot:(id)a3
{
  unint64_t var1;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  var1 = a3.var1;
  -[WBSTabDialogManager _dialogBlockingWebProcessID:](self, "_dialogBlockingWebProcessID:", *(_QWORD *)&a3.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slot");
  if (v5 == var1)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (id)_dialogBlockingWebProcessID:(int)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[WBSTabDialogManager _setForWebProcessID:createIfNeeded:](self, "_setForWebProcessID:createIfNeeded:", *(_QWORD *)&a3, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isBlockingWebProcess", (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_setForWebProcessID:(int)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSMutableDictionary *webProcessIDToDialogSetMapping;
  void *v8;
  void *v9;
  BOOL v10;
  NSMutableDictionary *v11;
  void *v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](webProcessIDToDialogSetMapping, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_webProcessIDToDialogSetMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (WBSTabDialogManager)init
{
  WBSTabDialogManager *v2;
  uint64_t v3;
  NSMutableDictionary *webProcessIDToDialogSetMapping;
  uint64_t v5;
  NSMutableDictionary *tabIDToDialogQueueMapping;
  WBSTabDialogManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSTabDialogManager;
  v2 = -[WBSTabDialogManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    webProcessIDToDialogSetMapping = v2->_webProcessIDToDialogSetMapping;
    v2->_webProcessIDToDialogSetMapping = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    tabIDToDialogQueueMapping = v2->_tabIDToDialogQueueMapping;
    v2->_tabIDToDialogQueueMapping = (NSMutableDictionary *)v5;

    v2->_queueCapacity = 10;
    v7 = v2;
  }

  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_queueCapacity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; queueCapacity = %@, webProcessIDToDialogSetMapping = %@, tabIDToQueueMapping = %@>"),
    v4,
    self,
    v5,
    self->_webProcessIDToDialogSetMapping,
    self->_tabIDToDialogQueueMapping);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enqueueOrPresentDialog:(id)a3 inSlot:(id)a4
{
  unint64_t var1;
  uint64_t v5;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;

  var1 = a4.var1;
  v5 = *(_QWORD *)&a4.var0;
  objc_msgSend(a3, "createInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((int)v5 >= 1 && var1)
  {
    objc_msgSend(v7, "setSlot:", v5, var1);
    v9 = -[WBSTabDialogManager _enqueueDialog:](self, "_enqueueDialog:", v8);
    if (v9 == 1)
    {
      objc_msgSend(v8, "presentIfNeeded");
      goto LABEL_9;
    }
    if (v9)
      goto LABEL_9;
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:].cold.1(v10, v5, var1);
  }
  objc_msgSend(v8, "dismissWithResponse:", 0);
LABEL_9:

}

- (void)enqueueOrPresentDialogInSlot:(id)a3 presentationBlock:(id)a4 dismissalBlock:(id)a5 blocksWebProcessUntilDismissed:(BOOL)a6
{
  _BOOL8 v6;
  unint64_t var1;
  uint64_t v8;
  id v10;

  v6 = a6;
  var1 = a3.var1;
  v8 = *(_QWORD *)&a3.var0;
  +[WBSTabDialog tabDialogWithPresentationBlock:dismissalBlock:](WBSTabDialog, "tabDialogWithPresentationBlock:dismissalBlock:", a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBlocksWebProcessUntilDismissed:", v6);
  -[WBSTabDialogManager enqueueOrPresentDialog:inSlot:](self, "enqueueOrPresentDialog:inSlot:", v10, v8, var1);

}

- (void)dismissCurrentDialogForTabID:(unint64_t)a3 withResponse:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[WBSTabDialogManager _queueForTabID:createIfNeeded:](self, "_queueForTabID:createIfNeeded:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isPresented"))
    -[WBSTabDialogManager _dismissDialog:withResponse:](self, "_dismissDialog:withResponse:", v7, v8);

}

- (void)cancelAllDialogsBlockingWebProcessID:(int)a3
{
  void *v4;
  void *v5;

  -[WBSTabDialogManager _dialogBlockingWebProcessID:](self, "_dialogBlockingWebProcessID:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[WBSTabDialogManager _dismissDialog:withResponse:](self, "_dismissDialog:withResponse:", v4, 0);
    v4 = v5;
  }

}

- (void)cancelAllDialogsForTabID:(unint64_t)a3
{
  -[WBSTabDialogManager cancelAllDialogsForTabID:reason:](self, "cancelAllDialogsForTabID:reason:", a3, CFSTR("WBSTabDialogCancellationReasonTabClosed"));
}

- (void)cancelAllDialogsForTabID:(unint64_t)a3 reason:(id)a4
{
  id v6;

  +[WBSTabDialogCancellationContext cancellationContextWithReason:userInfo:](WBSTabDialogCancellationContext, "cancellationContextWithReason:userInfo:", a4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSTabDialogManager cancelAllDialogsForTabID:context:](self, "cancelAllDialogsForTabID:context:", a3, v6);

}

- (void)cancelAllDialogsForTabID:(unint64_t)a3 context:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[WBSTabDialogManager _queueForTabID:createIfNeeded:](self, "_queueForTabID:createIfNeeded:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[WBSTabDialogManager _cancelDialogsInQueue:tabID:context:](self, "_cancelDialogsInQueue:tabID:context:", v6, a3, v7);

}

- (void)_cancelDialogsInQueue:(id)a3 tabID:(unint64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *tabIDToDialogQueueMapping;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  NSMutableDictionary *webProcessIDToDialogSetMapping;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  WBSTabDialogManager *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend(v17, "isExemptFromCancellationInContext:", v9))
          v18 = v10;
        else
          v18 = v11;
        objc_msgSend(v18, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v10, "count"))
      v19 = v10;
    else
      v19 = 0;
    tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](tabIDToDialogQueueMapping, "setObject:forKeyedSubscript:", v19, v21);

    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "slot");

    -[WBSTabDialogManager _setForWebProcessID:createIfNeeded:](self, "_setForWebProcessID:createIfNeeded:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    if (v25 == objc_msgSend(v11, "count"))
      goto LABEL_24;
    v38 = self;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v26 = v11;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v24, "removeObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v28);
    }

    self = v38;
    if (!objc_msgSend(v24, "count"))
    {
LABEL_24:
      webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](webProcessIDToDialogSetMapping, "removeObjectForKey:", v32);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v33 = v11;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v40 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dismissWithResponse:", 0);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v35);
    }

  }
}

- (void)cancelAllDialogsWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_tabIDToDialogQueueMapping, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__WBSTabDialogManager_cancelAllDialogsWithContext___block_invoke;
  v7[3] = &unk_1E4B40020;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __51__WBSTabDialogManager_cancelAllDialogsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_cancelDialogsInQueue:tabID:context:", v6, objc_msgSend(a2, "unsignedLongValue"), *(_QWORD *)(a1 + 40));

}

- (int64_t)_enqueueDialog:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "slot");
  -[WBSTabDialogManager _queueForTabID:createIfNeeded:](self, "_queueForTabID:createIfNeeded:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") < self->_queueCapacity || objc_msgSend(v4, "isBlockingWebProcess"))
  {
    objc_msgSend(v7, "addObject:", v4);
    -[WBSTabDialogManager _setForWebProcessID:createIfNeeded:](self, "_setForWebProcessID:createIfNeeded:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);
    if (objc_msgSend(v7, "count") == 1)
      v9 = 1;
    else
      v9 = 2;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_dismissDialog:(id)a3 withResponse:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *webProcessIDToDialogSetMapping;
  void *v12;
  void *v13;
  NSMutableDictionary *tabIDToDialogQueueMapping;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_msgSend(v16, "slot");
  v9 = v8;
  -[WBSTabDialogManager _setForWebProcessID:createIfNeeded:](self, "_setForWebProcessID:createIfNeeded:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v16);
  if (!objc_msgSend(v10, "count"))
  {
    webProcessIDToDialogSetMapping = self->_webProcessIDToDialogSetMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](webProcessIDToDialogSetMapping, "removeObjectForKey:", v12);

  }
  -[WBSTabDialogManager _queueForTabID:createIfNeeded:](self, "_queueForTabID:createIfNeeded:", v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v16);
  if (!objc_msgSend(v13, "count"))
  {
    tabIDToDialogQueueMapping = self->_tabIDToDialogQueueMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](tabIDToDialogQueueMapping, "removeObjectForKey:", v15);

  }
  objc_msgSend(v16, "dismissWithResponse:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIDToDialogQueueMapping, 0);
  objc_storeStrong((id *)&self->_webProcessIDToDialogSetMapping, 0);
}

- (void)enqueueOrPresentDialog:(uint64_t)a3 inSlot:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{pid:%d, tab:0x%lx}"), a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543362;
  v9 = v7;
  _os_log_fault_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_FAULT, "Dialog enqueued in invalid slot: %{public}@", buf, 0xCu);

}

@end

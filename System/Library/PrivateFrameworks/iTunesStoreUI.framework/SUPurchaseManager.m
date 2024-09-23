@implementation SUPurchaseManager

- (void)dealloc
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *observedDownloadManagers;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int *v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v5 &= 2u;
  if (v5)
  {
    v23 = 138412290;
    v24 = objc_opt_class();
    LODWORD(v16) = 12;
    v15 = &v23;
    v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v23, v16);
      free(v7);
      v15 = (int *)v8;
      SSFileLog();
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v15), "removeObserver:name:object:", self, CFSTR("SUDialogDidFinishNotification"), 0);
  -[SSEventMonitor setDelegate:](self->_eventMonitor, "setDelegate:", 0);

  observedDownloadManagers = self->_observedDownloadManagers;
  if (observedDownloadManagers)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observedDownloadManagers, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(observedDownloadManagers);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "removeObserver:", self);
          -[SUQueueSessionManager endDownloadManagerSessionForManager:](self->_queueSessionManager, "endDownloadManagerSessionForManager:", v14);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observedDownloadManagers, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_purchaseRequests, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);

  v17.receiver = self;
  v17.super_class = (Class)SUPurchaseManager;
  -[SUPurchaseManager dealloc](&v17, sel_dealloc);
}

- (void)setQueueSessionManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (SUPurchaseManager)init
{
  SUPurchaseManager *v2;
  SSEventMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUPurchaseManager;
  v2 = -[SUPurchaseManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__dialogDidFinish_, CFSTR("SUDialogDidFinishNotification"), 0);
    v3 = (SSEventMonitor *)objc_alloc_init(MEMORY[0x24BEB1E38]);
    v2->_eventMonitor = v3;
    -[SSEventMonitor setDelegate:](v3, "setDelegate:", v2);
  }
  return v2;
}

- (void)addFuturePurchase:(id)a3
{
  NSMutableSet *futurePurchases;

  futurePurchases = self->_futurePurchases;
  if (!futurePurchases)
  {
    futurePurchases = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_futurePurchases = futurePurchases;
  }
  -[NSMutableSet addObject:](futurePurchases, "addObject:", a3);
  if (objc_msgSend(a3, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]))
    -[SUPurchaseManager addPurchasedItemIdentifier:](self, "addPurchasedItemIdentifier:", SSGetUnsignedLongLongFromValue());
}

- (BOOL)addPurchaseBatch:(id)a3
{
  uint64_t v5;
  BOOL v6;

  if (objc_msgSend((id)objc_msgSend(a3, "errors"), "count"))
    -[SUPurchaseManager _showDialogsForErrors:](self, "_showDialogsForErrors:", objc_msgSend(a3, "errors"));
  v5 = objc_msgSend((id)objc_msgSend(a3, "continuations"), "count");
  v6 = v5 != 0;
  if (v5)
    -[SUPurchaseManager _enqueueContinuations:](self, "_enqueueContinuations:", objc_msgSend(a3, "continuations"));
  if (objc_msgSend((id)objc_msgSend(a3, "validPurchases"), "count"))
  {
    -[SUPurchaseManager _enqueuePurchases:](self, "_enqueuePurchases:", objc_msgSend(a3, "validPurchases"));
    v6 = 1;
  }
  -[SUPurchaseManager _performNextAction](self, "_performNextAction");
  return v6;
}

- (void)addPurchasedItemIdentifier:(unint64_t)a3
{
  uint64_t v5;

  if (!self->_purchasedIdentifiers)
    self->_purchasedIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", a3);
  if ((-[NSMutableSet containsObject:](self->_purchasedIdentifiers, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_purchasedIdentifiers, "addObject:", v5);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPurchasedItemIdentifiersChangedNotification"), self);
  }
}

- (void)addPurchasedItemIdentifiers:(id)a3
{
  NSMutableSet *purchasedIdentifiers;
  unint64_t v6;

  purchasedIdentifiers = self->_purchasedIdentifiers;
  if (!purchasedIdentifiers)
  {
    purchasedIdentifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_purchasedIdentifiers = purchasedIdentifiers;
  }
  v6 = -[NSMutableSet count](purchasedIdentifiers, "count");
  -[NSMutableSet unionSet:](self->_purchasedIdentifiers, "unionSet:", a3);
  if (-[NSMutableSet count](self->_purchasedIdentifiers, "count") > v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPurchasedItemIdentifiersChangedNotification"), self);
}

- (void)beginUpdates
{
  int64_t updatesCount;

  updatesCount = self->_updatesCount;
  self->_updatesCount = updatesCount + 1;
  if (!updatesCount && (objc_opt_respondsToSelector() & 1) != 0)
    -[SUPurchaseManagerDelegate purchaseManagerWillBeginUpdates:](self->_delegate, "purchaseManagerWillBeginUpdates:", self);
}

- (void)cancelFuturePurchase:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a3, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]))
    -[SUPurchaseManager removePurchasedItemIdentifier:](self, "removePurchasedItemIdentifier:", SSGetUnsignedLongLongFromValue());
  -[SUPurchaseManager _removePlaceholdersForPurchase:](self, "_removePlaceholdersForPurchase:", a3);
  -[NSMutableSet removeObject:](self->_futurePurchases, "removeObject:", a3);
}

- (void)endUpdates
{
  int64_t updatesCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  updatesCount = self->_updatesCount;
  v3 = updatesCount == 1;
  v4 = updatesCount < 1;
  v5 = updatesCount - 1;
  if (!v4)
  {
    self->_updatesCount = v5;
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      -[SUPurchaseManagerDelegate purchaseManagerDidEndUpdates:](self->_delegate, "purchaseManagerDidEndUpdates:", self);
  }
}

- (BOOL)itemIdentifierIsPurchased:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithItemIdentifier:", a3);
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_purchasedIdentifiers, "containsObject:", v4);

  return (char)self;
}

- (BOOL)itemIdentifierIsPurchasing:(unint64_t)a3
{
  NSMutableArray *purchaseRequests;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  purchaseRequests = self->_purchaseRequests;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseRequests, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x24BEB2410];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(purchaseRequests);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "purchases");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "valueForDownloadProperty:", v8);
              if (SSGetUnsignedLongLongFromValue() == a3)
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v12)
              continue;
            break;
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseRequests, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (id)newPurchaseBatchForItems:(id)a3 offers:(id)a4
{
  SUPurchaseBatch *v7;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v7 = (SUPurchaseBatch *)(id)-[SUPurchaseManagerDelegate purchaseManager:purchaseBatchForItems:](self->_delegate, "purchaseManager:purchaseBatchForItems:", self, a3)) == 0)
  {
    v7 = -[SUPurchaseBatch initWithItems:offers:]([SUPurchaseBatch alloc], "initWithItems:offers:", a3, a4);
  }
  -[SUPurchaseBatch setPurchaseManager:](v7, "setPurchaseManager:", self);
  return v7;
}

- (int64_t)numberOfPendingPurchases
{
  NSMutableArray *purchaseRequests;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  purchaseRequests = self->_purchaseRequests;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseRequests, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(purchaseRequests);
      v5 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "purchases"), "count");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseRequests, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (void)removePurchasedItemIdentifier:(unint64_t)a3
{
  uint64_t v4;

  if (self->_purchasedIdentifiers)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", a3);
    if (-[NSMutableSet containsObject:](self->_purchasedIdentifiers, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_purchasedIdentifiers, "removeObject:", v4);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPurchasedItemIdentifiersChangedNotification"), self);
    }
  }
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char isKindOfClass;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int *v55;
  int *v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a4, "isEqualToString:", *MEMORY[0x24BEB24C8]))
    return;
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v60 = 138412290;
    v61 = objc_opt_class();
    LODWORD(v58) = 12;
    v55 = &v60;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v60, v58);
      free(v11);
      v55 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = objc_msgSend(a5, "objectForKey:", CFSTR("response"), v55);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = 0;
    v14 = (void *)MEMORY[0x24BDD1620];
    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v14, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), v13, &v59);
    if (v59)
    {
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v19 = objc_msgSend(v18, "shouldLog");
      if (objc_msgSend(v18, "shouldLogToDisk"))
        v20 = v19 | 2;
      else
        v20 = v19;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v18, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v20 &= 2u;
      if (v20)
      {
        v21 = objc_opt_class();
        v60 = 138412546;
        v61 = v21;
        v62 = 2112;
        v63 = v59;
        LODWORD(v58) = 22;
        v56 = &v60;
        v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          v23 = (void *)v22;
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v60, v58);
          free(v23);
          v56 = (int *)v24;
          SSFileLog();
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v44 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v45 = objc_msgSend(v44, "shouldLog");
      if (objc_msgSend(v44, "shouldLogToDisk"))
        v46 = v45 | 2;
      else
        v46 = v45;
      v47 = objc_msgSend(v44, "OSLogObject", v56);
      if ((isKindOfClass & 1) != 0)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          v48 = v46;
        else
          v48 = v46 & 2;
        if (!v48)
          return;
        v49 = objc_opt_class();
        v60 = 138412546;
        v61 = v49;
        v62 = 2112;
        v63 = 0;
        LODWORD(v58) = 22;
      }
      else
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          v50 = v46;
        else
          v50 = v46 & 2;
        if (!v50)
          return;
        v51 = objc_opt_class();
        v52 = objc_opt_class();
        v60 = 138412546;
        v61 = v51;
        v62 = 2112;
        v63 = v52;
        LODWORD(v58) = 22;
      }
      v42 = (void *)_os_log_send_and_compose_impl();
      if (!v42)
        return;
      goto LABEL_61;
    }
    v25 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v26 = objc_msgSend(v25, "shouldLog");
    if (objc_msgSend(v25, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v25, "OSLogObject", v56), OS_LOG_TYPE_DEFAULT))
      v27 &= 2u;
    if (v27)
    {
      v28 = objc_opt_class();
      v60 = 138412546;
      v61 = v28;
      v62 = 2112;
      v63 = (uint64_t)v17;
      LODWORD(v58) = 22;
      v57 = &v60;
      v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        v30 = (void *)v29;
        v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v60, v58);
        free(v30);
        v57 = (int *)v31;
        SSFileLog();
      }
    }
    if (objc_msgSend(v17, "error", v57))
    {
      v32 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v33 = objc_msgSend(v32, "shouldLog");
      if (objc_msgSend(v32, "shouldLogToDisk"))
        v34 = v33 | 2;
      else
        v34 = v33;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v32, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v34 &= 2u;
      if (v34)
      {
        v35 = objc_opt_class();
        v60 = 138412290;
        v61 = v35;
        LODWORD(v58) = 12;
LABEL_44:
        v41 = _os_log_send_and_compose_impl();
        if (!v41)
          return;
        v42 = (void *)v41;
LABEL_61:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v60, v58);
        free(v42);
        SSFileLog();
      }
    }
    else
    {
      v53 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v53, "postNotificationName:object:", CFSTR("SUPurchaseFinishedNotification"), objc_msgSend(v17, "purchase"));
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v17, CFSTR("SUPurchaseNotificationKeyPurchaseResponse"), 0);
      objc_msgSend(v53, "postNotificationName:object:userInfo:", CFSTR("SUPurchaseRequestDidSucceedNotification"), self, v54);

    }
  }
  else
  {
    v36 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v37 = objc_msgSend(v36, "shouldLog");
    if (objc_msgSend(v36, "shouldLogToDisk"))
      v38 = v37 | 2;
    else
      v38 = v37;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v36, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v38 &= 2u;
    if (v38)
    {
      v39 = objc_opt_class();
      v40 = objc_opt_class();
      v60 = 138412546;
      v61 = v39;
      v62 = 2112;
      v63 = v40;
      LODWORD(v58) = 22;
      goto LABEL_44;
    }
  }
}

- (void)_dialogDidFinish:(id)a3
{
  if (self->_showingErrorDialogs
    && !-[SUDialogManager numberOfPendingDialogs](+[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance", a3), "numberOfPendingDialogs"))
  {
    self->_showingErrorDialogs = 0;
    -[SUPurchaseManager _performNextAction](self, "_performNextAction");
  }
}

- (void)continuation:(id)a3 failedWithError:(id)a4
{
  -[NSMutableSet removeObject:](self->_inflightContinuations, "removeObject:", a3, a4);
  -[SUPurchaseManager _performNextAction](self, "_performNextAction");
}

- (void)continuationFinished:(id)a3
{
  -[SUPurchaseManager _enqueuePurchases:](self, "_enqueuePurchases:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(a3, "purchase"), 0));
  -[NSMutableSet removeObject:](self->_inflightContinuations, "removeObject:", a3);
  -[SUPurchaseManager _performNextAction](self, "_performNextAction");
}

- (void)purchaseRequest:(id)a3 purchaseDidFail:(id)a4 withError:(id)a5
{
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3);
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (v10)
  {
    v17 = 138412546;
    v18 = objc_opt_class();
    v19 = 2112;
    v20 = a5;
    LODWORD(v16) = 22;
    v15 = &v17;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v17, v16);
      free(v12);
      v15 = (int *)v13;
      SSFileLog();
    }
  }
  if (objc_msgSend(a4, "valueForDownloadProperty:", *MEMORY[0x24BEB2410], v15))
    -[SUPurchaseManager removePurchasedItemIdentifier:](self, "removePurchasedItemIdentifier:", SSGetUnsignedLongLongFromValue());
  -[SUPurchaseManager _removePlaceholdersForPurchase:](self, "_removePlaceholdersForPurchase:", a4);
  if (objc_msgSend(a5, "code") == 9990)
    v14 = objc_msgSend(a4, "tidHeaders");
  else
    v14 = 0;
  -[SUPurchaseManager setTidHeaders:](self, "setTidHeaders:", v14);
  if (a5)
    a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", a5, CFSTR("SUPurchaseNotificationKeyError"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SUPurchaseFailedNotification"), a4, a5);

}

- (void)purchaseRequest:(id)a3 purchaseDidSucceed:(id)a4
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3, a4);
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v10 = 138412290;
    v11 = objc_opt_class();
    LODWORD(v9) = 12;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v10, v9);
      free(v8);
      SSFileLog();
    }
  }
}

- (void)purchaseRequest:(id)a3 purchaseDidSucceedWithResponse:(id)a4
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SUPurchaseManager setTidHeaders:](self, "setTidHeaders:", 0, a4);
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v10 = 138412290;
    v11 = objc_opt_class();
    LODWORD(v9) = 12;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v10, v9);
      free(v8);
      SSFileLog();
    }
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  SUPurchaseManager *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = self;
    -[SUPurchaseManagerDelegate purchaseManager:didFinishPurchaseRequest:withError:](self->_delegate, "purchaseManager:didFinishPurchaseRequest:withError:", self, a3, a4);
  }
  -[SUPurchaseManager _removePurchaseRequest:](self, "_removePurchaseRequest:", a3);
}

- (void)requestDidFinish:(id)a3
{
  SUPurchaseManager *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = self;
    -[SUPurchaseManagerDelegate purchaseManager:didFinishPurchaseRequest:withError:](self->_delegate, "purchaseManager:didFinishPurchaseRequest:withError:", self, a3, 0);
  }
  -[SUPurchaseManager _removePurchaseRequest:](self, "_removePurchaseRequest:", a3);
}

- (id)_accountDSIDForPurchase:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id result;

  v5 = (void *)objc_msgSend(a3, "valueForDownloadProperty:", *MEMORY[0x24BEB23A8]);
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB22C0]))
    return -[SUPurchaseManager accountDSID](self, "accountDSID");
  v6 = objc_msgSend(a3, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForItemID:", v6);
  if (!objc_msgSend((id)objc_msgSend(v7, "applicationDSID"), "integerValue"))
    return -[SUPurchaseManager accountDSID](self, "accountDSID");
  result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)objc_msgSend(v7, "applicationDSID"), "integerValue"));
  if (!result)
    return -[SUPurchaseManager accountDSID](self, "accountDSID");
  return result;
}

- (id)_downloadManagerForDownloadKind:(id)a3
{
  NSMutableArray *observedDownloadManagers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  observedDownloadManagers = self->_observedDownloadManagers;
  if (!observedDownloadManagers)
  {
    observedDownloadManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_observedDownloadManagers = observedDownloadManagers;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observedDownloadManagers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(observedDownloadManagers);
      v10 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "managerOptions"), "downloadKinds"), "containsObject:", a3) & 1) != 0)break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](observedDownloadManagers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    if (v10)
      return v10;
  }
LABEL_13:
  v10 = -[SUQueueSessionManager beginDownloadManagerSessionForDownloadKind:](self->_queueSessionManager, "beginDownloadManagerSessionForDownloadKind:", a3);
  if (v10
    || (v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", a3, 0),
        v10 = -[SUQueueSessionManager beginDownloadManagerSessionWithDownloadKinds:](self->_queueSessionManager, "beginDownloadManagerSessionWithDownloadKinds:", v11), v11, v10))
  {
    objc_msgSend(v10, "addObserver:", self);
    -[NSMutableArray addObject:](self->_observedDownloadManagers, "addObject:", v10);
  }
  return v10;
}

- (void)_enqueueContinuations:(id)a3
{
  NSMutableArray *pendingContinuations;

  pendingContinuations = self->_pendingContinuations;
  if (!pendingContinuations)
  {
    pendingContinuations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_pendingContinuations = pendingContinuations;
  }
  -[NSMutableArray addObjectsFromArray:](pendingContinuations, "addObjectsFromArray:", a3);
}

- (void)_enqueueExternalDownload:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[6];

  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x24BEB2410]);
  v5 = SSGetUnsignedLongLongFromValue();
  -[SUPurchaseManager addPurchasedItemIdentifier:](self, "addPurchasedItemIdentifier:", v5);
  v6 = -[SUPurchaseManager _downloadManagerForDownloadKind:](self, "_downloadManagerForDownloadKind:", objc_msgSend(a3, "valueForProperty:", *MEMORY[0x24BEB23A8]));
  v7 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SUPurchaseManager__enqueueExternalDownload___block_invoke;
  v8[3] = &unk_24DE7BB08;
  v8[4] = self;
  v8[5] = v5;
  objc_msgSend(v6, "addDownloads:completionBlock:", v7, v8);
}

void __46__SUPurchaseManager__enqueueExternalDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[6];

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __46__SUPurchaseManager__enqueueExternalDownload___block_invoke_2;
    v3[3] = &unk_24DE7B950;
    v2 = *(_QWORD *)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v3[5] = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
  }
}

uint64_t __46__SUPurchaseManager__enqueueExternalDownload___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePurchasedItemIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_enqueuePurchases:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSMutableArray *pendingPurchases;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x24BEB2518];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v10, "accountIdentifier"))
        {
          v11 = -[SUPurchaseManager _accountDSIDForPurchase:](self, "_accountDSIDForPurchase:", v10);
          if (v11)
            objc_msgSend(v10, "setAccountIdentifier:", v11);
          if (self->_userAgent
            && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "requestProperties"), "HTTPHeaders"), "objectForKey:", v8))
          {
            v12 = (id)objc_msgSend((id)objc_msgSend(v10, "requestProperties"), "mutableCopy");
            if (!v12)
              v12 = objc_alloc_init(MEMORY[0x24BEB1F30]);
            objc_msgSend(v12, "setValue:forHTTPHeaderField:", self->_userAgent, v8);
            objc_msgSend(v10, "setRequestProperties:", v12);

          }
        }
        ++v9;
      }
      while (v6 != v9);
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = v13;
    }
    while (v13);
  }
  pendingPurchases = self->_pendingPurchases;
  if (!pendingPurchases)
  {
    pendingPurchases = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_pendingPurchases = pendingPurchases;
  }
  -[NSMutableArray addObjectsFromArray:](pendingPurchases, "addObjectsFromArray:", a3);
}

- (BOOL)_issuePurchaseRequestForPurchases:(id)a3
{
  void *v5;
  NSMutableArray *purchaseRequests;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F88]), "initWithPurchases:", a3);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setShouldValidatePurchases:", 0);
  purchaseRequests = self->_purchaseRequests;
  if (!purchaseRequests)
  {
    purchaseRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_purchaseRequests = purchaseRequests;
  }
  -[NSMutableArray addObject:](purchaseRequests, "addObject:", v5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSPurchaseRequestsChangedNotification"), self);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = *MEMORY[0x24BEB2410];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_futurePurchases, "containsObject:", v14))
          -[NSMutableSet removeObject:](self->_futurePurchases, "removeObject:", v14);
        v15 = objc_msgSend(v14, "valueForDownloadProperty:", v12);
        if (v15)
          objc_msgSend(v8, "addObject:", v15);
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  -[SUPurchaseManager addPurchasedItemIdentifiers:](self, "addPurchasedItemIdentifiers:", v8);

  objc_msgSend(v7, "count");
  return objc_msgSend(v5, "start");
}

- (BOOL)_needsAuthenticationForPurchases:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v5 = objc_msgSend(v4, "activeAccount");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_msgSend(v10, "accountIdentifier");
          v12 = (void *)v5;
          if (v11)
            v12 = (void *)objc_msgSend(v4, "accountWithUniqueIdentifier:");
          if (!v12 || !objc_msgSend(v12, "isAuthenticated"))
            return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  return objc_msgSend(v4, "isExpired");
}

- (void)_performNextAction
{
  NSMutableArray *v3;

  if (!self->_showingErrorDialogs && !-[NSMutableSet count](self->_inflightContinuations, "count"))
  {
    if (-[NSMutableArray count](self->_pendingContinuations, "count"))
    {
      v3 = self->_pendingContinuations;

      self->_pendingContinuations = 0;
      -[SUPurchaseManager _startContinuations:](self, "_startContinuations:", v3);
    }
    else
    {
      if (!-[NSMutableArray count](self->_pendingPurchases, "count"))
        return;
      v3 = self->_pendingPurchases;

      self->_pendingPurchases = 0;
      -[SUPurchaseManager _startPurchases:](self, "_startPurchases:", v3);
    }

  }
}

- (void)_removePurchaseRequest:(id)a3
{
  objc_msgSend(a3, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_purchaseRequests, "removeObject:", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSPurchaseRequestsChangedNotification"), self);
}

- (void)_showDialogsForErrors:(id)a3
{
  SUDialogManager *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = +[SUDialogManager sharedInstance](SUDialogManager, "sharedInstance");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        -[SUDialogManager presentDialogForError:](v5, "presentDialogForError:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  self->_showingErrorDialogs = -[SUDialogManager numberOfPendingDialogs](v5, "numberOfPendingDialogs") > 0;
}

- (void)_startContinuations:(id)a3
{
  NSMutableSet *inflightContinuations;

  inflightContinuations = self->_inflightContinuations;
  if (!inflightContinuations)
  {
    inflightContinuations = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_inflightContinuations = inflightContinuations;
  }
  -[NSMutableSet addObjectsFromArray:](inflightContinuations, "addObjectsFromArray:", a3);
  objc_msgSend(a3, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);
  objc_msgSend(a3, "makeObjectsPerformSelector:", sel_start);
}

- (void)_startPurchases:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUPurchaseManagerDelegate purchaseManager:willAddPurchases:](self->_delegate, "purchaseManager:willAddPurchases:", self, a3);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUPurchaseManager _enqueueExternalDownload:](self, "_enqueueExternalDownload:", v10);
        else
          objc_msgSend(v5, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v5, "count"))
  {
    v11 = -[SUPurchaseManager _issuePurchaseRequestForPurchases:](self, "_issuePurchaseRequestForPurchases:", v5);

    if (!v11)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SUPurchaseManagerDelegate purchaseManager:failedToAddPurchases:](self->_delegate, "purchaseManager:failedToAddPurchases:", self, a3);
      goto LABEL_20;
    }
  }
  else
  {

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUPurchaseManagerDelegate purchaseManager:didAddPurchases:](self->_delegate, "purchaseManager:didAddPurchases:", self, a3);
LABEL_20:
  -[SUPurchaseManager _performNextAction](self, "_performNextAction");
}

- (SUPurchaseManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUPurchaseManagerDelegate *)a3;
}

- (NSSet)futurePurchases
{
  return &self->_futurePurchases->super;
}

- (NSSet)purchasedItemIdentifiers
{
  return &self->_purchasedIdentifiers->super;
}

- (SUQueueSessionManager)queueSessionManager
{
  return self->_queueSessionManager;
}

- (NSDictionary)tidHeaders
{
  return self->_tidHeaders;
}

- (void)setTidHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)addExternalDownloads:(id)a3 inContext:(OpaqueJSContext *)a4
{
  -[SUPurchaseManager addExternalDownloads:withOptions:inContext:](self, "addExternalDownloads:withOptions:inContext:", a3, 0, a4);
}

- (void)addExternalDownloads:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5
{
  JSPropertyNameArrayRef v9;
  OpaqueJSPropertyNameArray *v10;
  id v11;
  int64_t Count;
  int64_t v13;
  uint64_t i;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  OpaqueJSPropertyNameArray *array;

  v9 = JSObjectCopyPropertyNames(a5, (JSObjectRef)objc_msgSend(a3, "JSObject"));
  if (v9)
  {
    v10 = v9;
    v20 = a4;
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    array = v10;
    Count = JSPropertyNameArrayGetCount(v10);
    if (Count >= 1)
    {
      v13 = Count;
      for (i = 0; i != v13; ++i)
      {
        v15 = objc_alloc_init(MEMORY[0x24BDD1460]);
        v16 = -[SUPurchaseManager _newDictionaryForWebScriptValue:inContext:](self, "_newDictionaryForWebScriptValue:inContext:", objc_msgSend(a3, "webScriptValueAtIndex:", i), a5);
        if (v16)
        {
          v17 = v16;
          v18 = -[SUPurchaseManager _newExternalDownloadWithDictionary:](self, "_newExternalDownloadWithDictionary:", v16);
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        objc_msgSend(v15, "drain", v20, array);
      }
    }
    if (objc_msgSend(v11, "count", v20))
      -[SUPurchaseManager _addBatchForPurchases:options:](self, "_addBatchForPurchases:options:", v11, v21);

    JSPropertyNameArrayRelease(array);
  }
}

- (id)copyPurchaseForScriptObject:(id)a3
{
  return -[SUPurchaseManager copyPurchaseForScriptObject:inContext:](self, "copyPurchaseForScriptObject:inContext:", a3, 0);
}

- (id)copyPurchaseForScriptObject:(id)a3 inContext:(OpaqueJSContext *)a4
{
  void *v7;
  void *v8;
  Class *v9;
  id v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;

  v7 = (void *)objc_msgSend(a3, "safeValueForKey:", CFSTR("actionParams"));
  if (!objc_msgSend(v7, "length"))
    return 0;
  objc_msgSend(a3, "safeValueForKey:", CFSTR("itemType"));
  v8 = (void *)SSDownloadKindForItemKind();
  v9 = (Class *)0x24BEB1FE8;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB22B8]) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB22C8]))
  {
    v9 = (Class *)0x24BEB1F78;
  }
  v10 = objc_alloc_init(*v9);
  objc_msgSend(v10, "setBuyParameters:", v7);
  objc_msgSend(v10, "setValue:forDownloadProperty:", v8, *MEMORY[0x24BEB23A8]);
  v11 = -[SUPurchaseManager tidHeaders](self, "tidHeaders");
  if (v11)
    objc_msgSend(v10, "setTidHeaders:", v11);
  v12 = objc_msgSend(a3, "safeValueForKey:", CFSTR("artworkURL"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v12, *MEMORY[0x24BEB2468]);
  v13 = objc_msgSend(a3, "safeValueForKey:", CFSTR("artistName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v13, *MEMORY[0x24BEB2328]);
  v14 = objc_msgSend(a3, "safeValueForKey:", CFSTR("bundleId"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v14, *MEMORY[0x24BEB2338]);
  v15 = objc_msgSend(a3, "safeValueForKey:", CFSTR("collectionName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v15, *MEMORY[0x24BEB2350]);
  if (objc_msgSend(a3, "safeValueForKey:", CFSTR("itemId")))
    objc_msgSend(v10, "setValue:forDownloadProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", SSGetUnsignedLongLongFromValue()), *MEMORY[0x24BEB2410]);
  v16 = objc_msgSend(a3, "safeValueForKey:", *MEMORY[0x24BEB2638]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v16, *MEMORY[0x24BEB2458]);
  v17 = objc_msgSend(a3, "safeValueForKey:", *MEMORY[0x24BEB2640]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v17, *MEMORY[0x24BEB2460]);
  v18 = (void *)objc_msgSend(a3, "safeValueForKey:", *MEMORY[0x24BEB2740]);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v18, "BOOLValue"))
  {
    v19 = objc_msgSend(v10, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]);
    objc_msgSend(v10, "setValue:forDownloadProperty:", v19, *MEMORY[0x24BEB2420]);
  }
  v20 = (void *)objc_msgSend(a3, "safeValueForKey:", CFSTR("seasonNumber"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v20, "integerValue"));
    objc_msgSend(v10, "setValue:forDownloadProperty:", v21, *MEMORY[0x24BEB23C8]);
  }
  v22 = objc_msgSend(a3, "safeValueForKey:", CFSTR("seriesName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v22, *MEMORY[0x24BEB23D0]);
  v23 = objc_msgSend(a3, "safeValueForKey:", CFSTR("software-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v23, *MEMORY[0x24BEB23E0]);
  v24 = objc_msgSend(a3, "safeValueForKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v10, "setValue:forDownloadProperty:", v24, *MEMORY[0x24BEB2470]);
  v25 = (void *)objc_msgSend(a3, "safeValueForKey:", CFSTR("networkConstraints"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v25, "copyArrayOrDictionaryWithContext:", a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_alloc_init(MEMORY[0x24BEB1F38]);
      objc_msgSend(v28, "setSizeLimitsWithStoreConstraintDictionary:", v27);
      objc_msgSend(v10, "setNetworkConstraints:", v28);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (void *)objc_msgSend(a3, "safeValueForKey:", CFSTR("allowedToneStyles"));
    objc_opt_class();
    v30 = objc_opt_isKindOfClass();
    v31 = 0;
    if (a4 && (v30 & 1) != 0)
      v31 = (void *)objc_msgSend(v29, "copyArrayOrDictionaryWithContext:", a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v32 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB22C8]);
      v33 = objc_alloc(MEMORY[0x24BDBCE30]);
      v34 = *MEMORY[0x24BEB2750];
      if (v32)
        v35 = objc_msgSend(v33, "initWithObjects:", v34, *MEMORY[0x24BEB2758], 0);
      else
        v35 = objc_msgSend(v33, "initWithObjects:", v34, 0, v37);
      v31 = (void *)v35;
    }
    objc_msgSend(v10, "setAllowedToneStyles:", v31);

  }
  SSVPurchaseAddDownloadPropertiesForBuyParameters();
  return v10;
}

- (void)enqueueScriptPurchases:(id)a3
{
  id v4;

  v4 = -[SUPurchaseManager _newPurchaseBatchForPurchases:](self, "_newPurchaseBatchForPurchases:", a3);
  -[SUPurchaseManager addPurchaseBatch:](self, "addPurchaseBatch:", v4);

}

- (void)purchaseScriptObject:(id)a3
{
  -[SUPurchaseManager purchaseScriptObject:withOptions:inContext:](self, "purchaseScriptObject:withOptions:inContext:", a3, 0, 0);
}

- (void)purchaseScriptObject:(id)a3 withOptions:(id)a4 inContext:(OpaqueJSContext *)a5
{
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "webScriptValueAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", a3, 0);
  else
    v9 = (void *)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
  v10 = v9;
  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v10);
          v16 = -[SUPurchaseManager copyPurchaseForScriptObject:inContext:](self, "copyPurchaseForScriptObject:inContext:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), a5);
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v11, "addObject:", v16);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }
    if (objc_msgSend(v11, "count"))
      -[SUPurchaseManager _addBatchForPurchases:options:](self, "_addBatchForPurchases:options:", v11, a4);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (void)_addBatchForPurchases:(id)a3 options:(id)a4
{
  objc_msgSend(a4, "safeValueForKey:", CFSTR("callback"));
  WebThreadRunOnMainThread();
}

void __70__SUPurchaseManager_SUScriptAdditions___addBatchForPurchases_options___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_newPurchaseBatchForPurchases:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(v3, "validPurchases");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_schedulePurchaseCallback:forPurchases:", *(_QWORD *)(a1 + 48), v2);
  objc_msgSend(*(id *)(a1 + 32), "addPurchaseBatch:", v3);

}

- (id)_newDictionaryForWebScriptValue:(id)a3 inContext:(OpaqueJSContext *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)SUScriptPropertyListFromString(a3);
  else
    return 0;
}

- (id)_newExternalDownloadWithDictionary:(id)a3
{
  if (objc_msgSend(a3, "objectForKey:", CFSTR("type")))
    return -[SUPurchaseManager _newExternalDownloadWithItemDictionary:](self, "_newExternalDownloadWithItemDictionary:", a3);
  else
    return -[SUPurchaseManager _newExternalDownloadWithDownloadDictionary:](self, "_newExternalDownloadWithDownloadDictionary:", a3);
}

- (id)_newExternalDownloadWithDownloadDictionary:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E30]), "initWithDictionary:", a3);
  if (objc_msgSend(v3, "kind"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E08]), "initWithDownloadMetadata:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)_newExternalDownloadWithItemDictionary:(id)a3
{
  id v4;
  id result;
  id v6;
  void *v7;

  v4 = +[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource");
  result = (id)objc_msgSend(v4, "newItemWithItemDictionary:", a3);
  if (result)
  {
    v6 = result;
    v7 = (void *)objc_msgSend(v4, "newExternalDownloadWithItem:storeOffer:", result, objc_msgSend(result, "defaultStoreOffer"));

    return v7;
  }
  return result;
}

- (id)_newPurchaseBatchForPurchases:(id)a3
{
  SUPurchaseManagerDelegate *v5;
  SUPurchaseBatch *v6;

  v5 = -[SUPurchaseManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v6 = (SUPurchaseBatch *)(id)-[SUPurchaseManagerDelegate purchaseManager:purchaseBatchForPurchases:](v5, "purchaseManager:purchaseBatchForPurchases:", self, a3)) == 0)
  {
    v6 = objc_alloc_init(SUPurchaseBatch);
    -[SUPurchaseBatch setValidPurchases:](v6, "setValidPurchases:", a3);
  }
  -[SUPurchaseBatch setPurchaseManager:](v6, "setPurchaseManager:", self);
  return v6;
}

- (void)_schedulePurchaseCallback:(id)a3 forPurchases:(id)a4
{
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[9];
  _QWORD v20[9];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  if ((unint64_t)objc_msgSend(a4, "count") < 2)
  {
    v12 = objc_msgSend(a4, "firstObject");
    v28 = 0;
    v29 = &v28;
    v30 = 0x3052000000;
    v31 = __Block_byref_object_copy__29;
    v32 = __Block_byref_object_dispose__29;
    v33 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__29;
    v25 = __Block_byref_object_dispose__29;
    v26 = 0;
    v13 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v14 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_2;
    v20[3] = &unk_24DE7CD68;
    v20[4] = v12;
    v20[5] = a3;
    v20[6] = v7;
    v20[7] = &v28;
    v20[8] = &v21;
    v15 = objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("SUPurchaseFailedNotification"), 0, v13, v20);
    v29[5] = v15;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_3;
    v19[3] = &unk_24DE7CD68;
    v19[4] = v12;
    v19[5] = a3;
    v19[6] = v7;
    v19[7] = &v28;
    v19[8] = &v21;
    v16 = objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("SUPurchaseFinishedNotification"), 0, objc_msgSend(MEMORY[0x24BDD1710], "mainQueue"), v19);
    v22[5] = v16;
    v17 = (id)v29[5];
    v18 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v8 = -[SUPurchaseManager numberOfPendingPurchases](self, "numberOfPendingPurchases");
    v28 = 0;
    v29 = &v28;
    v30 = 0x3052000000;
    v31 = __Block_byref_object_copy__29;
    v32 = __Block_byref_object_dispose__29;
    v33 = 0;
    v9 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke;
    v27[3] = &unk_24DE7CD40;
    v27[6] = &v28;
    v27[7] = v8;
    v27[4] = a3;
    v27[5] = v7;
    v10 = (void *)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("SSPurchaseRequestsChangedNotification"), self, v9, v27);
    v29[5] = (uint64_t)v10;
    v11 = v10;
  }
  _Block_object_dispose(&v28, 8);
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "object"), "numberOfPendingPurchases") <= *(_QWORD *)(a1 + 56))
  {
    __CallPurchaseCallback(*(_QWORD *)(a1 + 32), 1, 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "removeObserver:");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
    }
  }
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(a2, "object");
  if (v4 == v5
    || objc_msgSend((id)objc_msgSend(v4, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]), "isEqual:", objc_msgSend(v5, "valueForDownloadProperty:", *MEMORY[0x24BEB2410])))
  {
    __CallPurchaseCallback(*(_QWORD *)(a1 + 40), 0, (SUScriptError *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("SUPurchaseNotificationKeyError")));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
    }
  }
}

void __79__SUPurchaseManager_SUScriptAdditions___schedulePurchaseCallback_forPurchases___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(a2, "object");
  if (v3 == v4
    || objc_msgSend((id)objc_msgSend(v3, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]), "isEqual:", objc_msgSend(v4, "valueForDownloadProperty:", *MEMORY[0x24BEB2410])))
  {
    __CallPurchaseCallback(*(_QWORD *)(a1 + 40), 1, 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 48), "removeObserver:");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
    }
  }
}

@end

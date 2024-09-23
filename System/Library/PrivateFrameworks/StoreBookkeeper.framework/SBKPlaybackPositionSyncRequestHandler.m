@implementation SBKPlaybackPositionSyncRequestHandler

- (id)dataSourceTransactionContext
{
  os_unfair_lock_s *p_lock;
  SBKUniversalPlaybackPositionTransactionContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_dataSourceTransactionContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDataSourceTransactionContext:(id)a3
{
  SBKUniversalPlaybackPositionTransactionContext *v4;
  SBKUniversalPlaybackPositionTransactionContext *dataSourceTransactionContext;

  v4 = (SBKUniversalPlaybackPositionTransactionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  dataSourceTransactionContext = self->_dataSourceTransactionContext;
  self->_dataSourceTransactionContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)currentKVSTransaction
{
  os_unfair_lock_s *p_lock;
  SBKSyncTransaction *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_currentKVSTransaction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCurrentKVSTransaction:(id)a3
{
  SBKSyncTransaction *v4;
  SBKSyncTransaction *currentKVSTransaction;

  v4 = (SBKSyncTransaction *)a3;
  os_unfair_lock_lock(&self->_lock);
  currentKVSTransaction = self->_currentKVSTransaction;
  self->_currentKVSTransaction = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)metadataItemsToCommitToDataSource
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_metadataItemsToCommitToDataSource;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMetadataItemsToCommitToDataSource:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metadataItemsToCommitToDataSource;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)metadataItemsToCommitToKVSStorage
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_metadataItemsToCommitToKVSStorage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMetadataItemsToCommitToKVSStorage:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metadataItemsToCommitToKVSStorage;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBKPlaybackPositionSyncRequestHandler *v10;

  v6 = a4;
  v7 = a3;
  SBKStoreAccount();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBKPlaybackPositionSyncRequestHandler initWithDataSource:bagContext:accountIdentifier:](self, "initWithDataSource:bagContext:accountIdentifier:", v7, v6, v9);

  return v10;
}

- (SBKPlaybackPositionSyncRequestHandler)initWithDataSource:(id)a3 bagContext:(id)a4 accountIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBKPlaybackPositionSyncRequestHandler *v13;
  SBKPlaybackPositionSyncRequestHandler *v14;
  uint64_t v15;
  NSMutableDictionary *metadataItemsFromDataSource;
  uint64_t v17;
  NSDictionary *metadataItemsToCommitToDataSource;
  uint64_t v19;
  NSDictionary *metadataItemsToCommitToKVSStorage;
  uint64_t v21;
  NSMutableDictionary *responseMetadataItemsToCommitToDataSource;
  uint64_t v23;
  NSMutableDictionary *responseMetadataItemsMergedToCommitBackToKVSStorage;
  void *v25;
  void *v26;
  void *v27;
  SBKTransactionController *v28;
  void *v29;
  void *v30;
  SBKTransactionController *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *queue;
  NSObject *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *syncOperationQueue;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKPlaybackPositionSyncRequestHandler.m"), 168, CFSTR("invalid parameters - data source is required"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKPlaybackPositionSyncRequestHandler.m"), 169, CFSTR("invalid parameters - bagContext is required"));

LABEL_3:
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKPlaybackPositionSyncRequestHandler.m"), 170, CFSTR("invalid parameters - bagContext.domain is required"));

  }
  v43.receiver = self;
  v43.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  v13 = -[SBKSyncRequestHandler initWithBagContext:accountIdentifier:](&v43, sel_initWithBagContext_accountIdentifier_, v10, v11);
  v14 = v13;
  if (v13)
  {
    -[SBKPlaybackPositionSyncRequestHandler setDataSource:](v13, "setDataSource:", v9);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    metadataItemsFromDataSource = v14->_metadataItemsFromDataSource;
    v14->_metadataItemsFromDataSource = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    metadataItemsToCommitToDataSource = v14->_metadataItemsToCommitToDataSource;
    v14->_metadataItemsToCommitToDataSource = (NSDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    metadataItemsToCommitToKVSStorage = v14->_metadataItemsToCommitToKVSStorage;
    v14->_metadataItemsToCommitToKVSStorage = (NSDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    responseMetadataItemsToCommitToDataSource = v14->_responseMetadataItemsToCommitToDataSource;
    v14->_responseMetadataItemsToCommitToDataSource = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    responseMetadataItemsMergedToCommitBackToKVSStorage = v14->_responseMetadataItemsMergedToCommitBackToKVSStorage;
    v14->_responseMetadataItemsMergedToCommitBackToKVSStorage = (NSMutableDictionary *)v23;

    objc_msgSend(v10, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBKPlaybackPositionSyncRequestHandler.m"), 181, CFSTR("Invalid bag.  no domain specified"));

    }
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "accountWithUniqueIdentifier:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = [SBKTransactionController alloc];
    objc_msgSend(v10, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncRequestURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SBKTransactionController initWithDomain:requestURL:forAccount:](v28, "initWithDomain:requestURL:forAccount:", v29, v30, v27);

    -[SBKTransactionController setDelegate:](v31, "setDelegate:", v14);
    -[SBKPlaybackPositionSyncRequestHandler setKvsController:](v14, "setKvsController:", v31);
    v14->_lock._os_unfair_lock_opaque = 0;
    v32 = dispatch_queue_create("SBKPlaybackPositionSyncRequestHandler.queue", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v32;

    v34 = v14->_queue;
    dispatch_get_global_queue(-32768, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v34, v35);

    v36 = dispatch_queue_create("SBKPlaybackPositionSyncRequestHandler.syncOperationQueue", 0);
    syncOperationQueue = v14->_syncOperationQueue;
    v14->_syncOperationQueue = (OS_dispatch_queue *)v36;

    dispatch_set_target_queue((dispatch_object_t)v14->_syncOperationQueue, v35);
  }

  return v14;
}

- (void)clearTransactionResponseData
{
  os_unfair_lock_s *p_lock;
  SBKUniversalPlaybackPositionTransactionContext *dataSourceTransactionContext;
  SBKSyncTransaction *currentKVSTransaction;
  NSDictionary *v6;
  NSDictionary *metadataItemsToCommitToDataSource;
  NSDictionary *v8;
  NSDictionary *metadataItemsToCommitToKVSStorage;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataSourceTransactionContext = self->_dataSourceTransactionContext;
  self->_dataSourceTransactionContext = 0;

  currentKVSTransaction = self->_currentKVSTransaction;
  self->_currentKVSTransaction = 0;

  -[NSMutableDictionary removeAllObjects](self->_metadataItemsFromDataSource, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v6;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v8;

  -[NSMutableDictionary removeAllObjects](self->_responseMetadataItemsToCommitToDataSource, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_responseMetadataItemsMergedToCommitBackToKVSStorage, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)_dataSourceCancelTransaction
{
  void *v3;
  id v4;

  -[SBKPlaybackPositionSyncRequestHandler clearTransactionResponseData](self, "clearTransactionResponseData");
  -[SBKPlaybackPositionSyncRequestHandler dataSource](self, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBKPlaybackPositionSyncRequestHandler dataSourceTransactionContext](self, "dataSourceTransactionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelUniversalPlaybackPositionTransaction:", v3);

  }
}

- (BOOL)_synchronize:(id *)a3
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  id v58;
  _QWORD v59[5];
  _QWORD block[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke;
  block[3] = &unk_24E2A8118;
  block[4] = self;
  block[5] = &v61;
  dispatch_sync(queue, block);
  v7 = *((unsigned __int8 *)v62 + 24);
  v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
    }

    -[SBKPlaybackPositionSyncRequestHandler dataSource](self, "dataSource");
    v11 = objc_claimAutoreleasedReturnValue();
    v59[0] = v6;
    v59[1] = 3221225472;
    v59[2] = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_18;
    v59[3] = &unk_24E2A7D88;
    v59[4] = self;
    objc_msgSend((id)v11, "beginTransactionWithItemsToSyncEnumerationBlock:", v59);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKPlaybackPositionSyncRequestHandler setDataSourceTransactionContext:](self, "setDataSourceTransactionContext:", v12);

    -[SBKPlaybackPositionSyncRequestHandler dataSourceTransactionContext](self, "dataSourceTransactionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = v13 == 0;

    if ((v11 & 1) != 0)
      goto LABEL_10;
    if (-[SBKPlaybackPositionSyncRequestHandler _shouldStop](self, "_shouldStop"))
    {
      -[SBKPlaybackPositionSyncRequestHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
LABEL_10:
      v10 = 0;
      goto LABEL_40;
    }
    os_unfair_lock_lock(&self->_lock);
    v14 = (void *)-[NSMutableDictionary copy](self->_metadataItemsFromDataSource, "copy");
    v15 = (void *)-[NSMutableDictionary copy](self->_responseMetadataItemsMergedToCommitBackToKVSStorage, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v16 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      objc_msgSend(v14, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v66 = v18;
      v67 = 2112;
      v68 = v19;
      _os_log_impl(&dword_21E4FD000, v16, OS_LOG_TYPE_DEFAULT, "Gathered local %lu items to sync from dataSource: %@", buf, 0x16u);

    }
    v20 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKPlaybackPositionSyncRequestHandler dataSourceTransactionContext](self, "dataSourceTransactionContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v66 = (uint64_t)v21;
      _os_log_impl(&dword_21E4FD000, v20, OS_LOG_TYPE_DEFAULT, "dataSource transaction context = %@", buf, 0xCu);

    }
    -[SBKPlaybackPositionSyncRequestHandler setMetadataItemsToCommitToKVSStorage:](self, "setMetadataItemsToCommitToKVSStorage:", v14);
    -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SBKPlaybackPositionSyncRequestHandler newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:processConflicts:](self, "newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:processConflicts:", v23, 1);
    -[SBKPlaybackPositionSyncRequestHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v24);

    -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = v26 == 0;

    if ((_DWORD)v23
      && (-[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          +[SBKStoreError transactionMissingURLErrorWithTransaction:underlyingError:](SBKStoreError, "transactionMissingURLErrorWithTransaction:underlyingError:", v32, 0), v31 = (void *)objc_claimAutoreleasedReturnValue(), v32, v31))
    {
      if (a3)
        *a3 = objc_retainAutorelease(v31);
    }
    else
    {
      if (-[SBKPlaybackPositionSyncRequestHandler _shouldStop](self, "_shouldStop"))
      {
        -[SBKPlaybackPositionSyncRequestHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
        v10 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v27 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "syncAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v66 = (uint64_t)v29;
        _os_log_impl(&dword_21E4FD000, v27, OS_LOG_TYPE_DEFAULT, "Performing sync with server using syncAnchor = %@", buf, 0xCu);

      }
      -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKPlaybackPositionSyncRequestHandler _synchronouslyRunKVSTransaction:](self, "_synchronouslyRunKVSTransaction:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        if (!-[SBKPlaybackPositionSyncRequestHandler _shouldStop](self, "_shouldStop"))
        {
          -[SBKPlaybackPositionSyncRequestHandler _mergeMetadataItemsFromSyncResponse](self, "_mergeMetadataItemsFromSyncResponse");
          -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");

          if (!v34)
            goto LABEL_53;
          _SBKLogCategorySync();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "allKeys");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v37;
            _os_log_impl(&dword_21E4FD000, v35, OS_LOG_TYPE_DEFAULT, "Sending merged items to server: %@", buf, 0xCu);

          }
          -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allKeys");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[SBKPlaybackPositionSyncRequestHandler newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:processConflicts:](self, "newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:processConflicts:", v39, 0);
          -[SBKPlaybackPositionSyncRequestHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v40);

          -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBKPlaybackPositionSyncRequestHandler _synchronouslyRunKVSTransaction:](self, "_synchronouslyRunKVSTransaction:", v41);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            if (a3)
              *a3 = objc_retainAutorelease(v31);
            goto LABEL_36;
          }
          if (!-[SBKPlaybackPositionSyncRequestHandler _shouldStop](self, "_shouldStop"))
          {
LABEL_53:
            if (objc_msgSend(v15, "count"))
            {
              _SBKLogCategoryDefault();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21E4FD000, v43, OS_LOG_TYPE_ERROR, "WARNING: sent resolved conflict to server, but still received conflicts in the response, saving those for next time...", buf, 2u);
              }

            }
            _SBKLogCategorySync();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              -[SBKSyncRequestHandler responseDomainVersion](self, "responseDomainVersion");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToDataSource](self, "metadataItemsToCommitToDataSource");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v66 = (uint64_t)v45;
              v67 = 2112;
              v68 = v46;
              _os_log_impl(&dword_21E4FD000, v44, OS_LOG_TYPE_DEFAULT, "Committing merged items with domainRevision: %@ to local database: %@", buf, 0x16u);

            }
            -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToDataSource](self, "metadataItemsToCommitToDataSource");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectEnumerator");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            -[SBKPlaybackPositionSyncRequestHandler dataSource](self, "dataSource");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBKPlaybackPositionSyncRequestHandler dataSourceTransactionContext](self, "dataSourceTransactionContext");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBKSyncRequestHandler responseDomainVersion](self, "responseDomainVersion");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v6;
            v55 = 3221225472;
            v56 = __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_22;
            v57 = &unk_24E2A7DB0;
            v52 = v48;
            v58 = v52;
            objc_msgSend(v49, "commitUniversalPlaybackPositionTransaction:domainVersion:metadataEnumerationBlock:", v50, v51, &v54);

            -[SBKPlaybackPositionSyncRequestHandler clearTransactionResponseData](self, "clearTransactionResponseData", v54, v55, v56, v57);
            _SBKLogCategorySync();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21E4FD000, v53, OS_LOG_TYPE_DEFAULT, "Finished synchronization", buf, 2u);
            }

            v31 = 0;
            v10 = 1;
            goto LABEL_38;
          }
        }
        -[SBKPlaybackPositionSyncRequestHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
        v31 = 0;
LABEL_37:
        v10 = 0;
LABEL_38:

        goto LABEL_39;
      }
      if (a3)
        *a3 = objc_retainAutorelease(v31);
    }
LABEL_36:
    -[SBKPlaybackPositionSyncRequestHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
    goto LABEL_37;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_DEFAULT, "Skipping synchronize: synchronization already in progress", buf, 2u);
  }

  v10 = 1;
LABEL_40:
  _Block_object_dispose(&v61, 8);
  return v10;
}

- (BOOL)_shouldStop
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SBKPlaybackPositionSyncRequestHandler__shouldStop__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBKPlaybackPositionSyncRequestHandler setCanceled:](self, "setCanceled:", 1);
  -[SBKPlaybackPositionSyncRequestHandler kvsController](self, "kvsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isIdle"))
  {
    -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_7;
    if (!v8)
    {
      -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKStoreError transactionCancelledErrorWithTransaction:underlyingError:](SBKStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", v6, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKPlaybackPositionSyncRequestHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", v4, v8);
  }

LABEL_7:
  -[SBKPlaybackPositionSyncRequestHandler kvsController](self, "kvsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "cancelAllTransactionsCancelCode:", objc_msgSend(v8, "code"));
  else
    objc_msgSend(v7, "cancelAllTransactions");

}

- (void)timeout
{
  void *v3;
  id v4;

  -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError transactionTimeoutErrorWithTransaction:underlyingError:](SBKStoreError, "transactionTimeoutErrorWithTransaction:underlyingError:", v4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKPlaybackPositionSyncRequestHandler cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancel
{
  -[SBKPlaybackPositionSyncRequestHandler cancelWithError:](self, "cancelWithError:", 0);
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *queue;
  uint64_t v7;
  NSObject *syncOperationQueue;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke;
  block[3] = &unk_24E2A8118;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v15 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKPlaybackPositionSyncRequestHandler.m"), 335, CFSTR("you can not nest synchronization calls"));

  }
  syncOperationQueue = self->_syncOperationQueue;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_24E2A8178;
  v11[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_async(syncOperationQueue, v11);

  _Block_object_dispose(&v14, 8);
}

- (int)_mergeConflictedItemFromSyncResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  double v11;
  double v12;
  double v13;
  uint64_t (*v14)(_QWORD *, uint64_t);
  double v15;
  double v16;
  double v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *, uint64_t);
  void *v26;
  SBKPlaybackPositionSyncRequestHandler *v27;
  id v28;
  id v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_metadataItemsFromDataSource, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __78__SBKPlaybackPositionSyncRequestHandler__mergeConflictedItemFromSyncResponse___block_invoke;
  v26 = &unk_24E2A7DD8;
  v27 = self;
  v7 = v4;
  v28 = v7;
  v29 = v5;
  v8 = v6;
  v30 = v8;
  v9 = v5;
  v10 = (_QWORD *)MEMORY[0x2207AF7FC](&v23);
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "timestamp", v23, v24, v25, v26, v27, v28, v29, v30);
  v12 = v11;
  objc_msgSend(v7, "timestamp");
  if (v12 > v13)
  {
    v14 = (uint64_t (*)(_QWORD *, uint64_t))v10[2];
LABEL_8:
    v18 = v10;
    v19 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v8, "timestamp");
  v16 = v15;
  objc_msgSend(v7, "timestamp");
  if (v16 >= v17)
  {
    v20 = objc_msgSend(v8, "isEqual:", v7);
    v14 = (uint64_t (*)(_QWORD *, uint64_t))v10[2];
    if (!v20)
      goto LABEL_8;
  }
  else
  {
LABEL_5:
    v14 = (uint64_t (*)(_QWORD *, uint64_t))v10[2];
  }
  v18 = v10;
  v19 = 2;
LABEL_9:
  v21 = v14(v18, v19);

  return v21;
}

- (void)_mergeMetadataItemsFromSyncResponse
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;
  NSDictionary *metadataItemsToCommitToDataSource;
  NSDictionary *v6;
  NSDictionary *metadataItemsToCommitToKVSStorage;
  NSObject *v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  int v13;
  NSUInteger v14;
  __int16 v15;
  NSUInteger v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSDictionary *)-[NSMutableDictionary copy](self->_responseMetadataItemsToCommitToDataSource, "copy");
  metadataItemsToCommitToDataSource = self->_metadataItemsToCommitToDataSource;
  self->_metadataItemsToCommitToDataSource = v4;

  v6 = (NSDictionary *)-[NSMutableDictionary copy](self->_responseMetadataItemsMergedToCommitBackToKVSStorage, "copy");
  metadataItemsToCommitToKVSStorage = self->_metadataItemsToCommitToKVSStorage;
  self->_metadataItemsToCommitToKVSStorage = v6;

  -[NSMutableDictionary removeAllObjects](self->_responseMetadataItemsToCommitToDataSource, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_responseMetadataItemsMergedToCommitBackToKVSStorage, "removeAllObjects");
  v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSDictionary count](self->_metadataItemsToCommitToDataSource, "count");
    v10 = -[NSDictionary count](self->_metadataItemsToCommitToKVSStorage, "count");
    -[NSDictionary allKeys](self->_metadataItemsToCommitToDataSource, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_metadataItemsToCommitToKVSStorage, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218754;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_DEFAULT, "Handled items in response, will save %lld items locally and push back %lld conflict resolutions\nkeys to save to local db = %@\nkeys to push to cloud db = %@\n", (uint8_t *)&v13, 0x2Au);

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)newKVSSyncTransactionWithUpdatedMetadataItemIdentifiers:(id)a3 processConflicts:(BOOL)a4
{
  uint64_t v5;
  id v6;
  SBKSyncTransaction *v7;
  void *v8;
  void *v9;
  void *v10;
  SBKSyncTransaction *v11;
  void *v12;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  v6 = a3;
  v7 = [SBKSyncTransaction alloc];
  -[SBKRequestHandler bagContext](self, "bagContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKPlaybackPositionSyncRequestHandler dataSourceTransactionContext](self, "dataSourceTransactionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastSyncedDomainVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBKSyncTransaction initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:](v7, "initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:", v8, v10, v6, 0, v5);

  -[SBKSyncTransaction setTransactionProcessor:](v11, "setTransactionProcessor:", self);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
  -[SBKTransaction setTransactionContext:forKey:](v11, "setTransactionContext:forKey:", v12, CFSTR("completionConditionLock"));

  return v11;
}

- (id)_synchronouslyRunKVSTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SBKPlaybackPositionSyncRequestHandler kvsController](self, "kvsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleTransaction:", v4);

  objc_msgSend(v4, "transactionContextForKey:", CFSTR("completionConditionLock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "lockWhenCondition:beforeDate:", 1, v7);

  if (v8)
  {
    objc_msgSend(v6, "unlock");
  }
  else
  {
    -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKStoreError transactionTimeoutErrorWithTransaction:underlyingError:](SBKStoreError, "transactionTimeoutErrorWithTransaction:underlyingError:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKPlaybackPositionSyncRequestHandler setFatalSyncError:](self, "setFatalSyncError:", v10);

  }
  -[SBKPlaybackPositionSyncRequestHandler fatalSyncError](self, "fatalSyncError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_signalKVSTransactionCompletion:(id)a3
{
  id v3;

  objc_msgSend(a3, "transactionContextForKey:", CFSTR("completionConditionLock"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");
  objc_msgSend(v3, "unlockWithCondition:", 1);

}

- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    if (v6)
    {
      v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_21E4FD000, v10, OS_LOG_TYPE_DEFAULT, "transaction is being canceled.  error = %@", (uint8_t *)&v12, 0xCu);
      }

    }
    -[SBKPlaybackPositionSyncRequestHandler setFatalSyncError:](self, "setFatalSyncError:", v6);
    -[SBKPlaybackPositionSyncRequestHandler currentKVSTransaction](self, "currentKVSTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKPlaybackPositionSyncRequestHandler _signalKVSTransactionCompletion:](self, "_signalKVSTransactionCompletion:", v11);

  }
}

- (BOOL)transactionController:(id)a3 transactionDidFail:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "isAccountsChangedError"))
  {
    v9 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "syncAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_21E4FD000, v9, OS_LOG_TYPE_DEFAULT, "Detected account change.  Getting remote items since version 0 instead of %@\n", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKPlaybackPositionSyncRequestHandler setMetadataItemsToCommitToKVSStorage:](self, "setMetadataItemsToCommitToKVSStorage:", v11);

    objc_storeStrong((id *)&self->_overrideSyncAnchor, CFSTR("0"));
  }
  else if ((objc_msgSend(v8, "isRecoverableError") & 1) == 0)
  {
    -[SBKPlaybackPositionSyncRequestHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", v7, v8);
    v12 = 1;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)transactionController:(id)a3 transactionDidCancel:(id)a4 error:(id)a5
{
  -[SBKPlaybackPositionSyncRequestHandler _signalKVSTransactionCompletion:withError:](self, "_signalKVSTransactionCompletion:withError:", a4, a5);
}

- (void)transactionController:(id)a3 transactionDidFinish:(id)a4
{
  -[SBKPlaybackPositionSyncRequestHandler _signalKVSTransactionCompletion:](self, "_signalKVSTransactionCompletion:", a4);
}

- (void)transaction:(id)a3 willProcessResponseData:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  -[SBKSyncRequestHandler transaction:willProcessResponseData:](&v4, sel_transaction_willProcessResponseData_, a3, a4);
}

- (void)transaction:(id)a3 didProcessResponseData:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  -[SBKSyncRequestHandler transaction:didProcessResponseData:](&v4, sel_transaction_didProcessResponseData_, a3, a4);
}

- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *responseMetadataItemsToCommitToDataSource;
  void *v18;
  objc_super v19;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  -[SBKSyncRequestHandler transaction:processUpdatedKey:data:conflict:isDirty:](&v19, sel_transaction_processUpdatedKey_data_conflict_isDirty_, a3, v12, v13, v8, a7);
  *a7 = 0;
  if (!-[SBKPlaybackPositionSyncRequestHandler _shouldStop](self, "_shouldStop"))
  {
    +[SBKUniversalPlaybackPositionMetadata metadataWithItemIdentifier:keyValueStorePayload:](SBKUniversalPlaybackPositionMetadata, "metadataWithItemIdentifier:keyValueStorePayload:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v8)
    {
      if (v14)
        -[SBKPlaybackPositionSyncRequestHandler _mergeConflictedItemFromSyncResponse:](self, "_mergeConflictedItemFromSyncResponse:", v14);
    }
    else if (v14)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      responseMetadataItemsToCommitToDataSource = self->_responseMetadataItemsToCommitToDataSource;
      objc_msgSend(v15, "itemIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](responseMetadataItemsToCommitToDataSource, "setObject:forKey:", v15, v18);

      os_unfair_lock_unlock(p_lock);
    }

  }
}

- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBKPlaybackPositionSyncRequestHandler;
  -[SBKSyncRequestHandler transaction:processDeletedKey:isDirty:](&v5, sel_transaction_processDeletedKey_isDirty_, a3, a4, a5);
}

- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transaction:(id)a3 syncAnchorForTransactionSyncAnchor:(id)a4
{
  id v5;
  void *v6;
  NSString *overrideSyncAnchor;
  NSString *v8;

  v5 = a4;
  v6 = v5;
  overrideSyncAnchor = self->_overrideSyncAnchor;
  if (!overrideSyncAnchor)
    overrideSyncAnchor = (NSString *)v5;
  v8 = overrideSyncAnchor;

  return v8;
}

- (id)transaction:(id)a3 conflictDetectionOrdinalForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[SBKPlaybackPositionSyncRequestHandler metadataItemsToCommitToKVSStorage](self, "metadataItemsToCommitToKVSStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SBKUniversalPlaybackPositionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (SBKTransactionController)kvsController
{
  return self->_kvsController;
}

- (void)setKvsController:(id)a3
{
  objc_storeStrong((id *)&self->_kvsController, a3);
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSError)fatalSyncError
{
  return self->_fatalSyncError;
}

- (void)setFatalSyncError:(id)a3
{
  objc_storeStrong((id *)&self->_fatalSyncError, a3);
}

- (NSString)overrideSyncAnchor
{
  return self->_overrideSyncAnchor;
}

- (void)setOverrideSyncAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSyncAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSyncAnchor, 0);
  objc_storeStrong((id *)&self->_fatalSyncError, 0);
  objc_storeStrong((id *)&self->_kvsController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_responseMetadataItemsMergedToCommitBackToKVSStorage, 0);
  objc_storeStrong((id *)&self->_responseMetadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsFromDataSource, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToKVSStorage, 0);
  objc_storeStrong((id *)&self->_metadataItemsToCommitToDataSource, 0);
  objc_storeStrong((id *)&self->_currentKVSTransaction, 0);
  objc_storeStrong((id *)&self->_dataSourceTransactionContext, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __78__SBKPlaybackPositionSyncRequestHandler__mergeConflictedItemFromSyncResponse___block_invoke(_QWORD *a1, uint64_t a2)
{
  int *v4;

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 96));
  if ((_DWORD)a2 == 1)
  {
    objc_msgSend(*(id *)(a1[4] + 152), "setObject:forKey:", a1[7], a1[6]);
    v4 = &OBJC_IVAR___SBKPlaybackPositionSyncRequestHandler__responseMetadataItemsToCommitToDataSource;
    goto LABEL_5;
  }
  if ((_DWORD)a2 == 2)
  {
    objc_msgSend(*(id *)(a1[4] + 144), "setObject:forKey:", a1[5], a1[6]);
    v4 = &OBJC_IVAR___SBKPlaybackPositionSyncRequestHandler__responseMetadataItemsMergedToCommitBackToKVSStorage;
LABEL_5:
    objc_msgSend(*(id *)(a1[4] + *v4), "removeObjectForKey:", a1[6]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 96));
  return a2;
}

uint64_t __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "syncInProgress");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __74__SBKPlaybackPositionSyncRequestHandler_synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "_synchronize:", &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __52__SBKPlaybackPositionSyncRequestHandler__shouldStop__block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "canceled"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fatalSyncError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

  }
}

uint64_t __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "syncInProgress");
  return objc_msgSend(*(id *)(a1 + 32), "setSyncInProgress:", 1);
}

void __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_18(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[SBKUniversalPlaybackPositionMetadata metadataWithValuesFromDataSourceItem:](SBKUniversalPlaybackPositionMetadata, "metadataWithValuesFromDataSourceItem:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(v3, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v3, v7);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 96));
  }
  else
  {
    v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_ERROR, "ERROR: will skip syncing item with no sync metadataIdentifier: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

uint64_t __54__SBKPlaybackPositionSyncRequestHandler__synchronize___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextObject");
}

@end

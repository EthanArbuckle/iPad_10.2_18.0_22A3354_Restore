@implementation PGLibraryChangeListener

- (PGLibraryChangeListener)initWithPhotoLibrary:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGLibraryChangeListener *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *changeObservationQueue;
  PGLibraryChangeListenerStateStore *v16;
  PGLibraryChangeListenerStateStore *stateStore;
  uint64_t v18;
  NSHashTable *changeConsumers;
  NSMutableOrderedSet *v20;
  NSMutableOrderedSet *outstandingChangeTokens;
  uint64_t v22;
  NSMapTable *outstandingChangeTokensByConsumer;
  NSCountedSet *v24;
  NSCountedSet *outstandingChangeTokenCounts;
  uint64_t v26;
  PGGraphUpdateHealthRecording *updateHealthRecorder;
  objc_super v29;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PGLibraryChangeListener;
  v11 = -[PGLibraryChangeListener init](&v29, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.photosgraph.changeobserver", v13);
    changeObservationQueue = v11->_changeObservationQueue;
    v11->_changeObservationQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v11->_clientIdentifier, a4);
    v16 = -[PGLibraryChangeListenerStateStore initWithPhotoLibrary:]([PGLibraryChangeListenerStateStore alloc], "initWithPhotoLibrary:", v8);
    stateStore = v11->_stateStore;
    v11->_stateStore = v16;

    objc_storeWeak((id *)&v11->_photoLibrary, v8);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    changeConsumers = v11->_changeConsumers;
    v11->_changeConsumers = (NSHashTable *)v18;

    v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    outstandingChangeTokens = v11->_outstandingChangeTokens;
    v11->_outstandingChangeTokens = v20;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v22 = objc_claimAutoreleasedReturnValue();
    outstandingChangeTokensByConsumer = v11->_outstandingChangeTokensByConsumer;
    v11->_outstandingChangeTokensByConsumer = (NSMapTable *)v22;

    v24 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    outstandingChangeTokenCounts = v11->_outstandingChangeTokenCounts;
    v11->_outstandingChangeTokenCounts = v24;

    if (tokenCountHighWaterMark_onceToken != -1)
      dispatch_once(&tokenCountHighWaterMark_onceToken, &__block_literal_global_5131);
    v11->_outstandingTokensHighWaterMark = tokenCountHighWaterMark_sMaximumChangeTokensCount;
    v11->_outstandingTokensLowWaterMark = (unint64_t)((double)(unint64_t)tokenCountHighWaterMark_sMaximumChangeTokensCount
                                                           * 0.1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __maximumNumberOfMutationsToFetch_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = tokenCountHighWaterMark_sMaximumChangeTokensCount;
    if (maximumNumberOfMutationsToFetch_onceToken != -1)
      dispatch_once(&maximumNumberOfMutationsToFetch_onceToken, block);
    v11->_maximumNumberOfMutationsToFetch = maximumNumberOfMutationsToFetch_sMaximumMutationsToFetch;
    +[PGGraphHealthRecordingFactory graphUpdateHealthRecorderForChangeConsumer:analytics:](PGGraphHealthRecordingFactory, "graphUpdateHealthRecorderForChangeConsumer:analytics:", 0, v10);
    v26 = objc_claimAutoreleasedReturnValue();
    updateHealthRecorder = v11->_updateHealthRecorder;
    v11->_updateHealthRecorder = (PGGraphUpdateHealthRecording *)v26;

  }
  return v11;
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  -[PGLibraryChangeListener setLibraryBecameUnavailable:](self, "setLibraryBecameUnavailable:", 1);
  -[PGLibraryChangeListener stopListening](self, "stopListening");
}

- (void)startListening
{
  NSObject *changeObservationQueue;
  _QWORD block[5];

  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PGLibraryChangeListener_startListening__block_invoke;
  block[3] = &unk_1E8435668;
  block[4] = self;
  dispatch_sync(changeObservationQueue, block);
}

- (void)stopListening
{
  NSObject *changeObservationQueue;
  _QWORD block[5];

  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PGLibraryChangeListener_stopListening__block_invoke;
  block[3] = &unk_1E8435668;
  block[4] = self;
  dispatch_sync(changeObservationQueue, block);
}

- (void)registerChangeConsumer:(id)a3
{
  id v4;
  NSObject *changeObservationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PGLibraryChangeListener_registerChangeConsumer___block_invoke;
  block[3] = &unk_1E8433828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(changeObservationQueue, block);

}

- (void)unregisterChangeConsumer:(id)a3
{
  id v4;
  NSObject *changeObservationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PGLibraryChangeListener_unregisterChangeConsumer___block_invoke;
  block[3] = &unk_1E8433828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(changeObservationQueue, block);

}

- (void)persistToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PGLibraryChangeListener stateStore](self, "stateStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChangeToken:", v4);

}

- (void)photoLibraryDidChange:(id)a3
{
  if (-[PGLibraryChangeListener mode](self, "mode", a3) == 1)
    -[PGLibraryChangeListener _notifyConsumersWithChangesFromFromChangeToken:](self, "_notifyConsumersWithChangesFromFromChangeToken:", 0);
}

- (PHPersistentChangeToken)currentToken
{
  void *v2;
  void *v3;

  -[PGLibraryChangeListener stateStore](self, "stateStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPersistentChangeToken *)v3;
}

- (void)_notifyConsumersWithChangesFromFromChangeToken:(id)a3
{
  id v4;
  NSObject *changeObservationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PGLibraryChangeListener *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  changeObservationQueue = self->_changeObservationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PGLibraryChangeListener__notifyConsumersWithChangesFromFromChangeToken___block_invoke;
  v7[3] = &unk_1E842A5C8;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(changeObservationQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)consumer:(id)a3 didConsumeChangeTokens:(id)a4
{
  id v6;
  id v7;
  NSObject *changeObservationQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_initWeak(&location, self);
    changeObservationQueue = self->_changeObservationQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PGLibraryChangeListener_consumer_didConsumeChangeTokens___block_invoke;
    v9[3] = &unk_1E842A5C8;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(changeObservationQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)consumer:(id)a3 didIgnoreChangeTokens:(id)a4
{
  id v6;
  id v7;
  NSObject *changeObservationQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_initWeak(&location, self);
    changeObservationQueue = self->_changeObservationQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PGLibraryChangeListener_consumer_didIgnoreChangeTokens___block_invoke;
    v9[3] = &unk_1E842A5C8;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    dispatch_async(changeObservationQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (id)_consumer:(id)a3 withChangeTokens:(id)a4 processedChangeTokens:(id)a5 consumedTokens:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v30 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeObservationQueue);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v8, "removeObject:", v16);
        -[PGLibraryChangeListener outstandingChangeTokenCounts](self, "outstandingChangeTokenCounts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countForObject:", v16);

        if (v18 == 1)
        {
          -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "indexOfObject:", v16);

          objc_msgSend(v10, "addIndex:", v20);
        }
        -[PGLibraryChangeListener outstandingChangeTokenCounts](self, "outstandingChangeTokenCounts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    if (v30)
    {
      -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v10, "lastIndex"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGLibraryChangeListener stateStore](self, "stateStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setChangeToken:", v23);

    }
    else
    {
      v23 = 0;
    }
    -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectsAtIndexes:", v10);

  }
  else
  {
    v23 = 0;
  }
  if (-[PGLibraryChangeListener mode](self, "mode") == 2)
  {
    -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (!v27)
    {
      -[PGLibraryChangeListener setMode:](self, "setMode:", 1);
      -[PGLibraryChangeListener lastReadToken](self, "lastReadToken");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLibraryChangeListener _notifyConsumersWithChangesFromFromChangeToken:](self, "_notifyConsumersWithChangesFromFromChangeToken:", v28);

    }
  }

  return v23;
}

- (void)_clearConsumerTokenState
{
  void *v3;
  void *v4;
  id v5;

  -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PGLibraryChangeListener outstandingChangeTokensByConsumer](self, "outstandingChangeTokensByConsumer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PGLibraryChangeListener outstandingChangeTokenCounts](self, "outstandingChangeTokenCounts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (BOOL)_distributeChangesInFetchResult:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *context;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeObservationQueue);
  v5 = 1;
  if (objc_msgSend(v4, "changeCount"))
  {
    v27 = v4;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 1;
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "changeCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "changeCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __59__PGLibraryChangeListener__distributeChangesInFetchResult___block_invoke;
    v32[3] = &unk_1E84283E8;
    v32[4] = self;
    v35 = &v41;
    v36 = &v37;
    v8 = v6;
    v33 = v8;
    v9 = v7;
    v34 = v9;
    objc_msgSend(v4, "enumeratePHChangesWithBlock:", v32);
    if (*((_BYTE *)v42 + 24))
    {
      if (objc_msgSend(v9, "count"))
      {
        -[PGLibraryChangeListener outstandingChangeTokens](self, "outstandingChangeTokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v9);

        objc_msgSend(v9, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGLibraryChangeListener setLastReadToken:](self, "setLastReadToken:", v11);

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[PGLibraryChangeListener changeConsumers](self, "changeConsumers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (objc_msgSend(v9, "count"))
            {
              -[PGLibraryChangeListener outstandingChangeTokenCounts](self, "outstandingChangeTokenCounts");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObjectsFromArray:", v9);

              -[PGLibraryChangeListener outstandingChangeTokensByConsumer](self, "outstandingChangeTokensByConsumer");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKey:", v16);
              v19 = (id)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                v19 = objc_alloc_init(MEMORY[0x1E0C99E10]);
                -[PGLibraryChangeListener outstandingChangeTokensByConsumer](self, "outstandingChangeTokensByConsumer");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKey:", v19, v16);

              }
              objc_msgSend(v19, "addObjectsFromArray:", v9);

            }
            objc_msgSend(v16, "libraryChangesAvailable:", v8);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
        }
        while (v13);
      }

      v21 = v38[3];
      if (v21 < -[PGLibraryChangeListener maximumNumberOfMutationsToFetch](self, "maximumNumberOfMutationsToFetch"))
        goto LABEL_23;
      -[PGLibraryChangeListener setMode:](self, "setMode:", 2);
      -[PGLibraryChangeListener updateHealthRecorder](self, "updateHealthRecorder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "recordNumberOfTimesGraphUpdatePaused:", 1);
    }
    else
    {
      v23 = v38[3];
      if (v23 < -[PGLibraryChangeListener maximumNumberOfMutationsToFetch](self, "maximumNumberOfMutationsToFetch"))
      {
LABEL_23:

        _Block_object_dispose(&v37, 8);
        objc_autoreleasePoolPop(context);
        v5 = *((_BYTE *)v42 + 24) != 0;
        _Block_object_dispose(&v41, 8);
        v4 = v27;
        goto LABEL_24;
      }
      v24 = v38[3];
      if (!v24)
        v24 = -[PGLibraryChangeListener maximumNumberOfMutationsToFetch](self, "maximumNumberOfMutationsToFetch");
      -[PGLibraryChangeListener updateHealthRecorder](self, "updateHealthRecorder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "recordTransactionSize:", v24);
    }

    goto LABEL_23;
  }
LABEL_24:

  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (PGLibraryChangeListenerStateStore)stateStore
{
  return self->_stateStore;
}

- (NSHashTable)changeConsumers
{
  return self->_changeConsumers;
}

- (NSMutableOrderedSet)outstandingChangeTokens
{
  return self->_outstandingChangeTokens;
}

- (NSMapTable)outstandingChangeTokensByConsumer
{
  return self->_outstandingChangeTokensByConsumer;
}

- (NSCountedSet)outstandingChangeTokenCounts
{
  return self->_outstandingChangeTokenCounts;
}

- (unint64_t)outstandingTokensHighWaterMark
{
  return self->_outstandingTokensHighWaterMark;
}

- (unint64_t)outstandingTokensLowWaterMark
{
  return self->_outstandingTokensLowWaterMark;
}

- (unint64_t)maximumNumberOfMutationsToFetch
{
  return self->_maximumNumberOfMutationsToFetch;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (PHPersistentChangeToken)lastReadToken
{
  return self->_lastReadToken;
}

- (void)setLastReadToken:(id)a3
{
  objc_storeStrong((id *)&self->_lastReadToken, a3);
}

- (PGGraphUpdateHealthRecording)updateHealthRecorder
{
  return self->_updateHealthRecorder;
}

- (BOOL)libraryBecameUnavailable
{
  return self->_libraryBecameUnavailable;
}

- (void)setLibraryBecameUnavailable:(BOOL)a3
{
  self->_libraryBecameUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHealthRecorder, 0);
  objc_storeStrong((id *)&self->_lastReadToken, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokenCounts, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokensByConsumer, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokens, 0);
  objc_storeStrong((id *)&self->_changeConsumers, 0);
  objc_storeStrong((id *)&self->_stateStore, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_changeObservationQueue, 0);
}

void __59__PGLibraryChangeListener__distributeChangesInFetchResult___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "libraryBecameUnavailable"))
  {
    *a3 = 1;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Photo library became unavailable. Stopping change enumeration.", (uint8_t *)&v14, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "hasIncrementalChanges");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v5, "totalChangeCount");
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v9 = objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfMutationsToFetch");
    v10 = *(void **)(a1 + 40);
    if (v8 <= v9)
    {
      objc_msgSend(v10, "addObject:", v5);
      objc_msgSend(v5, "changeToken");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      goto LABEL_12;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "count") != 0;
    *a3 = 1;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfMutationsToFetch");
      v14 = 134217984;
      v15 = v13;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "GraphLiveUpdate - detected transaction exceeding maximum allowed mutations per transaction (%lu), will signaling incremental changes not available", (uint8_t *)&v14, 0xCu);
    }

    *a3 = 1;
  }
LABEL_13:

}

void __58__PGLibraryChangeListener_consumer_didIgnoreChangeTokens___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "outstandingChangeTokensByConsumer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (id)objc_msgSend(v6, "_consumer:withChangeTokens:processedChangeTokens:consumedTokens:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40), 0);
    WeakRetained = v6;
  }

}

void __59__PGLibraryChangeListener_consumer_didConsumeChangeTokens___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "outstandingChangeTokensByConsumer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (id)objc_msgSend(v6, "_consumer:withChangeTokens:processedChangeTokens:consumedTokens:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40), 1);
    WeakRetained = v6;
  }

}

void __74__PGLibraryChangeListener__notifyConsumersWithChangesFromFromChangeToken___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "mode");
  if (WeakRetained)
  {
    if (v3)
    {
      if (v3 != 2)
      {
        objc_msgSend(WeakRetained, "changeConsumers");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");

        if (v5)
        {
          v6 = objc_alloc_init(MEMORY[0x1E0CD16B0]);
          v7 = v6;
          if (*(_QWORD *)(a1 + 32))
          {
            objc_msgSend(v6, "setToken:");
          }
          else
          {
            objc_msgSend(WeakRetained, "lastReadToken");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setToken:", v8);

          }
          objc_msgSend(v7, "setMaximumChangeThreshold:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfMutationsToFetch"));
          objc_msgSend(WeakRetained, "photoLibrary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(v9, "fetchPersistentChangesWithRequest:error:", v7, &v26);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v26;

          if (v10)
          {
            if ((objc_msgSend(*(id *)(a1 + 40), "_distributeChangesInFetchResult:", v10) & 1) != 0)
            {
LABEL_26:

              goto LABEL_27;
            }
          }
          else
          {
            if (v11 && objc_msgSend(v11, "code") != 3105)
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "loggingConnection");
              v13 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v7, "token");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v29 = v21;
                v30 = 2112;
                v31 = v11;
                _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Failed to fetch persistent changes since token (%@) with error: %@", buf, 0x16u);

              }
            }
            else
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "loggingConnection");
              v13 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v11;
                _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "GraphLiveUpdate - detected that a token is inconsistent with error: %@", buf, 0xCu);
              }
            }

          }
          objc_msgSend(WeakRetained, "stateStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setChangeToken:", 0);

          objc_msgSend(WeakRetained, "setLastReadToken:", 0);
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(WeakRetained, "changeConsumers", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v23;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v23 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "incrementalChangeNotAvailable");
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
            }
            while (v18);
          }

          goto LABEL_26;
        }
      }
    }
  }
LABEL_27:

}

void __52__PGLibraryChangeListener_unregisterChangeConsumer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "changeConsumers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "outstandingChangeTokensByConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "_consumer:withChangeTokens:processedChangeTokens:consumedTokens:", v5, v9, v6, 0);

  objc_msgSend(*(id *)(a1 + 32), "outstandingChangeTokensByConsumer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __50__PGLibraryChangeListener_registerChangeConsumer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeConsumers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __40__PGLibraryChangeListener_stopListening__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "updateHealthRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endRecordingInBackground:", 0);

  objc_msgSend(*(id *)(a1 + 32), "changeConsumers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "_clearConsumerTokenState");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x1E0CD1D68];
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", v5, v6, v7);

  return objc_msgSend(*(id *)(a1 + 32), "setMode:", 0);
}

void __41__PGLibraryChangeListener_startListening__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_photoLibraryDidChange_, *MEMORY[0x1E0CD1D68], v8);

  objc_msgSend(v8, "setPostsPersistentHistoryChangedNotifications:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setMode:", 1);
  objc_msgSend(*(id *)(a1 + 32), "stateStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastReadToken:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "lastReadToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_notifyConsumersWithChangesFromFromChangeToken:", v6);

  objc_msgSend(*(id *)(a1 + 32), "updateHealthRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginRecording");

}

@end

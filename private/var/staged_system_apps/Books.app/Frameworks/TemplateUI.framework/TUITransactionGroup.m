@implementation TUITransactionGroup

- (TUITransactionGroup)initWithFeedId:(id)a3 transactions:(id)a4 options:(id)a5 flags:(unint64_t)a6
{
  id v10;
  id v11;
  TUITransactionGroup *v12;
  TUITransactionGroup *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *computeUpdateQueue;
  TUITransactionOptions *v16;
  TUITransactionOptions *options;
  NSArray *v18;
  NSArray *sortedTransactions;
  uint64_t v20;
  NSHashTable *transactions;
  id v22;
  id v23;
  id v24;
  NSDate *v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  NSDate *date;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];

  v10 = a4;
  v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)TUITransactionGroup;
  v12 = -[TUITransactionGroup init](&v39, "init");
  v13 = v12;
  if (v12)
  {
    v12->_feedId.uniqueIdentifier = a3.var0;
    v14 = dispatch_queue_create("TUITransactionGroup", 0);
    computeUpdateQueue = v13->_computeUpdateQueue;
    v13->_computeUpdateQueue = (OS_dispatch_queue *)v14;

    v34 = v11;
    v16 = (TUITransactionOptions *)objc_msgSend(v11, "copy");
    options = v13->_options;
    v13->_options = v16;

    v18 = (NSArray *)objc_msgSend(v10, "copy");
    sortedTransactions = v13->_sortedTransactions;
    v13->_sortedTransactions = v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    transactions = v13->_transactions;
    v13->_transactions = (NSHashTable *)v20;

    v13->_flags = a6;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          -[NSHashTable addObject:](v13->_transactions, "addObject:", v28);
          if (v25)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "creationDate"));
            v30 = -[NSDate compare:](v25, "compare:", v29);

            if (v30 != (_BYTE *)&dword_0 + 1)
              continue;
          }
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "creationDate"));

          v25 = (NSDate *)v31;
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
    }

    -[TUITransactionGroup addNotifyWhenAppliedDeferral](v13, "addNotifyWhenAppliedDeferral");
    v13->_l_isCompleted = 0;
    v13->_stateLock._os_unfair_lock_opaque = 0;
    date = v13->_date;
    v13->_date = v25;

    v11 = v34;
  }

  return v13;
}

- (void)dealloc
{
  os_unfair_lock_s *p_stateLock;
  _BOOL4 l_isCompleted;
  id v5;
  NSObject *v6;
  objc_super v7;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
  l_isCompleted = self->_l_isCompleted;
  os_unfair_lock_unlock(p_stateLock);
  if (!l_isCompleted)
  {
    v5 = TUITransactionLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_17D270();

    -[TUITransactionGroup removeNotifyWhenAppliedDeferral](self, "removeNotifyWhenAppliedDeferral");
  }
  v7.receiver = self;
  v7.super_class = (Class)TUITransactionGroup;
  -[TUITransactionGroup dealloc](&v7, "dealloc");
}

- (id)description
{
  NSMutableArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  TUITransactionOptions *options;
  unint64_t flags;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_sortedTransactions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("id=%lu"), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8), "identifier")));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v11 = (objc_class *)objc_opt_class(self, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  options = self->_options;
  flags = self->_flags;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p options=%@ flags=%lu, txs=[%@]>"), v13, self, options, flags, v16));

  return v17;
}

- (BOOL)containsTransaction:(id)a3
{
  if (a3)
    return -[NSHashTable containsObject:](self->_transactions, "containsObject:");
  else
    return 0;
}

- (void)appendUpdateBlock:(id)a3
{
  id v4;
  NSMutableArray *updateBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    updateBlocks = self->_updateBlocks;
    v10 = v4;
    if (!updateBlocks)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_updateBlocks;
      self->_updateBlocks = v6;

      updateBlocks = self->_updateBlocks;
    }
    v8 = objc_msgSend(v10, "copy");
    v9 = objc_retainBlock(v8);
    -[NSMutableArray addObject:](updateBlocks, "addObject:", v9);

    v4 = v10;
  }

}

- (void)addHandlerForUpdatesApplied:(id)a3
{
  id v4;
  NSMutableArray *handlersForUpdatesApplied;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    handlersForUpdatesApplied = self->_handlersForUpdatesApplied;
    v10 = v4;
    if (!handlersForUpdatesApplied)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_handlersForUpdatesApplied;
      self->_handlersForUpdatesApplied = v6;

      handlersForUpdatesApplied = self->_handlersForUpdatesApplied;
    }
    v8 = objc_msgSend(v10, "copy");
    v9 = objc_retainBlock(v8);
    -[NSMutableArray addObject:](handlersForUpdatesApplied, "addObject:", v9);

    v4 = v10;
  }

}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *completionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    completionBlocks = self->_completionBlocks;
    v10 = v4;
    if (!completionBlocks)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_completionBlocks;
      self->_completionBlocks = v6;

      completionBlocks = self->_completionBlocks;
    }
    v8 = objc_msgSend(v10, "copy");
    v9 = objc_retainBlock(v8);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v9);

    v4 = v10;
  }

}

- (void)computeUpdatesWithBlock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_computeUpdateQueue, a3);
}

- (void)computeFinalUpdatesWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *computeUpdateQueue;
  NSObject *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(_QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_17D44;
  v12 = sub_17D54;
  v13 = 0;
  computeUpdateQueue = self->_computeUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17D5C;
  v7[3] = &unk_23D988;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(computeUpdateQueue, v7);
  if (v4)
    v4[2](v4);
  v6 = v9[5];
  if (v6)
    dispatch_semaphore_signal(v6);
  _Block_object_dispose(&v8, 8);

}

- (BOOL)cancelSynchronousAndSuspendUpdatesUnlessFinalized
{
  NSObject *computeUpdateQueue;
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
  computeUpdateQueue = self->_computeUpdateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17E54;
  v5[3] = &unk_23D988;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(computeUpdateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resumeSuspendedUpdates
{
  dispatch_resume((dispatch_object_t)self->_computeUpdateQueue);
}

- (void)waitForFinalizing
{
  NSObject *computeUpdateQueue;
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_17D44;
  v9 = sub_17D54;
  v10 = 0;
  computeUpdateQueue = self->_computeUpdateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_17F84;
  v4[3] = &unk_23D988;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(computeUpdateQueue, v4);
  v3 = v6[5];
  if (v3)
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v5, 8);

}

- (void)_invokeHandlersForUpdatesApplied
{
  id v3;
  NSObject *v4;
  unint64_t uniqueIdentifier;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  TUITransactionGroup *v19;

  v3 = TUITransactionLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    v17 = uniqueIdentifier;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[fid:%lu] invokeHandlersForUpdatesApplied for %@", buf, 0x16u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_handlersForUpdatesApplied;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_handlersForUpdatesApplied, "removeAllObjects", (_QWORD)v11);
}

- (void)_invokeCompletions
{
  id v3;
  NSObject *v4;
  unint64_t uniqueIdentifier;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  TUITransactionGroup *v19;

  v3 = TUITransactionLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    v17 = uniqueIdentifier;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[fid:%lu] invokeCompletions for %@", buf, 0x16u);
  }

  os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
  self->_l_isCompleted = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  -[TUITransactionGroup removeNotifyWhenAppliedDeferral](self, "removeNotifyWhenAppliedDeferral");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_completionBlocks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v11);
}

- (void)applyUpdates
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_group_t v11;
  _TUITransactionGroupCompletionToken *v12;
  _QWORD *v13;
  void *v14;
  _TUIAnimationState *v15;
  _TUIAnimationState *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  _TUITransactionGroupCompletionToken *v24;
  _QWORD v25[5];
  _TUITransactionGroupCompletionToken *v26;
  uint8_t buf[16];

  v3 = TUITransactionLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_17D2E0();

  v5 = TUITransactionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_signpost_id_generate(v6);

  v8 = TUITransactionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TUITransaction.applyUpdates", (const char *)&unk_23007A, buf, 2u);
  }

  v11 = dispatch_group_create();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_18590;
  v25[3] = &unk_23D7D0;
  v25[4] = self;
  v12 = -[_TUITransactionGroupCompletionToken initWithGroup:]([_TUITransactionGroupCompletionToken alloc], "initWithGroup:", v11);
  v26 = v12;
  v13 = objc_retainBlock(v25);
  if (-[TUITransactionOptions animate](self->_options, "animate"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUITransactionOptions timingProvider](self->_options, "timingProvider"));
    v15 = [_TUIAnimationState alloc];
    -[TUITransactionOptions duration](self->_options, "duration");
    v16 = -[_TUIAnimationState initWithDuration:timingParameters:](v15, "initWithDuration:timingParameters:", v14);
    +[_TUIAnimationState pushState:](_TUIAnimationState, "pushState:", v16);
    v17 = objc_alloc((Class)UIViewPropertyAnimator);
    -[TUITransactionOptions duration](self->_options, "duration");
    if (v14)
    {
      v18 = objc_msgSend(v17, "initWithDuration:timingParameters:", v14);
      objc_msgSend(v18, "addAnimations:", v13);
    }
    else
    {
      v18 = objc_msgSend(v17, "initWithDuration:curve:animations:", 0, v13);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_186A0;
    v23[3] = &unk_23D9B0;
    v24 = v12;
    objc_msgSend(v18, "addCompletion:", v23);
    objc_msgSend(v18, "startAnimation");
    +[_TUIAnimationState popState](_TUIAnimationState, "popState");

  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
  }
  v19 = TUITransactionLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v21, OS_SIGNPOST_INTERVAL_END, v7, "TUITransaction.applyUpdates", (const char *)&unk_23007A, buf, 2u);
  }

  -[TUITransactionGroup _invokeHandlersForUpdatesApplied](self, "_invokeHandlersForUpdatesApplied");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_186A8;
  v22[3] = &unk_23D9D8;
  v22[4] = self;
  v22[5] = v7;
  TUIDispatchGroupNotifyViaRunloopIfMain(v11, &_dispatch_main_q, v22);

}

- (void)applyNonVisualUpdates
{
  id v3;
  NSObject *v4;
  dispatch_group_t v5;
  _TUITransactionGroupCompletionToken *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = TUITransactionLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_17D3AC();

  v5 = dispatch_group_create();
  v6 = -[_TUITransactionGroupCompletionToken initWithGroup:]([_TUITransactionGroupCompletionToken alloc], "initWithGroup:", v5);
  v7 = -[NSMutableArray copy](self->_updateBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_updateBlocks, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12) + 16))();
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[TUITransactionGroup _invokeHandlersForUpdatesApplied](self, "_invokeHandlersForUpdatesApplied");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_18918;
  v13[3] = &unk_23D938;
  v13[4] = self;
  TUIDispatchGroupNotifyViaRunloopIfMain(v5, &_dispatch_main_q, v13);

}

- (void)addNotifyWhenAppliedDeferral
{
  NSHashTable *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_transactions;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "addNotifyWhenAppliedDeferral", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)removeNotifyWhenAppliedDeferral
{
  NSHashTable *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_transactions;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "removeNotifyWhenAppliedDeferral", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSDate)date
{
  return self->_date;
}

- (TUITransactionOptions)options
{
  return self->_options;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)sortedTransactions
{
  return self->_sortedTransactions;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (NSMutableArray)updateBlocks
{
  return self->_updateBlocks;
}

- (NSMutableArray)handlersForUpdatesApplied
{
  return self->_handlersForUpdatesApplied;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSHashTable)transactions
{
  return self->_transactions;
}

- (OS_dispatch_queue)computeUpdateQueue
{
  return self->_computeUpdateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_handlersForUpdatesApplied, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_sortedTransactions, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_finalizingSem, 0);
}

@end

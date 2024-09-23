@implementation TUITransactionCoordinator

- (TUITransactionCoordinator)initWithFeedId:(id)a3 layoutQueueContext:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  TUITransactionCoordinator *v11;
  TUITransactionCoordinator *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  uint64_t v17;
  NSMapTable *transactionInstances;
  uint64_t v19;
  NSHashTable *pendingTransactions;
  NSMutableArray *v21;
  NSMutableArray *queuedTransactions;
  void *v23;
  objc_super v25;

  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUITransactionCoordinator;
  v11 = -[TUITransactionCoordinator init](&v25, "init");
  v12 = v11;
  if (v11)
  {
    v11->_feedId.uniqueIdentifier = a3.var0;
    objc_storeWeak((id *)&v11->_delegate, v10);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("TUITransactionCoordinator.accessQueue", v14);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_queueContext, a4);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    transactionInstances = v12->_transactionInstances;
    v12->_transactionInstances = (NSMapTable *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    pendingTransactions = v12->_pendingTransactions;
    v12->_pendingTransactions = (NSHashTable *)v19;

    v21 = objc_opt_new(NSMutableArray);
    queuedTransactions = v12->_queuedTransactions;
    v12->_queuedTransactions = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12->_catchUncommittedTransactions = objc_msgSend(v23, "BOOLForKey:", CFSTR("TUICatchUncommitTransactions"));

  }
  return v12;
}

- (id)_aq_instanceForTransaction:(id)a3
{
  id v4;
  _TUITransactionInstance *v5;
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = (_TUITransactionInstance *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_transactionInstances, "objectForKey:", v4));
  if (!v5)
  {
    v5 = -[_TUITransactionInstance initWithTransaction:]([_TUITransactionInstance alloc], "initWithTransaction:", v4);
    -[NSMapTable setObject:forKey:](self->_transactionInstances, "setObject:forKey:", v5, v4);
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_4262C;
    v14[3] = &unk_23DA20;
    objc_copyWeak(&v16, &location);
    v6 = v4;
    v15 = v6;
    if ((objc_msgSend(v6, "isCommittedAndIfNotNotifyWithBlock:", v14) & 1) == 0
      && self->_catchUncommittedTransactions
      && _TUIDeviceHasInternalInstall())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v8 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_42668;
      block[3] = &unk_23D7D0;
      v12 = v6;
      v13 = v7;
      v9 = v7;
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_addTransactionAndProcess:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4284C;
  block[3] = &unk_23E848;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_428A0;
    v8[3] = &unk_23D938;
    v8[4] = self;
    dispatch_async(v7, v8);

  }
  _Block_object_dispose(&v12, 8);

}

- (id)_instanceForTransaction:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
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
  v15 = sub_4297C;
  v16 = sub_4298C;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_42994;
  block[3] = &unk_23E848;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_removeInstanceForTransaction:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_42A4C;
  block[3] = &unk_23D7D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)scheduleSyncTransaction:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t uniqueIdentifier;
  NSObject *v11;
  dispatch_block_t v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tx"));
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") | 1);
  -[TUIWorkQueueContext setSynchronousTransactionInProgress:](self->_queueContext, "setSynchronousTransactionInProgress:", 1);
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_42C2C;
    block[3] = &unk_23E2C8;
    block[4] = self;
    v15 = v5;
    v7 = v4;
    v16 = v7;
    dispatch_sync(accessQueue, block);
    v8 = TUITransactionLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v18 = uniqueIdentifier;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from scheduleSyncTransaction for %@", buf, 0x16u);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext syncWorkQueue](self->_queueContext, "syncWorkQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_42E38;
    v13[3] = &unk_23D938;
    v13[4] = self;
    v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v13);
    dispatch_async(v11, v12);

  }
}

- (void)waitForSyncTransaction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_block_t v9;
  TUIWorkQueueContext *queueContext;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tx"));
  v8 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext syncWorkQueue](self->_queueContext, "syncWorkQueue"));
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &stru_23E940);
  dispatch_async(v8, v9);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_42F44;
  v13[3] = &unk_23D960;
  v14 = v6;
  queueContext = self->_queueContext;
  v11 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeCallbackQueue](queueContext, "activeCallbackQueue"));
  objc_msgSend(v7, "addSubTransactionCompletion:queue:", v13, v12);

}

- (BOOL)finalizeSyncTransaction:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  unint64_t uniqueIdentifier;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  double v16;
  TUITransactionGroup *v17;
  id WeakRetained;
  NSObject *v19;
  TUITransactionGroup *v20;
  id v21;
  NSObject *v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  TUITransactionGroup *v37;
  uint64_t *v38;
  _QWORD block[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tx"));
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_4297C;
  v46 = sub_4298C;
  v47 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_433E4;
  block[3] = &unk_23D7A8;
  block[4] = self;
  v7 = v5;
  v40 = v7;
  v41 = &v42;
  dispatch_sync(accessQueue, block);
  v8 = objc_msgSend((id)v43[5], "cancelSynchronousAndSuspendUpdatesUnlessFinalized");
  if (v8)
  {
    v9 = TUITransactionLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v49 = uniqueIdentifier;
      v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "[fid:%lu] sync transaction cancelled %{public}@", buf, 0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "options"));
    v13 = objc_msgSend(v12, "flags");

    if ((v13 & 2) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "options"));
      v15 = objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "duration");
      objc_msgSend(v15, "setDuration:", fmin(v16, 0.1));
      v17 = -[TUITransactionGroup initWithFeedId:transactions:options:flags:]([TUITransactionGroup alloc], "initWithFeedId:transactions:options:flags:", self->_feedId.uniqueIdentifier, 0, v15, 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "transactionCoordinator:timeoutForSynchronousTransactionGroup:", self, v17);

      v19 = self->_accessQueue;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_434E4;
      v36[3] = &unk_23E968;
      v37 = v17;
      v38 = &v42;
      v36[4] = self;
      v20 = v17;
      dispatch_sync(v19, v36);

    }
    objc_msgSend((id)v43[5], "resumeSuspendedUpdates");
  }
  else if (v43[5])
  {
    v21 = TUITransactionLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = self->_feedId.uniqueIdentifier;
      v24 = v43[5];
      *(_DWORD *)buf = 134218498;
      v49 = v23;
      v50 = 2114;
      v51 = v7;
      v52 = 2114;
      v53 = v24;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "[fid:%lu] waiting for sync transaction group (for tx = %{public}@) to finilize: %{public}@", buf, 0x20u);
    }

    objc_msgSend((id)v43[5], "waitForFinalizing");
  }
  else
  {
    v25 = TUITransactionLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v49 = v27;
      v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "[fid:%lu] sync transaction group (for tx = %{public}@) already cleared (and queued)", buf, 0x16u);
    }

  }
  -[TUITransactionCoordinator _applyQueuedTransactionGroupsCheckForSync:](self, "_applyQueuedTransactionGroupsCheckForSync:", 1);
  v28 = self->_accessQueue;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_4353C;
  v35[3] = &unk_23D938;
  v35[4] = self;
  dispatch_sync(v28, v35);
  v29 = TUITransactionLog();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    v49 = v31;
    v50 = 2112;
    v51 = v4;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from finalizeSyncTransaction for %@", buf, 0x16u);
  }

  v32 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_4356C;
  v34[3] = &unk_23D938;
  v34[4] = self;
  dispatch_async(v32, v34);

  _Block_object_dispose(&v42, 8);
  return v8 ^ 1;
}

- (void)scheduleLayoutUpdateWithTransaction:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  unint64_t uniqueIdentifier;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tx"));
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_43780;
  block[3] = &unk_23E990;
  block[4] = self;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v21 = v11;
  v22 = &v23;
  v12 = v6;
  v20 = v12;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v24 + 24))
  {
    v13 = TUITransactionLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v28 = uniqueIdentifier;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from scheduleLayoutUpdateWithTransaction for %@", buf, 0x16u);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_438F8;
    v17[3] = &unk_23D938;
    v17[4] = self;
    dispatch_async(v16, v17);

  }
  _Block_object_dispose(&v23, 8);

}

- (id)lq_nextTransactionGroup
{
  NSObject *v2;
  NSObject *accessQueue;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *m;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableArray *v54;
  id v55;
  uint64_t v56;
  void *n;
  TUITransactionGroup *v58;
  id v59;
  NSMutableArray *v60;
  id v61;
  NSObject *v62;
  _BOOL4 v63;
  id v64;
  id v65;
  uint64_t v66;
  void *ii;
  void *v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  TUITransactionGroup *v72;
  NSMutableArray *v73;
  TUITransactionGroup *v74;
  TUITransactionGroup *v75;
  unint64_t uniqueIdentifier;
  uint64_t v78;
  void *v79;
  void *v80;
  id v82;
  id obj;
  id obja;
  uint64_t v85;
  NSMutableArray *v86;
  id v87;
  NSMutableArray *v88;
  void *i;
  void *v90;
  void *v91;
  void *v92;
  _QWORD v93[4];
  NSMutableArray *v94;
  TUITransactionCoordinator *v95;
  TUITransactionGroup *v96;
  _BOOL8 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[4];
  NSObject *v123;
  _QWORD block[8];
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  char v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint8_t buf[4];
  unint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];

  v2 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  dispatch_assert_queue_V2(v2);

  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = sub_4297C;
  v139 = sub_4298C;
  v140 = 0;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = sub_4297C;
  v133 = sub_4298C;
  v134 = 0;
  v125 = 0;
  v126 = &v125;
  v127 = 0x2020000000;
  v128 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_445E4;
  block[3] = &unk_23E9B8;
  block[5] = &v135;
  block[4] = self;
  block[6] = &v129;
  block[7] = &v125;
  dispatch_sync(accessQueue, block);
  if (v130[5])
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)v130[5];
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_44718;
    v122[3] = &unk_23D938;
    v6 = v4;
    v123 = v6;
    if ((objc_msgSend(v5, "isCommittedAndIfNotNotifyWithBlock:", v122) & 1) == 0)
    {
      v7 = TUITransactionLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = os_signpost_id_generate(v8);

      v10 = TUITransactionLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "WaitForSyncTransactionToCommit", (const char *)&unk_23007A, buf, 2u);
      }

      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      v13 = TUITransactionLog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v9, "WaitForSyncTransactionToCommit", (const char *)&unk_23007A, buf, 2u);
      }

    }
    v16 = TUITransactionLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_17D614();

  }
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
  v18 = objc_msgSend((id)v136[5], "copy");
  v82 = objc_msgSend((id)v136[5], "copy");
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = (id)v136[5];
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v152, 16);
  if (v87)
  {
    v85 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(_QWORD *)v119 != v85)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "predecessors"));
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v114, v151, 16);
        if (v21)
        {
          v22 = 0;
          v23 = *(_QWORD *)v115;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(_QWORD *)v115 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v18, "containsObject:", v25))
              {
                if (!v22)
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
                objc_msgSend(v22, "addObject:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKey:", v25));
                if (!v26)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
                  objc_msgSend(v92, "setObject:forKey:", v26, v25);
                }
                objc_msgSend(v26, "addObject:", v19);

              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v114, v151, 16);
          }
          while (v21);

          if (v22)
          {
            objc_msgSend(v82, "removeObject:", v19);
            objc_msgSend(v91, "setObject:forKey:", v22, v19);
          }
        }
        else
        {

          v22 = 0;
        }

      }
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v152, 16);
    }
    while (v87);
  }

  v86 = objc_opt_new(NSMutableArray);
  v27 = v130;
  if (*((_BYTE *)v126 + 24) && v130[5])
  {
    -[TUITransactionCoordinator _appendTransactions:forPredecessorsFromMap:forTransaction:](self, "_appendTransactions:forPredecessorsFromMap:forTransaction:", v86, v91);
    obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v130[5], "options"));
    v27 = v130;
  }
  else
  {
    obja = 0;
  }
  if (v27[5])
  {
    v28 = 1;
    goto LABEL_89;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "allObjects"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sortedArrayUsingSelector:", "compareIdentifier:"));

  if (*((_BYTE *)v126 + 24))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "indexesOfObjectsPassingTest:", &stru_23E9F8));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectsAtIndexes:", v31));

    v33 = (void *)v32;
  }
  else
  {
    v33 = v30;
  }
  v80 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));
  v88 = objc_opt_new(NSMutableArray);
  if (v34)
  {
    -[NSMutableArray addObject:](v88, "addObject:", v34);
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "options"));

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v35 = v80;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v110, v150, 16);
    if (!v36)
      goto LABEL_59;
    v37 = *(_QWORD *)v111;
    while (1)
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(_QWORD *)v111 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)k);
        if (v39 != v34)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)k), "options"));
          if (v90 == v40)
          {

LABEL_56:
            -[NSMutableArray addObject:](v88, "addObject:", v39);
            continue;
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "options"));
          v42 = objc_msgSend(v90, "isCompatibleWithOptions:", v41);

          if (v42)
            goto LABEL_56;
        }
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v110, v150, 16);
      if (!v36)
      {
LABEL_59:

        goto LABEL_73;
      }
    }
  }
  v90 = obja;
LABEL_73:
  while (1)
  {
    v52 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v88, "firstObject"));

    if (!v52)
      break;
    -[NSMutableArray addObject:](v86, "addObject:", v52);
    -[NSMutableArray removeObjectAtIndex:](v88, "removeObjectAtIndex:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKey:", v52));
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v149, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v107;
      do
      {
        for (m = 0; m != v45; m = (char *)m + 1)
        {
          if (*(_QWORD *)v107 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)m);
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKey:", v48));
          if (objc_msgSend(v49, "containsObject:", v52))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "options"));
            v51 = objc_msgSend(v90, "isCompatibleWithOptions:", v50);

            if (v51)
            {
              objc_msgSend(v49, "removeObject:", v52);
              if (!objc_msgSend(v49, "count"))
                -[NSMutableArray addObject:](v88, "addObject:", v48);
            }
          }

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v149, 16);
      }
      while (v45);
    }

    v34 = (void *)v52;
  }

  v53 = v130[5];
  v28 = v53 != 0;
  if (v53)
  {
    v28 = 1;
  }
  else
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v54 = v86;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v102, v148, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v103;
      while (2)
      {
        for (n = 0; n != v55; n = (char *)n + 1)
        {
          if (*(_QWORD *)v103 != v56)
            objc_enumerationMutation(v54);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)n), "flags") & 1) != 0)
          {
            v28 = 1;
            goto LABEL_87;
          }
        }
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v102, v148, 16);
        if (v55)
          continue;
        break;
      }
    }
    else
    {
      v28 = 0;
    }
LABEL_87:

  }
  obja = v90;
LABEL_89:
  if (-[NSMutableArray count](v86, "count")
    && (v58 = -[TUITransactionGroup initWithFeedId:transactions:options:flags:]([TUITransactionGroup alloc], "initWithFeedId:transactions:options:flags:", self->_feedId.uniqueIdentifier, v86, obja, v28)) != 0)
  {
    v59 = TUITransactionLog();
    v60 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(&v60->super.super, OS_LOG_TYPE_DEBUG))
      sub_17D5A8();
  }
  else
  {
    v61 = TUITransactionLog();
    v62 = objc_claimAutoreleasedReturnValue(v61);
    v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);

    if (!v63)
    {
      v58 = 0;
      goto LABEL_106;
    }
    v60 = objc_opt_new(NSMutableArray);
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v64 = (id)v136[5];
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v98, v147, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v99;
      do
      {
        for (ii = 0; ii != v65; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v99 != v66)
            objc_enumerationMutation(v64);
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("id=%lu"), objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)ii), "identifier")));
          -[NSMutableArray addObject:](v60, "addObject:", v68);

        }
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v98, v147, 16);
      }
      while (v65);
    }

    v69 = TUITransactionLog();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      v78 = v130[5];
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v60, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 134218498;
      v142 = uniqueIdentifier;
      v143 = 2114;
      v144 = v78;
      v145 = 2114;
      v146 = v79;
      _os_log_debug_impl(&dword_0, v70, OS_LOG_TYPE_DEBUG, "[fid:%lu] couldn't establish next transaction group; syncTx = %{public}@, pendingTransaction = [%{public}@]",
        buf,
        0x20u);

    }
    v58 = 0;
  }

LABEL_106:
  v71 = self->_accessQueue;
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_44744;
  v93[3] = &unk_23EA20;
  v94 = v86;
  v95 = self;
  v97 = v28;
  v72 = v58;
  v96 = v72;
  v73 = v86;
  dispatch_sync(v71, v93);
  v74 = v96;
  v75 = v72;

  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v129, 8);

  _Block_object_dispose(&v135, 8);
  return v75;
}

- (void)_appendTransactions:(id)a3 forPredecessorsFromMap:(id)a4 forTransaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10, 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[TUITransactionCoordinator _appendTransactions:forPredecessorsFromMap:forTransaction:](self, "_appendTransactions:forPredecessorsFromMap:forTransaction:", v8, v9, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "addObject:", v10);
}

- (void)_lq_processPendingTransactions
{
  NSObject *v3;
  NSNumber *performanceIdentifier;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;
  id WeakRetained;
  char v9;
  id v10;
  NSNumber *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  dispatch_assert_queue_V2(v3);

  while (-[NSHashTable count](self->_pendingTransactions, "count"))
  {
    performanceIdentifier = self->_performanceIdentifier;
    if (performanceIdentifier)
      kdebug_trace(725408448, -[NSNumber unsignedIntegerValue](performanceIdentifier, "unsignedIntegerValue"), 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUITransactionCoordinator lq_nextTransactionGroup](self, "lq_nextTransactionGroup"));
    v6 = self->_performanceIdentifier;
    if (v6)
      kdebug_trace(725408452, -[NSNumber unsignedIntegerValue](v6, "unsignedIntegerValue"), 0, 0, 0);
    if (!v5)
      break;
    v7 = self->_performanceIdentifier;
    if (v7)
      kdebug_trace(725408456, -[NSNumber unsignedIntegerValue](v7, "unsignedIntegerValue"), 0, 0, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector(WeakRetained, "transactionCoordinator:performUpdateForTransactionGroup:");

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "transactionCoordinator:performUpdateForTransactionGroup:", self, v5);

    }
    else
    {
      -[TUITransactionCoordinator performUpdateForTransactionGroup:](self, "performUpdateForTransactionGroup:", v5);
    }
    v11 = self->_performanceIdentifier;
    if (v11)
      kdebug_trace(725408460, -[NSNumber unsignedIntegerValue](v11, "unsignedIntegerValue"), 0, 0, 0);

  }
}

- (void)performUpdateForTransactionGroup:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableSet *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *i;
  NSMutableArray *v14;
  _QWORD *v15;
  id v16;
  NSObject *accessQueue;
  id v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _QWORD block[4];
  id v32;
  TUITransactionCoordinator *v33;
  _QWORD v34[4];
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableSet);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transactionCoordinator:willBeginUpdateWithTransactionGroup:", self, v4);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedTransactions"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v11 |= -[TUITransactionCoordinator _lq_applyTransaction:group:transactions:categories:](self, "_lq_applyTransaction:group:transactions:categories:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), v4, v5, v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  objc_msgSend(v4, "setCategories:", v6);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_44E5C;
  v34[3] = &unk_23D938;
  v14 = v5;
  v35 = v14;
  v15 = objc_retainBlock(v34);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v4, "addCompletion:", v15);
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "transactionCoordinator:updateWithTransactionGroup:", self, v4);

    -[TUITransactionCoordinator _queueTransactionGroup:](self, "_queueTransactionGroup:", v4);
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_44F44;
    block[3] = &unk_23D7D0;
    v18 = v4;
    v32 = v18;
    v33 = self;
    dispatch_sync(accessQueue, block);
    objc_msgSend(v18, "computeFinalUpdatesWithBlock:", &stru_23EA40);
    objc_msgSend(v18, "addCompletion:", v15);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_44F64;
    v29[3] = &unk_23D938;
    v30 = v18;
    TUIDispatchAsyncViaRunLoop((uint64_t)v29);

  }
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v19, "transactionCoordinator:didEndUpdateWithTransactionGroup:", self, v4);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v14;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "removeSubTransactionCompletionDeferral", (_QWORD)v25);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
    }
    while (v22);
  }

}

- (void)_queueTransactionGroup:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  unint64_t uniqueIdentifier;
  unsigned __int8 v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v15[5];
  char v16;
  _QWORD block[5];
  id v18;
  _BYTE *v19;
  uint8_t v20[4];
  unint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE buf[24];
  char v25;

  v4 = a3;
  v5 = TUITransactionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = uniqueIdentifier;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[fid:%lu] enqueue group %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v25 = 0;
  v8 = objc_msgSend(v4, "flags");
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_451B4;
  block[3] = &unk_23E968;
  block[4] = self;
  v19 = buf;
  v10 = v4;
  v18 = v10;
  dispatch_sync(accessQueue, block);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v11 = TUITransactionLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v8 & 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = self->_feedId.uniqueIdentifier;
      *(_DWORD *)v20 = 134218240;
      v21 = v14;
      v22 = 2048;
      v23 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "[fid:%lu] scheduling applyQueueTransactions checkSync:%lu", v20, 0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_4522C;
    v15[3] = &unk_23EA68;
    v15[4] = self;
    v16 = v13;
    TUIDispatchAsyncViaRunLoop((uint64_t)v15);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_applyQueuedTransactionGroups
{
  -[TUITransactionCoordinator _applyQueuedTransactionGroupsCheckForSync:](self, "_applyQueuedTransactionGroupsCheckForSync:", 0);
}

- (void)_applyQueuedTransactionGroupsCheckForSync:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  NSObject *accessQueue;
  id v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  NSObject *v18;
  unint64_t uniqueIdentifier;
  unint64_t pauseUpdateCount;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[6];
  BOOL v26;
  uint8_t v27[128];
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  _BYTE v32[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  NSMutableArray *v35;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_pauseUpdateCount)
    v5 = !v3;
  else
    v5 = 0;
  if (v5)
  {
    v17 = TUITransactionLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      pauseUpdateCount = self->_pauseUpdateCount;
      *(_DWORD *)v32 = 134218240;
      *(_QWORD *)&v32[4] = uniqueIdentifier;
      *(_WORD *)&v32[12] = 2048;
      *(_QWORD *)&v32[14] = pauseUpdateCount;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "[fid:%lu] deferring dequeue (paused = %lu)", v32, 0x16u);
    }

  }
  else
  {
    *(_QWORD *)v32 = 0;
    *(_QWORD *)&v32[8] = v32;
    *(_QWORD *)&v32[16] = 0x3032000000;
    v33 = sub_4297C;
    v34 = sub_4298C;
    v35 = objc_opt_new(NSMutableArray);
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4553C;
    block[3] = &unk_23EAD0;
    v26 = v3;
    block[4] = self;
    block[5] = v32;
    dispatch_sync(accessQueue, block);
    if (!objc_msgSend(*(id *)(*(_QWORD *)&v32[8] + 40), "count"))
    {
      v7 = TUITransactionLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = self->_feedId.uniqueIdentifier;
        v10 = self->_pauseUpdateCount;
        *(_DWORD *)buf = 134218240;
        v29 = v9;
        v30 = 2048;
        v31 = v10;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[fid:%lu] nothing to dequeue (paused = %lu)", buf, 0x16u);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector(WeakRetained, "transactionCoordinator:applyUpdatesFromTransactionGroup:");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = *(id *)(*(_QWORD *)&v32[8] + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          if ((v12 & 1) != 0)
            objc_msgSend(WeakRetained, "transactionCoordinator:applyUpdatesFromTransactionGroup:", self, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
          else
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "applyUpdates", (_QWORD)v21);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v14);
    }

    _Block_object_dispose(v32, 8);
  }
}

- (BOOL)_lq_applyTransaction:(id)a3 group:(id)a4 transactions:(id)a5 categories:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *accessQueue;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCategories"));
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  objc_msgSend(v10, "addCompletionDeferral");
  objc_msgSend(v12, "addObject:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUITransactionCoordinator _instanceForTransaction:](self, "_instanceForTransaction:", v10));
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_4297C;
  v38 = sub_4298C;
  v39 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_459DC;
  block[3] = &unk_23EAF8;
  v33 = &v34;
  v17 = v15;
  v32 = v17;
  dispatch_sync(accessQueue, block);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = (id)v35[5];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  v26 = v17;
  v20 = v13;
  v21 = v12;
  v22 = 0;
  if (v19)
  {
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v18);
        v22 |= (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v24) + 16))();
        v24 = (char *)v24 + 1;
      }
      while (v19 != v24);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v19);
  }

  -[TUITransactionCoordinator _removeInstanceForTransaction:](self, "_removeInstanceForTransaction:", v10);
  _Block_object_dispose(&v34, 8);

  return v22 & 1;
}

- (void)pauseUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  ++self->_pauseUpdateCount;
}

- (void)resumeUpdates
{
  unint64_t pauseUpdateCount;
  unint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pauseUpdateCount = self->_pauseUpdateCount;
  if (pauseUpdateCount)
  {
    v4 = pauseUpdateCount - 1;
    self->_pauseUpdateCount = v4;
    if (!v4)
      -[TUITransactionCoordinator _applyQueuedTransactionGroups](self, "_applyQueuedTransactionGroups");
  }
}

- (void)updatePerformanceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_45B2C;
  v7[3] = &unk_23D7D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (TUITransactionCoordinatorDelegate)delegate
{
  return (TUITransactionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (BOOL)manuallyScheduleUpdates
{
  return self->_manuallyScheduleUpdates;
}

- (void)setManuallyScheduleUpdates:(BOOL)a3
{
  self->_manuallyScheduleUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_performanceIdentifier, 0);
  objc_storeStrong((id *)&self->_syncTransactionGroup, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_queuedTransactions, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_transactionInstances, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
}

@end

@implementation ICBatchFetchHelper

- (ICBatchFetchHelper)initWithQueue:(id)a3 managedObjectContext:(id)a4 batchSize:(unint64_t)a5 cacheCountLimit:(unint64_t)a6
{
  id v11;
  id v12;
  ICBatchFetchHelper *v13;
  ICBatchFetchHelper *v14;
  NSMutableSet *v15;
  NSMutableSet *ckIdentifierAccountPairs;
  NSMutableArray *v17;
  NSMutableArray *dispatchBlocks;
  NSCache *v19;
  NSCache *missingCKIdentifierAccountPairCache;
  NSCache *v21;
  NSCache *managedObjectIDCache;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ICBatchFetchHelper;
  v13 = -[ICBatchFetchHelper init](&v24, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeWeak((id *)&v14->_managedObjectContext, v12);
    v14->_batchSize = a5;
    v15 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", a5);
    ckIdentifierAccountPairs = v14->_ckIdentifierAccountPairs;
    v14->_ckIdentifierAccountPairs = v15;

    v17 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a5);
    dispatchBlocks = v14->_dispatchBlocks;
    v14->_dispatchBlocks = v17;

    v19 = (NSCache *)objc_alloc_init((Class)NSCache);
    missingCKIdentifierAccountPairCache = v14->_missingCKIdentifierAccountPairCache;
    v14->_missingCKIdentifierAccountPairCache = v19;

    -[NSCache setCountLimit:](v14->_missingCKIdentifierAccountPairCache, "setCountLimit:", a6);
    v21 = (NSCache *)objc_alloc_init((Class)NSCache);
    managedObjectIDCache = v14->_managedObjectIDCache;
    v14->_managedObjectIDCache = v21;

    -[NSCache setCountLimit:](v14->_managedObjectIDCache, "setCountLimit:", a6);
    atomic_store(a5, (unsigned int *)&remainingDispatchQueueCapacity);
  }

  return v14;
}

- (BOOL)_canObtainPermanentIDForObject:(id)a3 context:(id)a4 ckIdentifierAccountIdentifierPair:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void **v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100094320;
  v31[4] = sub_100094330;
  v32 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
    v12 = objc_msgSend(v11, "isTemporaryID");

    if (v12)
    {
      if (v8)
      {
        v23 = _NSConcreteStackBlock;
        v24 = 3221225472;
        v25 = sub_100094338;
        v26 = &unk_1007DA850;
        v29 = &v33;
        v27 = v8;
        v28 = v7;
        v30 = v31;
        objc_msgSend(v27, "performBlockAndWait:", &v23);
        if (!*((_BYTE *)v34 + 24))
        {
          v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v23, v24, v25, v26, v27));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            sub_100684CF8();

        }
      }
      else
      {
        v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          sub_100684C94((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

      }
    }
    else
    {
      *((_BYTE *)v34 + 24) = 1;
    }
  }
  v21 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (void)_flush
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *k;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *m;
  unsigned int v47;
  unsigned int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  ICBatchFetchHelper *v59;
  __int128 *p_buf;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  __int128 buf;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];

  v3 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (!v8)
      goto LABEL_17;
    v9 = *(_QWORD *)v66;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper missingCKIdentifierAccountPairCache](self, "missingCKIdentifierAccountPairCache"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));

        if (v13)
        {
          objc_msgSend(v6, "addObject:", v11);
          v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v11;
            v15 = v14;
            v16 = "ICBatchFetchHelper does not need to fetch %{public}@ as it is in missingCKIdentifierCache";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectIDCache](self, "managedObjectIDCache"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v11));

          if (!v18)
            continue;
          objc_msgSend(v6, "addObject:", v11);
          v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v11;
            v15 = v14;
            v16 = "ICBatchFetchHelper does not need to fetch %{public}@ as it is already in managedObjectIDCache";
            goto LABEL_13;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (!v8)
      {
LABEL_17:

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
        objc_msgSend(v19, "minusSet:", v6);

        break;
      }
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
  v21 = objc_msgSend(v20, "count") == 0;

  if (!v21)
  {
    v22 = objc_alloc_init((Class)NSMutableSet);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j), "ckIdentifier"));
          objc_msgSend(v22, "addObject:", v27);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
      }
      while (v24);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ckIdentifier IN %@"), v22));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectContext](self, "managedObjectContext"));

    if (v29)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v72 = 0x3032000000;
      v73 = sub_100094320;
      v74 = sub_100094330;
      v75 = 0;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectContext](self, "managedObjectContext"));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100094A5C;
      v57[3] = &unk_1007D7FB0;
      v58 = v28;
      v59 = self;
      p_buf = &buf;
      objc_msgSend(v30, "performBlockAndWait:", v57);

      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
        objc_msgSend(v31, "minusSet:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

      }
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_100684D70(v32);

    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(_QWORD *)v54 != v35)
            objc_enumerationMutation(v33);
          v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)k);
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper missingCKIdentifierAccountPairCache](self, "missingCKIdentifierAccountPairCache"));
          objc_msgSend(v38, "setObject:forKey:", v37, v37);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
      }
      while (v34);
    }

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper dispatchBlocks](self, "dispatchBlocks"));
  v40 = objc_msgSend(v39, "copy");

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper ckIdentifierAccountPairs](self, "ckIdentifierAccountPairs"));
  objc_msgSend(v41, "removeAllObjects");

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper dispatchBlocks](self, "dispatchBlocks"));
  objc_msgSend(v42, "removeAllObjects");

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v43 = v40;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v44; m = (char *)m + 1)
      {
        if (*(_QWORD *)v50 != v45)
          objc_enumerationMutation(v43);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)m) + 16))();
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v44);
  }

  v47 = objc_msgSend(v43, "count");
  do
    v48 = __ldaxr((unsigned int *)&remainingDispatchQueueCapacity);
  while (__stlxr(v48 + v47, (unsigned int *)&remainingDispatchQueueCapacity));

}

- (void)_dispatchBlockApplyingBackPressureIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  signed int v7;
  double Current;
  NSObject *v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  ICBatchFetchHelper *v14;
  __int16 v15;
  double v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_not_V2(v5);

  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  do
  {
    v6 = __ldaxr((unsigned int *)&remainingDispatchQueueCapacity);
    v7 = v6 - 1;
  }
  while (__stlxr(v7, (unsigned int *)&remainingDispatchQueueCapacity));
  if (v7 <= 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
    dispatch_sync(v9, v4);

    v10 = CFAbsoluteTimeGetCurrent();
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2048;
      v16 = v10 - Current;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ perform dispatch block sync took %f s", buf, 0x16u);
    }

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
    dispatch_async(v12, v4);

  }
}

- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 dispatchBlock:(id)a5
{
  -[ICBatchFetchHelper addCKIdentifiers:accountIdentifier:onCurrentQueue:dispatchBlock:](self, "addCKIdentifiers:accountIdentifier:onCurrentQueue:dispatchBlock:", a3, a4, 0, a5);
}

- (void)addCKIdentifiers:(id)a3 accountIdentifier:(id)a4 onCurrentQueue:(BOOL)a5 dispatchBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void ***v13;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  ICBatchFetchHelper *v21;
  id v22;

  v7 = a5;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100095194;
  v18 = &unk_1007D8C08;
  v19 = a3;
  v20 = a4;
  v21 = self;
  v22 = a6;
  v10 = v22;
  v11 = v20;
  v12 = v19;
  v13 = objc_retainBlock(&v15);
  if (v7)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue", v15, v16, v17, v18, v19, v20, v21, v22));
    dispatch_assert_queue_V2(v14);

    dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
    ((void (*)(void ***))v13[2])(v13);
  }
  else
  {
    -[ICBatchFetchHelper _dispatchBlockApplyingBackPressureIfNeeded:](self, "_dispatchBlockApplyingBackPressureIfNeeded:", v13, v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)addDispatchBlock:(id)a3
{
  id v3;
  _QWORD v4[4];
  ICBatchFetchHelper *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000953A8;
  v4[3] = &unk_1007D8140;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[ICBatchFetchHelper _dispatchBlockApplyingBackPressureIfNeeded:](v5, "_dispatchBlockApplyingBackPressureIfNeeded:", v4);

}

- (void)flush
{
  -[ICBatchFetchHelper flushOnCurrentQueue:](self, "flushOnCurrentQueue:", 0);
}

- (void)flushOnCurrentQueue:(BOOL)a3
{
  _BOOL4 v3;
  double Current;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  ICBatchFetchHelper *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  double v17;

  v3 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  Current = CFAbsoluteTimeGetCurrent();
  v6 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  v7 = v6;
  if (v3)
  {
    dispatch_assert_queue_V2(v6);

    -[ICBatchFetchHelper _flush](self, "_flush");
  }
  else
  {
    dispatch_assert_queue_not_V2(v6);

    v8 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000955B8;
    block[3] = &unk_1007D7A60;
    block[4] = self;
    dispatch_sync(v8, block);

  }
  v9 = CFAbsoluteTimeGetCurrent();
  v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 1024;
    v15 = v3;
    v16 = 2048;
    v17 = v9 - Current;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ flush (onCurrentQueue = %d) took %f s", buf, 0x1Cu);
  }

}

- (BOOL)isMissingCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _REMCKIdentifierAccountIdentifierPair *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = -[_REMCKIdentifierAccountIdentifierPair initWithCkIdentifier:accountIdentifier:]([_REMCKIdentifierAccountIdentifierPair alloc], "initWithCkIdentifier:accountIdentifier:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper missingCKIdentifierAccountPairCache](self, "missingCKIdentifierAccountPairCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));
  LOBYTE(self) = v11 != 0;

  return (char)self;
}

- (id)cachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _REMCKIdentifierAccountIdentifierPair *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void **v25;
  uint64_t v26;
  void (*v27)(_QWORD *);
  void *v28;
  ICBatchFetchHelper *v29;
  id v30;
  uint64_t *v31;
  __int128 *p_buf;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  _REMCKIdentifierAccountIdentifierPair *v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v9 = -[_REMCKIdentifierAccountIdentifierPair initWithCkIdentifier:accountIdentifier:]([_REMCKIdentifierAccountIdentifierPair alloc], "initWithCkIdentifier:accountIdentifier:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectIDCache](self, "managedObjectIDCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100094320;
  v37 = sub_100094330;
  v38 = 0;
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_managedObjectContext);

    if (WeakRetained)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v42 = 0x3032000000;
      v43 = sub_100094320;
      v44 = sub_100094330;
      v45 = 0;
      v13 = objc_loadWeakRetained((id *)&self->_managedObjectContext);
      v25 = _NSConcreteStackBlock;
      v26 = 3221225472;
      v27 = sub_100095A0C;
      v28 = &unk_1007DA850;
      v31 = &v33;
      v29 = self;
      v30 = v11;
      p_buf = &buf;
      objc_msgSend(v13, "performBlockAndWait:", &v25);

      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v25, v26, v27, v28, v29));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_100684E14();
      }
      else
      {
        if (v34[5])
          goto LABEL_14;
        v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit", v25, v26, v27, v28, v29));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v39 = 138543362;
          v40 = v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "ICBatchFetchHelper: existingObjectWithID %{public}@ is nil", v39, 0xCu);
        }
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectIDCache](self, "managedObjectIDCache"));
      objc_msgSend(v15, "removeObjectForKey:", v9);

LABEL_14:
      _Block_object_dispose(&buf, 8);

      goto LABEL_15;
    }
    v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_100684DB0((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ICBatchFetchHelper: %{public}@ is not in cachedManagedObjectForCKIdentifier", (uint8_t *)&buf, 0xCu);
    }
  }

LABEL_15:
  v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (void)setCachedManagedObject:(id)a3 forCKIdentifier:(id)a4 accountIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _REMCKIdentifierAccountIdentifierPair *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
  if (v16 && v11)
  {
    v12 = -[_REMCKIdentifierAccountIdentifierPair initWithCkIdentifier:accountIdentifier:]([_REMCKIdentifierAccountIdentifierPair alloc], "initWithCkIdentifier:accountIdentifier:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper missingCKIdentifierAccountPairCache](self, "missingCKIdentifierAccountPairCache"));
    objc_msgSend(v13, "removeObjectForKey:", v12);

    if (-[ICBatchFetchHelper _canObtainPermanentIDForObject:context:ckIdentifierAccountIdentifierPair:](self, "_canObtainPermanentIDForObject:context:ckIdentifierAccountIdentifierPair:", v16, v11, v12))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectIDCache](self, "managedObjectIDCache"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectID"));
      objc_msgSend(v14, "setObject:forKey:", v15, v12);

    }
  }

}

- (void)removeCachedManagedObjectForCKIdentifier:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _REMCKIdentifierAccountIdentifierPair *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10 = -[_REMCKIdentifierAccountIdentifierPair initWithCkIdentifier:accountIdentifier:]([_REMCKIdentifierAccountIdentifierPair alloc], "initWithCkIdentifier:accountIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper managedObjectIDCache](self, "managedObjectIDCache"));
  objc_msgSend(v9, "removeObjectForKey:", v10);

}

- (void)dealloc
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBatchFetchHelper dispatchBlocks](self, "dispatchBlocks"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_100684E8C((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)ICBatchFetchHelper;
  -[ICBatchFetchHelper dealloc](&v12, "dealloc");
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (NSMutableSet)ckIdentifierAccountPairs
{
  return self->_ckIdentifierAccountPairs;
}

- (void)setCkIdentifierAccountPairs:(id)a3
{
  objc_storeStrong((id *)&self->_ckIdentifierAccountPairs, a3);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->_managedObjectContext);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeWeak((id *)&self->_managedObjectContext, a3);
}

- (NSMutableArray)dispatchBlocks
{
  return self->_dispatchBlocks;
}

- (void)setDispatchBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchBlocks, a3);
}

- (NSCache)managedObjectIDCache
{
  return self->_managedObjectIDCache;
}

- (void)setManagedObjectIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectIDCache, a3);
}

- (NSCache)missingCKIdentifierAccountPairCache
{
  return self->_missingCKIdentifierAccountPairCache;
}

- (void)setMissingCKIdentifierAccountPairCache:(id)a3
{
  objc_storeStrong((id *)&self->_missingCKIdentifierAccountPairCache, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_missingCKIdentifierAccountPairCache, 0);
  objc_storeStrong((id *)&self->_managedObjectIDCache, 0);
  objc_storeStrong((id *)&self->_dispatchBlocks, 0);
  objc_destroyWeak((id *)&self->_managedObjectContext);
  objc_storeStrong((id *)&self->_ckIdentifierAccountPairs, 0);
}

@end

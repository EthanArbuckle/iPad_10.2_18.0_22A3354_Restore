@implementation FMFFenceManager

- (NSSet)allFences
{
  return self->_allFences;
}

- (FMFFenceManager)init
{
  FMFFenceManager *v2;
  FMFFenceManager *v3;
  FMFFenceTriggerManager *v4;
  FMFFenceTriggerManager *triggerManager;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFFenceManager;
  v2 = -[FMFFenceManager init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[FMFFenceManager reset](v2, "reset");
    v4 = -[FMFFenceTriggerManager initWithDelegate:]([FMFFenceTriggerManager alloc], "initWithDelegate:", v3);
    triggerManager = v3->_triggerManager;
    v3->_triggerManager = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager fences](v3, "fences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    -[FMFFenceTriggerManager setFences:](v3->_triggerManager, "setFences:", v7);

  }
  return v3;
}

- (void)setFences:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[FMFFenceManager setFences:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  -[FMFFenceManager setAllFences:](self, "setAllFences:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager triggerManager](self, "triggerManager"));
  objc_msgSend(v8, "setFences:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("FMFFenceManagerFencesDidChangeNotification"), 0);

}

- (void)setFencesWithoutCKData:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[FMFFenceManager setFencesWithoutCKData:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  -[FMFFenceManager setAllFencesWithoutCKData:](self, "setAllFencesWithoutCKData:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("FMFFenceManagerFencesDidChangeNotification"), 0);

}

- (void)reset
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  -[FMFFenceManager setAllFences:](self, "setAllFences:", v3);

}

- (id)fencesForHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v20;
  id obj;
  NSMutableSet *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v22 = objc_opt_new(NSMutableSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFences](self, "allFences"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    do
    {
      v9 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9);
        v11 = v8[377];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setWithArray:", v12));
        if (objc_msgSend(v4, "intersectsSet:", v13))
        {

        }
        else
        {
          v14 = v7;
          v15 = v8;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v16));
          v18 = objc_msgSend(v4, "containsObject:", v17);

          v8 = v15;
          v7 = v14;
          v6 = v20;

          if (!v18)
            goto LABEL_10;
        }
        -[NSMutableSet addObject:](v22, "addObject:", v10);
LABEL_10:
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  return v22;
}

- (id)recurringAndScheduledFencesForHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned __int8 v20;
  id v22;
  id obj;
  NSMutableSet *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v24 = objc_opt_new(NSMutableSet);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFences](self, "allFences"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    v25 = FMFFenceTriggerScheduled;
    v8 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    do
    {
      v9 = 0;
      v22 = v6;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        v11 = v8[377];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recipients", v22));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setWithArray:", v12));
        if (objc_msgSend(v4, "intersectsSet:", v13))
        {

        }
        else
        {
          v14 = v7;
          v15 = v8;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:](FMFHandle, "handleWithId:", v16));
          v18 = objc_msgSend(v4, "containsObject:", v17);

          v8 = v15;
          v7 = v14;
          v6 = v22;

          if (!v18)
            goto LABEL_13;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trigger"));
        if ((objc_msgSend(v19, "isEqualToString:", v25) & 1) != 0)
        {

        }
        else
        {
          v20 = objc_msgSend(v10, "isRecurring");

          if ((v20 & 1) == 0)
            goto LABEL_13;
        }
        -[NSMutableSet addObject:](v24, "addObject:", v10);
LABEL_13:
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  return v24;
}

- (id)fenceWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager fences](self, "fences"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B474;
  v9[3] = &unk_10009A850;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_firstObjectPassingTest:", v9));

  return v7;
}

- (id)pendingFenceWithCKRecordName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFences](self, "allFences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFencesWithoutCKData](self, "allFencesWithoutCKData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B5D4;
  v11[3] = &unk_10009A850;
  v12 = v4;
  v8 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_firstObjectPassingTest:", v11));

  return v9;
}

- (void)getFenceWithID:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  dispatch_time_t v20;
  _QWORD block[4];
  void (**v22)(id, void *, _QWORD);
  uint64_t *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id location;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager fenceWithID:](self, "fenceWithID:", v8));
  if (v10)
  {
    v9[2](v9, v10, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_initWeak(&location, v11);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_10003B9A4;
    v34 = sub_10003B9B4;
    v35 = 0;
    v12 = objc_loadWeakRetained(&location);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003B9BC;
    v25[3] = &unk_10009A878;
    v25[4] = self;
    v26 = v8;
    objc_copyWeak(&v29, &location);
    v28 = &v30;
    v14 = v9;
    v27 = v14;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("FMFFenceManagerFencesDidChangeNotification"), 0, v13, v25));
    v16 = (void *)v31[5];
    v31[5] = v15;

    v17 = sub_100011D0C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v31[5];
      *(_DWORD *)buf = 136315394;
      v38 = "-[FMFFenceManager getFenceWithID:timeout:block:]";
      v39 = 2112;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: listening for fence changes: %@", buf, 0x16u);
    }

    v20 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BADC;
    block[3] = &unk_10009A8A0;
    v23 = &v30;
    objc_copyWeak(&v24, &location);
    v22 = v14;
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
    _Block_object_dispose(&v30, 8);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

}

- (void)getFenceWithCKRecordName:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  dispatch_time_t v20;
  _QWORD block[4];
  void (**v22)(id, void *, _QWORD);
  uint64_t *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  id location;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager pendingFenceWithCKRecordName:](self, "pendingFenceWithCKRecordName:", v8));
  if (v10)
  {
    v9[2](v9, v10, 0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_initWeak(&location, v11);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_10003B9A4;
    v34 = sub_10003B9B4;
    v35 = 0;
    v12 = objc_loadWeakRetained(&location);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003BED8;
    v25[3] = &unk_10009A878;
    v25[4] = self;
    v26 = v8;
    objc_copyWeak(&v29, &location);
    v28 = &v30;
    v14 = v9;
    v27 = v14;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("FMFFenceManagerFencesDidChangeNotification"), 0, v13, v25));
    v16 = (void *)v31[5];
    v31[5] = v15;

    v17 = sub_100011D0C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v31[5];
      *(_DWORD *)buf = 136315394;
      v38 = "-[FMFFenceManager getFenceWithCKRecordName:timeout:block:]";
      v39 = 2112;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: listening for fence changes: %@", buf, 0x16u);
    }

    v20 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BFF8;
    block[3] = &unk_10009A8A0;
    v23 = &v30;
    objc_copyWeak(&v24, &location);
    v22 = v14;
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
    _Block_object_dispose(&v30, 8);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

}

- (void)removeFences:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFences](self, "allFences"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "minusSet:", v4);
  -[FMFFenceManager setFences:](self, "setFences:", v6);

}

- (void)addFences:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager allFences](self, "allFences"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "minusSet:", v4);
  objc_msgSend(v6, "unionSet:", v4);

  -[FMFFenceManager setFences:](self, "setFences:", v6);
}

- (void)informParticipantOfRemovedFenceWithID:(id)a3 ckRecordID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C248;
  v8[3] = &unk_10009A8C8;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[FMFFenceManager getFenceWithID:timeout:block:](self, "getFenceWithID:timeout:block:", v7, v8, 15.0);

}

- (void)clearStaleStatusForRemovedFenceID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager triggerManager](self, "triggerManager"));
  objc_msgSend(v5, "clearStaleFenceStatusForFenceID:", v4);

}

- (void)muteFences:(id)a3 withEndDate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13);
        if (v14)
          objc_msgSend(v14, "updateFenceMuteEndDate:", v8);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  v9[2](v9, 0);

}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v15 = a3;
  v16 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003C630;
  v24[3] = &unk_10009A8F0;
  v24[4] = self;
  v25 = v15;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  v30 = v16;
  v31 = a9;
  v17 = v16;
  v18 = v31;
  v19 = v29;
  v20 = v28;
  v21 = v27;
  v22 = v15;
  v23 = a5;
  -[FMFFenceManager getFenceWithID:timeout:block:](self, "getFenceWithID:timeout:block:", v17, v24, 15.0);

}

- (void)receiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((_os_feature_enabled_impl("FindMy", "Fences_Migration") & 1) == 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003C8FC;
    v17[3] = &unk_10009A938;
    v17[4] = self;
    v18 = v12;
    v19 = v14;
    v20 = v15;
    v21 = v16;
    v22 = v13;
    -[FMFFenceManager getFenceWithID:timeout:block:](self, "getFenceWithID:timeout:block:", v22, v17, 15.0);

  }
}

- (void)triggerAfterAcceptanceWithUUID:(id)a3 forFencewithID:(id)a4 withStatus:(id)a5 withAcceptanceStatus:(id)a6 atDate:(id)a7 triggerLocation:(id)a8 clientSession:(id)a9 completion:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  FMFFenceManager *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003CB3C;
  v21[3] = &unk_10009A960;
  v22 = a6;
  v23 = self;
  v24 = a3;
  v25 = a5;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v29 = a10;
  v13 = v29;
  v14 = v28;
  v15 = v27;
  v16 = v26;
  v17 = v24;
  v18 = v22;
  v19 = a5;
  -[FMFFenceManager getFenceWithID:timeout:block:](v23, "getFenceWithID:timeout:block:", a4, v21, 15.0);

}

- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFenceManager triggerManager](self, "triggerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "triggerForRepeatedFenceBeforeAcceptanceWithFence:", v4));

  return v6;
}

- (void)clearStaleFenceTriggerForFence:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager triggerManager](self, "triggerManager"));
  objc_msgSend(v5, "clearStaleFenceTriggerForFence:", v4);

}

- (void)triggerManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager delegate](self, "delegate"));
  objc_msgSend(v12, "fenceManager:didModifyFence:clientSession:withCompletion:", self, v11, v10, v9);

}

- (void)triggerManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMFFenceManager delegate](self, "delegate"));
  objc_msgSend(v9, "fenceManager:didModifyFence:withCompletion:", self, v8, v7);

}

- (FMFFenceManagerDelegate)delegate
{
  return (FMFFenceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FMFFenceTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setAllFences:(id)a3
{
  objc_storeStrong((id *)&self->_allFences, a3);
}

- (NSSet)allFencesWithoutCKData
{
  return self->_allFencesWithoutCKData;
}

- (void)setAllFencesWithoutCKData:(id)a3
{
  objc_storeStrong((id *)&self->_allFencesWithoutCKData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allFencesWithoutCKData, 0);
  objc_storeStrong((id *)&self->_allFences, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

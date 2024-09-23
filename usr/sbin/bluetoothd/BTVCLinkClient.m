@implementation BTVCLinkClient

+ (id)btvcLinkClient
{
  if (qword_100991AB8 != -1)
    dispatch_once(&qword_100991AB8, &stru_1009231D0);
  return (id)qword_100991AC0;
}

- (BTVCLinkClient)init
{
  BTVCLinkClient *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;

  v5.receiver = self;
  v5.super_class = (Class)BTVCLinkClient;
  v2 = -[BTVCLinkClient init](&v5, "init");
  if (v2)
  {
    v3 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[BTVCLinkClient init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
  }
  return v2;
}

- (id)addBTVCBonjourLinkDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  BTVCLinkClient *v6;
  BTVCBonjourLink *v7;
  BTVCBonjourLink *btvcBonjourLink;
  NSMutableSet *btvcBonjourLinkDelegates;
  NSMutableSet *v10;
  NSMutableSet *v11;
  BTVCBonjourLink *v12;
  int v14;
  const char *v15;

  v4 = a3;
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[BTVCLinkClient addBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_btvcBonjourLink)
  {
    v7 = -[BTVCBonjourLink initWithDelegate:queue:]([BTVCBonjourLink alloc], "initWithDelegate:queue:", v6, v6->_dispatchQueue);
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = v7;

  }
  btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  if (!btvcBonjourLinkDelegates)
  {
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v11 = v6->_btvcBonjourLinkDelegates;
    v6->_btvcBonjourLinkDelegates = v10;

    btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  }
  -[NSMutableSet addObject:](btvcBonjourLinkDelegates, "addObject:", v4);
  v12 = v6->_btvcBonjourLink;
  objc_sync_exit(v6);

  return v12;
}

- (void)removeBTVCBonjourLinkDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  BTVCLinkClient *v6;
  NSObject *v7;
  BTVCBonjourLink *btvcBonjourLink;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableSet removeObject:](v6->_btvcBonjourLinkDelegates, "removeObject:", v4);
  if (!-[NSMutableSet count](v6->_btvcBonjourLinkDelegates, "count"))
  {
    v7 = qword_100999980;
    if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalidate BTVCBonjourLink", (uint8_t *)&v9, 0xCu);
    }
    -[BTVCBonjourLink invalidate](v6->_btvcBonjourLink, "invalidate");
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = 0;

  }
  objc_sync_exit(v6);

}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  id v5;
  NSObject *v6;
  BTVCLinkClient *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;

  v5 = a3;
  v6 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCLinkClient btvcBonjourLinkDidUpdateState:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dispatchQueue"));
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "btvcBonjourLinkDidUpdateState:", v5);
          }
          else
          {
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_1002C6B98;
            v14[3] = &unk_100918340;
            v14[4] = v12;
            v15 = v5;
            dispatch_async(v13, v14);

          }
        }
        else
        {
          v13 = 0;
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  NSObject *v7;
  BTVCLinkClient *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  int64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;

  v15 = a3;
  v7 = qword_100999980;
  if (os_log_type_enabled((os_log_t)qword_100999980, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[BTVCLinkClient btvcBonjourLink:didStartAdvertisingType:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  v8 = self;
  objc_sync_enter(v8);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8->_btvcBonjourLinkDelegates, "allObjects"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, a2) & 1) != 0)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dispatchQueue"));
          if (v14 == v8->_dispatchQueue)
          {
            objc_msgSend(v13, "btvcBonjourLink:didStartAdvertisingType:", v15, a4);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C6E20;
            block[3] = &unk_100919500;
            block[4] = v13;
            v17 = v15;
            v18 = a4;
            dispatch_async(v14, block);

          }
        }
        else
        {
          v14 = 0;
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v16 = a3;
  v17 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didStopAdvertisingType:withError:", v16, a4, v17);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C7090;
            block[3] = &unk_1009231F8;
            block[4] = v14;
            v19 = v16;
            v21 = a4;
            v20 = v17;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  BTVCLinkClient *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  int64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v14 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dispatchQueue"));
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "btvcBonjourLink:didDeferAdvertisingType:", v14, a4);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C72C4;
            block[3] = &unk_100919500;
            block[4] = v12;
            v16 = v14;
            v17 = a4;
            dispatch_async(v13, block);

          }
        }
        else
        {
          v13 = 0;
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v16 = a3;
  v17 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didFailToStartAdvertisingOfType:withError:", v16, a4, v17);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C7534;
            block[3] = &unk_1009231F8;
            block[4] = v14;
            v19 = v16;
            v21 = a4;
            v20 = v17;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  BTVCLinkClient *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  int64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v14 = a3;
  v7 = self;
  objc_sync_enter(v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dispatchQueue"));
          if (v13 == v7->_dispatchQueue)
          {
            objc_msgSend(v12, "btvcBonjourLink:didStartScanningForType:", v14, a4);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C7768;
            block[3] = &unk_100919500;
            block[4] = v12;
            v16 = v14;
            v17 = a4;
            dispatch_async(v13, block);

          }
        }
        else
        {
          v13 = 0;
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v16 = a3;
  v17 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didFailToStartScanningForType:WithError:", v16, a4, v17);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C79D8;
            block[3] = &unk_1009231F8;
            block[4] = v14;
            v19 = v16;
            v21 = a4;
            v20 = v17;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  BTVCLinkClient *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BTVCLinkClient *obj;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v20 = a3;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v13 = self;
  objc_sync_enter(v13);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v13->_btvcBonjourLinkDelegates, "allObjects"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v18, a2) & 1) != 0)
        {
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dispatchQueue"));
          if (v19 == obj->_dispatchQueue)
          {
            objc_msgSend(v18, "btvcBonjourLink:didDiscoverType:withData:fromPeer:peerInfo:", v20, a4, v21, v22, v23);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C7CC4;
            block[3] = &unk_100923220;
            block[4] = v18;
            v26 = v20;
            v30 = a4;
            v27 = v21;
            v28 = v22;
            v29 = v23;
            dispatch_async(v19, block);

          }
        }
        else
        {
          v19 = 0;
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v16 = a3;
  v17 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didLosePeer:type:", v16, v17, a5);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C7F34;
            block[3] = &unk_1009231F8;
            block[4] = v14;
            v19 = v16;
            v20 = v17;
            v21 = a5;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  BTVCLinkClient *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v18 = a3;
  v19 = a4;
  v20 = a6;
  v11 = self;
  objc_sync_enter(v11);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11->_btvcBonjourLinkDelegates, "allObjects"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dispatchQueue"));
          if (v17 == v11->_dispatchQueue)
          {
            objc_msgSend(v16, "btvcBonjourLink:didConnectToPeer:transport:error:", v18, v19, a5, v20);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C81E0;
            block[3] = &unk_100923248;
            block[4] = v16;
            v22 = v18;
            v23 = v19;
            v25 = a5;
            v24 = v20;
            dispatch_async(v17, block);

          }
        }
        else
        {
          v17 = 0;
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)btvcBonjourLink:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didDisconnectFromPeer:error:", v16, v17, v18);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C8480;
            block[3] = &unk_100923270;
            block[4] = v14;
            v20 = v16;
            v21 = v17;
            v22 = v18;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  BTVCLinkClient *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v11 = self;
  objc_sync_enter(v11);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11->_btvcBonjourLinkDelegates, "allObjects"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dispatchQueue"));
          if (v17 == v11->_dispatchQueue)
          {
            objc_msgSend(v16, "btvcBonjourLink:didSendData:toPeer:error:", v18, v19, v20, v21);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C8750;
            block[3] = &unk_100923298;
            block[4] = v16;
            v23 = v18;
            v24 = v19;
            v25 = v20;
            v26 = v21;
            dispatch_async(v17, block);

          }
        }
        else
        {
          v17 = 0;
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)btvcBonjourLink:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  BTVCLinkClient *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dispatchQueue"));
          if (v15 == v9->_dispatchQueue)
          {
            objc_msgSend(v14, "btvcBonjourLink:didReceiveData:fromPeer:", v16, v17, v18);
          }
          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1002C89F0;
            block[3] = &unk_100923270;
            block[4] = v14;
            v20 = v16;
            v21 = v17;
            v22 = v18;
            dispatch_async(v15, block);

          }
        }
        else
        {
          v15 = 0;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btvcBonjourLink, 0);
  objc_storeStrong((id *)&self->_btvcBonjourLinkDelegates, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end

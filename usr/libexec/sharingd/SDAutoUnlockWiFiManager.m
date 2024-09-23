@implementation SDAutoUnlockWiFiManager

+ (id)sharedManager
{
  if (qword_1007C6BD0 != -1)
    dispatch_once(&qword_1007C6BD0, &stru_100719860);
  return (id)qword_1007C6BC8;
}

- (SDAutoUnlockWiFiManager)init
{
  SDAutoUnlockWiFiManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableArray *v5;
  NSMutableArray *wifiRequestQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockWiFiManager;
  v2 = -[SDAutoUnlockWiFiManager init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.sharing.SDAutoUnlockWiFiManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(NSMutableArray);
    wifiRequestQueue = v2->_wifiRequestQueue;
    v2->_wifiRequestQueue = v5;

  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100190D48;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

  -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
}

- (void)_createNISession
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = SFMainQueue(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100190DDC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_addObservers
{
  NSObject *v3;
  id v4;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleVirtualInterfacesChanged:", CFSTR("com.apple.sharingd.VirtualInterfacesChanged"), 0);

}

- (BOOL)_addWiFiRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v14 = 136315650;
    v15 = "-[SDAutoUnlockWiFiManager _addWiFiRequest:]";
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", (uint8_t *)&v14, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
  v11 = objc_msgSend(v10, "containsObject:", v4);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    objc_msgSend(v12, "addObject:", v4);

    -[SDAutoUnlockWiFiManager _processRequestQueue](self, "_processRequestQueue");
  }

  return 1;
}

- (void)_invalidateWiFiRequest:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  unsigned int v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  unsigned int v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;

  v4 = (__CFString *)a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    *(_DWORD *)buf = 136315650;
    v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
    v34 = 2112;
    v35 = v4;
    v36 = 2112;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", buf, 0x20u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if ((v9 & 1) != 0)
  {
    if (!-[SDAutoUnlockWiFiManager awdlStarting](self, "awdlStarting"))
    {
LABEL_8:
      -[SDAutoUnlockWiFiManager _disableRangeableNI](self, "_disableRangeableNI");
      -[SDAutoUnlockWiFiManager _stopAWDL](self, "_stopAWDL");
      -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", 0);
      goto LABEL_16;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
    if (v10 || -[SDAutoUnlockWiFiManager awdlStartFailed](self, "awdlStartFailed"))
    {

      goto LABEL_8;
    }
    v23 = -[SDAutoUnlockWiFiManager awdlTimerFired](self, "awdlTimerFired");
    if (v23)
      goto LABEL_8;
    v24 = auto_unlock_log(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (-[SDAutoUnlockWiFiManager awdlStarting](self, "awdlStarting"))
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
      if (-[SDAutoUnlockWiFiManager awdlStartFailed](self, "awdlStartFailed"))
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      v29 = -[SDAutoUnlockWiFiManager awdlTimerFired](self, "awdlTimerFired");
      *(_DWORD *)buf = 136316162;
      v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      if (v29)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v27;
      v38 = 2112;
      v39 = v28;
      v40 = 2112;
      v41 = v30;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Waiting for network before disable. awdlStarting: %@, awdlNetwork: %@, awdlStartFailed: %@, awdlTimerFired: %@", buf, 0x34u);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    objc_msgSend(v31, "setWaitingForNetworkToDisable:", 1);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier == %@"), v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v12));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    v17 = auto_unlock_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v15, "identifier"));
        v21 = -[__CFString waitingForNetworkToDisable](v15, "waitingForNetworkToDisable");
        *(_DWORD *)buf = 136315906;
        v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v20;
        v38 = 1024;
        LODWORD(v39) = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s removing  non current request: %@ identifier: %@ waitingForNetworkToDisable: %d", buf, 0x26u);

      }
      v18 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
      -[NSObject removeObject:](v18, "removeObject:", v15);
    }
    else if (v19)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString identifier](v4, "identifier"));
      *(_DWORD *)buf = 136315650;
      v33 = "-[SDAutoUnlockWiFiManager _invalidateWiFiRequest:]";
      v34 = 2112;
      v35 = v4;
      v36 = 2112;
      v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s request(%@) not found !! identifier: %@", buf, 0x20u);

    }
  }
LABEL_16:

}

- (void)scheduleWiFiRequest:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  SDAutoUnlockWiFiManager *v10;
  SEL v11;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100191588;
  block[3] = &unk_100715D08;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)cancelWiFiRequest:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100191778;
    v6[3] = &unk_100714860;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)updateWiFiRequest:(id)a3 setRangingPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10019183C;
  v11[3] = &unk_100714860;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

- (void)_processRequestQueue
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  NSObject *v22;
  id v23;
  _BYTE buf[12];
  __int16 v25;
  _BYTE v26[14];
  __int16 v27;
  void *v28;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  if (v4)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
      v25 = 1024;
      *(_DWORD *)v26 = 323;
      *(_WORD *)&v26[4] = 2112;
      *(_QWORD *)&v26[6] = v8;
      v27 = 2112;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %d Already processing request: %@ identifier: %@", buf, 0x26u);

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager wifiRequestQueue](self, "wifiRequestQueue"));
      objc_msgSend(v12, "removeObjectAtIndex:", 0);

      -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queueAvailableHandler"));

      if (v14)
      {
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "queueAvailableHandler"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100191B54;
        v21[3] = &unk_1007198B0;
        v21[4] = self;
        v7 = v7;
        v22 = v7;
        objc_copyWeak(&v23, (id *)buf);
        ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v18 = auto_unlock_log(v15);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SDAutoUnlockWiFiManager _processRequestQueue]";
          v25 = 2112;
          *(_QWORD *)v26 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s no queueAvailableHandler. Invalidating current request %@", buf, 0x16u);

        }
        -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
      }
    }
  }

}

- (void)_cancelWiFiRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SDAutoUnlockWiFiManager _cancelWiFiRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(v4, "setInvalidationHandler:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
    objc_msgSend(v9, "_invalidateWiFiRequest:", v4);

    if ((objc_msgSend(v4, "invalidateCalled") & 1) == 0)
    {
      objc_msgSend(v4, "setInvalidateCalled:", 1);
      objc_msgSend(v4, "_invalidate");
    }
  }

}

- (void)_resetManagerState
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SDAutoUnlockWiFiManager _resetManagerState]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 0);
  -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0);
  -[SDAutoUnlockWiFiManager setAwdlTimerFired:](self, "setAwdlTimerFired:", 0);
}

- (void)_invalidateCurrentRequest
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v11 = 136315650;
    v12 = "-[SDAutoUnlockWiFiManager _invalidateCurrentRequest]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s current Request: %@ identifier: %@", (uint8_t *)&v11, 0x20u);

  }
  -[SDAutoUnlockWiFiManager _resetManagerState](self, "_resetManagerState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  -[SDAutoUnlockWiFiManager _cancelWiFiRequest:](self, "_cancelWiFiRequest:", v10);

  -[SDAutoUnlockWiFiManager setCurrentRequest:](self, "setCurrentRequest:", 0);
  -[SDAutoUnlockWiFiManager _processRequestQueue](self, "_processRequestQueue");
}

- (void)_startRangingWithNI
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  void *v27;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rangingPeer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "niRangingPeer"));
  v27 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
    v12 = CFSTR("YES");
    v22 = "-[SDAutoUnlockWiFiManager _startRangingWithNI]";
    v21 = 136315650;
    if (!v11)
      v12 = CFSTR("NO");
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Starting ranging (manager: %@, peers: %@)", (uint8_t *)&v21, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  objc_msgSend(v13, "rangingTimeout");

  v14 = objc_alloc((Class)NIRangingAuthConfiguration);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "macAddress"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "secureRangingKeyID"));
  v19 = objc_msgSend(v14, "initAsResponder:macAddress:key:", 0, v16, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
  objc_msgSend(v20, "runWithConfiguration:", v19);

  kdebug_trace(725286952, 0, 0, 0, 0);
}

- (void)_enableRangeableIfNeededNI
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  NSObject *v37;
  void *v38;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v5 = objc_msgSend(v4, "isRangingInitiator");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rangingPeer"));

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rangingPeer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "niRangingPeer"));

      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rangingPeer"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "niRangingPeer"));
        v38 = v15;
        v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));

        v18 = auto_unlock_log(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
          v21 = CFSTR("YES");
          v33 = "-[SDAutoUnlockWiFiManager _enableRangeableIfNeededNI]";
          v32 = 136315650;
          if (!v20)
            v21 = CFSTR("NO");
          v34 = 2112;
          v35 = v21;
          v36 = 2112;
          v37 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s startRangingFromPeers (manager: %@, peers: %@)", (uint8_t *)&v32, 0x20u);

        }
        v22 = objc_alloc((Class)NIRangingAuthConfiguration);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "macAddress"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "secureRangingKeyID"));
        v27 = objc_msgSend(v22, "initAsResponder:macAddress:key:", 1, v24, v26);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
        objc_msgSend(v28, "runWithConfiguration:", v27);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        objc_msgSend(v29, "setRangeable:", 1);

      }
      else
      {
        v31 = auto_unlock_log(v12);
        v16 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          sub_100194C48();
      }
    }
    else
    {
      v30 = auto_unlock_log(v8);
      v16 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_100194C1C();
    }

  }
}

- (void)_disableRangeableNI
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  void *v22;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v5 = objc_msgSend(v4, "rangeable");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rangingPeer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "niRangingPeer"));
    v22 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));

    v11 = auto_unlock_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
      v14 = CFSTR("YES");
      v17 = "-[SDAutoUnlockWiFiManager _disableRangeableNI]";
      v16 = 136315650;
      if (!v13)
        v14 = CFSTR("NO");
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s stopRangingFromPeers (manager: %@, peers: %@)", (uint8_t *)&v16, 0x20u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager niSession](self, "niSession"));
    objc_msgSend(v15, "invalidate");

    -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
  }
}

- (void)session:(id)a3 didReceiveRangingAuthRecommendation:(BOOL)a4 forObject:(id)a5
{
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;

  v5 = a4;
  v7 = auto_unlock_log(self);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rangingPeer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "niRangingPeer"));
    *(_DWORD *)buf = 136315650;
    v23 = "-[SDAutoUnlockWiFiManager session:didReceiveRangingAuthRecommendation:forObject:]";
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s should authenticate: %@, peer: %@", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rangingPeer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "niRangingPeer"));

  if (v15)
  {
    v17 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10019294C;
    v20[3] = &unk_100715BB0;
    v20[4] = self;
    v21 = v5;
    dispatch_async(v17, v20);

  }
  else
  {
    v18 = auto_unlock_log(v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_100194C74();

  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100192B2C;
  v8[3] = &unk_100714860;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v5 = a4;
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NI session invalidated, restarting session", buf, 2u);
  }

  -[SDAutoUnlockWiFiManager _createNISession](self, "_createNISession");
  if (objc_msgSend(v5, "code") == (id)-10008)
  {
    v8 = auto_unlock_log(-10008);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NI session is invalidated after completing the one-shot ranging, so ignoring the completed error", buf, 2u);
    }

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100192D08;
    v11[3] = &unk_100714860;
    v11[4] = self;
    v12 = v5;
    dispatch_async(v10, v11);

  }
}

- (void)_startAWDLWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t started;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "awdlInfo"));
  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v22 = 136315906;
    v23 = "-[SDAutoUnlockWiFiManager _startAWDLWithInfo:]";
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Starting AWDL request: %@ identifier: %@ info: %@", (uint8_t *)&v22, 0x2Au);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v11 = objc_msgSend(v10, "awdlDevice");

  if (!v11)
  {
    v21 = auto_unlock_log(v12);
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100194CA0(v4);
    goto LABEL_11;
  }
  started = WiFiDeviceClientStartNetwork(v11, 4, v6, sub_100193008, -[SDAutoUnlockWiFiManagerContext initWithRequest:wiFiManager:]([SDAutoUnlockWiFiManagerContext alloc], "initWithRequest:wiFiManager:", v4, self));
  if (!(_DWORD)started)
  {
    -[SDAutoUnlockWiFiManager _enableRangeableIfNeededNI](self, "_enableRangeableIfNeededNI");
    -[SDAutoUnlockWiFiManager _restartAWDLTimer](self, "_restartAWDLTimer");
    goto LABEL_13;
  }
  v14 = started;
  v15 = auto_unlock_log(started);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100194D48(v4);

  -[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 1);
  -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "awdlStartedHandler"));

  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSObject awdlStartedHandler](v19, "awdlStartedHandler"));
    v20[2](v20, 0, v14);

LABEL_11:
  }
LABEL_13:

}

- (void)_stopAWDL
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  SDAutoUnlockWiFiManagerContext *v7;
  void *v8;
  SDAutoUnlockWiFiManagerContext *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v6 = objc_msgSend(v5, "awdlDevice");

    v7 = [SDAutoUnlockWiFiManagerContext alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v9 = -[SDAutoUnlockWiFiManagerContext initWithRequest:wiFiManager:](v7, "initWithRequest:wiFiManager:", v8, self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
    v11 = WiFiDeviceClientStopNetwork(v6, v10, sub_100193330, v9);

    v13 = auto_unlock_log(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlNetwork](self, "awdlNetwork"));
      v17 = 136315906;
      v18 = "-[SDAutoUnlockWiFiManager _stopAWDL]";
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 1024;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Stopping AWDL currentRequest: %@ network %@, error %d", (uint8_t *)&v17, 0x26u);

    }
    -[SDAutoUnlockWiFiManager setAwdlNetwork:](self, "setAwdlNetwork:", 0);
  }
  -[SDAutoUnlockWiFiManager _resetManagerState](self, "_resetManagerState");
}

- (void)__handleAWDLDisabledIfNeededForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[SDAutoUnlockWiFiManager _invalidateAWDLTimer](self, "_invalidateAWDLTimer");
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v14 = 136315650;
        v15 = "-[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:]";
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s AWDL went down. Invalidating current request: %@ identifier: %@", (uint8_t *)&v14, 0x20u);

      }
      -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
    }
  }

}

- (void)_restartAWDLTimer
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  _QWORD v15[4];
  id v16;
  _BYTE buf[24];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SDAutoUnlockWiFiManager _restartAWDLTimer]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Restarting AWDL bring up timer", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  v8 = v7 == 0;

  if (v8)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001937A8;
    v15[3] = &unk_1007145D0;
    objc_copyWeak(&v16, (id *)buf);
    v10 = sub_10019AAD8(0, v9, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SDAutoUnlockWiFiManager setAwdlTimer:](self, "setAwdlTimer:", v11);

    v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
    dispatch_resume(v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  v14 = sub_10019AAC0(30.0);
  sub_10019AB78(v13, v14);

}

- (void)_invalidateAWDLTimer
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
  if (v4)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SDAutoUnlockWiFiManager _invalidateAWDLTimer]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Invalidating AWDL bring up timer", (uint8_t *)&v9, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager awdlTimer](self, "awdlTimer"));
    dispatch_source_cancel(v8);

    -[SDAutoUnlockWiFiManager setAwdlTimer:](self, "setAwdlTimer:", 0);
  }
}

- (void)_handleAWDLTimerFired
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s AWDL bring up timer fired", (uint8_t *)&v12, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v8 = objc_msgSend(v7, "waitingForNetworkToDisable");

  if (v8)
  {
    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SDAutoUnlockWiFiManager _handleAWDLTimerFired]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Disabling ranging and awdl for timer", (uint8_t *)&v12, 0xCu);
    }

    -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
  }
  else
  {
    -[SDAutoUnlockWiFiManager setAwdlTimerFired:](self, "setAwdlTimerFired:", 1);
  }
}

- (void)_startRangingIfPeerFoundInStateInfo:(id)a3 awdlUpSameTime:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(void);
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BYTE v32[22];
  __int16 v33;
  const __CFString *v34;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = -[SDAutoUnlockWiFiManager _peerFoundInStateInfo:](self, "_peerFoundInStateInfo:", v6);
  v10 = auto_unlock_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    *(_DWORD *)v32 = 136315650;
    *(_QWORD *)&v32[4] = "-[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:]";
    if (objc_msgSend(v13, "rangingStarted"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_WORD *)&v32[12] = 2112;
    *(_QWORD *)&v32[14] = v12;
    v33 = 2112;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s peer found: %@, ranging started: %@", v32, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v16 = v8 & ~objc_msgSend(v15, "rangingStarted");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v18 = v17;
  if (v16 != 1)
  {
    v27 = objc_msgSend(v17, "rangingStarted") | v8;

    if ((v27 & 1) != 0)
      return;
    v29 = auto_unlock_log(v28);
    v25 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v26 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rangingPeer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "macAddressData"));
    *(_DWORD *)v32 = 136315394;
    *(_QWORD *)&v32[4] = "-[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:]";
    *(_WORD *)&v32[12] = 2112;
    *(_QWORD *)&v32[14] = v31;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Peer missing from AWDL state. Peer: %@", v32, 0x16u);

LABEL_17:
LABEL_18:

    return;
  }
  objc_msgSend(v17, "setRangingStarted:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peerFoundHandler"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "peerFoundHandler"));
    v22[2](v22, v4);

  }
  -[SDAutoUnlockWiFiManager _startRangingWithNI](self, "_startRangingWithNI", *(_OWORD *)v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rangingStartedHandler"));

  if (v24)
  {
    v25 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v26 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[NSObject rangingStartedHandler](v25, "rangingStartedHandler"));
    v26[2]();
    goto LABEL_17;
  }
}

- (BOOL)_peerFoundInStateInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  unsigned __int8 v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rangingPeer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "macAddressData"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_PEER_LIST")));
  v10 = auto_unlock_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SDAutoUnlockWiFiManager _peerFoundInStateInfo:]";
    v28 = 2112;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Received peer list: %@", buf, 0x16u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("STATION_MAC"), (_QWORD)v21));
        v18 = objc_msgSend(v8, "isEqualToData:", v17);

        if ((v18 & 1) != 0)
        {
          v19 = 1;
          goto LABEL_13;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (void)handleVirtualInterfacesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100193FA4;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleVirtualInterfacesChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  _BOOL8 v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  uint64_t v35;
  _BYTE v36[24];
  const __CFString *v37;

  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v7 = objc_msgSend(v6, "isRangingInitiator");

    if ((v7 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "awdlState"));

      v12 = auto_unlock_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 136315394;
        *(_QWORD *)&v36[4] = "-[SDAutoUnlockWiFiManager _handleVirtualInterfacesChanged:]";
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Received state from awdl: %@", v36, 0x16u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_IS_LINKDOWN")));
      v15 = objc_msgSend(v14, "BOOLValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v17 = objc_msgSend(v16, "calledAWDLStarted");

      v19 = auto_unlock_log(v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CFSTR("YES");
        if (v15)
          v22 = CFSTR("NO");
        else
          v22 = CFSTR("YES");
        *(_DWORD *)v36 = 136315650;
        *(_QWORD *)&v36[4] = "-[SDAutoUnlockWiFiManager _handleVirtualInterfacesChanged:]";
        *(_WORD *)&v36[12] = 2112;
        *(_QWORD *)&v36[14] = v22;
        if (!v17)
          v21 = CFSTR("NO");
        *(_WORD *)&v36[22] = 2112;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s linkup: %@, calledAWDLStarted: %@", v36, 0x20u);
      }

      if ((v15 & 1) != 0)
      {
        v23 = -[SDAutoUnlockWiFiManager awdlStarting](self, "awdlStarting");
        if (v23)
        {
          v24 = auto_unlock_log(v23);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Ignore linkdown notification while starting AWDL", v36, 2u);
          }

        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          -[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:](self, "__handleAWDLDisabledIfNeededForRequest:", v28);

        }
      }
      else
      {
        if ((v17 & 1) != 0)
        {
          v27 = 0;
        }
        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          objc_msgSend(v29, "setCalledAWDLStarted:", 1);

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "awdlStartedHandler"));

          v27 = v31 != 0;
          if (v31)
          {
            v33 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
            v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSObject awdlStartedHandler](v33, "awdlStartedHandler"));
            ((void (**)(_QWORD, NSObject *, _QWORD))v34)[2](v34, v10, 0);

          }
          else
          {
            v35 = auto_unlock_log(v32);
            v33 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              sub_100194E00(self);
          }

        }
        -[SDAutoUnlockWiFiManager _startRangingIfPeerFoundInStateInfo:awdlUpSameTime:](self, "_startRangingIfPeerFoundInStateInfo:awdlUpSameTime:", v10, v27, *(_OWORD *)v36, *(_QWORD *)&v36[16]);
      }
    }
    else
    {
      v26 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_100194EA0();
    }

  }
}

- (void)rangingReportEventForWiFiInterfaceWithName:(id)a3 data:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  SDAutoUnlockWiFiManager *v15;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001943D0;
  block[3] = &unk_100715138;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001945E8;
  v13[3] = &unk_100716BB0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_handleNetworkStarted:(id)a3 request:(id)a4 error:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v12 = auto_unlock_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v27 = 136315650;
    v28 = "-[SDAutoUnlockWiFiManager _handleNetworkStarted:request:error:]";
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s request: %@ identifier: %@", (uint8_t *)&v27, 0x20u);

  }
  -[SDAutoUnlockWiFiManager _invalidateAWDLTimer](self, "_invalidateAWDLTimer");
  v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));

  if (v15 == v9)
  {
    -[SDAutoUnlockWiFiManager setAwdlNetwork:](self, "setAwdlNetwork:", v8);
    -[SDAutoUnlockWiFiManager setAwdlStarting:](self, "setAwdlStarting:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v17 = objc_msgSend(v16, "waitingForNetworkToDisable");

    if (v17)
    {
      -[SDAutoUnlockWiFiManager _invalidateCurrentRequest](self, "_invalidateCurrentRequest");
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
      v19 = objc_msgSend(v18, "calledAWDLStarted");

      if ((v19 & 1) == 0)
      {
        if (a5)
        {
          v20 = auto_unlock_log(-[SDAutoUnlockWiFiManager setAwdlStartFailed:](self, "setAwdlStartFailed:", 1));
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_100194ED8(a5, v21);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        objc_msgSend(v22, "setCalledAWDLStarted:", 1);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "awdlStartedHandler"));

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
          v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "awdlStartedHandler"));
          v26[2](v26, 0, a5);

        }
      }
    }
  }

}

- (void)handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001948EC;
  block[3] = &unk_100715D08;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleNetworkStoppedWithError:(id)a3 error:(int64_t)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiManager currentRequest](self, "currentRequest"));
    v11 = 136315650;
    v12 = "-[SDAutoUnlockWiFiManager _handleNetworkStoppedWithError:error:]";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s AWDL disabled request: %@ currentRequest: %@", (uint8_t *)&v11, 0x20u);

  }
  -[SDAutoUnlockWiFiManager __handleAWDLDisabledIfNeededForRequest:](self, "__handleAWDLDisabledIfNeededForRequest:", v5);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)awdlTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAwdlTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAwdlNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)awdlStartFailed
{
  return self->_awdlStartFailed;
}

- (void)setAwdlStartFailed:(BOOL)a3
{
  self->_awdlStartFailed = a3;
}

- (BOOL)awdlStarting
{
  return self->_awdlStarting;
}

- (void)setAwdlStarting:(BOOL)a3
{
  self->_awdlStarting = a3;
}

- (BOOL)awdlTimerFired
{
  return self->_awdlTimerFired;
}

- (void)setAwdlTimerFired:(BOOL)a3
{
  self->_awdlTimerFired = a3;
}

- (SDAutoUnlockWiFiRequest)currentRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
  objc_storeStrong((id *)&self->_niSession, a3);
}

- (NSMutableArray)wifiRequestQueue
{
  return self->_wifiRequestQueue;
}

- (void)setWifiRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRequestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiRequestQueue, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong(&self->_awdlNetwork, 0);
  objc_storeStrong((id *)&self->_awdlTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

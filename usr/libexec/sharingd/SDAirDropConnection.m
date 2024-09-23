@implementation SDAirDropConnection

- (SDAirDropConnection)initWithConnection:(_CFHTTPServerConnection *)a3
{
  SDAirDropConnection *v4;
  SDAirDropConnection *v5;
  SDAirDropFileZipper *zipper;
  NSProgress *progress;
  NSURL *destination;
  NSMutableData *v9;
  NSMutableData *requestData;
  NSMutableDictionary *v11;
  NSMutableDictionary *properties;
  uint64_t v13;
  SDStatusMonitor *monitor;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *askSemaphore;
  void *v17;
  uint64_t v18;
  NSData *mediaCapabilities;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SDAirDropConnection;
  v4 = -[SDAirDropConnection init](&v21, "init");
  v5 = v4;
  if (v4)
  {
    zipper = v4->_zipper;
    v4->_zipper = 0;

    v5->_person = 0;
    v5->_startTime = 0.0;
    progress = v5->_progress;
    v5->_progress = 0;

    *(_WORD *)&v5->_contactsOnly = 0;
    v5->_askRequest = 0;
    v5->_readStream = 0;
    *(_QWORD *)&v5->_discover = 0;
    *(_WORD *)&v5->_connectionClosed = 0;
    destination = v5->_destination;
    v5->_destination = 0;

    v5->_clientTrust = 0;
    v5->_requestBuffer = 0;
    v5->_uploadRequest = 0;
    v5->_discoverRequest = 0;
    objc_storeStrong((id *)&v5->_queue, &_dispatch_main_q);
    v9 = objc_opt_new(NSMutableData);
    requestData = v5->_requestData;
    v5->_requestData = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    properties = v5->_properties;
    v5->_properties = v11;

    v5->_powerAssertionID = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v5->_monitor;
    v5->_monitor = (SDStatusMonitor *)v13;

    v5->_lastEvent = 1;
    v15 = dispatch_semaphore_create(0);
    askSemaphore = v5->_askSemaphore;
    v5->_askSemaphore = (OS_dispatch_semaphore *)v15;

    v5->_connection = (_CFHTTPServerConnection *)CFRetain(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PFMediaCapabilities capabilitiesForCurrentDevice](PFMediaCapabilities, "capabilitiesForCurrentDevice"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "opaqueRepresentation"));
    mediaCapabilities = v5->_mediaCapabilities;
    v5->_mediaCapabilities = (NSData *)v18;

    -[SDAirDropConnection addObservers](v5, "addObservers");
  }
  return v5;
}

- (void)dealloc
{
  __SFNode *person;
  char *requestBuffer;
  __SecTrust *clientTrust;
  NSProgress *v6;
  dispatch_time_t v7;
  NSObject *queue;
  NSProgress *v9;
  objc_super v10;
  _QWORD block[4];
  NSProgress *v12;

  -[SDAirDropConnection stop](self, "stop");
  -[SDAirDropConnection removeObservers](self, "removeObservers");
  person = self->_person;
  if (person)
    CFRelease(person);
  requestBuffer = self->_requestBuffer;
  if (requestBuffer)
    free(requestBuffer);
  clientTrust = self->_clientTrust;
  if (clientTrust)
    CFRelease(clientTrust);
  v6 = self->_progress;
  -[NSProgress setCancellationHandler:](v6, "setCancellationHandler:", 0);
  v7 = sub_10019AAC0(2.0);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AFB78;
  block[3] = &unk_1007146D8;
  v12 = v6;
  v9 = v6;
  dispatch_after(v7, queue, block);

  v10.receiver = self;
  v10.super_class = (Class)SDAirDropConnection;
  -[SDAirDropConnection dealloc](&v10, "dealloc");
}

- (void)didCloseConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001AFBD8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemWillSleep:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System will sleep, stopping AirDrop connection.", v8, 2u);
  }

  -[SDAirDropConnection stop](self, "stop");
  v6 = sub_10005081C(-8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v7, kSFOperationErrorKey);
  -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);

}

- (void)wirelessPowerChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v4 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled", a3);
  if (!v4)
  {
    v5 = airdrop_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiFi is disabled, stopping AirDrop connection.", v9, 2u);
    }

    -[SDAirDropConnection stop](self, "stop");
    v7 = sub_10005081C(-7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, kSFOperationErrorKey);
    -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);

  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wirelessPowerChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)handleTerminalCallBack
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_stopDeferred)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001AFE50;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  id WeakRetained;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    self->_lastEvent = a3;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "airDropConnection:event:withResults:", self, a3, v8);

  }
}

- (double)getTransferRate
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
  v4 = v3;
  if (v3)
  {
    v5 = (double)(uint64_t)objc_msgSend(v3, "longLongValue");
    v6 = v5 / (CFAbsoluteTimeGetCurrent() - self->_startTime);
  }
  else
  {
    v6 = -1.0;
  }

  return v6;
}

- (double)getTransferSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (void)performBlockForAllProgresses:(id)a3
{
  (*((void (**)(id, NSProgress *))a3 + 2))(a3, self->_progress);
}

- (void)notifyClientForEvent:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  unint64_t lastEvent;
  BOOL v9;
  uint64_t v10;
  id v12;
  NSObject *v13;
  id v14;
  SDAirDropConnection *v15;
  uint64_t v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  const void *v31;
  CFErrorDomain Domain;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[4];
  const __CFString *v40;

  if (a3 != 7)
  {
    v5 = airdrop_log(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 0xE)
        v7 = CFSTR("?");
      else
        v7 = *(&off_10071A0A8 + a3 - 1);
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection event: %@", buf, 0xCu);
    }

  }
  lastEvent = self->_lastEvent;
  v9 = lastEvent > 0xA;
  v10 = (1 << lastEvent) & 0x610;
  if (v9 || v10 == 0)
  {
    switch(a3)
    {
      case 2:
        if (!self->_queueSuspended)
        {
          self->_queueSuspended = 1;
          v12 = sub_10004D994();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          dispatch_suspend(v13);

          sub_10004DCF8(self->_properties, self);
        }
        v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        v15 = self;
        v16 = 2;
        goto LABEL_21;
      case 4:
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", &stru_100719FD0);
        v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        v15 = self;
        v16 = 4;
        goto LABEL_21;
      case 5:
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1001B046C;
        v38[3] = &unk_1007156F8;
        v38[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v38);
        v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        v15 = self;
        v16 = 5;
        goto LABEL_21;
      case 7:
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1001B04E4;
        v37[3] = &unk_1007156F8;
        v37[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v37);
        v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        v15 = self;
        v16 = 7;
LABEL_21:
        -[SDAirDropConnection notifyClient:withResults:](v15, "notifyClient:withResults:", v16, v14);
        goto LABEL_27;
      case 9:
        if (!self->_discover)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderModelNameKey));
          -[SDAirDropConnection getTransferRate](self, "getTransferRate");
          v20 = v19;
          -[SDAirDropConnection getTransferSize](self, "getTransferSize");
          sub_1000443E0(0, v18, 0, -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel"), 0, &__NSDictionary0__struct, v20, v21);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsKey));
        v14 = v22;
        if (v22)
          sub_100044AF8(0, (uint64_t)objc_msgSend(v22, "count"));
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", &stru_100719FB0);
        v23 = -[NSMutableDictionary copy](self->_properties, "copy");
        -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 9, v23);

LABEL_27:
        break;
      case 10:
        v24 = kSFOperationErrorKey;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationErrorKey));

        if (!self->_discover)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderModelNameKey));
          -[SDAirDropConnection getTransferSize](self, "getTransferSize");
          sub_100044784(0, v27, 0, (__CFError *)v25, -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel"), 0, &__NSDictionary0__struct, v28);

        }
        v29 = airdrop_log(v26);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_1001B5ECC();

        v31 = (const void *)kCFErrorDomainSFOperation;
        Domain = CFErrorGetDomain((CFErrorRef)v25);
        if (CFEqual(v31, Domain))
        {
          v33 = -[NSMutableDictionary copy](self->_properties, "copy");
          -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10, v33);
        }
        else
        {
          v34 = sub_10005081C(-1, v25);
          v33 = (id)objc_claimAutoreleasedReturnValue(v34);
          v35 = -[NSMutableDictionary mutableCopy](self->_properties, "mutableCopy");
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, v24);
          -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10, v35);

        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1001B05D8;
        v36[3] = &unk_1007156F8;
        v36[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v36);
        break;
      default:
        v17 = -[NSMutableDictionary copy](self->_properties, "copy");
        -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", a3, v17);

        break;
    }
  }
}

- (void)didReceiveError:(__CFError *)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;

  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1001B5F58();

  -[SDAirDropConnection handleTerminalCallBack](self, "handleTerminalCallBack");
  v7 = -[SDAirDropConnection senderInfoAvailable](self, "senderInfoAvailable");
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a3, kSFOperationErrorKey);
    -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);
  }
  else
  {
    v8 = airdrop_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001B5F2C();

    -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
  }
}

- (void)setProperty:(void *)a3 forKey:(__CFString *)a4
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (a3)
    CFDictionarySetValue((CFMutableDictionaryRef)properties, a4, a3);
  else
    CFDictionaryRemoveValue((CFMutableDictionaryRef)properties, a4);
}

+ (id)fileInfoExpectedClassForKeyMap
{
  if (qword_1007C6C78 != -1)
    dispatch_once(&qword_1007C6C78, &stru_100719FF0);
  return (id)qword_1007C6C80;
}

+ (id)validatedFileInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t isKindOfClass;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropConnection fileInfoExpectedClassForKeyMap](SDAirDropConnection, "fileInfoExpectedClassForKeyMap"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11));
          v14 = v13;
          if (v13)
          {
            isKindOfClass = objc_opt_isKindOfClass(v13, v12);
            if ((isKindOfClass & 1) == 0)
            {
              v21 = airdrop_log(isKindOfClass);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                sub_1001B6020((uint64_t)v14, v11, v22);

              goto LABEL_20;
            }
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v8)
          continue;
        break;
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSFOperationFileBomPathKey));
    v6 = v16;
    if (v16 && !(v17 = sub_1000509E4(v16)))
    {
      v24 = airdrop_log(v17);
      v14 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1001B5FB8();
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSFOperationFileNameKey));
      v14 = v18;
      if (!v18 || (v19 = sub_100050AB8(v18)))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v5));
LABEL_21:

        goto LABEL_22;
      }
      v25 = airdrop_log(v19);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1001B5FB8();

    }
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v20 = 0;
LABEL_22:

  return v20;
}

+ (id)validatedFilesArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  if (v3)
  {
    v23 = objc_opt_class(NSDictionary);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

    v6 = NSArrayValidateClasses(v3, 0, 0, v5);
    if ((v6 & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = objc_claimAutoreleasedReturnValue(+[SDAirDropConnection validatedFileInfo:](SDAirDropConnection, "validatedFileInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), (_QWORD)v18));
            if (!v13)
            {

              goto LABEL_16;
            }
            v14 = (void *)v13;
            -[NSObject addObject:](v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            continue;
          break;
        }
      }

      v7 = v7;
      v15 = v7;
    }
    else
    {
      v16 = airdrop_log(v6);
      v7 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1001B60C8();
LABEL_16:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)validatedItemsArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  if (!a3)
    return 0;
  v3 = a3;
  v9[0] = objc_opt_class(NSString);
  v9[1] = objc_opt_class(NSURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  if (NSArrayValidateClasses(v3, 0, 0, v5))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)storeArrayValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  void *Value;
  void *v7;
  CFTypeID TypeID;
  CFTypeID v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;

  Value = (void *)CFDictionaryGetValue(a3, a4);
  if (!Value)
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", 0, a4);
    return;
  }
  v7 = Value;
  TypeID = CFArrayGetTypeID();
  v9 = CFGetTypeID(v7);
  if (TypeID != v9)
  {
    v13 = airdrop_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001B6154();
    goto LABEL_18;
  }
  v10 = v7;
  v11 = v10;
  if ((__CFString *)kSFOperationFilesKey == a4
    || a4 && kSFOperationFilesKey && (v10 = CFEqual(a4, kSFOperationFilesKey), (_DWORD)v10))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[SDAirDropConnection validatedFilesArray:](SDAirDropConnection, "validatedFilesArray:", v11));
  }
  else
  {
    if ((__CFString *)kSFOperationItemsKey != a4)
    {
      if (!a4 || !kSFOperationItemsKey || (v10 = CFEqual(a4, kSFOperationItemsKey), !(_DWORD)v10))
      {
        v15 = airdrop_log(v10);
        v14 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1001B60F4();
        goto LABEL_17;
      }
    }
    v12 = objc_claimAutoreleasedReturnValue(+[SDAirDropConnection validatedItemsArray:](SDAirDropConnection, "validatedItemsArray:", v11));
  }
  v14 = v12;
  -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", v12, a4);
LABEL_17:

LABEL_18:
}

- (void)storeRequestValue:(_CFHTTPServerRequest *)a3 forKey:(__CFString *)a4 convertToNumber:(BOOL)a5
{
  _BOOL4 v5;
  const __CFString *v8;
  const __CFString *v9;
  CFTypeID v10;
  CFTypeID TypeID;
  CFStringRef v12;
  CFStringRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;

  v5 = a5;
  v8 = (const __CFString *)_CFHTTPServerRequestCopyProperty(a3, a4);
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    TypeID = CFStringGetTypeID();
    if (v10 == TypeID)
    {
      v12 = CFURLCreateStringByReplacingPercentEscapes(0, v9, &stru_10072FE60);
      if (v12)
      {
        v13 = v12;
        if (v5)
        {
          v14 = sub_10019AC14(0, v9);
          if (v14)
          {
            v15 = v14;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v14);
            CFRelease(v15);
          }
        }
        else
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v12);
        }
        CFRelease(v13);
        goto LABEL_17;
      }
      v20 = airdrop_log(0);
      v19 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1001B61E0();
    }
    else
    {
      v18 = airdrop_log(TypeID);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1001B620C();
    }

LABEL_17:
    CFRelease(v9);
    return;
  }
  v16 = airdrop_log(0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_1001B61B4();

}

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFDataGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6238();

  }
  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFStringGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6298();

  }
  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (void)storeNumberValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFNumberGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B62F8();

  }
  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (void)storeBooleanValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;

  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFBooleanGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6358();

  }
  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }
}

- (void)storeIconValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  const __CFData *Value;
  const __CFData *v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CGImageRef v10;
  CGImageRef v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;

  Value = (const __CFData *)CFDictionaryGetValue(a3, a4);
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    TypeID = CFDataGetTypeID();
    if (v8 == TypeID)
    {
      v10 = sub_1000CE4CC(v7);
      if (v10)
      {
        v11 = v10;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, a4);
        CFRelease(v11);
        return;
      }
      v14 = airdrop_log(0);
      v13 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1001B63B8();
    }
    else
    {
      v12 = airdrop_log(TypeID);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1001B63E4();
    }

  }
}

- (void)sendDiscoverResponse:(int64_t)a3 forKnownAlias:(id)a4
{
  id v6;
  _CFHTTPServerRequest *discoverRequest;
  __CFHTTPMessage *ResponseMessage;
  uint64_t v9;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const void *v23;
  unsigned int v24;
  CFPropertyListFormat v25;
  __CFString **v26;
  CFDataRef v27;
  CFDataRef v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  CFErrorRef error;
  uint8_t buf[4];
  int64_t v36;

  v6 = a4;
  discoverRequest = self->_discoverRequest;
  if (discoverRequest)
  {
    ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage(discoverRequest, a3);
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Connection"), CFSTR("close"));
    if (a3 != 200)
    {
      v21 = airdrop_log(v9);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v36 = a3;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Responding to Discover request with code %ld", buf, 0xCu);
      }

      v23 = (const void *)_CFHTTPServerResponseCreateWithData(self->_discoverRequest, ResponseMessage, 0);
      goto LABEL_26;
    }
    v10 = objc_opt_new(NSMutableDictionary);
    if (v6)
    {
      v11 = objc_msgSend((id)objc_opt_class(self), "disambiguatedModelName");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self->_monitor, "myAppleIDValidationRecord"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idSelfIdentity"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, kSFOperationReceiverModelNameKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, kSFOperationReceiverRecordDataKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, kSFOperationReceiverComputerNameKey);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIRKData"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v18, kSFOperationReceiverDeviceIRKDataKey);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "edPKData"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, kSFOperationReceiverEdPKDataKey);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v20, kSFOperationReceiverIDSDeviceIDKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v6, kSFOperationSendersKnownAliasKey);
    }
    else
    {
      if (self->_contactsOnly)
        goto LABEL_10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, kSFOperationReceiverComputerNameKey);
    }

LABEL_10:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", self->_mediaCapabilities, kSFOperationReceiverMediaCapabilitiesKey);
    error = 0;
    v24 = -[SDStatusMonitor enableXML](self->_monitor, "enableXML");
    if (v24)
      v25 = kCFPropertyListXMLFormat_v1_0;
    else
      v25 = kCFPropertyListBinaryFormat_v1_0;
    v26 = off_100719BE0;
    if (!v24)
      v26 = off_100719BD8;
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Content-Type"), *v26);
    v27 = CFPropertyListCreateData(0, v10, v25, 0, &error);
    v28 = v27;
    if (!v27)
    {
      v29 = airdrop_log(0);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_1001B6410();

      CFRelease(error);
    }
    v31 = airdrop_log(v27);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "known";
      if (!v6)
        v33 = "unknown";
      *(_DWORD *)buf = 136315138;
      v36 = (int64_t)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Responding to Discover request from %s person", buf, 0xCu);
    }

    v23 = (const void *)_CFHTTPServerResponseCreateWithData(self->_discoverRequest, ResponseMessage, v28);
    if (v28)
      CFRelease(v28);

LABEL_26:
    _CFHTTPServerResponseEnqueue(v23);
    CFRelease(self->_discoverRequest);
    CFRelease(v23);
    CFRelease(ResponseMessage);
    self->_discoverRequest = 0;
  }

}

- (void)sendAskResponse:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  __CFHTTPMessage *ResponseMessage;
  NSMutableDictionary *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  CFPropertyListFormat v14;
  __CFString **v15;
  CFDataRef Data;
  CFDataRef v17;
  const void *v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE cf[24];

  if (!self->_askRequest)
    return;
  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)a3 <= 399)
    {
      switch((_DWORD)a3)
      {
        case 0x64:
          v7 = CFSTR("Continue (100)");
          goto LABEL_23;
        case 0xC8:
          v7 = CFSTR("OK (200)");
          goto LABEL_23;
        case 0xCC:
          v7 = CFSTR("No Content (204)");
LABEL_23:
          *(_DWORD *)cf = 138412290;
          *(_QWORD *)&cf[4] = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Ask response with code %@", cf, 0xCu);
          goto LABEL_24;
      }
    }
    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            v7 = CFSTR("Bad Request (400)");
            break;
          case 401:
            v7 = CFSTR("Unauthorized (401)");
            break;
          case 403:
            v7 = CFSTR("Forbidden (403)");
            break;
          case 409:
            v7 = CFSTR("Conflict (409)");
            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_23;
      }
      switch((_DWORD)a3)
      {
        case 0x1A1:
          v7 = CFSTR("Expectation Failed (417)");
          goto LABEL_23;
        case 0x1F4:
          v7 = CFSTR("Server Fail (500)");
          goto LABEL_23;
        case 0x1FB:
          v7 = CFSTR("Insufficient Storage (507)");
          goto LABEL_23;
      }
    }
LABEL_22:
    v7 = CFSTR("?");
    goto LABEL_23;
  }
LABEL_24:

  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage(self->_askRequest, a3);
  if (a3 == 200)
  {
    *(_QWORD *)cf = 0;
    v9 = objc_opt_new(NSMutableDictionary);
    v10 = objc_msgSend((id)objc_opt_class(self), "disambiguatedModelName");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, kSFOperationReceiverModelNameKey);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, kSFOperationReceiverComputerNameKey);

    v13 = -[SDStatusMonitor enableXML](self->_monitor, "enableXML");
    if (v13)
      v14 = kCFPropertyListXMLFormat_v1_0;
    else
      v14 = kCFPropertyListBinaryFormat_v1_0;
    v15 = off_100719BE0;
    if (!v13)
      v15 = off_100719BD8;
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Content-Type"), *v15);
    Data = CFPropertyListCreateData(0, v9, v14, 0, (CFErrorRef *)cf);
    if (Data)
    {
      v17 = Data;
      v18 = (const void *)_CFHTTPServerResponseCreateWithData(self->_askRequest, ResponseMessage, Data);
      CFRelease(v17);
    }
    else
    {
      v19 = airdrop_log(0);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1001B6410();

      CFRelease(*(CFTypeRef *)cf);
      v18 = (const void *)_CFHTTPServerResponseCreateWithData(self->_askRequest, ResponseMessage, 0);
    }

  }
  else
  {
    v18 = (const void *)_CFHTTPServerResponseCreateWithData(self->_askRequest, ResponseMessage, 0);
  }
  _CFHTTPServerResponseEnqueue(v18);
  CFRelease(self->_askRequest);
  CFRelease(v18);
  CFRelease(ResponseMessage);
  self->_askRequest = 0;
}

- (void)releaseIdleSleepAssertion
{
  uint64_t v3;
  NSObject *v4;
  unsigned int powerAssertionID;
  unsigned int v6;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD block[4];
  unsigned int v10;
  uint8_t buf[4];
  unsigned int v12;

  if (self->_powerAssertionID)
  {
    v3 = airdrop_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 67109120;
      v12 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    v6 = self->_powerAssertionID;
    self->_powerAssertionID = 0;
    v7 = sub_10019AAC0(3.0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B1C6C;
    block[3] = &unk_100715630;
    v10 = v6;
    dispatch_after(v7, queue, block);
  }
}

- (void)sendUploadResponse:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  CFDataRef v8;
  int v9;
  const __CFString *v10;

  if (self->_uploadRequest)
  {
    v5 = airdrop_log(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      v8 = CFDataCreate(0, 0, 0);
      -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", self->_uploadRequest, a3, v8);
      -[SDAirDropConnection releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
      CFRelease(self->_uploadRequest);
      CFRelease(v8);
      self->_uploadRequest = 0;
      return;
    }
    if ((int)a3 <= 399)
    {
      switch((_DWORD)a3)
      {
        case 0x64:
          v7 = CFSTR("Continue (100)");
          goto LABEL_23;
        case 0xC8:
          v7 = CFSTR("OK (200)");
          goto LABEL_23;
        case 0xCC:
          v7 = CFSTR("No Content (204)");
LABEL_23:
          v9 = 138412290;
          v10 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Upload response with code %@", (uint8_t *)&v9, 0xCu);
          goto LABEL_24;
      }
    }
    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            v7 = CFSTR("Bad Request (400)");
            break;
          case 401:
            v7 = CFSTR("Unauthorized (401)");
            break;
          case 403:
            v7 = CFSTR("Forbidden (403)");
            break;
          case 409:
            v7 = CFSTR("Conflict (409)");
            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_23;
      }
      switch((_DWORD)a3)
      {
        case 0x1A1:
          v7 = CFSTR("Expectation Failed (417)");
          goto LABEL_23;
        case 0x1F4:
          v7 = CFSTR("Server Fail (500)");
          goto LABEL_23;
        case 0x1FB:
          v7 = CFSTR("Insufficient Storage (507)");
          goto LABEL_23;
      }
    }
LABEL_22:
    v7 = CFSTR("?");
    goto LABEL_23;
  }
}

- (__SFNode)createPersonForAskRequest
{
  __CFString *v3;
  const __CFString *v4;
  NSObject *v5;
  __SFNode *v6;
  __SecIdentity *v7;
  __SecIdentity *v8;
  void *v9;
  void *v10;
  __SecTrust *clientTrust;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  int Boolean;
  uint64_t v31;
  CFNumberRef v32;
  uint8_t v34[24];

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIDKey));
  v4 = sub_10005009C(v3);
  if ((_DWORD)v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderComputerNameKey));
    if (!-[NSObject length](v5, "length"))
    {
      v13 = airdrop_log(0);
      v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_ERROR))
        sub_1001B6470();
      v6 = 0;
      goto LABEL_32;
    }
    v6 = (__SFNode *)SFNodeCreate(0, v5, v3);
    v7 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderModelNameKey));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderRecordDataKey));
      if (self->_clientTrust)
      {
        SFNodeSetModel(v6, v9);
        clientTrust = self->_clientTrust;
      }
      else
      {
        clientTrust = 0;
      }
      v15 = sub_10004FF2C(v10, clientTrust, (uint64_t)v6);
      CFRelease(v8);

    }
    v14 = objc_opt_new(NSMutableDictionary);
    v16 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIconHashKey));
    v17 = (void *)v16;
    if (!v16)
    {
LABEL_29:
      Boolean = GestaltGetBoolean(CFSTR("R1Capability"), 0, 0);
      v31 = 2023;
      if (!Boolean)
        v31 = 999;
      *(_QWORD *)v34 = v31;
      v32 = CFNumberCreate(0, kCFNumberLongType, v34);
      SFNodeSetFlags(v6, v32);
      SFNodeAddKind(v6, kSFNodeKindPerson);
      SFNodeAddKind(v6, kSFNodeKindBonjour);
      SFNodeSetDomain(v6, CFSTR("local"));
      SFNodeSetServiceName(v6, v3);
      SFNodeSetComputerName(v6, v5);
      sub_10004EA58((uint64_t)v6, 0, v14, 0);
      CFRelease(v32);

LABEL_32:
      goto LABEL_33;
    }
    v18 = airdrop_log(v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection: icon hash is available for %@", v34, 0xCu);
    }

    SFNodeSetIconHash(v6, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIconKey));
    v21 = v20;
    if (!v20)
    {
      v26 = airdrop_log(0);
      v24 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1001B649C();
      goto LABEL_28;
    }
    v22 = sub_10019B410(v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if (v23)
    {
      v25 = -[NSObject isEqual:](v23, "isEqual:", v17);
      if ((_DWORD)v25)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v21, v17);
LABEL_28:

        goto LABEL_29;
      }
      v29 = airdrop_log(v25);
      v28 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1001B64F4();
    }
    else
    {
      v27 = airdrop_log(0);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1001B64C8();
    }

    goto LABEL_28;
  }
  v12 = airdrop_log(v4);
  v5 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1001B6520();
  v6 = 0;
LABEL_33:

  return v6;
}

- (void)logSenderIsBlocked
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self->_monitor, "myAppleID"));
  SFMetricsLogUnexpectedEvent(5, -[SDAirDropConnection senderIsMe](self, "senderIsMe"), v3);

}

- (BOOL)senderIsBlocked
{
  void *v3;
  __SecTrust *clientTrust;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  _BOOL8 v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderRecordDataKey));
  clientTrust = self->_clientTrust;
  v23 = 0;
  v24 = 0;
  sub_10004F3B0(v3, clientTrust, 0, &v24, &v23);
  v5 = v24;
  v6 = v23;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor contactsForEmailHash:phoneHash:](self->_monitor, "contactsForEmailHash:phoneHash:", v5, v6));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (v13)
        {
          v14 = -[SDStatusMonitor contactIsBlocked:](self->_monitor, "contactIsBlocked:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), (_QWORD)v19);
          if (v14)
          {
            v16 = airdrop_log(v14);
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_1001B6580(v8, v13, v17);

            -[SDAirDropConnection logSenderIsBlocked](self, "logSenderIsBlocked");
            v15 = 1;
            goto LABEL_14;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)senderIsTrusted:(id)a3
{
  id v4;
  __CFArray *v5;
  __CFArray *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v16;

  v4 = a3;
  v5 = sub_10004F238(self->_clientTrust);
  if (v5)
  {
    v6 = v5;
    v7 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v4));
    if (v7)
    {
      v16 = 0;
      v8 = sub_10020A608(v6, v7, &v16);
      v9 = v16;
      v10 = v9;
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v4, kSFOperationSenderEmailKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSFOperationVerifiableIdentityKey);
      }
      else
      {
        v13 = airdrop_log(v9);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1001B66E0();

      }
    }
    else
    {
      v12 = airdrop_log(0);
      v10 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001B66B4();
      LOBYTE(v8) = 0;
    }

    CFRelease(v6);
  }
  else
  {
    v11 = airdrop_log(0);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001B6654();
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)senderIsMe
{
  __SecTrust *clientTrust;
  __CFArray *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  NSObject *v31;
  id v32;
  int v33;

  clientTrust = self->_clientTrust;
  if (clientTrust)
  {
    v4 = sub_10004F238(clientTrust);
    if (!-[__CFArray count](v4, "count"))
    {
      v16 = airdrop_log(0);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1001B6740();

      v15 = 0;
      goto LABEL_22;
    }
    v33 = 0;
    v5 = SFAppleIDVerifyCertificateChainSync(v4, &v33);
    if ((_DWORD)v5)
      v6 = v33 == 0;
    else
      v6 = 0;
    if (!v6)
    {
      v7 = airdrop_log(v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001B684C((uint64_t)&v33, v8, v9, v10, v11, v12, v13, v14);
      v15 = 0;
      goto LABEL_21;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0));

    v32 = 0;
    v19 = SFAppleIDCommonNameForCertificate(v18, &v32);
    v20 = v32;
    v8 = v20;
    v33 = v19;
    if (v19)
    {
      v21 = airdrop_log(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001B67E4((uint64_t)&v33, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      v22 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDCommonName](self->_monitor, "myAppleIDCommonName"));
      if (-[NSObject length](v22, "length"))
      {
        v15 = -[NSObject isEqualToString:](v8, "isEqualToString:", v22);
        goto LABEL_20;
      }
      v30 = airdrop_log(0);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1001B67B8();

    }
    v15 = 0;
LABEL_20:

LABEL_21:
LABEL_22:

    return v15;
  }
  return 0;
}

- (void)silentlyCancelRequestOnMainThread
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B2794;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)convertURLStringsToURLs
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = kSFOperationItemsKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsKey));
  if (v4)
  {
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cuFilteredArrayUsingBlock:", &stru_10071A030));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v5, v3);

    v4 = v6;
  }

}

- (void)parseDiscoverRequest
{
  __CFError *v3;
  __CFError *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  CFErrorRef v12;
  __int16 v13;
  CFErrorRef error;

  error = 0;
  v3 = (__CFError *)CFPropertyListCreateWithData(0, (CFDataRef)self->_requestData, 0, 0, &error);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    TypeID = CFDictionaryGetTypeID();
    v7 = airdrop_log(TypeID);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Parsing Discover request", (uint8_t *)&v13, 2u);
      }

      -[SDAirDropConnection storeDataValue:forKey:](self, "storeDataValue:forKey:", v4, kSFOperationSenderRecordDataKey);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001B6914();

    }
    v12 = v4;
  }
  else
  {
    v10 = airdrop_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001B68B4();

    v12 = error;
  }
  CFRelease(v12);
}

- (void)handleDiscoverRequest
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  __SecIdentity *v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderRecordDataKey));
  v4 = sub_10004FF2C(v3, self->_clientTrust, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_17;
  }
  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS"))
    v6 = 1;
  else
    v6 = -[SDAirDropConnection senderIsTrusted:](self, "senderIsTrusted:", v5);
  v8 = -[SDAirDropConnection senderIsBlocked](self, "senderIsBlocked");
  v9 = v8;
  v7 = 0;
  if (!v6 || (v8 & 1) != 0)
    goto LABEL_10;
  v10 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
  if (v10)
  {
    CFRelease(v10);
    v7 = 1;
LABEL_10:
    if (!v9)
      goto LABEL_17;
    goto LABEL_11;
  }
  v7 = 0;
  if (!v9)
    goto LABEL_17;
LABEL_11:
  v11 = -[SDAirDropConnection senderIsMe](self, "senderIsMe");
  if (!v11)
  {
    v14 = v6 & v7;
    v15 = 401;
    goto LABEL_18;
  }
  v12 = airdrop_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sender is me, ignore self block.", v17, 2u);
  }

LABEL_17:
  v14 = v6 & v7;
  v15 = 200;
LABEL_18:
  if (v14)
    v16 = v5;
  else
    v16 = 0;
  -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", v15, v16);

}

- (void)parseAskRequest
{
  __CFError *v3;
  __CFError *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  CFErrorRef v12;
  __int16 v13;
  CFErrorRef error;

  error = 0;
  v3 = (__CFError *)CFPropertyListCreateWithData(0, (CFDataRef)self->_requestData, 0, 0, &error);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    TypeID = CFDictionaryGetTypeID();
    v7 = airdrop_log(TypeID);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Parsing Ask request", (uint8_t *)&v13, 2u);
      }

      -[SDAirDropConnection storeArrayValue:forKey:](self, "storeArrayValue:forKey:", v4, kSFOperationFilesKey);
      -[SDAirDropConnection storeArrayValue:forKey:](self, "storeArrayValue:forKey:", v4, kSFOperationItemsKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationBundleIDKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationSenderIDKey);
      -[SDAirDropConnection storeDataValue:forKey:](self, "storeDataValue:forKey:", v4, kSFOperationSenderRecordDataKey);
      -[SDAirDropConnection storeIconValue:forKey:](self, "storeIconValue:forKey:", v4, kSFOperationFileIconKey);
      -[SDAirDropConnection storeIconValue:forKey:](self, "storeIconValue:forKey:", v4, kSFOperationSmallFileIconKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationSenderModelNameKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationItemsDescriptionKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationSenderComputerNameKey);
      -[SDAirDropConnection convertURLStringsToURLs](self, "convertURLStringsToURLs");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1001B6914();

    }
    v12 = v4;
  }
  else
  {
    v10 = airdrop_log(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001B68B4();

    v12 = error;
  }
  CFRelease(v12);
}

- (BOOL)allowAskRequestFromPerson:(__SFNode *)a3
{
  NSObject *v4;
  _BOOL8 v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;

  if (!a3)
  {
    v7 = airdrop_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1001B6940();
    goto LABEL_6;
  }
  v4 = SFNodeCopyAppleID(a3);
  v5 = -[SDStatusMonitor disableTLS](self->_monitor, "disableTLS");
  if (!v5)
  {
    if (v4)
    {
      v6 = -[SDAirDropConnection senderIsTrusted:](self, "senderIsTrusted:", v4);
      goto LABEL_9;
    }
    if (self->_contactsOnly)
    {
      v9 = airdrop_log(v5);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001B696C();

LABEL_6:
      v6 = 0;
      goto LABEL_9;
    }
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)transferContainsPhotosAssetBundles
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFilesKey));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = kSFOperationFileTypeKey;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v7, (_QWORD)v13));
        v10 = SFIsPhotosAssetBundle();

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)adjustPropertiesForAutoAcceptSenderIsMe:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  SDStatusMonitor *monitor;
  unsigned int v7;
  unsigned int v8;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v3 = a3;
  v5 = -[SDStatusMonitor disableAutoAccept](self->_monitor, "disableAutoAccept");
  monitor = self->_monitor;
  if (v5)
  {
    -[SDStatusMonitor disableAutoAcceptForPhotosAssetBundles](monitor, "disableAutoAcceptForPhotosAssetBundles");
    return;
  }
  v7 = -[SDStatusMonitor alwaysAutoAccept](monitor, "alwaysAutoAccept") || v3;
  v8 = -[SDStatusMonitor disableAutoAcceptForPhotosAssetBundles](self->_monitor, "disableAutoAcceptForPhotosAssetBundles");
  if (v7 != 1 || v8 == 0)
  {
    if (!v7)
      return;
LABEL_15:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSFOperationAutoAcceptKey);
    return;
  }
  v10 = -[SDAirDropConnection transferContainsPhotosAssetBundles](self, "transferContainsPhotosAssetBundles");
  if (!v10)
    goto LABEL_15;
  v11 = airdrop_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SDAirDropConnection: Prevented auto-accept because transfer contains All Photos Data Photos bundles.", v13, 2u);
  }

}

- (void)adjustPropertiesForPhotosBundles
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  SDAirDropConnection *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_opt_new(NSMutableArray);
  v16 = self;
  v15 = kSFOperationFilesKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = kSFOperationFileTypeKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));
        if (SFIsPhotosAssetBundle())
        {
          v12 = objc_msgSend(v10, "mutableCopy");
          v13 = v12;
          v14 = CFSTR("com.apple.photos.asset-bundle");
LABEL_8:
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v8);
          -[NSMutableArray addObject:](v3, "addObject:", v13);

          goto LABEL_13;
        }
        if (SFIsLivePhotos(v11) && objc_msgSend(v11, "isEqualToString:", kUTTypeFolder))
        {
          v12 = objc_msgSend(v10, "mutableCopy");
          v13 = v12;
          v14 = CFSTR("com.apple.private.live-photo-bundle");
          goto LABEL_8;
        }
        -[NSMutableArray addObject:](v3, "addObject:", v10);
LABEL_13:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_properties, "setObject:forKeyedSubscript:", v3, v15);

}

- (void)handleAskRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __SFNode *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *Name;
  void *v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *queue;
  void *v22;
  uint64_t v23;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIDKey));
  if (v3)
  {
    v4 = kSFOperationFilesKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFilesKey));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsKey));
    if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      v7 = -[SDAirDropConnection createPersonForAskRequest](self, "createPersonForAskRequest");
      self->_person = v7;
      v8 = -[SDAirDropConnection allowAskRequestFromPerson:](self, "allowAskRequestFromPerson:", v7);
      if (v8)
      {
        v9 = -[SDAirDropConnection senderIsMe](self, "senderIsMe");
        if (-[SDStatusMonitor finderAirDropEnabled](self->_monitor, "finderAirDropEnabled"))
        {
          self->_personAdded = 1;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](SDConnectedBrowser, "sharedBrowser"));
          objc_msgSend(v10, "addAirDropPerson:", self->_person);
          v11 = 0.3;
        }
        else
        {
          v10 = (void *)SFNodeCopyIconData(self->_person);
          if (!v10)
          {
            v10 = sub_10004E578(0, 0, 0, 0);
            if (!v10)
            {
              v11 = 0.0;
              goto LABEL_16;
            }
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, kSFOperationSenderIconKey);
          v11 = 0.0;
        }

LABEL_16:
        Name = (void *)SFNodeCopyLastName(self->_person);
        v17 = (void *)SFNodeCopyFirstName(self->_person);
        v18 = (void *)SFNodeCopyDisplayName(self->_person);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", Name, kSFOperationSenderLastNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v17, kSFOperationSenderFirstNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v18, kSFOperationSenderCompositeNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", self->_person, kSFOperationSenderNodeKey);
        -[SDAirDropConnection adjustPropertiesForAutoAcceptSenderIsMe:](self, "adjustPropertiesForAutoAcceptSenderIsMe:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v19, kSFOperationSenderIsMeKey);

        -[SDAirDropConnection adjustPropertiesForPhotosBundles](self, "adjustPropertiesForPhotosBundles");
        v20 = sub_10019AAC0(v11);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001B3594;
        block[3] = &unk_1007146D8;
        block[4] = self;
        dispatch_after(v20, queue, block);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v4));
        if (!objc_msgSend(v22, "count"))
          -[SDAirDropConnection releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");

        goto LABEL_22;
      }
      v14 = airdrop_log(v8);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1001B69F0();
    }
    else
    {
      v23 = airdrop_log(0);
      v15 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1001B69C4();
    }

    -[SDAirDropConnection silentlyCancelRequestOnMainThread](self, "silentlyCancelRequestOnMainThread");
LABEL_22:

    goto LABEL_23;
  }
  v12 = airdrop_log(0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1001B6998();

  -[SDAirDropConnection silentlyCancelRequestOnMainThread](self, "silentlyCancelRequestOnMainThread");
LABEL_23:

}

- (void)cancelAndDecline
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:");
  if (self->_discoverRequest)
  {
    -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", 500, 0);
  }
  else
  {
    -[SDAirDropConnection sendAskResponse:](self, "sendAskResponse:", 500);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
  }

}

- (void)processRequest
{
  id WeakRetained;
  _CFHTTPServerConnection *connection;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    connection = self->_connection;

    if (connection)
    {
      if (!self->_clientTrust)
        self->_clientTrust = (__SecTrust *)_CFHTTPServerConnectionCopyProperty(self->_connection, _kCFHTTPServerConnectionClientTrust);
      if (self->_discoverRequest)
      {
        -[SDAirDropConnection parseDiscoverRequest](self, "parseDiscoverRequest");
        -[SDAirDropConnection handleDiscoverRequest](self, "handleDiscoverRequest");
        return;
      }
      -[SDAirDropConnection parseAskRequest](self, "parseAskRequest");
      -[SDAirDropConnection handleAskRequest](self, "handleAskRequest");
      goto LABEL_10;
    }
  }
  if (!self->_discoverRequest)
LABEL_10:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
}

- (void)handleReadStreamEvent:(__CFReadStream *)a3 event:(unint64_t)a4
{
  CFIndex v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  if (a4 == 16)
  {
    if (self->_endEncountered)
    {
      v7 = airdrop_log(self);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection: kCFStreamEventEndEncountered fired again", v18, 2u);
      }

    }
    else
    {
      self->_endEncountered = 1;
      -[SDAirDropConnection processRequest](self, "processRequest", a3);
    }
    return;
  }
  if (a4 == 8)
  {
LABEL_6:
    -[SDAirDropConnection cancelAndDecline](self, "cancelAndDecline", a3);
    return;
  }
  if (a4 != 2)
  {
    v9 = airdrop_log(self);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6A1C(a4, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_13;
  }
  v6 = CFReadStreamRead(a3, (UInt8 *)self->_requestBuffer, 0x8000);
  if (v6 < 1)
  {
    if ((v6 & 0x8000000000000000) == 0)
      return;
    v17 = airdrop_log(v6);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6A80();
LABEL_13:

    -[SDAirDropConnection cancelAndDecline](self, "cancelAndDecline");
    return;
  }
  -[NSMutableData appendBytes:length:](self->_requestData, "appendBytes:length:", self->_requestBuffer, v6);
  if (-[NSMutableData length](self->_requestData, "length") > 0x100000)
    goto LABEL_6;
}

- (BOOL)startReceivingBody:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  __CFReadStream *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  CFStreamClientContext clientContext;

  v6 = (__CFReadStream *)_CFHTTPServerRequestCopyBodyStream(a3, a2);
  self->_readStream = v6;
  if (!v6)
  {
    v12 = airdrop_log(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1001B6AE0();

    if (!a4)
      return 0;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v8 = 0;
    goto LABEL_11;
  }
  self->_requestBuffer = (char *)malloc_type_malloc(0x8000uLL, 0xB8957D49uLL);
  clientContext.version = 0;
  clientContext.info = self;
  clientContext.retain = (void *(__cdecl *)(void *))&_CFRetain;
  clientContext.release = (void (__cdecl *)(void *))&_CFRelease;
  clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
  CFReadStreamSetClient(self->_readStream, 0x1AuLL, (CFReadStreamClientCallBack)sub_1001B39B0, &clientContext);
  CFReadStreamSetDispatchQueue(self->_readStream, (dispatch_queue_t)self->_queue);
  v7 = CFReadStreamOpen(self->_readStream);
  v8 = (_DWORD)v7 != 0;
  if (!(_DWORD)v7)
  {
    v9 = airdrop_log(v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001B6B0C();

    if (a4)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 12, 0));
LABEL_11:
      *a4 = v11;
    }
  }
  return v8;
}

- (id)compressionType
{
  void *v2;
  __CFString **v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", CFSTR("Content-Type")));
  if ((objc_msgSend(v2, "isEqual:", CFSTR("application/zip")) & 1) != 0)
  {
    v3 = off_100719BA0;
  }
  else if ((objc_msgSend(v2, "isEqual:", CFSTR("application/x-cpio")) & 1) != 0)
  {
    v3 = off_100719B98;
  }
  else
  {
    if (!objc_msgSend(v2, "isEqual:", CFSTR("application/x-dvzip")))
    {
      v4 = 0;
      goto LABEL_8;
    }
    v3 = off_100719BA8;
  }
  v4 = *v3;
LABEL_8:

  return v4;
}

- (BOOL)startReceivingFile:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  uint64_t v6;
  const void *v7;
  NSURL *destination;
  BOOL v9;
  SDAirDropFileZipper *v10;
  SDAirDropFileZipper *zipper;
  void *v12;
  void *v13;
  SDAirDropFileZipper *v14;
  void *v15;
  SDAirDropFileZipper *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;

  v6 = _CFHTTPServerRequestCopyBodyStream(a3, a2);
  if (v6)
  {
    v7 = (const void *)v6;
    destination = self->_destination;
    v9 = destination != 0;
    if (destination)
    {
      v10 = objc_alloc_init(SDAirDropFileZipper);
      zipper = self->_zipper;
      self->_zipper = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropConnection whereFromInfo](self, "whereFromInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      -[SDAirDropFileZipper setSenderName:](self->_zipper, "setSenderName:", v13);

      -[SDAirDropFileZipper setShouldExtractMediaFromPhotosBundles:](self->_zipper, "setShouldExtractMediaFromPhotosBundles:", -[SDAirDropConnection shouldExtractMediaFromPhotosBundles](self, "shouldExtractMediaFromPhotosBundles"));
      location = 0;
      objc_initWeak(&location, self);
      v14 = self->_zipper;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFilesKey));
      v24 = _NSConcreteStackBlock;
      v25 = 3221225472;
      v26 = sub_1001B3D34;
      v27 = &unk_1007193F8;
      objc_copyWeak(&v28, &location);
      -[SDAirDropFileZipper setPlaceholderFiles:withCreationCompletionHandler:](v14, "setPlaceholderFiles:withCreationCompletionHandler:", v15, &v24);

      v16 = self->_zipper;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey, v24, v25, v26, v27));
      -[SDAirDropFileZipper setTotalBytes:](v16, "setTotalBytes:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropConnection compressionType](self, "compressionType"));
      -[SDAirDropFileZipper setUnzipCompressionType:](self->_zipper, "setUnzipCompressionType:", v18);

      -[SDAirDropFileZipper setDestination:](self->_zipper, "setDestination:", self->_destination);
      -[SDAirDropFileZipper setReadStream:](self->_zipper, "setReadStream:", v7);
      -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", self);
      -[SDAirDropFileZipper unzip](self->_zipper, "unzip");
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
    else
    {
      v21 = airdrop_log(v6);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001B6B38();

      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    }
    CFRelease(v7);
  }
  else
  {
    v19 = airdrop_log(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1001B6AE0();

    v9 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  }
  return v9;
}

- (BOOL)thereIsEnoughFreeSpace
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t valuePtr;
  const __CFNumber *propertyValueTypeRefPtr;
  CFErrorRef error;

  if (-[SDStatusMonitor testDiskFull](self->_monitor, "testDiskFull"))
    return 0;
  propertyValueTypeRefPtr = 0;
  error = 0;
  v4 = CFURLCopyResourcePropertyForKey((CFURLRef)self->_destination, kCFURLVolumeAvailableCapacityKey, &propertyValueTypeRefPtr, &error);
  if (!(_DWORD)v4)
  {
    v8 = airdrop_log(v4);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001B6B64();

    CFRelease(error);
    return 1;
  }
  if (!propertyValueTypeRefPtr)
    return 1;
  valuePtr = 0;
  if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "longLongValue");
      v3 = valuePtr > (uint64_t)v7 + 20971520;
    }
    else
    {
      v3 = 1;
    }

  }
  else
  {
    v3 = 1;
  }
  CFRelease(propertyValueTypeRefPtr);
  return v3;
}

- (BOOL)senderInfoAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIDKey));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderComputerNameKey));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)silentlyCancelRequest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 89, 0));
  v5 = kSFOperationErrorKey;
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10, v4);

}

- (void)enqueueResponse:(_CFHTTPServerRequest *)a3 code:(int64_t)a4 body:(__CFData *)a5
{
  __CFHTTPMessage *ResponseMessage;
  __CFHTTPMessage *v9;
  const void *v10;

  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage(a3, a4);
  v9 = ResponseMessage;
  if (a4 != 100)
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, CFSTR("Connection"), CFSTR("close"));
  v10 = (const void *)_CFHTTPServerResponseCreateWithData(a3, v9, a5);
  _CFHTTPServerResponseEnqueue();
  CFRelease(v10);
  CFRelease(v9);
}

- (BOOL)oneHundredContinue:(_CFHTTPServerRequest *)a3
{
  const void *v3;
  const void *v4;
  BOOL v5;

  v3 = (const void *)_CFHTTPServerRequestCopyProperty(a3, CFSTR("Expect"));
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFEqual(v3, CFSTR("100-continue")) != 0;
  CFRelease(v4);
  return v5;
}

- (void)makeDestinationDirectory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  NSURL *v13;
  NSURL *destination;
  uint64_t v15;
  id v16;
  NSFileAttributeKey v17;
  NSFileProtectionType v18;

  v3 = sub_10019BD30();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.AirDrop"), 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", self->_sessionID, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Files"), 1));

  v17 = NSFileProtectionKey;
  v18 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, v8, &v16);
  v11 = v16;

  if (v10)
  {
    v13 = v7;
    destination = self->_destination;
    self->_destination = v13;
  }
  else
  {
    v15 = airdrop_log(v12);
    destination = (NSURL *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(&destination->super, OS_LOG_TYPE_ERROR))
      sub_1001B6BC4();
  }

}

- (void)enqueueBadResponseForRequest:(_CFHTTPServerRequest *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const __CFURL *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;

  if (!self->_discoverRequest)
  {
    if (self->_uploadRequest)
    {
      v7 = airdrop_log(self);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1001B6C7C();
      goto LABEL_7;
    }
    v8 = sub_1001B4354((uint64_t)a3);
    v9 = CFEqual(v8, CFSTR("Upload"));
    if ((_DWORD)v9)
    {
      v10 = airdrop_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1001B6C50();
    }
    else
    {
      if (!self->_askRequest)
      {
LABEL_16:
        CFRelease(v8);
        goto LABEL_8;
      }
      v12 = airdrop_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1001B6C24();
    }

    goto LABEL_16;
  }
  v5 = airdrop_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1001B6CA8();
LABEL_7:

LABEL_8:
  -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400, 0);
}

- (void)didReceiveRequest:(_CFHTTPServerRequest *)a3
{
  const void *v5;
  const void *v6;
  uint64_t v7;
  const __CFURL *v8;
  const __CFURL *v9;
  _CFHTTPServerRequest *v10;
  uint64_t v11;
  NSObject *v12;
  id *v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _CFHTTPServerRequest *v20;
  uint64_t v21;
  NSObject *v22;
  id *v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _CFHTTPServerRequest *v28;
  uint64_t v29;
  NSObject *v30;
  dispatch_queue_global_t v31;
  NSObject *v32;
  _QWORD block[7];
  id v34;
  id obj;
  uint8_t buf[16];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = (const void *)_CFHTTPServerRequestCopyProperty(a3, _kCFHTTPServerRequestMethod);
  if (v5)
  {
    v6 = v5;
    v7 = CFEqual(v5, CFSTR("POST"));
    if ((_DWORD)v7)
    {
      v8 = sub_1001B4354((uint64_t)a3);
      if (v8)
      {
        v9 = v8;
        v37 = 0;
        v38 = &v37;
        v39 = 0x3032000000;
        v40 = sub_1001B483C;
        v41 = sub_1001B484C;
        v42 = 0;
        if (CFEqual(v8, CFSTR("Discover")))
        {
          self->_discover = 1;
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            v10 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_discoverRequest = v10;
            v11 = airdrop_log(v10);
            v12 = objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received Discover request", buf, 2u);
            }

            v13 = (id *)(v38 + 5);
            obj = (id)v38[5];
            v14 = -[SDAirDropConnection startReceivingBody:error:](self, "startReceivingBody:error:", a3, &obj);
            objc_storeStrong(v13, obj);
            if ((v14 & 1) == 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v38[5], kSFOperationErrorKey);
              -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", 500, 0);
            }
            goto LABEL_32;
          }
        }
        else if (CFEqual(v9, CFSTR("Ask")))
        {
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            self->_transactionStarted = 1;
            -[SDAirDropConnection makeDestinationDirectory](self, "makeDestinationDirectory");
            -[SDStatusMonitor airDropTransactionBegin:](self->_monitor, "airDropTransactionBegin:", 0);
            v20 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_askRequest = v20;
            v21 = airdrop_log(v20);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received Ask request", buf, 2u);
            }

            v23 = (id *)(v38 + 5);
            v34 = (id)v38[5];
            v24 = -[SDAirDropConnection startReceivingBody:error:](self, "startReceivingBody:error:", a3, &v34);
            objc_storeStrong(v23, v34);
            if ((v24 & 1) == 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v38[5], kSFOperationErrorKey);
              -[SDAirDropConnection sendAskResponse:](self, "sendAskResponse:", 500);
              dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
            }
            goto LABEL_32;
          }
        }
        else
        {
          v25 = CFEqual(v9, CFSTR("Upload"));
          if (!(_DWORD)v25)
          {
            v26 = airdrop_log(v25);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              sub_1001B6D58();

            -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400, 0);
            goto LABEL_32;
          }
          if (!self->_discoverRequest && !self->_uploadRequest && (self->_askRequest || self->_userAccepted))
          {
            v28 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_uploadRequest = v28;
            v29 = airdrop_log(v28);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received Upload request", buf, 2u);
            }

            v31 = sub_10019AB98();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1001B4854;
            block[3] = &unk_10071A058;
            block[4] = self;
            block[5] = &v37;
            block[6] = a3;
            dispatch_async(v32, block);

            goto LABEL_32;
          }
        }
        -[SDAirDropConnection enqueueBadResponseForRequest:](self, "enqueueBadResponseForRequest:", a3);
LABEL_32:
        CFRelease(v9);
        _Block_object_dispose(&v37, 8);

        goto LABEL_33;
      }
      v19 = airdrop_log(0);
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1001B6D2C();
    }
    else
    {
      v17 = airdrop_log(v7);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1001B6D00();
    }

    -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400, 0);
LABEL_33:
    CFRelease(v6);
    return;
  }
  v15 = airdrop_log(0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_1001B6CD4();

  -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400, 0);
}

- (int64_t)getStatusCode:(_CFHTTPServerResponse *)a3
{
  __CFHTTPMessage *v3;
  __CFHTTPMessage *v4;
  CFIndex ResponseStatusCode;

  v3 = (__CFHTTPMessage *)_CFHTTPServerResponseCopyProperty(a3, _kCFHTTPServerResponseMessage);
  if (!v3)
    return -1;
  v4 = v3;
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(v3);
  CFRelease(v4);
  return ResponseStatusCode;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  usleep(0x186A0u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B4D40;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)finishOperation
{
  dispatch_queue_global_t v3;
  NSObject *v4;
  _QWORD block[5];

  self->_delayedFinish = 1;
  v3 = sub_10019AB98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B4E0C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)didSendResponse:(_CFHTTPServerResponse *)a3 forRequest:(_CFHTTPServerRequest *)a4
{
  id WeakRetained;
  int64_t v8;
  int64_t v9;
  void *v10;
  const void *v11;
  const void *v12;
  uint64_t v13;
  const __CFURL *v14;
  const __CFURL *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v8 = -[SDAirDropConnection getStatusCode:](self, "getStatusCode:", a3);
    if (v8 == 400)
    {
      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
      return;
    }
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationErrorKey));

    if (v10)
    {
      -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);
      return;
    }
    v11 = (const void *)_CFHTTPServerRequestCopyProperty(a4, _kCFHTTPServerRequestMethod);
    if (v11)
    {
      v12 = v11;
      v13 = CFEqual(v11, CFSTR("POST"));
      if ((_DWORD)v13)
      {
        v14 = sub_1001B4354((uint64_t)a4);
        if (v14)
        {
          v15 = v14;
          if (CFEqual(v14, CFSTR("Ask")))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFilesKey));
            if (objc_msgSend(v16, "count"))
            {
              self->_startTime = CFAbsoluteTimeGetCurrent();
              -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 5);
              -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", kSFOperationSmallFileIconKey);
              -[NSMutableDictionary removeObjectForKey:](self->_properties, "removeObjectForKey:", kSFOperationFileIconKey);
            }
            else
            {
              -[SDAirDropConnection finishOperation](self, "finishOperation");
            }

          }
          else if (CFEqual(v15, CFSTR("Upload")))
          {
            if (v9 != 100)
              -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 9);
          }
          else
          {
            v22 = CFEqual(v15, CFSTR("Discover"));
            if (!(_DWORD)v22)
            {
              v23 = airdrop_log(v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                sub_1001B6E60();

            }
            -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
          }
          CFRelease(v15);
          goto LABEL_28;
        }
        v21 = airdrop_log(0);
        v20 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1001B6E34();
      }
      else
      {
        v19 = airdrop_log(v13);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1001B6E08();
      }

      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
LABEL_28:
      CFRelease(v12);
      return;
    }
    v17 = airdrop_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001B6DDC();

    -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
  }
  else if (self->_stopDeferred)
  {
    -[SDAirDropConnection stop](self, "stop");
  }
}

- (void)didFailToSendResponse:(_CFHTTPServerResponse *)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (a3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationErrorKey));

      if (v6)
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);
      else
        -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
    }
  }
  else if (self->_stopDeferred)
  {
    -[SDAirDropConnection stop](self, "stop");
  }
}

- (void)handleClosedConnection
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;

  if (self->_delayedFinish)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIDKey));
    v4 = airdrop_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1001B6E8C();

  }
  else
  {
    -[SDAirDropConnection stop](self, "stop");
    v6 = -[SDAirDropConnection senderInfoAvailable](self, "senderInfoAvailable");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSenderIDKey));
      v8 = airdrop_log(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection from %@ closed", (uint8_t *)&v12, 0xCu);
      }

      -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 4);
    }
    else
    {
      v10 = airdrop_log(v6);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection closed (cancel suppressed)", (uint8_t *)&v12, 2u);
      }

      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
    }
  }
}

- (id)whereFromInfo
{
  NSMutableArray *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)SFNodeCopyDisplayName(self->_person);
  v5 = (void *)SFNodeCopyComputerName(self->_person);
  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  if (v5 && (objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    -[NSMutableArray addObject:](v3, "addObject:", v5);

  return v3;
}

- (void)setCombinedFileURLsAndItems:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v5 = kSFOperationItemsKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsKey));
  if (v6)
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);
  -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v4, v5);

}

- (BOOL)transferIsOverPrebufferLimit
{
  BOOL v2;
  void *v3;

  if (self->_userAccepted)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationBytesCopiedKey));
  v2 = (uint64_t)objc_msgSend(v3, "longLongValue") > 629145600;

  return v2;
}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  SDAirDropConnection *v11;
  uint64_t v12;
  id v13;

  v8 = a3;
  switch(a4)
  {
    case 10:
      v13 = v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", a5, kSFOperationErrorKey);
      v11 = self;
      v12 = 500;
LABEL_8:
      -[SDAirDropConnection sendUploadResponse:](v11, "sendUploadResponse:", v12);
LABEL_9:
      v8 = v13;
      break;
    case 9:
      v13 = v8;
      -[SDAirDropConnection setSpotlightMetadata:](self, "setSpotlightMetadata:", a5);
      -[SDAirDropConnection setCombinedFileURLsAndItems:](self, "setCombinedFileURLsAndItems:", a5);
      v11 = self;
      v12 = 200;
      goto LABEL_8;
    case 7:
      v13 = v8;
      sub_1000500BC((__CFDictionary *)self->_properties, (CFDictionaryRef)a5);
      -[SDAirDropConnection storeNumberValue:forKey:](self, "storeNumberValue:forKey:", a5, kSFOperationBytesCopiedKey);
      -[SDAirDropConnection storeNumberValue:forKey:](self, "storeNumberValue:forKey:", a5, kSFOperationTimeRemainingKey);
      if (-[SDAirDropConnection transferIsOverPrebufferLimit](self, "transferIsOverPrebufferLimit"))
      {
        v9 = sub_10005081C(-2, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, kSFOperationErrorKey);
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10);

      }
      else
      {
        v8 = v13;
        if (self->_startTime == 0.0)
          break;
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 7);
      }
      goto LABEL_9;
  }

}

+ (id)disambiguatedModelName
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modelName"));

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("Mac")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelCode"));

    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Mac13,1")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("Mac13,2")))
    {

      v3 = CFSTR("Mac mini");
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Mac14,2")))
    {

      v3 = CFSTR("MacBook Air");
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Mac14,7")))
    {

      v3 = CFSTR("MacBook Pro");
    }

  }
  return v3;
}

- (void)schedule
{
  _CFHTTPServerConnection *connection;
  CFRunLoopRef Main;

  connection = self->_connection;
  Main = CFRunLoopGetMain();
  _CFHTTPServerConnectionScheduleWithRunLoopAndMode(connection, Main, kCFRunLoopDefaultMode);
}

- (void)start
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int powerAssertionID;
  _QWORD v9[5];
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;

  v3 = (OS_os_transaction *)os_transaction_create("SDAirDropConnection");
  transaction = self->_transaction;
  self->_transaction = v3;

  v5 = sub_1000501FC();
  self->_powerAssertionID = v5;
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    powerAssertionID = self->_powerAssertionID;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = powerAssertionID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Power assertion retained (%d)", buf, 8u);
  }

  v9[0] = 0;
  v9[1] = self;
  v9[2] = &_CFRetain;
  v9[3] = &_CFRelease;
  v9[4] = 0;
  *(_OWORD *)buf = unk_10071A078;
  v11 = *(_OWORD *)off_10071A088;
  v12 = *(_OWORD *)&off_10071A098;
  sub_10004DF6C(self->_connection, self);
  _CFHTTPServerConnectionSetClient(self->_connection, v9, buf);
  _CFHTTPServerConnectionSetProperty(self->_connection, _kCFHTTPServerConnectionMaxRequestBufferSize, &off_10074BA30);
}

- (BOOL)accept
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B5AE4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)stop
{
  _CFHTTPServerRequest *askRequest;
  _CFHTTPServerRequest *discoverRequest;
  _CFHTTPServerRequest *uploadRequest;
  SDAirDropFileZipper *zipper;
  SDAirDropFileZipper *v7;
  __CFReadStream *readStream;
  _CFHTTPServerConnection *connection;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _CFHTTPServerConnection *v13;
  id v14;
  NSObject *v15;
  void *v16;
  OS_os_transaction *transaction;
  int v18;
  _CFHTTPServerConnection *v19;

  askRequest = self->_askRequest;
  if (!askRequest)
  {
    discoverRequest = self->_discoverRequest;
    if (!discoverRequest)
      goto LABEL_8;
    if (!self->_connectionClosed)
    {
      self->_stopDeferred = 1;
      -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", 401, 0);
      goto LABEL_27;
    }
LABEL_7:
    CFRelease(discoverRequest);
    self->_discoverRequest = 0;
    goto LABEL_8;
  }
  if (!self->_connectionClosed)
  {
    self->_stopDeferred = 1;
    -[SDAirDropConnection sendAskResponse:](self, "sendAskResponse:", 401);
    goto LABEL_27;
  }
  CFRelease(askRequest);
  self->_askRequest = 0;
  discoverRequest = self->_discoverRequest;
  if (discoverRequest)
    goto LABEL_7;
LABEL_8:
  uploadRequest = self->_uploadRequest;
  if (uploadRequest)
  {
    CFRelease(uploadRequest);
    self->_uploadRequest = 0;
  }
  zipper = self->_zipper;
  if (zipper)
  {
    -[SDAirDropFileZipper setDelegate:](zipper, "setDelegate:", 0);
    -[SDAirDropFileZipper stop](self->_zipper, "stop");
    v7 = self->_zipper;
    self->_zipper = 0;

  }
  readStream = self->_readStream;
  if (readStream)
  {
    CFReadStreamSetClient(readStream, 0, 0, 0);
    CFReadStreamSetDispatchQueue(self->_readStream, 0);
    CFReadStreamClose(self->_readStream);
    CFRelease(self->_readStream);
    self->_readStream = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    v10 = sub_10004E038(connection);
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_connection;
      v18 = 134217984;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalidated AirDrop connection %p", (uint8_t *)&v18, 0xCu);
    }

    _CFHTTPServerConnectionInvalidate(self->_connection);
    CFRelease(self->_connection);
    self->_connection = 0;
  }
  if (self->_queueSuspended)
  {
    sub_10004DE48(self);
    v14 = sub_10004D994();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    dispatch_resume(v15);

    self->_queueSuspended = 0;
  }
  if (self->_personAdded)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](SDConnectedBrowser, "sharedBrowser"));
    objc_msgSend(v16, "removeAirDropPerson:", self->_person);

    self->_personAdded = 0;
  }
  if (self->_transactionStarted)
  {
    self->_transactionStarted = 0;
    -[SDStatusMonitor airDropTransactionEnd:](self->_monitor, "airDropTransactionEnd:", 0);
  }
  -[SDAirDropConnection releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
LABEL_27:
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (NSURL)destination
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropConnectionDelegate)delegate
{
  return (SDAirDropConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mediaCapabilities, 0);
  objc_storeStrong((id *)&self->_askSemaphore, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_zipper, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end

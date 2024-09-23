@implementation SDHotspotBrowser

+ (id)sharedBrowser
{
  if (qword_1007C6648 != -1)
    dispatch_once(&qword_1007C6648, &stru_100715B88);
  return (id)qword_1007C6640;
}

- (SDHotspotBrowser)init
{
  SDHotspotBrowser *v2;
  SDHotspotBrowser *v3;
  NSString *altDSID;
  NSString *timeString;
  SFRemoteHotspotClient *clientProxy;
  NSString *targetIdentifier;
  PCPersistentTimer *nextCrossoverPersistentTimer;
  NSMutableDictionary *v9;
  NSMutableDictionary *handlers;
  uint64_t v11;
  SDStatusMonitor *monitor;
  NSMutableDictionary *v13;
  NSMutableDictionary *discoveredDevices;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *retrieveTimers;
  NSDate *browseStartTime;
  NSMutableDictionary *v20;
  NSMutableDictionary *outstandingRequests;
  void *v22;
  uint64_t v23;
  NSString *modelCode;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SDHotspotBrowser;
  v2 = -[SDHotspotBrowser init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    v2->_IDHash = 0;
    altDSID = v2->_altDSID;
    v2->_altDSID = 0;

    timeString = v3->_timeString;
    v3->_timeString = 0;

    clientProxy = v3->_clientProxy;
    v3->_clientProxy = 0;

    targetIdentifier = v3->_targetIdentifier;
    v3->_targetIdentifier = 0;

    nextCrossoverPersistentTimer = v3->_nextCrossoverPersistentTimer;
    v3->_nextCrossoverPersistentTimer = 0;

    *(_DWORD *)&v3->_shouldBeConsumerScanning = 0;
    v9 = objc_opt_new(NSMutableDictionary);
    handlers = v3->_handlers;
    v3->_handlers = v9;

    v3->_powerAssertionID = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v11;

    v13 = objc_opt_new(NSMutableDictionary);
    discoveredDevices = v3->_discoveredDevices;
    v3->_discoveredDevices = v13;

    v15 = dispatch_queue_create("com.apple.SDHotspotBrowser-work", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v15;

    v17 = objc_opt_new(NSMutableDictionary);
    retrieveTimers = v3->_retrieveTimers;
    v3->_retrieveTimers = v17;

    *(_DWORD *)&v3->_targetAdvertising = 0;
    browseStartTime = v3->_browseStartTime;
    v3->_browseStartTime = 0;

    v20 = objc_opt_new(NSMutableDictionary);
    outstandingRequests = v3->_outstandingRequests;
    v3->_outstandingRequests = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "modelCode"));
    modelCode = v3->_modelCode;
    v3->_modelCode = (NSString *)v23;

  }
  return v3;
}

- (void)activate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000770F4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007720C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setHotspotManager:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100077364;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)setIdsService:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDHotspotBrowser *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000773EC;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)setProducerScanEnabled:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000774B8;
  v4[3] = &unk_100715BB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (void)setd2dEncryptionAvailable:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100077604;
  v4[3] = &unk_100715BB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

- (BOOL)isTetheringInUse
{
  return -[SDHotspotManager isTetheringInUse](self->_hotspotManager, "isTetheringInUse");
}

- (void)disableTethering
{
  -[SDHotspotManager disableMISImmediately](self->_hotspotManager, "disableMISImmediately");
}

- (id)hotspotName
{
  return -[SDHotspotManager hotspotName](self->_hotspotManager, "hotspotName");
}

- (id)hotspotPassword
{
  return -[SDHotspotManager hotspotPassword](self->_hotspotManager, "hotspotPassword");
}

- (id)accountAltDSID
{
  void *v3;
  NSString *v4;
  NSString *altDSID;

  if (self->_hasAppleID && !self->_altDSID)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "myAltDSID"));
    altDSID = self->_altDSID;
    self->_altDSID = v4;

  }
  return self->_altDSID;
}

- (void)clearAccountAltDSID
{
  NSString *altDSID;

  altDSID = self->_altDSID;
  self->_altDSID = 0;

}

- (void)updateHasAppleID
{
  _BOOL4 hasAppleID;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  hasAppleID = self->_hasAppleID;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  self->_hasAppleID = objc_msgSend(v4, "signedIntoPrimaryiCloudAccount");

  if (hasAppleID != self->_hasAppleID)
  {
    v6 = tethering_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasAppleID)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated has Apple ID = %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)updateIDHashAndRestart
{
  if (-[SDHotspotBrowser updateIDHash](self, "updateIDHash"))
  {
    if (self->_hasAppleID)
    {
      -[SDHotspotBrowser restartAdvertisingTetheringRequest](self, "restartAdvertisingTetheringRequest");
      -[SDHotspotBrowser restartProducerScanning](self, "restartProducerScanning");
    }
    else
    {
      -[SDHotspotBrowser stopAdvertisingResponse](self, "stopAdvertisingResponse");
      -[SDHotspotBrowser stopAdvertisingTetheringRequest](self, "stopAdvertisingTetheringRequest");
      -[SDHotspotBrowser stopConsumerScanning](self, "stopConsumerScanning");
      -[SDHotspotBrowser stopProducerScanning](self, "stopProducerScanning");
    }
  }
}

- (BOOL)updateIDHash
{
  unsigned int *p_IDHash;
  unsigned int IDHash;
  unsigned int v5;
  NSString *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  BOOL v28;
  const __CFString *v30;
  int v31;
  _BYTE v32[18];

  p_IDHash = &self->_IDHash;
  IDHash = self->_IDHash;
  v5 = -[SDHotspotBrowser updateTimeString](self, "updateTimeString");
  v6 = self->_altDSID;
  v7 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser accountAltDSID](self, "accountAltDSID"));
  v8 = (void *)v7;
  if (self->_hasAppleID)
  {
    v9 = v6;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

      if (!v5)
        goto LABEL_11;
    }
    else
    {
      if ((v9 == 0) != (v10 != 0))
      {
        v12 = -[NSString isEqual:](v9, "isEqual:", v10);

        if ((v12 & 1) != 0)
        {
          if (v5)
            goto LABEL_18;
LABEL_11:
          v16 = tethering_log(v13);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
LABEL_23:

            goto LABEL_24;
          }
          v18 = v9;
          v19 = v11;
          if (v9 == v11)
          {

          }
          else
          {
            v20 = v19;
            if ((v18 == 0) == (v19 != 0))
            {

LABEL_30:
              v30 = CFSTR("YES");
              goto LABEL_31;
            }
            v21 = -[NSString isEqual:](v18, "isEqual:", v19);

            if (!v21)
              goto LABEL_30;
          }
          v30 = CFSTR("NO");
LABEL_31:
          v31 = 138412546;
          *(_QWORD *)v32 = CFSTR("NO");
          *(_WORD *)&v32[8] = 2112;
          *(_QWORD *)&v32[10] = v30;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not updating hash (time updated = %@, id updated = %@)", (uint8_t *)&v31, 0x16u);
          goto LABEL_23;
        }
      }
      else
      {

      }
      -[SDHotspotBrowser generateNextDayTimeOffset](self, "generateNextDayTimeOffset");
    }
LABEL_18:
    v17 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser HMACWithDSID:timeString:](self, "HMACWithDSID:timeString:", v11, self->_timeString));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject subdataWithRange:](v17, "subdataWithRange:", 0, 4));
    self->_IDHash = 0;
    objc_msgSend(v22, "getBytes:length:", p_IDHash, 4);
    v23 = tethering_log(-[SDHotspotBrowser clearNextDayTimer](self, "clearNextDayTimer"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_IDHash;
      v26 = CFSTR("YES");
      if (!self->_hasAppleID)
        v26 = CFSTR("NO");
      v31 = 67109378;
      *(_DWORD *)v32 = v25;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Set apple ID hash = %u, _hasAppleID = %@", (uint8_t *)&v31, 0x12u);
    }

    goto LABEL_23;
  }
  v14 = tethering_log(v7);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No apple ID to update hash", (uint8_t *)&v31, 2u);
  }

  -[SDHotspotBrowser clearNextDayTimer](self, "clearNextDayTimer");
  self->_IDHash = 0;
LABEL_24:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));

  if (!v27)
    -[SDHotspotBrowser updateCrossoverTimer](self, "updateCrossoverTimer");
  v28 = IDHash != *p_IDHash;

  return v28;
}

- (BOOL)updateTimeString
{
  void *v3;
  double v4;
  unint64_t v5;
  void *v6;
  id *p_timeString;
  NSString *timeString;
  id v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = ((int)v4 - self->_nextDayTimeOffset) / 0x15180;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v5));
  timeString = self->_timeString;
  p_timeString = (id *)&self->_timeString;
  v9 = objc_msgSend(v6, "isEqualToString:", timeString);
  v10 = (char)v9;
  if ((v9 & 1) != 0)
  {
    v11 = tethering_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *p_timeString;
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      v14 = "Not updating time (old = %@, new = %@)";
      v15 = v12;
      v16 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else
  {
    objc_storeStrong(p_timeString, v6);
    v18 = tethering_log(v17);
    v12 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *p_timeString;
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      v14 = "Updated time string = %@";
      v15 = v12;
      v16 = 12;
      goto LABEL_6;
    }
  }

  return v10 ^ 1;
}

- (id)HMACWithDSID:(id)a3 timeString:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v14;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v7, "UTF8String", 0, 0, 0, 0);
  v9 = objc_msgSend(v7, "length");

  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = objc_msgSend(v10, "length");

  CCHmac(2u, v8, (size_t)v9, v11, (size_t)v12, &v14);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, 32));
}

- (id)appendHashToData:(id)a3 withType:(unsigned __int8)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int IDHash;
  const __CFString *v9;
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v17;
  uint8_t buf[4];
  _QWORD v19[2];

  v5 = a3;
  v6 = tethering_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    IDHash = self->_IDHash;
    v9 = CFSTR("YES");
    if (!self->_hasAppleID)
      v9 = CFSTR("NO");
    *(_DWORD *)buf = 67109378;
    LODWORD(v19[0]) = IDHash;
    WORD2(v19[0]) = 2112;
    *(_QWORD *)((char *)v19 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trying to append apple ID hash = %u, hasAppleID = %@", buf, 0x12u);
  }

  v10 = -[SDHotspotBrowser updateIDHash](self, "updateIDHash");
  if (self->_hasAppleID && self->_IDHash)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", v5);
    v17 = bswap32(self->_IDHash);
    v12 = tethering_log(objc_msgSend(v11, "appendBytes:length:", &v17, 4));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19[0] = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created Blob Data = %@", buf, 0xCu);
    }

  }
  else
  {
    v14 = tethering_log(v10);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007F410();

    v11 = 0;
  }

  return v11;
}

- (id)modelCodeForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser deviceForIdentifier:](self, "deviceForIdentifier:", a3));
  v4 = v3;
  if (v3)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
  else
    v5 = 0;
  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("Unknown");
  v7 = v6;

  return v7;
}

- (id)deviceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pairedPeers
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isDefaultPairedDevice") & 1) == 0
          && -[SDHotspotBrowser pairedPeerIsValid:](self, "pairedPeerIsValid:", v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
          if (v10)
            -[NSMutableArray addObject:](v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)accountHasPairedPeers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isDefaultPairedDevice") & 1) == 0)
        {
          if (-[SDHotspotBrowser pairedPeerIsValid:](self, "pairedPeerIsValid:", v8))
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nsuuid"));

            if (v9)
            {
              v10 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)pairedPeerIsValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  char v8;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  char v14;
  unsigned int v15;
  id v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  v7 = -[SDHotspotBrowser d2dEncryptionAvailable](self, "d2dEncryptionAvailable");
  if ((objc_msgSend(v6, "containsString:", CFSTR("appletv")) & 1) != 0
    || (objc_msgSend(v6, "containsString:", CFSTR("audio")) & 1) != 0)
  {
    v8 = 0;
    goto LABEL_4;
  }
  v10 = v7 ^ 1;
  if (objc_msgSend(v6, "containsString:", CFSTR("watch")))
  {
    if (v4)
    {
      objc_msgSend(v4, "operatingSystemVersion");
      if (v23 < 6)
        v11 = 1;
      else
        v11 = v7;
      if (v11 != 1)
      {
LABEL_22:
        v8 = 1;
        goto LABEL_4;
      }
      v12 = objc_msgSend(v6, "containsString:", CFSTR("mac"));
      goto LABEL_13;
    }
    v12 = objc_msgSend(v6, "containsString:", CFSTR("mac"));
  }
  else
  {
    v12 = objc_msgSend(v6, "containsString:", CFSTR("mac"));
    if (v4)
    {
LABEL_13:
      objc_msgSend(v4, "operatingSystemVersion");
      if (v22 == 10)
      {
        objc_msgSend(v4, "operatingSystemVersion");
        v13 = 0;
        if (v21 < 15)
          v14 = 1;
        else
          v14 = v7 ^ 1;
      }
      else
      {
        v13 = 0;
        v14 = v7 ^ 1;
      }
      goto LABEL_20;
    }
  }
  v13 = 1;
  v14 = v7 ^ 1;
LABEL_20:
  if (v12 && (v14 & 1) != 0)
    goto LABEL_22;
  if ((objc_msgSend(v6, "containsString:", CFSTR("iphone")) & 1) != 0
    || objc_msgSend(v6, "containsString:", CFSTR("ipad")))
  {
    if (v13)
    {
      v8 = 1;
      goto LABEL_4;
    }
    objc_msgSend(v4, "operatingSystemVersion");
    v15 = v20 > 12 ? v7 : 0;
    if (v15 != 1)
      goto LABEL_22;
  }
  v16 = objc_msgSend(v6, "containsString:", CFSTR("realitydevice"));
  v17 = (char)v16;
  v18 = tethering_log(v16);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_10007F43C(v17, v10, v19);

  v8 = v17 & v10;
LABEL_4:

  return v8;
}

- (BOOL)accountHasTetheringSources
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isDefaultPairedDevice") & 1) == 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nsuuid"));
          if (objc_msgSend(v8, "supportsTethering"))
            v10 = v9 == 0;
          else
            v10 = 1;
          if (!v10 && -[SDHotspotBrowser tetheringSourceIsValid:](self, "tetheringSourceIsValid:", v8))
          {

            v11 = 1;
            goto LABEL_17;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)tetheringPeers
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isDefaultPairedDevice") & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
          if (objc_msgSend(v9, "supportsTethering"))
            v11 = v10 == 0;
          else
            v11 = 1;
          if (!v11 && -[SDHotspotBrowser tetheringSourceIsValid:](self, "tetheringSourceIsValid:", v9))
            -[NSMutableArray addObject:](v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)tetheringSourceIsValid:(id)a3
{
  return 1;
}

- (BOOL)outstandingRequestsHasHotspotDeviceForID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *outstandingRequests;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (v4)
  {
    outstandingRequests = self->_outstandingRequests;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100078A30;
    v9[3] = &unk_100715BD8;
    v10 = v4;
    v11 = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](outstandingRequests, "enumerateKeysAndObjectsUsingBlock:", v9);

    v7 = *((_BYTE *)v13 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)serviceHasDuplicateForBTUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  int v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 138412290;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "isDefaultPairedDevice", v20) & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nsuuid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

          if (v15)
          {
            v16 = objc_msgSend(v5, "containsObject:", v15);
            if ((_DWORD)v16)
            {
              v17 = tethering_log(v16);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                v26 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Found duplicate entry for BTUUID = %@", buf, 0xCu);
              }

              v10 |= objc_msgSend(v4, "isEqualToString:", v15);
            }
            objc_msgSend(v5, "addObject:", v15);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (void)credentialLog:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;

  v3 = a3;
  if (IsAppleInternalBuild() && sub_1000CE8D0(CFSTR("TetheringCredentialLog"), 0))
  {
    v4 = sub_10019B3B8(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = tethering_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138477827;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Hashed credential = %{private}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (BOOL)bluetoothAllowedForScreenState
{
  BOOL v3;

  v3 = -[SDStatusMonitor screenOn](self->_monitor, "screenOn");
  return -[SDStatusMonitor autoHotspotState](self->_monitor, "autoHotspotState") || v3;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "debugInfoRequested:", CFSTR("com.apple.sharingd.DebugInfoRequested"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDChanged:", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "altDSIDUpdated:", CFSTR("com.apple.sharingd.AltDSIDChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDSignedIn:", CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "appleIDSignedOut:", CFSTR("com.apple.sharingd.AppleAccountSignOut"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "screenStateChanged:", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "hotspotConnectionStateChanged:", CFSTR("SDHotspotManagerConnectionStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "screenStateChanged:", CFSTR("com.apple.sharingd.HotspotAutoStateChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wifiPasswordSharingChanged:", SFWiFiPasswordSharingAdvertisingBegan, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "wifiPasswordSharingChanged:", SFWiFiPasswordSharingAdvertisingEnded, 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)altDSIDUpdated:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007901C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)debugInfoRequested:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  NSMutableArray *v35;

  v35 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IDHash:%u"), self->_IDHash));
  -[NSMutableArray addObject:](v35, "addObject:", v4);

  if (self->_hasAppleID)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Has Apple ID:%@"), v5));
  -[NSMutableArray addObject:](v35, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Persistent Timer:%@"), self->_nextCrossoverPersistentTimer));
  -[NSMutableArray addObject:](v35, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Power Assertion ID:%u"), self->_powerAssertionID));
  -[NSMutableArray addObject:](v35, "addObject:", v8);

  if (-[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tethering available:%@"), v9));
  -[NSMutableArray addObject:](v35, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = SFHotspotNetworkTypeString(objc_msgSend(v11, "networkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current Network Type:%@"), v13));
  -[NSMutableArray addObject:](v35, "addObject:", v14);

  if (self->_sourceAdvertising)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Source advertising for response:%@"), v15));
  -[NSMutableArray addObject:](v35, "addObject:", v16);

  if (self->_sourceScanning)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Source scanning for requests:%@"), v17));
  -[NSMutableArray addObject:](v35, "addObject:", v18);

  if (self->_targetAdvertising)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Target advertising request:%@"), v19));
  -[NSMutableArray addObject:](v35, "addObject:", v20);

  if (self->_targetScanning)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Target scanning for responses:%@"), v21));
  -[NSMutableArray addObject:](v35, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser pairedPeers](self, "pairedPeers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKeyPath:", CFSTR("@unionOfObjects.UUIDString")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", ")));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current cloud paired peers:%@"), v25));
  -[NSMutableArray addObject:](v35, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser tetheringPeers](self, "tetheringPeers"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "valueForKeyPath:", CFSTR("@unionOfObjects.UUIDString")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", ")));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current tethering source peers:%@"), v29));
  -[NSMutableArray addObject:](v35, "addObject:", v30);

  v32 = (objc_class *)objc_opt_class(self, v31);
  v33 = NSStringFromClass(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  sub_1000455A8(v34, (uint64_t)v35);

}

- (void)appleIDChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079490;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appleIDSignedIn:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079558;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appleIDSignedOut:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079620;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updateAccountState
{
  -[SDHotspotBrowser updateHasAppleID](self, "updateHasAppleID");
  -[SDHotspotBrowser clearAccountAltDSID](self, "clearAccountAltDSID");
  -[SDHotspotBrowser updateIDHashAndRestart](self, "updateIDHashAndRestart");
}

- (void)screenStateChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079714;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)hotspotConnectionStateChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000797D0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)wifiPasswordSharingChanged:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SDHotspotBrowser *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000798CC;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)generateNextDayTimeOffset
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t nextDayTimeOffset;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser accountAltDSID](self, "accountAltDSID"));
  v4 = v3;
  if (v3)
  {
    v5 = sub_10019B3B8(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, 8));
    v16 = 0;
    v8 = objc_msgSend(v7, "getBytes:length:", &v16, 8);
    self->_nextDayTimeOffset = v16 % 0x15180;
    v9 = tethering_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      nextDayTimeOffset = self->_nextDayTimeOffset;
      *(_DWORD *)buf = 134217984;
      v18 = nextDayTimeOffset;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Generated Next Day Time Offset = %lld", buf, 0xCu);
    }

    v12 = sub_1000CEA34(CFSTR("TetheringIDRollOffset"), 0);
    if (v12)
    {
      self->_nextDayTimeOffset = v12;
      v13 = tethering_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_nextDayTimeOffset;
        *(_DWORD *)buf = 134217984;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Next Day Time Offset Overriden = %lld", buf, 0xCu);
      }

    }
  }

}

- (void)updateCrossoverTimer
{
  unsigned int v3;
  void *v4;
  unsigned int v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;

  -[SDHotspotBrowser clearNextDayTimer](self, "clearNextDayTimer");
  v3 = -[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
  if (v4 || (self->_hasAppleID ? (v5 = v3) : (v5 = 0), v5 != 1))
  {

  }
  else
  {
    v6 = -[SDHotspotBrowser accountHasPairedPeers](self, "accountHasPairedPeers");
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextDateForDayInterval:](self, "nextDateForDayInterval:", 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      if (v10 <= 0.0)
      {
        v28 = tethering_log(v11);
        v17 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_10007F4C4(v7, v17);
      }
      else
      {
        v12 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v7, CFSTR("com.apple.sharingd"), self, "nextDayTimerFired:", 0);
        -[SDHotspotBrowser setNextCrossoverPersistentTimer:](self, "setNextCrossoverPersistentTimer:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
        objc_msgSend(v13, "setMinimumEarlyFireProportion:", 1.0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
        objc_msgSend(v14, "scheduleInQueue:", self->_workQueue);

        v16 = tethering_log(v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          -[NSObject timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", v19);
          v21 = (uint64_t)v20;
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser formattedDate:](self, "formattedDate:", v7));
          v29 = 138412802;
          v30 = v18;
          v31 = 2048;
          v32 = v21;
          v33 = 2112;
          v34 = v22;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Timer created (timer = %@, next fire in seconds = %lld, %@)", (uint8_t *)&v29, 0x20u);

        }
      }

      goto LABEL_22;
    }
  }
  v23 = tethering_log(v6);
  v7 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
    if (self->_hasAppleID)
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    if (v3)
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v29 = 138413058;
    if (-[SDHotspotBrowser accountHasPairedPeers](self, "accountHasPairedPeers"))
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    v30 = v24;
    v31 = 2112;
    v32 = (uint64_t)v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not creating persistent timer (timer = %@, has apple ID = %@, tethering supported = %@, has peers on account = %@)", (uint8_t *)&v29, 0x2Au);

  }
LABEL_22:

}

- (void)clearNextDayTimer
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser nextCrossoverPersistentTimer](self, "nextCrossoverPersistentTimer"));
    objc_msgSend(v4, "invalidate");

    -[SDHotspotBrowser setNextCrossoverPersistentTimer:](self, "setNextCrossoverPersistentTimer:", 0);
  }
}

- (void)nextDayTimerFired:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = tethering_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persistent timer fired = %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v8 = objc_msgSend(v7, "altDSIDNeedsFixing");

  if (v8)
  {
    v10 = tethering_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AltDSID needs fixing", (uint8_t *)&v13, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    objc_msgSend(v12, "fixAltDSIDIfNeeded");

  }
  -[SDHotspotBrowser clearNextDayTimer](self, "clearNextDayTimer");
  -[SDHotspotBrowser updateAccountState](self, "updateAccountState");

}

- (id)nextDateForDayInterval:(int)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  int64_t v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = 86400 * a3;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v8 = self->_nextDayTimeOffset + (uint64_t)v7 / v6 * v6;
  v9 = objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = tethering_log(v9);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 >= (double)v8)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calculated previous crossover, pushing to next", buf, 2u);
    }

    v8 += v6;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calculated next crossover", v17, 2u);
    }

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(v8 + 30)));

  return v15;
}

- (id)formattedDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setDateStyle:", 1);
  objc_msgSend(v4, "setTimeStyle:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", CFSTR("GMT")));
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  objc_msgSend(v4, "setTimeZone:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GMT Date = %@, Local Time Zone Date = %@"), v6, v8));

  return v9;
}

- (void)tetheringSupportChanged
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A2EC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)sendMessage:(id)a3 toPeer:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  NSErrorDomain v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id *v40;
  id *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  _BYTE v54[128];

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v43 = v16;
  if (!v15)
  {
    v37 = tethering_log(v16);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_10007F564();

    v50 = NSLocalizedDescriptionKey;
    v51 = CFSTR("Could not send IDS message");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    v35 = NSPOSIXErrorDomain;
    v36 = 50;
LABEL_22:
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v35, v36, v27));
    v32 = 0;
    v26 = 0;
    v28 = v43;
    goto LABEL_23;
  }
  v40 = a8;
  v41 = a7;
  v42 = v14;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (!v18)
  {
LABEL_10:

LABEL_16:
    v33 = tethering_log(v25);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    a7 = v41;
    v14 = v42;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10007F590(v15, v34);

    v52 = NSLocalizedDescriptionKey;
    v53 = CFSTR("No device for identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
    v35 = NSPOSIXErrorDomain;
    v36 = 51;
    goto LABEL_22;
  }
  v19 = v18;
  v20 = *(_QWORD *)v47;
LABEL_4:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v47 != v20)
      objc_enumerationMutation(v17);
    v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nsuuid"));
    v24 = objc_msgSend(v23, "isEqual:", v15);

    if ((v24 & 1) != 0)
      break;
    if (v19 == (id)++v21)
    {
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v19)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v26 = v22;

  if (!v26)
    goto LABEL_16;
  v27 = (void *)IDSCopyForDevice(v26);
  v44 = 0;
  v45 = 0;
  v28 = v43;
  v29 = -[SDHotspotBrowser sendMessage:toDeviceWithID:isRequest:messageID:error:identifier:](self, "sendMessage:toDeviceWithID:isRequest:messageID:error:identifier:", v42, v27, v11, v43, &v45, &v44);
  v30 = v45;
  v31 = v44;
  v32 = v31;
  a7 = v41;
  if (v40 && v29)
  {
    v32 = objc_retainAutorelease(v31);
    *v40 = v32;
  }
  v14 = v42;
LABEL_23:

  if (a7)
    *a7 = objc_retainAutorelease(v30);

  return v30 == 0;
}

- (BOOL)sendMessage:(id)a3 toDeviceWithID:(id)a4 isRequest:(BOOL)a5 messageID:(id)a6 error:(id *)a7 identifier:(id *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  int v22;
  void *v23;
  _QWORD *v24;
  IDSService *tetheringService;
  unsigned __int8 v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  id v42;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = v16;
  if (v15)
  {
    v34 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v15));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &off_10074B3A0, IDSSendMessageOptionTimeoutKey);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v21 = objc_msgSend(v20, "enableHotspotFallback");

    if ((v21 & 1) == 0)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    if (v17 || v11)
    {
      if (v17)
        v22 = v11;
      else
        v22 = 1;
      if (v22)
        v23 = &__kCFBooleanTrue;
      else
        v23 = v17;
      v24 = &IDSSendMessageOptionExpectsPeerResponseKey;
      if (!v22)
        v24 = &IDSSendMessageOptionPeerResponseIdentifierKey;
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *v24);
    }
    tetheringService = self->_tetheringService;
    v35 = 0;
    v36 = 0;
    v26 = -[IDSService sendMessage:fromAccount:toDestinations:priority:options:identifier:error:](tetheringService, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v34, 0, v18, 300, v19, &v36, &v35);
    v27 = v36;
    v28 = v35;
    v29 = tethering_log(v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v38 = v15;
      v39 = 2112;
      v40 = v27;
      v41 = 2112;
      v42 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Sending from device ID to destination = %@, with identifier = %@, message = %@, ", buf, 0x20u);
    }

    if (a8)
      *a8 = objc_retainAutorelease(v27);
    if ((v26 & 1) != 0)
      v31 = 0;
    else
      v31 = v28;

    v14 = v34;
  }
  else
  {
    v32 = tethering_log(v16);
    v27 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10007F618();
    v31 = 0;
    v18 = 0;
  }

  if (a7)
    *a7 = objc_retainAutorelease(v31);

  return v31 == 0;
}

- (void)startBrowsing
{
  NSObject *workQueue;
  _QWORD block[5];

  if (-[SDStatusMonitor deviceSupportsContinuity](self->_monitor, "deviceSupportsContinuity"))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007AA50;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)stopBrowsing
{
  NSObject *workQueue;
  _QWORD block[5];

  if (-[SDStatusMonitor deviceSupportsContinuity](self->_monitor, "deviceSupportsContinuity"))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007AB54;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SDHotspotBrowser *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007AC9C;
  block[3] = &unk_100714F68;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (void)addRetrieveTimer:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007B200;
  v4[3] = &unk_100714860;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)retrieveTimerFired:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  SDHotspotBrowser *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B30C;
  block[3] = &unk_100715138;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(workQueue, block);

}

- (void)invalidateTimerWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_retrieveTimers, "objectForKeyedSubscript:"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_retrieveTimers, "removeObjectForKey:", v6);
  }

}

- (void)restartAdvertisingTetheringRequest
{
  SDHotspotBrowser *v2;
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int64_t v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD v21[2];
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;

  v2 = self;
  if (!self->_shouldBeAdvertisingRequest
    || self->_pausedForWiFiPasswordSharing
    || (self = (SDHotspotBrowser *)-[IDSContinuity state](self->_tetheringManager, "state"),
        self != (SDHotspotBrowser *)3)
    || (self = (SDHotspotBrowser *)-[SDHotspotBrowser bluetoothAllowedForScreenState](v2, "bluetoothAllowedForScreenState"), !(_DWORD)self))
  {
    v9 = tethering_log(self);
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v10 = -[IDSContinuity state](v2->_tetheringManager, "state");
    if (v2->_shouldBeAdvertisingRequest)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (v2->_pausedForWiFiPasswordSharing)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (-[SDStatusMonitor screenOn](v2->_monitor, "screenOn"))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = -[SDStatusMonitor autoHotspotState](v2->_monitor, "autoHotspotState");
    v21[0] = 67110146;
    if (v14)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v21[1] = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v15;
    v16 = "Skipping advertisment request: state=%d, request=%@, paused=%@, screen=%@, auto hotspot=%@";
    v17 = v5;
    v18 = 48;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)v21, v18);
    goto LABEL_24;
  }
  v3 = -[SDHotspotBrowser accountHasTetheringSources](v2, "accountHasTetheringSources");
  if (!v3)
  {
    v19 = tethering_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    LOWORD(v21[0]) = 0;
    v16 = "Not advertising request, no devices that support tethering";
    v17 = v5;
    v18 = 2;
    goto LABEL_23;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v5 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser appendHashToData:withType:](v2, "appendHashToData:withType:", v4, 0));

  if (v5)
  {
    v7 = tethering_log(-[IDSContinuity startAdvertisingOfType:withData:withOptions:](v2->_tetheringManager, "startAdvertisingOfType:withData:withOptions:", 1, v5, 0));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started advertising tethering request", (uint8_t *)v21, 2u);
    }
  }
  else
  {
    v20 = tethering_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007F814();
  }

LABEL_24:
}

- (void)stopAdvertisingTetheringRequest
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = tethering_log(-[IDSContinuity stopAdvertisingOfType:](self->_tetheringManager, "stopAdvertisingOfType:", 1));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping Advertising Request", v4, 2u);
  }

}

- (void)restartAdvertisingTetheringResponse
{
  SDHotspotBrowser *v2;
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  unsigned int v9;
  _BOOL4 sourceAdvertising;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unsigned int v27;
  unsigned __int16 v28;
  uint8_t buf[4];
  _BYTE v30[10];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;

  v2 = self;
  if (!self->_sourceAdvertising
    && self->_shouldBeAdvertisingResponse
    && (self = (SDHotspotBrowser *)-[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported"), (_DWORD)self)&& (self = (SDHotspotBrowser *)-[SDHotspotManager maxConnectionsReached](v2->_hotspotManager, "maxConnectionsReached"), (self & 1) == 0)&& (self = (SDHotspotBrowser *)-[IDSContinuity state](v2->_tetheringManager, "state"), self == (SDHotspotBrowser *)3))
  {
    LOWORD(v27) = 1;
    HIBYTE(v27) = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localPowerSource"));
    objc_msgSend(v14, "chargeLevel");
    v16 = (uint64_t)(v15 * 100.0);

    if (v16 < 0)
      v17 = -1;
    else
      v17 = v16;
    BYTE2(v27) = v17;
    HIBYTE(v28) = -[SDStatusMonitor signalStrength](v2->_monitor, "signalStrength");
    v18 = (id)-[SDStatusMonitor networkType](v2->_monitor, "networkType");
    LOBYTE(v28) = (_BYTE)v18;
    if (v2->_targetIdentifier)
    {
      v18 = (id)-[SDHotspotBrowser serviceHasDuplicateForBTUUID:](v2, "serviceHasDuplicateForBTUUID:");
      if ((_DWORD)v18)
        BYTE1(v27) = 0x80;
    }
    v19 = tethering_log(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = SFHotspotResponseAdvertisementString(v27 | ((unint64_t)v28 << 32));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Advertising response packet %@", buf, 0xCu);

    }
    v4 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v27, 6));
    if (v4)
    {
      v23 = -[IDSContinuity startAdvertisingOfType:withData:withOptions:](v2->_tetheringManager, "startAdvertisingOfType:withData:withOptions:", 2, v4, 0);
      v2->_sourceAdvertising = 1;
      v24 = tethering_log(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Started advertising tethering response", buf, 2u);
      }
    }
    else
    {
      v26 = tethering_log(0);
      v25 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10007F840();
    }

  }
  else
  {
    v3 = tethering_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[SDHotspotManager isTetheringSupported](v2->_hotspotManager, "isTetheringSupported");
      v6 = -[IDSContinuity state](v2->_tetheringManager, "state");
      if (v2->_shouldBeAdvertisingRequest)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      if (v2->_shouldBeAdvertisingResponse)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = -[SDHotspotManager maxConnectionsReached](v2->_hotspotManager, "maxConnectionsReached");
      sourceAdvertising = v2->_sourceAdvertising;
      if (v9)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 67110402;
      if (sourceAdvertising)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)v30 = v5;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v6;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping advertisment response: supported=%d, state=%d, request=%@, response=%@, max connections=%@ already advertising=%@", buf, 0x36u);
    }
  }

}

- (void)stopAdvertisingResponse
{
  NSString *targetIdentifier;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  targetIdentifier = self->_targetIdentifier;
  self->_targetIdentifier = 0;

  v4 = -[IDSContinuity stopAdvertisingOfType:](self->_tetheringManager, "stopAdvertisingOfType:", 2);
  self->_sourceAdvertising = 0;
  v5 = tethering_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping response advertisement", v7, 2u);
  }

}

- (void)restartProducerScanning
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;

  if (self->_producerScanEnabled
    && -[SDHotspotManager isTetheringSupported](self->_hotspotManager, "isTetheringSupported")
    && -[SDHotspotBrowser accountHasPairedPeers](self, "accountHasPairedPeers")
    && -[IDSContinuity state](self->_tetheringManager, "state") == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser appendHashToData:withType:](self, "appendHashToData:withType:", v3, 0));

    if (v4)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser pairedPeers](self, "pairedPeers"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKeyPath:](v6, "valueForKeyPath:", CFSTR("@unionOfObjects.UUIDString")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));

      v10 = tethering_log(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restarted scanning for device requesting tethering [%@]", (uint8_t *)&v13, 0xCu);
      }

      -[IDSContinuity startScanningForType:withData:peers:withOptions:](self->_tetheringManager, "startScanningForType:withData:peers:withOptions:", 1, v4, v6, 0);
    }
    else
    {
      v12 = tethering_log(v5);
      v6 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10007F86C();
    }

  }
}

- (void)stopProducerScanning
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping producer scanning", v5, 2u);
  }

  -[IDSContinuity stopScanningForType:](self->_tetheringManager, "stopScanningForType:", 1);
}

- (void)restartConsumerScanning
{
  SDHotspotBrowser *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int64_t v14;
  const __CFString *v15;
  int v16;
  _BYTE v17[14];
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;

  v2 = self;
  if (self->_shouldBeConsumerScanning
    && (self = (SDHotspotBrowser *)-[SDHotspotBrowser accountHasTetheringSources](self, "accountHasTetheringSources"),
        (_DWORD)self)
    && (self = (SDHotspotBrowser *)-[IDSContinuity state](v2->_tetheringManager, "state"), self == (SDHotspotBrowser *)3)
    && (self = (SDHotspotBrowser *)-[SDHotspotBrowser bluetoothAllowedForScreenState](v2, "bluetoothAllowedForScreenState"), (_DWORD)self))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser tetheringPeers](v2, "tetheringPeers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKeyPath:](v3, "valueForKeyPath:", CFSTR("@unionOfObjects.UUIDString")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));

    v7 = tethering_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      *(_QWORD *)v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restarted scanning for available tethering devices [%@]", (uint8_t *)&v16, 0xCu);
    }

    -[IDSContinuity startScanningForType:withData:peers:withOptions:](v2->_tetheringManager, "startScanningForType:withData:peers:withOptions:", 2, 0, v3, 0);
  }
  else
  {
    v9 = tethering_log(self);
    v3 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[IDSContinuity state](v2->_tetheringManager, "state");
      if (v2->_shouldBeConsumerScanning)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (-[SDHotspotBrowser accountHasTetheringSources](v2, "accountHasTetheringSources"))
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (-[SDStatusMonitor screenOn](v2->_monitor, "screenOn"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = -[SDStatusMonitor autoHotspotState](v2->_monitor, "autoHotspotState");
      v16 = 67110146;
      if (v14)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      *(_DWORD *)v17 = v10;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping scanning: state=%d, request=%@, peers=%@, screen=%@, auto hotspot=%@", (uint8_t *)&v16, 0x30u);
    }
  }

}

- (void)stopConsumerScanning
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopped scanning for available tethering devices", v5, 2u);
  }

  -[IDSContinuity stopScanningForType:](self->_tetheringManager, "stopScanningForType:", 2);
}

- (void)handleIncomingResponse:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  id v49;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") >= 6)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = (unsigned int *)objc_msgSend(v8, "bytes");
    v10 = *v9 | ((unint64_t)*((unsigned __int16 *)v9 + 2) << 32);
    v11 = tethering_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = SFHotspotResponseAdvertisementString(v10 & 0xFFFFFFFFFFFFLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412546;
      v47 = *(double *)&v14;
      v48 = 2112;
      v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Source advertisement %@ device ID: %@)", buf, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoveredDevices, "objectForKeyedSubscript:", v7));
    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser browseStartTime](self, "browseStartTime"));

      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser browseStartTime](self, "browseStartTime"));
        objc_msgSend(v18, "timeIntervalSinceDate:", v19);
        v21 = v20;

        v22 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser modelCodeForIdentifier:](self, "modelCodeForIdentifier:", v7));
        sub_100045708(self->_modelCode, v22, &off_10074B3E8, 1, v21);
        v24 = tethering_log(v23);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v47 = v21;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Discovered new device in %f seconds", buf, 0xCu);
        }

      }
      else
      {
        v26 = tethering_log(v17);
        v22 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No browse start time", buf, 2u);
        }
      }

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser deviceForIdentifier:](self, "deviceForIdentifier:", v7));
    if (v27)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "advertisementData"));
      v29 = v28;
      if (!v15
        || !-[NSObject isEqualToData:](v28, "isEqualToData:", v8)
        || (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "deviceName")),
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name")),
            v32 = objc_msgSend(v30, "isEqualToString:", v31),
            v31,
            v30,
            (v32 & 1) == 0))
      {
        v33 = objc_alloc((Class)SFRemoteHotspotDevice);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
        v35 = objc_msgSend(v33, "initWithName:identifier:advertisement:", v34, v7, v10 & 0xFFFFFFFFFFFFLL);

        objc_msgSend(v35, "setGroup:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "modelIdentifier"));
        objc_msgSend(v35, "setModel:", v36);

        objc_msgSend(v27, "operatingSystemVersion");
        objc_msgSend(v35, "setOsSupportsAutoHotspot:", v45 > 12);
        if (v35)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_discoveredDevices, "setObject:forKeyedSubscript:", v35, v7);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser clientProxy](self, "clientProxy"));

        v39 = tethering_log(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        v41 = v40;
        if (v37)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
            *(_DWORD *)buf = 138412290;
            v47 = *(double *)&v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Updating client with devices list %@", buf, 0xCu);

          }
          v41 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser clientProxy](self, "clientProxy"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredDevices, "allValues"));
          -[NSObject updatedFoundDeviceList:](v41, "updatedFoundDeviceList:", v43);

        }
        else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          sub_10007F8C4();
        }

        goto LABEL_28;
      }
    }
    else
    {
      v44 = tethering_log(0);
      v29 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10007F898();
    }
    v35 = v15;
LABEL_28:

  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t CanConnectOn5GHz;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableDictionary *outstandingRequests;
  void *v45;
  void *v46;
  NSMutableDictionary *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  _QWORD v60[4];
  NSObject *v61;
  SDHotspotBrowser *v62;
  id v63;
  id v64;
  NSErrorUserInfoKey v65;
  const __CFString *v66;
  uint8_t buf[4];
  NSObject *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = tethering_log(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v68 = v12;
    v69 = 2112;
    v70 = v13;
    v71 = 2112;
    v72 = v15;
    v73 = 2112;
    v74 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "service = %@, account = %@, fromID = %@, message = %@", buf, 0x2Au);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HotspotBrowserMessageType")));
  v20 = v19;
  if (!v19)
  {
    v34 = tethering_log(0);
    v24 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10007F8F0();
    goto LABEL_38;
  }
  v21 = objc_msgSend(v19, "integerValue");
  if (v21 == (id)1)
  {
    v35 = tethering_log(1);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingResponseIdentifier"));
      *(_DWORD *)buf = 138412290;
      v68 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Received response for ID = %@", buf, 0xCu);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](self->_tetheringService, "deviceForFromID:", v15));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "nsuuid"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUIDString"));

    if (!v24)
    {
      v50 = tethering_log(v40);
      v29 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10007F948();
      goto LABEL_37;
    }
    v41 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v24);
    v29 = v41;
    if (!v41)
    {
      v51 = tethering_log(0);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_10007F974();
      goto LABEL_36;
    }
    v59 = v41;
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HotspotBroswerCredentialData")));
    v58 = v42;
    if (v42)
    {
      v43 = v42;
      outstandingRequests = self->_outstandingRequests;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingResponseIdentifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](outstandingRequests, "objectForKeyedSubscript:", v57));
      -[SDHotspotBrowser tetheringDidRetrieveCredentials:credentials:requestRecord:error:](self, "tetheringDidRetrieveCredentials:credentials:requestRecord:error:", v59, v43, v45, 0);

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingResponseIdentifier"));
      if (!v46)
      {
        v52 = v58;
        v29 = v59;
        goto LABEL_36;
      }
      v47 = self->_outstandingRequests;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingResponseIdentifier"));
      -[NSMutableDictionary removeObjectForKey:](v47, "removeObjectForKey:", v48);
      v29 = v59;
    }
    else
    {
      v65 = NSLocalizedDescriptionKey;
      v66 = CFSTR("Could not retrieve credentials");
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v53));

      v55 = tethering_log(v54);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_10007F9A0();

      v29 = v59;
      -[SDHotspotBrowser tetheringDidRetrieveCredentials:credentials:requestRecord:error:](self, "tetheringDidRetrieveCredentials:credentials:requestRecord:error:", v59, 0, 0, v48);
    }

    v52 = v58;
LABEL_36:

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](self->_tetheringService, "deviceForFromID:", v15));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nsuuid"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));

    v26 = tethering_log(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received request for credentials from peer with bluetooth ID = %@", buf, 0xCu);
    }

    if (v15 && v24)
    {
      v29 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser modelCodeForIdentifier:](self, "modelCodeForIdentifier:", v24));
      v30 = -[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("Unknown"));
      if ((_DWORD)v30)
      {
        v31 = tethering_log(v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v24;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Can not retrieve modelID for peer with bluetooth ID = %@", buf, 0xCu);
        }

        CanConnectOn5GHz = 0;
      }
      else
      {
        CanConnectOn5GHz = SFRemoteDeviceCanConnectOn5GHz(v29);
      }
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10007CABC;
      v60[3] = &unk_100715C00;
      v61 = v24;
      v62 = self;
      v63 = v15;
      v64 = v16;
      -[SDHotspotBrowser credentialsWithCompletionHandler:canConnectOn5GHz:](self, "credentialsWithCompletionHandler:canConnectOn5GHz:", v60, CanConnectOn5GHz);

    }
    else
    {
      v49 = tethering_log(v28);
      v29 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10007F91C();
    }
    goto LABEL_37;
  }
LABEL_39:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  int v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;

  v8 = a6;
  v10 = a5;
  v11 = a7;
  v12 = tethering_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v25 = 138412802;
    v26 = v10;
    v27 = 2112;
    if (v8)
      v14 = CFSTR("YES");
    v28 = v14;
    v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Message with identifier = %@ did send with success = %@, error = %@", (uint8_t *)&v25, 0x20u);
  }

  if (!v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingRequests, "objectForKeyedSubscript:", v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteHotspotDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser modelCodeForIdentifier:](self, "modelCodeForIdentifier:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteHotspotDevice"));
    v20 = objc_msgSend(v19, "hasDuplicates");

    if (v20)
      v21 = 7;
    else
      v21 = 4;
    sub_1000458B0(self->_modelCode, v18, v11, v21, 0);
    v22 = tethering_log(-[NSMutableDictionary removeObjectForKey:](self->_outstandingRequests, "removeObjectForKey:", v10));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = CFSTR("NO");
      v25 = 138412802;
      v26 = v10;
      v27 = 2112;
      if (v20)
        v24 = CFSTR("YES");
      v28 = v24;
      v29 = 2112;
      v30 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Request failed (id = %@, duplicates = %@, error = %@)", (uint8_t *)&v25, 0x20u);
    }

  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = tethering_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_tetheringService, "devices"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "devicesChanged %@", (uint8_t *)&v8, 0xCu);

  }
  -[SDHotspotBrowser restartConsumerScanning](self, "restartConsumerScanning");
  -[SDHotspotBrowser restartProducerScanning](self, "restartProducerScanning");
}

- (void)restartScanResetTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *workQueue;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting scan reset timer", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanResetTimer](self, "scanResetTimer"));
  if (!v5)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007D0BC;
    v12[3] = &unk_1007145D0;
    objc_copyWeak(&v13, (id *)buf);
    v7 = sub_10019AAD8(0, workQueue, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDHotspotBrowser setScanResetTimer:](self, "setScanResetTimer:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanResetTimer](self, "scanResetTimer"));
    dispatch_resume(v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  v10 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanResetTimer](self, "scanResetTimer"));
  v11 = sub_10019AAC0(15.0);
  sub_10019AB78(v10, v11);

}

- (void)invalidateScanResetTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating scan reset timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanResetTimer](self, "scanResetTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanResetTimer](self, "scanResetTimer"));
    dispatch_source_cancel(v6);

    -[SDHotspotBrowser setScanResetTimer:](self, "setScanResetTimer:", 0);
  }
}

- (void)handleScanResetTimerFired
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scan reset timer fired", v5, 2u);
  }

  -[SDHotspotBrowser invalidateScanResetTimer](self, "invalidateScanResetTimer");
  -[SDHotspotBrowser stopProducerScanning](self, "stopProducerScanning");
  -[SDHotspotBrowser restartProducerScanning](self, "restartProducerScanning");
}

- (void)restartScanAssertionTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *workQueue;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting scan assertion timer", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanAssertionTimer](self, "scanAssertionTimer"));
  if (!v5)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007D388;
    v12[3] = &unk_1007145D0;
    objc_copyWeak(&v13, (id *)buf);
    v7 = sub_10019AAD8(0, workQueue, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDHotspotBrowser setScanAssertionTimer:](self, "setScanAssertionTimer:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanAssertionTimer](self, "scanAssertionTimer"));
    dispatch_resume(v9);

    -[SDHotspotBrowser preventIdleSleepAssertion](self, "preventIdleSleepAssertion");
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  v10 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanAssertionTimer](self, "scanAssertionTimer"));
  v11 = sub_10019AAC0(30.0);
  sub_10019AB78(v10, v11);

}

- (void)invalidateScanAssertionTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating scan assertion timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanAssertionTimer](self, "scanAssertionTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser scanAssertionTimer](self, "scanAssertionTimer"));
    dispatch_source_cancel(v6);

    -[SDHotspotBrowser setScanAssertionTimer:](self, "setScanAssertionTimer:", 0);
  }
}

- (void)handleScanAssertionTimerFired
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = tethering_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scan assertion timer fired", v5, 2u);
  }

  self->_shouldBeAdvertisingResponse = 0;
  -[SDHotspotBrowser stopAdvertisingResponse](self, "stopAdvertisingResponse");
  -[SDHotspotBrowser invalidateScanAssertionTimer](self, "invalidateScanAssertionTimer");
  -[SDHotspotBrowser releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
}

- (void)preventIdleSleepAssertion
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  uint64_t v5;
  unsigned int *p_powerAssertionID;
  unsigned int powerAssertionID;
  uint64_t v8;
  NSObject *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[3];
  _QWORD v17[3];

  v3 = (OS_os_transaction *)os_transaction_create("SDHotspotBrowser");
  transaction = self->_transaction;
  self->_transaction = v3;

  powerAssertionID = self->_powerAssertionID;
  p_powerAssertionID = &self->_powerAssertionID;
  if (!powerAssertionID)
  {
    v8 = tethering_log(v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Grabbing power assertion to allow source to advertise", v15, 2u);
    }

    v16[0] = CFSTR("FrameworkBundleID");
    v16[1] = CFSTR("AssertType");
    v17[0] = CFSTR("com.apple.Sharing");
    v17[1] = CFSTR("PreventUserIdleSystemSleep");
    v16[2] = CFSTR("AssertName");
    v17[2] = CFSTR("Tethering");
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
    v11 = IOPMAssertionCreateWithProperties(v10, p_powerAssertionID);
    if ((_DWORD)v11)
    {
      v12 = v11;
      v13 = tethering_log(v11);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10007FA2C(v12, v14);

      *p_powerAssertionID = 0;
    }

  }
}

- (void)releaseIdleSleepAssertion
{
  uint64_t v3;
  NSObject *v4;
  OS_os_transaction *transaction;
  uint8_t v6[16];

  if (self->_powerAssertionID)
  {
    v3 = tethering_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion", v6, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)continuity:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSString *v20;
  NSString *targetIdentifier;
  void *v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/didDiscoverType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v13, &v23);
  if (a4 == 2)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    -[SDHotspotBrowser handleIncomingResponse:identifier:](self, "handleIncomingResponse:identifier:", v11, v22);

  }
  else if (a4 == 1)
  {
    v15 = tethering_log(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received target advertisement (peer: %@, data: %@)", buf, 0x16u);

    }
    -[SDHotspotBrowser restartScanResetTimer](self, "restartScanResetTimer");
    -[SDHotspotBrowser restartScanAssertionTimer](self, "restartScanAssertionTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v19 = objc_msgSend(v18, "controlCenterVisible");

    if ((v19 & 1) == 0)
    {
      self->_shouldBeAdvertisingResponse = 1;
      v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      targetIdentifier = self->_targetIdentifier;
      self->_targetIdentifier = v20;

      -[SDHotspotBrowser restartAdvertisingTetheringResponse](self, "restartAdvertisingTetheringResponse");
    }
  }
  os_activity_scope_leave(&v23);

}

- (void)credentialsWithCompletionHandler:(id)a3 canConnectOn5GHz:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void ***v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *, void *);
  void *v14;
  SDHotspotBrowser *v15;
  id v16;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = tethering_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Turning on personal hotspot", buf, 2u);
  }

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10007D9A8;
  v14 = &unk_100715C50;
  v15 = self;
  v16 = v6;
  v9 = v6;
  v10 = objc_retainBlock(&v11);
  -[SDHotspotManager startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:](self->_hotspotManager, "startTetheringWithCompletionHandler:modelID:productVersion:canConnectOn5GHz:", v10, 0, 0, v4, v11, v12, v13, v14, v15);

}

- (void)tetheringDidRetrieveCredentials:(id)a3 credentials:(id)a4 requestRecord:(id)a5 error:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSMutableDictionary *handlers;
  NSMutableDictionary **p_handlers;
  void *v20;
  void *v21;
  void (**v22)(id, _QWORD, id);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSString *modelCode;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  NSErrorUserInfoKey v76;
  const __CFString *v77;
  NSErrorUserInfoKey v78;
  const __CFString *v79;
  uint8_t buf[4];
  const __CFString *v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  id v85;
  __int16 v86;
  const __CFString *v87;
  _QWORD v88[4];

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = tethering_log(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("YES");
    *(_DWORD *)buf = 138412802;
    v81 = v10;
    v82 = 2112;
    if (!v11)
      v16 = CFSTR("NO");
    v83 = (uint64_t)v16;
    v84 = 2112;
    v85 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tethering did retrieve credentials for identifier = %@, credentials = %@, with error = %@", buf, 0x20u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v10, "UUIDString"));
  -[SDHotspotBrowser invalidateTimerWithIdentifier:](self, "invalidateTimerWithIdentifier:", v17);

  p_handlers = &self->_handlers;
  handlers = self->_handlers;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v10, "UUIDString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](handlers, "objectForKeyedSubscript:", v20));
  v22 = (void (**)(id, _QWORD, id))objc_msgSend(v21, "copy");

  if (v22)
  {
    if (v13)
    {
      v25 = tethering_log(v23);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10007FCBC();

      v22[2](v22, 0, v13);
    }
    else
    {
      v88[0] = objc_opt_class(NSDictionary, v24);
      v88[1] = objc_opt_class(NSString, v29);
      v88[2] = objc_opt_class(NSNumber, v30);
      v88[3] = objc_opt_class(NSError, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 4));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v32));

      v75 = 0;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v33, v11, &v75));
      v35 = v75;
      v13 = v35;
      v73 = v12;
      if (v34)
      {
        v71 = v33;
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HotspotCredentialName")));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HotspotCredentialPassword")));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HotspotCredentialChannel")));
        v74 = (void *)v37;
        v38 = tethering_log(-[SDHotspotBrowser credentialLog:](self, "credentialLog:", v37));
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = CFSTR("YES");
          *(_DWORD *)buf = 138413058;
          v81 = CFSTR("YES");
          v82 = 2112;
          if (!v74)
            v40 = CFSTR("NO");
          v83 = v36;
          v84 = 2112;
          v85 = v72;
          v86 = 2112;
          v87 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Receive credentials dictionary (dictionary = %@, name = %@, channel = %@, password = %@)", buf, 0x2Au);
        }

        v69 = v34;
        v70 = (void *)v36;
        if (v36 && v74 && (v41 = (uint64_t)objc_msgSend(v72, "integerValue"), v41 >= 1))
        {
          v42 = tethering_log(v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = objc_msgSend(v72, "integerValue");
            *(_DWORD *)buf = 138412546;
            v81 = (const __CFString *)v36;
            v82 = 1024;
            LODWORD(v83) = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Received credentials for network = %@, channel = %d", buf, 0x12u);
          }

          v45 = objc_msgSend(objc_alloc((Class)SFRemoteHotspotInfo), "initWithName:password:channel:", v36, v74, v72);
          ((void (**)(id, id, id))v22)[2](v22, v45, 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteHotspotDevice"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "deviceIdentifier"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser modelCodeForIdentifier:](self, "modelCodeForIdentifier:", v47));

          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startTime"));
          objc_msgSend(v48, "timeIntervalSinceDate:", v49);
          v51 = v50;

          sub_100045708(self->_modelCode, v68, &off_10074B400, 0, v51);
          v53 = tethering_log(v52);
          v54 = objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v81 = *(const __CFString **)&v51;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Credential transfer time = %f", buf, 0xCu);
          }

        }
        else
        {
          v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HotspotCredentialError")));
          v45 = (id)v55;
          if (!v55)
          {
            v78 = NSLocalizedDescriptionKey;
            v79 = CFSTR("Credentials failed to transfer");
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
            v45 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v56));

          }
          v57 = tethering_log(v55);
          v58 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            sub_10007FC5C();

          modelCode = self->_modelCode;
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v10, "UUIDString"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[SDHotspotBrowser modelCodeForIdentifier:](self, "modelCodeForIdentifier:", v60));
          sub_1000458B0(modelCode, v61, v45, 6, 0);

          v22[2](v22, 0, v45);
        }
        v62 = v69;
        v63 = v74;

        v64 = v70;
        v33 = v71;
      }
      else
      {
        v62 = 0;
        v65 = tethering_log(v35);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_10007FBFC();

        v76 = NSLocalizedDescriptionKey;
        v77 = CFSTR("Credentials failed to unarchive");
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v64));
        v22[2](v22, 0, v63);
      }

      v12 = v73;
    }
    v67 = *p_handlers;
    v28 = objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v10, "UUIDString", v68));
    -[NSMutableDictionary removeObjectForKey:](v67, "removeObjectForKey:", v28);
  }
  else
  {
    v27 = tethering_log(v23);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10007FB64(v10, (uint64_t)&self->_handlers, v28);
  }

}

- (void)continuityDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = -[IDSContinuity state](self->_tetheringManager, "state");
  switch((unint64_t)v6)
  {
    case 0uLL:
      v7 = tethering_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_WORD *)v14 = 0;
      v9 = "Tethering did receive IDSContinuityStateUnknown";
      break;
    case 1uLL:
      v13 = tethering_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_WORD *)v14 = 0;
      v9 = "Tethering did receive IDSContinuityStateResetting";
      break;
    case 2uLL:
      v10 = tethering_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_WORD *)v14 = 0;
      v9 = "Tethering did receive IDSContinuityStatePoweredOff";
      break;
    case 3uLL:
      v11 = tethering_log(v6);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tethering did receive IDSContinuityStatePoweredOn", v14, 2u);
      }

      -[SDHotspotBrowser restartAdvertisingTetheringRequest](self, "restartAdvertisingTetheringRequest");
      -[SDHotspotBrowser restartAdvertisingTetheringResponse](self, "restartAdvertisingTetheringResponse");
      -[SDHotspotBrowser restartProducerScanning](self, "restartProducerScanning");
      -[SDHotspotBrowser restartConsumerScanning](self, "restartConsumerScanning");
      goto LABEL_14;
    default:
      goto LABEL_13;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v14, 2u);
LABEL_12:

LABEL_13:
  self->_sourceAdvertising = 1;
  self->_shouldBeAdvertisingResponse = 0;
  -[SDHotspotBrowser stopAdvertisingResponse](self, "stopAdvertisingResponse", *(_QWORD *)v14);
LABEL_14:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    if (self->_targetAdvertising)
    {
      v12 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v11 = "Received a start target advertising callback even though we're already advertising";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    self->_targetAdvertising = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDHotspotBrowser setBrowseStartTime:](self, "setBrowseStartTime:", v14);

    v16 = tethering_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Target started advertising request", v18, 2u);
    }

    sub_100045708(self->_modelCode, CFSTR("Unknown"), &off_10074B3B8, 1, -1.0);
  }
  else if (a4 == 2)
  {
    if (self->_sourceAdvertising)
    {
      v9 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v11 = "Received a start source advertising callback even though we're already advertising";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v18, 2u);
        goto LABEL_12;
      }
    }
    else
    {
      self->_sourceAdvertising = 1;
      v13 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v11 = "Source started advertising response";
        goto LABEL_11;
      }
    }
    goto LABEL_12;
  }
LABEL_13:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint8_t v31[16];
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStopAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (a4 != 1)
  {
    if (a4 != 2)
      goto LABEL_24;
    self->_sourceAdvertising = 0;
    v12 = tethering_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Source stopped advertising response", v31, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v14, "isEqualToString:", WPErrorDomain))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == (id)28)
      {
        v17 = tethering_log(v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Response advertisement stopped for BLE address rotation", v31, 2u);
        }

        if (self->_shouldBeAdvertisingResponse)
        {
          v20 = tethering_log(v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Restarting response advertisement for rotation", v31, 2u);
          }

          -[SDHotspotBrowser restartAdvertisingTetheringResponse](self, "restartAdvertisingTetheringResponse");
        }
      }
      goto LABEL_24;
    }
LABEL_23:

    goto LABEL_24;
  }
  self->_targetAdvertising = 0;
  v22 = tethering_log(-[SDHotspotBrowser setBrowseStartTime:](self, "setBrowseStartTime:", 0));
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Target stopped advertising request", v31, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  if (!objc_msgSend(v14, "isEqualToString:", WPErrorDomain))
    goto LABEL_23;
  v24 = objc_msgSend(v9, "code");

  if (v24 == (id)28)
  {
    v26 = tethering_log(v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Request advertisement stopped for BLE address rotation", v31, 2u);
    }

    if (self->_shouldBeAdvertisingRequest)
    {
      v29 = tethering_log(v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Restarting request advertisement for rotation", v31, 2u);
      }

      -[SDHotspotBrowser restartAdvertisingTetheringRequest](self, "restartAdvertisingTetheringRequest");
    }
  }
LABEL_24:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSString *targetIdentifier;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  os_activity_scope_state_s v17;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidFailToStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v10, &v17);
  if (a4 == 1)
  {
    self->_targetAdvertising = 0;
    v15 = tethering_log(v11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10007FD7C();

    sub_1000458B0(self->_modelCode, CFSTR("Unknown"), v9, 1, 1);
  }
  else if (a4 == 2)
  {
    self->_sourceAdvertising = 0;
    targetIdentifier = self->_targetIdentifier;
    self->_targetIdentifier = 0;

    v13 = tethering_log(-[SDHotspotBrowser setBrowseStartTime:](self, "setBrowseStartTime:", 0));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10007FD1C();

  }
  os_activity_scope_leave(&v17);

}

- (void)continuity:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t v16[16];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    if (self->_sourceScanning)
    {
      v12 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        v11 = "Received a start target scanning callback even though we're already scanning";
        goto LABEL_14;
      }
    }
    else
    {
      self->_sourceScanning = 1;
      v15 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        v11 = "Source started scanning for requests from targets";
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  if (a4 == 2)
  {
    if (self->_targetScanning)
    {
      v9 = tethering_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        v11 = "Received a start source scanning callback even though we're already scanning";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v16, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    self->_targetScanning = 1;
    v13 = tethering_log(v8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Target started scanning for responses from sources", v16, 2u);
    }

    sub_100045708(self->_modelCode, CFSTR("Unknown"), &off_10074B418, 1, -1.0);
  }
LABEL_16:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didStopScanningForType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint8_t v13[16];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidStopScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (a4 == 1)
  {
    self->_sourceScanning = 0;
    v12 = tethering_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      v11 = "Source stopped scanning for requests from targets";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (a4 == 2)
  {
    self->_targetScanning = 0;
    v9 = tethering_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      v11 = "Target stopped scanning for responses";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v13, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  os_activity_scope_leave(&state);

}

- (void)continuity:(id)a3 didFailToStartScanningForType:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  os_activity_scope_state_s v16;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDHotspotBrowser/continuityDidFailToStartScanningForType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v10, &v16);
  if (a4 == 1)
  {
    self->_sourceScanning = 0;
    v14 = tethering_log(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10007FE3C();

  }
  else if (a4 == 2)
  {
    self->_targetScanning = 0;
    v12 = tethering_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10007FDDC();

    sub_1000458B0(self->_modelCode, CFSTR("Unknown"), v9, 2, 1);
  }
  os_activity_scope_leave(&v16);

}

- (SFRemoteHotspotClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (SDHotspotManager)hotspotManager
{
  return self->_hotspotManager;
}

- (BOOL)producerScanEnabled
{
  return self->_producerScanEnabled;
}

- (BOOL)d2dEncryptionAvailable
{
  return self->_d2dEncryptionAvailable;
}

- (void)setD2dEncryptionAvailable:(BOOL)a3
{
  self->_d2dEncryptionAvailable = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (SDStatusMonitor)monitor
{
  return (SDStatusMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (IDSContinuity)tetheringManager
{
  return (IDSContinuity *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTetheringManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unsigned)IDHash
{
  return self->_IDHash;
}

- (void)setIDHash:(unsigned int)a3
{
  self->_IDHash = a3;
}

- (BOOL)hasAppleID
{
  return self->_hasAppleID;
}

- (void)setHasAppleID:(BOOL)a3
{
  self->_hasAppleID = a3;
}

- (IDSService)tetheringService
{
  return (IDSService *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTetheringService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)timeString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTimeString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PCPersistentTimer)nextCrossoverPersistentTimer
{
  return (PCPersistentTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNextCrossoverPersistentTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)nextDayTimeOffset
{
  return self->_nextDayTimeOffset;
}

- (void)setNextDayTimeOffset:(unint64_t)a3
{
  self->_nextDayTimeOffset = a3;
}

- (BOOL)shouldBeConsumerScanning
{
  return self->_shouldBeConsumerScanning;
}

- (void)setShouldBeConsumerScanning:(BOOL)a3
{
  self->_shouldBeConsumerScanning = a3;
}

- (BOOL)shouldBeAdvertisingRequest
{
  return self->_shouldBeAdvertisingRequest;
}

- (void)setShouldBeAdvertisingRequest:(BOOL)a3
{
  self->_shouldBeAdvertisingRequest = a3;
}

- (BOOL)pausedForWiFiPasswordSharing
{
  return self->_pausedForWiFiPasswordSharing;
}

- (void)setPausedForWiFiPasswordSharing:(BOOL)a3
{
  self->_pausedForWiFiPasswordSharing = a3;
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)retrieveTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRetrieveTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (BOOL)shouldBeAdvertisingResponse
{
  return self->_shouldBeAdvertisingResponse;
}

- (void)setShouldBeAdvertisingResponse:(BOOL)a3
{
  self->_shouldBeAdvertisingResponse = a3;
}

- (NSTimer)advertiseResponseTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAdvertiseResponseTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSMutableDictionary)discoveredDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDiscoveredDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)targetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTargetIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OS_dispatch_source)scanResetTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 168, 1);
}

- (void)setScanResetTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (OS_dispatch_source)scanAssertionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 176, 1);
}

- (void)setScanAssertionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)targetAdvertising
{
  return self->_targetAdvertising;
}

- (void)setTargetAdvertising:(BOOL)a3
{
  self->_targetAdvertising = a3;
}

- (BOOL)targetScanning
{
  return self->_targetScanning;
}

- (void)setTargetScanning:(BOOL)a3
{
  self->_targetScanning = a3;
}

- (BOOL)sourceAdvertising
{
  return self->_sourceAdvertising;
}

- (void)setSourceAdvertising:(BOOL)a3
{
  self->_sourceAdvertising = a3;
}

- (BOOL)sourceScanning
{
  return self->_sourceScanning;
}

- (void)setSourceScanning:(BOOL)a3
{
  self->_sourceScanning = a3;
}

- (NSString)modelCode
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setModelCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSDate)browseStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBrowseStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableDictionary)outstandingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOutstandingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_browseStartTime, 0);
  objc_storeStrong((id *)&self->_modelCode, 0);
  objc_storeStrong((id *)&self->_scanAssertionTimer, 0);
  objc_storeStrong((id *)&self->_scanResetTimer, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_advertiseResponseTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_retrieveTimers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_nextCrossoverPersistentTimer, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_tetheringService, 0);
  objc_storeStrong((id *)&self->_tetheringManager, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_hotspotManager, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end

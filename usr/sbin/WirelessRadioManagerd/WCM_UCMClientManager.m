@implementation WCM_UCMClientManager

- (void)addUCMClient:(id)a3
{
  -[NSMutableArray addObject:](self->mUCMClientContexts, "addObject:", a3);
  -[WCM_UCMClientManager existingContexts](self, "existingContexts");
}

- (void)removeUCMClient:(id)a3
{
  -[WCM_UCMClientManager existingContexts](self, "existingContexts");
  -[NSMutableArray removeObject:](self->mUCMClientContexts, "removeObject:", a3);
  -[WCM_UCMClientManager existingContexts](self, "existingContexts");
}

- (void)deleteUCMClient:(int)a3
{
  id v4;

  v4 = -[WCM_UCMClientManager getUCMClientFromList:](self, "getUCMClientFromList:", *(_QWORD *)&a3);
  if (v4)
    -[WCM_UCMClientManager removeUCMClient:](self, "removeUCMClient:", v4);
}

- (void)existingContexts
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_UCMClientManager: Number of active UCM clients: %lu"), -[NSMutableArray count](self->mUCMClientContexts, "count"));
}

- (void)updateBTConnectedDevices:(WCM_BTConnections *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateBTConnectedDevices"));
  v5 = *(_OWORD *)&a3->numA2DP;
  v6 = *(_OWORD *)&a3->numHID;
  v7 = *(_OWORD *)&a3->numeSCO;
  self->mBTConnections.numLEA = a3->numLEA;
  *(_OWORD *)&self->mBTConnections.numHID = v6;
  *(_OWORD *)&self->mBTConnections.numeSCO = v7;
  *(_OWORD *)&self->mBTConnections.numA2DP = v5;
  -[WCM_UCMClientManager postBTConnectedDevices](self, "postBTConnectedDevices");
}

+ (id)WCM_UCMClientManagerSingleton
{
  objc_super v4;

  objc_sync_enter(a1);
  if (!qword_100271180)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_UCMClientManager;
    qword_100271180 = (uint64_t)objc_msgSend(objc_msgSendSuper2(&v4, "allocWithZone:", 0), "init");
  }
  objc_sync_exit(a1);
  return (id)qword_100271180;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "WCM_UCMClientManagerSingleton", a3);
}

- (unint64_t)retainCount
{
  return -1;
}

- (WCM_UCMClientManager)init
{
  WCM_UCMClientManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_UCMClientManager;
  v2 = -[WCM_UCMClientManager init](&v4, "init");
  if (v2)
  {
    v2->mUCMClientContexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mBTConnections.numA2DP = 0;
    *(_OWORD *)&v2->mBTConnections.numHID = 0u;
    *(_OWORD *)&v2->mBTConnections.numeSCO = 0u;
    v2->mBTConnections.numLEA = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *mUCMClientContexts;
  objc_super v4;

  mUCMClientContexts = self->mUCMClientContexts;
  if (mUCMClientContexts)

  v4.receiver = self;
  v4.super_class = (Class)WCM_UCMClientManager;
  -[WCM_UCMClientManager dealloc](&v4, "dealloc");
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  switch(a4)
  {
    case '#':
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("UCMClientManager: Rcvd WCMSharing controller event %p"), a3);
      if (a3)
        goto LABEL_9;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateControllerSession:remove context for WCMSharing from UCMClientManager"));
      -[WCM_UCMClientManager deleteUCMClient:](self, "deleteUCMClient:", 1);
      break;
    case '(':
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("UCMClientManager: Rcvd WRMHomeKit controller event %p"), a3);
      if (a3)
        goto LABEL_9;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateControllerSession:remove context for WRMHomeKit from UCMClientManager"));
      -[WCM_UCMClientManager deleteUCMClient:](self, "deleteUCMClient:", 2);
      break;
    case ')':
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("UCMClientManager: Rcvd WRMMIC controller event %p"), a3);
      if (a3)
        goto LABEL_9;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateControllerSession:remove context for WRMMIC from UCMClientManager"));
      -[WCM_UCMClientManager deleteUCMClient:](self, "deleteUCMClient:", 3);
      break;
    case '*':
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("UCMClientManager: Rcvd WRMSOS controller event %p"), a3);
      if (a3)
      {
LABEL_9:
        -[WCM_UCMClientManager addUCMClient:](self, "addUCMClient:", a3);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("UCMClientManager: Init Context"));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateControllerSession:remove context for WRMSOS from UCMClientManager"));
        -[WCM_UCMClientManager deleteUCMClient:](self, "deleteUCMClient:", 4);
      }
      break;
    default:
      return;
  }
}

- (id)getUCMClientFromList:(int)a3
{
  NSMutableArray *mUCMClientContexts;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mUCMClientContexts = self->mUCMClientContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mUCMClientContexts);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "getMyClientType") == a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)getControllerOfId:(int)a3
{
  NSMutableArray *mUCMClientContexts;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mUCMClientContexts = self->mUCMClientContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mUCMClientContexts);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "getProcessId") == a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)postBTConnectedDevices
{
  xpc_object_t v3;
  void *v4;
  NSMutableArray *mUCMClientContexts;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("postBTConnectedDevices"));
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    xpc_dictionary_set_int64(v3, "kWCMBTNumA2DP", self->mBTConnections.numA2DP);
    xpc_dictionary_set_int64(v4, "kWCMBTNumSCO", self->mBTConnections.numSCO);
    xpc_dictionary_set_int64(v4, "kWCMBTNumESCO", self->mBTConnections.numeSCO);
    xpc_dictionary_set_int64(v4, "kWCMBTNumHID", self->mBTConnections.numHID);
    xpc_dictionary_set_int64(v4, "kWCMBTNumLE", self->mBTConnections.numLE);
    xpc_dictionary_set_int64(v4, "kWCMBTNumLEA", self->mBTConnections.numLEA);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    mUCMClientContexts = self->mUCMClientContexts;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(mUCMClientContexts);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "sendMessage:withArgs:", 1429, v4);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    xpc_release(v4);
  }
}

- (void)updateWirelessBtLoad:(unsigned int)a3
{
  unsigned int mCurrentBtLoad;
  unsigned int mMaximumBtLoad;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("updateWirelessBtLoad load: %u"), *(_QWORD *)&a3);
  self->mCurrentBtLoad = a3;
  if (-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer")
    && -[NSTimer isValid](-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer"), "isValid"))
  {
    mMaximumBtLoad = self->mMaximumBtLoad;
    mCurrentBtLoad = self->mCurrentBtLoad;
    if (mCurrentBtLoad > mMaximumBtLoad)
      mMaximumBtLoad = mMaximumBtLoad & 0xFFFF0000 | self->mCurrentBtLoad;
    self->mMaximumBtLoad = mMaximumBtLoad & 0xFFFF00FF | (BYTE1(mCurrentBtLoad) << 8);
  }
}

- (void)getHomeKitBtLoad:(id)a3
{
  xpc_object_t reply;
  _xpc_connection_s *remote_connection;

  reply = xpc_dictionary_create_reply(a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("getHomeKitBtLoad"));
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "kWRMHomeKitBtLoad", self->mMaximumBtLoad);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, reply);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending response to getHomeKitBtLoad message %@"), reply);
    xpc_release(reply);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("getHomeKitBtLoad xpc_reply is NULL"));
  }
}

- (void)startHomeKitTimer:(double)a3
{
  _QWORD v5[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("startHomeKitTimer"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100069170;
  v5[3] = &unk_100201BB8;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)timerHandler:(id)a3
{
  NSMutableArray *mUCMClientContexts;
  xpc_object_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("timerHandler"));
  mUCMClientContexts = self->mUCMClientContexts;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWRMHomeKitBtLoad", self->mMaximumBtLoad);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(mUCMClientContexts);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10);
          if (v11)
            objc_msgSend(v11, "sendMessage:withArgs:", 2803, v6);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    self->mMaximumBtLoad = self->mCurrentBtLoad;
    xpc_release(v6);
  }
}

- (void)stopHomeKitTimer
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("stopHomeKitTimer"));
  if (-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer"))
  {
    -[NSTimer invalidate](-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer"), "invalidate");
    -[WCM_UCMClientManager setHomeKitReportingTimer:](self, "setHomeKitReportingTimer:", 0);
  }
  self->mMaximumBtLoad = 0;
}

- (void)enableHomeKitTimer:(id)a3
{
  xpc_object_t value;
  void *v6;
  double v7;
  unsigned int mCurrentBtLoad;
  const __CFString *v9;
  xpc_object_t reply;
  void *v11;
  _xpc_connection_s *remote_connection;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("enableHomeKitTimer"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v6 = value;
    if (xpc_dictionary_get_BOOL(value, "kWRMHomeKitEnable"))
    {
      v7 = xpc_dictionary_get_double(v6, "kWRMHomeKitDuration");
      if (-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer"))
      {
        if (-[NSTimer isValid](-[WCM_UCMClientManager homeKitReportingTimer](self, "homeKitReportingTimer"), "isValid"))
          -[WCM_UCMClientManager stopHomeKitTimer](self, "stopHomeKitTimer");
      }
      -[WCM_UCMClientManager startHomeKitTimer:](self, "startHomeKitTimer:", v7);
      mCurrentBtLoad = self->mCurrentBtLoad;
    }
    else
    {
      mCurrentBtLoad = self->mMaximumBtLoad;
      -[WCM_UCMClientManager stopHomeKitTimer](self, "stopHomeKitTimer");
    }
    reply = xpc_dictionary_create_reply(a3);
    if (reply)
    {
      v11 = reply;
      xpc_dictionary_set_uint64(reply, "kWRMHomeKitBtLoad", mCurrentBtLoad);
      remote_connection = xpc_dictionary_get_remote_connection(a3);
      xpc_connection_send_message(remote_connection, v11);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending response to enableHomeKitTimer %@"), v11);
      xpc_release(v11);
      return;
    }
    v9 = CFSTR("enableHomeKitTimer xpc_reply is NULL");
  }
  else
  {
    v9 = CFSTR("Error Getting Args");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v9);
}

- (void)enableFrequencyUpdatesForMic:(id)a3
{
  xpc_object_t reply;
  void *v6;
  _xpc_connection_s *remote_connection;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("enableFrequencyUpdatesForMic"));
  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v6 = reply;
    xpc_dictionary_set_BOOL(reply, "kWRMNR41FreuquencyUpdate", self->mCurrentNR41Enabled);
    xpc_dictionary_set_BOOL(v6, "kWRMNR7xFreuquencyUpdate", self->mCurrentNR7xEnabled);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sending response to enableFrequencyUpdatesForMic %@"), v6);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("enableFrequencyUpdatesForMic xpc_reply is NULL"));
  }
}

- (void)sendNRFrequencyUpdateForMic:(BOOL)a3 NR7xenabled:(BOOL)a4
{
  NSMutableArray *mUCMClientContexts;
  xpc_object_t v8;
  void *v9;
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

  mUCMClientContexts = self->mUCMClientContexts;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("sendNRFrequencyUpdateForMic"));
  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    v9 = v8;
    self->mCurrentNR41Enabled = a3;
    self->mCurrentNR7xEnabled = a4;
    xpc_dictionary_set_BOOL(v8, "kWRMNR41FreuquencyUpdate", a3);
    xpc_dictionary_set_BOOL(v9, "kWRMNR7xFreuquencyUpdate", a4);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
            objc_enumerationMutation(mUCMClientContexts);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13);
          if (v14)
            objc_msgSend(v14, "sendMessage:withArgs:", 2806, v9);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    xpc_release(v9);
  }
}

- (void)enableULFrequencyUpdates:(id)a3
{
  NSMutableArray *mUCMClientContexts;
  xpc_object_t v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("enableULFrequencyUpdates"));
  mUCMClientContexts = self->mUCMClientContexts;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_int64(v7, "kWRMULBandInfoType", self->mCurrentBandInfoType);
      xpc_dictionary_set_double(v8, "kWRMULCenterFrequency", self->mCurrentULCenterFrequency);
      xpc_dictionary_set_double(v8, "kWRMULBandwidth", self->mCurrentULBandwidth);
      xpc_dictionary_set_value(v6, "kWRMULFrequencyUpdate", v8);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
              objc_enumerationMutation(mUCMClientContexts);
            v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12);
            if (v13)
              objc_msgSend(v13, "sendMessage:withArgs:", 2808, v6);
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }
      xpc_release(v8);
      xpc_release(v6);
    }
  }
}

- (void)sendULFrequencyUpdates:(id)a3
{
  NSMutableArray *mUCMClientContexts;
  xpc_object_t v6;
  void *v7;
  double v8;
  double v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (a3)
  {
    mUCMClientContexts = self->mUCMClientContexts;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("sendULFrequencyUpdates"));
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      v7 = v6;
      self->mCurrentBandInfoType = (unint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BandInfoType")), "integerValue");
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ULCenterFrequency")), "doubleValue");
      self->mCurrentULCenterFrequency = v8;
      objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ULBandwidth")), "doubleValue");
      self->mCurrentULBandwidth = v9;
      v10 = xpc_dictionary_create(0, 0, 0);
      if (v10)
      {
        v11 = v10;
        xpc_dictionary_set_int64(v10, "kWRMULBandInfoType", self->mCurrentBandInfoType);
        xpc_dictionary_set_double(v11, "kWRMULCenterFrequency", self->mCurrentULCenterFrequency);
        xpc_dictionary_set_double(v11, "kWRMULBandwidth", self->mCurrentULBandwidth);
        xpc_dictionary_set_value(v7, "kWRMULFrequencyUpdate", v11);
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(mUCMClientContexts);
              v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15);
              if (v16)
                objc_msgSend(v16, "sendMessage:withArgs:", 2808, v7);
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mUCMClientContexts, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v13);
        }
        xpc_release(v11);
        xpc_release(v7);
      }
    }
  }
}

- (NSTimer)homeKitReportingTimer
{
  return self->_homeKitReportingTimer;
}

- (void)setHomeKitReportingTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end

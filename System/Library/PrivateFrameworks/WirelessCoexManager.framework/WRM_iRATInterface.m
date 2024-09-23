@implementation WRM_iRATInterface

- (WRM_iRATInterface)init
{
  WRM_iRATInterface *v2;
  NSMutableArray *v3;
  NSMutableArray *mAppLists;
  id mObserver;
  id mOppModeObserver;
  id mProximitySubscribeLinkRecommendationHandler;
  id mProximityGetLinkRecommendationHandler;
  id mOppBtLQMObserver;
  id mLowPowerModePeriodicWakeUpCb;
  NSMutableArray *v11;
  NSMutableArray *mProximityLinkRecommendationList;
  WRM_iRATInterface *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WRM_iRATInterface;
  v2 = -[WRMClientInterface init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAppLists = v2->mAppLists;
    v2->mAppLists = v3;

    v2->mClientSupportsMultipleAppTypes = 0;
    mObserver = v2->mObserver;
    v2->mObserver = 0;

    mOppModeObserver = v2->mOppModeObserver;
    v2->mOppModeObserver = 0;

    mProximitySubscribeLinkRecommendationHandler = v2->mProximitySubscribeLinkRecommendationHandler;
    v2->mProximitySubscribeLinkRecommendationHandler = 0;

    mProximityGetLinkRecommendationHandler = v2->mProximityGetLinkRecommendationHandler;
    v2->mProximityGetLinkRecommendationHandler = 0;

    mOppBtLQMObserver = v2->mOppBtLQMObserver;
    v2->mOppBtLQMObserver = 0;

    mLowPowerModePeriodicWakeUpCb = v2->mLowPowerModePeriodicWakeUpCb;
    v2->mLowPowerModePeriodicWakeUpCb = 0;

    v2->mLinkPreferenceSubscriptionEnabled = 0;
    v2->mTelephoneAssertionEnabled = 0;
    v2->mLocationAssertionEnabled = 0;
    v2->mLocationState = 0;
    v2->mTelephonyStateEnabled = 1;
    v2->mProximitySubscribeLinkRecommendationEnabled = 0;
    v2->mProximityGetLinkRecommendationEnabled = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mProximityLinkRecommendationList = v2->mProximityLinkRecommendationList;
    v2->mProximityLinkRecommendationList = v11;

    v13 = v2;
  }

  return v2;
}

- (void)addAppType:(id)a3
{
  -[NSMutableArray addObject:](self->mAppLists, "addObject:", a3);
}

- (void)removeAppType:(id)a3
{
  NSMutableArray *mAppLists;

  mAppLists = self->mAppLists;
  if (mAppLists)
    -[NSMutableArray removeObject:](mAppLists, "removeObject:", a3);
}

- (void)addProximityLinkRecommendationType:(id)a3
{
  -[NSMutableArray addObject:](self->mProximityLinkRecommendationList, "addObject:", a3);
}

- (void)removeProximityLinkRecommendationType:(id)a3
{
  NSMutableArray *mProximityLinkRecommendationList;

  mProximityLinkRecommendationList = self->mProximityLinkRecommendationList;
  if (mProximityLinkRecommendationList)
    -[NSMutableArray removeObject:](mProximityLinkRecommendationList, "removeObject:", a3);
}

- (void)processBTLQMNotification:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_iRATInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WRM_iRATInterface_processBTLQMNotification___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (void)processLowPowerModePeriodicWakeUpNotification
{
  NSObject *mQueue;
  _QWORD block[5];

  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WRM_iRATInterface_processLowPowerModePeriodicWakeUpNotification__block_invoke;
  block[3] = &unk_24C30D068;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)processOperatingModeNotification:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_iRATInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WRM_iRATInterface_processOperatingModeNotification___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (void)processMetricsNotificationReport:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_iRATInterface *v9;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WRM_iRATInterface_processMetricsNotificationReport___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (void)processNotificationListForTerminus:(id)a3
{
  id v4;
  size_t count;
  NSObject *mQueue;
  id v7;
  _QWORD block[4];
  id v9;
  WRM_iRATInterface *v10;
  size_t v11;

  v4 = a3;
  count = xpc_array_get_count(v4);
  -[NSMutableArray removeAllObjects](self->mProximityLinkRecommendationList, "removeAllObjects");
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WRM_iRATInterface_processNotificationListForTerminus___block_invoke;
  block[3] = &unk_24C30D090;
  v10 = self;
  v11 = count;
  v9 = v4;
  v7 = v4;
  dispatch_async(mQueue, block);

}

- (void)processNotificationList:(id)a3 :(unint64_t)a4
{
  id v6;
  size_t count;
  size_t v8;
  size_t i;
  void *v10;
  uint64_t uint64;
  uint64_t v12;
  void *v13;
  void (**mObserver)(id, uint64_t, uint64_t, void *);
  __int128 v15;
  __int128 v16;

  v6 = a3;
  count = xpc_array_get_count(v6);
  if (count)
  {
    v8 = count;
    for (i = 0; i != v8; ++i)
    {
      xpc_array_get_value(v6, i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
      v12 = xpc_dictionary_get_uint64(v10, "kWRMLinkType");
      xpc_dictionary_get_uint64(v10, "kWRMLinkTypeChangeReasonCode");
      if (a4 == 1301)
      {
        LODWORD(v15) = 0;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v15, "{?=i}");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = xpc_dictionary_get_uint64(v10, "kWRMSubscriptionType");
      }
      else if (a4 == 1302)
      {
        v15 = 0u;
        v16 = 0u;
        *(_QWORD *)&v15 = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkBandwidthEstimateMin");
        *((_QWORD *)&v15 + 1) = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkBandwidthEstimateMax");
        *(_QWORD *)&v16 = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkMovBandwidthEstimateMin");
        *((_QWORD *)&v16 + 1) = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkMovBandwidthEstimateMax");
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v15, "{?=QQQQ}");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        *(_QWORD *)&v15 = 0;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v15, "{?=Q}");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v15 = 0;
      }
      mObserver = (void (**)(id, uint64_t, uint64_t, void *))self->mObserver;
      if (mObserver)
        mObserver[2](mObserver, uint64, v12, v13);

    }
  }

}

- (void)reConnect
{
  NSMutableArray *mAppLists;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WRM_iRATInterface;
  -[WRMClientInterface unregisterClient](&v7, sel_unregisterClient);
  -[WRM_iRATInterface registerClient:queue:](self, "registerClient:queue:", self->super.mProcessId, self->super.mQueue);
  if (self->mLinkPreferenceSubscriptionEnabled)
  {
    mAppLists = self->mAppLists;
    if (self->mClientSupportsMultipleAppTypes)
    {
      -[WRM_iRATInterface subscribeMultipleAppTypes:observer:](self, "subscribeMultipleAppTypes:observer:", mAppLists, self->mObserver);
    }
    else if (mAppLists)
    {
      v5 = 0;
      v6 = 0;
      -[NSMutableArray objectAtIndex:](mAppLists, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getValue:", &v5);
      -[WRM_iRATInterface subscribeAppType:observer:](self, "subscribeAppType:observer:", v5, v6, self->mObserver);

    }
  }
  if (self->mTelephoneAssertionEnabled)
    -[WRM_iRATInterface setTelephonyEnabled:](self, "setTelephonyEnabled:", self->mTelephonyStateEnabled);
  if (self->mLocationAssertionEnabled)
    -[WRM_iRATInterface assertCommCenterBaseBandMode:](self, "assertCommCenterBaseBandMode:", self->mLocationState);
  if (self->mBBAssertionBGAppActive)
  {
    self->mBBAssertionBGAppActive = 0;
    -[WRM_iRATInterface expediteBBAssertionBGAppActive:handler:](self, "expediteBBAssertionBGAppActive:handler:", 1, 0);
  }
  if (self->mProximitySubscribeLinkRecommendationEnabled)
    -[WRM_iRATInterface subscribeProximityLinkRecommendation:](self, "subscribeProximityLinkRecommendation:", self->mProximitySubscribeLinkRecommendationHandler);
  if (self->mProximityGetLinkRecommendationEnabled)
    -[WRM_iRATInterface getProximityLinkRecommendation:recommendation:](self, "getProximityLinkRecommendation:recommendation:", 0, self->mProximityGetLinkRecommendationHandler);
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t uint64;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  xpc_object_t xdict;

  v4 = a4;
  v6 = a3;
  xdict = v6;
  if (v4)
  {
    NSLog(CFSTR("Invoking reConnect"));
    -[WRM_iRATInterface reConnect](self, "reConnect");
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
    xpc_dictionary_get_value(xdict, "kMessageArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    switch(uint64)
    {
      case 0x518uLL:
        -[WRM_iRATInterface processOperatingModeNotification:](self, "processOperatingModeNotification:", v8);
        break;
      case 0x519uLL:
        if (v8)
        {
          xpc_dictionary_get_value(v8, "kWRMApplicationTypeList");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            NSLog(CFSTR("recevied messageID: WRMProximityLinkRecommendation_Terminus message"));
            if (self->mProximityGetLinkRecommendationEnabled || self->mProximitySubscribeLinkRecommendationEnabled)
              -[WRM_iRATInterface processNotificationListForTerminus:](self, "processNotificationListForTerminus:", v11);
            else
              NSLog(CFSTR("Is Proximity link recommendation enabled for Get ?? %d for Subscribe? %d"), 0, 0);

          }
        }
        break;
      case 0x51CuLL:
        -[WRM_iRATInterface processMetricsNotificationReport:](self, "processMetricsNotificationReport:", v8);
        break;
      case 0x51DuLL:
        -[WRM_iRATInterface processBTLQMNotification:](self, "processBTLQMNotification:", v8);
        goto LABEL_13;
      case 0x51EuLL:
        break;
      case 0x51FuLL:
        -[WRM_iRATInterface processLowPowerModePeriodicWakeUpNotification](self, "processLowPowerModePeriodicWakeUpNotification");
        break;
      default:
LABEL_13:
        if (v9)
        {
          xpc_dictionary_get_value(v9, "kWRMApplicationTypeList");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            NSLog(CFSTR("recevied message:%@, list: %@"), xdict, v12);
            -[WRM_iRATInterface processNotificationList::](self, "processNotificationList::", v13, uint64);

          }
        }
        break;
    }

  }
}

- (void)registerClient:(int)a3 queue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  OS_dispatch_queue *mQueue;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
  }
  objc_storeStrong((id *)&self->super.mQueue, v7);
  if (!v6)

  self->super.mProcessId = v4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__WRM_iRATInterface_registerClient_queue___block_invoke;
  v12[3] = &unk_24C30CFE0;
  objc_copyWeak(&v13, &location);
  v9 = (void *)MEMORY[0x20BD2502C](v12);
  mQueue = self->super.mQueue;
  v11.receiver = self;
  v11.super_class = (Class)WRM_iRATInterface;
  -[WRMClientInterface registerClient:queue:notificationHandler:](&v11, sel_registerClient_queue_notificationHandler_, v4, mQueue, v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (int)getSubscribeMessageType:(int)a3
{
  if ((a3 - 11) > 0xF)
    return 400;
  else
    return dword_20A43F268[a3 - 11];
}

- (int)getStatusUpdateMessageType:(int)a3
{
  if ((a3 - 11) > 0xF)
    return 401;
  else
    return dword_20A43F2A8[a3 - 11];
}

- (void)subscribeBtLqmScoreNotification:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__WRM_iRATInterface_subscribeBtLqmScoreNotification___block_invoke;
  v7[3] = &unk_24C30D0B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (void)subscribeOperatingModeChangeNotification:(id)a3
{
  void *v4;
  id mOppModeObserver;

  v4 = (void *)MEMORY[0x20BD2502C](a3, a2);
  mOppModeObserver = self->mOppModeObserver;
  self->mOppModeObserver = v4;

}

- (void)subscribeProximityLinkRecommendation:(id)a3
{
  id v4;
  unsigned int mProcessId;
  const char *v6;
  NSObject *mQueue;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v6 = off_24C30D268[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v6 = "WRMSOS";
  }
  else
  {
    v6 = "INVALID_PROC_ID!!!";
  }
  NSLog(CFSTR("Received subscribeProximityLinkRecommendation call from %s"), v6);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WRM_iRATInterface_subscribeProximityLinkRecommendation___block_invoke;
  block[3] = &unk_24C30D0B8;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(mQueue, block);

}

- (void)getLinkRecommendationMetrics:(id)a3
{
  id v4;
  unsigned int mProcessId;
  const char *v6;
  NSObject *mQueue;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v6 = off_24C30D268[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v6 = "WRMSOS";
  }
  else
  {
    v6 = "INVALID_PROC_ID!!!";
  }
  NSLog(CFSTR("Received getLinkRecommendationMetrics call from %s"), v6);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WRM_iRATInterface_getLinkRecommendationMetrics___block_invoke;
  block[3] = &unk_24C30D0B8;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(mQueue, block);

}

- (void)getProximityLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
  id v6;
  unsigned int mProcessId;
  const char *v8;
  NSObject *mQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v6 = a4;
  mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v8 = off_24C30D268[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v8 = "WRMSOS";
  }
  else
  {
    v8 = "INVALID_PROC_ID!!!";
  }
  NSLog(CFSTR("Received getProximityLinkRecommendation call from %s"), v8);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WRM_iRATInterface_getProximityLinkRecommendation_recommendation___block_invoke;
  block[3] = &unk_24C30D0E0;
  block[4] = self;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  dispatch_async(mQueue, block);

}

- (void)statusUpdateAppLinkPreference:(int)a3 status:(BOOL)a4
{
  const char *v7;
  const char *v8;
  NSObject *mQueue;
  _QWORD block[5];
  int v11;
  BOOL v12;

  if (a3 >= 3)
  {
    v7 = "INVALID_AppLinkPreferenceType!!!";
    if (a3 == 3)
      v7 = "Cellular";
  }
  else
  {
    v7 = off_24C30D250[a3];
  }
  v8 = "No";
  if (a4)
    v8 = "Yes";
  NSLog(CFSTR("%s: linkPrefType %s, active %s"), a2, "-[WRM_iRATInterface statusUpdateAppLinkPreference:status:]", v7, v8);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WRM_iRATInterface_statusUpdateAppLinkPreference_status___block_invoke;
  block[3] = &unk_24C30D108;
  block[4] = self;
  v11 = a3;
  v12 = a4;
  dispatch_async(mQueue, block);
}

- (void)getStreamingInfo:(id)a3 linkType:(int)a4
{
  id v6;
  NSObject *mQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke;
  block[3] = &unk_24C30D130;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(mQueue, block);

}

- (void)getMLPredictedThroughput:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *mQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke;
  block[3] = &unk_24C30D158;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(mQueue, block);

}

- (void)assertCommCenterBaseBandMode:(int)a3
{
  NSObject *mQueue;
  _QWORD v4[5];
  int v5;

  mQueue = self->super.mQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WRM_iRATInterface_assertCommCenterBaseBandMode___block_invoke;
  v4[3] = &unk_24C30D180;
  v4[4] = self;
  v5 = a3;
  dispatch_async(mQueue, v4);
}

- (void)expediteCellularForReason:(BOOL)a3 reason:(id)a4
{
  NSObject *mQueue;
  _QWORD block[5];
  id v6;
  BOOL v7;

  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke;
  block[3] = &unk_24C30D0E0;
  v7 = a3;
  block[4] = self;
  v6 = 0;
  dispatch_async(mQueue, block);

}

- (void)setTelephonyEnabled:(BOOL)a3
{
  NSObject *mQueue;
  _QWORD v4[5];
  BOOL v5;

  mQueue = self->super.mQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__WRM_iRATInterface_setTelephonyEnabled___block_invoke;
  v4[3] = &unk_24C30D1D0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(mQueue, v4);
}

- (void)subscribeStandaloneLinkRecommendation:(id)a3
{
  -[WRM_iRATInterface subscribeAppType:observer:](self, "subscribeAppType:observer:", 1, 0x100000000, a3);
}

- (void)subscribeDataLinkRecommendation:(id)a3
{
  -[WRM_iRATInterface subscribeAppType:observer:](self, "subscribeAppType:observer:", 0, 0x100000000, a3);
}

- (void)subscribeAppType:(id)a3 observer:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *mQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a3.var2;
  v5 = *(_QWORD *)&a3.var0;
  v7 = a4;
  mQueue = self->super.mQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__WRM_iRATInterface_subscribeAppType_observer___block_invoke;
  v10[3] = &unk_24C30D1F8;
  v12 = v5;
  v13 = v4;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(mQueue, v10);

}

- (void)subscribeMultipleAppTypes:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  NSObject *mQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WRM_iRATInterface_subscribeMultipleAppTypes_observer___block_invoke;
  block[3] = &unk_24C30D158;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(mQueue, block);

}

- (void)statusUpdateAppType:(int)a3 linkType:(int)a4 serviceStatus:(BOOL)a5
{
  NSObject *mQueue;
  _QWORD v6[5];
  int v7;
  BOOL v8;

  mQueue = self->super.mQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__WRM_iRATInterface_statusUpdateAppType_linkType_serviceStatus___block_invoke;
  v6[3] = &unk_24C30D108;
  v6[4] = self;
  v7 = a3;
  v8 = a5;
  dispatch_async(mQueue, v6);
}

- (void)_expediteBBAssertionBGAppActive_sync:(BOOL)a3 handler:(id)a4
{
  id v6;
  NSObject *mQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke;
  block[3] = &unk_24C30D0E0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(mQueue, block);

}

- (void)expediteBBAssertionBGAppActive:(BOOL)a3 handler:(id)a4
{
  void *v6;
  NSObject *mQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = (void *)MEMORY[0x20BD2502C](a4, a2);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke;
  block[3] = &unk_24C30D0E0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(mQueue, block);

}

- (void)unregisterClient
{
  NSObject *mQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_iRATInterface;
  -[WRMClientInterface unregisterClient](&v5, sel_unregisterClient);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WRM_iRATInterface_unregisterClient__block_invoke;
  block[3] = &unk_24C30D068;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProximityLinkRecommendationList, 0);
  objc_storeStrong(&self->mLowPowerModePeriodicWakeUpCb, 0);
  objc_storeStrong(&self->mOppBtLQMObserver, 0);
  objc_storeStrong(&self->mGetLinkRecommendationMetricsHandler, 0);
  objc_storeStrong(&self->mProximityGetLinkRecommendationHandler, 0);
  objc_storeStrong(&self->mProximitySubscribeLinkRecommendationHandler, 0);
  objc_storeStrong(&self->mOppModeObserver, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAppLists, 0);
}

@end

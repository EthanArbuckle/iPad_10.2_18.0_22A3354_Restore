@implementation WRM_ProximityLinkEval

- (WRM_ProximityLinkEval)init
{
  WRM_ProximityLinkEval *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mLinkEvalManagerQueue;
  uint64_t v5;
  WRM_BTBeaconController *mBTBeaconController;
  uint64_t v7;
  NSMutableDictionary *mRSSIDict;
  uint64_t v9;
  NSMutableDictionary *mHotspotDict;
  NSMutableSet *v11;
  NSMutableSet *mIPhoneIDSet;
  WRM_BTBeaconController *v13;
  _QWORD v15[4];
  WRM_ProximityLinkEval *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WRM_ProximityLinkEval;
  v2 = -[WRM_ProximityLinkEval init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WirelessRadioManager.BT", 0);
    mLinkEvalManagerQueue = v2->mLinkEvalManagerQueue;
    v2->mLinkEvalManagerQueue = (OS_dispatch_queue *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[WRM_BTBeaconController WRM_BTBeaconControllerSingleton](WRM_BTBeaconController, "WRM_BTBeaconControllerSingleton"));
    mBTBeaconController = v2->mBTBeaconController;
    v2->mBTBeaconController = (WRM_BTBeaconController *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mRSSIDict = v2->mRSSIDict;
    v2->mRSSIDict = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mHotspotDict = v2->mHotspotDict;
    v2->mHotspotDict = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
    mIPhoneIDSet = v2->mIPhoneIDSet;
    v2->mIPhoneIDSet = v11;

    objc_initWeak(&location, v2);
    v13 = v2->mBTBeaconController;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000939F0;
    v15[3] = &unk_100203D48;
    objc_copyWeak(&v17, &location);
    v16 = v2;
    -[WRM_BTBeaconController setClientCBDeviceHandler:](v13, "setClientCBDeviceHandler:", v15);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Initialized ProximityLinkEval manager"));

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)submitMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  WRM_ProximityLinkEval *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->mHotspotDict, "valueForKey:", v4));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->mRSSIDict, "valueForKey:", v4));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("btRssi")));
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("btRssi"));

  }
  if (!objc_msgSend(v5, "count"))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:submitMetrics: Metrics not collected for deviceID %@"), v4);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100093E84;
  v12[3] = &unk_100203D70;
  v9 = v5;
  v13 = v9;
  v14 = self;
  AnalyticsSendEventLazy(CFSTR("com.apple.Telephony.wrmCompanionRecommendation"), v12);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:submitMetrics: Metrics submitted for deviceID %@"), v4);
  v10 = v9;

  return v10;
}

- (id)submitMetrics
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->mIPhoneIDSet, "anyObject"));
  if (!v3)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:submitMetrics: Metrics not collected for any iPhone device %@"), self->mIPhoneIDSet);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:submitMetrics: Calling submitMetrics for deviceID %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_ProximityLinkEval submitMetrics:](self, "submitMetrics:", v3));

  return v4;
}

- (id)filterDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mRSSIDict, "allValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(model contains[cd] %@)"), v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->mHotspotDict, "allValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(model contains[cd] %@)"), v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));

  v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->mRSSIDict, "allKeysForObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v16)));
        objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->mHotspotDict, "allKeysForObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22)));
        objc_msgSend(v11, "addObject:", v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:filterDevices: For modelString: %@: deviceIDs: %@"), v4, v11, (_QWORD)v25);
  return v11;
}

- (id)nameForNetworkType:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue");
  if (v3 > 8)
    return CFSTR("INVALID");
  else
    return off_100203DB8[v3];
}

- (void)evalWiFiVersusPHSLink:(int)a3
{
  void *v4;
  id v5;
  id v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:evalWiFiVersusPHSLink: RSSI Statistics %@, callActive: %d"), self->mRSSIDict, *(_QWORD *)&a3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProximityLinkEval:evalWiFiVersusPHSLink: PHS Statistics %@"), self->mHotspotDict);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_ProximityLinkEval submitMetrics](self, "submitMetrics"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("ProimiyLinkEval:evalWiFiVersusPHSLink: submitMetrics test %@"), v4);

  v5 = -[WRM_ProximityLinkEval filterDevices:](self, "filterDevices:", CFSTR("mac"));
  v6 = -[WRM_ProximityLinkEval filterDevices:](self, "filterDevices:", CFSTR("iphone"));
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v5;
  NSObject *mLinkEvalManagerQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Found hotspots %@"), v5);
  objc_initWeak(&location, self);
  mLinkEvalManagerQueue = self->mLinkEvalManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094670;
  block[3] = &unk_100203D98;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(mLinkEvalManagerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)updateWiFiRadioMetrics:(int)a3 signalQuality:(int)a4 load:(int)a5 pointOFInterest:(int)a6
{
  self->mWiFiRSSI = a3;
  self->mWiFiSNR = a4;
  self->mCCA = a5;
  self->mPOI = a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIPhoneIDSet, 0);
  objc_storeStrong((id *)&self->mBTBeaconController, 0);
  objc_storeStrong((id *)&self->mLinkEvalManagerQueue, 0);
  objc_storeStrong((id *)&self->mHotspotDict, 0);
  objc_storeStrong((id *)&self->mRSSIDict, 0);
  objc_storeStrong((id *)&self->mHotSpotSession, 0);
}

@end

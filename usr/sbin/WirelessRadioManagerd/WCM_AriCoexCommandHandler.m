@implementation WCM_AriCoexCommandHandler

- (void)connectBaseband
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("ICE Client to be started"));
  sub_1000CA890((ice::Client **)self->mIceClient.__ptr_);
}

- (void)setCoexOSFeatureFlag
{
  BOOL *coexOSFeatureGroupEnabled;
  BOOL *v4;
  uint64_t i;

  self->coexOSFeatureGroupEnabled[0] = 1;
  coexOSFeatureGroupEnabled = self->coexOSFeatureGroupEnabled;
  *(_QWORD *)&self->coexOSFeatureGroupEnabled[1] = 0;
  v4 = &self->coexOSFeatureGroupEnabled[1];
  *(_DWORD *)&self->coexOSFeatureGroupEnabled[9] = 0;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureTimeSharing"))
    *v4 = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureRxActivityProtect"))
    self->coexOSFeatureGroupEnabled[2] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureCamera"))
    self->coexOSFeatureGroupEnabled[3] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureConditionalMitigation"))
    self->coexOSFeatureGroupEnabled[4] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureBTClockAlignment"))
    self->coexOSFeatureGroupEnabled[5] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureHPCellular"))
    self->coexOSFeatureGroupEnabled[6] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureUwb"))
    self->coexOSFeatureGroupEnabled[7] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureNFC"))
    self->coexOSFeatureGroupEnabled[9] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureUSBC"))
    self->coexOSFeatureGroupEnabled[8] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureGnssIMD"))
    self->coexOSFeatureGroupEnabled[10] = 1;
  if (_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureAntTuner"))
    self->coexOSFeatureGroupEnabled[11] = 1;
  if ((_os_feature_enabled_impl("wirelessradiomanager", "ARIFeatureStateInd") & 1) != 0)
    self->coexOSFeatureGroupEnabled[12] = 1;
  for (i = 0; i != 13; ++i)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver:  coexOSFeatureGroupEnabled[%u] = %d\n"), i, coexOSFeatureGroupEnabled[i]);
}

- (void)setCoexPlatformFeatureFlag
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t i;
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  *(_QWORD *)&self->coexPlatformFeatureGroupEnabled[1] = 0;
  self->coexPlatformFeatureGroupEnabled[0] = 1;
  *(_DWORD *)&self->coexPlatformFeatureGroupEnabled[9] = 0;
  v29 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeCoexFeatures"));
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("CoexFeatureGroupTimeSharingSupport"));

  if (v5)
    self->coexPlatformFeatureGroupEnabled[1] = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("CoexFeatureGroupRxActivityProtectSupport"));

  if (v7)
    self->coexPlatformFeatureGroupEnabled[2] = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("CoexFeatureGroupCameraSupport"));

  if (v9)
    self->coexPlatformFeatureGroupEnabled[3] = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("CoexFeatureGroupConditionalMitigationSupport"));

  if (v11)
    self->coexPlatformFeatureGroupEnabled[4] = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v13 = objc_msgSend(v12, "containsObject:", CFSTR("CoexFeatureGroupBtClockAlignmentSupport"));

  if (v13)
    self->coexPlatformFeatureGroupEnabled[5] = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v15 = objc_msgSend(v14, "containsObject:", CFSTR("CoexFeatureGroupHpCellularSupport"));

  if (v15)
    self->coexPlatformFeatureGroupEnabled[6] = 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v17 = objc_msgSend(v16, "containsObject:", CFSTR("CoexFeatureGroupUwbSupport"));

  if (v17)
    self->coexPlatformFeatureGroupEnabled[7] = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v19 = objc_msgSend(v18, "containsObject:", CFSTR("CoexFeatureGroupNfcSupport"));

  if (v19)
    self->coexPlatformFeatureGroupEnabled[9] = 1;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v21 = objc_msgSend(v20, "containsObject:", CFSTR("CoexFeatureGroupUsbCSupport"));

  if (v21)
    self->coexPlatformFeatureGroupEnabled[8] = 1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v23 = objc_msgSend(v22, "containsObject:", CFSTR("CoexFeatureGroupGnssImdSupport"));

  if (v23)
    self->coexPlatformFeatureGroupEnabled[10] = 1;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v25 = objc_msgSend(v24, "containsObject:", CFSTR("CoexFeatureGroupAntTunerSupport"));

  if (v25)
    self->coexPlatformFeatureGroupEnabled[11] = 1;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "activeCoexFeatures"));
  v27 = objc_msgSend(v26, "containsObject:", CFSTR("CoexFeatureGroupStateIndSupport"));

  if ((v27 & 1) != 0)
    self->coexPlatformFeatureGroupEnabled[12] = 1;
  for (i = 0; i != 13; ++i)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver:  coexPlatformFeatureGroupEnabled[%u] = %d\n"), i, self->coexPlatformFeatureGroupEnabled[i]);

}

- (BOOL)ariApiEnabledByOSFeatureFlag:(int)a3
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)qword_100270EC0;
  if (!qword_100270EC0)
    return 0;
  v4 = *(_QWORD *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v6));

  if (!v7)
    return 0;
  v8 = (void *)qword_100270EC0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));
  v11 = (unint64_t)objc_msgSend(v10, "integerValue");

  return v11 <= 0xC && self->coexOSFeatureGroupEnabled[v11];
}

- (WCM_AriCoexCommandHandler)init
{
  WCM_AriCoexCommandHandler *v2;
  WCM_AriCoexCommandHandler *v3;
  WCM_CellularController *mCellularController;
  WCM_AntBlockPowerLimitPolicy *mAntBlockPolicy;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_object *fObj;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *mQueue;
  shared_ptr<WRMIceClient> *p_mIceClient;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  WCM_AriCoexCache *v18;
  WCM_AriCoexCache *mCache;
  uint64_t *ptr;
  WCM_AriCoexCommandHandler *v21;
  uint64_t *v22;
  _QWORD v24[4];
  WCM_AriCoexCommandHandler *v25;
  _QWORD v26[4];
  WCM_AriCoexCommandHandler *v27;
  __int128 v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)WCM_AriCoexCommandHandler;
  v2 = -[WCM_AriCoexCommandHandler init](&v29, "init");
  v3 = v2;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Init the WCM_AriCoexCommandHandler"));
  if (v2)
  {
    mCellularController = v2->mCellularController;
    v2->mCellularController = 0;

    mAntBlockPolicy = v2->mAntBlockPolicy;
    v2->mAntBlockPolicy = 0;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.WRM_IceClientDriver.CoexManager", v7);
    fObj = v2->mIceClientQueue.fObj.fObj;
    v2->mIceClientQueue.fObj.fObj = (OS_dispatch_object *)v8;

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.CoexManager.AriDriver", v11);
    mQueue = v2->mQueue;
    v2->mQueue = (OS_dispatch_queue *)v12;

    sub_10002C140((id *)&v2->mIceClientQueue.fObj.fObj, (OS_dispatch_object *)"com.apple.WirelessRadioManagerd.CoexManager", &v28);
    p_mIceClient = &v2->mIceClient;
    sub_100020AA4((uint64_t)p_mIceClient, &v28);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = objc_alloc_init(WCM_AriCoexCache);
    mCache = v3->mCache;
    v3->mCache = v18;

    v3->basebandPowerOn = 0;
    -[WCM_AriCoexCommandHandler setCoexOSFeatureFlag](v3, "setCoexOSFeatureFlag");
    ptr = (uint64_t *)v3->mIceClient.__ptr_;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100020B08;
    v26[3] = &unk_100201838;
    v21 = v3;
    v27 = v21;
    sub_1000CA8A0(ptr, 0, (uint64_t)v26);
    v22 = (uint64_t *)p_mIceClient->__ptr_;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100020B10;
    v24[3] = &unk_100201838;
    v25 = v21;
    sub_1000CA8A0(v22, 1, (uint64_t)v24);

  }
  return v3;
}

- (void)setCellularController:(id)a3
{
  objc_storeStrong((id *)&self->mCellularController, a3);
}

- (void)clientStarted
{
  uint64_t *ptr;
  uint64_t *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver:  ICE Client started\n"));
  self->basebandPowerOn = 1;
  -[WCM_AriCoexCommandHandler setCoexPlatformFeatureFlag](self, "setCoexPlatformFeatureFlag");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver: unit test is NOT requested, ARI is enabled, update BB power state\n"));
  -[WCM_AriCoexCommandHandler updateBasebandPowerState](self, "updateBasebandPowerState");
  -[WCM_AriCoexCommandHandler setSpmiFeature](self, "setSpmiFeature");
  -[WCM_AriCoexCommandHandler setDefaultEvent](self, "setDefaultEvent");
  ptr = (uint64_t *)self->mIceClient.__ptr_;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020C58;
  v6[3] = &unk_100201860;
  v6[4] = self;
  sub_1000CA970(ptr, 1233321984, (uint64_t)v6);
  v4 = (uint64_t *)self->mIceClient.__ptr_;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020C68;
  v5[3] = &unk_100201860;
  v5[4] = self;
  sub_1000CA970(v4, 630194176, (uint64_t)v5);
  -[WCM_AriCoexCommandHandler configureAccReportMode](self, "configureAccReportMode");
  -[WCM_AriCoexCommandHandler setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:](self, "setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:", 0, 100, 5000);
  -[WCM_AriCoexCommandHandler setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:](self, "setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:", 1, 100, 5000);
  -[WCM_AriCoexCommandHandler replayCachedEvent](self, "replayCachedEvent");
}

- (void)clientStopped
{
  self->basebandPowerOn = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver:  ICE Client stopped\n"));
}

- (id)createMessageWithMsgId:(unint64_t)a3 withArgs:(id)a4 withSubId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t values[3];
  char *keys[2];
  const char *v16;

  v7 = a4;
  v8 = a5;
  *(_OWORD *)keys = *(_OWORD *)off_1002018A8;
  v16 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  v9 = v7;
  values[1] = v9;
  v10 = v8;
  values[2] = v10;
  v11 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  for (i = 2; i != -1; --i)

  return v11;
}

- (BOOL)cacheTunerTransparentMessage:(id)a3
{
  id v4;
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  uint64_t uint64;
  BOOL v14;

  v4 = a3;
  value = xpc_dictionary_get_value(v4, "kMessageArgs");
  v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  v7 = xpc_dictionary_get_value(v6, "kWCMCellularTransparentMessageInformationSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8 && xpc_array_get_count(v8))
  {
    v10 = xpc_array_get_value(v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11 && (uint64 = xpc_dictionary_get_uint64(v11, "kWCMCellularTransparentMessage_Type"), uint64 < 4))
    {
      -[WCM_AriCoexCache update:value_object:subId:](self->mCache, "update:value_object:subId:", off_100201960[uint64], v4, 0);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)cacheEvent:(id)a3
{
  id v4;
  uint64_t uint64;
  BOOL v6;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
  if (uint64 == 1223)
  {
    v6 = -[WCM_AriCoexCommandHandler cacheTunerTransparentMessage:](self, "cacheTunerTransparentMessage:", v4);
  }
  else if (uint64 == 1233)
  {
    -[WCM_AriCoexCache update:value_object:subId:](self->mCache, "update:value_object:subId:", CFSTR("kCameraStateEvent"), v4, 0);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)replayCachedEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self->mCache, "get:subId:", CFSTR("kCameraStateEvent"), 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self->mCache, "get:subId:", CFSTR("kTunerStateWiFi"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self->mCache, "get:subId:", CFSTR("kTunerStateBT"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self->mCache, "get:subId:", CFSTR("kTunerStateUWB"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self->mCache, "get:subId:", CFSTR("kTunerStateGNSS"), 0));
  if (v7)
  {
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v7);
    -[WCM_AriCoexCache removeKey:subId:](self->mCache, "removeKey:subId:", CFSTR("kCameraStateEvent"), 0);
  }
  if (v3)
  {
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v3);
    -[WCM_AriCoexCache removeKey:subId:](self->mCache, "removeKey:subId:", CFSTR("kTunerStateWiFi"), 0);
  }
  if (v4)
  {
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v4);
    -[WCM_AriCoexCache removeKey:subId:](self->mCache, "removeKey:subId:", CFSTR("kTunerStateBT"), 0);
  }
  if (v5)
  {
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v5);
    -[WCM_AriCoexCache removeKey:subId:](self->mCache, "removeKey:subId:", CFSTR("kTunerStateUWB"), 0);
  }
  if (v6)
  {
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v6);
    -[WCM_AriCoexCache removeKey:subId:](self->mCache, "removeKey:subId:", CFSTR("kTunerStateGNSS"), 0);
  }

}

- (void)handleEvent:(id)a3
{
  id v4;
  uint64_t uint64;
  xpc_object_t v6;
  NSObject *mQueue;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
  if (self->basebandPowerOn)
  {
    v6 = xpc_copy(v4);
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021234;
    block[3] = &unk_100201888;
    block[4] = self;
    v12 = v6;
    v8 = v6;
    dispatch_async(mQueue, block);

  }
  else
  {
    v9 = uint64;
    if (-[WCM_AriCoexCommandHandler cacheEvent:](self, "cacheEvent:", v4))
      v10 = CFSTR("Coex ARI Driver:  ICE client is not ready yet, XPC message(%llu) is cached");
    else
      v10 = CFSTR("Coex ARI Driver:  ICE client is not ready yet, XPC message(%llu) is discarded");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v10, v9);
  }

}

- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4
{
  WCM_AntBlockPowerLimitPolicy *v7;
  WCM_AntBlockPowerLimitPolicy *mAntBlockPolicy;
  WCM_AntBlockPowerLimitPolicy *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *mQueue;
  void *v24;
  void *v25;
  xpc_object_t v26;
  xpc_object_t value;
  _QWORD block[5];
  id v29;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Initialize WCM_AntBlockPowerLimitPolicy on PlatformId(%llu)..."), a3);
  v7 = -[WCM_AntBlockPowerLimitPolicy initWithPlatformId:]([WCM_AntBlockPowerLimitPolicy alloc], "initWithPlatformId:", a3);
  mAntBlockPolicy = self->mAntBlockPolicy;
  self->mAntBlockPolicy = v7;

  v9 = self->mAntBlockPolicy;
  if (!v9)
    return;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](v9, "getAntBlockConfigXpcMsgOnClient:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 1));
  value = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 2));
  v26 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigXpcMsgOnClient:](self->mAntBlockPolicy, "getAntBlockConfigXpcMsgOnClient:", 6));
  v14 = xpc_uint64_create(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AntBlockPowerLimitPolicy getAntBlockConfigGnssImdClient](self->mAntBlockPolicy, "getAntBlockConfigGnssImdClient"));
  if (v25)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler createMessageWithMsgId:withArgs:withSubId:](self, "createMessageWithMsgId:withArgs:withSubId:", 1225, v25, v14));
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v16);

  }
  if (v24)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler createMessageWithMsgId:withArgs:withSubId:](self, "createMessageWithMsgId:withArgs:withSubId:", 1226, v24, v14));
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v17);

  }
  if (value || v26 || v10 || v12 || v11)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    v19 = v18;
    if (value)
      xpc_dictionary_set_value(v18, "kWCMCellularSetAntBlocking_FrontCameraPolicy", value);
    if (v26)
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy", v26);
    if (v11)
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearUltraWideCameraPolicy", v11);
    if (v10)
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearWideCameraPolicy", v10);
    if (v12)
      xpc_dictionary_set_value(v19, "kWCMCellularSetAntBlocking_RearTeleCameraPolicy", v12);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler createMessageWithMsgId:withArgs:withSubId:](self, "createMessageWithMsgId:withArgs:withSubId:", 1227, v19, v14));
      -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v20);

      v21 = v19;
      if (!v13)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  v21 = 0;
  if (v13)
  {
LABEL_25:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler createMessageWithMsgId:withArgs:withSubId:](self, "createMessageWithMsgId:withArgs:withSubId:", 1228, v13, v14));
    -[WCM_AriCoexCommandHandler handleEvent:](self, "handleEvent:", v22);

  }
LABEL_26:
  if (v15)
  {
    mQueue = self->mQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002167C;
    block[3] = &unk_100201888;
    block[4] = self;
    v29 = v15;
    dispatch_async(mQueue, block);

  }
}

- (void)handleCoexManagerEvent:(id)a3
{
  uint64_t uint64;
  uint64_t v5;
  xpc_object_t value;
  void *v7;
  xpc_object_t xdict;

  xdict = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver: Handling XPC Event : %@"), xdict);
  uint64 = xpc_dictionary_get_uint64(xdict, "kMessageId");
  if (uint64)
  {
    v5 = xpc_dictionary_get_uint64(xdict, "kSubId");
    value = xpc_dictionary_get_value(xdict, "kMessageArgs");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    switch(uint64)
    {
      case 0x4B0uLL:
        -[WCM_AriCoexCommandHandler getCellularNetworkConfig:SubId:](self, "getCellularNetworkConfig:SubId:", v7, v5);
        break;
      case 0x4B8uLL:
        -[WCM_AriCoexCommandHandler setScanFreq:SubId:](self, "setScanFreq:SubId:", v7, v5);
        break;
      case 0x4BEuLL:
        -[WCM_AriCoexCommandHandler setTimesharingConfig:SubId:](self, "setTimesharingConfig:SubId:", v7, v5);
        break;
      case 0x4BFuLL:
        -[WCM_AriCoexCommandHandler setCellularAntBitmap:SubId:](self, "setCellularAntBitmap:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setCellularAntBitmap:SubId:](self, "setCellularAntBitmap:SubId:", v7, 1);
        break;
      case 0x4C1uLL:
        -[WCM_AriCoexCommandHandler setCC1Config:SubId:](self, "setCC1Config:SubId:", v7, v5);
        break;
      case 0x4C2uLL:
        -[WCM_AriCoexCommandHandler setCC2Config:SubId:](self, "setCC2Config:SubId:", v7, v5);
        break;
      case 0x4C7uLL:
        -[WCM_AriCoexCommandHandler handleTransparentMessage:SubId:](self, "handleTransparentMessage:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler handleTransparentMessage:SubId:](self, "handleTransparentMessage:SubId:", v7, 1);
        break;
      case 0x4C9uLL:
        -[WCM_AriCoexCommandHandler setCnvAntBlockingPowerLimitingConfig:SubId:](self, "setCnvAntBlockingPowerLimitingConfig:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setCnvAntBlockingPowerLimitingConfig:SubId:](self, "setCnvAntBlockingPowerLimitingConfig:SubId:", v7, 1);
        break;
      case 0x4CAuLL:
        -[WCM_AriCoexCommandHandler setUwbAntBlockingPowerLimitingConfig:SubId:](self, "setUwbAntBlockingPowerLimitingConfig:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setUwbAntBlockingPowerLimitingConfig:SubId:](self, "setUwbAntBlockingPowerLimitingConfig:SubId:", v7, 1);
        break;
      case 0x4CBuLL:
        -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingConfig:SubId:](self, "setCamAntBlockingPowerLimitingConfig:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingConfig:SubId:](self, "setCamAntBlockingPowerLimitingConfig:SubId:", v7, 1);
        break;
      case 0x4CCuLL:
        -[WCM_AriCoexCommandHandler setE85AntBlockingPowerLimitingConfig:SubId:](self, "setE85AntBlockingPowerLimitingConfig:SubId:", v7, v5);
        break;
      case 0x4CDuLL:
        break;
      case 0x4CEuLL:
        -[WCM_AriCoexCommandHandler setCellularMiscConfig:SubId:](self, "setCellularMiscConfig:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setCellularMiscConfig:SubId:](self, "setCellularMiscConfig:SubId:", v7, 1);
        break;
      case 0x4CFuLL:
        -[WCM_AriCoexCommandHandler setCellularTxActivityConfig:SubId:](self, "setCellularTxActivityConfig:SubId:", v7, v5);
        break;
      case 0x4D0uLL:
        -[WCM_AriCoexCommandHandler getCellularLaaMeasInfo:SubId:](self, "getCellularLaaMeasInfo:SubId:", v7, v5);
        break;
      case 0x4D1uLL:
        -[WCM_AriCoexCommandHandler setCameraState:SubId:](self, "setCameraState:SubId:", v7, 0);
        -[WCM_AriCoexCommandHandler setCameraState:SubId:](self, "setCameraState:SubId:", v7, 1);
        break;
      case 0x4D2uLL:
        -[WCM_AriCoexCommandHandler setAllCCConfig:SubId:](self, "setAllCCConfig:SubId:", v7, v5);
        break;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver does not support message %llu"), uint64);
        break;
    }

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI Driver:  XPC miss key of message id"));
  }

}

- (int)convertInternalCallType:(unint64_t)a3
{
  if (a3 == 1)
    return 2;
  else
    return 1;
}

- (int)convertInternalCoexTech:(unint64_t)a3
{
  if (a3 > 0xB)
    return 127;
  else
    return dword_1001DB634[a3];
}

- (unint64_t)getSubIdFromInternalCoexTech:(unint64_t)a3
{
  if (a3 - 6 > 5)
    return 0;
  else
    return qword_1001DB668[a3 - 6];
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withSubId:(unint64_t)a5
{
  id v8;
  xpc_object_t v9;
  id v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  xpc_object_t values[3];
  char *keys[2];
  const char *v16;

  v8 = a4;
  v9 = xpc_uint64_create(a5);
  *(_OWORD *)keys = *(_OWORD *)off_1002018A8;
  v16 = "kSubId";
  values[0] = xpc_uint64_create(a3);
  v10 = v8;
  values[1] = v10;
  v11 = v9;
  values[2] = v11;
  v12 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (self->mCellularController)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver: Sending messageId(%lld) to Coex Manager %@"), a3, v12);
    -[WCM_CellularController handleMessage:](self->mCellularController, "handleMessage:", v12);
  }

  for (i = 2; i != -1; --i)
}

- (BOOL)checkError:(void *)a3 expectedGMID:(unsigned int)a4
{
  uint64_t v4;
  unint64_t GMID;
  int v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  GMID = AriSdk::MsgBase::getGMID((AriSdk::MsgBase *)a3);
  v6 = (GMID >> 17) & 0xFFFF8000 | ((_DWORD)GMID << 26);
  if (v6 == 67600384)
  {
    v7 = CFSTR("Coex ARI Driver: response NACK");
  }
  else
  {
    if (v6 == (_DWORD)v4)
      return 1;
    v9 = v4;
    v10 = (GMID >> 17) & 0xFFFF8000 | ((_DWORD)GMID << 26);
    v7 = CFSTR("Coex ARI Driver: expected response GMID=%u, received response GMID=%u");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v7, v9, v10);
  return 0;
}

- (BOOL)checkErrorMsgGmid:(unsigned int)a3 expectedGMID:(unsigned int)a4 API_Str:(const char *)a5
{
  uint64_t v6;
  uint64_t v7;

  if (a3 == 67600384)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver: %s received NACK response"), a5, v6, v7);
  }
  else
  {
    if (a3 == a4)
      return 1;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver: %s expected response GMID=%u, received response GMID=%u"), a5, *(_QWORD *)&a4, *(_QWORD *)&a3);
  }
  return 0;
}

- (BOOL)coexTechEnumCheck:(unint64_t)a3
{
  int64x2_t v3;
  char v4;
  BOOL v6;

  v3 = vdupq_n_s64(a3);
  v4 = vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001DB6A0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001DB6B0)))) | (a3 == 32);
  v6 = a3 == 64 || a3 == 128;
  return v4 & 1 | (v6 || a3 - 1 < 2);
}

- (BOOL)mitigationTypeEnumCheck:(unint64_t)a3
{
  return a3 < 4;
}

- (BOOL)LQMEnumCheck:(unint64_t)a3
{
  int64x2_t v3;

  v3 = vdupq_n_s64(a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001DB6C0), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_1001DB6D0)))) & 1 | (a3 == 100);
}

- (BOOL)cameraEnumCheck:(unint64_t)a3
{
  return a3 < 5;
}

- (BOOL)callTypeEnumCheck:(unint64_t)a3
{
  return a3 == 4 || a3 - 1 < 2 || a3 == 0xFFFFFFFF;
}

- (BOOL)ImdTypeEnumCheck:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a3 - 3 < 3;
}

- (void)setDefaultEvent
{
  int v2;
  _BYTE v3[80];
  uint64_t v4;

  v4 = 0x100000001;
  AriSdk::ARI_UtaIdcConfigEventReq_SDK::ARI_UtaIdcConfigEventReq_SDK((AriSdk::ARI_UtaIdcConfigEventReq_SDK *)v3);
  v2 = 0;
  sub_100021F00();
}

- (void)convertToAriType_WiFiState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  unint64_t v6;

  if (a5)
  {
    if (a3 - 1 >= 4)
      v6 = 0;
    else
      v6 = a3;
    *a5 = v6;
  }
  if (a6)
    *a6 = 0;
}

- (void)convertToAriType_BtState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  switch(a4)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      goto LABEL_3;
    case 6uLL:
    case 7uLL:
      a4 = 4 * (a3 == 2);
LABEL_3:
      if (a5)
        goto LABEL_4;
      goto LABEL_5;
    default:
      a4 = 0;
      if (!a5)
        goto LABEL_5;
LABEL_4:
      *a5 = a3 == 2;
LABEL_5:
      if (a6)
        *a6 = a4;
      return;
  }
}

- (void)convertToAriType_FigaroState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  BOOL v6;
  unint64_t v7;

  v6 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6 && a3 == 3;
  v7 = 3;
  if (!v6)
    v7 = 0;
  if (a5)
    *a5 = a3 == 3;
  if (a6)
    *a6 = v7;
}

- (void)convertToAriType_GnssState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  unint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a4 & 0xF;
  if (a3 - 1 >= 3)
    v7 = 0;
  else
    v7 = a3;
  switch(a4 & 0xF)
  {
    case 1uLL:
    case 4uLL:
      break;
    case 2uLL:
      v6 = 2;
      break;
    case 3uLL:
      v6 = 3;
      break;
    case 5uLL:
      v6 = 65541;
      break;
    default:
      v6 = 4;
      break;
  }
  v8 = a4 >> 4;
  v9 = v6 | 0x10100;
  v10 = v6 | 0x200;
  if (v8 == 1)
    v6 |= 0x100uLL;
  if (v8 == 2)
    v6 = v10;
  if (v8 == 5)
    v6 = v9;
  if (a5)
    *a5 = v7;
  if (a6)
    *a6 = v6;
}

- (void)convertToAriType_UwbState:(unint64_t)a3 userCase:(unint64_t)a4 AriState:(unint64_t *)a5 AriUseCase:(unint64_t *)a6
{
  unint64_t v6;

  if (a5)
  {
    v6 = a3 == 5;
    if (a3 == 9)
      v6 = 2;
    *a5 = v6;
  }
  if (a6)
    *a6 = 0;
}

- (void)handleTunerState:(unint64_t)a3 sensorData:(id)a4 SubId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  size_t count;
  uint64_t uint64;
  uint64_t v11;
  int v12;
  BOOL v13;
  int v14;
  _BYTE v15[80];
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v24 = v5;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  count = xpc_array_get_count(v8);
  if (count == 2)
  {
    uint64 = xpc_array_get_uint64(v8, 0);
    v11 = xpc_array_get_uint64(v8, 1uLL);
    switch(a3)
    {
      case 0uLL:
        -[WCM_AriCoexCommandHandler convertToAriType_GnssState:userCase:AriState:AriUseCase:](self, "convertToAriType_GnssState:userCase:AriState:AriUseCase:", uint64, v11, &v23, &v22);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver(SubId %u): GNSS Tuner state = %llu, L1 useCase = %llu, L5 useCase = %llu, low priority = %llu"), v24, v23, BYTE1(v22), v22, v22 & 0x10000);
        v12 = 0;
        goto LABEL_19;
      case 1uLL:
        -[WCM_AriCoexCommandHandler convertToAriType_WiFiState:userCase:AriState:AriUseCase:](self, "convertToAriType_WiFiState:userCase:AriState:AriUseCase:", uint64, v11, &v23, &v22);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver(SubId %u): WiFi Tuner state = %llu, useCase = %llu"), v24, v23, v22);
        v12 = 1;
        goto LABEL_19;
      case 2uLL:
        -[WCM_AriCoexCommandHandler convertToAriType_BtState:userCase:AriState:AriUseCase:](self, "convertToAriType_BtState:userCase:AriState:AriUseCase:", uint64, v11, &v23, &v22);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver(SubId %u): BT Tuner state = %llu, useCase = %llu"), v24, v23, v22);
        v13 = v23 == qword_100271028 && v22 == qword_100271030;
        v14 = !v13;
        if (!v13)
        {
          qword_100271028 = v23;
          qword_100271030 = v22;
        }
        -[WCM_AriCoexCommandHandler convertToAriType_FigaroState:userCase:AriState:AriUseCase:](self, "convertToAriType_FigaroState:userCase:AriState:AriUseCase:", uint64, v11, &v21, &v20);
        if (v21 != qword_100271038 || v20 != qword_100271040)
        {
          qword_100271038 = v21;
          qword_100271040 = v20;
          if ((v14 & 1) == 0)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver(SubId %u): HPBT Tuner state = %llu, useCase = %llu"), v24, v21, v20);
            v16 = 4;
            v17 = v21;
            v18 = 0;
            v19 = v20;
            AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK::ARI_UtaIdcSetTunerVoterConfigReq_SDK((AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK *)v15);
            sub_100021F00();
          }
          goto LABEL_23;
        }
        if (v14)
        {
LABEL_23:
          v12 = 2;
LABEL_19:
          v16 = v12;
          v17 = v23;
          v18 = 0;
          v19 = v22;
          AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK::ARI_UtaIdcSetTunerVoterConfigReq_SDK((AriSdk::ARI_UtaIdcSetTunerVoterConfigReq_SDK *)v15);
          sub_100021F00();
        }
        return;
      case 3uLL:
        -[WCM_AriCoexCommandHandler convertToAriType_UwbState:userCase:AriState:AriUseCase:](self, "convertToAriType_UwbState:userCase:AriState:AriUseCase:", uint64, v11, &v23, &v22);
        v12 = 3;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI Driver(SubId %u): UWB Tuner state = %llu, useCase = %llu"), v24, v23, v22);
        goto LABEL_19;
      default:
        break;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI Driver(SubId %u): Sensor %llu has wrong data size (%llu). Expect size = 2"), v5, a3, count);
  }

}

- (void)handleTransparentMessage:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  xpc_object_t value;
  size_t count;
  size_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  uint64_t uint64;
  xpc_object_t v13;
  void *v14;
  xpc_object_t xarray;

  v4 = *(_QWORD *)&a4;
  value = xpc_dictionary_get_value(a3, "kWCMCellularTransparentMessageInformationSet");
  xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  if (xarray)
  {
    count = xpc_array_get_count(xarray);
    if (count)
    {
      v8 = 0;
      do
      {
        v9 = xpc_array_get_value(xarray, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = v10;
        if (v10)
        {
          uint64 = xpc_dictionary_get_uint64(v10, "kWCMCellularTransparentMessage_Type");
          v13 = xpc_dictionary_get_value(v11, "kWCMCellularTransparentMessage_ByteList");
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (uint64 < 4)
            -[WCM_AriCoexCommandHandler handleTunerState:sensorData:SubId:](self, "handleTunerState:sensorData:SubId:", uint64, v14, v4);

        }
        ++v8;
      }
      while (count != v8);
    }
  }

}

- (void)setCameraState:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t uint64;
  id v7;
  _BYTE v8[87];
  char v9;
  __int16 v10;
  __int16 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;

  v4 = *(_QWORD *)&a4;
  v20 = a4;
  v16 = 0;
  v18 = 1;
  v14 = 3;
  v12 = 2;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "kWCMCellularSetCameraState");
  v11 = 0;
  v10 = 0;
  v9 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set camera State: Raw Camera State = 0x%x"), v4, uint64);
  v19 = uint64 & 1;
  v17 = (uint64 & 8) >> 3;
  v15 = (uint64 & 0x40) >> 6;
  v13 = (unsigned __int16)(uint64 & 0x200) >> 9;
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateFaceID"), (char *)&v11 + 1, v20);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateFrontCam"), &v11, v20);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearTeleCam"), (char *)&v10 + 1, v20);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearUltraWideCam"), &v10, v20);
  -[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("kCameraStateRearWideCam"), &v9, v20);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateFaceID"), uint64 & 1, v20);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateFrontCam"), (uint64 & 8) != 0, v20);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearTeleCam"), (uint64 & 0x40) != 0, v20);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearUltraWideCam"), (uint64 & 0x200) != 0, v20);
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("kCameraStateRearWideCam"), (uint64 >> 12) & 1, v20);
  if ((uint64 & 1) != HIBYTE(v11))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Face Id camera State: from %d to %d "), v20, HIBYTE(v11), uint64 & 1);
    AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK::ARI_UtaIdcSetCameraStatusReq_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK *)v8);
    sub_100021F00();
  }
  if ((uint64 & 8) >> 3 != v11)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Front camera State: from %d to %d "), v20, v11, (uint64 & 8) >> 3);
    AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK::ARI_UtaIdcSetCameraStatusReq_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK *)v8);
    sub_100021F00();
  }
  if ((uint64 & 0x40) >> 6 != HIBYTE(v10))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Rear Telephoto camera State: from %d to %d "), v20, HIBYTE(v10), (uint64 & 0x40) >> 6);
    AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK::ARI_UtaIdcSetCameraStatusReq_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK *)v8);
    sub_100021F00();
  }
  if ((unsigned __int16)(uint64 & 0x200) >> 9 != v10)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Rear ultra wide camera State: from %d to %d "), v20, v10, (unsigned __int16)(uint64 & 0x200) >> 9);
    AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK::ARI_UtaIdcSetCameraStatusReq_SDK((AriSdk::ARI_UtaIdcSetCameraStatusReq_SDK *)v8);
    sub_100021F00();
  }

}

- (void)updateBasebandPowerState
{
  id v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[WCM_AriCoexCommandHandler sendMessage:withArgs:withSubId:](self, "sendMessage:withArgs:withSubId:", 304);

}

- (void)getCellularLaaMeasInfo:(id)a3 SubId:(unsigned int)a4
{
  unsigned int v5;
  _BYTE v6[72];

  AriSdk::ARI_UtaIdcGetLaaMeasInfoReq_SDK::ARI_UtaIdcGetLaaMeasInfoReq_SDK((AriSdk::ARI_UtaIdcGetLaaMeasInfoReq_SDK *)v6);
  v5 = a4;
  sub_100021F00();
}

- (void)setCellularTxActivityConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  int64_t int64;
  uint64_t uint64;
  _BOOL4 v8;
  uint64_t v9;
  _BYTE v10[80];
  __int16 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  int v15;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v15 = v4;
  int64 = xpc_dictionary_get_int64(v5, "kWCMCellularSetTxActivityConfig_TxEnvPowerThreshold");
  uint64 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetTxActivityConfig_TxEnvMinDuration");
  v8 = xpc_dictionary_get_BOOL(v5, "kWCMCellularSetTxActivityConfig_TxStatsEnable");
  v9 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetTxActivityConfig_TxStatsCadence");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set TX Activity Config: txEnvPowerThre = %lld, txEnvMinDur = %llu, txStatsEnable = %d, txStatsCadence = %llu"), v4, int64, uint64, v8, v9);
  v11 = int64;
  v12 = uint64;
  v13 = v8;
  v14 = v9;
  AriSdk::ARI_UtaIdcConfigTxActParamReq_SDK::ARI_UtaIdcConfigTxActParamReq_SDK((AriSdk::ARI_UtaIdcConfigTxActParamReq_SDK *)v10);
  sub_100021F00();
}

- (void)setCellularMiscConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t uint64;
  xpc_object_t xdict;

  v4 = *(_QWORD *)&a4;
  xdict = a3;
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetMiscConfig_UwbInactivityDurationThreshold");
  -[WCM_AriCoexCommandHandler setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:](self, "setCellularMiscConfigToSubId:uwbInactThre_ms:cellOnTimer_ms:", v4, uint64, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetMiscConfig_CellOnStickyTimer"));

}

- (void)setCellularMiscConfigToSubId:(unsigned int)a3 uwbInactThre_ms:(unsigned int)a4 cellOnTimer_ms:(unsigned int)a5
{
  _BYTE v7[84];
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v10 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Misc Config: uwbInactThre_ms = %u, cellOnTimer_ms = %u"), *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = a4;
  v9 = a5;
  AriSdk::ARI_UtaIdcConfigMiscParamReqV2_SDK::ARI_UtaIdcConfigMiscParamReqV2_SDK((AriSdk::ARI_UtaIdcConfigMiscParamReqV2_SDK *)v7);
  sub_100021F00();
}

- (void)setCellularAntBitmap:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t uint64;
  uint64_t v6;
  xpc_object_t value;
  void *v8;
  size_t count;
  size_t i;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BYTE v16[84];
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v17 = a4;
  v15 = a3;
  uint64 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetWCI2TxAntMap_Enable");
  v6 = xpc_dictionary_get_uint64(v15, "kWCMCellularSetWCI2TxAntMap_DefaultIdx");
  value = xpc_dictionary_get_value(v15, "kWCMCellularSetWCI2TxAntMap_InformationSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Cellular Ant Bitmap: enable = %llu, defaultIdx = %llu"), v4, uint64, v6);
  if (v8)
  {
    count = xpc_array_get_count(v8);
    v18 = 0x101010101010101 * v6;
    v19 = v18;
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        v11 = xpc_array_get_value(v8, i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = xpc_dictionary_get_uint64(v12, "kWCMCellularSetWCI2TxAntMap_Infoet_AntIdx");
        v14 = xpc_dictionary_get_uint64(v12, "kWCMCellularSetWCI2TxAntMap_InfoSet_WCI2Idx");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Cellular Ant Bitmap: antIdx = %llu, antMappedIdx = %llu"), v4, v13, v14);
        if (v13 <= 0xF)
          *((_BYTE *)&v18 + v13) = v14;

      }
    }
  }
  else
  {
    v18 = 0x101010101010101 * v6;
    v19 = v18;
  }
  AriSdk::ARI_UtaIdcSetTxAntMappingTableReq_SDK::ARI_UtaIdcSetTxAntMappingTableReq_SDK((AriSdk::ARI_UtaIdcSetTxAntMappingTableReq_SDK *)v16);
  sub_100021F00();
}

- (void)setSpmiFeature
{
  void *v3;
  id v4;
  id v5;
  uint64_t i;
  unint64_t v7;
  unsigned int *j;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unsigned int *k;
  id v14;
  void *v15;
  void *v16;
  _BYTE v17[80];
  _DWORD v18[2];
  uint64_t v19;
  _DWORD v20[2];
  int v21;
  _QWORD v22[20];
  _QWORD v23[20];

  v22[0] = &off_10022F1D8;
  v22[1] = &off_10022F208;
  v23[0] = &off_10022F4A8;
  v23[1] = &off_10022F4C0;
  v22[2] = &off_10022F220;
  v22[3] = &off_10022F238;
  v23[2] = &off_10022F388;
  v23[3] = &off_10022F4D8;
  v22[4] = &off_10022F250;
  v22[5] = &off_10022F268;
  v23[4] = &off_10022F280;
  v23[5] = &off_10022F4F0;
  v22[6] = &off_10022F2E0;
  v22[7] = &off_10022F1C0;
  v23[6] = &off_10022F208;
  v23[7] = &off_10022F4A8;
  v22[8] = &off_10022F298;
  v22[9] = &off_10022F178;
  v23[8] = &off_10022F4A8;
  v23[9] = &off_10022F508;
  v22[10] = &off_10022F280;
  v22[11] = &off_10022F310;
  v23[10] = &off_10022F520;
  v23[11] = &off_10022F4A8;
  v22[12] = &off_10022F2B0;
  v22[13] = &off_10022F538;
  v23[12] = &off_10022F1F0;
  v23[13] = &off_10022F550;
  v22[14] = &off_10022F568;
  v22[15] = &off_10022F598;
  v23[14] = &off_10022F580;
  v23[15] = &off_10022F550;
  v22[16] = &off_10022F5B0;
  v22[17] = &off_10022F5E0;
  v23[16] = &off_10022F5C8;
  v23[17] = &off_10022F550;
  v22[18] = &off_10022F5F8;
  v22[19] = &off_10022F610;
  v23[18] = &off_10022F520;
  v23[19] = &off_10022F520;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 20));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (self->coexOSFeatureGroupEnabled[1]
    && self->coexPlatformFeatureGroupEnabled[1]
    && (objc_msgSend(v4, "containsObject:", &off_10022F250) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", &off_10022F250);
  }
  if (self->coexOSFeatureGroupEnabled[2] && self->coexPlatformFeatureGroupEnabled[2])
  {
    if ((objc_msgSend(v4, "containsObject:", &off_10022F268) & 1) == 0)
      objc_msgSend(v4, "addObject:", &off_10022F268);
    if ((objc_msgSend(v4, "containsObject:", &off_10022F2E0) & 1) == 0)
      objc_msgSend(v4, "addObject:", &off_10022F2E0);
  }
  if (self->coexOSFeatureGroupEnabled[4]
    && self->coexPlatformFeatureGroupEnabled[4]
    && (objc_msgSend(v5, "containsObject:", &off_10022F5E0) & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", &off_10022F5E0);
  }
  if (self->coexOSFeatureGroupEnabled[5]
    && self->coexPlatformFeatureGroupEnabled[5]
    && (objc_msgSend(v4, "containsObject:", &off_10022F1D8) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", &off_10022F1D8);
  }
  if (self->coexOSFeatureGroupEnabled[6] && self->coexPlatformFeatureGroupEnabled[6])
  {
    if ((objc_msgSend(v4, "containsObject:", &off_10022F1C0) & 1) == 0)
      objc_msgSend(v4, "addObject:", &off_10022F1C0);
    if ((objc_msgSend(v4, "containsObject:", &off_10022F298) & 1) == 0)
      objc_msgSend(v4, "addObject:", &off_10022F298);
  }
  if (self->coexOSFeatureGroupEnabled[7]
    && self->coexPlatformFeatureGroupEnabled[7]
    && (objc_msgSend(v5, "containsObject:", &off_10022F5F8) & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", &off_10022F5F8);
  }
  if (self->coexOSFeatureGroupEnabled[9]
    && self->coexPlatformFeatureGroupEnabled[9]
    && (objc_msgSend(v4, "containsObject:", &off_10022F2B0) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", &off_10022F2B0);
  }
  if (self->coexOSFeatureGroupEnabled[12]
    && self->coexPlatformFeatureGroupEnabled[12]
    && (objc_msgSend(v4, "containsObject:", &off_10022F178) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", &off_10022F178);
  }
  for (i = 1; i != 65; i += 2)
  {
    v20[i] = 107;
    v18[i] = 107;
  }
  v7 = 0;
  v20[0] = 0;
  v18[0] = 0;
  for (j = (unsigned int *)&v19; ; j += 2)
  {
    v9 = objc_msgSend(v4, "count");
    if (v7 > 0x1F || (unint64_t)v9 <= v7)
      break;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v7));
    *(j - 1) = objc_msgSend(v10, "unsignedIntValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10));
    *j = objc_msgSend(v11, "unsignedIntValue");

    ++v18[0];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0/1): Set TX SPMI feature [%d]: feature = %u, subsys = %u"), v7, *(j - 1), *j);

    ++v7;
  }
  v12 = 0;
  for (k = (unsigned int *)&v21; ; k += 2)
  {
    v14 = objc_msgSend(v5, "count");
    if (v12 > 0x1F || (unint64_t)v14 <= v12)
      break;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v12));
    *(k - 1) = objc_msgSend(v15, "unsignedIntValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v15));
    *k = objc_msgSend(v16, "unsignedIntValue");

    ++v20[0];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0/1): Set RX SPMI feature [%d]: feature = %u, subsys = %u"), v12, *(k - 1), *k);

    ++v12;
  }
  AriSdk::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK((AriSdk::ARI_UtaIdcSetRTFeatureSpmiTxReqV3_SDK *)v17);
  sub_100021F00();
}

- (void)setCnvAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t uint64;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  xpc_object_t value;
  void *v9;
  size_t count;
  uint64_t v11;
  uint64_t i;
  _BYTE *v13;
  size_t v14;
  _DWORD *v15;
  xpc_object_t v16;
  void *v17;
  int64_t int64;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  xpc_object_t xdict;
  uint64_t v28;
  xpc_object_t xarray;
  uint64_t v30;
  uint64_t v32;
  _BOOL4 v33;
  _BYTE v34[96];
  _DWORD v35[286];
  __int16 v36;
  int v37;

  v30 = *(_QWORD *)&a4;
  xdict = a3;
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
  v5 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity");
  v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu"), v30, uint64, v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu"), v30, v6, v7);
  if (-[WCM_AriCoexCommandHandler LQMEnumCheck:](self, "LQMEnumCheck:", uint64))
  {
    value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    xarray = v9;
    if (v9)
    {
      count = xpc_array_get_count(v9);
      v11 = 32;
      if (count < 0x20)
        v11 = count;
      v28 = v11;
    }
    else
    {
      v28 = 0;
    }
    for (i = 0; i != 1152; i += 36)
    {
      v13 = &v34[i + 80];
      *(_DWORD *)v13 = 0;
      *((_DWORD *)v13 + 6) = 3;
      *((_DWORD *)v13 + 2) = 127;
      *((_WORD *)v13 + 16) = 0;
    }
    v35[284] = v6;
    v35[285] = uint64;
    v36 = v5;
    v37 = v7;
    if (!v28)
    {
LABEL_15:
      AriSdk::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK((AriSdk::ARI_UtaIdcSetCnvAntBlockPwrLmtConfigReq_SDK *)v34);
      sub_100021F00();
    }
    v14 = 0;
    v15 = v35;
    while (1)
    {
      v16 = xpc_array_get_value(xarray, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v33 = xpc_dictionary_get_BOOL(v17, "kWCMCellularSetAntBlocking_Policy_Enable");
      v32 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64 = xpc_dictionary_get_int64(v17, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      v19 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      v20 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      v21 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      v22 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      v23 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      v24 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_ConditionId");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu"), v30, v14, v33, v32, int64, v19);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz, Condition_id = %llu"), v30, v14, v20, v21, v22, v23, v24);
      if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v21))
      {
        v25 = 3;
        v26 = CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy -- Invalid cellularCoexTech = %llu");
        goto LABEL_18;
      }
      if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v19))
        break;
      *(v15 - 4) = v33;
      *(v15 - 3) = v20;
      *(v15 - 2) = v21;
      *(v15 - 1) = v22;
      *v15 = v23;
      v15[1] = v32;
      v15[2] = v19;
      v15[3] = int64;
      *((_WORD *)v15 + 8) = v24;

      ++v14;
      v15 += 9;
      if (v28 == v14)
        goto LABEL_15;
    }
    v25 = 0;
    v26 = CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed");
    v21 = v19;
LABEL_18:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v25, v26, v30, v21);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set CNV Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed"), v30, uint64);
  }

}

- (BOOL)setCamAntBlockingPowerLimitingParam:(t_s_UtaIdcCamAntBlockPwrLmtPolicyConfigBundleV2 *)a3 XpcMessage:(id)a4 SubId:(unsigned int)a5
{
  id v6;
  char v7;
  uint64_t uint64;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  t_s_UtaIdcCamAntBlockPwrLmtPolicyConfig *v14;
  xpc_object_t value;
  void *v16;
  size_t count;
  size_t v18;
  uint64_t v19;
  unsigned int *p_var1;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  int64_t int64;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v31;
  BOOL v32;
  const __CFString *v33;
  uint64_t v35;
  unint64_t v36;
  xpc_object_t xarray;
  char v38;
  uint64_t v39;
  xpc_object_t xdict;
  _BOOL4 v41;

  v39 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = 0;
  xdict = v6;
  if (a3 && v6)
  {
    uint64 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetAntBlocking_CameraId");
    v9 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
    v10 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
    v11 = uint64 - 2;
    v12 = 0;
    v13 = 0;
    switch(v11)
    {
      case 0uLL:
        break;
      case 1uLL:
        v12 = 0;
        v13 = 1;
        break;
      case 2uLL:
        v12 = 0;
        v13 = 2;
        break;
      case 3uLL:
        v12 = 0;
        v13 = 3;
        break;
      default:
        v12 = 1;
        v13 = 4;
        break;
    }
    if ((v12 | !-[WCM_AriCoexCommandHandler cameraEnumCheck:](self, "cameraEnumCheck:", v13)) == 1)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid camera ID = %llu"), v39, v13);
      v7 = 0;
    }
    else
    {
      v14 = &a3->var0[v13];
      v14->var1 = v9;
      v14->var2 = v10;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, camera ID = %llu"), v39, v13);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu"), v39, v9, v10);
      value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
      v16 = (void *)objc_claimAutoreleasedReturnValue(value);
      if (v16)
      {
        xarray = v16;
        count = xpc_array_get_count(v16);
        if (count)
        {
          v38 = 0;
          v18 = 0;
          v19 = count - 1;
          if (count - 1 >= 0xF)
            v19 = 15;
          v35 = v19;
          v36 = count;
          p_var1 = &a3->var0[v13].var0[0].var1.var2.var1;
          v16 = xarray;
          while (1)
          {
            v21 = xpc_array_get_value(v16, v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v41 = xpc_dictionary_get_BOOL(v22, "kWCMCellularSetAntBlocking_Policy_Enable");
            v23 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
            int64 = xpc_dictionary_get_int64(v22, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
            v25 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_MitigationType");
            v26 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
            v27 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
            v28 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
            v29 = xpc_dictionary_get_uint64(v22, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu"), v39, v18, v41, v23, int64, v25);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz"), v39, v18, v26, v27, v28, v29);
            if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v27))
            {
              v33 = CFSTR("Coex ARI driver(SubId %u): Set Camera Antenna Blk Policy, invalid coexTech=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed");
              goto LABEL_30;
            }
            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v25))
              break;
            p_var1[2] = v25;
            p_var1[3] = int64;
            *(p_var1 - 4) = v41;
            *(p_var1 - 3) = v26;
            *(p_var1 - 2) = v27;
            *(p_var1 - 1) = v28;
            *p_var1 = v29;
            p_var1[1] = v23;
            p_var1 += 8;

            v31 = v18 + 1 >= v36 || v18 > 0xE;
            v38 = v31;
            v32 = v18++ == v35;
            v16 = xarray;
            if (v32)
              goto LABEL_32;
          }
          v33 = CFSTR("Coex ARI driver(SubId %u): SSet Camera Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCamAntBlockPwrLmtConfigReq failed");
          v27 = v25;
LABEL_30:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v33, v39, v27);

        }
        else
        {
          v38 = 1;
        }
        v16 = xarray;
      }
      else
      {
        v38 = 1;
      }
LABEL_32:

      v7 = v38;
    }
  }

  return v7 & 1;
}

- (void)setCamAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  xpc_object_t value;
  void *v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  xpc_object_t v20;
  void *v21;
  int v22;
  _BYTE v23[80];
  _QWORD v24[260];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v9 = v24;
  do
  {
    v10 = 0;
    v24[65 * v8 + 64] = &_mh_execute_header;
    do
    {
      v11 = &v9[v10];
      *v11 = 0;
      v11[6] = 3;
      v11[2] = 127;
      v10 += 4;
    }
    while (v10 != 64);
    ++v8;
    v9 += 65;
  }
  while (v8 != 4);
  value = xpc_dictionary_get_value(v6, "kWCMCellularSetAntBlocking_FrontCameraPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(value);
  v14 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_FaceIdCameraPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearTeleCameraPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearWideCameraPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = xpc_dictionary_get_value(v7, "kWCMCellularSetAntBlocking_RearUltraWideCameraPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if ((v13 || v15 || v17 || v19)
    && (!v13
     || -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v13, v4))&& (!v15|| -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v15, v4))&& (!v17|| -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v17, v4))
    && (!v21
     || -[WCM_AriCoexCommandHandler setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:](self, "setCamAntBlockingPowerLimitingParam:XpcMessage:SubId:", v24, v21, v4)))
  {
    AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV2_SDK::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetCamAntBlockPwrLmtConfigReqV2_SDK *)v23);
    v22 = v4;
    sub_100021F00();
  }

}

- (void)setUwbAntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  id v4;
  uint64_t i;
  _DWORD *v6;
  uint64_t j;
  _BYTE *v8;
  uint64_t v9;
  xpc_object_t value;
  size_t count;
  uint64_t v12;
  size_t v13;
  int *v14;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  size_t v27;
  uint64_t v28;
  size_t v29;
  _DWORD *v30;
  void *v31;
  xpc_object_t v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t uint64;
  xpc_object_t xarray;
  xpc_object_t xdict;
  uint64_t v44;
  int64_t int64;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  _BYTE v50[100];
  int v51;
  _DWORD v52[37];
  __int16 v53;

  v44 = *(_QWORD *)&a4;
  v4 = a3;
  for (i = 0; i != 1280; i += 40)
  {
    v6 = &v50[i + 80];
    *v6 = 0;
    v6[8] = 3;
    v6[4] = 127;
  }
  xdict = v4;
  for (j = 0; j != 160; j += 20)
  {
    v8 = &v50[j + 80];
    *((_DWORD *)v8 + 320) = 0;
    *((_QWORD *)v8 + 161) = &_mh_execute_header;
  }
  uint64 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_LQMThreshold");
  v9 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity");
  if (-[WCM_AriCoexCommandHandler LQMEnumCheck:](self, "LQMEnumCheck:", uint64))
  {
    v52[36] = uint64;
    v53 = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu"), v44, uint64, v9);
    value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
    xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
    if (!xarray)
      goto LABEL_14;
    count = xpc_array_get_count(xarray);
    v12 = 32;
    if (count < 0x20)
      v12 = count;
    v40 = v12;
    if (!v12)
    {
LABEL_14:
      v24 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      if (v25)
      {
        v27 = xpc_array_get_count(v25);
        v28 = 8;
        if (v27 < 8)
          v28 = v27;
        v48 = v28;
        if (v28)
        {
          v29 = 0;
          v30 = v52;
          do
          {
            v31 = v26;
            v32 = xpc_array_get_value(v26, v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = xpc_dictionary_get_BOOL(v33, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable");
            v35 = xpc_dictionary_get_BOOL(v33, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice");
            v36 = xpc_dictionary_get_BOOL(v33, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation");
            v37 = xpc_dictionary_get_uint64(v33, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass");
            v38 = xpc_dictionary_get_uint64(v33, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer");
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: enable = %d, priorityClass = %llu, mitigationTimer = %llu"), v44, v29, v34, v37, v38);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: denyVoiceProtect = %d, mitigationRequired = %d"), v44, v29, v35, v36);
            *(v30 - 4) = v34;
            *(v30 - 2) = v36;
            *(v30 - 1) = v35;
            *((_BYTE *)v30 - 12) = v37;
            *v30 = v38;
            v30 += 5;

            ++v29;
            v26 = v31;
          }
          while (v48 != v29);
        }
      }
      -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("UWB_LQM_Threshold"), uint64, v44);
      if (v52[1])
        -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("UWB_PC1_Deny_Voice_Protection"), v52[4] != 0, v44);
      AriSdk::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetUwbAntBlockPwrLmtConfigReqV2_SDK *)v50);
      sub_100021F00();
    }
    v13 = 0;
    v14 = &v51;
    while (1)
    {
      v15 = xpc_array_get_value(xarray, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v47 = xpc_dictionary_get_BOOL(v16, "kWCMCellularSetAntBlocking_Policy_Enable");
      v46 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64 = xpc_dictionary_get_int64(v16, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      v17 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      v18 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      v19 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      v20 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      v21 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      v22 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_UwbChannel");
      v23 = xpc_dictionary_get_uint64(v16, "kWCMCellularSetAntBlocking_Policy_UwbAntBitmap");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %lld, mitigationType = %llu"), v44, v13, v47, v46, int64, v17);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz"), v44, v13, v18, v19, v20, v21);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy -- policy[%lu]: uwbChannel = %llu, uwbAntBitmap = %llu"), v44, v13, v22, v23);
      if (!-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v19))
      {
        v39 = CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid coexTech=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed");
        goto LABEL_26;
      }
      if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v17))
        break;
      *(v14 - 5) = v47;
      v14[3] = v17;
      v14[4] = int64;
      *((_WORD *)v14 - 8) = v22;
      v14[1] = v21;
      v14[2] = v46;
      *(v14 - 3) = v23;
      *(v14 - 2) = v18;
      *(v14 - 1) = v19;
      *v14 = v20;

      ++v13;
      v14 += 10;
      if (v40 == v13)
        goto LABEL_14;
    }
    v39 = CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed");
    v19 = v17;
LABEL_26:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v39, v44, v19);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set UWB Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetUwbAntBlockPwrLmtConfigReq failed"), v44, uint64);
  }

}

- (void)setE85AntBlockingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  id v4;
  uint64_t uint64;
  _BOOL4 v6;
  uint64_t v7;
  xpc_object_t value;
  void *v9;
  size_t count;
  uint64_t v11;
  uint64_t i;
  _BYTE *v13;
  size_t v14;
  _DWORD *v15;
  xpc_object_t v16;
  void *v17;
  uint64_t v18;
  int64_t int64;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  xpc_object_t xarray;
  _BOOL4 v29;
  _BYTE v30[100];
  _DWORD v31[257];

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_LQMThreshold");
  v6 = xpc_dictionary_get_BOOL(v4, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  v7 = xpc_dictionary_get_uint64(v4, "kWCMCellularSetAntBlocking_MitigationTimer");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy, lqmThreshold = %llu"), uint64);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu"), v6, v7);
  if (-[WCM_AriCoexCommandHandler LQMEnumCheck:](self, "LQMEnumCheck:", uint64))
  {
    v25 = v4;
    value = xpc_dictionary_get_value(v4, "kWCMCellularSetAntBlocking_PolicySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    xarray = v9;
    if (v9)
    {
      count = xpc_array_get_count(v9);
      v11 = 32;
      if (count < 0x20)
        v11 = count;
      v26 = v11;
    }
    else
    {
      v26 = 0;
    }
    for (i = 0; i != 1024; i += 32)
    {
      v13 = &v30[i + 84];
      *(_DWORD *)v13 = 0;
      *((_DWORD *)v13 + 5) = 3;
      *((_WORD *)v13 + 2) = 0;
      *((_DWORD *)v13 + 7) = 0;
    }
    v31[252] = v6;
    v31[253] = uint64;
    v31[254] = v7;
    if (!v26)
    {
LABEL_14:
      AriSdk::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK((AriSdk::ARI_UtaIdcSetUsbEnhAntBlockPwrLmtPolicyConfigReq_SDK *)v30);
      sub_100021F00();
    }
    v14 = 0;
    v15 = v31;
    while (1)
    {
      v16 = xpc_array_get_value(xarray, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v29 = xpc_dictionary_get_BOOL(v17, "kWCMCellularSetAntBlocking_Policy_Enable");
      v18 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64 = xpc_dictionary_get_int64(v17, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      v20 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      v21 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      v22 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      v23 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      v24 = xpc_dictionary_get_uint64(v17, "kWCMCellularSetAntBlocking_Policy_UsbRate");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu"), v14, v29, v18, int64, v20);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy -- policy[%lu]: cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz, USB_rate_bitmap = %llu"), v14, v21, v22, v23, v24);
      if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v20))
        break;
      *(v15 - 4) = v29;
      *((_WORD *)v15 - 6) = v21;
      *(v15 - 2) = v22;
      *(v15 - 1) = v23;
      *v15 = v18;
      v15[1] = v20;
      v15[2] = int64;
      v15[3] = v24;

      ++v14;
      v15 += 8;
      if (v26 == v14)
        goto LABEL_14;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy, invalid mitigationType=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed"), v20);

    v4 = v25;
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver: Set USB-C Antenna Blk Policy, invalid lqmThreshold=%llu, API UtaIdcSetCnvAntBlockPwrLmtConfigReq failed"), uint64);
  }

}

- (void)setTimesharingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t uint64;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t value;
  void *v15;
  void *v16;
  size_t count;
  size_t v18;
  _DWORD *v19;
  xpc_object_t v20;
  void *v21;
  int64_t int64;
  int64_t v23;
  int v24;
  const __CFString *v25;
  xpc_object_t xdict;
  void *v27;
  int v29;
  _BYTE v30[80];
  _BOOL4 v31;
  unsigned int v32;
  int v33;
  _DWORD v34[8];
  __int16 v35;
  __int16 v36;
  __int16 v37;

  v4 = *(_QWORD *)&a4;
  xdict = a3;
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetTimeShareConfig_Enable");
  v6 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_CoexTech");
  v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_CallType");
  v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_LongDrxCycle");
  v9 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTimeShareConfig_ShortDrxCycle");
  v10 = xpc_dictionary_get_uint64(xdict, "kWCMCellularTImeShareConfig_SleepWakeDurScale");
  v11 = -[WCM_AriCoexCommandHandler convertInternalCoexTech:](self, "convertInternalCoexTech:", v6);
  v12 = -[WCM_AriCoexCommandHandler convertInternalCallType:](self, "convertInternalCallType:", v7);
  v13 = v11;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Timesharing Config, enable=%d, coexTech=%llu, callType=%u, longDrxCycle=%llu, shortDrxCycle=%llu, durationScale=%llu"), v4, uint64 != 0, v11, v12, v8, v9, v10);
  if (-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v11))
  {
    if (-[WCM_AriCoexCommandHandler callTypeEnumCheck:](self, "callTypeEnumCheck:", v7))
    {
      v31 = uint64 != 0;
      v32 = v11;
      v34[7] = v12;
      v35 = v8;
      v36 = v9;
      v37 = v10;
      value = xpc_dictionary_get_value(xdict, "kWCMCellularTImeShareConfig_BandInformationSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue(value);
      v16 = v15;
      v27 = v15;
      if (v15)
      {
        count = xpc_array_get_count(v15);
        v33 = count;
        if (count)
        {
          v18 = 0;
          v19 = v34;
          do
          {
            v20 = xpc_array_get_value(v16, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            int64 = xpc_dictionary_get_int64(v21, "kWCMCellularTImeShareConfig_BandSet_Frequency");
            v23 = xpc_dictionary_get_int64(v21, "kWCMCellularTImeShareConfig_BandSet_BW");
            int64 *= 1000;
            v24 = 1000 * v23;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Timesharing Config - BandInfo[%lu] , frequency=%lldKHz, BW=%lldKHz"), v4, v18, int64, 1000 * v23);
            *(v19 - 1) = int64;
            *v19 = v24;

            ++v18;
            v19 += 2;
            v16 = v27;
          }
          while (count != v18);
        }
      }
      else
      {
        v33 = 0;
      }
      AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK::ARI_UtaIdcSetTimeSharingConfigReq_SDK((AriSdk::ARI_UtaIdcSetTimeSharingConfigReq_SDK *)v30);
      v29 = v4;
      sub_100021F00();
    }
    v25 = CFSTR("Coex ARI driver(SubId %u): Set Timesharing Config, invalid callType=%llu, failed to set UtaIdcSetTimeSharingConfigReq");
    v13 = v7;
  }
  else
  {
    v25 = CFSTR("Coex ARI driver(SubId %u): Set Timesharing Config, invalid coexTech=%llu, UtaIdcSetTimeSharingConfigReq failed");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, v25, v4, v13);

}

- (void)setCC1Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v6;
  uint64_t uint64;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  xpc_object_t xdict;

  v4 = *(_QWORD *)&a4;
  xdict = a3;
  v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetCC_Enable");
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CoexTech");
  v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CarrierId");
  v9 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkCenterFrequency");
  v10 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkBandwidth");
  v11 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkCenterFrequency");
  v12 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkBandwidth");
  v13 = -[WCM_AriCoexCommandHandler convertInternalCoexTech:](self, "convertInternalCoexTech:", uint64);
  if (-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v13))
  {
    -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("CC1_Enable"), v6, v4);
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("CC1_Tech"), v13, v4);
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("CC1_CarrierId"), v8, v4);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC1_UplinkCenterFreq"), v4, v9);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC1_UplinkBandwidth"), v4, v10);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC1_DownlinkCenterFreq"), v4, v11);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC1_DownlinkBandwidth"), v4, v12);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1, enable=%d, coexTech=%llu, carrier_id=%llu"), v4, v6, v13, v8);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz"), v4, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1, invalid coexTech=%llu, UtaIdcSetCriticalCarrierConfigReq failed"), v4, v13);
  }

}

- (void)setCC2Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v6;
  uint64_t uint64;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  xpc_object_t xdict;

  v4 = *(_QWORD *)&a4;
  xdict = a3;
  v6 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetCC_Enable");
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CoexTech");
  v8 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetCC_CarrierId");
  v9 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkCenterFrequency");
  v10 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_UplinkBandwidth");
  v11 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkCenterFrequency");
  v12 = xpc_dictionary_get_double(xdict, "kWCMCellularSetCC_DownlinkBandwidth");
  v13 = -[WCM_AriCoexCommandHandler convertInternalCoexTech:](self, "convertInternalCoexTech:", uint64);
  if (-[WCM_AriCoexCommandHandler coexTechEnumCheck:](self, "coexTechEnumCheck:", v13))
  {
    -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("CC2_Enable"), v6, v4);
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("CC2_Tech"), v13, v4);
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("CC2_CarrierId"), v8, v4);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC2_UplinkCenterFreq"), v4, v9);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC2_UplinkBandwidth"), v4, v10);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC2_DownlinkCenterFreq"), v4, v11);
    -[WCM_AriCoexCache update:value_double:subId:](self->mCache, "update:value_double:subId:", CFSTR("CC2_DownlinkBandwidth"), v4, v12);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2, enable=%d, coexTech=%llu, carrier_id=%llu"), v4, v6, v13, v8);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz"), v4, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2, invalid coexTech=%llu, UtaIdcSetCriticalCarrierConfigReq failed"), v4, v13);
  }

}

- (void)setAllCCConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[80];
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;

  v4 = *(_QWORD *)&a4;
  v46 = 0;
  v44 = 0;
  v45 = 127;
  v42 = 0.0;
  v43 = 0.0;
  v40 = 0.0;
  v41 = 0.0;
  v39 = 0;
  v37 = 0;
  v38 = 127;
  v35 = 0.0;
  v36 = 0.0;
  v33 = 0.0;
  v34 = 0.0;
  if (-[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("CC1_Enable"), &v46, *(_QWORD *)&a4))
  {
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("CC1_Tech"), &v45, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("CC1_CarrierId"), &v44, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC1_UplinkCenterFreq"), &v43, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC1_UplinkBandwidth"), &v42, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC1_DownlinkCenterFreq"), &v41, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC1_DownlinkBandwidth"), &v40, v4);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1, enable=%d, coexTech=%llu, carrier_id=%llu"), v4, v46, v45, v44);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz"), v4, *(_QWORD *)&v43, *(_QWORD *)&v42, *(_QWORD *)&v41, *(_QWORD *)&v40);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 1,  not configured yet"), v4, v12, v13, v14, v15);
  }
  if (-[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("CC2_Enable"), &v39, v4))
  {
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("CC2_Tech"), &v38, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("CC2_CarrierId"), &v37, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC2_UplinkCenterFreq"), &v36, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC2_UplinkBandwidth"), &v35, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC2_DownlinkCenterFreq"), &v34, v4);
    -[WCM_AriCoexCache get:value_double:subId:](self->mCache, "get:value_double:subId:", CFSTR("CC2_DownlinkBandwidth"), &v33, v4);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2, enable=%d, coexTech=%llu, carrier_id=%llu"), v4, v39, v38, v37);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2, UL_freq=%fMHz, UL_BW=%fMHz, DL_freq=%fMHz, DL_BW=%fMHz"), v4, *(_QWORD *)&v36, *(_QWORD *)&v35, *(_QWORD *)&v34, *(_QWORD *)&v33);
    v6 = v38;
    v7 = v37;
    v8 = (v36 * 1000.0);
    v9 = (v35 * 1000.0);
    v10 = (v34 * 1000.0);
    v11 = (v33 * 1000.0);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Critical Carrier 2,  not configured yet"), v4);
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 127;
  }
  v17 = v46;
  v18 = v45;
  v19 = v44;
  v20 = (v43 * 1000.0);
  v21 = (v42 * 1000.0);
  v22 = (v41 * 1000.0);
  v23 = (v40 * 1000.0);
  v24 = 0xFFFF;
  v25 = v39;
  v26 = v6;
  v27 = v7;
  v28 = v8;
  v29 = v9;
  v30 = v10;
  v31 = v11;
  v32 = 0xFFFF;
  AriSdk::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK((AriSdk::ARI_UtaIdcSetCriticalCarrierConfigReqV2_SDK *)v16);
  sub_100021F00();
}

- (void)setTxBlankingPowerLimitingConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  uint64_t uint64;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t int64;
  uint64_t v23;
  _BYTE v24[84];
  int v25;
  int v26;
  char v27;
  __int16 v28;
  char v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  int v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  uint64 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_PowerThreshold");
  v7 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_RB_Threshold");
  v23 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_LTE_TxDenialThreshold");
  int64 = xpc_dictionary_get_int64(v5, "kWCMCellularSetWCI2Mode_MaxAllowedFrameDenials");
  v21 = xpc_dictionary_get_int64(v5, "kWCMCellularSetWCI2Mode_FrameDenialWindow");
  v20 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_LinkPathLossThreshold");
  v19 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_Harq_nack_ratio_Threshold");
  v8 = xpc_dictionary_get_double(v5, "kWCMCellularSetWCI2Mode_RBFilterAlpha");
  v18 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_FilterRBThreshold");
  v9 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimit");
  v17 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_WCI2PowerLimitTO");
  v10 = xpc_dictionary_get_BOOL(v5, "kWCMCellularSetWCI2Mode_Controller_PowerLimiting_Enable");
  v11 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimit");
  v12 = xpc_dictionary_get_uint64(v5, "kWCMCellularSetWCI2Mode_ControllerTxPowerLimitTO");
  v13 = 0.0;
  if (v8 >= 0.0)
    v13 = v8;
  if (v13 <= 1.0)
    v14 = v13 * 10000.0;
  else
    v14 = 10000.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set TX blanking Config, PowerThreshold=%llu(1/16dBm), RBThreshold=%llu, PerEventBlankingThreshold=%llu, MaxBlankingInWindow=%lld, SlidingWindowSize=%lld"), v4, 16 * uint64, v7, v23, int64, v21);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set TX Power Limiting Config, PathLossThreshold=%llu, NackRatioThreshold=%llu, RBFilterAlpha=%d, FilterRBThreshold=%llu"), v4, v20, v19, (int)v14, v18);
  v15 = 16 * v9;
  v16 = 16 * v11;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set TX Power Limiting Config, SpmiPowerLimitThreshold=%llu(1/16dBm), SpmiPowerLimitTimeout=%llu, hostPowerLimitEnable=%d, hostPowerLimitThreshold=%llu(1/16dBm), hostPowerLimitTimeout=%llu"), v4, v15, v17, v10, v16, v12);
  v31 = v10;
  v32 = v20;
  v33 = v16;
  v34 = v15;
  v35 = 1;
  v36 = (int)v14;
  v37 = v18;
  v38 = v17;
  v39 = v12;
  v40 = v19;
  v25 = v21;
  v26 = int64;
  v27 = v23;
  v28 = 16 * uint64;
  v29 = v7;
  v30 = 1;
  AriSdk::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK((AriSdk::ARI_UtaIdcSetTxPowerLimitingConfigReq_SDK *)v24);
  sub_100021F00();
}

- (void)setScanFreq:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  unsigned int count;
  uint64_t v6;
  size_t v7;
  uint64_t *v8;
  xpc_object_t value;
  void *v10;
  int64_t int64;
  int64_t v12;
  xpc_object_t xarray;
  _BYTE v14[84];
  int v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  xarray = a3;
  count = xpc_array_get_count(xarray);
  if (count >= 0x10)
    v6 = 16;
  else
    v6 = count;
  v15 = v6;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = &v16;
    do
    {
      value = xpc_array_get_value(xarray, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(value);
      int64 = xpc_dictionary_get_int64(v10, "kWCMCellularScanFreqBandFilter_CenterFreq");
      v12 = xpc_dictionary_get_int64(v10, "kWCMCellularScanFreqBandFilter_Bandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId %u): Set Scan Frequency Config--freq[%d]: frequency=%lldMHz, BW=%lldMHz"), v4, v7, int64, v12);
      *((_DWORD *)v8 - 2) = 1000 * int64;
      *((_DWORD *)v8 - 1) = 1000 * v12;
      *(_DWORD *)v8 = 1;
      v8 = (uint64_t *)((char *)v8 + 12);

      ++v7;
    }
    while (v6 != v7);
  }
  AriSdk::ARI_UtaIdcRTSetScanFreqReqV2_SDK::ARI_UtaIdcRTSetScanFreqReqV2_SDK((AriSdk::ARI_UtaIdcRTSetScanFreqReqV2_SDK *)v14);
  sub_100021F00();
}

- (void)setRC1Config:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t uint64;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE v12[80];
  int v13;
  char v14;
  char v15;
  char v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v26 = 0;
  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  uint64 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_UwbRangingDuration");
  v8 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_UwbNarrowBandDuration");
  v9 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Enabled");
  v10 = xpc_dictionary_get_uint64(v6, "kWCMCellularSetLaaGpioThrottleReq_Periodicity");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA(RC1) Config : RangingDuration=%llu, NarrowBandDuration=%llu"), uint64, v8);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA(RC1) Config : throttleEnable=%llu, throttleDuration=%llu"), v9, v10);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("kWCMCellularSetLaaGpioThrottleReq_Enabled"), v9, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("kWCMCellularSetLaaGpioThrottleReq_Periodicity"), v10, v4);
  if (uint64)
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_UwbRangingDuration"), uint64, v4);
  if (v8)
    -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_UwbNarrowBandDuration"), uint64, v4);
  if (-[WCM_AriCoexCache get:value_BOOL:subId:](self->mCache, "get:value_BOOL:subId:", CFSTR("WCMCellularSetLAAConfig_CoexEnable"), &v26, v4))
  {
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ProtectCQIPeriod"), &v25, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ThresholdIn"), &v24, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ThresholdOut"), &v23, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_DeactTimer"), &v22, v4);
    -[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_DeactStopTimer"), &v21, v4);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA Config, enable=%d, protectCQIPeriod=%llu, thresholdIn=%llu"), v26, v25, v24);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA Config, threshold_out=%llu, deactTimer=%llu, deactStopTimer=%llu"), v23, v22, v21);
    v13 = v26;
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    v14 = v11;
    v15 = v24;
    v16 = v23;
    v17 = v22;
    v18 = v21;
    v19 = uint64;
    v20 = v8;
    AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK::ARI_UtaIdcSetLaaConfigReq_SDK((AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK *)v12);
    sub_100021F00();
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA(RC1) Config : LAA not configured, no ARI call"));

}

- (void)setLAAConfig:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  _BOOL8 v7;
  uint64_t uint64;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _BYTE v14[80];
  _BOOL4 v15;
  char v16;
  char v17;
  char v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = xpc_dictionary_get_BOOL(v6, "WCMCellularSetLAAConfig_CoexEnable");
  uint64 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ProtectCQIPeriod");
  v9 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ThresholdIn");
  v10 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_ThresholdOut");
  v11 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_DeactTimer");
  v12 = xpc_dictionary_get_uint64(v6, "WCMCellularSetLAAConfig_DeactStopTimer");
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  -[WCM_AriCoexCache update:value_BOOL:subId:](self->mCache, "update:value_BOOL:subId:", CFSTR("WCMCellularSetLAAConfig_CoexEnable"), v7, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ProtectCQIPeriod"), uint64, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ThresholdIn"), v9, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_ThresholdOut"), v10, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_DeactTimer"), v11, v4);
  -[WCM_AriCoexCache update:value_uint64:subId:](self->mCache, "update:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_DeactStopTimer"), v12, v4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA Config, enable=%d, protectCQIPeriod=%llu, thresholdIn=%llu"), v7, uint64, v9);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA Config, threshold_out=%llu, deactTimer=%llu, deactStopTimer=%llu"), v10, v11, v12);
  if (!-[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_UwbRangingDuration"), &v26, v4))v26 = 0;
  if (!-[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("WCMCellularSetLAAConfig_UwbNarrowBandDuration"), &v25, v4))v25 = 0;
  if (!-[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("kWCMCellularSetLaaGpioThrottleReq_Enabled"), &v24, v4))v24 = 0;
  if (!-[WCM_AriCoexCache get:value_uint64:subId:](self->mCache, "get:value_uint64:subId:", CFSTR("kWCMCellularSetLaaGpioThrottleReq_Periodicity"), &v23, v4))v23 = 1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set LAA(RC1) Config : RangingDuration=%llu, NarrowBandDuration=%llu"), v26, v25);
  v15 = v7;
  if (v24)
    v13 = v23;
  else
    v13 = 1;
  v16 = v13;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v26;
  v22 = v25;
  AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK::ARI_UtaIdcSetLaaConfigReq_SDK((AriSdk::ARI_UtaIdcSetLaaConfigReq_SDK *)v14);
  sub_100021F00();
}

- (void)fetchLtePccFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 pccUplinkFreq:(int64_t *)a4 pccUplinkBw:(double *)a5 pccDownlinkFreq:(int64_t *)a6 pccDownlinkBw:(double *)a7
{
  int v7;
  int v8;
  uint64_t v9;
  unsigned int *p_var3;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  BOOL v18;

  if (a3 && a4 && a6 && a7 && a3->var0)
  {
    v7 = 0;
    v8 = 0;
    v9 = a3->var0 - 1;
    p_var3 = &a3->var1[0].var3;
    do
    {
      v11 = v9;
      v13 = *(p_var3 - 3);
      v12 = *(p_var3 - 2);
      v14 = *(p_var3 - 1);
      v15 = *p_var3;
      if (v13)
        v16 = 0;
      else
        v16 = (*p_var3 & 0xFFFFFFFE) == 2;
      if (v16)
      {
        *a6 = v12 / 0x3E8uLL;
        *a7 = (double)v14 / 1000.0;
        v7 = 1;
      }
      v17 = v15 & 0xFFFFFFFD;
      if (v13)
        v18 = 0;
      else
        v18 = v17 == 1;
      if (v18)
      {
        *a4 = v12 / 0x3E8uLL;
        *a5 = (double)v14 / 1000.0;
        v8 = 1;
      }
      if ((v8 & v7 & 1) != 0)
        break;
      p_var3 += 4;
      v9 = v11 - 1;
    }
    while (v11);
  }
}

- (void)fetchLteNrFrequency:(t_s_UtaIdcLteNrCarrierInfoSet *)a3 freqInfoXpc:(id)a4 carrierIdXpc:(id)a5
{
  id v7;
  unint64_t v8;
  unsigned int *p_var3;
  int64_t v10;
  int64_t v11;
  unsigned int v12;
  unsigned int v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t xarray;

  xarray = a4;
  v7 = a5;
  if (a3 && xarray && v7 && a3->var0)
  {
    v8 = 0;
    p_var3 = &a3->var1[0].var3;
    do
    {
      v10 = *(p_var3 - 3);
      v11 = *(p_var3 - 2);
      v12 = *p_var3;
      v13 = 1000 * *(p_var3 - 1);
      if ((*p_var3 & 0xFFFFFFFE) == 2)
      {
        v14 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 2uLL);
        xpc_dictionary_set_int64(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v11);
        xpc_dictionary_set_double(v14, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v13);
        xpc_array_append_value(xarray, v14);

        v15 = xpc_int64_create(v10);
        xpc_array_append_value(v7, v15);

      }
      if ((v12 & 0xFFFFFFFD) == 1)
      {
        v16 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 1uLL);
        xpc_dictionary_set_int64(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v11);
        xpc_dictionary_set_double(v16, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v13);
        xpc_array_append_value(xarray, v16);

        v17 = xpc_int64_create(v10);
        xpc_array_append_value(v7, v17);

      }
      p_var3 += 4;
      ++v8;
    }
    while (v8 < a3->var0);
  }

}

- (void)fetchLegacyRatFrequency:(t_s_UtaIdcLegacyRatCarrierInfoSet *)a3 freqInfoXpc:(id)a4
{
  unint64_t v5;
  unsigned int *p_var3;
  int64_t v7;
  unsigned int v8;
  unsigned int v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t xarray;

  xarray = a4;
  if (a3 && xarray && a3->var0)
  {
    v5 = 0;
    p_var3 = &a3->var1[0].var3;
    do
    {
      v7 = *(p_var3 - 2);
      v8 = 1000 * *(p_var3 - 1);
      v9 = *p_var3;
      if ((*p_var3 & 0xFFFFFFFE) == 2)
      {
        v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 2uLL);
        xpc_dictionary_set_int64(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v7);
        xpc_dictionary_set_double(v10, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v8);
        xpc_array_append_value(xarray, v10);

      }
      if ((v9 & 0xFFFFFFFD) == 1)
      {
        v11 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_DirectionMask", 1uLL);
        xpc_dictionary_set_int64(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_CenterFreq", v7);
        xpc_dictionary_set_double(v11, "kWCMCellularNetworkConfiguration_BandInfoSet_Bandwidth", (double)v8);
        xpc_array_append_value(xarray, v11);

      }
      p_var3 += 4;
      ++v5;
    }
    while (v5 < a3->var0);
  }

}

- (id)assembleCellularConfigXpcMsg:(t_s_UtaIdcCellConfig *)a3
{
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  t_s_UtaIdcLegacyRatCarrierInfoSet *p_var1;
  int var0;
  xpc_object_t v13;
  double v15;
  double v16;
  int64_t v17;
  int64_t value;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq", 0);
  xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth", 0.0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq", 0);
  xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth", 0.0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_TTDUL_DL", a3->var3.var0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_SubFrameFormat", a3->var3.var1);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_FrameOffset", 0);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULCPConfig", a3->var3.var2);
  xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLCPConfig", a3->var3.var3);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb DlUl_config=%u\n"), a3->var3.var0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb special_sub_frame=%u\n"), a3->var3.var1);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb uplink_cyclic_prefix=%u\n"), a3->var3.var2);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb downlink_cyclic_prefix=%u\n"), a3->var3.var3);
  if (a3->var2.var0)
  {
    v17 = 0;
    value = 0;
    v15 = 0.0;
    v16 = 0.0;
    -[WCM_AriCoexCommandHandler fetchLtePccFrequency:pccUplinkFreq:pccUplinkBw:pccDownlinkFreq:pccDownlinkBw:](self, "fetchLtePccFrequency:pccUplinkFreq:pccUplinkBw:pccDownlinkFreq:pccDownlinkBw:", &a3->var2, &value, &v16, &v17, &v15);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_CenterFreq", value);
    xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_ULBandInfo_BandWidth", v16);
    xpc_dictionary_set_int64(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_CenterFreq", v17);
    xpc_dictionary_set_double(v5, "kWCMCellularNetworkConfiguration_DLBandInfo_BandWidth", v15);
    v6 = xpc_array_create(0, 0);
    v7 = xpc_array_create(0, 0);
    -[WCM_AriCoexCommandHandler fetchLteNrFrequency:freqInfoXpc:carrierIdXpc:](self, "fetchLteNrFrequency:freqInfoXpc:carrierIdXpc:", &a3->var2, v6, v7);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_LTEBandInformationSet", v6);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_LTECarrierInformationSet", v7);

  }
  if (a3->var4.var0)
  {
    v8 = xpc_array_create(0, 0);
    v9 = xpc_array_create(0, 0);
    -[WCM_AriCoexCommandHandler fetchLteNrFrequency:freqInfoXpc:carrierIdXpc:](self, "fetchLteNrFrequency:freqInfoXpc:carrierIdXpc:", &a3->var4, v8, v9);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_NGCBandInformationSet", v8);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_NGCCarrierInformationSet", v9);

  }
  if (a3->var0.var0)
  {
    v10 = xpc_array_create(0, 0);
    -[WCM_AriCoexCommandHandler fetchLegacyRatFrequency:freqInfoXpc:](self, "fetchLegacyRatFrequency:freqInfoXpc:", a3, v10);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_GSMBandInformationSet", v10);

  }
  var0 = a3->var1.var0;
  p_var1 = &a3->var1;
  if (var0)
  {
    v13 = xpc_array_create(0, 0);
    -[WCM_AriCoexCommandHandler fetchLegacyRatFrequency:freqInfoXpc:](self, "fetchLegacyRatFrequency:freqInfoXpc:", p_var1, v13);
    xpc_dictionary_set_value(v5, "kWCMCellularNetworkConfiguration_WCDMABandInformationSet", v13);

  }
  return v5;
}

- (void)getCellularNetworkConfig:(id)a3 SubId:(unsigned int)a4
{
  unsigned int v5;
  _BYTE v6[72];

  AriSdk::ARI_UtaIdcGetCellConfigReq_SDK::ARI_UtaIdcGetCellConfigReq_SDK((AriSdk::ARI_UtaIdcGetCellConfigReq_SDK *)v6);
  v5 = a4;
  sub_100021F00();
}

- (void)UtaIdcCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[64];
  unsigned int *v11;
  uint64_t v12;

  AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::ARI_UtaIdcCellConfigEventIndCb_SDK((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10, (const unsigned __int8 *)a3, a4);
  if ((ice::isARIResponseValid((ice *)v10, (const AriSdk::MsgBase *)0x49830000, v5) & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb received\n"));
    v6 = AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::unpack((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10);
    if ((_DWORD)v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Failed to unpack UtaIdcCellConfigEventIndCb: %s (%u)"), asString(v6), v6);
    }
    else
    {
      v7 = v12;
      v8 = *v11;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: UtaIdcCellConfigEventIndCb SubId=%u\n"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler assembleCellularConfigXpcMsg:](self, "assembleCellularConfigXpcMsg:", v7));
      -[WCM_AriCoexCommandHandler sendMessage:withArgs:withSubId:](self, "sendMessage:withArgs:withSubId:", 300, v9, v8);

    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver ERROR: Invalid UtaIdcCellConfigEventIndCb received\n"));
  }
  AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK::~ARI_UtaIdcCellConfigEventIndCb_SDK((AriSdk::ARI_UtaIdcCellConfigEventIndCb_SDK *)v10);
}

- (void)configureAccReportMode
{
  int v2;
  _BYTE v3[84];
  int v4;

  v4 = 1;
  AriSdk::ARI_IBIMsAccCurrentFreqInfoReq_SDK::ARI_IBIMsAccCurrentFreqInfoReq_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoReq_SDK *)v3);
  v2 = 0;
  sub_100021F00();
}

- (void)appendDesenseFreqToXpcArray:(id)a3 DesenseFreq:(IBIAccFreqBandwidthInfo *)a4 Size:(unsigned int)a5
{
  uint64_t v7;
  unsigned int *p_var1;
  xpc_object_t v9;
  xpc_object_t xarray;

  xarray = a3;
  if (xarray && a4 && a5)
  {
    v7 = 0;
    p_var1 = &a4->var1;
    do
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "kWCMCellular_DesenseNetworkConfiguration_CenterFreq", *((_QWORD *)p_var1 - 1));
      xpc_dictionary_set_int64(v9, "kWCMCellular_DesenseNetworkConfiguration_Bandwidth", *p_var1);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb, freq[%u]=(freq:%llu, bw:%u)Hz \n"), v7, *((_QWORD *)p_var1 - 1), *p_var1);
      xpc_array_append_value(xarray, v9);

      ++v7;
      p_var1 += 3;
    }
    while (a5 != v7);
  }

}

- (id)assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:(IBIAccServingDLFreqBandwidthInfo *)a3 DownlinkFreqExt:(IBIAccServingDLFreqBandwidthInfo_ext *)a4 UlFreq:(IBIAccServingULFreqBandwidthInfo *)a5 UplinkFreqExt:(IBIAccServingULFreqBandwidthInfo_ext *)a6 SearchFreq:(IBIAccSearchFreqBandwidthInfo *)a7 HoppingFreq:(IBIAccHoppingFreqBandwidthInfo *)a8 NeighborFreq:(IBIAccNeighborFreqBandwidthInfo *)a9 RPLMNFreq:(IBIAccRPLMNFreqBandwidthInfo *)a10
{
  IBIAccRPLMNFreqBandwidthInfo *v15;
  xpc_object_t v16;
  uint64_t var0;
  uint64_t v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  xpc_object_t v24;
  uint64_t v25;
  xpc_object_t v26;
  uint64_t v27;
  xpc_object_t v28;
  uint64_t v29;
  xpc_object_t xdict;

  v15 = a10;
  xdict = xpc_dictionary_create(0, 0, 0);
  if (a3->var0)
  {
    v16 = xpc_array_create(0, 0);
    if (a3->var0 >= 4u)
      var0 = 4;
    else
      var0 = a3->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Downlink Freq num = %u\n"), var0);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v16, &a3->var0 + 4, var0);
    if (a4->var0)
    {
      if (a4->var0 >= 0xAu)
        v18 = 10;
      else
        v18 = a4->var0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Downlink Freq Ext num = %u\n"), v18);
      -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v16, &a4->var0 + 4, v18);
    }
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_DownlinkFrequency", v16);

    v15 = a10;
  }
  if (a5->var0)
  {
    v19 = xpc_array_create(0, 0);
    if (a5->var0 >= 2u)
      v20 = 2;
    else
      v20 = a5->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Uplink Freq num = %u\n"), v20);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v19, &a5->var0 + 4, v20);
    if (a6->var0)
    {
      if (a6->var0 >= 0xAu)
        v21 = 10;
      else
        v21 = a6->var0;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Uplink Freq Ext num = %u\n"), v21);
      -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v19, &a6->var0 + 4, v21);
    }
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_UplinkFrequency", v19);

  }
  if (a7->var0)
  {
    v22 = xpc_array_create(0, 0);
    if (a7->var0 >= 0x14u)
      v23 = 20;
    else
      v23 = a7->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Search Freq num = %u\n"), v23);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v22, &a7->var0 + 4, v23);
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_SearchFrequency", v22);

  }
  if (a9->var0)
  {
    v24 = xpc_array_create(0, 0);
    if (a9->var0 >= 0x64u)
      v25 = 100;
    else
      v25 = a9->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb Neighbor Freq num = %u\n"), v25);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v24, &a9->var0 + 4, v25);
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_NeighborFrequency", v24);

  }
  if (a8->var0)
  {
    v26 = xpc_array_create(0, 0);
    if (a8->var0 >= 0x40u)
      v27 = 64;
    else
      v27 = a8->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb GSM Hopping Freq num = %u\n"), v27);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v26, &a8->var0 + 4, v27);
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_HoppingFrequency", v26);

  }
  if (v15->var0)
  {
    v28 = xpc_array_create(0, 0);
    if (v15->var0 >= 0x46u)
      v29 = 70;
    else
      v29 = v15->var0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb RPLMN Freq num = %u\n"), v29);
    -[WCM_AriCoexCommandHandler appendDesenseFreqToXpcArray:DesenseFreq:Size:](self, "appendDesenseFreqToXpcArray:DesenseFreq:Size:", v28, &v15->var0 + 4, v29);
    xpc_dictionary_set_value(xdict, "kWCMCellular_DesenseFreqReport_RplmnFrequency", v28);

  }
  return xdict;
}

- (void)desenseCellConfigEventIndHandle:(char *)a3 size:(unsigned int)a4
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[64];
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9, (const unsigned __int8 *)a3, a4);
  if ((ice::isARIResponseValid((ice *)v9, (const AriSdk::MsgBase *)0x25900000, v5) & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb received\n"));
    v6 = AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::unpack((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9);
    if ((_DWORD)v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Failed to unpack IBIMsAccCurrentFreqInfoIndCb: %s (%u)"), asString(v6), v6);
    }
    else
    {
      v7 = *v10;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: IBIMsAccCurrentFreqInfoIndCb SubId=%u\n"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCommandHandler assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:DownlinkFreqExt:UlFreq:UplinkFreqExt:SearchFreq:HoppingFreq:NeighborFreq:RPLMNFreq:](self, "assembleDesenseCellularConfigXpcMsgwithDownlinkFreq:DownlinkFreqExt:UlFreq:UplinkFreqExt:SearchFreq:HoppingFreq:NeighborFreq:RPLMNFreq:", v11, v17, v12, v18, v13, v14, v15, v16));
      -[WCM_AriCoexCommandHandler sendMessage:withArgs:withSubId:](self, "sendMessage:withArgs:withSubId:", 399, v8, v7);

    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver ERROR: Invalid IBIMsAccCurrentFreqInfoIndCb received\n"));
  }
  AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK::~ARI_IBIMsAccCurrentFreqInfoIndCb_SDK((AriSdk::ARI_IBIMsAccCurrentFreqInfoIndCb_SDK *)v9);
}

- (void)printGnssImdConfig:(t_s_UtaIdcCellImdGnssMitigationPolicyConfig *)a3
{
  uint64_t i;
  t_s_UtaIdcCellImdGnssMitigationPolicy *v5;
  uint64_t v6;
  char v7;
  char v8;
  unsigned int *v9;
  uint64_t v10;
  char v11;
  char v12;
  unsigned int *v13;

  if (a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, protect_low_priority_background_gnss=%d, deny_voice_call_protection=%d"), a3->var1, a3->var2);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, mitigation_timer_ms=%u, lqm_threshold=%d"), a3->var3, a3->var4);
    for (i = 0; i != 32; ++i)
    {
      if (a3->var0[i].var0 == 1)
      {
        v5 = &a3->var0[i];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: imd_type=%u, gnss_L5_preferred_tuner_allowed=%d, parallel_mitigation_allowed=%d"), i, v5->var3, v5->var5, v5->var6);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: gnss_victim_center_freq_khz=%u, gnss_victim_bandwidth_khz=%u"), i, v5->var4.var0, v5->var4.var1);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u"), i, v5->var1.var0.var0, v5->var1.var0.var1.var0, v5->var1.var0.var1.var1);
        v6 = 0;
        v7 = 1;
        do
        {
          v8 = v7;
          if (a3->var0[i].var1.var1[v6].var0 == 1)
          {
            v9 = (unsigned int *)((char *)&a3->var0[i] + 16 * v6);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_aggressor_antenna_bitmap=%u"), i, v6, v9[5]);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor1_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u"), i, v6, v9[6], v9[7]);
          }
          v7 = 0;
          v6 = 1;
        }
        while ((v8 & 1) != 0);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2: tech_bitmap=%u, center_freq_khz=%u, bandwidth_khz=%u"), i, a3->var0[i].var2.var0.var0, a3->var0[i].var2.var0.var1.var0, a3->var0[i].var2.var0.var1.var1);
        v10 = 0;
        v11 = 1;
        do
        {
          v12 = v11;
          if (a3->var0[i].var2.var1[v10].var0 == 1)
          {
            v13 = (unsigned int *)((char *)&a3->var0[i] + 16 * v10);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_aggressor_antenna_bitmap=%u"), i, v10, v13[16]);
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, policy[%d]: aggressor2_policy[%d]: cellular_tx_power_cap=%d, mitigation_type=%u"), i, v10, v13[17], v13[18]);
          }
          v11 = 0;
          v10 = 1;
        }
        while ((v12 & 1) != 0);
      }
    }
  }
}

- (void)handleGnssImdAntBlockPowerLimitConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _BYTE *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  _DWORD *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unint64_t v102;
  _DWORD *v103;
  int *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE v108[80];
  int v109;
  _BYTE v110[28];
  int v111;
  _DWORD v112[881];
  unsigned int v113;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v109 = 0;
    v113 = 0;
    do
    {
      v6 = &v110[v5];
      *(_DWORD *)v6 = 0;
      *((_QWORD *)v6 + 13) = 0;
      *((_DWORD *)v6 + 4) = 0;
      *((_DWORD *)v6 + 15) = 0;
      *(_QWORD *)(v6 + 28) = 3;
      *((_DWORD *)v6 + 11) = 3;
      *((_QWORD *)v6 + 9) = 3;
      v5 += 112;
      *((_QWORD *)v6 + 11) = 3;
    }
    while (v5 != 3584);
    v112[878] = objc_msgSend(v3, "mProtectGnssLowPriority", COERCE_DOUBLE(3));
    v112[879] = objc_msgSend(v4, "mDenyVoiceProtect");
    v112[880] = objc_msgSend(v4, "mMitigationTimer_ms");
    if (-[WCM_AriCoexCommandHandler LQMEnumCheck:](self, "LQMEnumCheck:", objc_msgSend(v4, "mLqmThreshold")))
    {
      v113 = objc_msgSend(v4, "mLqmThreshold");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
      v8 = (unint64_t)objc_msgSend(v7, "count");

      if (v8 < 0x21)
      {
        if (!v8)
        {
LABEL_29:
          -[WCM_AriCoexCommandHandler printGnssImdConfig:](self, "printGnssImdConfig:", v110);
          AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK((AriSdk::ARI_UtaIdcSetCellImdGnssMitigationConfigReq_SDK *)v108);
          sub_100021F00();
        }
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, too many policies (%llu)"), v8);
        v8 = 32;
      }
      v9 = 0;
      v104 = &v111;
      v102 = v8;
      v103 = v112;
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
        v12 = -[WCM_AriCoexCommandHandler ImdTypeEnumCheck:](self, "ImdTypeEnumCheck:", objc_msgSend(v11, "mImdType"));

        if ((v12 & 1) == 0)
          break;
        *(_DWORD *)&v110[112 * v9] = 1;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 5] = objc_msgSend(v14, "mImdType");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 8] = objc_msgSend(v16, "mGnssL5TunerAllowed");

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 9] = objc_msgSend(v18, "mParallelMitigationAllowed");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 6] = objc_msgSend(v20, "mGnssVictimFreq_KHz");

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v9));
        v112[28 * v9 + 7] = objc_msgSend(v22, "mGnssVictimBw_KHz");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v9));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mCellAggressor1"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mBandPolicy"));
        v27 = objc_msgSend(v26, "count");

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v9));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mCellAggressor2"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mBandPolicy"));
        v32 = objc_msgSend(v31, "count");

        v33 = 2;
        if ((unint64_t)v27 >= 2)
          v34 = 2;
        else
          v34 = (uint64_t)v27;
        if ((unint64_t)v32 < 2)
          v33 = (uint64_t)v32;
        v105 = v33;
        v106 = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v9));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mCellAggressor1"));
        v38 = &v110[112 * v9];
        *((_WORD *)v38 + 2) = (unsigned __int16)objc_msgSend(v37, "mCellularCoexTech");
        v38 += 4;

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v9));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mCellAggressor1"));
        *((_DWORD *)v38 + 1) = objc_msgSend(v41, "mCellularFrequencyKHz");

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v9));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "mCellAggressor1"));
        *((_DWORD *)v38 + 2) = objc_msgSend(v44, "mCellularBandwidthKHz");

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v9));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mCellAggressor2"));
        v48 = &v110[112 * v9];
        *((_WORD *)v48 + 24) = (unsigned __int16)objc_msgSend(v47, "mCellularCoexTech");
        v48 += 48;

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", v9));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mCellAggressor2"));
        *((_DWORD *)v48 + 1) = objc_msgSend(v51, "mCellularFrequencyKHz");

        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndexedSubscript:", v9));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "mCellAggressor2"));
        *((_DWORD *)v48 + 2) = objc_msgSend(v54, "mCellularBandwidthKHz");

        if (v106)
        {
          v55 = 0;
          v56 = v104;
          do
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v9));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mCellAggressor1"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "mBandPolicy"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectAtIndexedSubscript:", v55));
            v62 = objc_msgSend(v61, "mMitigationType");

            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v62))goto LABEL_27;
            *(v56 - 3) = 1;
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectAtIndexedSubscript:", v9));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "mCellAggressor1"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mBandPolicy"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectAtIndexedSubscript:", v55));
            *(v56 - 2) = objc_msgSend(v67, "mCellularAntBitmap");

            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectAtIndexedSubscript:", v9));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mCellAggressor1"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mBandPolicy"));
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndexedSubscript:", v55));
            *(v56 - 1) = objc_msgSend(v72, "mCellularTxPowerCap");

            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndexedSubscript:", v9));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "mCellAggressor1"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "mBandPolicy"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndexedSubscript:", v55));
            *v56 = objc_msgSend(v77, "mMitigationType");
            v56 += 4;

          }
          while (v106 != ++v55);
        }
        if (v105)
        {
          v78 = 0;
          v79 = v103;
          while (1)
          {
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectAtIndexedSubscript:", v9));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "mCellAggressor2"));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "mBandPolicy"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectAtIndexedSubscript:", v78));
            v62 = objc_msgSend(v84, "mMitigationType");

            if (!-[WCM_AriCoexCommandHandler mitigationTypeEnumCheck:](self, "mitigationTypeEnumCheck:", v62))break;
            *(v79 - 3) = 1;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectAtIndexedSubscript:", v9));
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "mCellAggressor2"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "mBandPolicy"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectAtIndexedSubscript:", v78));
            *(v79 - 2) = objc_msgSend(v89, "mCellularAntBitmap");

            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v9));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "mCellAggressor2"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "mBandPolicy"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", v78));
            *(v79 - 1) = objc_msgSend(v94, "mCellularTxPowerCap");

            v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectAtIndexedSubscript:", v9));
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "mCellAggressor2"));
            v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "mBandPolicy"));
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectAtIndexedSubscript:", v78));
            *v79 = objc_msgSend(v99, "mMitigationType");
            v79 += 4;

            if (v105 == ++v78)
              goto LABEL_25;
          }
LABEL_27:
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver: Set GNSS IMD Antenna Blk Policy, invalid mitigationType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), v62);
          goto LABEL_31;
        }
LABEL_25:
        ++v9;
        v103 += 28;
        v104 += 28;
        if (v9 == v102)
          goto LABEL_29;
      }
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mPolicy"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndexedSubscript:", v9));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid imdType=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), objc_msgSend(v101, "mImdType"));

    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver(SubId 0 and 1): Set GNSS IMD Antenna Blk Policy, invalid lqmThreshold=%u, API UtaIdcSetCellImdGnssMitigationConfigReq failed"), objc_msgSend(v4, "mLqmThreshold"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Coex ARI driver ERROR: Invalid AntBlockPowerLimitPolicyClientGnssImd received\n"));
  }
LABEL_31:

}

- (void).cxx_destruct
{
  OS_dispatch_object *fObj;

  objc_storeStrong((id *)&self->mAntBlockPolicy, 0);
  objc_storeStrong((id *)&self->mCellularController, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  fObj = self->mIceClientQueue.fObj.fObj;
  self->mIceClientQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->mCache, 0);
  sub_10002C2C4((uint64_t)&self->mIceClient);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

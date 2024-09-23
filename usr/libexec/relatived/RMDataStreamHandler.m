@implementation RMDataStreamHandler

- (RMDataStreamHandler)initWithEndpoint:(id)a3 isInternal:(BOOL)a4
{
  id *v7;
  RMDataStreamHandler *v8;
  RMDataStreamHandler *v9;
  objc_super v11;

  v7 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)RMDataStreamHandler;
  v8 = -[RMDataStreamHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpoint, a3);
    sub_1000163B4(v7, v9);
    v9->_isInternal = a4;
    v9->_dataProviderStreaming = 0;
  }

  return v9;
}

- (void)dealloc
{
  RMConnectionEndpoint *endpoint;
  objc_super v4;

  if (self)
  {
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
    sub_10000405C((uint64_t)self, 0);
    endpoint = self->_endpoint;
  }
  else
  {
    objc_msgSend(0, "invalidate");
    sub_10000405C(0, 0);
    endpoint = 0;
  }
  sub_1000163B4((id *)&endpoint->super.isa, 0);
  sub_10000402C((uint64_t)self, 0);
  v4.receiver = self;
  v4.super_class = (Class)RMDataStreamHandler;
  -[RMDataStreamHandler dealloc](&v4, "dealloc");
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  RMConnectionEndpoint *i;
  RMConnectionEndpoint *v14;

  v14 = (RMConnectionEndpoint *)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!self)
    goto LABEL_6;
  for (i = self->_endpoint; i != v14; i = 0)
  {
    v12 = (id)sub_100016A7C();
LABEL_6:
    ;
  }

}

- (void)endpoint:(id)a3 didReceiveStreamingRequest:(id)a4 withData:(id)a5
{
  RMConnectionEndpoint *v8;
  id v9;
  id v10;
  void *v11;
  RMConnectionEndpoint *endpoint;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  RMDummyDataProviderConfiguration *v22;
  RMDummyDataProvider *v23;
  uint64_t v24;
  RMAudioListenerPoseProviderConfiguration *v25;
  RMDummyDataProvider *v26;
  NSObject *v27;
  void *v28;
  char v29;
  RMHeadphoneMotionProvider *v30;
  uint64_t v31;
  id *v32;
  void *v33;
  id v34;
  RMAudioListenerPoseProvider *v35;
  uint64_t v36;
  void *v37;
  RMAudioListenerPoseProvider *v38;
  RMHeadphoneActivityProvider *v39;
  uint64_t v40;
  void *v41;
  id v42;
  RMHeadphoneStatusProvider *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  id v49;

  v8 = (RMConnectionEndpoint *)a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self)
    endpoint = self->_endpoint;
  else
    endpoint = 0;
  if (endpoint != v8)
  {
    sub_100016B98();
LABEL_41:
    dispatch_once(&qword_10002C958, &stru_100024EA8);
LABEL_6:
    v47 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", qword_10002C950, v11, &v47));
    v14 = v47;
    v15 = objc_alloc((Class)NSUUID);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Identifier")));
    v17 = objc_msgSend(v15, "initWithUUIDString:", v16);

    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024F68);
    v18 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Identifier: %@", buf, 0xCu);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Interval")));
    v46 = v17;
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024F68);
    v20 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Interval: %@", buf, 0xCu);
    }
    if (self && self->_dataProviderStreaming)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024F68);
      v21 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Received a new streaming request while the previous streaming is still active", buf, 2u);
      }
      -[RMDataStreamHandler endpointShouldStopStreamingData:](self, "endpointShouldStopStreamingData:", v8);
    }
    sub_10000404C((uint64_t)self, 0);
    if (self->_isInternal)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("kRMStartStreamingDummyData")))
      {
        v45 = v14;
        v22 = -[RMDummyDataProviderConfiguration initWithUniqueIdentifier:updateInterval:]([RMDummyDataProviderConfiguration alloc], "initWithUniqueIdentifier:updateInterval:", v46, objc_msgSend(v19, "unsignedLongLongValue"));
        v23 = [RMDummyDataProvider alloc];
        v24 = sub_100015FE8((uint64_t)v8);
        v25 = (RMAudioListenerPoseProviderConfiguration *)objc_claimAutoreleasedReturnValue(v24);
        v26 = -[RMDummyDataProvider initWithConfiguration:receiverQueue:](v23, "initWithConfiguration:receiverQueue:", v22, v25);
        sub_10000404C((uint64_t)self, v26);

LABEL_37:
        v14 = v45;
        goto LABEL_38;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("kRMStartStreamingAudioListenerPose")))
      {
        v45 = v14;
        v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TempestOptions")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ForceSessionRestart")));
        v34 = objc_msgSend(v33, "BOOLValue");

        v25 = -[RMAudioListenerPoseProviderConfiguration initWithUniqueIdentifier:tempestOptions:forceSessionRestart:]([RMAudioListenerPoseProviderConfiguration alloc], "initWithUniqueIdentifier:tempestOptions:forceSessionRestart:", v46, v22, v34);
        v35 = [RMAudioListenerPoseProvider alloc];
        v36 = sub_100015FE8((uint64_t)v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v38 = -[RMAudioListenerPoseProvider initWithConfiguration:receiverQueue:](v35, "initWithConfiguration:receiverQueue:", v25, v37);
        sub_10000404C((uint64_t)self, v38);

        goto LABEL_37;
      }
LABEL_38:

      goto LABEL_39;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("kRMStartStreamingHeadphoneMotion")))
    {
      v45 = v14;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("lowLatency")));
      v29 = objc_msgSend(v28, "BOOLValue");

      v30 = [RMHeadphoneMotionProvider alloc];
      v31 = sub_100015FE8((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v31);
      v32 = sub_10000C3C8((id *)&v30->super.isa, v22, v29);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("kRMStartStreamingHeadphoneActivity")))
    {
      v45 = v14;
      v39 = [RMHeadphoneActivityProvider alloc];
      v40 = sub_100015FE8((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v40);
      v32 = sub_100008664((id *)&v39->super.isa, v22);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("kRMStartStreamingHeadphoneStatus")))
        goto LABEL_38;
      v45 = v14;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", kCMHeadphoneRequireActivitySupport));
      v42 = objc_msgSend(v41, "BOOLValue");

      v43 = [RMHeadphoneStatusProvider alloc];
      v44 = sub_100015FE8((uint64_t)v8);
      v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v44);
      v32 = -[RMHeadphoneStatusProvider initWithReceiverQueue:requireActivitySupport:](v43, "initWithReceiverQueue:requireActivitySupport:", v22, v42);
    }
    v25 = (RMAudioListenerPoseProviderConfiguration *)v32;
    sub_10000404C((uint64_t)self, v32);
    goto LABEL_37;
  }
  if (v10)
  {
    if (qword_10002C958 == -1)
      goto LABEL_6;
    goto LABEL_41;
  }
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
  v27 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Configuration message doesn't contain any data", buf, 2u);
  }
LABEL_39:

}

- (BOOL)endpoint:(id)a3 shouldStartStreamingDataToReceiver:(id)a4
{
  RMDataProvider *v4;
  uint8_t *v5;
  __objc2_class_ro **v6;
  __objc2_class_ro **p_info;
  RMConnectionEndpoint *v10;
  id v11;
  RMConnectionEndpoint *endpoint;
  RMDataProvider *v13;
  id *v14;
  void *v15;
  SEL v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  NSString *endpointName;
  NSObject *v21;
  _BOOL8 v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  RMDataProvider *v28;
  id v29;
  void *v30;
  RMDataProvider *dataProvider;
  void *v32;
  BOOL v33;
  NSObject *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  RMConnectionEndpoint *v39;
  RMDataProvider *v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];
  uint8_t buf[4];
  RMConnectionEndpoint *v45;

  v10 = (RMConnectionEndpoint *)a3;
  v11 = a4;
  if (self)
    endpoint = self->_endpoint;
  else
    endpoint = 0;
  if (endpoint != v10)
  {
    sub_100016CB4();
LABEL_28:
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
LABEL_12:
    v19 = v6[151];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      endpointName = self->_endpointName;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)(v5 + 4) = endpointName;
      v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Data stream started on endpoint: %{public}@", buf, 0xCu);

    }
    v22 = !self->_isInternal;
    v23 = self->_endpointName;
    v42[0] = CFSTR("client");
    v42[1] = CFSTR("tracking");
    v43[0] = v23;
    v43[1] = &__kCFBooleanTrue;
    v42[2] = CFSTR("eventType");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v22));
    v43[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));

    if (p_info[150] != (__objc2_class_ro *)-1)
      dispatch_once(&qword_10002C4B0, &stru_100024F68);
    v27 = v6[151];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)(v5 + 4) = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending PowerLog event: %{private}@", buf, 0xCu);
    }
    PLLogRegisteredEvent(100, CFSTR("AccessoryMotion"), v26, 0);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000F534;
    v38[3] = &unk_100024EF8;
    v39 = v10;
    v28 = v4;
    v40 = v28;
    v29 = v11;
    v41 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v38));
    sub_10000405C((uint64_t)self, v30);

    dataProvider = self->_dataProvider;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000F9C0;
    v36[3] = &unk_100024F20;
    v37 = v29;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RMDataProvider startProducingDataWithCallback:](dataProvider, "startProducingDataWithCallback:", v36));
    v33 = v32 == 0;
    if (!v32)
      self->_dataProviderStreaming = 1;

    goto LABEL_26;
  }
  if (self)
  {
    v13 = self->_dataProvider;
    if (v13)
    {
      v4 = v13;
      v5 = buf;
      v14 = sub_10000A068((id *)&v10->super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_setProperty_nonatomic_copy(self, v16, v15, 24);

      p_info = RMMediaSessionStatus.info;
      v6 = RMMediaSessionStatus.info;
      if (!self->_endpointName)
      {
        objc_setProperty_nonatomic_copy(self, v17, CFSTR("unknown"), 24);
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100024F68);
        v18 = qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138477827;
          v45 = v10;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Failed to determine the endpoint name for endpoint: %{private}@", buf, 0xCu);
        }
      }
      self->_startTime = sub_10000DC34();
      if (qword_10002C4B0 == -1)
        goto LABEL_12;
      goto LABEL_28;
    }
  }
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
  v34 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Streaming can't start because no dataProvider has been initialized!", buf, 2u);
  }
  v33 = 0;
LABEL_26:

  return v33;
}

- (void)endpointShouldStopStreamingData:(id)a3
{
  __objc2_class_ro **p_info;
  RMConnectionEndpoint *v5;
  RMConnectionEndpoint *v6;
  RMConnectionEndpoint *endpoint;
  void *v8;
  NSString *endpointName;
  NSObject *v10;
  _BOOL8 v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  NSObject *v16;
  RMDataProvider *dataProvider;
  void **v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  RMDataStreamHandler *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  NSString *v26;

  v5 = (RMConnectionEndpoint *)a3;
  v6 = v5;
  if (self)
    endpoint = self->_endpoint;
  else
    endpoint = 0;
  if (endpoint == v5)
  {
    p_info = RMMediaSessionStatus.info;
    if (qword_10002C4B0 == -1)
      goto LABEL_5;
  }
  else
  {
    sub_100016DD0();
  }
  dispatch_once(&qword_10002C4B0, &stru_100024F68);
LABEL_5:
  v8 = (void *)qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      endpointName = self->_endpointName;
    else
      endpointName = 0;
    *(_DWORD *)buf = 138543362;
    v26 = endpointName;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Data stream stopped on endpoint: %{public}@", buf, 0xCu);

  }
  if (self)
  {
    v11 = !self->_isInternal;
    v12 = self->_endpointName;
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  v23[0] = CFSTR("client");
  v23[1] = CFSTR("tracking");
  v24[0] = v12;
  v24[1] = &__kCFBooleanFalse;
  v23[2] = CFSTR("eventType");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v11));
  v24[2] = v14;
  v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));

  if (p_info[150] != (__objc2_class_ro *)-1)
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
  v16 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending PowerLog event: %{private}@", buf, 0xCu);
  }
  PLLogRegisteredEvent(100, CFSTR("AccessoryMotion"), v15, 0);
  if (self)
  {
    if (!self->_isInternal)
    {
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_10000FCE0;
      v21 = &unk_100024F48;
      v22 = self;
      AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.AudioAccessory.MotionAPI"), &v18);
    }
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
    sub_10000405C((uint64_t)self, 0);
    dataProvider = self->_dataProvider;
  }
  else
  {
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10000FCE0;
    v21 = &unk_100024F48;
    v22 = 0;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.AudioAccessory.MotionAPI"), &v18);
    objc_msgSend(0, "invalidate");
    sub_10000405C(0, 0);
    dataProvider = 0;
  }
  -[RMDataProvider stopProducingData](dataProvider, "stopProducingData");
  if (self)
    self->_dataProviderStreaming = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_endpointName, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end

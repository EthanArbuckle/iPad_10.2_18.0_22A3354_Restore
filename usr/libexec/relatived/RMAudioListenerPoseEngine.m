@implementation RMAudioListenerPoseEngine

+ (id)sharedInstance
{
  if (qword_10002C8F8 != -1)
    dispatch_once(&qword_10002C8F8, &stru_100024838);
  return (id)qword_10002C8F0;
}

- (RMAudioListenerPoseEngine)init
{
  RMAudioListenerPoseEngine *v2;
  void *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  RMAudioListenerPoseEngineSession *v8;
  id v9;
  NSUserDefaults *defaults;
  NSUserDefaults *v11;
  void *v12;
  unsigned __int8 v13;
  NSUserDefaults *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  _BOOL4 faceKitEnabled;
  _BOOL4 facePoseVerboseLoggingEnabled;
  RMFacePoseCaptureSession *v20;
  RMLidAngleSensor *v21;
  SBSExternalDisplayService *v22;
  NSUserDefaults *v23;
  NSUserDefaults *v24;
  const __CFString *v25;
  double v26;
  RMAudioListenerPoseEngineSession *session;
  NSUserDefaults *v28;
  double v29;
  RMAudioListenerPoseEngineSession *v30;
  void *v31;
  RMAudioListenerPoseEngineSession *v32;
  double keepAliveDurationVideo;
  RMAudioListenerPoseEngineSession *v34;
  RMAudioListenerPoseEngineSession *v35;
  NSObject *v36;
  void *v37;
  objc_super v39;
  uint8_t buf[4];
  _BYTE v41[10];
  RMAudioListenerPoseEngineSession *v42;
  _QWORD v43[3];
  _QWORD v44[3];

  v39.receiver = self;
  v39.super_class = (Class)RMAudioListenerPoseEngine;
  v2 = -[RMAudioListenerPoseEngine init](&v39, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 5, 0));
    sub_10000403C((uint64_t)v2, v3);

    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("RMAudioListenerPoseEngineQueue", v5);
    sub_1000045C0((uint64_t)v2, v6);

    v7 = dispatch_queue_create("RMAudioListenerPoseCaptureQueue", v5);
    sub_10000405C((uint64_t)v2, v7);

    v8 = objc_opt_new(RMAudioListenerPoseEngineSession);
    sub_10000404C((uint64_t)v2, v8);

    v9 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.RelativeMotion"));
    sub_1000045D0((uint64_t)v2, v9);

    defaults = v2->_defaults;
    v43[0] = CFSTR("TempestKeepAliveDuration");
    v43[1] = CFSTR("TempestOpportunisticAnchoredKeepAliveDuration");
    v44[0] = &off_100025EC8;
    v44[1] = &off_100025ED8;
    v43[2] = CFSTR("OasisKeepAliveDuration");
    v44[2] = &off_100025ED8;
    v11 = defaults;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 3));
    -[NSUserDefaults registerDefaults:](v11, "registerDefaults:", v12);

    v13 = 0;
    if (+[RMPlatformInfo isInternalBuild](RMPlatformInfo, "isInternalBuild"))
      v13 = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("TempestEnableFacePose"));
    v2->_faceKitEnabled = +[RMPlatformInfo supportsOpportunisticAnchoredTracking](RMPlatformInfo, "supportsOpportunisticAnchoredTracking") | v13;
    v14 = v2->_defaults;
    v2->_facePoseVerboseLoggingEnabled = -[NSUserDefaults BOOLForKey:](v14, "BOOLForKey:", CFSTR("TempestEnableFacePoseVerboseLogging"));

    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v15 = (void *)qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = +[RMPlatformInfo supportsOpportunisticAnchoredTracking](RMPlatformInfo, "supportsOpportunisticAnchoredTracking");
      faceKitEnabled = v2->_faceKitEnabled;
      facePoseVerboseLoggingEnabled = v2->_facePoseVerboseLoggingEnabled;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v41 = v17;
      *(_WORD *)&v41[4] = 1026;
      *(_DWORD *)&v41[6] = faceKitEnabled;
      LOWORD(v42) = 1026;
      *(_DWORD *)((char *)&v42 + 2) = facePoseVerboseLoggingEnabled;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Face pose supported: %{public}d, face pose enabled: %{public}d, verbose logging: %{public}d", buf, 0x14u);

    }
    if (!v2->_faceKitEnabled)
      goto LABEL_11;
    v20 = objc_opt_new(RMFacePoseCaptureSession);
    sub_1000045E0((uint64_t)v2, v20);

    -[RMFacePoseCaptureSession setDelegate:](v2->_facePoseCaptureSession, "setDelegate:", v2);
    v21 = objc_opt_new(RMLidAngleSensor);
    sub_1000045F0((uint64_t)v2, v21);

    v22 = objc_opt_new(SBSExternalDisplayService);
    -[RMAudioListenerPoseEngine setExternalDisplayService:](v2, "setExternalDisplayService:", v22);

    if (v2->_faceKitEnabled)
    {
      v23 = v2->_defaults;
      v24 = v23;
      v25 = CFSTR("TempestOpportunisticAnchoredKeepAliveDuration");
    }
    else
    {
LABEL_11:
      v23 = v2->_defaults;
      v24 = v23;
      v25 = CFSTR("TempestKeepAliveDuration");
    }
    -[NSUserDefaults doubleForKey:](v23, "doubleForKey:", v25);
    session = v2->_session;
    if (session)
      session->_keepAliveDurationVideo = v26;

    v28 = v2->_defaults;
    -[NSUserDefaults doubleForKey:](v28, "doubleForKey:", CFSTR("OasisKeepAliveDuration"));
    v30 = v2->_session;
    if (v30)
      v30->_keepAliveDurationMusic = v29;

    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v31 = (void *)qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v2->_session;
      if (v32)
        keepAliveDurationVideo = v32->_keepAliveDurationVideo;
      else
        keepAliveDurationVideo = 0.0;
      v34 = v2->_session;
      if (v34)
        v34 = *(RMAudioListenerPoseEngineSession **)&v34->_keepAliveDurationMusic;
      *(_DWORD *)buf = 134349312;
      *(double *)v41 = keepAliveDurationVideo;
      *(_WORD *)&v41[8] = 2050;
      v42 = v34;
      v35 = v32;
      v36 = v31;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "keepAliveDurationVideo: %{public}.3f sec, keepAliveDurationMusic: %{public}.3f sec", buf, 0x16u);

    }
    v2->_userInteractionMonitorClientCount = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[RMUserInteractionMonitor userInteractionMonitor](RMUserInteractionMonitor, "userInteractionMonitor"));
    sub_100004600((uint64_t)v2, v37);

  }
  return v2;
}

- (id)startProducingDataForObject:(id)a3 tempestOptions:(id)a4 forceSessionRestart:(BOOL)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  OS_dispatch_queue *producerQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100004750;
  v30 = sub_100004760;
  v31 = 0;
  if (self)
    producerQueue = self->_producerQueue;
  else
    producerQueue = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004768;
  v20[3] = &unk_100024860;
  v20[4] = self;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  v24 = &v26;
  v25 = a5;
  v15 = v10;
  v16 = v13;
  v17 = v11;
  dispatch_sync((dispatch_queue_t)producerQueue, v20);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

- (void)stopProducingDataForObject:(id)a3
{
  id v4;
  OS_dispatch_queue *producerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (self)
    producerQueue = self->_producerQueue;
  else
    producerQueue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005238;
  block[3] = &unk_1000248B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)producerQueue, block);

}

- (void)externalDisplayDidConnect:(dispatch_queue_t *)a1
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[dispatch_queue_t externalDisplayService](a1, "externalDisplayService"));
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100007308;
    v3[3] = &unk_1000249C8;
    v3[4] = a1;
    objc_msgSend(v2, "getConnectedDisplayInfoWithCompletionHandler:", v3);

  }
}

- (void)facePoseCaptureSessionDidConfigure:(id)a3
{
  id v4;
  OS_dispatch_queue *producerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RMAudioListenerPoseEngine *v9;

  v4 = a3;
  if (self)
    producerQueue = self->_producerQueue;
  else
    producerQueue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006EA4;
  v7[3] = &unk_1000248B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)producerQueue, v7);

}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  OS_dispatch_queue *producerQueue;
  _QWORD v6[6];

  if (self)
    producerQueue = self->_producerQueue;
  else
    producerQueue = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007430;
  v6[3] = &unk_100024978;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async((dispatch_queue_t)producerQueue, v6);
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (void)setExternalDisplayService:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionMonitor, 0);
  objc_storeStrong((id *)&self->_facePoseCaptureSession, 0);
  objc_storeStrong((id *)&self->_lidAngleSensor, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_producerQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end

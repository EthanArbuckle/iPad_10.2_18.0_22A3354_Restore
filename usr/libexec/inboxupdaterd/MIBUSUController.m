@implementation MIBUSUController

- (MIBUSUController)initWithDelegate:(id)a3
{
  id v4;
  MIBUSUController *v5;
  MIBUSUController *v6;
  void *v7;
  NSNumber *progress;
  NSNumber *timeRemaining;
  dispatch_queue_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIBUSUController;
  v5 = -[MIBUSUController init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[MIBUSUController setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUWiFiHelper sharedInstance](MIBUWiFiHelper, "sharedInstance"));
    -[MIBUSUController setWifiHelper:](v6, "setWifiHelper:", v7);

    progress = v6->_progress;
    v6->_phase = 256;
    v6->_progress = 0;

    timeRemaining = v6->_timeRemaining;
    v6->_timeRemaining = 0;

    v10 = dispatch_queue_create("com.apple.mibu_sumanagerclient_queue", 0);
    -[MIBUSUController setSuDelegateQueue:](v6, "setSuDelegateQueue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController _getPhaseTranslationTable](v6, "_getPhaseTranslationTable"));
    -[MIBUSUController setPhaseTranslationTable:](v6, "setPhaseTranslationTable:", v11);

  }
  return v6;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSNumber *progress;
  NSNumber *timeRemaining;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  -[MIBUSUController _initSUClient](self, "_initSUClient");
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000564C0);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting software update controller...", buf, 2u);
  }
  self->_phase = 257;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v5 = objc_msgSend(v4, "skipWiFiAssociation");

    if (v5)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000564E0);
      v6 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping WiFi Association...", buf, 2u);
      }
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController wifiHelper](self, "wifiHelper"));
  v25 = 0;
  objc_msgSend(v7, "connectAndMonitor:", &v25);
  v8 = v25;

  if (!v8)
  {
LABEL_12:
    self->_phase = 258;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056520);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scanning for updates ...", buf, 2u);
    }
    v10 = objc_alloc_init((Class)SUScanOptions);
    objc_msgSend(v10, "setForced:", 1);
    progress = self->_progress;
    self->_progress = 0;

    timeRemaining = self->_timeRemaining;
    self->_timeRemaining = 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016970;
    block[3] = &unk_100056570;
    objc_copyWeak(&v24, &location);
    v23 = v10;
    v13 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
    v8 = 0;
    goto LABEL_17;
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056500);
  v14 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003BA6C(v14, v15, v16, v17, v18, v19, v20, v21);
  -[MIBUSUController _softwareUpdateCompleteWithError:](self, "_softwareUpdateCompleteWithError:", v8);
LABEL_17:
  objc_destroyWeak(&location);

}

- (void)download:(id)a3
{
  id v4;
  id v5;
  MIBUSUController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id *v13;
  NSObject *v14;
  uint64_t v15[5];
  id v16;
  uint8_t buf[16];
  id obj;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100016D1C;
  v24 = sub_100016D2C;
  v25 = 0;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)SUMutableDownloadMetadata);
  v6 = self;
  objc_sync_enter(v6);
  if (-[MIBUSUController cancelled](v6, "cancelled"))
  {
    v13 = (id *)(v21 + 5);
    obj = (id)v21[5];
    sub_10000D680(&obj, 67108870, 0, CFSTR("Software Update cancelled"), v7, v8, v9, v10, v15[0]);
    objc_storeStrong(v13, obj);
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056590);
    v14 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Software Update cancelled, not starting SU download", buf, 2u);
    }
    objc_sync_exit(v6);

    -[MIBUSUController _softwareUpdateCompleteWithError:](v6, "_softwareUpdateCompleteWithError:", v21[5]);
  }
  else
  {
    objc_msgSend(v5, "setDownloadOnly:", 1);
    v11 = objc_msgSend(objc_alloc((Class)SUDownloadOptions), "initWithMetadata:andDescriptor:", v5, v4);
    objc_msgSend(v11, "setAutoDownload:", 0);
    v6->_phase = 512;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController manager](v6, "manager"));
    v15[0] = (uint64_t)_NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = (uint64_t)sub_100016D98;
    v15[3] = (uint64_t)&unk_1000565D8;
    v15[4] = (uint64_t)&v20;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v12, "startDownloadWithOptions:withResult:", v11, v15);

    objc_destroyWeak(&v16);
    objc_sync_exit(v6);

  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

}

- (void)install
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016F80;
  block[3] = &unk_100056570;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)terminate
{
  MIBUSUController *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (!-[MIBUSUController cancelled](v2, "cancelled"))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056678);
    v3 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminating software update...", buf, 2u);
    }
    -[MIBUSUController setCancelled:](v2, "setCancelled:", 1);
    if (v2->_phase < 0x103)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController manager](v2, "manager"));

      if (v4)
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100056698);
        v5 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating SU client...", v10, 2u);
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController manager](v2, "manager"));
        objc_msgSend(v6, "invalidate");

        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_1000566B8);
        v7 = qword_100068950;
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SU client invalidated", v9, 2u);
        }
      }
    }
    else
    {
      -[MIBUSUController _purgeSoftwareUpdate](v2, "_purgeSoftwareUpdate");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController wifiHelper](v2, "wifiHelper"));
    objc_msgSend(v8, "stopMonitor");

    v2->_phase = 1280;
  }
  objc_sync_exit(v2);

}

- (void)forcePurge
{
  MIBUSUController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MIBUSUController setCancelled:](obj, "setCancelled:", 1);
  -[MIBUSUController _purgeSoftwareUpdate](obj, "_purgeSoftwareUpdate");
  obj->_phase = 1280;
  objc_sync_exit(obj);

}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000566D8);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Software update download started", v8, 2u);
  }

}

- (void)client:(id)a3 downloadDidFinish:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000566F8);
  v8 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Software update download finished", v11, 2u);
  }
  self->_phase = 1024;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "descriptor"));
  objc_msgSend(v9, "downloadDidFinishForUpdate:", v10);

}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056718);
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003C1F4();
  v17 = 0;
  sub_10000D680(&v17, 67108867, v10, CFSTR("Failed SU download"), v11, v12, v13, v14, v16);
  v15 = v17;
  -[MIBUSUController _softwareUpdateCompleteWithError:](self, "_softwareUpdateCompleteWithError:", v15);

}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  NSNumber *v21;
  NSNumber *progress;
  NSNumber *v23;
  NSNumber *timeRemaining;
  int v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phase"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  objc_msgSend(v8, "percentComplete");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  objc_msgSend(v11, "normalizedPercentComplete");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
  objc_msgSend(v14, "timeRemaining");
  v16 = v15;

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056738);
  v17 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138544130;
    v26 = v7;
    v27 = 2048;
    v28 = v10;
    v29 = 2048;
    v30 = v13;
    v31 = 2048;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Software update download phase: %{public}@; progress: %f; normalized progress: %f; time remaining: %lf",
      (uint8_t *)&v25,
      0x2Au);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController phaseTranslationTable](self, "phaseTranslationTable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v7));

  if (v19)
  {
    self->_phase = objc_msgSend(v19, "unsignedIntValue");
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056758);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C254();
  }
  *(float *)&v20 = v13;
  v21 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
  progress = self->_progress;
  self->_progress = v21;

  v23 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
  timeRemaining = self->_timeRemaining;
  self->_timeRemaining = v23;

}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSNumber *progress;
  NSNumber *timeRemaining;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056778);
  v8 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Software update installation started.", v12, 2u);
  }
  progress = self->_progress;
  self->_progress = 0;

  timeRemaining = self->_timeRemaining;
  self->_timeRemaining = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController delegate](self, "delegate"));
  objc_msgSend(v11, "installDidStartForUpdate:", v7);

}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056798);
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003C2B4();
  v17 = 0;
  sub_10000D680(&v17, 67108868, v10, CFSTR("Failed SU install"), v11, v12, v13, v14, v16);
  v15 = v17;
  -[MIBUSUController _softwareUpdateCompleteWithError:](self, "_softwareUpdateCompleteWithError:", v15);

}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000567B8);
  v7 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Software update installation complete!", v8, 2u);
  }

}

- (void)_softwareUpdateCompleteWithError:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000180A8;
  v8[3] = &unk_100056400;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_proccessScanResults:(id)a3 andError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (objc_msgSend(v8, "isEqualToString:", SUErrorDomain))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == (id)3)
    {
      v25 = 0;
      sub_10000D680(&v25, 67108871, 0, CFSTR("Device is already up-to-date"), v10, v11, v12, v13, (uint64_t)v24);
      v14 = v25;
      goto LABEL_4;
    }
  }
  else
  {

  }
  if (v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController delegate](self, "delegate"));
    objc_msgSend(v15, "scanDidFinishWithResults:", v6);

    goto LABEL_8;
  }
  sub_10000D680(&v24, 67108866, v7, CFSTR("No updates found"), v10, v11, v12, v13, 0);
  v14 = v24;
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000567D8);
  v16 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
    sub_10003C314(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_4:
  -[MIBUSUController _softwareUpdateCompleteWithError:](self, "_softwareUpdateCompleteWithError:", v14);

LABEL_8:
}

- (id)_getPhaseTranslationTable
{
  _QWORD v3[8];
  _QWORD v4[8];

  v3[0] = kSUDownloadPhaseStarting;
  v3[1] = kSUDownloadPhaseBrainFetching;
  v4[0] = &off_10005BF08;
  v4[1] = &off_10005BF20;
  v3[2] = kSUDownloadPhaseBrainFetchingStalled;
  v3[3] = kSUDownloadPhaseBrainVerifying;
  v4[2] = &off_10005BF38;
  v4[3] = &off_10005BF50;
  v3[4] = kSUDownloadPhaseBrainExtracting;
  v3[5] = kSUDownloadPhaseUpdateFetching;
  v4[4] = &off_10005BF68;
  v4[5] = &off_10005BF80;
  v3[6] = kSUDownloadPhaseUpdateFetchingStalled;
  v3[7] = kSUDownloadPhasePreparingForInstallation;
  v4[6] = &off_10005BF98;
  v4[7] = &off_10005BFB0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 8));
}

- (void)_initSUClient
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController manager](self, "manager"));

  if (!v3)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000567F8);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing SUManagerClient...", v8, 2u);
    }
    v5 = objc_alloc((Class)SUManagerClient);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController suDelegateQueue](self, "suDelegateQueue"));
    v7 = objc_msgSend(v5, "initWithDelegate:queue:clientType:", self, v6, 0);
    -[MIBUSUController setManager:](self, "setManager:", v7);

  }
}

- (void)_purgeSoftwareUpdate
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  MIBUSUController *v15;
  NSObject *v16;
  id v17;
  id location;
  uint8_t buf[4];
  int v20;

  -[MIBUSUController _initSUClient](self, "_initSUClient");
  objc_initWeak(&location, self);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056818);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling software update download...", buf, 2u);
  }
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_opt_new(SUPurgeOptions);
  objc_msgSend(v5, "setNotifyUser:", 0);
  objc_msgSend(v5, "setUserRequested:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSUController manager](self, "manager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000188C8;
  v13[3] = &unk_100056908;
  objc_copyWeak(&v17, &location);
  v7 = v5;
  v14 = v7;
  v15 = self;
  v8 = v4;
  v16 = v8;
  objc_msgSend(v6, "cancelDownloadWithOptions:withResult:", v7, v13);

  v9 = dispatch_time(0, 180000000000);
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100056928);
  v10 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v20 = 180;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting %ds to purge SU...", buf, 8u);
  }
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056948);
    v11 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003C344(v11);
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100056968);
    v12 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Purged software update", buf, 2u);
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (MIBUSoftwareUpdateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (MIBUWiFiHelper)wifiHelper
{
  return self->_wifiHelper;
}

- (void)setWifiHelper:(id)a3
{
  objc_storeStrong((id *)&self->_wifiHelper, a3);
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (OS_dispatch_queue)suDelegateQueue
{
  return self->_suDelegateQueue;
}

- (void)setSuDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_suDelegateQueue, a3);
}

- (NSDictionary)phaseTranslationTable
{
  return self->_phaseTranslationTable;
}

- (void)setPhaseTranslationTable:(id)a3
{
  objc_storeStrong((id *)&self->_phaseTranslationTable, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseTranslationTable, 0);
  objc_storeStrong((id *)&self->_suDelegateQueue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_wifiHelper, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end

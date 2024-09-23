@implementation MZUniversalPlaybackPositionStore

- (void)_onQueueScheduleTimer
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[16];

  v3 = +[MTPrivacyUtil privacyAcknowledgementNeeded](MTPrivacyUtil, "privacyAcknowledgementNeeded");
  if (v3)
  {
    v4 = _MTLogCategoryCloudSync(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Cannot schedule UPPSync timer. Privacy acknowledgement needed.", buf, 2u);
    }

  }
  else if (!self->_refreshTimerActive)
  {
    self->_refreshTimerActive = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer"));
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000195E8;
    v9[3] = &unk_1004A77F8;
    v9[5] = v8;
    v9[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
}

- (double)_effectiveAutorefreshRate
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  double result;

  +[MZUPPBagContext defaultPollingInterval](MZUPPBagContext, "defaultPollingInterval");
  v4 = v3 / 60.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MZPreferences storeBookkeeperPreferences](MZPreferences, "storeBookkeeperPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:withDefaultValue:", CFSTR("AutoSyncRateInMinutes"), v6));
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  if (v4 != v9)
    return (float)(v9 * 60.0);
  result = self->_bagSpecifiedPollingInterval;
  if (result <= 0.00000011920929)
    return (float)(v9 * 60.0);
  return result;
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3 isActive:(BOOL)a4
{
  id v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD block[4];
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MZUniversalPlaybackPositionStore;
  v6 = -[MZUniversalPlaybackPositionStore init](&v22, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("MZUniversalPlaybackPositionStore.queue", 0);
    v8 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v7;

    *((_BYTE *)v6 + 11) = a4;
    *((_QWORD *)v6 + 3) = 3;
    objc_msgSend(v6, "_updateAutorefreshRateSettingAndRestartTimer:", 0);
    +[MZUPPBagContext defaultPollingInterval](MZUPPBagContext, "defaultPollingInterval");
    *((_QWORD *)v6 + 12) = v9;
    if (a3 <= 0.0)
      a3 = *((double *)v6 + 11);
    *((_BYTE *)v6 + 12) = a3 > 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
    objc_msgSend(v6, "setDateToFireNextTimer:", v10);

    v11 = *((_QWORD *)v6 + 9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047F50;
    block[3] = &unk_1004A6200;
    v12 = v6;
    v21 = v12;
    dispatch_sync(v11, block);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_initWeak(&location, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v12, "_updateForStoreAccountsChange", ACDAccountStoreDidChangeNotification, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100081FD4;
    v17[3] = &unk_1004A72B8;
    objc_copyWeak(&v18, &location);
    v12[10] = objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", CFSTR("MZPreferencesDidChangeNotification"), 0, v15, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (MZUniversalPlaybackPositionStore *)v6;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void)setDateToFireNextTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dateToFireNextTimer, a3);
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (MZUniversalPlaybackPositionDataSource *)a3;
}

- (void)setAutorefreshRate:(double)a3
{
  self->_autorefreshRate = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (MZUniversalPlaybackPositionStore)init
{
  return -[MZUniversalPlaybackPositionStore initWithInitialUpdateDelay:isActive:](self, "initWithInitialUpdateDelay:isActive:", 1, -1.0);
}

- (NSDate)dateToFireNextTimer
{
  return self->_dateToFireNextTimer;
}

- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047EDC;
  v4[3] = &unk_1004A65F0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3
{
  return -[MZUniversalPlaybackPositionStore initWithInitialUpdateDelay:isActive:](self, "initWithInitialUpdateDelay:isActive:", 1, a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[MZUniversalPlaybackPositionStore setSyncHandler:](self, "setSyncHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self->_prefsObserver);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore bagLookupTask](self, "bagLookupTask"));
  objc_msgSend(v5, "invalidate");

  -[MZUniversalPlaybackPositionStore setBagLookupTask:](self, "setBagLookupTask:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore synchronizeTask](self, "synchronizeTask"));
  objc_msgSend(v6, "invalidate");

  -[MZUniversalPlaybackPositionStore setSynchronizeTask:](self, "setSynchronizeTask:", 0);
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore timer](self, "timer"));
  objc_msgSend(v7, "invalidate");

  -[MZUniversalPlaybackPositionStore setTimer:](self, "setTimer:", 0);
  -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  v8.receiver = self;
  v8.super_class = (Class)MZUniversalPlaybackPositionStore;
  -[MZUniversalPlaybackPositionStore dealloc](&v8, "dealloc");
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  return +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:](MZUniversalPlaybackPositionMetadata, "keyValueStoreItemIdentifierForItem:", a3);
}

- (void)_onQueueUpdateTimerForActiveChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0)
  {
    if (-[MZUniversalPlaybackPositionStore _automaticallySynchronizeOnBecomeActive](self, "_automaticallySynchronizeOnBecomeActive"))
    {
      -[MZUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:](self, "_onQueueStartNewTimerWithTimeIntervalSinceNow:");
    }
    else
    {
      -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
    }
  }
  else
  {
    -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
  }
}

- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0)
    -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
  else
    -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
}

- (void)becomeActive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000821F4;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resignActive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082290;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setAutomaticSynchronizeOptions:(unint64_t)a3
{
  if (self->_automaticSynchronizeOptions != a3)
    self->_automaticSynchronizeOptions = a3;
}

- (void)_onQueueSetHasLocalChangesToSync:(BOOL)a3
{
  self->_hasLocalChangesToSync = a3;
}

- (void)setHasLocalChangesToSync:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082420;
  v4[3] = &unk_1004A65F0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[MZUniversalPlaybackPositionStore setAutomaticSynchronizeOptions:](self, "setAutomaticSynchronizeOptions:", v5 | v6);
}

- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive
{
  return (-[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") >> 1) & 1;
}

- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3
{
  -[MZUniversalPlaybackPositionStore setAutomaticSynchronizeOptions:](self, "setAutomaticSynchronizeOptions:", -[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)_automaticallySynchronizeOnBecomeActive
{
  return -[MZUniversalPlaybackPositionStore automaticSynchronizeOptions](self, "automaticSynchronizeOptions") & 1;
}

- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082554;
  block[3] = &unk_1004A63C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)checkForAvailabilityWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = sub_100082698;
    block[3] = &unk_1004A63C8;
    block[4] = self;
    v6 = v4;
    block[0] = _NSConcreteStackBlock;
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4
{
  self->_initialAutosyncNeeded = 0;
  -[MZUniversalPlaybackPositionStore _onQueueSynchronizeImmediatelyWithCompletionBlock:](self, "_onQueueSynchronizeImmediatelyWithCompletionBlock:", a4);
}

- (void)_onQueueSynchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MZUPPAsynchronousTask *synchronizeTask;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  MZUPPAsynchronousTask *v16;
  MZUPPAsynchronousTask *v17;
  MZUPPAsynchronousTask *v18;
  MZUPPAsynchronousTask *v19;
  MZUPPAsynchronousTask *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id buf;
  _QWORD block[4];
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));

  if (v5)
  {
    synchronizeTask = self->_synchronizeTask;
    v9 = _MTLogCategoryUPPSync(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (synchronizeTask)
    {
      if (v11)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_onQueueSync - UPP synchronize already in progress.  pending our completion block to be notified when it completes.", (uint8_t *)&buf, 2u);
      }

      -[MZAsynchronousTask addTaskCompletionBlock:](self->_synchronizeTask, "addTaskCompletionBlock:", v4);
    }
    else
    {
      if (v11)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_onQueueSync - UPP synchronize beginning sync operation...", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      -[MZUniversalPlaybackPositionStore _onQueueStopTimer](self, "_onQueueStopTimer");
      v16 = [MZUPPAsynchronousTask alloc];
      v17 = -[MZUPPAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:](v16, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:", self->_queue, CFSTR("MZUPPStore Synchronize"), 0, 20.0, *(double *)&qword_100572D10);
      v18 = self->_synchronizeTask;
      self->_synchronizeTask = v17;

      v19 = self->_synchronizeTask;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100082AD4;
      v28[3] = &unk_1004A7570;
      objc_copyWeak(&v29, &buf);
      -[MZAsynchronousTask setExpirationHandler:](v19, "setExpirationHandler:", v28);
      v20 = self->_synchronizeTask;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100082BA4;
      v26[3] = &unk_1004A7570;
      objc_copyWeak(&v27, &buf);
      -[MZAsynchronousTask setFinishedHandler:](v20, "setFinishedHandler:", v26);
      -[MZAsynchronousTask addTaskCompletionBlock:](self->_synchronizeTask, "addTaskCompletionBlock:", v4);
      kdebug_trace(723517680, 0, 0, 0, 0);
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self->_synchronizeTask, "metrics"));
      objc_msgSend(v23, "setBagLookupStartTime:", v22);

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100082D64;
      v24[3] = &unk_1004A81D0;
      objc_copyWeak(&v25, &buf);
      -[MZUniversalPlaybackPositionStore _onQueueLoadBagContextWithCompletionHandler:](self, "_onQueueLoadBagContextWithCompletionHandler:", v24);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    v12 = _MTLogCategoryUPPSync(v6, v7);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_onQueueSynchronizeImmediatelyWithCompletionBlock - short circuiting. No Active Account!", (uint8_t *)&buf, 2u);
    }

    global_queue = dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100082AC0;
    block[3] = &unk_1004A6378;
    v32 = v4;
    dispatch_async(v15, block);

  }
}

- (id)_accountForSyncing
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));

  return v3;
}

- (void)_updateSettingsFromLoadedBagContext:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000832E8;
  v4[3] = &unk_1004A6640;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  MZAsynchronousTask *v10;
  MZAsynchronousTask *v11;
  MZAsynchronousTask *bagLookupTask;
  MZAsynchronousTask *v13;
  MZAsynchronousTask *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id buf[2];
  _QWORD block[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000836C0;
  v32[3] = &unk_1004A81F8;
  v32[4] = self;
  v4 = a3;
  v33 = v4;
  v5 = objc_retainBlock(v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));
  if (v6)
  {

    goto LABEL_4;
  }
  v7 = -[MZUniversalPlaybackPositionStore canRequestStoreSignIn](self, "canRequestStoreSignIn");
  if (v7)
  {
LABEL_4:
    if (self->_bagLookupTask)
    {
      v8 = _MTLogCategoryCloudSync(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_onQueueLoadBag - UPP load bag already in progress.  pending our completion block to be notified when it completes.", (uint8_t *)buf, 2u);
      }

      -[MZAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v5);
    }
    else
    {
      objc_initWeak(buf, self);
      v10 = [MZAsynchronousTask alloc];
      v11 = -[MZAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:](v10, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:", self->_queue, CFSTR("MZUPPStore Load Bag"), 20.0, *(double *)&qword_100572D10);
      bagLookupTask = self->_bagLookupTask;
      self->_bagLookupTask = v11;

      v13 = self->_bagLookupTask;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100083738;
      v26[3] = &unk_1004A7570;
      objc_copyWeak(&v27, buf);
      -[MZAsynchronousTask setExpirationHandler:](v13, "setExpirationHandler:", v26);
      v14 = self->_bagLookupTask;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000837C4;
      v24[3] = &unk_1004A7570;
      objc_copyWeak(&v25, buf);
      -[MZAsynchronousTask setFinishedHandler:](v14, "setFinishedHandler:", v24);
      -[MZAsynchronousTask addTaskCompletionBlock:](self->_bagLookupTask, "addTaskCompletionBlock:", v5);
      -[MZAsynchronousTask beginTaskOperation](self->_bagLookupTask, "beginTaskOperation");
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100083928;
      v22[3] = &unk_1004A8240;
      objc_copyWeak(&v23, buf);
      -[MZUniversalPlaybackPositionStore _grabBagWithCompletionBlock:](self, "_grabBagWithCompletionBlock:", v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);
    }
    goto LABEL_12;
  }
  v15 = _MTLogCategoryCloudSync(v7);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - UPP skipping bag load: No Active Account!", (uint8_t *)buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1001, 0));
  global_queue = dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083724;
  block[3] = &unk_1004A7028;
  v20 = v5;
  v30 = v17;
  v31 = v20;
  v21 = v17;
  dispatch_async(v19, block);

LABEL_12:
}

- (void)_grabBagWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083C00;
  block[3] = &unk_1004A6378;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)_updateForStoreAccountsChange
{
  void *v3;
  NSObject *queue;
  id (*v5)(uint64_t);
  void ***v6;
  void **v7;
  void **v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore _accountForSyncing](self, "_accountForSyncing"));

  queue = self->_queue;
  if (v3)
  {
    v8 = _NSConcreteStackBlock;
    v5 = sub_100083DBC;
    v6 = &v8;
  }
  else
  {
    v7 = _NSConcreteStackBlock;
    v5 = sub_100083DC4;
    v6 = &v7;
  }
  v6[1] = (void **)3221225472;
  v6[2] = (void **)v5;
  v6[3] = (void **)&unk_1004A6200;
  v6[4] = (void **)&self->super.isa;
  dispatch_async(queue, v6);
}

- (void)_timerFired:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083E24;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUPPSyncTimer
{
  -[MZUniversalPlaybackPositionStore _onQueueScheduleTimer](self, "_onQueueScheduleTimer");
}

- (void)_onQueueStopTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v3);

  -[MZUniversalPlaybackPositionStore _onQueueSuspendTimer](self, "_onQueueSuspendTimer");
}

- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3
{
  void *v5;

  -[MZUniversalPlaybackPositionStore _onQueueStopTimer](self, "_onQueueStopTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  -[MZUniversalPlaybackPositionStore setDateToFireNextTimer:](self, "setDateToFireNextTimer:", v5);

  -[MZUniversalPlaybackPositionStore _onQueueResumeTimer](self, "_onQueueResumeTimer");
}

- (void)_onQueueStartNewTimer
{
  -[MZUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:](self, "_onQueueStartNewTimerWithTimeIntervalSinceNow:", self->_autorefreshRate);
}

- (void)_onQueueSuspendTimer
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_refreshTimerActive)
  {
    v3 = _MTLogCategoryCloudSync(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "suspending update timer", v5, 2u);
    }

    -[NSTimer invalidate](self->_timer, "invalidate");
    -[MZUniversalPlaybackPositionStore setTimer:](self, "setTimer:", 0);
    self->_refreshTimerActive = 0;
  }
}

- (BOOL)_timerIsStopped
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionStore dateToFireNextTimer](self, "dateToFireNextTimer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v4 = objc_msgSend(v2, "isEqualToDate:", v3);

  return v4;
}

- (void)_onQueueResumeTimer
{
  if (-[MZUniversalPlaybackPositionStore isActive](self, "isActive")
    && !self->_refreshTimerActive
    && !-[MZUniversalPlaybackPositionStore _timerIsStopped](self, "_timerIsStopped"))
  {
    -[MZUniversalPlaybackPositionStore _onQueueScheduleTimer](self, "_onQueueScheduleTimer");
  }
}

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)automaticSynchronizeOptions
{
  return self->_automaticSynchronizeOptions;
}

- (BOOL)hasLocalChangesToSync
{
  return self->_hasLocalChangesToSync;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (MZUPPAsynchronousTask)synchronizeTask
{
  return self->_synchronizeTask;
}

- (void)setSynchronizeTask:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizeTask, a3);
}

- (MZAsynchronousTask)bagLookupTask
{
  return self->_bagLookupTask;
}

- (void)setBagLookupTask:(id)a3
{
  objc_storeStrong((id *)&self->_bagLookupTask, a3);
}

- (MZUniversalPlaybackPositionSyncHandler)syncHandler
{
  return self->_syncHandler;
}

- (void)setSyncHandler:(id)a3
{
  objc_storeStrong((id *)&self->_syncHandler, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)refreshTimerActive
{
  return self->_refreshTimerActive;
}

- (void)setRefreshTimerActive:(BOOL)a3
{
  self->_refreshTimerActive = a3;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)initialAutosyncNeeded
{
  return self->_initialAutosyncNeeded;
}

- (void)setInitialAutosyncNeeded:(BOOL)a3
{
  self->_initialAutosyncNeeded = a3;
}

- (id)prefsObserver
{
  return self->_prefsObserver;
}

- (void)setPrefsObserver:(id)a3
{
  self->_prefsObserver = a3;
}

- (double)autorefreshRate
{
  return self->_autorefreshRate;
}

- (double)bagSpecifiedPollingInterval
{
  return self->_bagSpecifiedPollingInterval;
}

- (void)setBagSpecifiedPollingInterval:(double)a3
{
  self->_bagSpecifiedPollingInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dateToFireNextTimer, 0);
  objc_storeStrong((id *)&self->_syncHandler, 0);
  objc_storeStrong((id *)&self->_bagLookupTask, 0);
  objc_storeStrong((id *)&self->_synchronizeTask, 0);
}

@end

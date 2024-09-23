@implementation HomeNotificationActionOperation

- (HomeNotificationActionOperation)initWithAction:(id)a3 home:(id)a4 cameraProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HomeNotificationActionOperation *v12;
  HomeNotificationActionOperation *v13;
  dispatch_queue_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)HomeNotificationActionOperation;
    v13 = -[HomeNotificationActionOperation init](&v16, "init");
    if (v13)
    {
      v14 = dispatch_queue_create("com.apple.home.notificationActionOperation", 0);
      -[HomeNotificationActionOperation setAccessQueue:](v13, "setAccessQueue:", v14);

      -[HomeNotificationActionOperation setAction:](v13, "setAction:", v8);
      -[HomeNotificationActionOperation setHome:](v13, "setHome:", v9);
      -[HomeNotificationActionOperation setCameraProfile:](v13, "setCameraProfile:", v11);
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  HomeNotificationActionOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation accessQueue](self, "accessQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A030;
  v5[3] = &unk_100018928;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (-[HomeNotificationActionOperation isFinished](self, "isFinished") != a3)
  {
    -[HomeNotificationActionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    v5 = objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation accessQueue](self, "accessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A108;
    v6[3] = &unk_100018950;
    v6[4] = self;
    v7 = v3;
    dispatch_async(v5, v6);

    -[HomeNotificationActionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    if (v3)
      -[HomeNotificationActionOperation setExecuting:](self, "setExecuting:", 0);
  }
}

- (BOOL)isExecuting
{
  HomeNotificationActionOperation *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation accessQueue](self, "accessQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A1DC;
  v5[3] = &unk_100018928;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  if (-[HomeNotificationActionOperation isExecuting](self, "isExecuting") != a3)
  {
    -[HomeNotificationActionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    v5 = objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation accessQueue](self, "accessQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000A2A4;
    v6[3] = &unk_100018950;
    v6[4] = self;
    v7 = a3;
    dispatch_async(v5, v6);

    -[HomeNotificationActionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (void)start
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15[2];
  id location;
  _QWORD v17[5];

  if (-[HomeNotificationActionOperation isCancelled](self, "isCancelled"))
  {
    -[HomeNotificationActionOperation setFinished:](self, "setFinished:", 1);
  }
  else
  {
    -[HomeNotificationActionOperation setExecuting:](self, "setExecuting:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation action](self, "action"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

    if (objc_msgSend(v5, "isEqualToString:", CFSTR("microphone_toggleButton")))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation cameraProfile](self, "cameraProfile"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "microphoneControl"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation _toggleMicrophoneState:](self, "_toggleMicrophoneState:", v7));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000A48C;
      v17[3] = &unk_100018978;
      v17[4] = self;
      v9 = objc_msgSend(v8, "addCompletionBlock:", v17);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation action](self, "action"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceUUIDs"));

      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000A4B8;
      v13[3] = &unk_100018A68;
      v13[4] = self;
      v14 = v11;
      v15[1] = (id)a2;
      v12 = v11;
      objc_copyWeak(v15, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
      objc_destroyWeak(v15);

      objc_destroyWeak(&location);
    }

  }
}

- (id)_toggleMicrophoneState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation cameraProfile](self, "cameraProfile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraStream"));

    if (v6)
    {
      v7 = objc_alloc((Class)HFCameraAudioManager);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation cameraProfile](self, "cameraProfile"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation home](self, "home"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_characteristicValueManager"));
      v11 = objc_msgSend(v7, "initWithCameraProfile:cameraStream:valueManager:", v8, v6, v10);

      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "setOutgoingAudioEnabled:", objc_msgSend(v11, "isOutgoingAudioEnabled") ^ 1));
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 35));
      v12 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v11));
    }
    v15 = (void *)v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000AC98;
    v18[3] = &unk_100018A90;
    v18[4] = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recover:", v18));

  }
  else
  {
    v13 = HFLogForCategory(14);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000EA18(v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 38));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v15));
  }

  return v16;
}

- (id)_toggleLightbulbsForItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  HomeNotificationActionOperation *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_filter:", &stru_100018AD0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation _itemsToInvertPrimaryStateForItems:preferredPrimaryState:targetPrimaryState:](self, "_itemsToInvertPrimaryStateForItems:preferredPrimaryState:targetPrimaryState:", v4, 2, &v18));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation _writePrimaryState:forItems:](self, "_writePrimaryState:forItems:", v18, v5));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000AF20;
  v15[3] = &unk_100018AF8;
  v17 = v18;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v15));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B00C;
  v12[3] = &unk_100018B20;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recover:", v12));

  return v10;
}

- (id)_unlockLocksAndDisarmSecuritySystemsForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  HomeNotificationActionOperation *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  HomeNotificationActionOperation *v28;
  _QWORD v29[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_filter:", &stru_100018B40));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_filter:", &stru_100018B60));
  if (!objc_msgSend(v5, "count") && !objc_msgSend(v6, "count"))
    NSLog(CFSTR("Attempted to unlock doors and disarm security systems when no such accessories were found! Items: %@"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_filter:", &stru_100018B80));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_filter:", &stru_100018BA0));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000B4C0;
  v29[3] = &unk_100018BE8;
  v29[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "na_map:", v29));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation _writePrimaryState:forItems:](self, "_writePrimaryState:forItems:", 2, v19));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:](NAFuture, "combineAllFutures:", v10));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000B648;
  v25[3] = &unk_100018C10;
  v12 = v5;
  v26 = v12;
  v13 = v6;
  v27 = v13;
  v28 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v25));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000B7B0;
  v21[3] = &unk_100018C38;
  v22 = v12;
  v23 = v13;
  v24 = self;
  v15 = v13;
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recover:", v21));

  return v17;
}

- (id)_writePrimaryState:(int64_t)a3 forItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation home](self, "home"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_characteristicValueManager"));
    objc_msgSend(v8, "beginTransactionWithReason:", CFSTR("Long Look notification light toggle"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000BB0C;
    v16[3] = &unk_100018C60;
    v16[4] = self;
    v16[5] = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_map:", v16));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationActionOperation home](self, "home"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_characteristicValueManager"));
    objc_msgSend(v11, "commitTransactionWithReason:", CFSTR("Long Look notification light toggle"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:ignoringErrors:scheduler:](NAFuture, "combineAllFutures:ignoringErrors:scheduler:", v12, 0, v13));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v14;
}

- (id)_itemsToInvertPrimaryStateForItems:(id)a3 preferredPrimaryState:(int64_t)a4 targetPrimaryState:(int64_t *)a5
{
  uint64_t v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void **v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[5];

  v6 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000BCDC;
  v20[3] = &unk_100018C80;
  v20[4] = a4;
  v7 = a3;
  v8 = objc_retainBlock(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", v8));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10000BD44;
  v18 = &unk_100018CA8;
  v19 = v8;
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", &v15));

  if (objc_msgSend(v11, "count", v15, v16, v17, v18))
  {
    v12 = v11;
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v12 = v9;
  if (a5)
  {
    v6 = HFToggledPrimaryState(v6);
    v12 = v9;
LABEL_6:
    *a5 = v6;
  }
LABEL_7:
  v13 = v12;

  return v13;
}

- (HomeNotificationAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (NSString)resultString
{
  return self->_resultString;
}

- (void)setResultString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resultString, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end

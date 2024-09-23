@implementation RMHeadphoneStatusProvider

- (RMHeadphoneStatusProvider)initWithReceiverQueue:(id)a3 requireActivitySupport:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RMHeadphoneStatusProvider *v7;
  RMHeadphoneStatusProvider *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMHeadphoneStatusProvider;
  v7 = -[RMHeadphoneStatusProvider init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[RMHeadphoneStatusProvider setReceiverQueue:](v7, "setReceiverQueue:", v6);
    -[RMHeadphoneStatusProvider setRequireActivity:](v8, "setRequireActivity:", v4);
  }

  return v8;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4;
  RMAudioAccessoryManager *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = objc_opt_new(RMAudioAccessoryManager);
  -[RMHeadphoneStatusProvider setAudioAccessoryManager:](self, "setAudioAccessoryManager:", v5);

  +[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable");
  -[RMHeadphoneStatusProvider setCallbackBlock:](self, "setCallbackBlock:", v4);

  if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity"))
  {
    -[RMHeadphoneStatusProvider startMonitoringActiveAudioRoute](self, "startMonitoringActiveAudioRoute");
    -[RMHeadphoneStatusProvider updateActivityForCurrentRoute](self, "updateActivityForCurrentRoute");
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008D94;
  v9[3] = &unk_100024BB8;
  v9[4] = self;
  v6 = objc_retainBlock(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  objc_msgSend(v7, "startStatusUpdatesWithHandler:", v6);

  return 0;
}

- (void)stopProducingData
{
  void *v3;

  if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity"))
    -[RMHeadphoneStatusProvider stopMonitoringActiveAudioRoute](self, "stopMonitoringActiveAudioRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  objc_msgSend(v3, "stopStatusUpdates");

  -[RMHeadphoneStatusProvider setAudioAccessoryManager:](self, "setAudioAccessoryManager:", 0);
}

- (void)notifyDisconnectedToClient
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024C00);
  v3 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] About to notify disconnected to client.", v4, 2u);
  }
  -[RMHeadphoneStatusProvider notifyClientWithStatusConnected:](self, "notifyClientWithStatusConnected:", 0);
}

- (void)notifyConnectedToClient
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024C00);
  v3 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] About to notify connected to client.", v4, 2u);
  }
  -[RMHeadphoneStatusProvider notifyClientWithStatusConnected:](self, "notifyClientWithStatusConnected:", 1);
}

- (void)notifyClientWithStatusConnected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v19 = kCMHeadphoneMotionManagerEventTypeKey;
  v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeConnect;
  if (!a3)
    v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeDisconnect;
  v20 = *v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 0, 0));
  if (v7)
  {
    if (-[RMHeadphoneStatusProvider requireActivity](self, "requireActivity")
      && !-[RMHeadphoneStatusProvider activitySupported](self, "activitySupported")
      && v3)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024C00);
      v8 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "[RMHeadphoneStatusProvider] Dropping connect event due to no activity support.";
        v10 = v8;
        v11 = OS_LOG_TYPE_DEFAULT;
        v12 = 2;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider receiverQueue](self, "receiverQueue"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000918C;
      v15[3] = &unk_1000248B0;
      v15[4] = self;
      v16 = v7;
      dispatch_async(v13, v15);

    }
  }
  else
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024C00);
    v14 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      v9 = "[RMHeadphoneStatusProvider] Failed to serialize event NSDictionary object: %{public}@";
      v10 = v14;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_16;
    }
  }

}

- (void)startMonitoringActiveAudioRoute
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "onActiveAudioRouteChanged:", CFSTR("RMAudioDeviceChangeCompletedNotification"), 0);

}

- (void)stopMonitoringActiveAudioRoute
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("RMAudioDeviceChangeCompletedNotification"), 0);

}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4;
  RMHeadphoneStatusProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RMAudioDeviceChangeCompletedRouteIDKey")));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider activeAudioRouteDeviceID](v5, "activeAudioRouteDeviceID"));
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if ((v9 & 1) == 0)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024C00);
      v10 = (id)qword_10002C4B8;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider activeAudioRouteDeviceID](v5, "activeAudioRouteDeviceID"));
        v13 = 138478083;
        v14 = v7;
        v15 = 2113;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] New audio route: %{private}@ (old route: %{private}@). Starting activity check.", (uint8_t *)&v13, 0x16u);

      }
      -[RMHeadphoneStatusProvider setActiveAudioRouteDeviceID:](v5, "setActiveAudioRouteDeviceID:", v7);
      -[RMHeadphoneStatusProvider updateActivityForCurrentRoute](v5, "updateActivityForCurrentRoute");
    }
  }
  else
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024C00);
    v12 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] Speaker route. Resetting activity support.", (uint8_t *)&v13, 2u);
    }
    -[RMHeadphoneStatusProvider setActivitySupported:](v5, "setActivitySupported:", 0);
    -[RMHeadphoneStatusProvider setActiveAudioRouteDeviceID:](v5, "setActiveAudioRouteDeviceID:", 0);
  }

  objc_sync_exit(v5);
}

- (void)updateActivityForCurrentRoute
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMHeadphoneStatusProvider audioAccessoryManager](self, "audioAccessoryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000951C;
  v4[3] = &unk_100024BE0;
  v4[4] = self;
  objc_msgSend(v3, "startActivityUpdatesWithHandler:", v4);

}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_receiverQueue, a3);
}

- (RMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryManager, a3);
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_activeAudioRouteDeviceID, a3);
}

- (BOOL)activitySupported
{
  return self->_activitySupported;
}

- (void)setActivitySupported:(BOOL)a3
{
  self->_activitySupported = a3;
}

- (BOOL)requireActivity
{
  return self->_requireActivity;
}

- (void)setRequireActivity:(BOOL)a3
{
  self->_requireActivity = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCallbackBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_activeAudioRouteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end

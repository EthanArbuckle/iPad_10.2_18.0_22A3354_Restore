@implementation MSDBackgroundDownload

+ (id)sharedInstance
{
  if (qword_100175458 != -1)
    dispatch_once(&qword_100175458, &stru_10013F190);
  return (id)qword_100175450;
}

- (void)kickOffBackgroundDownload
{
  MSDBackgroundDownload *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (-[MSDBackgroundDownload isBackgroundDownloadQueueEmpty](v2, "isBackgroundDownloadQueueEmpty"))
  {
    -[MSDBackgroundDownload setIsBackgroundDownloadQueueEmpty:](v2, "setIsBackgroundDownloadQueueEmpty:", 0);
    v3 = objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v4 = objc_claimAutoreleasedReturnValue(-[NSObject backgroundDownloadQueue](v3, "backgroundDownloadQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074454;
    block[3] = &unk_10013D868;
    block[4] = v2;
    dispatch_async(v4, block);

  }
  else
  {
    v5 = sub_1000604F0();
    v3 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Background download is already scheduled, skipping call to schedule background donwload", buf, 2u);
    }
  }

  objc_sync_exit(v2);
}

- (id)initiateBackgroundDownload
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "retrieveSignedManifest"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress"));
    if (!v5
      || (v6 = (void *)v5,
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress")),
          v8 = +[MSDBundleProgressTracker isBundleInstance:identicalWithNewBundle:](MSDBundleProgressTracker, "isBundleInstance:identicalWithNewBundle:", v7, v4), v7, v6, (v8 & 1) == 0))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
      objc_msgSend(v9, "cleanUpBackgroundState:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      objc_msgSend(v10, "startBundleUpdateMonitor:inMode:", v4, 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundBundle"));
      -[MSDBackgroundDownload setBundleDownloadInProgress:](self, "setBundleDownloadInProgress:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](self, "device"));
      objc_msgSend(v13, "setBackgroundDownloadActive:", 1);

    }
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "signedManifest in background download: %{public}@", (uint8_t *)&v18, 0xCu);
    }

    v16 = v4;
  }

  return v4;
}

- (void)quitBackgroundDownload
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000C3AD8(self, v4);

  -[MSDBackgroundDownload _abortBackgroundDownload](self, "_abortBackgroundDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](self, "bundleDownloadInProgress"));
  objc_msgSend(v5, "stopBundleUpdateTimer");

}

- (void)_abortBackgroundDownload
{
  MSDBackgroundDownload *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
  v4 = objc_msgSend(v3, "backgroundDownloadState");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
    objc_msgSend(v5, "setBackgroundDownloadState:", 2);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload device](v2, "device"));
    objc_msgSend(v6, "setBackgroundDownloadActive:", 0);

    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Aborting background download...", v11, 2u);
    }

    if (-[MSDBackgroundDownload freezeBackgroundDownload](v2, "freezeBackgroundDownload"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
      objc_msgSend(v9, "resumeProcessing");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
    objc_msgSend(v10, "abortProcessing");

  }
  objc_sync_exit(v2);

}

- (void)_pauseBackgroundDownloadForReason:(id)a3
{
  id v4;
  MSDBackgroundDownload *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[MSDBackgroundDownload freezeBackgroundDownload](v5, "freezeBackgroundDownload"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v5, "bundleDownloadInProgress"));
    v7 = objc_msgSend(v6, "bundleState");

    if (v7 == 1)
    {
      -[MSDBackgroundDownload setFreezeBackgroundDownload:](v5, "setFreezeBackgroundDownload:", 1);
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pausing background download for reason: %{public}@", (uint8_t *)&v14, 0xCu);
      }

      -[MSDBackgroundDownload setBgDownloadPauseReason:](v5, "setBgDownloadPauseReason:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v10, "timeIntervalSince1970");
      -[MSDBackgroundDownload setBgDownloadPauseStartTime:](v5, "setBgDownloadPauseStartTime:", (uint64_t)v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v5, "bundleDownloadInProgress"));
      objc_msgSend(v12, "stopBundleUpdateTimer");

      -[MSDBackgroundDownload _sendDownloadStatusUpdateNotification](v5, "_sendDownloadStatusUpdateNotification");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v5, "componentManager"));
      objc_msgSend(v13, "pauseProcessing");

    }
  }
  objc_sync_exit(v5);

}

- (void)_resumeBackgroundDownload
{
  MSDBackgroundDownload *v2;
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v2 = self;
  objc_sync_enter(v2);
  if (-[MSDBackgroundDownload freezeBackgroundDownload](v2, "freezeBackgroundDownload"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v2, "bundleDownloadInProgress"));
    v4 = objc_msgSend(v3, "bundleState");

    if (v4 == 1)
    {
      -[MSDBackgroundDownload setFreezeBackgroundDownload:](v2, "setFreezeBackgroundDownload:", 0);
      v5 = sub_1000604F0();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resuming background download...", v15, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)-[MSDBackgroundDownload bgDownloadPauseStartTime](v2, "bgDownloadPauseStartTime")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v7);
      v10 = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bgDownloadPauseReason](v2, "bgDownloadPauseReason"));
      objc_msgSend(v11, "sendBgDownloadPausedEvent:forReason:", (uint64_t)v10, v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload bundleDownloadInProgress](v2, "bundleDownloadInProgress"));
      objc_msgSend(v13, "startBundleUpdateTimer");

      -[MSDBackgroundDownload _sendDownloadStatusUpdateNotification](v2, "_sendDownloadStatusUpdateNotification");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDBackgroundDownload componentManager](v2, "componentManager"));
      objc_msgSend(v14, "resumeProcessing");

    }
  }
  objc_sync_exit(v2);

}

- (void)_sendDownloadStatusUpdateNotification
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDBackgroundDownload freezeBackgroundDownload](self, "freezeBackgroundDownload")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("kMSDDownloadPausedKey"), 0));

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MSDNotificationPauseDownload"), 0, v4);
}

- (void)didReceiveNewPauseStatus:(BOOL)a3 forReason:(id)a4
{
  if (a3)
    -[MSDBackgroundDownload _pauseBackgroundDownloadForReason:](self, "_pauseBackgroundDownloadForReason:", a4);
  else
    -[MSDBackgroundDownload _resumeBackgroundDownload](self, "_resumeBackgroundDownload", a3);
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)freezeBackgroundDownload
{
  return self->_freezeBackgroundDownload;
}

- (void)setFreezeBackgroundDownload:(BOOL)a3
{
  self->_freezeBackgroundDownload = a3;
}

- (BOOL)isBackgroundDownloadQueueEmpty
{
  return self->_isBackgroundDownloadQueueEmpty;
}

- (void)setIsBackgroundDownloadQueueEmpty:(BOOL)a3
{
  self->_isBackgroundDownloadQueueEmpty = a3;
}

- (MSDBundleProgressTracker)bundleDownloadInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleDownloadInProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)bgDownloadPauseStartTime
{
  return self->_bgDownloadPauseStartTime;
}

- (void)setBgDownloadPauseStartTime:(int64_t)a3
{
  self->_bgDownloadPauseStartTime = a3;
}

- (NSString)bgDownloadPauseReason
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBgDownloadPauseReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MSDComponentManager)componentManager
{
  return (MSDComponentManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComponentManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentManager, 0);
  objc_storeStrong((id *)&self->_bgDownloadPauseReason, 0);
  objc_storeStrong((id *)&self->_bundleDownloadInProgress, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

@implementation FMDSecureLocationPublisher

- (FMDSecureLocationPublisher)initWithConfiguration:(id)a3
{
  id v5;
  FMDSecureLocationPublisher *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *publishQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDSecureLocationPublisher;
  v6 = -[FMDSecureLocationPublisher init](&v12, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.findmydevice.locationPublisherQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.findmydevice.publishingBlockQueue", 0);
    publishQueue = v6->_publishQueue;
    v6->_publishQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v6;
}

- (void)startPublisherWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5370;
  block[3] = &unk_1002C1CF8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)publishCriteriaMetBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5494;
  block[3] = &unk_1002C1CF8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)processUpdatedLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A55AC;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)publishPreviouslyReceivedLocation
{
  FMDSecureLocationPublisher *v2;
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
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A5F80;
  v5[3] = &unk_1002C3DC8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_publishResultLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  NSObject *v26;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMNetworkMonitor sharedInstance](FMNetworkMonitor, "sharedInstance"));
  v7 = objc_msgSend(v6, "isMonitoring");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMNetworkMonitor sharedInstance](FMNetworkMonitor, "sharedInstance"));
    v9 = objc_msgSend(v8, "isNetworkUp");

    if ((v9 & 1) == 0)
    {
      v10 = sub_10005318C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: network is not up. lets keep location, not publish it", buf, 2u);
      }

      -[FMDSecureLocationPublisher setLastReceivedLocation:](self, "setLastReceivedLocation:", v4);
      goto LABEL_14;
    }
  }
  else
  {
    v12 = sub_10005318C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: we are not monitoring network. lets publish and try", buf, 2u);
    }

  }
  -[FMDSecureLocationPublisher setLastPublishedLocation:](self, "setLastPublishedLocation:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher publishingBlock](self, "publishingBlock"));
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher publishQueue](self, "publishQueue"));
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000A63C8;
    v24 = &unk_1002C16D8;
    v26 = v14;
    v16 = v4;
    v25 = v16;
    dispatch_async(v15, &v21);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "locationInfo", v21, v22, v23, v24));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timestamp"));
    -[FMDSecureLocationPublisher _persistLastPublishedTimestamp:](self, "_persistLastPublishedTimestamp:", v18);

    -[FMDSecureLocationPublisher setLastReceivedLocation:](self, "setLastReceivedLocation:", 0);
    v19 = v26;
  }
  else
  {
    v20 = sub_10005318C();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: no publish block to send locations to", buf, 2u);
    }
  }

LABEL_14:
}

- (id)_persistedLastPublishedTimestamp
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", CFSTR("secureLocationsLastPublishedTimestamp"), kFMDNotBackedUpPrefDomain));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_persistLastPublishedTimestamp:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMDSecureLocationPublisher serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    +[FMPreferencesUtil setObject:forKey:inDomain:](FMPreferencesUtil, "setObject:forKey:inDomain:", v6, CFSTR("secureLocationsLastPublishedTimestamp"), kFMDNotBackedUpPrefDomain);

  }
  v7 = sub_10005318C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: Persisted lastPublished %@", (uint8_t *)&v9, 0xCu);
  }

}

- (FMDSecureLocationConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (id)publishingBlock
{
  return self->_publishingBlock;
}

- (void)setPublishingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)startedPublishing
{
  return self->_startedPublishing;
}

- (void)setStartedPublishing:(BOOL)a3
{
  self->_startedPublishing = a3;
}

- (FMDSecureLocationInfo)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, a3);
}

- (FMDSecureLocationInfo)lastPublishedVisit
{
  return self->_lastPublishedVisit;
}

- (void)setLastPublishedVisit:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedVisit, a3);
}

- (FMDSecureLocationInfo)lastReceivedLocation
{
  return self->_lastReceivedLocation;
}

- (void)setLastReceivedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedLocation, a3);
}

- (id)criteriaMetBlock
{
  return self->_criteriaMetBlock;
}

- (void)setCriteriaMetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)publishQueue
{
  return self->_publishQueue;
}

- (void)setPublishQueue:(id)a3
{
  objc_storeStrong((id *)&self->_publishQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_criteriaMetBlock, 0);
  objc_storeStrong((id *)&self->_lastReceivedLocation, 0);
  objc_storeStrong((id *)&self->_lastPublishedVisit, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong(&self->_publishingBlock, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end

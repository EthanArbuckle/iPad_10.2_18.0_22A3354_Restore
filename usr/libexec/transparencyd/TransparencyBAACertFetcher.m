@implementation TransparencyBAACertFetcher

- (TransparencyBAACertFetcher)initWithWorkloop:(id)a3
{
  id v4;
  TransparencyBAACertFetcher *v5;
  KTNearFutureScheduler *v6;
  KTNearFutureScheduler *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  dispatch_group_t v11;
  TransparencyBAACertFetcher *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TransparencyBAACertFetcher;
  v5 = -[TransparencyBAACertFetcher init](&v20, "init");
  if (v5)
  {
    location = 0;
    objc_initWeak(&location, v5);
    v6 = [KTNearFutureScheduler alloc];
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1001A9444;
    v17 = &unk_10023A970;
    objc_copyWeak(&v18, &location);
    v7 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:](v6, "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("BAACertFetch"), 2000000000, 7200000000000, 0, 0, &v14, 2.0);
    -[TransparencyBAACertFetcher setBAACertFetcher:](v5, "setBAACertFetcher:", v7, v14, v15, v16, v17);

    -[TransparencyBAACertFetcher setWorkloop:](v5, "setWorkloop:", v4);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.transparency.deviceCertIssuanceQueue", v9);
    -[TransparencyBAACertFetcher setIssuanceQueue:](v5, "setIssuanceQueue:", v10);

    v11 = dispatch_group_create();
    -[TransparencyBAACertFetcher setIssuanceGroup:](v5, "setIssuanceGroup:", v11);

    v12 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)deviceIdentityIssuerCert:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_1001A9584;
  v13[4] = sub_1001A9594;
  v14 = 0;
  v14 = (id)os_transaction_create("com.apple.transparency.DeviceIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher workloop](self, "workloop"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A959C;
  v10[3] = &unk_10024CF88;
  v9 = v7;
  v11 = v9;
  v12 = v13;
  DeviceIdentityIssueClientCertificateWithCompletion(v8, v6, v10);

  _Block_object_dispose(v13, 8);
}

- (int64_t)getBAAValidity
{
  uint64_t v2;

  v2 = kKTMaxBAACertTTLInMinutes;
  return v2 - arc4random_uniform(kKTBAACertTTLMaxTTLOffsetInMinutes);
}

- (void)fetchCacheOnly:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;
  _QWORD block[5];
  id v23;
  uint8_t buf[8];
  _QWORD v25[2];
  _QWORD v26[5];
  _QWORD v27[5];

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
  objc_sync_enter(v7);
  if (-[TransparencyBAACertFetcher outstandingRemoteFetchSignal](self, "outstandingRemoteFetchSignal"))
  {
    if (qword_1002A7C28 != -1)
      dispatch_once(&qword_1002A7C28, &stru_10024CFA8);
    v8 = qword_1002A7C30;
    if (os_log_type_enabled((os_log_t)qword_1002A7C30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "An existing remote cert fetch is in progress. Waiting for that to finish.", buf, 2u);
    }
    v9 = objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
    v10 = objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceQueue](self, "issuanceQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A9A90;
    block[3] = &unk_10023D708;
    block[4] = self;
    v23 = v6;
    v11 = v6;
    dispatch_group_notify(v9, v10, block);

    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    if (a3)
    {
      v12 = &kMAOptionsBAASkipNetworkRequest;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
      objc_sync_enter(v13);
      v14 = objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher issuanceGroup](self, "issuanceGroup"));
      dispatch_group_enter(v14);

      -[TransparencyBAACertFetcher setOutstandingRemoteFetchSignal:](self, "setOutstandingRemoteFetchSignal:", 1);
      objc_sync_exit(v13);

      v12 = &kMAOptionsBAAIgnoreExistingKeychainItems;
    }
    v27[0] = kTransparencyBAACertKeychainLabelKey;
    v26[0] = kMAOptionsBAAKeychainLabel;
    v26[1] = kMAOptionsBAAValidity;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[TransparencyBAACertFetcher getBAAValidity](self, "getBAAValidity")));
    v27[1] = v15;
    v27[2] = kTransparencyBAACertKeychainAccessGroup;
    v26[2] = kMAOptionsBAAKeychainAccessGroup;
    v26[3] = kMAOptionsBAAOIDSToInclude;
    v25[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v25[1] = kMAOptionsBAAOIDDeviceOSInformation;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    v27[3] = v16;
    v26[4] = kMAOptionsUseSoftwareGeneratedKey;
    v27[4] = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 5));
    v7 = objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *v12);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001A9AA0;
    v19[3] = &unk_10024CFD0;
    v21 = a3;
    v19[4] = self;
    v20 = v6;
    v18 = v6;
    -[TransparencyBAACertFetcher deviceIdentityIssuerCert:completionHandler:](self, "deviceIdentityIssuerCert:completionHandler:", v7, v19);

  }
}

- (void)triggerRemoteBAACertFetch
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001A9BA0;
  v2[3] = &unk_10024D018;
  v2[4] = self;
  -[TransparencyBAACertFetcher fetchCacheOnly:completion:](self, "fetchCacheOnly:completion:", 0, v2);
}

- (void)getDeviceCertWithForcedFetch:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v5;
  _QWORD v6[4];
  TransparencyBAACertFetcher *v7;
  id v8;

  v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A9D80;
  v6[3] = &unk_10024C4D0;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[TransparencyBAACertFetcher fetchCacheOnly:completion:](v7, "fetchCacheOnly:completion:", !v4, v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyBAACertFetcher BAACertFetcher](self, "BAACertFetcher"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)TransparencyBAACertFetcher;
  -[TransparencyBAACertFetcher dealloc](&v4, "dealloc");
}

- (KTNearFutureScheduler)BAACertFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBAACertFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkloop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_group)issuanceGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIssuanceGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)issuanceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIssuanceQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)outstandingRemoteFetchSignal
{
  return self->_outstandingRemoteFetchSignal;
}

- (void)setOutstandingRemoteFetchSignal:(BOOL)a3
{
  self->_outstandingRemoteFetchSignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuanceQueue, 0);
  objc_storeStrong((id *)&self->_issuanceGroup, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_BAACertFetcher, 0);
}

@end

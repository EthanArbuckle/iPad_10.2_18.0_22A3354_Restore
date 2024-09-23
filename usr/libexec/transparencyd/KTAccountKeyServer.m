@implementation KTAccountKeyServer

- (void)clearCachedPCSIdentity
{
  os_unfair_lock_s *p_identityCacheLock;

  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  -[KTAccountKeyServer set_pcsIdentity:](self, "set_pcsIdentity:", 0);
  -[KTAccountKeyServer set_pcsIdentityCachedTime:](self, "set_pcsIdentityCachedTime:", 0);
  os_unfair_lock_unlock(p_identityCacheLock);
}

- (id)copyCachedPCSIdentity
{
  os_unfair_lock_s *p_identityCacheLock;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentity](self, "_pcsIdentity"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentityCachedTime](self, "_pcsIdentityCachedTime"));
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;
    v8 = (double)(uint64_t)-kKTAuthenticationLifetime;

    v4 = 0;
    if (v7 > v8)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentity](self, "_pcsIdentity"));
  }
  os_unfair_lock_unlock(p_identityCacheLock);
  return v4;
}

- (void)cachePCSIdentity:(id)a3
{
  os_unfair_lock_s *p_identityCacheLock;
  id v5;
  void *v6;

  p_identityCacheLock = &self->_identityCacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_identityCacheLock);
  -[KTAccountKeyServer set_pcsIdentity:](self, "set_pcsIdentity:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[KTAccountKeyServer set_pcsIdentityCachedTime:](self, "set_pcsIdentityCachedTime:", v6);

  os_unfair_lock_unlock(p_identityCacheLock);
}

+ (id)applicationToService:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1002A7838;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1002A7838, &stru_100248568);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002A7840, "objectForKeyedSubscript:", v4));

  return v5;
}

+ (id)sharedKeyServiceForApplication:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v4));

  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(a1, v6), "applicationToService:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v9)
    {
      v10 = objc_msgSend((id)objc_opt_class(a1, v8), "sharedKeyService:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }
    else
    {
      if (qword_1002A7848 != -1)
        dispatch_once(&qword_1002A7848, &stru_1002485A8);
      v13 = qword_1002A7850;
      if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unknown application mapping: %@", (uint8_t *)&v15, 0xCu);
      }
      v11 = 0;
    }

  }
  else
  {
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_100248588);
    v12 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)clearCachedPCSIdentities
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7858);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002A7860, "allValues", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "clearCachedPCSIdentity");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7858);
}

+ (id)sharedKeyService:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD block[5];

  v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100152C98;
  block[3] = &unk_100247488;
  block[4] = a1;
  if (qword_1002A7868 != -1)
    dispatch_once(&qword_1002A7868, block);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7858);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002A7860, "objectForKeyedSubscript:", v4));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7858);
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v6)), "initWithService:", v4);
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A7858);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002A7860, "objectForKeyedSubscript:", v4));

      if (v7)
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002A7860, "objectForKeyedSubscript:", v4));

        v5 = (id)v8;
      }
      else
      {
        objc_msgSend((id)qword_1002A7860, "setObject:forKeyedSubscript:", v5, v4);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A7858);
    }
  }

  return v5;
}

- (id)initKeyServiceWithApplication:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  KTAccountKeyServer *v8;
  NSObject *v9;
  int v11;
  id v12;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "applicationToService:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    self = -[KTAccountKeyServer initWithService:](self, "initWithService:", v4);
    v8 = self;
  }
  else
  {
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_100248608);
    v9 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unknown application mapping: %@", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (KTAccountKeyServer)initWithService:(id)a3
{
  KTAccountKeyServer *v3;
  KTAccountKeyServer *v4;
  dispatch_group_t v5;
  OS_dispatch_group *creationGroup;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *creationQueue;
  KTAccountKeyServer *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)KTAccountKeyServer;
  v3 = -[KTAccountKeyServer init](&v13, "init", a3);
  v4 = v3;
  if (v3)
  {
    v3->_identityCacheLock._os_unfair_lock_opaque = 0;
    v5 = dispatch_group_create();
    creationGroup = v4->_creationGroup;
    v4->_creationGroup = (OS_dispatch_group *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.transparencyd.AccountKeyCreate", v8);
    creationQueue = v4->_creationQueue;
    v4->_creationQueue = (OS_dispatch_queue *)v9;

    v11 = v4;
  }

  return v4;
}

+ (void)startMetrics:(id)a3 services:(id)a4
{
  id v5;
  id v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  v6 = a4;
  location = 0;
  objc_initWeak(&location, v5);
  v7 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100153118;
  v9[3] = &unk_100248658;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v5, "addMultiSamplerForName:withTimeInterval:block:", CFSTR("KTAccountKeyMultiSampler"), v9, v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (id)pcsOptions:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;

  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:", &v14));
  v5 = v14;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
    v7 = (void *)v6;
    if (v6)
    {
      v15 = kPCSSetupDSID;
      v16 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    }
    else
    {
      if (qword_1002A7848 != -1)
        dispatch_once(&qword_1002A7848, &stru_100248698);
      v10 = (void *)qword_1002A7850;
      if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get primary account dsid, returning nil PCS options: %@", buf, 0xCu);

      }
      v8 = 0;
    }

  }
  else
  {
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_100248678);
    v9 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get primary account, returning nil PCS options", buf, 2u);
    }
    v8 = 0;
    if (a3 && v5)
    {
      v8 = 0;
      *a3 = objc_retainAutorelease(v5);
    }
  }

  return v8;
}

- (__CFString)service
{
  return CFSTR("com.apple.KTAccountKey");
}

- (_PCSIdentitySetData)copyPCSIdentitySet:(id *)a3
{
  void *v5;
  id v6;
  _PCSIdentitySetData *v7;
  NSObject *v8;
  void *v9;
  id v11;
  void *v12;
  uint8_t buf[4];
  void *v14;

  v11 = 0;
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer pcsOptions:](self, "pcsOptions:", &v11));
  v6 = v11;
  if (v5)
  {
    v7 = (_PCSIdentitySetData *)PCSIdentitySetCreate(v5, -[KTAccountKeyServer service](self, "service"), &v12);
    if (v7 && !v12)
      goto LABEL_15;
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_1002486B8);
    v8 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to create account key identity set: %@", buf, 0xCu);
    }
    v9 = v12;

    v6 = v9;
    if (!v9)
      v6 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -267, CFSTR("failed to create account key identity set")));
    if (v7)
      CFRelease(v7);
  }
  v7 = 0;
  if (a3 && v6)
  {
    v6 = objc_retainAutorelease(v6);
    v7 = 0;
    *a3 = v6;
  }
LABEL_15:

  return v7;
}

- (void)createIdentityForSet:(_PCSIdentitySetData *)a3 roll:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _PCSIdentitySetData *v17;
  BOOL v18;
  _QWORD block[5];
  id v20;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
  objc_sync_enter(v9);
  if (-[KTAccountKeyServer outstandingCreationSignal](self, "outstandingCreationSignal"))
  {
    v10 = objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
    v11 = objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationQueue](self, "creationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100153A08;
    block[3] = &unk_10023D708;
    block[4] = self;
    v20 = v8;
    v12 = v8;
    dispatch_group_notify(v10, v11, block);

    objc_sync_exit(v9);
  }
  else
  {
    objc_sync_exit(v9);

    v13 = objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
    v14 = objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationQueue](self, "creationQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100153A14;
    v15[3] = &unk_100248728;
    v15[4] = self;
    v16 = v8;
    v18 = a4;
    v17 = a3;
    v9 = v8;
    dispatch_group_async(v13, v14, v15);

  }
}

- (void)wrapperPCSIdentitySetCreateManatee:(_PCSIdentitySetData *)a3 service:(__CFString *)a4 options:(id)a5 block:(id)a6
{
  id v10;
  _QWORD v11[5];
  id v12;
  _PCSIdentitySetData *v13;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100153E34;
  v11[3] = &unk_100248750;
  v12 = a6;
  v13 = a3;
  v11[4] = self;
  v10 = v12;
  PCSIdentitySetCreateManatee(a3, a4, a5, v11);

}

- (BOOL)haveIdentity
{
  id v3;
  void *v4;
  BOOL v5;
  _PCSIdentitySetData *v6;
  id v7;
  uint64_t v8;
  CFTypeRef v9;
  CFTypeRef cf;
  id v12;

  v3 = -[KTAccountKeyServer copyCachedPCSIdentity](self, "copyCachedPCSIdentity");
  if (v3)
  {
    v4 = v3;
    v5 = 1;
  }
  else
  {
    v12 = 0;
    v6 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v12);
    v7 = v12;
    if (v6)
    {
      cf = 0;
      v8 = PCSIdentitySetCopyCurrentIdentityPointer(v6, -[KTAccountKeyServer service](self, "service"), &cf);
      v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v5 = v4 != 0;
      CFRelease(v6);
      v9 = cf;
      if (cf)
      {
        cf = 0;
        CFRelease(v9);
      }
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }

  }
  return v5;
}

- (void)getPCSIdentity:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;
  void *v7;
  double Current;
  _PCSIdentitySetData *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  CFAbsoluteTime v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  CFTypeRef v23;
  CFTypeRef cf;
  id v25;
  uint8_t buf[4];
  CFTypeRef v27;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v6 = -[KTAccountKeyServer copyCachedPCSIdentity](self, "copyCachedPCSIdentity");
  if (v6)
  {
    v7 = v6;
    v4[2](v4, v6, 0);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v25 = 0;
    v9 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v25);
    v10 = v25;
    if (v9)
    {
      cf = 0;
      v11 = PCSIdentitySetCopyCurrentIdentityPointer(v9, -[KTAccountKeyServer service](self, "service"), &cf);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v7 = v12;
      if (!v12 || cf)
      {
        if (qword_1002A7848 != -1)
          dispatch_once(&qword_1002A7848, &stru_100248770);
        v22 = qword_1002A7850;
        if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = cf;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to copy account key identity: %@", buf, 0xCu);
        }
        objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("KTAccountKeyFetch"), 0, cf);
        ((void (**)(id, id, CFTypeRef))v4)[2](v4, 0, cf);
        CFRelease(v9);
        v23 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v23);
        }
      }
      else
      {
        v13 = (void *)PCSIdentityCopyPublicKeyInfo(objc_msgSend(v12, "identity"));
        if (qword_1002A7848 != -1)
          dispatch_once(&qword_1002A7848, &stru_100248790);
        v14 = (void *)qword_1002A7850;
        if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Caching PCS identity: %@", buf, 0xCu);

        }
        -[KTAccountKeyServer cachePCSIdentity:](self, "cachePCSIdentity:", v7);
        v17 = CFAbsoluteTimeGetCurrent() - Current;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
        objc_msgSend(v18, "logMetric:withName:", v19, CFSTR("KTAccountKeyFetchTime"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
        objc_msgSend(v20, "logSuccessForEventNamed:", CFSTR("KTAccountKeyFetch"));

        if (qword_1002A7848 != -1)
          dispatch_once(&qword_1002A7848, &stru_1002487B0);
        v21 = qword_1002A7850;
        if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "copied current account key identity", buf, 2u);
        }
        v4[2](v4, v7, 0);
        CFRelease(v9);

      }
    }
    else
    {
      objc_msgSend(v5, "logResultForEvent:hardFailure:result:", CFSTR("KTAccountKeyFetch"), 1, v10);
      ((void (**)(id, id, id))v4)[2](v4, 0, v10);
      v7 = 0;
    }

  }
}

+ (id)publicKeyInfoFromIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  int v9;
  _PCSIdentityData *v10;

  v6 = (void *)PCSIdentityCopyPublicKeyInfo(a3);
  if (!v6)
  {
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_1002487D0);
    v7 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed to get PCS public key info from identity: %@", (uint8_t *)&v9, 0xCu);
    }
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -268, CFSTR("failed to get PCS public key info from identity")));
  }
  return v6;
}

+ (_PCSPublicIdentityData)decodePublicKeyInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _PCSPublicIdentityData *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v5 = a3;
  v6 = v5;
  v13 = 0;
  if (!v5)
  {
    v7 = 0;
    v8 = 1;
    goto LABEL_6;
  }
  v7 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateWithPublicKeyInfo(v5, &v13);
  v8 = v7 == 0;
  if (!v7 || v13)
  {
LABEL_6:
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_1002487F0);
    v10 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to create public key from data: %@", buf, 0xCu);
    }
    v9 = v13;
    if (v13)
    {
      if (v8)
        goto LABEL_12;
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -269, CFSTR("failed to create public key from data")));
      if (v8)
      {
LABEL_12:
        if (!a4)
          goto LABEL_18;
        goto LABEL_16;
      }
    }
    CFRelease(v7);
    if (!a4)
    {
LABEL_18:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
      objc_msgSend(v11, "logResultForEvent:hardFailure:result:", CFSTR("KTAccountKeyPublicDecode"), 1, v9);

      v7 = 0;
      goto LABEL_19;
    }
LABEL_16:
    if (v9)
      *a4 = objc_retainAutorelease(v9);
    goto LABEL_18;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  objc_msgSend(v9, "logSuccessForEventNamed:", CFSTR("KTAccountKeyPublicDecode"));
LABEL_19:

  return v7;
}

- (void)rollKey:(id)a3
{
  id v4;
  _PCSIdentitySetData *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint8_t buf[8];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _PCSIdentitySetData *v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14 = 0;
  v5 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v14);
  v6 = v14;
  v18 = v5;
  if (v16[3])
  {
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_100248810);
    v7 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "attempting to roll account key identity", buf, 2u);
    }
    v8 = v16[3];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001549C0;
    v10[3] = &unk_100248878;
    v11 = v4;
    v12 = &v15;
    -[KTAccountKeyServer createIdentityForSet:roll:completionBlock:](self, "createIdentityForSet:roll:completionBlock:", v8, 1, v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v9, "logResultForEvent:hardFailure:result:", CFSTR("KTAccountKeyRoll"), 1, v6);

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }
  _Block_object_dispose(&v15, 8);

}

- (BOOL)isAccountIdentity:(id)a3 error:(id *)a4
{
  id v6;
  _PCSIdentitySetData *v7;
  id v8;
  void *v9;
  _PCSPublicIdentityData *v10;
  id v11;
  uint64_t PublicID;
  const void *v13;
  BOOL v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  v21 = 0;
  v7 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v21);
  v8 = v21;
  v9 = v8;
  if (!v7)
  {
    v15 = 0;
    if (!a4 || !v8)
    {
      v11 = v8;
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  v20 = v8;
  v10 = +[KTAccountKeyServer decodePublicKeyInfo:error:](KTAccountKeyServer, "decodePublicKeyInfo:error:", v6, &v20);
  v11 = v20;

  if (!v10)
  {
    CFRelease(v7);
    v15 = 0;
    if (!a4 || !v11)
      goto LABEL_30;
    v8 = v11;
LABEL_28:
    v11 = objc_retainAutorelease(v8);
    v15 = 0;
    *a4 = v11;
    goto LABEL_30;
  }
  v19 = 0;
  PublicID = PCSPublicIdentityGetPublicID(v10);
  v13 = (const void *)PCSIdentitySetCopyIdentityWithError(v7, PublicID, &v19);
  if (v13)
    v14 = v19 == 0;
  else
    v14 = 0;
  v15 = v14;
  if (v14)
    goto LABEL_20;
  if (qword_1002A7848 != -1)
    dispatch_once(&qword_1002A7848, &stru_100248898);
  v16 = qword_1002A7850;
  if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to get identity for public identity: %@", buf, 0xCu);
  }
  v17 = v19;

  v11 = v17;
  if (!v17)
    v11 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -271, CFSTR("failed to find identity for public identity")));
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  if (v13)
LABEL_20:
    CFRelease(v13);
  CFRelease(v10);
  CFRelease(v7);
LABEL_30:

  return v15;
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100154FA0;
  v8[3] = &unk_100248920;
  v9 = a3;
  v10 = a4;
  v6 = v9;
  v7 = v10;
  -[KTAccountKeyServer getPCSIdentity:](self, "getPCSIdentity:", v8);

}

- (id)publicPublicKey:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100155580;
  v18 = sub_100155590;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100155580;
  v12 = sub_100155590;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100155598;
  v7[3] = &unk_100248948;
  v7[4] = &v8;
  v7[5] = &v14;
  -[KTAccountKeyServer getPCSIdentity:](self, "getPCSIdentity:", v7);
  if (a3)
  {
    v4 = (void *)v9[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

+ (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _PCSPublicIdentityData *v13;
  id v14;
  char v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v19 = -346;
LABEL_22:
    v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, v19, CFSTR("missing data or signature or accountKey")));
    if (qword_1002A7848 != -1)
      dispatch_once(&qword_1002A7848, &stru_100248968);
    v20 = qword_1002A7850;
    if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "PCS signature verify failed due to missing data or signature or accountKey", buf, 2u);
    }
    goto LABEL_26;
  }
  if (!v10)
  {
    v19 = -347;
    goto LABEL_22;
  }
  if (!v11)
  {
    v19 = -348;
    goto LABEL_22;
  }
  v23 = 0;
  v13 = +[KTAccountKeyServer decodePublicKeyInfo:error:](KTAccountKeyServer, "decodePublicKeyInfo:error:", v11, &v23);
  v14 = v23;
  if (v13)
  {
    v22 = 0;
    v15 = PCSValidateSignature(v13, v10, v9, &v22);
    if (v22)
      v16 = 0;
    else
      v16 = v15;
    if (!v16)
    {
      if (qword_1002A7848 != -1)
        dispatch_once(&qword_1002A7848, &stru_100248988);
      v17 = qword_1002A7850;
      if (os_log_type_enabled((os_log_t)qword_1002A7850, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to verify data: %@", buf, 0xCu);
      }
      v18 = v22;

      v14 = v18;
      if (!v18)
        v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -270, CFSTR("failed to verify data with account key")));
      if (a6 && v14)
      {
        v14 = objc_retainAutorelease(v14);
        *a6 = v14;
      }
    }
    CFRelease(v13);
    goto LABEL_29;
  }
LABEL_26:
  v16 = 0;
  if (a6 && v14)
  {
    v14 = objc_retainAutorelease(v14);
    v16 = 0;
    *a6 = v14;
  }
LABEL_29:

  return v16;
}

- (NSDate)_pcsIdentityCachedTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_pcsIdentityCachedTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PCSCurrentIdentity)_pcsIdentity
{
  return (PCSCurrentIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_pcsIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (os_unfair_lock_s)identityCacheLock
{
  return self->_identityCacheLock;
}

- (void)setIdentityCacheLock:(os_unfair_lock_s)a3
{
  self->_identityCacheLock = a3;
}

- (BOOL)outstandingCreationSignal
{
  return self->_outstandingCreationSignal;
}

- (void)setOutstandingCreationSignal:(BOOL)a3
{
  self->_outstandingCreationSignal = a3;
}

- (OS_dispatch_queue)creationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_group)creationGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCreationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationGroup, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
  objc_storeStrong((id *)&self->__pcsIdentity, 0);
  objc_storeStrong((id *)&self->__pcsIdentityCachedTime, 0);
}

@end

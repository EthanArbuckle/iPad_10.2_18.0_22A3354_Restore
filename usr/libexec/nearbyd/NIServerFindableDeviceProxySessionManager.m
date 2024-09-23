@implementation NIServerFindableDeviceProxySessionManager

+ (id)sharedInstance
{
  if (qword_100857EE8 != -1)
    dispatch_once(&qword_100857EE8, &stru_10080C9D8);
  return (id)qword_100857EE0;
}

- (void)notifyDeviceUnlockedSinceBoot
{
  NSObject *v3;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,notifyDeviceUnlockedSinceBoot", buf, 2u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0E44;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)_internalPrepareTokenCache
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  size_t v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  _BYTE v43[37];
  NSErrorUserInfoKey v44;
  const __CFString *v45;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (MKBDeviceUnlockedSinceBoot(v3) == 1)
  {
    if (self->_preparedTokenCache)
      return 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("FindingLocalDeviceLastUnlockUUID"));

    memset(v43, 0, sizeof(v43));
    v32 = 37;
    if (sysctlbyname("kern.bootsessionuuid", v43, &v32, 0, 0))
      v8 = 0;
    else
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v43));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForKey:", CFSTR("FindableDeviceProxyTokenCacheBootUUID")));

    if (v8)
    {
      if (v10)
        v11 = objc_msgSend(v10, "isEqualToString:", v8) ^ 1;
      else
        v11 = 1;
      v14 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,Prepare token cache (once per launch). First time after reboot: %d", buf, 8u);
      }
      if (!v11)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](NIServerKeychainManager, "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("FindingTokens"), 0, 0));

        *(_QWORD *)buf = 0;
        v34 = buf;
        v35 = 0x3032000000;
        v36 = sub_1001C154C;
        v37 = sub_1001C155C;
        v38 = 0;
        v28 = 0;
        v29 = &v28;
        v30 = 0x2020000000;
        v31 = 0;
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1001C1564;
        v23[3] = &unk_10080CA00;
        v23[4] = self;
        v23[5] = buf;
        v23[6] = &v28;
        v23[7] = &v24;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);
        if (*((_QWORD *)v34 + 5))
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
            sub_1003D7D08();
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Prepare token cache: error restoring from cache: %@"), *((_QWORD *)v34 + 5)));
          sub_1002B6BBC(v20, &self->_tokenEventLogBuffer.__map_.__first_);

          v18 = *((id *)v34 + 5);
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v21, "setObject:forKey:", v8, CFSTR("FindableDeviceProxyTokenCacheBootUUID"));

          self->_preparedTokenCache = 1;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Prepare token cache: restore success (%d groups, %d tokens)"), *((unsigned int *)v29 + 6), *((unsigned int *)v25 + 6)));
          sub_1002B6BBC(v22, &self->_tokenEventLogBuffer.__map_.__first_);

          v18 = 0;
        }
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_32;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](NIServerKeychainManager, "sharedInstance"));
      v16 = objc_msgSend(v15, "deleteAllItemsWithService:synchronizable:systemKeychain:", CFSTR("FindingTokens"), 0, 0);

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("FindableDeviceProxyTokenCacheBootUUID"));

        self->_preparedTokenCache = 1;
        sub_1002B6BBC(CFSTR("Prepare token cache: reset success"), &self->_tokenEventLogBuffer.__map_.__first_);
        v18 = 0;
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D7CDC();
      sub_1002B6BBC(CFSTR("Prepare token cache: reset failed"), &self->_tokenEventLogBuffer.__map_.__first_);
      v39 = NSLocalizedFailureReasonErrorKey;
      v40 = CFSTR("Prepare token cache: reset failed");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v12));
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D7CB0();
      sub_1002B6BBC(CFSTR("Prepare token cache: could not get current boot UUID"), &self->_tokenEventLogBuffer.__map_.__first_);
      v41 = NSLocalizedFailureReasonErrorKey;
      v42 = CFSTR("Prepare token cache: could not get current boot UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v12));
    }
    v18 = (id)v13;
LABEL_32:

LABEL_33:
    return v18;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003D7D70();
  sub_1002B6BBC(CFSTR("Prepare token cache: not ready"), &self->_tokenEventLogBuffer.__map_.__first_);
  v44 = NSLocalizedFailureReasonErrorKey;
  v45 = CFSTR("Prepare token cache: not ready");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v5));

  return v6;
}

- (id)_internalSetFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4 logInEventBuffer:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSMutableSet *v9;
  id v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSMutableDictionary *groupedFindableTokens;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  NSMutableSet *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  id v48;
  _QWORD v49[6];
  _QWORD v50[4];
  id v51;
  NSMutableSet *v52;
  _QWORD v53[4];
  id v54;
  NSMutableSet *v55;
  uint64_t v56;
  id *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  void *v65;

  v5 = a5;
  v8 = a3;
  v48 = a4;
  v45 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v56 = 0;
  v57 = (id *)&v56;
  v58 = 0x3032000000;
  v59 = sub_1001C154C;
  v60 = sub_1001C155C;
  v61 = 0;
  -[NIServerFindableDeviceProxySessionManager _activateProvidersLazy](self, "_activateProvidersLazy");
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v48));
  v46 = v5;
  v42 = objc_opt_new(NSMutableSet);
  v9 = objc_opt_new(NSMutableSet);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1001C1E0C;
  v53[3] = &unk_10080CA28;
  v10 = v44;
  v54 = v10;
  v11 = v42;
  v55 = v11;
  objc_msgSend(v43, "enumerateObjectsUsingBlock:", v53);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1001C1E6C;
  v50[3] = &unk_10080CA28;
  v47 = v43;
  v51 = v47;
  v12 = v9;
  v52 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v50);
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v15 = sub_1002B6FA8(v14, 10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138478083;
    v63 = v48;
    v64 = 2113;
    v65 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-proxy,_internalSetFindableDiscoveryTokens. Group: %{private}@. New tokens: %{private}@", buf, 0x16u);

  }
  v17 = (id)qword_10085F520;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "allObjects"));
    v19 = sub_1002B6FA8(v18, 10, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138477827;
    v63 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-proxy,Old tokens: %{private}@.", buf, 0xCu);

  }
  v21 = (id)qword_10085F520;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v12, "allObjects"));
    v23 = sub_1002B6FA8(v22, 10, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138477827;
    v63 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-proxy,Tokens added: %{private}@.", buf, 0xCu);

  }
  v25 = (id)qword_10085F520;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11, "allObjects"));
    v27 = sub_1002B6FA8(v26, 10, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138477827;
    v63 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-proxy,Tokens removed: %{private}@.", buf, 0xCu);

  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001C1ECC;
  v49[3] = &unk_10080CA50;
  v49[4] = self;
  v49[5] = &v56;
  -[NSMutableSet enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v49);
  v29 = objc_msgSend(v10, "count");
  groupedFindableTokens = self->_groupedFindableTokens;
  if (v29)
  {
    v31 = objc_msgSend(v10, "mutableCopy");
    -[NSMutableDictionary setObject:forKey:](groupedFindableTokens, "setObject:forKey:", v31, v48);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_groupedFindableTokens, "removeObjectForKey:", v48);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _setTokenCacheForGroup:](self, "_setTokenCacheForGroup:", v48));
  if (v32)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D7DFC();
    objc_storeStrong(v57 + 5, v32);
  }
  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens](self, "_enableInteractionWithPersistedTokens"));
    if (v33)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D7D9C();
      objc_storeStrong(v57 + 5, v33);
    }

  }
  if (-[NIServerFindableDeviceProxySessionManager _shouldHoldOSTransactionWhileFindable](self, "_shouldHoldOSTransactionWhileFindable"))
  {
    if (-[NSMutableDictionary count](self->_groupedFindableTokens, "count"))
      -[NIServerFindableDeviceProxySessionManager _activateAssertionsWhileFindable](self, "_activateAssertionsWhileFindable");
    else
      -[NIServerFindableDeviceProxySessionManager _deactivateAssertionsWhileFindable](self, "_deactivateAssertionsWhileFindable");
  }
  if (v46)
  {
    v34 = -[NSMutableSet count](v12, "count");
    if ((char *)-[NSMutableSet count](v11, "count") + (_QWORD)v34)
    {
      v35 = objc_msgSend(v10, "count");
      v36 = objc_msgSend(v47, "count");
      v37 = -[NSMutableSet count](v12, "count");
      v38 = -[NSMutableSet count](v11, "count");
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Set tokens. Group: %@. New: %d. Old: %d. Added: %d. Removed: %d. Error: %@"), v48, v35, v36, v37, v38, v57[5]));
      sub_1002B6BBC(v39, &self->_tokenEventLogBuffer.__map_.__first_);

    }
  }
  v40 = v57[5];

  _Block_object_dispose(&v56, 8);
  return v40;
}

- (id)setFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  __int128 v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&buf[4] = objc_msgSend(v6, "count");
    LOWORD(v19) = 2113;
    *(_QWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,setFindableDiscoveryTokens (%d tokens). Group: %{private}@", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v19 = buf;
  *((_QWORD *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001C154C;
  v21 = sub_1001C155C;
  v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C21EC;
  v14[3] = &unk_10080CA78;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v17 = buf;
  v10 = v7;
  v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, v14);
  v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)startBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  __int128 v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&buf[4] = objc_msgSend(v6, "count");
    LOWORD(v19) = 2113;
    *(_QWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,startBeingFindableWithDiscoveryTokens (%d tokens to add). Group: %{private}@", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v19 = buf;
  *((_QWORD *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001C154C;
  v21 = sub_1001C155C;
  v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C2440;
  v14[3] = &unk_10080CA78;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = buf;
  v10 = v6;
  v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, v14);
  v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)stopBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  __int128 v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&buf[4] = objc_msgSend(v6, "count");
    LOWORD(v19) = 2113;
    *(_QWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,stopBeingFindableWithDiscoveryTokens (%d tokens to remove). Group: %{private}@", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v19 = buf;
  *((_QWORD *)&v19 + 1) = 0x3032000000;
  v20 = sub_1001C154C;
  v21 = sub_1001C155C;
  v22 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C2734;
  v14[3] = &unk_10080CA78;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = buf;
  v10 = v6;
  v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, v14);
  v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)setLocalDeviceDebugParameters:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  id v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,setLocalDeviceDebugParameters", buf, 2u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C2960;
  v9[3] = &unk_1007FA518;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);

  return 0;
}

- (void)processClientDiscoveryEventForToken:(id)a3 sharedConfigurationData:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C2A38;
  block[3] = &unk_100809CB0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)processClientRemovePeerEventForToken:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C2DF8;
  block[3] = &unk_1007FA518;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)findableDiscoveryTokensForGroup:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,findableDiscoveryTokensForGroup: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = sub_1001C154C;
  v16 = sub_1001C155C;
  v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C30A0;
  block[3] = &unk_10080AC98;
  v11 = v4;
  p_buf = &buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (id)interactingFinderDiscoveryTokensForGroup:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  NSMutableArray *v17;

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,interactingFinderDiscoveryTokensForGroup: %{private}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = sub_1001C154C;
  v16 = sub_1001C155C;
  v17 = objc_opt_new(NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3290;
  block[3] = &unk_10080CAF0;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)addObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  NIServerFindableDeviceProxySessionManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C344C;
  block[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[4];
  id v8;
  NIServerFindableDeviceProxySessionManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C370C;
  block[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)printableState
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1001C154C;
  v10 = sub_1001C155C;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001C384C;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *groupedFindableTokens;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *peerTracking;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *keepAliveTimeoutsSeconds;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void **begin;
  unint64_t start;
  unint64_t v47;
  unint64_t v48;
  void **v49;
  __int128 v50;
  void **v51;
  uint64_t *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void **v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void **v62;
  __int128 v63;
  void **v64;
  uint64_t *v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void **v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  void **v75;
  __int128 v76;
  void **v77;
  uint64_t *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  id v82;
  void *__p[2];
  uint64_t v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  NSMutableArray *v94;

  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = sub_1001C154C;
  v93 = sub_1001C155C;
  v94 = objc_opt_new(NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)v90[5];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = sub_1002B6B04(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_1002B6B04(self->_initDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSDate timeIntervalSinceNow](self->_initDate, "timeIntervalSinceNow");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Now: %@. Init: %@. Runtime: %.0f s. Cache: %d. Observers: %d"), v7, v9, -v10, self->_preparedTokenCache, -[NSHashTable count](self->_observers, "count")));
  objc_msgSend(v4, "addObject:", v11);

  v12 = (void *)v90[5];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sensors: %d. Assertions: OST-interacting %d, PA-interacting %d, OST-findable %d."), self->_sensorsOn, self->_osTransactionWhileInteracting != 0, self->_powerAssertionWhileInteracting != 0, self->_osTransactionWhileFindable != 0));
  objc_msgSend(v12, "addObject:", v13);

  v14 = (void *)v90[5];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT available: %d. Ranging available: %d. Should interact: %d."), self->_bluetoothDiscoveryAvailable, self->_rangingAvailable, -[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")));
  objc_msgSend(v14, "addObject:", v15);

  v16 = (void *)v90[5];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Paired finder watches: %d. Should apply BT scan mitigation [r121951698]: %d."), self->_numPairedFinderWatches_r121951698, -[NIServerFindableDeviceProxySessionManager _shouldApplyBTScanMitigation_r121951698](self, "_shouldApplyBTScanMitigation_r121951698")));
  objc_msgSend(v16, "addObject:", v17);

  v18 = (void *)v90[5];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Findable tokens (%d groups)"), -[NSMutableDictionary count](self->_groupedFindableTokens, "count")));
  objc_msgSend(v18, "addObject:", v19);

  groupedFindableTokens = self->_groupedFindableTokens;
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_1001C4268;
  v88[3] = &unk_10080CB40;
  v88[4] = &v89;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupedFindableTokens, "enumerateKeysAndObjectsUsingBlock:", v88);
  v21 = (void *)v90[5];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider printableState](self->_discoveryProvider, "printableState"));
  objc_msgSend(v21, "addObjectsFromArray:", v22);

  v23 = (void *)v90[5];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider printableState](self->_rangingProvider, "printableState"));
  objc_msgSend(v23, "addObjectsFromArray:", v24);

  v25 = (void *)v90[5];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tracking state for %d peers"), -[NSMutableDictionary count](self->_peerTracking, "count")));
  objc_msgSend(v25, "addObject:", v26);

  peerTracking = self->_peerTracking;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1001C437C;
  v87[3] = &unk_10080CB68;
  v87[4] = &v89;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerTracking, "enumerateKeysAndObjectsUsingBlock:", v87);
  v28 = (void *)v90[5];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Algorithm containers for %d peers"), -[NSMutableDictionary count](self->_peerAlgorithmContainers, "count")));
  objc_msgSend(v28, "addObject:", v29);

  v30 = (void *)v90[5];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_peerAlgorithmContainers, "allKeys"));
  v32 = sub_1002B6FA8(v31, 10, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v30, "addObjectsFromArray:", v33);

  v34 = (void *)v90[5];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Keep-alives for %d peers"), -[NSMutableDictionary count](self->_keepAliveTimeoutsSeconds, "count")));
  objc_msgSend(v34, "addObject:", v35);

  keepAliveTimeoutsSeconds = self->_keepAliveTimeoutsSeconds;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_1001C4458;
  v86[3] = &unk_10080CB90;
  v86[4] = &v89;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keepAliveTimeoutsSeconds, "enumerateKeysAndObjectsUsingBlock:", v86);
  v37 = (void *)v90[5];
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Last discovery event: %@"), self->_lastDiscoveryEvent));
  objc_msgSend(v37, "addObject:", v38);

  v39 = (void *)v90[5];
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Last range measurement: %@"), self->_lastRangingMeasurement));
  objc_msgSend(v39, "addObject:", v40);

  v41 = (void *)v90[5];
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Last range poll: %@"), self->_lastRangingPoll));
  objc_msgSend(v41, "addObject:", v42);

  v43 = (void *)v90[5];
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Token events (max %d)"), self->_tokenEventLogBuffer.__size_.__value_));
  objc_msgSend(v43, "addObject:", v44);

  begin = self->_tokenEventLogBuffer.__map_.__begin_;
  if (self->_tokenEventLogBuffer.__map_.__end_ != begin)
  {
    start = self->_tokenEventLogBuffer.__start_;
    v47 = (unint64_t)begin[start / 0xAA] + 24 * (start % 0xAA);
    v48 = (unint64_t)begin[(self->_tokenEventLogBuffer.__size_.__value_ + start) / 0xAA]
        + 24 * ((self->_tokenEventLogBuffer.__size_.__value_ + start) % 0xAA);
    if (v47 != v48)
    {
      v49 = &begin[start / 0xAA];
      do
      {
        if (*(char *)(v47 + 23) < 0)
        {
          sub_100004678(__p, *(void **)v47, *(_QWORD *)(v47 + 8));
        }
        else
        {
          v50 = *(_OWORD *)v47;
          v85 = *(_QWORD *)(v47 + 16);
          *(_OWORD *)__p = v50;
        }
        if (SHIBYTE(v85) < 0)
        {
          if (!__p[1])
            goto LABEL_13;
          v52 = v90;
          v51 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v85))
            goto LABEL_14;
          v51 = __p;
          v52 = v90;
        }
        v53 = (void *)v52[5];
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    %s"), v51));
        objc_msgSend(v53, "addObject:", v54);

        if (SHIBYTE(v85) < 0)
LABEL_13:
          operator delete(__p[0]);
LABEL_14:
        v47 += 24;
        if (v47 - (_QWORD)*v49 == 4080)
        {
          v55 = (unint64_t)v49[1];
          ++v49;
          v47 = v55;
        }
      }
      while (v47 != v48);
    }
  }
  v56 = (void *)v90[5];
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session events (max %d)"), self->_sessionEventLogBuffer.__size_.__value_));
  objc_msgSend(v56, "addObject:", v57);

  v58 = self->_sessionEventLogBuffer.__map_.__begin_;
  if (self->_sessionEventLogBuffer.__map_.__end_ != v58)
  {
    v59 = self->_sessionEventLogBuffer.__start_;
    v60 = (unint64_t)v58[v59 / 0xAA] + 24 * (v59 % 0xAA);
    v61 = (unint64_t)v58[(self->_sessionEventLogBuffer.__size_.__value_ + v59) / 0xAA]
        + 24 * ((self->_sessionEventLogBuffer.__size_.__value_ + v59) % 0xAA);
    if (v60 != v61)
    {
      v62 = &v58[v59 / 0xAA];
      do
      {
        if (*(char *)(v60 + 23) < 0)
        {
          sub_100004678(__p, *(void **)v60, *(_QWORD *)(v60 + 8));
        }
        else
        {
          v63 = *(_OWORD *)v60;
          v85 = *(_QWORD *)(v60 + 16);
          *(_OWORD *)__p = v63;
        }
        if (SHIBYTE(v85) < 0)
        {
          if (!__p[1])
            goto LABEL_29;
          v65 = v90;
          v64 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v85))
            goto LABEL_30;
          v64 = __p;
          v65 = v90;
        }
        v66 = (void *)v65[5];
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    %s"), v64));
        objc_msgSend(v66, "addObject:", v67);

        if (SHIBYTE(v85) < 0)
LABEL_29:
          operator delete(__p[0]);
LABEL_30:
        v60 += 24;
        if (v60 - (_QWORD)*v62 == 4080)
        {
          v68 = (unint64_t)v62[1];
          ++v62;
          v60 = v68;
        }
      }
      while (v60 != v61);
    }
  }
  v69 = (void *)v90[5];
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Misc events (max %d)"), self->_miscEventLogBuffer.__size_.__value_));
  objc_msgSend(v69, "addObject:", v70);

  v71 = self->_miscEventLogBuffer.__map_.__begin_;
  if (self->_miscEventLogBuffer.__map_.__end_ != v71)
  {
    v72 = self->_miscEventLogBuffer.__start_;
    v73 = (unint64_t)v71[v72 / 0xAA] + 24 * (v72 % 0xAA);
    v74 = (unint64_t)v71[(self->_miscEventLogBuffer.__size_.__value_ + v72) / 0xAA]
        + 24 * ((self->_miscEventLogBuffer.__size_.__value_ + v72) % 0xAA);
    if (v73 != v74)
    {
      v75 = &v71[v72 / 0xAA];
      do
      {
        if (*(char *)(v73 + 23) < 0)
        {
          sub_100004678(__p, *(void **)v73, *(_QWORD *)(v73 + 8));
        }
        else
        {
          v76 = *(_OWORD *)v73;
          v85 = *(_QWORD *)(v73 + 16);
          *(_OWORD *)__p = v76;
        }
        if (SHIBYTE(v85) < 0)
        {
          if (!__p[1])
            goto LABEL_45;
          v78 = v90;
          v77 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v85))
            goto LABEL_46;
          v77 = __p;
          v78 = v90;
        }
        v79 = (void *)v78[5];
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    %s"), v77));
        objc_msgSend(v79, "addObject:", v80);

        if (SHIBYTE(v85) < 0)
LABEL_45:
          operator delete(__p[0]);
LABEL_46:
        v73 += 24;
        if (v73 - (_QWORD)*v75 == 4080)
        {
          v81 = (unint64_t)v75[1];
          ++v75;
          v73 = v81;
        }
      }
      while (v73 != v74);
    }
  }
  objc_autoreleasePoolPop(v3);
  v82 = (id)v90[5];
  _Block_object_dispose(&v89, 8);

  return v82;
}

- (id)_initInternal
{
  NSObject *v3;
  NIServerFindableDeviceProxySessionManager *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD block[4];
  NIServerFindableDeviceProxySessionManager *v12;
  objc_super v13;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,_initInternal", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerFindableDeviceProxySessionManager;
  v4 = -[NIServerFindableDeviceProxySessionManager init](&v13, "init");
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.nearbyd.finding.proxy-session", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C4634;
    block[3] = &unk_1007FB340;
    v12 = v4;
    dispatch_sync(v9, block);

  }
  return v4;
}

- (void)_activateSensors
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  CMMotionManager *v6;
  CMMotionManager *motionManager;
  CMAltimeter *v8;
  CMAltimeter *altimeterManager;
  CMPedometer *v10;
  CMPedometer *pedometerManager;
  CMMotionActivityManager *v12;
  CMMotionActivityManager *motionActivityManager;
  CMOdometryManager *v14;
  CMOdometryManager *pdrManager;
  CLLocationManager *v16;
  CLLocationManager *locationManager;
  CLLocationManager *v18;
  NSObject *v19;
  id v20;
  NIGnssExtensionsManager *v21;
  NIGnssExtensionsManager *gnssExtensionsManager;
  uint8_t v23[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sensorsOn)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,turning on sensors for findee algorithms.", buf, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NILocalDeviceActivatingSensors"), 0, 0, 1u);
    if (-[NIServerFindableDeviceProxySessionManager supportsCameraAssistance](self, "supportsCameraAssistance"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
      objc_msgSend(v5, "registerForVisionInput:", self);

    }
    v6 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    motionManager = self->_motionManager;
    self->_motionManager = v6;

    if (self->_motionManager)
    {
      -[NIServerFindableDeviceProxySessionManager _startDeviceMotionUpdates](self, "_startDeviceMotionUpdates");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7FF8();
    }
    v8 = (CMAltimeter *)objc_alloc_init((Class)CMAltimeter);
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = v8;

    if (self->_altimeterManager)
    {
      -[NIServerFindableDeviceProxySessionManager _startAltitudeUpdates](self, "_startAltitudeUpdates");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7FCC();
    }
    v10 = (CMPedometer *)objc_alloc_init((Class)CMPedometer);
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = v10;

    if (self->_pedometerManager)
    {
      -[NIServerFindableDeviceProxySessionManager _startPedometerDataUpdates](self, "_startPedometerDataUpdates");
      -[NIServerFindableDeviceProxySessionManager _startPedometerEventUpdates](self, "_startPedometerEventUpdates");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7FA0();
    }
    v12 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = v12;

    if (self->_motionActivityManager)
    {
      -[NIServerFindableDeviceProxySessionManager _startMotionActivityUpdates](self, "_startMotionActivityUpdates");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7F74();
    }
    v14 = (CMOdometryManager *)objc_alloc_init((Class)CMOdometryManager);
    pdrManager = self->_pdrManager;
    self->_pdrManager = v14;

    if (self->_pdrManager)
    {
      -[NIServerFindableDeviceProxySessionManager _startDevicePDRUpdates](self, "_startDevicePDRUpdates");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7F48();
    }
    v16 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework"), self, self->_queue);
    locationManager = self->_locationManager;
    self->_locationManager = v16;

    v18 = self->_locationManager;
    if (v18)
    {
      -[CLLocationManager setActivityType:](v18, "setActivityType:", 3);
      -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", kCLDistanceFilterNone);
      -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
      -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
      v19 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-proxy,startUpdatingLocation", v23, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    {
      sub_1003D7F1C();
    }
    v20 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework"));
    if (!self->_gnssExtensionsManager)
    {
      v21 = -[NIGnssExtensionsManager initWithQueue:bundle:reason:]([NIGnssExtensionsManager alloc], "initWithQueue:bundle:reason:", self->_queue, v20, CFSTR("NIServerFindableDeviceProxySessionManager"));
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v21;

      -[NIGnssExtensionsManager setDelegate:](self->_gnssExtensionsManager, "setDelegate:", self);
    }
    self->_sensorsOn = 1;

  }
}

- (void)_deactivateSensors
{
  NSObject *v3;
  CMAltimeter *altimeterManager;
  CMPedometer *pedometerManager;
  CMMotionActivityManager *motionActivityManager;
  CMMotionManager *motionManager;
  CMOdometryManager *pdrManager;
  CLLocationManager *locationManager;
  NIGnssExtensionsManager *gnssExtensionsManager;
  NIGnssExtensionsManager *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v14[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_sensorsOn)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,turning off sensors for findee algorithms.  ", v14, 2u);
    }
    -[CMAltimeter stopRelativeAltitudeUpdates](self->_altimeterManager, "stopRelativeAltitudeUpdates");
    altimeterManager = self->_altimeterManager;
    self->_altimeterManager = 0;

    -[CMPedometer stopPedometerUpdates](self->_pedometerManager, "stopPedometerUpdates");
    -[CMPedometer stopPedometerEventUpdates](self->_pedometerManager, "stopPedometerEventUpdates");
    pedometerManager = self->_pedometerManager;
    self->_pedometerManager = 0;

    -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
    motionActivityManager = self->_motionActivityManager;
    self->_motionActivityManager = 0;

    -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
    motionManager = self->_motionManager;
    self->_motionManager = 0;

    -[CMOdometryManager stopOdometryUpdates](self->_pdrManager, "stopOdometryUpdates");
    pdrManager = self->_pdrManager;
    self->_pdrManager = 0;

    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
    locationManager = self->_locationManager;
    self->_locationManager = 0;

    gnssExtensionsManager = self->_gnssExtensionsManager;
    if (gnssExtensionsManager)
    {
      -[NIGnssExtensionsManager invalidate](gnssExtensionsManager, "invalidate");
      v11 = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = 0;

    }
    if (-[NIServerFindableDeviceProxySessionManager supportsCameraAssistance](self, "supportsCameraAssistance"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerVisionDataDistributor sharedProvider](NIServerVisionDataDistributor, "sharedProvider"));
      objc_msgSend(v12, "unregisterForVisionInput:", self);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NILocalDeviceDeactivatingSensors"), 0, 0, 1u);
    self->_sensorsOn = 0;
  }
}

- (void)_activateAssertionsWhileFindable
{
  NSObject *v3;
  OS_os_transaction *v4;
  OS_os_transaction *osTransactionWhileFindable;
  uint8_t v6[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_osTransactionWhileFindable)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate OS transaction while findable", v6, 2u);
    }
    v4 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.finding.proxy-session.while-findable");
    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = v4;

    if (!self->_osTransactionWhileFindable && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D8024();
  }
}

- (void)_deactivateAssertionsWhileFindable
{
  NSObject *v3;
  OS_os_transaction *osTransactionWhileFindable;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_osTransactionWhileFindable)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate OS transaction (no longer findable)", v5, 2u);
    }
    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = 0;

  }
}

- (void)_activateAssertionsWhileInteracting
{
  NSObject *v3;
  OS_os_transaction *v4;
  OS_os_transaction *osTransactionWhileInteracting;
  unsigned int *p_powerAssertionWhileInteracting;
  unsigned int powerAssertionWhileInteracting;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_osTransactionWhileInteracting)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate OS transaction while interacting", buf, 2u);
    }
    v4 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.finding.proxy-session.while-interacting");
    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = v4;

    if (!self->_osTransactionWhileInteracting && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D80B4();
  }
  powerAssertionWhileInteracting = self->_powerAssertionWhileInteracting;
  p_powerAssertionWhileInteracting = &self->_powerAssertionWhileInteracting;
  if (!powerAssertionWhileInteracting)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,Activate power assertion while interacting", v17, 2u);
    }
    v9 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.nearbyd.finding.proxy-session.while-interacting"), p_powerAssertionWhileInteracting);
    if ((_DWORD)v9 || !*p_powerAssertionWhileInteracting)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D8050(v9, v10, v11, v12, v13, v14, v15, v16);
      *p_powerAssertionWhileInteracting = 0;
    }
  }
}

- (void)_deactivateAssertionsWhileInteracting
{
  NSObject *v3;
  OS_os_transaction *osTransactionWhileInteracting;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_osTransactionWhileInteracting)
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate OS transaction (no longer interacting)", buf, 2u);
    }
    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = 0;

  }
  if (self->_powerAssertionWhileInteracting)
  {
    v5 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,Deactivate power assertion while interacting", v15, 2u);
    }
    v6 = IOPMAssertionRelease(self->_powerAssertionWhileInteracting);
    self->_powerAssertionWhileInteracting = 0;
    if ((_DWORD)v6)
    {
      v7 = v6;
      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D80E0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_activateProvidersLazy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindingDiscoveryProvider activate](self->_discoveryProvider, "activate");
  -[NIServerFindingRangingProvider activate](self->_rangingProvider, "activate");
}

- (void)_updatePeerTrackingForToken:(id)a3 newDiscoveryState:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
  }

  objc_msgSend(v8, "setDiscoveryState:", v4);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:](self, "_updatePeerTrackingForToken:newTrackingState:", v9, v8);

}

- (void)_updatePeerTrackingForToken:(id)a3 newAdvertisingState:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
  }

  objc_msgSend(v8, "setAdvertisingState:", v4);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:](self, "_updatePeerTrackingForToken:newTrackingState:", v9, v8);

}

- (void)_updatePeerTrackingForToken:(id)a3 newRangingState:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
  }

  objc_msgSend(v8, "setRangingState:", v4);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:](self, "_updatePeerTrackingForToken:newTrackingState:", v9, v8);

}

- (void)_updateReceivedSignalFlags:(unsigned __int8)a3 toPeerTrackingForToken:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
  }

  objc_msgSend(v8, "setReceivedSignalFlags:", v4);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:](self, "_updatePeerTrackingForToken:newTrackingState:", v9, v8);

}

- (void)_updatePeerTrackingForToken:(id)a3 newNbUwbAcquisitionChannelIdx:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v10));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v10));
    v9 = objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
  }

  objc_msgSend(v9, "setNbUwbAcquisitionChannelIdx:", v6);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:](self, "_updatePeerTrackingForToken:newTrackingState:", v10, v9);

}

- (void)_updatePeerTrackingForToken:(id)a3 newTrackingState:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  NSMutableDictionary *peerTracking;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  deque<std::string, std::allocator<std::string>> *p_sessionEventLogBuffer;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  __CFNotificationCenter *v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t v55[4];
  id v56;
  __int128 buf;
  uint64_t v58;
  char v59;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  if (v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
    v11 = objc_msgSend(v10, "copy");

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NIServerFindingPeerTracking peerTrackingInitialState](NIServerFindingPeerTracking, "peerTrackingInitialState"));
    v11 = v10;
  }

  if (objc_msgSend(v11, "rangingState") == 3
    && (objc_msgSend(v8, "rangingState") == 1 || objc_msgSend(v8, "rangingState") == 2))
  {
    objc_msgSend(v8, "setRangingState:", objc_msgSend(v11, "rangingState"));
  }
  if (objc_msgSend(v11, "rangingState") == 2 && objc_msgSend(v8, "rangingState") == 1)
    objc_msgSend(v8, "setRangingState:", objc_msgSend(v11, "rangingState"));
  if (objc_msgSend(v11, "discoveryState") == 3
    && (objc_msgSend(v8, "discoveryState") == 1 || objc_msgSend(v8, "discoveryState") == 2))
  {
    objc_msgSend(v8, "setDiscoveryState:", objc_msgSend(v11, "discoveryState"));
  }
  if ((objc_msgSend(v11, "isDoingAnything") & 1) == 0
    && (objc_msgSend(v8, "isDoingAnything") & 1) == 0)
  {
    v12 = objc_msgSend(v11, "copy");

    v8 = v12;
  }
  if (objc_msgSend(v11, "discoveryState") == 1 && objc_msgSend(v8, "discoveryState") == 2
    || objc_msgSend(v11, "discoveryState") == 2 && objc_msgSend(v8, "discoveryState") == 1)
  {
    objc_msgSend(v8, "setDiscoveryState:", 3);
  }
  if (objc_msgSend(v8, "hasReceivedRangingData")
    && (objc_msgSend(v8, "receivedSignalFlags") & 1) != 0)
  {
    objc_msgSend(v8, "setTellClientAboutPeer:", 1);
  }
  if (!objc_msgSend(v8, "isDoingAnything")
    || (objc_msgSend(v8, "receivedSignalFlags") & 1) == 0)
  {
    objc_msgSend(v8, "setTellClientAboutPeer:", 0);
  }
  if ((objc_msgSend(v11, "isEqual:", v8) & 1) == 0)
  {
    v13 = objc_msgSend(v8, "isDoingAnything");
    peerTracking = self->_peerTracking;
    if (v13)
      -[NSMutableDictionary setObject:forKey:](peerTracking, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](peerTracking, "removeObjectForKey:", v6);
    if ((objc_msgSend(v11, "isDoingAnything") & 1) == 0
      && objc_msgSend(v8, "isDoingAnything"))
    {
      v15 = (id)qword_10085F520;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = sub_1002B69FC((uint64_t)"SessionStarted", 0, v6, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue(v16);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionInternal"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionStarted"), v18));
      sub_1002B6BBC(v19, &self->_sessionEventLogBuffer.__map_.__first_);

    }
    v20 = (id)qword_10085F520;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Change: %@ -> %@"), v11, v8));
      v22 = sub_1002B69FC((uint64_t)"StateChange", 0, v6, v21);
      v23 = (id)objc_claimAutoreleasedReturnValue(v22);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionInternal"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v24, v8));
    p_sessionEventLogBuffer = &self->_sessionEventLogBuffer;
    sub_1002B6BBC(v25, &self->_sessionEventLogBuffer.__map_.__first_);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v58 = 0x2020000000;
    v59 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v27 = self->_peerTracking;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1001C64BC;
    v50[3] = &unk_10080CBB8;
    v50[4] = &buf;
    v50[5] = &v51;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v50);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      -[NIServerFindableDeviceProxySessionManager _activateAssertionsWhileInteracting](self, "_activateAssertionsWhileInteracting");
    if (*((_BYTE *)v52 + 24))
      -[NIServerFindableDeviceProxySessionManager _activateSensors](self, "_activateSensors");
    else
      -[NIServerFindableDeviceProxySessionManager _deactivateSensors](self, "_deactivateSensors");
    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      -[NIServerFindableDeviceProxySessionManager _deactivateAssertionsWhileInteracting](self, "_deactivateAssertionsWhileInteracting");
    if ((objc_msgSend(v11, "isDoingAnything") & 1) == 0
      && objc_msgSend(v8, "isDoingAnything"))
    {
      -[NIServerFindableDeviceProxySessionManager _setUpAlgorithmsContainerForToken:](self, "_setUpAlgorithmsContainerForToken:", v6);
    }
    if (objc_msgSend(v11, "isDoingAnything")
      && (objc_msgSend(v8, "isDoingAnything") & 1) == 0)
    {
      -[NIServerFindableDeviceProxySessionManager _tearDownAlgorithmsContainerForToken:](self, "_tearDownAlgorithmsContainerForToken:", v6);
    }
    if ((objc_msgSend(v11, "hasReceivedRangingData") & 1) == 0
      && objc_msgSend(v8, "hasReceivedRangingData"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "updatesEngine"));
      objc_msgSend(v29, "acceptDiscoveryEventForPeer:", v6);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "analyticsManager"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[_FindableDeviceAlgorithmsContainer configurationForContainerObjects](_FindableDeviceAlgorithmsContainer, "configurationForContainerObjects"));
      objc_msgSend(v31, "sessionSuccessfullyRanWithConfig:withTimestamp:", v32, sub_10000883C());

    }
    if (objc_msgSend(v11, "isAttemptingToRange")
      && (objc_msgSend(v8, "isAttemptingToRange") & 1) == 0)
    {
      -[NIServerFindableDeviceProxySessionManager _tearDownAlgorithmsContainerForToken:](self, "_tearDownAlgorithmsContainerForToken:", v6);
      -[NIServerFindableDeviceProxySessionManager _setUpAlgorithmsContainerForToken:](self, "_setUpAlgorithmsContainerForToken:", v6);
    }
    if (objc_msgSend(v11, "discoveryState") || !objc_msgSend(v8, "discoveryState"))
      goto LABEL_66;
    if (objc_msgSend(v8, "discoveryState") == 2)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "analyticsManager"));
      objc_msgSend(v34, "updateWithAcquisitionReason:", 1);
    }
    else
    {
      if (objc_msgSend(v8, "discoveryState") != 1)
        goto LABEL_66;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "analyticsManager"));
      objc_msgSend(v34, "updateWithAcquisitionReason:", 3);
    }

LABEL_66:
    if ((objc_msgSend(v11, "tellClientAboutPeer") & 1) == 0
      && objc_msgSend(v8, "tellClientAboutPeer"))
    {
      v35 = (id)qword_10085F520;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sent: %@"), CFSTR("NILocalDeviceStartedInteractingWithTokenNotification")));
        v37 = sub_1002B69FC((uint64_t)"NotifiedClient", 0, v6, v36);
        v38 = (id)objc_claimAutoreleasedReturnValue(v37);
        *(_DWORD *)v55 = 138412290;
        v56 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);

      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("NILocalDeviceStartedInteractingWithTokenNotification"), 0, 0, 1u);
    }
    if (objc_msgSend(v11, "tellClientAboutPeer")
      && (objc_msgSend(v8, "tellClientAboutPeer") & 1) == 0)
    {
      v40 = (id)qword_10085F520;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Sent: %@"), CFSTR("NILocalDeviceStoppedInteractingWithTokenNotification")));
        v42 = sub_1002B69FC((uint64_t)"NotifiedClient", 0, v6, v41);
        v43 = (id)objc_claimAutoreleasedReturnValue(v42);
        *(_DWORD *)v55 = 138412290;
        v56 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);

      }
      v44 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v44, CFSTR("NILocalDeviceStoppedInteractingWithTokenNotification"), 0, 0, 1u);
    }
    if (objc_msgSend(v11, "isDoingAnything")
      && (objc_msgSend(v8, "isDoingAnything") & 1) == 0)
    {
      v45 = (id)qword_10085F520;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = sub_1002B69FC((uint64_t)"SessionStopped", 0, v6, 0);
        v47 = (id)objc_claimAutoreleasedReturnValue(v46);
        *(_DWORD *)v55 = 138412290;
        v56 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);

      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionInternal"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: SessionStopped"), v48));
      sub_1002B6BBC(v49, p_sessionEventLogBuffer);

    }
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&buf, 8);
  }

}

- (void)_advertiseAndRangeWithPeer:(id)a3 peerAdvertisement:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  NIServerFindingAdvertisement *v10;
  uint64_t v11;
  id v12;
  _DWORD *v13;
  void *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  int v19;
  unint64_t *v20;
  unint64_t v21;
  unsigned int v22;
  _BYTE *v23;
  int v24;
  NSObject *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  NSObject *v35;
  void *v36;
  id v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  id v52;
  _BOOL4 v53;
  _BOOL4 v54;
  unsigned int v55;
  void *v56;
  void *v57;
  _BYTE *v58;
  void *v59[3];
  void *v60;
  void *v61;
  _DWORD *v62;
  void *__p[3];
  __int16 v64;
  _BOOL4 v65;
  __int16 v66;
  int v67;

  v6 = a3;
  v7 = a4;
  v8 = -[NIServerFindableDeviceProxySessionManager _selectedTechnology](self, "_selectedTechnology");
  v9 = -[NIServerFindingRangingProvider canRangeWithPeer:technology:](self->_rangingProvider, "canRangeWithPeer:technology:", v6, v8);
  v55 = objc_msgSend(v7, "canRange");
  if (v7)
    objc_msgSend(v7, "supportedTechnologies");
  else
    memset(__p, 0, sizeof(__p));
  v54 = sub_1002B7410(__p, v8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v10 = [NIServerFindingAdvertisement alloc];
  v11 = (uint64_t)-[NIServerFindingDiscoveryProvider advertisingAddress](self->_discoveryProvider, "advertisingAddress");
  LODWORD(__p[0]) = v11;
  WORD2(__p[0]) = WORD2(v11);
  v12 = -[NIServerFindingAdvertisement initForFinder:address:](v10, "initForFinder:address:", 0, __p);
  objc_msgSend(v12, "setCanRange:", v9);
  objc_msgSend(v12, "setUseCase:", objc_msgSend(v7, "useCase"));
  v13 = operator new(4uLL);
  v60 = v13;
  *v13 = v8;
  v61 = v13 + 1;
  v62 = v13 + 1;
  objc_msgSend(v12, "setSupportedTechnologies:", &v60);
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  objc_msgSend(v12, "setProtocolVersion:", 1);
  v14 = sub_1002CA108();
  v15 = (void *)*((_QWORD *)v14 + 406);
  v16 = (std::__shared_weak_count *)*((_QWORD *)v14 + 407);
  __p[0] = v15;
  __p[1] = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  sub_1002A4D2C((uint64_t)v15);
  v19 = sub_10036C1C0((unsigned __int8 **)v59);
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }
  if (v16)
  {
    v20 = (unint64_t *)&v16->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v53 = v9;
  if (objc_msgSend(v7, "narrowBandMask"))
  {
    v22 = objc_msgSend(v7, "narrowBandMask");
  }
  else
  {
    v23 = operator new(1uLL);
    v56 = v23;
    *v23 = 1;
    v57 = v23 + 1;
    v58 = v23 + 1;
    v22 = sub_10036C1C0((unsigned __int8 **)&v56);
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
  }
  v24 = v22 & v19;
  objc_msgSend(v12, "setNarrowBandMask:", v22 & v19);
  v25 = (id)qword_10085F520;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v7, "narrowBandMask");
    LODWORD(__p[0]) = 67109632;
    HIDWORD(__p[0]) = v26;
    LOWORD(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 2) = v19;
    HIWORD(__p[1]) = 1024;
    LODWORD(__p[2]) = v22 & v19;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-proxy,Finder nb_mask %hu, findee nb_mask %hu, shared nb_mask %hu", (uint8_t *)__p, 0x14u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nbUwbAcquisitionChannelIdx"));
  v29 = v28 == 0;

  if (v29)
  {
    v52 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("FindingNapChannel")));

    if (v31 && (v33 = objc_opt_class(NSNumber, v32), (objc_opt_isKindOfClass(v31, v33) & 1) != 0))
    {
      v34 = objc_msgSend(v31, "intValue");
      v35 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p[0]) = 67109120;
        HIDWORD(__p[0]) = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#find-proxy,Using NAP channel %d from defaults writes", (uint8_t *)__p, 8u);
      }
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "getIRK"));
      if (!v36)
        __assert_rtn("_pickRandomNbUwbAcquisitionChannelInGivenRange", "NIServerFindableDeviceProxySessionManager.mm", 2549, "IRK != nil");
      v37 = objc_retainAutorelease(v36);
      v38 = SipHash(objc_msgSend(v37, "bytes"), &unk_1004702A8, 8);

      v34 = v38 % 7 + 5;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v34));
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:](self, "_updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:", v52, v39);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "nbUwbAcquisitionChannelIdx"));
  if (!v41)
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager _advertiseAndRangeWithPeer:peerAdvertisement:]", "NIServerFindableDeviceProxySessionManager.mm", 1435, "[_peerTracking objectForKey:token].nbUwbAcquisitionChannelIdx != nil");

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "nbUwbAcquisitionChannelIdx"));
  objc_msgSend(v12, "setNbUwbAcquisitionChannelIdx:", v43);

  v44 = sub_1002B6778(CFSTR("FindingBTAdvertisingTimeoutSecondsOverride"), 120.0);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:](self, "_updatePeerTrackingForToken:newAdvertisingState:", v6, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:](self->_discoveryProvider, "startAdvertisingToPeer:advertisement:timeout:", v6, v12, v44));
  if (v45 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003D81A4();
  if (v24)
    v46 = v54;
  else
    v46 = 0;
  if ((v53 & v55) == 1 && v46)
  {
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:](self, "_updatePeerTrackingForToken:newRangingState:", v6, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "nbUwbAcquisitionChannelIdx"));
    LOBYTE(__p[0]) = objc_msgSend(v48, "intValue");
    BYTE1(__p[0]) = v24;

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:](self->_rangingProvider, "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:", v6, v8, v7, __p));
    if (v49)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D8144();
      -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:](self, "_updatePeerTrackingForToken:newRangingState:", v6, 4);
    }

  }
  else
  {
    v50 = (id)qword_10085F520;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = sub_1002B73E4(v8);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v51;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v53;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v55;
      v64 = 1024;
      v65 = v54;
      v66 = 1024;
      v67 = v24;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#find-proxy,Not attempting to range (selectedTech: %s). localDeviceCanRange: %d. peerDeviceCanRange: %d. peerDeviceSupportsTech: %d. sharedNBMask: %d", (uint8_t *)__p, 0x24u);
    }

  }
}

- (int)_selectedTechnology
{
  NIServerFindingRangingProvider *rangingProvider;
  int v3;
  void *__p;
  void *v6;
  uint64_t v7;

  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  }
  else
  {
    __p = 0;
    v6 = 0;
    v7 = 0;
  }
  if (sub_1002B7410(&__p, 1))
  {
    v3 = 1;
  }
  else if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild") && sub_1002B7410(&__p, 2))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  if (__p)
  {
    v6 = __p;
    operator delete(__p);
  }
  return v3;
}

- (id)_setTokenCacheForGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NIServerKeychainItem *v7;
  void *v8;
  void *v9;
  NIServerKeychainItem *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSErrorUserInfoKey v17;
  const __CFString *v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v4));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = [NIServerKeychainItem alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken serialize:](NIDiscoveryToken, "serialize:", v8));
    v10 = -[NIServerKeychainItem initWithService:account:data:](v7, "initWithService:account:data:", CFSTR("FindingTokens"), v4, v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](NIServerKeychainManager, "sharedInstance"));
    LOBYTE(v7) = objc_msgSend(v11, "writeItem:synchronizable:systemKeychain:", v10, 0, 0);

    if ((v7 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v17 = NSLocalizedFailureReasonErrorKey;
      v18 = CFSTR("Tokens not fully cached");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v15));

    }
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](NIServerKeychainManager, "sharedInstance"));
  v14 = objc_msgSend(v13, "deleteItemWithService:account:synchronizable:systemKeychain:", CFSTR("FindingTokens"), v4, 0, 0);

  if ((v14 & 1) == 0)
  {
    v19 = NSLocalizedFailureReasonErrorKey;
    v20 = CFSTR("Tokens not fully deleted");
    v10 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v10));
LABEL_8:

    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)_tokensFromAllGroups
{
  NSMutableSet *v3;
  NSMutableDictionary *groupedFindableTokens;
  NSMutableSet *v5;
  _QWORD v7[4];
  NSMutableSet *v8;

  v3 = objc_opt_new(NSMutableSet);
  groupedFindableTokens = self->_groupedFindableTokens;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C71D4;
  v7[3] = &unk_10080CBE0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupedFindableTokens, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (BOOL)_isTokenFindable:(id)a3
{
  id v4;
  NSMutableDictionary *groupedFindableTokens;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  groupedFindableTokens = self->_groupedFindableTokens;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C72AC;
  v8[3] = &unk_10080CC08;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](groupedFindableTokens, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(groupedFindableTokens) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)groupedFindableTokens;
}

- (BOOL)_shouldHoldOSTransactionWhileFindable
{
  BOOL v2;
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = 1;
  v3 = sub_1002B66E4(1);
  if (v3 != 19)
  {
    if (v3 != 26)
      sub_1003D8204();
    return 0;
  }
  return v2;
}

- (void)_setUpAlgorithmsContainerForToken:(id)a3
{
  void *v4;
  NSMutableDictionary *peerAlgorithmContainers;
  _FindableDeviceAlgorithmsContainer *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v7));

  if (!v4)
  {
    peerAlgorithmContainers = self->_peerAlgorithmContainers;
    v6 = -[_FindableDeviceAlgorithmsContainer initWithToken:queue:delegate:]([_FindableDeviceAlgorithmsContainer alloc], "initWithToken:queue:delegate:", v7, self->_queue, self);
    -[NSMutableDictionary setObject:forKey:](peerAlgorithmContainers, "setObject:forKey:", v6, v7);

  }
}

- (void)_tearDownAlgorithmsContainerForToken:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v7));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v7));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatesEngine"));
    objc_msgSend(v6, "invalidate");

    -[NSMutableDictionary removeObjectForKey:](self->_peerAlgorithmContainers, "removeObjectForKey:", v7);
  }

}

- (void)_nanoRegistryDevicePairingChanged_r121951698:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C7524;
  v7[3] = &unk_1007FA518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

+ (int)_queryNumPairedFinderWatches_r121951698
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", &stru_10080CC48));

  LODWORD(v2) = objc_msgSend(v3, "count");
  return (int)v2;
}

- (BOOL)_shouldApplyBTScanMitigation_r121951698
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  int numPairedFinderWatches_r121951698;
  int v20;
  _BYTE v21[10];
  void *v22;
  int v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("r121951698_DisableMitigation"));

  if (v4)
  {
    v5 = qword_10085F520;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: mitigation disabled via defaults write", (uint8_t *)&v20, 2u);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("r121951698_TokenGroupOverride")));

    if (v8)
    {
      v10 = objc_opt_class(NSString, v9);
      v11 = CFSTR("com.apple.findmy.findmylocated");
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
      {
        v12 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412546;
          *(_QWORD *)v21 = CFSTR("com.apple.findmy.findmylocated");
          *(_WORD *)&v21[8] = 2112;
          v22 = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: override token group %@ to defaults write %@", (uint8_t *)&v20, 0x16u);
        }
        v11 = v8;
      }
    }
    else
    {
      v11 = CFSTR("com.apple.findmy.findmylocated");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _tokensFromAllGroups](self, "_tokensFromAllGroups"));
    v14 = objc_msgSend(v13, "count");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v11));
    v16 = objc_msgSend(v15, "count");

    v6 = 0;
    if (v14 == (id)1 && v16 == (id)1)
      v6 = self->_numPairedFinderWatches_r121951698 == 0;
    v17 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      numPairedFinderWatches_r121951698 = self->_numPairedFinderWatches_r121951698;
      v20 = 67109888;
      *(_DWORD *)v21 = v6;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (_DWORD)v14;
      LOWORD(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 2) = (_DWORD)v16;
      HIWORD(v22) = 1024;
      v23 = numPairedFinderWatches_r121951698;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-proxy,rdar://121951698: should apply BT scan mitigation: %d. Total tokens: %d. Tokens from group: %d. Paired finder watches: %d", (uint8_t *)&v20, 0x1Au);
    }

  }
  return v6;
}

- (void)_kickKeepAliveForPeer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  double v12;
  dispatch_time_t v13;
  id v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keepAliveTimeoutsSeconds, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keepAliveTimeoutTimers, "objectForKey:", v4));
    v7 = v6;
    if (v6)
    {
      dispatch_source_cancel(v6);
      -[NSMutableDictionary removeObjectForKey:](self->_keepAliveTimeoutTimers, "removeObjectForKey:", v4);
    }
    else
    {
      v8 = (id)qword_10085F520;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = sub_1002B69FC((uint64_t)"KeepAlive", 0, v4, CFSTR("Started"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

      }
    }
    v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);

    objc_msgSend(v5, "doubleValue");
    v13 = dispatch_time(0, (unint64_t)(v12 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1001C7D78;
    v18 = &unk_1007FA330;
    objc_copyWeak(&v20, (id *)buf);
    v14 = v4;
    v19 = v14;
    dispatch_source_set_event_handler(v11, &v15);
    dispatch_resume(v11);
    -[NSMutableDictionary setObject:forKey:](self->_keepAliveTimeoutTimers, "setObject:forKey:", v11, v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_configureKeepAliveTimeoutForPeer:(id)a3 useCase:(int)a4 isKeepAliveBluetooth:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;

  v5 = a5;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sub_1002B6834(a4, v5);
  if (v9 > 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keepAliveTimeoutsSeconds, "objectForKeyedSubscript:", v8));

    if (!v10)
    {
      v14 = (id)qword_10085F520;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure. BT: %d. Timeout: %0.1f s"), v5, *(_QWORD *)&v9));
        v21 = sub_1002B69FC((uint64_t)"KeepAlive", 0, v8, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

      }
      goto LABEL_9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keepAliveTimeoutsSeconds, "objectForKeyedSubscript:", v8));
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (v9 < v13)
    {
      v14 = (id)qword_10085F520;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_keepAliveTimeoutsSeconds, "objectForKeyedSubscript:", v8));
        objc_msgSend(v15, "doubleValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reconfigure. BT: %d. Timeout: %0.1f s -> %0.1f s"), v5, v16, *(_QWORD *)&v9));
        v18 = sub_1002B69FC((uint64_t)"KeepAlive", 0, v8, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

      }
LABEL_9:

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keepAliveTimeoutsSeconds, "setObject:forKeyedSubscript:", v23, v8);

    }
  }

}

- (BOOL)_shouldInteract
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_rangingAvailable;
}

- (id)_enableInteractionWithPersistedTokens
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  NSObject *v8;
  char *v9;
  uint8_t *v10;
  _QWORD v12[5];
  uint8_t buf[8];
  char v14;
  uint8_t v15[4];
  uint8_t *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Enable interaction with persisted tokens", buf, 2u);
  }
  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _tokensFromAllGroups](self, "_tokensFromAllGroups"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:](self->_discoveryProvider, "setPeersEligibleForDiscovery:requestScan:", v4, -[NIServerFindableDeviceProxySessionManager _shouldApplyBTScanMitigation_r121951698](self, "_shouldApplyBTScanMitigation_r121951698") ^ 1));
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003D82EC();
      v6 = v5;
    }
    v7 = -[NIServerFindingRangingProvider rangingTriggerType](self->_rangingProvider, "rangingTriggerType");
    v8 = (id)qword_10085F520;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v7 ? "TriggerRequired" : "NoTriggerRequired";
      sub_10000BF04(buf, v9);
      v10 = v14 >= 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v15 = 136315138;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,ranging trigger type = %s", v15, 0xCu);
      if (v14 < 0)
        operator delete(*(void **)buf);
    }

    if (!v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1001C8518;
      v12[3] = &unk_10080CC70;
      v12[4] = self;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D834C();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, 0));
  }
  return v5;
}

- (void)_disableInteractionAndKeepPersistedTokens
{
  NSObject *v3;
  void *v4;
  _QWORD v5[6];
  uint8_t buf[8];
  uint8_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,Disable all interaction. Keep persisted tokens.", buf, 2u);
  }
  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D8378();
  }
  else
  {
    *(_QWORD *)buf = 0;
    v7 = buf;
    v8 = 0x3032000000;
    v9 = sub_1001C154C;
    v10 = sub_1001C155C;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:](self->_discoveryProvider, "setPeersEligibleForDiscovery:requestScan:", 0, 0));
    if (*((_QWORD *)v7 + 5) && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003D83A4();
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _tokensFromAllGroups](self, "_tokensFromAllGroups"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001C8920;
    v5[3] = &unk_10080CC98;
    v5[4] = self;
    v5[5] = buf;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

    _Block_object_dispose(buf, 8);
  }
}

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *lastDiscoveryEvent;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (id)qword_10085F520;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT: %d. PeerAdv: %@"), v5, v9));
    v12 = sub_1002B69FC((uint64_t)"DiscoveredPeer", 0, v8, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v15 = sub_1002B6B04(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "descriptionInternal"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Peer: %@. BT: %d. Adv: %@"), v16, v17, v5, v9));
  lastDiscoveryEvent = self->_lastDiscoveryEvent;
  self->_lastDiscoveryEvent = v18;

  if (v5)
    v20 = 2;
  else
    v20 = 1;
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newDiscoveryState:](self, "_updatePeerTrackingForToken:newDiscoveryState:", v8, v20);
  -[NIServerFindableDeviceProxySessionManager _advertiseAndRangeWithPeer:peerAdvertisement:](self, "_advertiseAndRangeWithPeer:peerAdvertisement:", v8, v9);
  -[NIServerFindableDeviceProxySessionManager _configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:](self, "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:", v8, objc_msgSend(v9, "useCase"), v5);
  -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v8);

}

- (void)didLosePeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"LostPeer", 0, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v9, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:](self->_discoveryProvider, "stopAdvertisingToPeer:", v4));
  if (v8 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
    sub_1003D828C();
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:](self, "_updatePeerTrackingForToken:newAdvertisingState:", v4, 2);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newDiscoveryState:](self, "_updatePeerTrackingForToken:newDiscoveryState:", v4, 4);

}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"NotifyStopAdv", 0, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:](self, "_updatePeerTrackingForToken:newAdvertisingState:", v4, 2);

}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSHashTable *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;

  v17 = a3;
  v18 = a4;
  v6 = (id)qword_10085F520;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SelfAdv: %@"), v17));
    v8 = sub_1002B69FC((uint64_t)"GeneratedAdv", 0, v18, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "byteRepresentation"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_observers;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14);
        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14), "getQueueForInputingData"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001C920C;
          block[3] = &unk_100809CB0;
          block[4] = v15;
          v20 = v10;
          v21 = v18;
          dispatch_async(v16, block);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (void)bluetoothDiscoveryFinishedActivating
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = sub_1002B69FC((uint64_t)"DiscActivated", 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v6, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Previous: %d"), self->_bluetoothDiscoveryAvailable));
    v5 = sub_1002B69FC((uint64_t)"DiscUnavailable", 0, 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT available: %d"), 0));
    sub_1002B6BBC(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (!-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
      -[NIServerFindableDeviceProxySessionManager _disableInteractionAndKeepPersistedTokens](self, "_disableInteractionAndKeepPersistedTokens");
  }
}

- (void)bluetoothDiscoveryBecameAvailable
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Previous: %d"), self->_bluetoothDiscoveryAvailable));
    v5 = sub_1002B69FC((uint64_t)"DiscAvailable", 0, 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BT available: %d"), 1));
    sub_1002B6BBC(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
      v8 = -[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens](self, "_enableInteractionWithPersistedTokens");
  }
}

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *lastRangingMeasurement;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  int v19;

  v6 = a3;
  if (*((_DWORD *)a4 + 8) != 1)
  {
    v18 = "solution.type == rose::RoseSolutionType::RoseRawOnly";
    v19 = 1992;
    goto LABEL_12;
  }
  if (!*((_BYTE *)a4 + 600))
  {
    v18 = "solution.raw_rose_measurement.has_value()";
    v19 = 1993;
LABEL_12:
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager didRangeWithPeer:newSolution:]", "NIServerFindableDeviceProxySessionManager.mm", v19, v18);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v8 = sub_1002B6B04(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionInternal"));
    v11 = (void *)v10;
    if (!*((_BYTE *)a4 + 600))
      sub_10000BA44();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Peer: %@. Range: %0.2f m"), v9, v10, *((_QWORD *)a4 + 44)));
    lastRangingMeasurement = self->_lastRangingMeasurement;
    self->_lastRangingMeasurement = v12;

    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:](self, "_updatePeerTrackingForToken:newRangingState:", v6, 3);
    if (!*((_BYTE *)a4 + 600))
      sub_10000BA44();
    -[NIServerFindableDeviceProxySessionManager _nearbydLogRange:token:](self, "_nearbydLogRange:token:", v6, *((double *)a4 + 44));
    v14 = *((_QWORD *)a4 + 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
    objc_msgSend(v15, "setCurrentSolutionMacAddress:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updatesEngine"));
    objc_msgSend(v17, "acceptRoseSolution:", a4);

    -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v6);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D84CC();
  }

}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *lastRangingPoll;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];

  v6 = a3;
  if (!*((_BYTE *)a4 + 600))
    __assert_rtn("-[NIServerFindableDeviceProxySessionManager didAttemptRangingWithPeer:unsuccessfulSolution:]", "NIServerFindableDeviceProxySessionManager.mm", 2019, "solution.raw_rose_measurement.has_value()");
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v7 = (id)qword_10085F520;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_1002B69FC((uint64_t)"RangeFailure", 0, v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      sub_1003D8524(v9, (uint64_t)v20, v7);
    }

    if (*((_BYTE *)a4 + 600) && *((_WORD *)a4 + 72) == 96)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v11 = sub_1002B6B04(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptionInternal"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Peer: %@"), v12, v13));
      lastRangingPoll = self->_lastRangingPoll;
      self->_lastRangingPoll = v14;

      -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:](self, "_updatePeerTrackingForToken:newRangingState:", v6, 2);
      -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v6);
    }
    v16 = *((_QWORD *)a4 + 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
    objc_msgSend(v17, "setCurrentSolutionMacAddress:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v6));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "updatesEngine"));
    objc_msgSend(v19, "acceptUnsuccessfulRoseSolution:", a4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D84F8();
  }

}

- (void)_nearbydLogRange:(double)a3 token:(id)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v13;

  v6 = a4;
  v7 = sub_10000883C();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Range: %0.2f m"), *(_QWORD *)&a3));
  v9 = sub_1002B69FC((uint64_t)"RangeSuccess", 0, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = qword_10085F520;
  if (v7 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003D8570();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
    }
    self->_lastLogMachContTime = v7;
  }

}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"NotifyStopRange", 0, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _handleRangingTerminatedCallbackForPeer:](self, "_handleRangingTerminatedCallbackForPeer:", v4);

}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sub_1002B69FC((uint64_t)"NotifyAuthFail", 0, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _handleRangingTerminatedCallbackForPeer:](self, "_handleRangingTerminatedCallbackForPeer:", v4);

}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:](self->_discoveryProvider, "stopAdvertisingToPeer:", v4));
    if (v5 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D828C();
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:](self, "_updatePeerTrackingForToken:newAdvertisingState:", v4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider stopRangingWithPeer:](self->_rangingProvider, "stopRangingWithPeer:", v4));
    if (v6 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D822C();
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:](self, "_updatePeerTrackingForToken:newRangingState:", v4, 4);

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D85D4();
  }

}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (*((_BYTE *)a5 + 7))
    -[NIServerFindableDeviceProxySessionManager _updateReceivedSignalFlags:toPeerTrackingForToken:](self, "_updateReceivedSignalFlags:toPeerTrackingForToken:", *((unsigned __int8 *)a5 + 6), v10);
  v7 = *((unsigned __int8 *)a5 + 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_peerAlgorithmContainers, "objectForKeyedSubscript:", v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatesEngine"));
  objc_msgSend(v9, "acceptPeerDeviceType:", v7 != 0);

}

- (void)rangingBecameUnavailable
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Previous: %d"), self->_rangingAvailable));
    v5 = sub_1002B69FC((uint64_t)"RangeUnavailable", 0, 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_rangingAvailable)
  {
    self->_rangingAvailable = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ranging available: %d"), 0));
    sub_1002B6BBC(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (!-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
      -[NIServerFindableDeviceProxySessionManager _disableInteractionAndKeepPersistedTokens](self, "_disableInteractionAndKeepPersistedTokens");
  }
}

- (void)rangingBecameAvailable
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Previous: %d"), self->_rangingAvailable));
    v5 = sub_1002B69FC((uint64_t)"RangeAvailable", 0, 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_rangingAvailable)
  {
    self->_rangingAvailable = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ranging available: %d"), 1));
    sub_1002B6BBC(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
      v8 = -[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens](self, "_enableInteractionWithPersistedTokens");
  }
}

- (void)_startAltitudeUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001CA418;
  v7 = &unk_10080CCE0;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:](self->_altimeterManager, "startRelativeAltitudeUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startPedometerDataUpdates
{
  void ***v3;
  CMPedometer *pedometerManager;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1001CA6E4;
  v9 = &unk_10080CD28;
  objc_copyWeak(&v10, &location);
  v3 = objc_retainBlock(&v6);
  pedometerManager = self->_pedometerManager;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v6, v7, v8, v9));
  -[CMPedometer startPedometerUpdatesFromDate:withHandler:](pedometerManager, "startPedometerUpdatesFromDate:withHandler:", v5, v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startPedometerEventUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001CAB14;
  v7 = &unk_10080CD70;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMPedometer startPedometerEventUpdatesWithHandler:](self->_pedometerManager, "startPedometerEventUpdatesWithHandler:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startMotionActivityUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001CADFC;
  v7 = &unk_10080CDB8;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](self->_motionActivityManager, "startActivityUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDevicePDRUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001CB0B8;
  v7 = &unk_10080CE00;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMOdometryManager setOdometryUpdateInterval:](self->_pdrManager, "setOdometryUpdateInterval:", 0.1, v4, v5, v6, v7);
  -[CMOdometryManager startOdometryUpdatesToQueue:withHandler:](self->_pdrManager, "startOdometryUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_startDeviceMotionUpdates
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1001CB76C;
  v7 = &unk_10080CE48;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", 0.01, v4, v5, v6, v7);
  -[CMMotionManager startDeviceMotionUpdatesToQueue:withHandler:](self->_motionManager, "startDeviceMotionUpdatesToQueue:withHandler:", self->_deviceOperationQueue, v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7;

  v7 = a5;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003D8980();
  -[NIServerFindingRangingProvider setAlgorithmAidingData:forPeer:](self->_rangingProvider, "setAlgorithmAidingData:forPeer:", a4, v7);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  NSMutableDictionary *peerAlgorithmContainers;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[15];
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint8_t buf[16];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,didUpdateLocations", buf, 2u);
  }
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "coordinate");
      v36 = v9;
      objc_msgSend(v8, "coordinate");
      v35 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timestamp"));
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v34 = v12;
      objc_msgSend(v8, "course");
      v14 = v13;
      objc_msgSend(v8, "courseAccuracy");
      v16 = v15;
      objc_msgSend(v8, "speed");
      v18 = v17;
      objc_msgSend(v8, "speedAccuracy");
      v20 = v19;
      objc_msgSend(v8, "horizontalAccuracy");
      v22 = v21;
      objc_msgSend(v8, "verticalAccuracy");
      v24 = v23;
      objc_msgSend(v8, "altitude");
      v26 = v25;
      objc_msgSend(v8, "ellipsoidalAltitude");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "floor"));
      v30 = objc_msgSend(v29, "level");
      v31 = objc_msgSend(v8, "type");
      v32 = objc_msgSend(v8, "signalEnvironmentType");

      peerAlgorithmContainers = self->_peerAlgorithmContainers;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1001CBDB4;
      v37[3] = &unk_10080CE68;
      v37[4] = v36;
      v37[5] = v35;
      v37[6] = v34;
      v37[7] = v14;
      v37[8] = v16;
      v37[9] = v18;
      v37[10] = v20;
      v37[11] = v22;
      v37[12] = v24;
      v37[13] = v26;
      v37[14] = v28;
      v38 = v30;
      v39 = v31;
      v40 = v32;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerAlgorithmContainers, "enumerateKeysAndObjectsUsingBlock:", v37);
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003D89D8();
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003D89AC();
  }

}

- (void)DataCallback:(id)a3
{
  id v4;
  NSMutableDictionary *peerAlgorithmContainers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CBEA0;
  v7[3] = &unk_10080CE90;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerAlgorithmContainers, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = objc_msgSend(v5, "code");
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003D8A64();
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003D8A04();
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    }
  }
  else
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-proxy,location is unknown", v8, 2u);
    }
  }

}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](NIPlatformInfo, "supportsSyntheticAperture");
}

- (void)processVisionInput:(id)a3
{
  id v4;
  NSMutableDictionary *peerAlgorithmContainers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001CC0E4;
  v7[3] = &unk_10080CE90;
  v6 = v4;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerAlgorithmContainers, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (id)getQueueForInputingData
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRangingPoll, 0);
  objc_storeStrong((id *)&self->_lastRangingMeasurement, 0);
  objc_storeStrong((id *)&self->_lastDiscoveryEvent, 0);
  sub_1001CCC90(&self->_miscEventLogBuffer.__map_.__first_);
  sub_1001CCC90(&self->_sessionEventLogBuffer.__map_.__first_);
  sub_1001CCC90(&self->_tokenEventLogBuffer.__map_.__first_);
  objc_storeStrong((id *)&self->_gnssExtensionsManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_pdrManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_altimeterManager, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_osTransactionWhileInteracting, 0);
  objc_storeStrong((id *)&self->_osTransactionWhileFindable, 0);
  objc_storeStrong((id *)&self->_keepAliveTimeoutsSeconds, 0);
  objc_storeStrong((id *)&self->_keepAliveTimeoutTimers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_peerAlgorithmContainers, 0);
  objc_storeStrong((id *)&self->_peerTracking, 0);
  objc_storeStrong((id *)&self->_groupedFindableTokens, 0);
  objc_storeStrong((id *)&self->_rangingProvider, 0);
  objc_storeStrong((id *)&self->_discoveryProvider, 0);
  objc_storeStrong((id *)&self->_initDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  sub_10028D4BC(&self->_machTimeConverter, a2);
  *(_OWORD *)&self->_miscEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_miscEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_miscEventLogBuffer.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__map_.__first_ = 0u;
  *(_OWORD *)&self->_sessionEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__map_.__end_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__start_ = 0u;
  *(_OWORD *)&self->_tokenEventLogBuffer.__map_.__first_ = 0u;
  return self;
}

@end

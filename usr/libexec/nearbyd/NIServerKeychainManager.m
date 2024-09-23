@implementation NIServerKeychainManager

+ (id)sharedInstance
{
  if (qword_10085B4E8 != -1)
    dispatch_once(&qword_10085B4E8, &stru_100811DB0);
  return (id)qword_10085B4E0;
}

- (BOOL)writeItem:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002926A0;
  v13[3] = &unk_100811DD8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v17 = a5;
  v15 = &v18;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)readItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100292C94;
  v27 = sub_100292CA4;
  v28 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100292CAC;
  block[3] = &unk_100811E00;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = &v23;
  v21 = a5;
  v22 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)readAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  NSMutableArray *v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100292C94;
  v22 = sub_100292CA4;
  v23 = objc_opt_new(NSMutableArray);
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100292E04;
  v13[3] = &unk_100811DD8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v17 = a5;
  v15 = &v18;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)deleteItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10;
  id v11;
  OS_dispatch_queue *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = a3;
  v11 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100293368;
  block[3] = &unk_100811E50;
  block[4] = self;
  v17 = v10;
  v20 = a5;
  v21 = a6;
  v18 = v11;
  v19 = &v22;
  v13 = v11;
  v14 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)queue;
}

- (BOOL)deleteAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8;
  OS_dispatch_queue *queue;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100293698;
  v13[3] = &unk_100811DD8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v17 = a5;
  v15 = &v18;
  v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)_initInternal
{
  NSObject *v3;
  NIServerKeychainManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;
  uint8_t buf[16];

  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    v3 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,_initInternal", buf, 2u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerKeychainManager;
  v4 = -[NIServerKeychainManager init](&v8, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.nearbyd.km", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

  }
  return v4;
}

- (id)_internalReadItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v14;
  __CFDictionary *v15;
  CFBooleanRef v16;
  CFBooleanRef v17;
  OSStatus v18;
  CFTypeID TypeID;
  CFTypeID v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NIServerKeychainItem *v24;
  CFTypeRef result;
  uint8_t buf[4];
  _BYTE v28[18];
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478595;
      *(_QWORD *)v28 = v10;
      *(_WORD *)&v28[8] = 2113;
      *(_QWORD *)&v28[10] = v11;
      v29 = 1024;
      v30 = v7;
      v31 = 1024;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,Read: %{private}@, %{private}@, %d, %d", buf, 0x22u);
    }
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = (__CFDictionary *)CFAutorelease(Mutable);
  v15 = v14;
  result = 0;
  if (v6)
    v16 = kCFBooleanTrue;
  else
    v16 = kCFBooleanFalse;
  CFDictionaryAddValue(v14, kSecUseSystemKeychain, v16);
  CFDictionaryAddValue(v15, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(v15, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecAttrAccount, v11);
  CFDictionaryAddValue(v15, kSecAttrService, v10);
  CFDictionaryAddValue(v15, kSecAttrAccessGroup, CFSTR("com.apple.nearbyd"));
  if (v7)
    v17 = kCFBooleanTrue;
  else
    v17 = kCFBooleanFalse;
  CFDictionaryAddValue(v15, kSecAttrSynchronizable, v17);
  CFDictionaryAddValue(v15, kSecReturnData, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecReturnAttributes, kCFBooleanTrue);
  v18 = SecItemCopyMatching(v15, &result);
  if (result)
  {
    TypeID = CFDictionaryGetTypeID();
    v20 = CFGetTypeID(result);
    v21 = (void *)result;
    if (TypeID != v20)
    {
      v21 = 0;
      CFRelease(result);
    }
  }
  else
  {
    v21 = 0;
  }
  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      *(_DWORD *)v28 = v18;
      *(_WORD *)&v28[4] = 2113;
      *(_QWORD *)&v28[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,Read status: %{private}d. Result: %{private}@", buf, 0x12u);
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kSecValueData));
  if (v23)
    v24 = -[NIServerKeychainItem initWithService:account:data:]([NIServerKeychainItem alloc], "initWithService:account:data:", v10, v11, v23);
  else
    v24 = 0;

  return v24;
}

- (void)_unitTest1
{
  NSObject *v3;
  NSObject *v4;
  NIServerKeychainItem *v5;
  NIServerKeychainItem *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NIServerKeychainItem *v15;
  void *v16;
  NIServerKeychainItem *v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  NIServerKeychainItem *v35;
  void *v36;
  NIServerKeychainItem *v37;
  unsigned int v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  unint64_t v45;
  uint64_t v46;
  unsigned int v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  unsigned int v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  const char *v59;
  NSObject *v60;
  unsigned int v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  NIServerKeychainItem *v67;
  unsigned int v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  const char *v74;
  NSObject *v75;
  char v76;
  uint8_t buf[4];
  NIServerKeychainItem *v78;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", buf, 2u);
  }

  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 1", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v76 = 0;
    v5 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0));
    v6 = v5;
    if (v5)
      v7 = -[NIServerKeychainItem isEqual:](v5, "isEqual:", 0);
    else
      v7 = 1;
    v8 = (id)qword_10085F520;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v9 = (id)qword_10085F520;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v12 = (id)qword_10085F520;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "FAILED";
      if (v7)
        v13 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    ++v76;
    v15 = [NIServerKeychainItem alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v76, 1));
    v17 = -[NIServerKeychainItem initWithService:account:data:](v15, "initWithService:account:data:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), v16);

    v18 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:", v17, 0, 0);
    v19 = (id)qword_10085F520;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v20 = (id)qword_10085F520;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 2;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    v21 = (id)qword_10085F520;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    v22 = (id)qword_10085F520;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "FAILED";
      if (v18)
        v23 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v24 = (id)qword_10085F520;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v25 = (unint64_t)-[NIServerKeychainItem copy](v17, "copy");
    v26 = objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0));

    if (v26 | v25)
      v27 = objc_msgSend((id)v26, "isEqual:", v25);
    else
      v27 = 1;
    v28 = (id)qword_10085F520;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v29 = (id)qword_10085F520;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v30 = (id)qword_10085F520;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v31 = (id)qword_10085F520;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v25;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v32 = (id)qword_10085F520;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "FAILED";
      if (v27)
        v33 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v34 = (id)qword_10085F520;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    ++v76;
    v35 = [NIServerKeychainItem alloc];
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v76, 1));
    v37 = -[NIServerKeychainItem initWithService:account:data:](v35, "initWithService:account:data:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), v36);

    v38 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:", v37, 0, 0);
    v39 = (id)qword_10085F520;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v40 = (id)qword_10085F520;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    v41 = (id)qword_10085F520;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v37;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    v42 = (id)qword_10085F520;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = "FAILED";
      if (v38)
        v43 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v44 = (id)qword_10085F520;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v45 = (unint64_t)-[NIServerKeychainItem copy](v37, "copy");
    v46 = objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0));

    if (v46 | v45)
      v47 = objc_msgSend((id)v46, "isEqual:", v45);
    else
      v47 = 1;
    v48 = (id)qword_10085F520;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v49 = (id)qword_10085F520;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 5;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v50 = (id)qword_10085F520;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v46;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v51 = (id)qword_10085F520;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v45;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v52 = (id)qword_10085F520;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "FAILED";
      if (v47)
        v53 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v54 = (id)qword_10085F520;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v55 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:](self, "deleteItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0);
    v56 = (id)qword_10085F520;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v57 = (id)qword_10085F520;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 6;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v58 = (id)qword_10085F520;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = "FAILED";
      if (v55)
        v59 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v60 = (id)qword_10085F520;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v61 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:](self, "deleteItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0);
    v62 = (id)qword_10085F520;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v63 = (id)qword_10085F520;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 7;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v64 = (id)qword_10085F520;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = "FAILED";
      if (v61)
        v65 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v66 = (id)qword_10085F520;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v67 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction1"), CFSTR("UnitTest1"), 0, 0));
    if (v67)
      v68 = -[NIServerKeychainItem isEqual:](v67, "isEqual:", 0);
    else
      v68 = 1;
    v69 = (id)qword_10085F520;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v70 = (id)qword_10085F520;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 8;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v71 = (id)qword_10085F520;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v67;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v72 = (id)qword_10085F520;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v73 = (id)qword_10085F520;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = "FAILED";
      if (v68)
        v74 = "PASSED";
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v75 = (id)qword_10085F520;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

  }
}

- (void)_unitTest2
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NIServerKeychainItem *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  char v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  uint64_t v47;
  NIServerKeychainItem *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  id v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  NSMutableSet *v91;
  NIServerKeychainItem *v92;
  _QWORD v93[4];
  NSMutableSet *v94;
  uint8_t *v95;
  _QWORD v96[4];
  NSMutableSet *v97;
  uint8_t *v98;
  _QWORD v99[4];
  NSMutableSet *v100;
  uint8_t *v101;
  _QWORD v102[4];
  NSMutableSet *v103;
  uint8_t *v104;
  _QWORD v105[4];
  NSMutableSet *v106;
  uint8_t *v107;
  uint64_t v108;
  uint8_t buf[8];
  uint8_t *v110;
  uint64_t v111;
  char v112;
  uint8_t v113[4];
  void *v114;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", buf, 2u);
  }

  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 2", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    *(_QWORD *)buf = 0;
    v110 = buf;
    v111 = 0x2020000000;
    v112 = 0;
    v108 = 0;
    v91 = objc_opt_new(NSMutableSet);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:](self, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0));
    v6 = objc_msgSend(v5, "count");
    v7 = -[NSMutableSet count](v91, "count");
    v110[24] = v6 == v7;
    if (v6 == v7)
    {
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_100296370;
      v105[3] = &unk_100811E78;
      v106 = v91;
      v107 = buf;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v105);

    }
    v8 = (id)qword_10085F520;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v9 = (id)qword_10085F520;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v12 = (id)qword_10085F520;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24])
        v13 = "PASSED";
      else
        v13 = "FAILED";
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 1;
    do
    {
      ++v108;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UnitTest2-%d"), v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v108, 8));
      v92 = -[NIServerKeychainItem initWithService:account:data:]([NIServerKeychainItem alloc], "initWithService:account:data:", CFSTR("UnitTestFunction2"), v19, v20);

      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:"))
      {
        v69 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E5608((uint64_t)v92, v69, v70, v71, v72, v73, v74, v75);
        goto LABEL_108;
      }
      -[NSMutableSet addObject:](v91, "addObject:");
      v18 = (v18 + 1);
      v15 = v92;
      v16 = v19;
      v17 = v20;
    }
    while ((_DWORD)v18 != 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:](self, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0));

    v22 = objc_msgSend(v21, "count");
    v23 = -[NSMutableSet count](v91, "count");
    v110[24] = v22 == v23;
    if (v22 == v23)
    {
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_1002963B4;
      v102[3] = &unk_100811E78;
      v103 = v91;
      v104 = buf;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v102);

    }
    v24 = (id)qword_10085F520;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v25 = (id)qword_10085F520;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 2;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v26 = (id)qword_10085F520;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v27 = (id)qword_10085F520;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v28 = (id)qword_10085F520;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24])
        v29 = "PASSED";
      else
        v29 = "FAILED";
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v30 = (id)qword_10085F520;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v31 = 1;
    do
    {
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v91, "allObjects"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "service"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "account"));
      v37 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:](self, "deleteItemWithService:account:synchronizable:systemKeychain:", v35, v36, 0, 0);

      if ((v37 & 1) == 0)
      {
        v76 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E566C((uint64_t)v34, v76, v77, v78, v79, v80, v81, v82);

        goto LABEL_107;
      }
      -[NSMutableSet removeObject:](v91, "removeObject:", v34);

      v31 = 0;
    }
    while ((v32 & 1) != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:](self, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0));

    v38 = objc_msgSend(v5, "count");
    v39 = -[NSMutableSet count](v91, "count");
    v110[24] = v38 == v39;
    if (v38 == v39)
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_1002963F8;
      v99[3] = &unk_100811E78;
      v100 = v91;
      v101 = buf;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v99);

    }
    v40 = (id)qword_10085F520;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v41 = (id)qword_10085F520;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 3;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v42 = (id)qword_10085F520;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v5;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v43 = (id)qword_10085F520;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v44 = (id)qword_10085F520;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24])
        v45 = "PASSED";
      else
        v45 = "FAILED";
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v46 = (id)qword_10085F520;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v47 = 8;
    v48 = v92;
    v49 = v19;
    v50 = v20;
    do
    {
      ++v108;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UnitTest2-%d"), v47));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v108, 8));
      v92 = -[NIServerKeychainItem initWithService:account:data:]([NIServerKeychainItem alloc], "initWithService:account:data:", CFSTR("UnitTestFunction2"), v19, v20);

      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:"))
      {
        v83 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E5608((uint64_t)v92, v83, v84, v85, v86, v87, v88, v89);
        goto LABEL_108;
      }
      -[NSMutableSet addObject:](v91, "addObject:");
      v47 = (v47 + 1);
      v48 = v92;
      v49 = v19;
      v50 = v20;
    }
    while ((_DWORD)v47 != 108);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:](self, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0));

    v51 = objc_msgSend(v21, "count");
    v52 = -[NSMutableSet count](v91, "count");
    v110[24] = v51 == v52;
    if (v51 == v52)
    {
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10029643C;
      v96[3] = &unk_100811E78;
      v97 = v91;
      v98 = buf;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v96);

    }
    v53 = (id)qword_10085F520;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v54 = (id)qword_10085F520;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 4;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v55 = (id)qword_10085F520;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v21;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v56 = (id)qword_10085F520;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v57 = (id)qword_10085F520;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24])
        v58 = "PASSED";
      else
        v58 = "FAILED";
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v59 = (id)qword_10085F520;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    if (-[NIServerKeychainManager deleteAllItemsWithService:synchronizable:systemKeychain:](self, "deleteAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0))
    {
      -[NSMutableSet removeAllObjects](v91, "removeAllObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:](self, "readAllItemsWithService:synchronizable:systemKeychain:", CFSTR("UnitTestFunction2"), 0, 0));

      v60 = objc_msgSend(v5, "count");
      v61 = -[NSMutableSet count](v91, "count");
      v110[24] = v60 == v61;
      if (v60 == v61)
      {
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_100296480;
        v93[3] = &unk_100811E78;
        v94 = v91;
        v95 = buf;
        objc_msgSend(v5, "enumerateObjectsUsingBlock:", v93);

      }
      v62 = (id)qword_10085F520;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
      }

      v63 = (id)qword_10085F520;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 67109120;
        LODWORD(v114) = 5;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
      }

      v64 = (id)qword_10085F520;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = v5;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
      }

      v65 = (id)qword_10085F520;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = v91;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
      }

      v66 = (id)qword_10085F520;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        if (v110[24])
          v67 = "PASSED";
        else
          v67 = "FAILED";
        *(_DWORD *)v113 = 136315138;
        v114 = (void *)v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
      }

      v68 = (id)qword_10085F520;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
      }

      goto LABEL_108;
    }
    v90 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E55C8(v90);
LABEL_107:
    v5 = v21;
LABEL_108:

    _Block_object_dispose(buf, 8);
  }
}

- (void)_unitTest3
{
  NSObject *v3;
  NSObject *v4;
  NIServerKeychainItem *v5;
  NIServerKeychainItem *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NIServerKeychainItem *v15;
  uint64_t v16;
  void *v17;
  NIServerKeychainItem *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  NIServerKeychainItem *v36;
  uint64_t v37;
  void *v38;
  NIServerKeychainItem *v39;
  unsigned int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  unint64_t v47;
  uint64_t v48;
  unsigned int v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  unsigned int v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  NSObject *v62;
  NIServerKeychainItem *v63;
  unsigned int v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  const char *v70;
  NSObject *v71;
  int v72;
  NIServerKeychainItem *v73;

  v3 = (id)qword_10085F520;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v72) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", (uint8_t *)&v72, 2u);
  }

  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v72) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 3", (uint8_t *)&v72, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v5 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), 0, 0));
    v6 = v5;
    if (v5)
      v7 = -[NIServerKeychainItem isEqual:](v5, "isEqual:", 0);
    else
      v7 = 1;
    v8 = (id)qword_10085F520;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v9 = (id)qword_10085F520;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v72, 8u);
    }

    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v72, 0xCu);
    }

    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v72, 0xCu);
    }

    v12 = (id)qword_10085F520;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "FAILED";
      if (v7)
        v13 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v14 = (id)qword_10085F520;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v15 = [NIServerKeychainItem alloc];
    v16 = NSRandomData(800, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = -[NIServerKeychainItem initWithService:account:data:](v15, "initWithService:account:data:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), v17);

    v19 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:", v18, 0, 0);
    v20 = (id)qword_10085F520;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v21 = (id)qword_10085F520;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 2;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: WRITE", (uint8_t *)&v72, 8u);
    }

    v22 = (id)qword_10085F520;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", (uint8_t *)&v72, 0xCu);
    }

    v23 = (id)qword_10085F520;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = "FAILED";
      if (v19)
        v24 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v25 = (id)qword_10085F520;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v26 = (unint64_t)-[NIServerKeychainItem copy](v18, "copy");
    v27 = objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), 0, 0));

    if (v27 | v26)
      v28 = objc_msgSend((id)v27, "isEqual:", v26);
    else
      v28 = 1;
    v29 = (id)qword_10085F520;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v30 = (id)qword_10085F520;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 3;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v72, 8u);
    }

    v31 = (id)qword_10085F520;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = (NIServerKeychainItem *)v27;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v72, 0xCu);
    }

    v32 = (id)qword_10085F520;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = (NIServerKeychainItem *)v26;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v72, 0xCu);
    }

    v33 = (id)qword_10085F520;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = "FAILED";
      if (v28)
        v34 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v35 = (id)qword_10085F520;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v36 = [NIServerKeychainItem alloc];
    v37 = NSRandomData(1680, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = -[NIServerKeychainItem initWithService:account:data:](v36, "initWithService:account:data:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), v38);

    v40 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:", v39, 0, 0);
    v41 = (id)qword_10085F520;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v42 = (id)qword_10085F520;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 4;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: WRITE", (uint8_t *)&v72, 8u);
    }

    v43 = (id)qword_10085F520;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = v39;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", (uint8_t *)&v72, 0xCu);
    }

    v44 = (id)qword_10085F520;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = "FAILED";
      if (v40)
        v45 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v46 = (id)qword_10085F520;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v47 = (unint64_t)-[NIServerKeychainItem copy](v39, "copy");
    v48 = objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), 0, 0));

    if (v48 | v47)
      v49 = objc_msgSend((id)v48, "isEqual:", v47);
    else
      v49 = 1;
    v50 = (id)qword_10085F520;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v51 = (id)qword_10085F520;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 5;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v72, 8u);
    }

    v52 = (id)qword_10085F520;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = (NIServerKeychainItem *)v48;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v72, 0xCu);
    }

    v53 = (id)qword_10085F520;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = (NIServerKeychainItem *)v47;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v72, 0xCu);
    }

    v54 = (id)qword_10085F520;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = "FAILED";
      if (v49)
        v55 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v56 = (id)qword_10085F520;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v57 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:](self, "deleteItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), 0, 0);
    v58 = (id)qword_10085F520;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v59 = (id)qword_10085F520;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 6;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: DELETE", (uint8_t *)&v72, 8u);
    }

    v60 = (id)qword_10085F520;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = "FAILED";
      if (v57)
        v61 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v62 = (id)qword_10085F520;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v63 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue(-[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:](self, "readItemWithService:account:synchronizable:systemKeychain:", CFSTR("UnitTestFunction3"), CFSTR("UnitTest3"), 0, 0));
    if (v63)
      v64 = -[NIServerKeychainItem isEqual:](v63, "isEqual:", 0);
    else
      v64 = 1;
    v65 = (id)qword_10085F520;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

    v66 = (id)qword_10085F520;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 67109120;
      LODWORD(v73) = 7;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v72, 8u);
    }

    v67 = (id)qword_10085F520;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = v63;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v72, 0xCu);
    }

    v68 = (id)qword_10085F520;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v72 = 138412290;
      v73 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v72, 0xCu);
    }

    v69 = (id)qword_10085F520;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = "FAILED";
      if (v64)
        v70 = "PASSED";
      v72 = 136315138;
      v73 = (NIServerKeychainItem *)v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v72, 0xCu);
    }

    v71 = (id)qword_10085F520;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v72, 2u);
    }

  }
}

- (BOOL)_shouldLog
{
  void *v2;
  unsigned __int8 v3;

  if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("KMOutputLogs"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

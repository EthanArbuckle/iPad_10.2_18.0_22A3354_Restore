@implementation SESKeychainWrapper

+ (id)sharedInstance
{
  if (qword_10034BAD0 != -1)
    dispatch_once(&qword_10034BAD0, &stru_100303050);
  return (id)qword_10034BAC8;
}

+ (void)setInterposedWrapper:(id)a3
{
  id v3;
  SESKeychainWrapper *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = +[SESKeychainWrapper sharedInstance](SESKeychainWrapper, "sharedInstance");
  if (v6)
    v4 = (SESKeychainWrapper *)v6;
  else
    v4 = objc_opt_new(SESKeychainWrapper);
  v5 = (void *)qword_10034BAC8;
  qword_10034BAC8 = (uint64_t)v4;

}

- (SESKeychainWrapper)init
{
  SESKeychainWrapper *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *lastRetrievedViewInformation;
  OS_dispatch_queue *v11;
  _QWORD v13[4];
  SESKeychainWrapper *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SESKeychainWrapper;
  v2 = -[SESKeychainWrapper init](&v15, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, (dispatch_qos_class_t)0x16u, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.seserviced.keychainwrapper", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    lastRetrievedViewInformation = v2->_lastRetrievedViewInformation;
    v2->_lastRetrievedViewInformation = v9;

    v11 = v2->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000DD90;
    v13[3] = &unk_100302AC8;
    v14 = v2;
    os_state_add_handler(v11, v13);

  }
  return v2;
}

- (void)canSyncSEKeys:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DE14;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)getSEPeerIdentityInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  block[2] = sub_10000E140;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)addLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E4CC;
  v15[3] = &unk_100302B80;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)removeLocalSEPeerIdentity:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E65C;
  v15[3] = &unk_100302B80;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)fetchCachedContentForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E7B0;
  block[3] = &unk_1003031B0;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

}

- (void)modifyTLKSharesForView:(id)a3 altDSID:(id)a4 addingShares:(id)a5 removingShares:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000EC68;
  v20[3] = &unk_100303260;
  v21 = v12;
  v22 = v13;
  v23 = v11;
  v24 = v14;
  v16 = v11;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  dispatch_async(queue, v20);

}

- (void)proposeTLKForView:(id)a3 record:(id)a4 selfShare:(id)a5 altDSID:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  queue = self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000EED8;
  v20[3] = &unk_100303260;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v14;
  dispatch_async(queue, v20);

}

- (void)syncContentsForSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F13C;
  v12[3] = &unk_1003032B0;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, v12);

}

- (void)deleteSEView:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v7 = a3;
  v8 = a5;
  v10 = SESDefaultLogObject(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Deleting SE view %@", buf, 0xCu);
  }

  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F474;
  v15[3] = &unk_1003032B0;
  v16 = v7;
  v17 = v8;
  v13 = v7;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)proposeRolledTLKForView:(id)a3 oldTLKRecord:(id)a4 newTLKRecord:(id)a5 newTLKSelfShare:(id)a6 altDSID:(id)a7 completion:(id)a8
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;

  v9 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F708;
  block[3] = &unk_100303300;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, block);

}

- (int)addItem:(id)a3
{
  const __CFDictionary *v3;
  OSStatus v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  const __CFDictionary *v10;

  v3 = (const __CFDictionary *)a3;
  v4 = SecItemAdd(v3, 0);
  v5 = SESDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109378;
    v8[1] = v4;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SecItemAdd %d - %@", (uint8_t *)v8, 0x12u);
  }

  return v4;
}

- (int)deleteItem:(id)a3
{
  return SecItemDelete((CFDictionaryRef)a3);
}

- (BOOL)copyItemData:(id)a3 outData:(id *)a4 updateToApplePayView:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;
  OSStatus v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFDictionary *v28;
  uint64_t v29;
  NSObject *v30;
  CFTypeRef result;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  OSStatus v36;
  CFStringRef v37;
  uint64_t v38;

  v7 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  result = 0;
  v11 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
  v13 = SESDefaultLogObject(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v34 = v11;
    *(_WORD *)&v34[4] = 2112;
    *(_QWORD *)&v34[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "SecItemCopyMatching %d : %@", buf, 0x12u);
  }

  if ((_DWORD)v11 != -25300)
  {
    if ((_DWORD)v11 || (v18 = (void *)result) == 0)
    {
      if (!a6)
      {
        v17 = 0;
        goto LABEL_22;
      }
      v25 = SESDefaultLogObject(v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v26 = SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Failed to query %d"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v17 = 0;
    }
    else
    {
      if (v7)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
        v20 = kSecAttrViewHintApplePay;
        v21 = objc_msgSend(v19, "isEqualToString:", kSecAttrViewHintApplePay);
        v23 = (int)v21;
        if ((v21 & 1) != 0)
        {
          v24 = 0;
        }
        else
        {
          v37 = kSecAttrSyncViewHint;
          v38 = v20;
          v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
          v24 = SecItemUpdate((CFDictionaryRef)v9, v28);

        }
        v29 = SESDefaultLogObject(v21, v22);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v34 = result;
          *(_WORD *)&v34[8] = 1024;
          *(_DWORD *)&v34[10] = v23 ^ 1;
          v35 = 1024;
          v36 = v24;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Item %@ upgrade needed %d status %d", buf, 0x18u);
        }

      }
      if (!a4)
      {
        v17 = 1;
        goto LABEL_21;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", kSecValueData));
      v17 = 1;
      a6 = a4;
    }
    *a6 = v27;
LABEL_21:

    goto LABEL_22;
  }
  v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)copyMultipleItemData:(id)a3 outDatas:(id *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CFTypeRef result;

  v7 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
  result = 0;
  v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if ((_DWORD)v8 == -25300)
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
LABEL_9:
    LOBYTE(a5) = 1;
    goto LABEL_10;
  }
  if (!(_DWORD)v8)
  {
    v10 = (void *)result;
    if (result)
    {
      if (a4)
        *a4 = (id)objc_retainAutorelease((id)result);

      goto LABEL_9;
    }
  }
  if (a5)
  {
    v12 = SESDefaultLogObject(v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = SESCreateAndLogError(0, v13, SESErrorDomain, 1, CFSTR("SecItemMatching %d"));
    *a5 = (id)objc_claimAutoreleasedReturnValue(v14);

    LOBYTE(a5) = 0;
  }
LABEL_10:

  return (char)a5;
}

- (BOOL)updateToApplePayView:(id)a3 error:(id *)a4
{
  return -[SESKeychainWrapper copyItemData:outData:updateToApplePayView:error:](self, "copyItemData:outData:updateToApplePayView:error:", a3, 0, 1, a4);
}

- (void)addKeychainItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  block[2] = sub_10000FD04;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)copyKeychainItemData:(id)a3 updateToApplePayView:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FE60;
  v13[3] = &unk_100303328;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)copyMultipleKeychainItemData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  block[2] = sub_10000FF84;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)deleteKeychainItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  block[2] = sub_1000100A4;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)updateKeychainItemToApplePayView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  block[2] = sub_1000101F8;
  block[3] = &unk_1003030E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)otCliqueForAltDSID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)OTConfigurationContext);
  objc_msgSend(v4, "setContext:", OTDefaultContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithAsciiData:](NSString, "stringWithAsciiData:", v3));

  objc_msgSend(v4, "setAltDSID:", v5);
  v6 = objc_msgSend(objc_alloc((Class)OTClique), "initWithContextData:", v4);

  return v6;
}

- (os_state_data_s)dumpState
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSString *lastEnabledDSID;
  NSData *lastLocalPeerIdentifier;
  void *v7;
  NSArray *lastTrustedPeerIdentities;
  void *v9;
  NSMutableDictionary *lastRetrievedViewInformation;
  void *v11;
  void *v12;
  os_state_data_s *v13;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = v3;
  lastEnabledDSID = self->_lastEnabledDSID;
  if (lastEnabledDSID)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", lastEnabledDSID, CFSTR("_lastEnabledDSID"));
  lastLocalPeerIdentifier = self->_lastLocalPeerIdentifier;
  if (lastLocalPeerIdentifier)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSData asHexString](lastLocalPeerIdentifier, "asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("_lastLocalPeerIdentifier"));

  }
  lastTrustedPeerIdentities = self->_lastTrustedPeerIdentities;
  if (lastTrustedPeerIdentities)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray ses_map:](lastTrustedPeerIdentities, "ses_map:", &stru_100303368));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("_lastTrustedPeers"));

  }
  lastRetrievedViewInformation = self->_lastRetrievedViewInformation;
  if (lastRetrievedViewInformation)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](lastRetrievedViewInformation, "allValues"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ses_map:", &stru_1003033A8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("_lastViewInformation"));

  }
  v13 = (os_state_data_s *)sub_100015734((uint64_t)"keychainwrapper", (uint64_t)v4);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTrustedPeerIdentities, 0);
  objc_storeStrong((id *)&self->_lastLocalPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRetrievedViewInformation, 0);
  objc_storeStrong((id *)&self->_lastEnabledDSID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

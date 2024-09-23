@implementation FMDUnregisterTokenStore

- (FMDUnregisterTokenStore)init
{
  FMDUnregisterTokenStore *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDUnregisterTokenStore;
  v2 = -[FMDUnregisterTokenStore init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    -[FMDUnregisterTokenStore setBundleIdentifier:](v2, "setBundleIdentifier:", v4);

  }
  return v2;
}

+ (id)tokenKeyForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDUnregisterTokenStore computeAccessoryIdentifierWithIdentifier:](FMDUnregisterTokenStore, "computeAccessoryIdentifierWithIdentifier:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("AccessoryUnregisterToken"), v4));
  return v5;
}

+ (id)keychainLookupKeyForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDUnregisterTokenStore computeAccessoryIdentifierWithIdentifier:](FMDUnregisterTokenStore, "computeAccessoryIdentifierWithIdentifier:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("AccessoryUnregisterToken"), v4));
  return v5;
}

- (BOOL)accessoriesNeedUnregister
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextKeysForType:enumerationOption:", CFSTR("AccessoryUnregisterToken"), 2));

  v4 = objc_msgSend(v3, "count");
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    LODWORD(v11) = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore accessoriesNeedUnregister %i", (uint8_t *)&v10, 8u);
  }

  v7 = sub_10005342C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Watch Migration: Stored token count %lu", (uint8_t *)&v10, 0xCu);
  }

  return v4 != 0;
}

- (id)unregisterTokenForIdentifier:(id)a3
{
  FMDCipherKeychainItemAdaptor *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  FMDCipherKeychainItemAdaptor *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  FMDCipherKeychainItemAdaptor *v49;
  NSObject *v50;
  uint64_t *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  FMDCipherKeychainItemAdaptor *v61;
  __int16 v62;
  id v63;

  v4 = (FMDCipherKeychainItemAdaptor *)a3;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_1000BA1C8;
  v58 = sub_1000BA1D8;
  v59 = 0;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "tokenKeyForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "keychainLookupKeyForIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10 && v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
    v53 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contextForKey:contextUUID:error:", v7, 0, &v53));
    v13 = v53;

    if (v13)
    {
      v14 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = (FMDCipherKeychainItemAdaptor *)v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not fetch unregister token %@", buf, 0xCu);
      }

      v16 = sub_10005342C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Watch Migration: could not fetch unregister token for %@", buf, 0xCu);
      }
      goto LABEL_42;
    }
    if (!v12)
    {
      v26 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_10022DA50();
      goto LABEL_42;
    }
    v17 = objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore bundleIdentifier](self, "bundleIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMKeychainManager sharedInstance](FMKeychainManager, "sharedInstance"));
    v52 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemForAccount:service:error:", v10, v17, &v52));
    v21 = v52;

    if (v21)
    {
      v22 = sub_1000031B8();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v4;
        v62 = 2112;
        v63 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read keychain item for %@ %@", buf, 0x16u);
      }

      v24 = sub_10005342C();
      v25 = (FMDCipherKeychainItemAdaptor *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v4;
        _os_log_impl((void *)&_mh_execute_header, &v25->super, OS_LOG_TYPE_DEFAULT, "Watch Migration: could not read keychain item for %@", buf, 0xCu);
      }
      goto LABEL_41;
    }
    v25 = -[FMDCipherKeychainItemAdaptor initWithKeychainItem:]([FMDCipherKeychainItemAdaptor alloc], "initWithKeychainItem:", v20);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCipherKeychainItemAdaptor cipher](v25, "cipher"));
    if (v47)
    {
      if (-[FMDUnregisterTokenStore isTokenDictionaryValid:error:](self, "isTokenDictionaryValid:error:", v12, 0))
      {
        v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("encryptedToken")));
        if (v46)
        {
          v45 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v46, 0);
          if (v45)
          {
            v27 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("FMDUnregisterTokenStore-Decryption"), 10.0);
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_1000BA1E0;
            v48[3] = &unk_1002C5018;
            v51 = &v54;
            v49 = v4;
            v28 = v27;
            v50 = v28;
            -[NSObject decryptWithCipher:completion:](v45, "decryptWithCipher:completion:", v47, v48);
            -[NSObject wait](v28, "wait");
            v44 = v28;
            if (-[NSObject timeoutOccurred](v28, "timeoutOccurred"))
            {
              v29 = sub_1000031B8();
              v30 = objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                sub_10022DB1C();

            }
          }
          else
          {
            v41 = sub_1000031B8();
            v44 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              sub_10022DABC();
          }

        }
        else
        {
          v39 = sub_1000031B8();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          v45 = v40;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read unregister token - FMDUnregisterTokenStoreRecordEncryptedTokenKey", buf, 2u);
          }
        }

        v34 = v46;
        goto LABEL_40;
      }
      v38 = sub_1000031B8();
      v34 = objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v35 = "FMDUnregisterTokenStore token was not valid - expired.";
      v36 = v34;
      v37 = 2;
    }
    else
    {
      v31 = sub_1000031B8();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v25;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore could not read cipher from keychain %@", buf, 0xCu);
      }

      v33 = sub_10005342C();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      *(_DWORD *)buf = 138412290;
      v61 = v4;
      v35 = "Watch Migration: could not decode keychain item for %@";
      v36 = v34;
      v37 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
    goto LABEL_40;
  }
  v18 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore no token keys for %@", buf, 0xCu);
  }
LABEL_43:

  v42 = (id)v55[5];
  _Block_object_dispose(&v54, 8);

  return v42;
}

- (void)removeUnregisterTokenForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  void *v14;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "tokenKeyForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[FMDUnregisterTokenStore removeUnregisterTokenForKey:](self, "removeUnregisterTokenForKey:", v7);
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "keychainLookupKeyForIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore deleting keychain item : %@", (uint8_t *)&v13, 0xCu);
  }

  -[FMDUnregisterTokenStore removeKeychainItemForKey:](self, "removeKeychainItemForKey:", v10);
}

- (void)saveUnregisterToken:(id)a3 identifier:(id)a4 expiryDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  FMDUnregisterTokenStore *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = sub_10005342C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Watch Migration: Saving token and cipher for %@", buf, 0xCu);
  }

  v14 = objc_msgSend((id)objc_opt_class(self, v13), "tokenKeyForIdentifier:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v17 = objc_msgSend((id)objc_opt_class(self, v16), "keychainLookupKeyForIdentifier:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000BA5D4;
  v24[3] = &unk_1002C5040;
  v25 = v9;
  v26 = v15;
  v27 = self;
  v28 = v18;
  v29 = v8;
  v20 = v8;
  v21 = v18;
  v22 = v15;
  v23 = v9;
  objc_msgSend(v19, "encryptWithcompletion:", v24);

}

- (void)expungeUnregisterTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  FMDUnregisterTokenStore *v18;
  _QWORD v19[4];
  id v20;
  FMDUnregisterTokenStore *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FMDUnregisterTokenStore *v25;
  id v26;
  uint8_t buf[4];
  void *v28;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000BAAF0;
  v23[3] = &unk_1002C5068;
  v7 = v5;
  v24 = v7;
  v25 = self;
  v8 = v6;
  v26 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v23);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore allTokenKeys](self, "allTokenKeys"));
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore expungeUnregisterTokens listing all keys %@", buf, 0xCu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BABBC;
  v19[3] = &unk_1002C5090;
  v20 = v7;
  v21 = self;
  v12 = v8;
  v22 = v12;
  v13 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore allKeychainLookupKeys](self, "allKeychainLookupKeys"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000BADC8;
  v16[3] = &unk_1002C2E80;
  v17 = v12;
  v18 = self;
  v15 = v12;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

}

- (void)clearUnregisterTokens
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore allTokenKeys](self, "allTokenKeys"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BAF60;
  v6[3] = &unk_1002C50B8;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore allKeychainLookupKeys](self, "allKeychainLookupKeys"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BAFAC;
  v5[3] = &unk_1002C1890;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

- (BOOL)isTokenDictionaryValid:(id)a3 error:(id *)a4
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  int v26;
  id v27;

  if (a3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("expiryDate")));
    if (v5)
    {
      v6 = sub_10005342C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 134217984;
        v27 = -[NSObject fm_epoch](v5, "fm_epoch");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Watch Migration: Found Token Expiry %lli", (uint8_t *)&v26, 0xCu);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject timeIntervalSinceReferenceDate](v5, "timeIntervalSinceReferenceDate");
      v10 = v9;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v12 = v10 > v11;
      if (a4 && v10 <= v11)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydeviced.FMDUnregisterTokenStore"), 2, 0));

    }
    else
    {
      v14 = sub_1000031B8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10022DC80(v15, v16, v17, v18, v19, v20, v21, v22);

      v23 = sub_10005342C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Watch Migration: Invalid token. No expiry date found.", (uint8_t *)&v26, 2u);
      }

      v12 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydeviced.FMDUnregisterTokenStore"), 1, 0));
    }
  }
  else
  {
    v13 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10022DC44(v5);
    v12 = 1;
  }

  return v12;
}

- (void)removeKeychainItemForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  int v24;
  id v25;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore bundleIdentifier](self, "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMKeychainManager sharedInstance](FMKeychainManager, "sharedInstance"));
    v7 = objc_msgSend(v6, "deleteDataForAccount:service:", v4, v5);

    if ((v7 & 1) != 0)
    {
      v8 = sub_10005342C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      v24 = 138412290;
      v25 = v4;
      v10 = "Watch Migration: Deleted Keychain Item %@";
    }
    else
    {
      v21 = sub_1000031B8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10022DCE0();

      v23 = sub_10005342C();
      v9 = objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v24 = 138412290;
      v25 = v4;
      v10 = "Watch Migration: Failed to delete keychain item %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 0xCu);
    goto LABEL_14;
  }
  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_10022DCB0(v12, v13, v14, v15, v16, v17, v18, v19);

  v20 = sub_10005342C();
  v5 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch Migration: Failed to delete keychain, programmer error. Nil key.", (uint8_t *)&v24, 2u);
  }
LABEL_15:

}

- (void)removeUnregisterTokenForKey:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDUnregisterTokenStore deleting token : %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = sub_10005342C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Watch Migration: Deleting token from disk %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  objc_msgSend(v8, "cleanupAllContextsForKey:", v3);

}

- (id)allTokenKeys
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextKeysForType:enumerationOption:", CFSTR("AccessoryUnregisterToken"), 1));

  return v3;
}

- (id)allKeychainLookupKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDUnregisterTokenStore bundleIdentifier](self, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMKeychainManager sharedInstance](FMKeychainManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allAccountsForService:", v2));

  return v4;
}

+ (id)computeAccessoryIdentifierWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NR_%@"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_sha256Hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_hexString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

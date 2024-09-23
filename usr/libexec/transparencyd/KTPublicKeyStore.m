@implementation KTPublicKeyStore

- (void)setPublicKeyStoreDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v5);
  objc_storeWeak((id *)&self->_delegate, v4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

        objc_msgSend(v12, "setDelegate:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (NSDictionary)applicationKeyStores
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));

  objc_sync_exit(v3);
  return (NSDictionary *)v5;
}

- (id)applicationPublicKeyStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (void)updateTLTKeyStoreWithApplicationKeyStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  KTPublicKeyStore *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v4 = a3;
  if (v4)
  {
    v52 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));

    if (v5)
    {
      obj = (id)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      objc_sync_enter(obj);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyBag"));
      v8 = objc_msgSend(v7, "tltLogBeginningMs");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyBag"));
      v10 = objc_msgSend(v9, "tltLogBeginningMs");

      if (v8 < v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyBag"));
        v12 = objc_msgSend(v11, "copyTltBag");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        objc_msgSend(v13, "setKeyBag:", v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receiptTime"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        objc_msgSend(v15, "setReceiptTime:", v14);

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](v52, "applicationKeyStores"));
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v54;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v54 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application", obj));
              v22 = objc_msgSend(v20, "isEqualToString:", v21);

              if ((v22 & 1) == 0)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](v52, "applicationKeyStores"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v20));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keyBag"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tltKeyStore"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "signatureVerifier"));
                objc_msgSend(v27, "setNeedsRefresh:", 1);

              }
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
          }
          while (v17);
        }

        goto LABEL_20;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "keyBag"));
      v31 = objc_msgSend(v30, "tltLogBeginningMs");
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyBag"));
      v33 = objc_msgSend(v32, "tltLogBeginningMs");

      if (v31 <= v33)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v38 = objc_msgSend(v37, "readyWithRefresh:", 0);

        if ((v38 & 1) != 0)
        {
LABEL_20:
          objc_sync_exit(obj);

          goto LABEL_21;
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "keyBag"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "vrfKey"));
        objc_msgSend(v41, "setNeedsRefresh:", 0);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "keyBag"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "appSthKeyStore"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "signatureVerifier"));
        objc_msgSend(v45, "setNeedsRefresh:", 0);

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "keyBag"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "appSmtKeyStore"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "signatureVerifier"));
        objc_msgSend(v49, "setNeedsRefresh:", 0);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](v52, "tltKeyStore"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "keyBag"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "tltKeyStore"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "signatureVerifier"));
        objc_msgSend(v50, "setNeedsRefresh:", 0);

      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyBag"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tltKeyStore"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "signatureVerifier"));
        objc_msgSend(v36, "setNeedsRefresh:", 1);
      }

      goto LABEL_20;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createTLTApplicationPublicKeyStore"));
    -[KTPublicKeyStore setTltKeyStore:](v52, "setTltKeyStore:", v28);

  }
LABEL_21:

}

- (void)updatePublicKeyStores:(id)a3 diskStore:(id)a4 contextStore:(id)a5 complete:(id)a6
{
  id v10;
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100169BE4;
  v11[3] = &unk_10023D268;
  v12 = a6;
  v10 = v12;
  -[KTPublicKeyStore configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:](self, "configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:", a3, 1, a4, a5, 0, v11);

}

- (id)copyMetadata
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[KTPublicKeyStore readyWithRefresh:](self, "readyWithRefresh:", 0)));
  v7[0] = v2;
  v6[0] = off_1002A33A0;
  v6[1] = off_1002A33A8;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", kTransparencyProtocolVersion));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

- (id)copyKeyStoreState
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = -[KTPublicKeyStore copyMetadata](self, "copyMetadata");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, off_1002A3398);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v12 = objc_msgSend(v11, "copyKeyStoreState");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)keyStoreFileName
{
  void *v2;
  id v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  v3 = objc_msgSend(v2, "getEnvironment");

  if (v3 == (id)2)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249B38);
    v6 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "using QA2 key store", v7, 2u);
    }
    return CFSTR("KTPublicKeyStore-qa2.plist");
  }
  else if (v3 == (id)1)
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249B18);
    v4 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using QA1 key store", buf, 2u);
    }
    return CFSTR("KTPublicKeyStore-qa1.plist");
  }
  else
  {
    return CFSTR("KTPublicKeyStore.plist");
  }
}

- (id)readPublicKeyStoreFromDisk:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore keyStoreFileName](self, "keyStoreFileName"));
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport readDictionaryFromFile:error:](TransparencyFileSupport, "readDictionaryFromFile:error:", v4, &v9));
  v6 = v9;

  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v7, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("ktDiskPublicKeyStoreEvent"), 1, v6, &off_10025C620);

    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (BOOL)writePublicKeyStoreToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore keyStoreFileName](self, "keyStoreFileName"));
  v8 = +[TransparencyFileSupport writeDictionaryToFile:fileName:error:](TransparencyFileSupport, "writeDictionaryToFile:fileName:error:", v6, v7, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "logSuccessForEventNamed:", CFSTR("ktDiskPublicKeyStoreWriteEvent"));
  else
    objc_msgSend(v9, "logResultForEvent:hardFailure:result:withAttributes:", CFSTR("ktDiskPublicKeyStoreEvent"), 1, *a4, &off_10025C648);

  return v8;
}

- (BOOL)clearDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0));
  v8 = objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v6);
  v9 = -[KTPublicKeyStore writePublicKeyStoreToDisk:error:](self, "writePublicKeyStoreToDisk:error:", v8, a4);

  return v9;
}

- (BOOL)hasApplicationPublicKeyStoreOnDisk:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)saveDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", 0));
  v8 = objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = objc_msgSend(v6, "copyKeyStoreState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "application"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);
  v11 = -[KTPublicKeyStore copyMetadata](self, "copyMetadata");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, off_1002A3398);

  v12 = -[KTPublicKeyStore writePublicKeyStoreToDisk:error:](self, "writePublicKeyStoreToDisk:error:", v8, a4);
  return v12;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreData:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KTApplicationPublicKeyStore *v16;
  void *v17;
  KTApplicationPublicKeyStore *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  KTApplicationPublicKeyStore *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = [KTApplicationPublicKeyStore alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  v18 = -[KTApplicationPublicKeyStore initWithApplication:dataStore:diskState:contextStore:settings:error:](v16, "initWithApplication:dataStore:diskState:contextStore:settings:error:", v12, v14, v13, v15, v17, a7);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_sync_enter(v19);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[KTApplicationPublicKeyStore setDelegate:](v18, "setDelegate:", WeakRetained);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_msgSend(v21, "setValue:forKey:", v18, v12);

    objc_sync_exit(v19);
    v22 = v18;
  }

  return v18;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreResponse:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KTApplicationPublicKeyStore *v16;
  void *v17;
  KTApplicationPublicKeyStore *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  KTApplicationPublicKeyStore *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = [KTApplicationPublicKeyStore alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore settings](self, "settings"));
  v18 = -[KTApplicationPublicKeyStore initWithApplication:dataStore:response:contextStore:settings:error:](v16, "initWithApplication:dataStore:response:contextStore:settings:error:", v12, v14, v13, v15, v17, a7);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_sync_enter(v19);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[KTApplicationPublicKeyStore setDelegate:](v18, "setDelegate:", WeakRetained);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore _applicationKeyStores](self, "_applicationKeyStores"));
    objc_msgSend(v21, "setValue:forKey:", v18, v12);

    objc_sync_exit(v19);
    v22 = v18;
  }

  return v18;
}

- (void)fetchKeyStore:(id)a3 application:(id)a4 contextStore:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildPublicKeysRequest:error:](TransparencyRPCRequestBuilder, "buildPublicKeysRequest:error:", v11, &v23));
  v15 = v23;
  v16 = v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 0;
  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10016A72C;
    v18[3] = &unk_100249C00;
    v22 = v13;
    v18[4] = self;
    v19 = v11;
    v20 = v10;
    v21 = v12;
    objc_msgSend(v20, "fetchPublicKeys:completionHandler:", v14, v18);

  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }

}

- (void)configureWithClient:(id)a3 ignoreCachedKeys:(BOOL)a4 dataStore:(id)a5 contextStore:(id)a6 applicationHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  NSArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSArray *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD block[4];
  id v47;
  _QWORD v48[6];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v45 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (a4)
  {
    v44 = v14;
    v18 = 0;
LABEL_16:
    v43 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", v18));
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v27 = 0;
      do
      {
        v28 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureGroup](self, "configureGroup"));
        dispatch_group_enter(v28);

        ++v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications"));
        v30 = objc_msgSend(v29, "count");

      }
      while (v27 < (unint64_t)v30);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v31 = self->_applications;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v51;
      do
      {
        v35 = 0;
        do
        {
          v36 = v15;
          if (*(_QWORD *)v51 != v34)
            objc_enumerationMutation(v31);
          v37 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v35);
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10016B08C;
          v48[3] = &unk_100249150;
          v38 = v16;
          v48[5] = self;
          v49 = v38;
          v48[4] = v37;
          v39 = v37;
          v15 = v36;
          -[KTPublicKeyStore fetchKeyStore:application:contextStore:completionHandler:](self, "fetchKeyStore:application:contextStore:completionHandler:", v45, v39, v36, v48);

          v35 = (char *)v35 + 1;
        }
        while (v33 != v35);
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v33);
    }

    v40 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureGroup](self, "configureGroup"));
    v41 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore configureQueue](self, "configureQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016B0E0;
    block[3] = &unk_1002474B0;
    v17 = v43;
    v47 = v43;
    dispatch_group_notify(v40, v41, block);

    v14 = v44;
    v18 = v42;
    goto LABEL_27;
  }
  v58 = 0;
  v19 = -[KTPublicKeyStore configureWithDisk:contextStore:error:](self, "configureWithDisk:contextStore:error:", v14, v15, &v58);
  v18 = v58;
  if (!v19)
  {
    v44 = v14;
    goto LABEL_16;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v20 = self->_applications;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v20);
        if (v16)
          (*((void (**)(id, _QWORD, id))v16 + 2))(v16, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v24), v18);
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v22);
  }

  if (v17)
    (*((void (**)(id, id))v17 + 2))(v17, v18);
LABEL_27:

}

- (void)configureWithClient:(id)a3 dataStore:(id)a4 contextStore:(id)a5 applicationHandler:(id)a6 completionHandler:(id)a7
{
  -[KTPublicKeyStore configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:](self, "configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:", a3, 0, a4, a5, a6, a7);
}

- (BOOL)configureWithDisk:(id)a3 contextStore:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  NSObject *v13;
  unsigned __int8 v14;
  KTPublicKeyStore *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  id v21;
  uint64_t v22;
  void *v23;
  KTPublicKeyStore *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  uint64_t v31;
  char v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  KTPublicKeyStore *v42;

  v34 = a3;
  v33 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", a5));
  v9 = v8;
  if (v8)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", off_1002A3398));
    if (v30
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", off_1002A33A8)),
          v11 = objc_msgSend(v10, "unsignedIntegerValue"),
          v12 = kTransparencyProtocolVersion,
          v10,
          (unint64_t)v11 >= v12))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", off_1002A33A0));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", off_1002A33A0));
        -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", objc_msgSend(v19, "BOOLValue") ^ 1);

      }
      v15 = self;
      objc_sync_enter(v15);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = v15->_applications;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v36;
        v31 = kTransparencyErrorFile;
        v32 = 1;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v20);
            v24 = *(KTPublicKeyStore **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));

            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore createApplicationKeyStore:keyStoreData:dataStore:contextStore:error:](v15, "createApplicationKeyStore:keyStoreData:dataStore:contextStore:error:", v24, v26, v34, v33, a5));

              if (v27)
              {
                -[KTPublicKeyStore updateTLTKeyStoreWithApplicationKeyStore:](v15, "updateTLTKeyStoreWithApplicationKeyStore:", v27);
              }
              else
              {
                -[KTPublicKeyStore clearDiskApplicationKeyStore:error:](v15, "clearDiskApplicationKeyStore:error:", v24, a5);
                v32 = 0;
              }

            }
            else
            {
              if (a5)
                *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v31, -39, *a5, CFSTR("On-disk key store not found for %@"), v24));
              if (qword_1002A7958 != -1)
                dispatch_once(&qword_1002A7958, &stru_100249C80);
              v28 = qword_1002A7960;
              if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v24;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "On-disk key store not found for %@", buf, 0xCu);
              }
            }
            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v21);
      }
      else
      {
        v32 = 1;
      }

      objc_sync_exit(v15);
    }
    else
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249C40);
      v13 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating to newer protocol version used by this client", buf, 2u);
      }
      -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", 1);
      v39 = 0;
      v14 = objc_msgSend(v34, "clearState:", &v39);
      v15 = (KTPublicKeyStore *)v39;
      if ((v14 & 1) == 0)
      {
        if (qword_1002A7958 != -1)
          dispatch_once(&qword_1002A7958, &stru_100249C60);
        v16 = qword_1002A7960;
        if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to clear DB state: %@", buf, 0xCu);
        }
      }
      v32 = 0;
    }

  }
  else
  {
    -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", 1);
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorFile, -38, *a5, CFSTR("On-disk key store not found")));
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249C20);
    v17 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "On-disk key store not found", buf, 2u);
    }
    v32 = 0;
  }

  return v32 & 1;
}

- (KTPublicKeyStore)initWithDataStore:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  KTPublicKeyStore *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  dispatch_group_t v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  id v17;
  NSObject *v18;
  KTPublicKeyStore *v19;
  NSObject *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[3];

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)KTPublicKeyStore;
  v8 = -[KTPublicKeyStore init](&v23, "init");
  if (!v8)
  {
LABEL_9:
    v19 = v8;
    goto LABEL_15;
  }
  v26[0] = kKTApplicationIdentifierIDS;
  v26[1] = kKTApplicationIdentifierIDSMultiplex;
  v26[2] = kKTApplicationIdentifierIDSFaceTime;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
  -[KTPublicKeyStore setApplications:](v8, "setApplications:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](v8, "applications"));
  v11 = objc_msgSend(v10, "count");

  if (v11 == (id)3)
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    -[KTPublicKeyStore set_applicationKeyStores:](v8, "set_applicationKeyStores:", v12);

    v13 = dispatch_group_create();
    -[KTPublicKeyStore setConfigureGroup:](v8, "setConfigureGroup:", v13);

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.transparency.keyStoreConfiguration", v15);
    -[KTPublicKeyStore setConfigureQueue:](v8, "setConfigureQueue:", v16);

    -[KTPublicKeyStore setSettings:](v8, "setSettings:", v7);
    v22 = 0;
    LOBYTE(v16) = -[KTPublicKeyStore configureWithDisk:contextStore:error:](v8, "configureWithDisk:contextStore:error:", v6, 0, &v22);
    v17 = v22;
    if ((v16 & 1) == 0)
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249CC0);
      v18 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "failed to read disk public key store:%@", buf, 0xCu);
      }
    }

    goto LABEL_9;
  }
  if (qword_1002A7958 != -1)
    dispatch_once(&qword_1002A7958, &stru_100249CA0);
  v20 = qword_1002A7960;
  if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "hey silly, update the KT_APPLICATION_COUNT, too!", buf, 2u);
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (void)clearApplicationState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (objc_msgSend(v6, "isEqualToString:", kKTApplicationIdentifierTLT))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));

    v8 = (void *)v9;
  }
  if (v8)
  {
    objc_msgSend(v8, "clearState:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    -[KTPublicKeyStore clearDiskApplicationKeyStore:error:](self, "clearDiskApplicationKeyStore:error:", v10, a4);

  }
  else
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249CE0);
    v11 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unknown key store for application %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)clearForEnvironmentChange
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  __int128 v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores", v19));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v21 = 0;
          objc_msgSend(v11, "clearState:", &v21);
          v12 = v21;
          if (v12)
          {
            if (qword_1002A7958 != -1)
              dispatch_once(&qword_1002A7958, &stru_100249D20);
            v13 = qword_1002A7960;
            if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v27 = v9;
              v28 = 2112;
              v29 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error clearing application keystore state[%@]: %@", buf, 0x16u);
            }
          }

        }
        else
        {
          if (qword_1002A7958 != -1)
            dispatch_once(&qword_1002A7958, &stru_100249D00);
          v14 = qword_1002A7960;
          if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v27 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Tried to clear key store for unknown application %@", buf, 0xCu);
          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
    v20 = 0;
    objc_msgSend(v16, "clearState:", &v20);
    v17 = v20;

    if (v17)
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249D40);
      v18 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error clearing application keystore state[TLT]: %@", buf, 0xCu);
      }
    }

  }
}

- (BOOL)readyWithRefresh:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  if (-[KTPublicKeyStore forceRefresh](self, "forceRefresh"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));
            v16 = objc_msgSend(v15, "readyWithRefresh:", v3);

            if (v16)
              continue;
          }

          goto LABEL_16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
    }

    v17 = objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
      v5 = objc_msgSend(v19, "readyWithRefresh:", v3);

      if (v5)
        LOBYTE(v5) = objc_msgSend(v6, "count") != 0;
    }
    else
    {
LABEL_16:
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (BOOL)ready
{
  return -[KTPublicKeyStore readyWithRefresh:](self, "readyWithRefresh:", 1);
}

- (BOOL)anyStoreExpired
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applicationKeyStores](self, "applicationKeyStores"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore applications](self, "applications", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)));
        v10 = objc_msgSend(v9, "storeExpired");

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore tltKeyStore](self, "tltKeyStore"));
  v11 = objc_msgSend(v4, "storeExpired");
LABEL_11:

  return v11;
}

- (BOOL)initiallyFetched
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;

  v15 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStore readPublicKeyStoreFromDisk:](self, "readPublicKeyStoreFromDisk:", &v15));
  v3 = v15;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", off_1002A3398));
    v6 = objc_opt_class(NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_1002A33A0));
      v9 = objc_opt_class(NSNumber, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        v10 = objc_msgSend(v7, "BOOLValue");
      }
      else
      {
        if (qword_1002A7958 != -1)
          dispatch_once(&qword_1002A7958, &stru_100249DA0);
        v13 = qword_1002A7960;
        if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Disk data store ready flag wrong class", buf, 2u);
        }
        v10 = 0;
      }

    }
    else
    {
      if (qword_1002A7958 != -1)
        dispatch_once(&qword_1002A7958, &stru_100249D80);
      v12 = qword_1002A7960;
      if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Disk data store missing metadata", buf, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    if (qword_1002A7958 != -1)
      dispatch_once(&qword_1002A7958, &stru_100249D60);
    v11 = qword_1002A7960;
    if (os_log_type_enabled((os_log_t)qword_1002A7960, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Initial readPublicKeyStoreFromDisk failed with: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (OS_dispatch_group)configureGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigureGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)configureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigureQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)_applicationKeyStores
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_applicationKeyStores:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)applications
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTApplicationPublicKeyStore)tltKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTltKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)forceRefresh
{
  return self->_forceRefresh;
}

- (void)setForceRefresh:(BOOL)a3
{
  self->_forceRefresh = a3;
}

- (BOOL)stop
{
  return self->_stop;
}

- (void)setStop:(BOOL)a3
{
  self->_stop = a3;
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tltKeyStore, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->__applicationKeyStores, 0);
  objc_storeStrong((id *)&self->_configureQueue, 0);
  objc_storeStrong((id *)&self->_configureGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

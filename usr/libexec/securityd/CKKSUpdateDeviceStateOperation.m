@implementation CKKSUpdateDeviceStateOperation

- (CKKSUpdateDeviceStateOperation)initWithOperationDependencies:(id)a3 rateLimit:(BOOL)a4 ckoperationGroup:(id)a5
{
  id v9;
  id v10;
  char *v11;
  char *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKKSUpdateDeviceStateOperation;
  v11 = -[CKKSGroupOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a3);
    objc_storeStrong((id *)(v12 + 142), a5);
    v12[128] = a4;
  }

  return (CKKSUpdateDeviceStateOperation *)v12;
}

- (void)groupStart
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  _QWORD v35[6];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[16];
  id location[2];
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[2];
  NSErrorUserInfoKey v47;
  const __CFString *v48;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountStateTracker"));

  if (v32)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ckdeviceIDInitialized"));
    v4 = objc_msgSend(v3, "wait:", 200000000000);

    if (v4)
    {
      v5 = sub_10000BDF4(CFSTR("ckksdevice"), 0);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CK device ID not initialized, likely quitting", buf, 2u);
      }

    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ckdeviceID"));
    if (v30)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cdpCapableiCloudAccountInitialized", v30));
      v8 = objc_msgSend(v7, "wait:", 500000000);

      if (v8)
      {
        v9 = sub_10000BDF4(CFSTR("ckksdevice"), 0);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Not quite sure if the account is HSA2/Managed or not. Probably will quit?", buf, 2u);
        }

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "databaseProvider"));

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeManagedViews"));

      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_1000A6B80;
            v35[3] = &unk_1002DCA08;
            v35[4] = v18;
            v35[5] = self;
            objc_copyWeak(&v37, location);
            v19 = v11;
            v36 = v19;
            objc_msgSend(v13, "dispatchSyncWithSQLTransaction:", v35);

            objc_destroyWeak(&v37);
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v15);
        v11 = v19;
      }
      v20 = obj;
    }
    else
    {
      v25 = sub_10000BDF4(CFSTR("ckksdevice"), 0);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "CK device ID not initialized, quitting", buf, 2u);
      }

      v46[0] = CFSTR("CK device ID missing");
      v45[0] = NSLocalizedDescriptionKey;
      v45[1] = NSUnderlyingErrorKey;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ckdeviceIDError", 0));
      v28 = v27;
      if (v27)
        v29 = v27;
      else
        v29 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v11 = v29;

      v46[1] = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 59, v13));
      -[CKKSResultOperation setError:](self, "setError:", v20);
    }

    objc_destroyWeak(location);
  }
  else
  {
    v21 = sub_10000BDF4(CFSTR("ckksdevice"), 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "no AccountTracker object", (uint8_t *)location, 2u);
    }

    v47 = NSLocalizedDescriptionKey;
    v48 = CFSTR("no AccountTracker object");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 57, v23));
    -[CKKSResultOperation setError:](self, "setError:", v24);

  }
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 134, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 142, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (BOOL)rateLimit
{
  return self->_rateLimit;
}

- (void)setRateLimit:(BOOL)a3
{
  self->_rateLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)(&self->_rateLimit + 6), 0);
}

@end

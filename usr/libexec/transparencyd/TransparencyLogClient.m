@implementation TransparencyLogClient

- (TransparencyLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TransparencyLogClient *v14;
  TransparencyLogClient *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TransparencyLogClient;
  v14 = -[TransparencyLogClient init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[TransparencyLogClient setSession:](v14, "setSession:", v10);
    -[TransparencyLogClient setDataStore:](v15, "setDataStore:", v12);
    -[TransparencyLogClient setTransparencyAnalytics:](v15, "setTransparencyAnalytics:", v11);
    -[TransparencyLogClient setSettings:](v15, "setSettings:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyIDSConfigBag sharedInstance](TransparencyIDSConfigBag, "sharedInstance"));
    -[TransparencyLogClient setIdsConfigBag:](v15, "setIdsConfigBag:", v16);

  }
  return v15;
}

- (BOOL)ready
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auth"));
  v5 = objc_msgSend(v4, "isSupported");

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "auth"));
  v8 = objc_msgSend(v7, "ready");

  return v8;
}

- (BOOL)needsRetry:(id)a3
{
  return a3 && objc_msgSend(a3, "code") == (id)-174;
}

- (BOOL)needsReauthorization:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  BOOL v13;
  uint64_t v14;
  int v16;
  void *v17;

  v6 = a4;
  if (-[TransparencyLogClient needsRetry:](self, "needsRetry:", a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("x-auth-status")));
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("unauthorized")))
      {
        if (qword_1002A7BD8 != -1)
          dispatch_once(&qword_1002A7BD8, &stru_10024C7C8);
        v9 = qword_1002A7BE0;
        if (!os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        LOWORD(v16) = 0;
        v10 = "authorization failed";
        v11 = v9;
        v12 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
LABEL_16:

        v13 = 1;
        goto LABEL_17;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("time-drift")) & 1) == 0)
      {
        if (qword_1002A7BD8 != -1)
          dispatch_once(&qword_1002A7BD8, &stru_10024C7E8);
        v14 = qword_1002A7BE0;
        if (!os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v16 = 138412290;
        v17 = v8;
        v10 = "unknown auth status %@";
        v11 = v14;
        v12 = 12;
        goto LABEL_15;
      }
    }

  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)needsTimeShift:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  uint8_t v12[16];

  v6 = a4;
  if (!-[TransparencyLogClient needsRetry:](self, "needsRetry:", a3))
    goto LABEL_10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("x-auth-status")));
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "isEqualToString:", CFSTR("time-drift")))
  {

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (qword_1002A7BD8 != -1)
    dispatch_once(&qword_1002A7BD8, &stru_10024C808);
  v9 = qword_1002A7BE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "authorization failed due to time drift", v12, 2u);
  }

  v10 = 1;
LABEL_11:

  return v10;
}

+ (double)timeShift:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Date")));
  v4 = objc_alloc_init((Class)NSDateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US")));
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("EE, dd MMM yyyy HH:mm:ss 'GMT'"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v4, "setTimeZone:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromString:", v3));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (void)renewAccountTokenForFetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;

  v10 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10019F8DC;
  v17[3] = &unk_10024C830;
  v11 = a6;
  v19 = v11;
  v17[4] = self;
  v12 = v10;
  v18 = v12;
  v20 = a4;
  v21 = a5;
  v13 = objc_retainBlock(v17);
  v16 = 0;
  LOBYTE(v10) = +[TransparencyAccount initiateCredentialRenewal:completionHandler:](TransparencyAccount, "initiateCredentialRenewal:completionHandler:", &v16, v13);
  v14 = v16;
  if ((v10 & 1) == 0)
  {
    if (qword_1002A7BD8 != -1)
      dispatch_once(&qword_1002A7BD8, &stru_10024C850);
    v15 = qword_1002A7BE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to initiate credential renewal: %@", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v14);
  }

}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 useReversePush:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  BOOL v22;
  char v23;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10019FA38;
  v18[3] = &unk_10024C8A0;
  v21 = a4;
  v19 = v12;
  v20 = v13;
  v18[4] = self;
  v22 = v9;
  v23 = v8;
  v15 = v12;
  v16 = v13;
  LOBYTE(v8) = objc_msgSend(v14, "fetch:allowEmptyData:useReversePush:completionHandler:", v15, v9, v8, v18);

  return v8;
}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 completionHandler:(id)a6
{
  return -[TransparencyLogClient fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:](self, "fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:", a3, a4, a5, 0, a6);
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  return -[TransparencyLogClient fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:](self, "fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:", a3, 1, a4, a5, a6);
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return -[TransparencyLogClient fetch:allowEmptyData:useReversePush:completionHandler:](self, "fetch:allowEmptyData:useReversePush:completionHandler:", a3, a4, 0, a5);
}

- (void)fetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "auth"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10019FF18;
  v12[3] = &unk_10024C8F0;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v10, "createRequestForAuthentication:completionHandler:", v9, v12);

}

- (void)deleteDownloadId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (qword_1002A7BD8 != -1)
    dispatch_once(&qword_1002A7BD8, &stru_10024C910);
  v5 = qword_1002A7BE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting downloadId %{public}@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient dataStore](self, "dataStore"));
  v10 = 0;
  v7 = objc_msgSend(v6, "deleteDownloadRecordById:error:", v4, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_1002A7BD8 != -1)
      dispatch_once(&qword_1002A7BD8, &stru_10024C930);
    v9 = qword_1002A7BE0;
    if (os_log_type_enabled((os_log_t)qword_1002A7BE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to delete downloadId %{public}@: %@", buf, 0x16u);
    }
  }

}

- (TransparencyLogSession)session
{
  return (TransparencyLogSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyAnalytics)transparencyAnalytics
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTransparencyAnalytics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdsConfigBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_transparencyAnalytics, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

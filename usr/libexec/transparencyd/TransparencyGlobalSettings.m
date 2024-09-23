@implementation TransparencyGlobalSettings

- (TransparencyGlobalSettings)initWithContainer:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  TransparencyGlobalSettings *v8;
  TransparencyGlobalSettings *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics")&& (v11.receiver = self, v11.super_class = (Class)TransparencyGlobalSettings, v8 = -[TransparencyGlobalSettings init](&v11, "init"), (self = v8) != 0))
  {
    -[TransparencyGlobalSettings setLogger:](v8, "setLogger:", v7);
    -[TransparencyGlobalSettings setDelegate:](self, "setDelegate:", self);
    -[TransparencyGlobalSettings setContainer:](self, "setContainer:", v6);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)setupCloudKit
{
  TransparencyGlobalSettings *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings container](v2, "container"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings publicCloudDatabase](v2, "publicCloudDatabase"));

    if (v4)
    {
      LOBYTE(v3) = 0;
      LOBYTE(v5) = 1;
    }
    else
    {
      v3 = objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings container](v2, "container"));
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v3, "publicCloudDatabase"));
      -[TransparencyGlobalSettings setPublicCloudDatabase:](v2, "setPublicCloudDatabase:", v5);

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  objc_sync_exit(v2);

  return (v5 | v3) & 1;
}

- (void)fetchSettings:(id)a3 force:(BOOL)a4
{
  _xpc_activity_s *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[8];
  _QWORD v12[5];
  id v13;
  id location;

  v6 = (_xpc_activity_s *)a3;
  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings delegate](self, "delegate"));
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_10004D96C;
  v12[4] = sub_10004D97C;
  v13 = 0;
  v13 = (id)os_transaction_create("com.apple.transparency.fetchSettings");
  if (v6 && xpc_activity_should_defer(v6))
  {
    if (qword_1002A45E0 != -1)
      dispatch_once(&qword_1002A45E0, &stru_10023E7D8);
    v8 = qword_1002A45E8;
    if (os_log_type_enabled((os_log_t)qword_1002A45E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deferring fetchSettings", buf, 2u);
    }
    xpc_activity_set_state(v6, 3);
  }
  else if (v7 && (a4 || objc_msgSend(v7, "shouldFetch:", CFSTR("globalSettingsKey"))))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004D9B4;
    v9[3] = &unk_10023E840;
    objc_copyWeak(&v10, &location);
    v9[4] = v12;
    objc_msgSend(v7, "fetchCloudData:complete:", CFSTR("TransparencySFASettings"), v9);
    objc_destroyWeak(&v10);
  }
  _Block_object_dispose(v12, 8);

  objc_destroyWeak(&location);
}

- (BOOL)shouldFetch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  uint8_t v13[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "datePropertyForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v7 && (uint64_t)objc_msgSend(v7, "compare:", v8) >= 1)
  {
    if (qword_1002A45E0 != -1)
      dispatch_once(&qword_1002A45E0, &stru_10023E860);
    v9 = qword_1002A45E8;
    if (os_log_type_enabled((os_log_t)qword_1002A45E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No enough time passed to run the CKFetch for new configuration", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
    objc_msgSend(v11, "setDateProperty:forKey:", v8, CFSTR("globalSettingsKey"));

    v10 = 1;
  }

  return v10;
}

- (void)fetchCloudData:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  if (-[TransparencyGlobalSettings setupCloudKit](self, "setupCloudKit"))
  {
    v8 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:", v6);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings publicCloudDatabase](self, "publicCloudDatabase"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10004DF8C;
      v11[3] = &unk_10023E908;
      objc_copyWeak(&v13, &location);
      v12 = v7;
      objc_msgSend(v9, "fetchRecordWithID:completionHandler:", v8, v11);

      objc_destroyWeak(&v13);
    }
    else
    {
      if (qword_1002A45E0 != -1)
        dispatch_once(&qword_1002A45E0, &stru_10023E880);
      v10 = qword_1002A45E8;
      if (os_log_type_enabled((os_log_t)qword_1002A45E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create CKRecord", buf, 2u);
      }
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorNetwork, -1001, CFSTR("time out")));
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v8);
  }

  objc_destroyWeak(&location);
}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
  objc_msgSend(v5, "updateCollectionConfigurationWithData:", v4);

}

- (TransparencyGlobalSettingsProtocol)delegate
{
  return (TransparencyGlobalSettingsProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKDatabase)publicCloudDatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPublicCloudDatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

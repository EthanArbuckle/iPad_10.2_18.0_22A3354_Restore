@implementation MSDDemoUpdateStatusHub

+ (id)sharedInstance
{
  if (qword_1001755E8 != -1)
    dispatch_once(&qword_1001755E8, &stru_10013FD20);
  return (id)qword_1001755E0;
}

- (BOOL)registerDemoUpdateStatusDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __int16 v32;
  id v33;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v14 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CB554(v11, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_14;
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate) & 1) == 0)
  {
    v22 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000CB588(v11, v23, v24, v25, v26, v27, v28, v29);
LABEL_14:
    v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
    objc_msgSend(v9, "addObject:", v5);

    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
      v30 = 136315394;
      v31 = "-[MSDDemoUpdateStatusHub registerDemoUpdateStatusDelegate:]";
      v32 = 2048;
      v33 = objc_msgSend(v12, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Registed 1 delegate, delegate count = %tu", (uint8_t *)&v30, 0x16u);

    }
    v8 = 1;
    goto LABEL_8;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)unregisterDemoUpdateStatusDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___MSDDemoUpdateStatusDelegate))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
    objc_msgSend(v6, "removeObject:", v5);

    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](self, "delegates"));
      v10 = 136315394;
      v11 = "-[MSDDemoUpdateStatusHub unregisterDemoUpdateStatusDelegate:]";
      v12 = 2048;
      v13 = objc_msgSend(v9, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Unregisted 1 delegate, delegate count = %tu", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)demoUpdateProgress:(int64_t)a3
{
  MSDDemoUpdateStatusHub *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int64_t v10;

  v4 = self;
  objc_sync_enter(v4);
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "demoUpdateProgress: %td", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v4, "delegates"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A9758;
  v8[3] = &unk_10013FD40;
  v8[4] = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  objc_sync_exit(v4);
}

- (void)demoUpdateCompleted:(id)a3
{
  id v4;
  MSDDemoUpdateStatusHub *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "demoUpdateCompleted.", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v5, "delegates"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A9890;
  v10[3] = &unk_10013FD68;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  objc_sync_exit(v5);
}

- (void)demoUpdateFailed:(id)a3
{
  id v4;
  MSDDemoUpdateStatusHub *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  if ((objc_msgSend(v6, "isOfflineMode") & 1) == 0)
    objc_msgSend(v6, "saveOperationError:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateStatusHub delegates](v5, "delegates"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A99AC;
  v9[3] = &unk_10013FD68;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  objc_sync_exit(v5);
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end

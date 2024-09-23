@implementation TransparencyPeerOverrides

- (TransparencyPeerOverrides)init
{
  TransparencyPeerOverrides *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransparencyPeerOverrides;
  v2 = -[TransparencyPeerOverrides init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    -[TransparencyPeerOverrides setStorage:](v2, "setStorage:", v3);

  }
  return v2;
}

- (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1002A7B28 != -1)
    dispatch_once(&qword_1002A7B28, &stru_10024BEC8);
  v11 = (void *)qword_1002A7B30;
  if (os_log_type_enabled((os_log_t)qword_1002A7B30, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2048;
    v22 = objc_msgSend(v10, "uiStatus");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setPeerOverride %@ %@ %lu", buf, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  v16[0] = v8;
  v16[1] = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v15);

  objc_sync_exit(v13);
}

- (void)clearPeerOverride:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (qword_1002A7B28 != -1)
    dispatch_once(&qword_1002A7B28, &stru_10024BEE8);
  v8 = qword_1002A7B30;
  if (os_log_type_enabled((os_log_t)qword_1002A7B30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clearPeerOverride %@ %@", buf, 0x16u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  v12[0] = v6;
  v12[1] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_sync_exit(v9);
}

- (id)listPeerOverrides
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
  objc_sync_exit(v3);

  return v4;
}

- (void)applyPeerOverrides:(id)a3 peer:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v6 = a3;
  v7 = a4;
  v8 = os_variant_allows_internal_security_policies("com.apple.Transparency");
  if (v7)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uri"));
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uri"));
          v30[0] = v11;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));
          v30[1] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
          objc_sync_enter(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v13));
          v17 = v16 == 0;

          if (!v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyPeerOverrides storage](self, "storage"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v13));

            if (qword_1002A7B28 != -1)
              dispatch_once(&qword_1002A7B28, &stru_10024BF08);
            v20 = (id)qword_1002A7B30;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_msgSend(v19, "uiStatus");
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uri"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "application"));
              v24 = 134218498;
              v25 = v21;
              v26 = 2112;
              v27 = v22;
              v28 = 2112;
              v29 = v23;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "applyPeerOverrides setting UI status %lu for %@, %@", (uint8_t *)&v24, 0x20u);

            }
            objc_msgSend(v6, "setUiStatus:", objc_msgSend(v19, "uiStatus"));

          }
          objc_sync_exit(v14);

        }
      }
    }
  }

}

- (NSMutableDictionary)storage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end

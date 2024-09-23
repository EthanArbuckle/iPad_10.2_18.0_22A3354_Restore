@implementation W5PeerDatabaseListener

- (W5PeerDatabaseListener)initWithDatabaseAccessManager:(id)a3
{
  id v5;
  W5PeerDatabaseListener *v6;
  W5PeerDatabaseListener *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  _WORD v12[8];
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)W5PeerDatabaseListener;
  v6 = -[W5PeerDatabaseListener init](&v13, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_databaseManager, a3), !v7->_databaseManager))
  {

    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 0;
      v11 = 2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] init error!", v12, v11);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  W5PeerDatabaseResponsePayload *v10;
  void *v11;
  void *v12;
  W5DatabaseManager *databaseManager;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v20;
  _BYTE v21[24];
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315906;
      *(_QWORD *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
      *(_WORD *)&v21[12] = 2112;
      *(_QWORD *)&v21[14] = v4;
      *(_WORD *)&v21[22] = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s: incoming request='%@', payload='%@' version='%@'", v21, 42);
    }

    v10 = objc_alloc_init(W5PeerDatabaseResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDatabaseListener currentVersion](self, "currentVersion")));
    -[W5PeerDatabaseResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerDatabaseResponsePayload setStatus:](v10, "setStatus:", 1);
    if (objc_msgSend(v7, "integerValue") == (id)1 || objc_msgSend(v7, "integerValue") == (id)2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchRequest"));

      if (v12)
      {
        databaseManager = self->_databaseManager;
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchRequest"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DatabaseManager performFetch:](databaseManager, "performFetch:", v14));
        -[W5PeerDatabaseResponsePayload setFetchedResults:](v10, "setFetchedResults:", v15);

      }
      else
      {
        v16 = sub_10008F56C();
        v14 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315394;
          *(_QWORD *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
          *(_WORD *)&v21[12] = 2112;
          *(_QWORD *)&v21[14] = v4;
          LODWORD(v20) = 22;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s: invalid fetchRequest %@", v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
        }
      }
    }
    else
    {
      v17 = sub_10008F56C();
      v14 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315394;
        *(_QWORD *)&v21[4] = "-[W5PeerDatabaseListener handleClientRequest:]";
        *(_WORD *)&v21[12] = 2112;
        *(_QWORD *)&v21[14] = v7;
        LODWORD(v20) = 22;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] %s: Unsupported W5PeerDatabaseRequestVersion %@", v21, v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
      }
    }

    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
    ((void (**)(_QWORD, W5PeerDatabaseResponsePayload *, _QWORD))v18)[2](v18, v10, 0);

  }
  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(W5PeerDatabaseRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.wifi.peer.dbQuery");
}

- (int64_t)currentVersion
{
  return 2;
}

- (W5DatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end

@implementation EvuyxgzfZZU4un3X

+ (id)sharedInstance
{
  if (qword_100511540 != -1)
    dispatch_once(&qword_100511540, &stru_1004CE970);
  sub_10000A4B4();
  return (id)qword_100511538;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unsigned int v10;
  int v11;
  QwDGuEabMS2vnWkj *v12;
  QwDGuEabMS2vnWkj *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  unsigned __int8 v29;
  id buf;

  v5 = a3;
  v6 = a4;
  v29 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NNHzG8lq6aMxZpXq));
  objc_msgSend(v6, "setExportedInterface:", v7);

  v27 = 0u;
  v28 = 0u;
  if (v6)
    objc_msgSend(v6, "auditToken");
  v8 = (void *)qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "processIdentifier");
    LODWORD(buf) = 67240192;
    HIDWORD(buf) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "connection from %{public}d", (uint8_t *)&buf, 8u);

  }
  LOBYTE(buf) = 0;
  sub_10027ADA4();
  v11 = buf;
  if ((_BYTE)buf)
  {
    objc_initWeak(&buf, v6);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000DD10;
    v25[3] = &unk_1004CE998;
    objc_copyWeak(&v26, &buf);
    objc_msgSend(v6, "setInvalidationHandler:", v25, &buf);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000DDF4;
    v23[3] = &unk_1004CE998;
    objc_copyWeak(&v24, &buf);
    objc_msgSend(v6, "setInterruptionHandler:", v23);
    v12 = [QwDGuEabMS2vnWkj alloc];
    v13 = -[QwDGuEabMS2vnWkj initWithsk6s81V5EsZL9icr:](v12, "initWithsk6s81V5EsZL9icr:", v29);
    objc_msgSend(v6, "setExportedObject:", v13);

    objc_msgSend(v6, "resume");
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);
  }
  else
  {
    v14 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D6E2C(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  return v11 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

@end

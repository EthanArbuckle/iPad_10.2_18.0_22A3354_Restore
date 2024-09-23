@implementation DSStorageDataServiceDelegate

- (DSStorageDataServiceDelegate)init
{
  DSStorageDataServiceDelegate *v2;
  NSMutableSet *v3;
  NSMutableSet *connections;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSStorageDataServiceDelegate;
  v2 = -[DSStorageDataServiceDelegate init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v3;

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  STStorageDataService *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id buf;

  v6 = a3;
  v7 = a4;
  v8 = sub_100002C24();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = objc_msgSend(v7, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection from pid %d ", (uint8_t *)&buf, 8u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.storage-data")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___STStorageDataServiceProtocol));
    objc_msgSend(v7, "setExportedInterface:", v11);

    v12 = objc_opt_new(STStorageDataService);
    objc_msgSend(v7, "setExportedObject:", v12);
    objc_msgSend(v7, "resume");
    -[NSMutableSet addObject:](self->_connections, "addObject:", v7);
    objc_initWeak(&buf, v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100002FC4;
    v15[3] = &unk_100004178;
    objc_copyWeak(&v16, &buf);
    v15[4] = self;
    objc_msgSend(v7, "setInvalidationHandler:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&buf);
  }
  else
  {
    v13 = sub_100002C24();
    v12 = (STStorageDataService *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      sub_1000031A4(v7, &v12->super);
  }

  return v10 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
}

@end

@implementation RPAngelProxy

+ (id)sharedInstance
{
  if (qword_100095C70 != -1)
    dispatch_once(&qword_100095C70, &stru_100081D88);
  return (id)qword_100095C68;
}

- (id)connectionManagerQueue
{
  if (qword_100095C80 != -1)
    dispatch_once(&qword_100095C80, &stru_100081DA8);
  return (id)qword_100095C78;
}

- (id)getBSServiceInterface
{
  if (qword_100095C90 != -1)
    dispatch_once(&qword_100095C90, &stru_100081DC8);
  return (id)qword_100095C88;
}

- (RPAngelProxy)init
{
  RPAngelProxy *v2;
  RPAngelProxy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPAngelProxy;
  v2 = -[RPAngelProxy init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RPAngelProxy setupConnection](v2, "setupConnection");
  return v3;
}

- (void)setupConnection
{
  void *v3;
  BSServiceConnectionClient *v4;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionEndpoint endpointForMachName:service:instance:](BSServiceConnectionEndpoint, "endpointForMachName:service:instance:", CFSTR("com.apple.ReplayKitAngel.mach"), CFSTR("com.apple.ReplayKitAngel.session"), 0));
  if (v3)
  {
    v4 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection connectionWithEndpoint:](BSServiceConnection, "connectionWithEndpoint:", v3));
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100037790;
    v7[3] = &unk_100081E78;
    v7[4] = self;
    -[BSServiceConnectionClient configureConnection:](v6, "configureConnection:", v7);
    -[BSServiceConnectionClient activate](self->_connection, "activate");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy setupConnection]";
    v10 = 1024;
    v11 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel endpoint nil", buf, 0x12u);
  }

}

- (void)hideAndStopRecordingBanner
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    v10 = 1024;
    v11 = 106;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5));

  if (v6)
  {
    objc_msgSend(v6, "hideAndStopRecordingBanner");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    v10 = 1024;
    v11 = 113;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  BSServiceConnectionClient *connection;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
    v22 = 1024;
    v23 = 118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v19 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v16));

  if (v17)
  {
    objc_msgSend(v17, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:", v10, v11, v12, v13);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
      v22 = 1024;
      v23 = 125;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5800, 0));
    v13[2](v13, v18);

  }
}

- (void)updateTimer:(id)a3
{
  id v4;
  BSServiceConnectionClient *connection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPAngelProxy updateTimer:]";
    v12 = 1024;
    v13 = 132;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (v4)
  {
    connection = self->_connection;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v7));

    if (v8)
    {
      objc_msgSend(v8, "updateTimer:", v4);
    }
    else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[RPAngelProxy updateTimer:]";
      v12 = 1024;
      v13 = 144;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }

  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000507E8();
  }

}

- (void)connectToAngelWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  BSServiceConnectionClient *connection;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
    v13 = 1024;
    v14 = 149;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v7));

  if (v8)
  {
    objc_msgSend(v8, "connectToAngelWithCompletionHandler:", v4);
  }
  else
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
      v13 = 1024;
      v14 = 156;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5800, 0));
    v4[2](v4, 0, v9);

  }
}

- (void)enableCameraPip
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    v10 = 1024;
    v11 = 163;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5));

  if (v6)
  {
    objc_msgSend(v6, "enableCameraPip");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    v10 = 1024;
    v11 = 168;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)disableCameraPip
{
  BSServiceConnectionClient *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    v10 = 1024;
    v11 = 173;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC")));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](connection, "remoteTargetWithLaunchingAssertionAttributes:", v5));

  if (v6)
  {
    objc_msgSend(v6, "disableCameraPip");
  }
  else if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    v10 = 1024;
    v11 = 178;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }

}

- (void)pauseCurrentSystemSession
{
  void *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPAngelProxy pauseCurrentSystemSession]";
    v6 = 1024;
    v7 = 184;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getClientWithBundleID:", CFSTR("com.apple.springboard")));

  objc_msgSend(v3, "pauseCurrentActiveSession");
}

- (void)resumeCurrentSystemSession
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "-[RPAngelProxy resumeCurrentSystemSession]";
    v8 = 1024;
    v9 = 192;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](RPClientManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getClientWithBundleID:", CFSTR("com.apple.springboard")));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000388CC;
  v5[3] = &unk_1000812F0;
  v5[4] = self;
  objc_msgSend(v4, "resumeSystemRecordingWithCompletionHandler:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

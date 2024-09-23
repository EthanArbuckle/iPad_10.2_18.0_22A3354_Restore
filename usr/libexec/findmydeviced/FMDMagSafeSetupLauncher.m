@implementation FMDMagSafeSetupLauncher

- (FMDMagSafeSetupLauncher)init
{
  FMDMagSafeSetupLauncher *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDMagSafeSetupLauncher;
  v2 = -[FMDMagSafeSetupLauncher init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_launchSetupFlow:", CFSTR("com.apple.accessories.connection.passedMFi4Auth"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_launchSetupFlow:", CFSTR("com.apple.icloud.FindMy.addMagSafeAccessory"), 0);

  }
  return v2;
}

- (void)_launchSetupFlow:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  id v15;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got notification %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryProxyForId:withDelegate:](FMDExtExtensionHelper, "getAccessoryProxyForId:withDelegate:", CFSTR("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FMDMagSafeExtension"), 0));
  -[FMDMagSafeSetupLauncher setSetupAgent:](self, "setSetupAgent:", v7);

  v13[0] = CFSTR("receivedNotificaiton");
  v12[0] = CFSTR("context");
  v12[1] = CFSTR("notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeSetupLauncher setupAgent](self, "setupAgent"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051388;
  v11[3] = &unk_1002C1690;
  v11[4] = self;
  objc_msgSend(v10, "launchSetupModuleWithInfo:withCompletion:", v9, v11);

}

- (FMDExtAccessoryProtocol)setupAgent
{
  return self->_setupAgent;
}

- (void)setSetupAgent:(id)a3
{
  objc_storeStrong((id *)&self->_setupAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAgent, 0);
}

@end

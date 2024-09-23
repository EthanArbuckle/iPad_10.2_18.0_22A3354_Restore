@implementation APIDAccountsReconciler

+ (void)forceReconcile:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  v4 = APLogForCategory(17);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Going to forceReconcile.", buf, 2u);
  }

  v6 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.ap.adprivacyd.idmanager"), 4096);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___APIDAccountsReconciler_XPC));
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  objc_msgSend(v6, "resume");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxy"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AF5FC;
  v11[3] = &unk_100213FB8;
  v12 = v6;
  v13 = v3;
  v9 = v6;
  v10 = v3;
  objc_msgSend(v8, "forceReconcile:", v11);

}

@end

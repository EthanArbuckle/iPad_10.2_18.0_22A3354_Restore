@implementation SDCollaborationUserDefaultsServer

- (id)machServiceName
{
  return SFCollaborationUserDefaultsManagerServiceName;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  uint8_t v12[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.collaboration.userdefaults")));
  v6 = objc_opt_class(NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection for SDCollaborationUserDefaultsServer: YES", v12, 2u);
    }
    v9 = 1;
  }
  else
  {
    v10 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001A9F0(v3, v8);
    v9 = 0;
  }

  return v9;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFCollaborationUserDefaultsInterface);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFCollaborationUserDefaultsInterface);
}

- (void)connectionEstablished:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connectionEstablished for SDCollaborationUserDefaultsServer", v5, 2u);
  }

}

- (void)connectionInvalidated:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connectionInvalidated for SDCollaborationUserDefaultsServer", v5, 2u);
  }

}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  id v8;

  v5 = (void (**)(id, id))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFCollaborationUserDefaults sharedDefaults](SFCollaborationUserDefaults, "sharedDefaults"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingCollaborativeModeForContentIdentifier:", v6));

  v5[2](v5, v8);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[SFCollaborationUserDefaults sharedDefaults](SFCollaborationUserDefaults, "sharedDefaults"));
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v8, "setCollaborativeMode:contentIdentifier:", v7, v5);
}

@end

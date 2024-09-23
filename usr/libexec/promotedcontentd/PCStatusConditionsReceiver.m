@implementation PCStatusConditionsReceiver

- (PCStatusConditionsReceiver)initWithBundleID:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  PCStatusConditionsReceiver *v9;
  PCStatusConditionsReceiver *v10;
  uint64_t v11;
  PCStatusConditionsService *conditionsService;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PCStatusConditionsReceiver;
  v9 = -[PCStatusConditionsReceiver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a4);
    objc_storeStrong((id *)&v10->_bundleID, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[PCStatusConditionsService sharedInstance](PCStatusConditionsService, "sharedInstance"));
    conditionsService = v10->_conditionsService;
    v10->_conditionsService = (PCStatusConditionsService *)v11;

  }
  return v10;
}

+ (BOOL)validateWhitelistingForCondition:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  unsigned __int8 v12;
  void *v13;
  uint8_t v15[16];

  v5 = a3;
  v6 = a4;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionsDefaultsSettings settings](PCStatusConditionsDefaultsSettings, "settings")), v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "whitelistingsDisabled")), v9 = objc_msgSend(v8, "isEqualToNumber:", &off_10022A110), v8, v7, v9))
  {
    v10 = APLogForCategory(7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "This is an internal build and whitelisting of status conditions has been disabled. Proceeding with operation.", v15, 2u);
    }

    v12 = 1;
  }
  else
  {
    if (qword_10026D140 != -1)
      dispatch_once(&qword_10026D140, &stru_100218D50);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10026D138, "objectForKey:", v6));
    v12 = objc_msgSend(v13, "containsObject:", v5);

  }
  return v12;
}

+ (BOOL)validateWhitelistingForRead:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  uint8_t v11[16];

  v3 = a3;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionsDefaultsSettings settings](PCStatusConditionsDefaultsSettings, "settings")), v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "whitelistingsDisabled")), v6 = objc_msgSend(v5, "isEqualToNumber:", &off_10022A110), v5, v4, v6))
  {
    v7 = APLogForCategory(7);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "This is an internal build and whitelisting of status condition reads has been disabled. Proceeding with operation.", v11, 2u);
    }

    v9 = 1;
  }
  else
  {
    if (qword_10026D150 != -1)
      dispatch_once(&qword_10026D150, &stru_100218D70);
    v9 = objc_msgSend((id)qword_10026D148, "containsObject:", v3);
  }

  return v9;
}

- (void)setStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001777B8;
  block[3] = &unk_100212FA8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)clearStatusCondition:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177C08;
  block[3] = &unk_100212FA8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100178080;
  v16[3] = &unk_100218DE8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  dispatch_async(v12, v16);

}

- (void)_isStatusConditionRegistered:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _BOOL8, id);
  id v8;
  id v9;
  PCBooleanCondition *v10;
  void *v11;
  PCBooleanCondition *v12;
  _BOOL8 v13;
  id v14;
  id v15;

  v7 = (void (**)(id, _BOOL8, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = [PCBooleanCondition alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  v12 = -[PCBooleanCondition initWithType:value:identifier:](v10, "initWithType:value:identifier:", CFSTR("sc"), v11, v8);
  v15 = 0;
  v13 = +[PCStatusConditionStorage isStatusConditionRegistered:error:](PCStatusConditionStorage, "isStatusConditionRegistered:error:", v12, &v15);
  v14 = v15;
  if (v7)
    v7[2](v7, v13, v14);

}

- (BOOL)hasReadEntitlement
{
  return -[APXPCConnection hasEntitlement:](self->_connection, "hasEntitlement:", CFSTR("com.apple.ap.adservicesd.statusconditionclient.allow_read"));
}

- (BOOL)hasWriteEntitlement
{
  return -[APXPCConnection hasEntitlement:](self->_connection, "hasEntitlement:", CFSTR("com.apple.ap.adservicesd.statusconditionclient.allow_write"));
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APStatusConditions_XPC;
}

- (void)connectionInterrupted
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(44);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Connection to client for StatusConditions was interrupted.", v4, 2u);
  }

}

- (void)connectionInvalidated
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = APLogForCategory(44);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection to client for StatusConditions was invalidated.", v4, 2u);
  }

}

- (id)requiredEntitlements
{
  return +[NSArray array](NSArray, "array");
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (PCStatusConditionsService)conditionsService
{
  return self->_conditionsService;
}

- (void)setConditionsService:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsService, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

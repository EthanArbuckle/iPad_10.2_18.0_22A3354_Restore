@implementation NEHelperRelayManager

- (NEHelperRelayManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection;
  void *v5;
  NEHelperRelayManager *v6;
  objc_super v8;

  remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (+[NEHelperRelayManager verifyEntitlement:](NEHelperRelayManager, "verifyEntitlement:", v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)NEHelperRelayManager;
    self = -[NEHelperRelayManager init](&v8, "init");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t uint64;
  uint64_t v9;
  const void *data;
  void *v11;
  const uint8_t *uuid;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;
  _BYTE buf[24];

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ processing Relay Manager message", buf, 0xCu);
  }

  uint64 = xpc_dictionary_get_uint64(v4, "relay-command");
  if (uint64 - 1 <= 1)
  {
    v9 = uint64;
    *(_QWORD *)buf = 0;
    data = xpc_dictionary_get_data(v4, "relay-persistent-reference", (size_t *)buf);
    if (data && *(_QWORD *)buf)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data));
      uuid = xpc_dictionary_get_uuid(v4, "relay-config-id");
      if (uuid)
      {
        v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uuid);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000048D0;
        v15[3] = &unk_100038C48;
        v15[4] = self;
        v16 = v4;
        v18 = v9;
        v17 = v11;
        objc_msgSend(v14, "loadConfigurationWithID:withCompletionQueue:handler:", v13, &_dispatch_main_q, v15);

      }
      else
      {
        sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
      }

    }
    else
    {
      sub_1000037E4((uint64_t)NEHelperServer, v4, 22, 0);
    }
  }

}

+ (BOOL)verifyEntitlement:(id)a3
{
  return 1;
}

@end

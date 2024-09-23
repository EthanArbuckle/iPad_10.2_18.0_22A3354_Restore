@implementation NEHelperTest

- (NEHelperTest)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NEHelperTest *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const char *v17;

  remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  v6 = sub_10000FA04((uint64_t)NEHelperServer, v5, (uint64_t)"com.apple.private.networkextension.test-control");
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)NEHelperTest;
    self = -[NEHelperTest init](&v13, "init");
    v8 = self;
  }
  else
  {
    v9 = ne_log_obj(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_10000FA60((uint64_t)NEHelperServer, v5);
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2080;
      v17 = "com.apple.private.networkextension.test-control";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Denying test connection because %@ does not have the %s entitlement", buf, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;
  const char *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *string;
  id v13;
  void *v14;
  const char *v15;
  int64_t v16;
  xpc_object_t xdict;

  xdict = a3;
  uint64 = xpc_dictionary_get_uint64(xdict, "operation");
  if (uint64 == 3)
  {
    string = xpc_dictionary_get_string(xdict, "app-bundle-id");
    if (string)
    {
      v5 = xpc_string_create(string);
      v6 = xpc_array_create(0, 0);
      xpc_array_append_value(v6, v5);
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(v7, (const char *)objc_msgSend(CFSTR("bundleIDs"), "UTF8String"), v6);
      v8 = xpc_dictionary_create(0, 0, 0);
      v9 = v8;
      v10 = _xpc_event_key_name;
      v11 = "ApplicationInstalled";
      goto LABEL_8;
    }
LABEL_14:
    v16 = 22;
    goto LABEL_15;
  }
  if (uint64 != 2)
  {
    if (uint64 == 1)
    {
      v4 = xpc_dictionary_get_string(xdict, "app-bundle-id");
      if (v4)
      {
        v5 = xpc_string_create(v4);
        v6 = xpc_array_create(0, 0);
        xpc_array_append_value(v6, v5);
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_value(v7, (const char *)objc_msgSend(CFSTR("bundleIDs"), "UTF8String"), v6);
        v8 = xpc_dictionary_create(0, 0, 0);
        v9 = v8;
        v10 = _xpc_event_key_name;
        v11 = "ApplicationUninstalled";
LABEL_8:
        xpc_dictionary_set_string(v8, v10, v11);
        xpc_dictionary_set_value(v9, "UserInfo", v7);
        v13 = sub_10000DDE4((uint64_t)NEHelperServer);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        sub_10000E350(v14, v9, "com.apple.distnoted.matching");

        goto LABEL_12;
      }
    }
    goto LABEL_14;
  }
  v15 = xpc_dictionary_get_string(xdict, "app-bundle-id");
  if (!v15)
    goto LABEL_14;
  if (!*v15)
  {
    sub_100020368((uint64_t)NEHelperConfigurationManager, 0);
    goto LABEL_13;
  }
  v5 = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
  sub_100020368((uint64_t)NEHelperConfigurationManager, v5);
LABEL_12:

LABEL_13:
  v16 = 0;
LABEL_15:
  sub_1000037E4((uint64_t)NEHelperServer, xdict, v16, 0);

}

@end

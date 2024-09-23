@implementation NEHelperHotspotConfigurationManager

- (NEHelperHotspotConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NEHelperHotspotConfigurationManager *v10;
  uint64_t v11;
  NSString *bundleID;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  NEHelperHotspotConfigurationManager *v16;
  pid_t pid;
  int v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  objc_super v27;
  uint8_t v28[4];
  id v29;
  __int16 v30;
  uint8_t *v31;
  __int16 v32;
  pid_t v33;
  uint8_t buf[4];
  NSString *v35;

  v4 = a3;
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)(id)objc_claimAutoreleasedReturnValue(remote_connection);
  v7 = objc_opt_self(NEHelperHotspotConfigurationManager);
  v8 = (void *)xpc_connection_copy_entitlement_value(v6, "com.apple.developer.networking.HotspotConfiguration");
  v9 = v8;
  if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v9))
  {
    pid = xpc_connection_get_pid(v6);
    v18 = proc_name(pid, buf, 0x100u);
    v19 = ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v18 < 1)
    {
      if (v21)
      {
        *(_DWORD *)v28 = 138412546;
        v29 = (id)objc_opt_class(v7);
        v30 = 1024;
        LODWORD(v31) = pid;
        v22 = v29;
        v23 = "%@ process %d is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
        v24 = v20;
        v25 = 18;
        goto LABEL_18;
      }
    }
    else if (v21)
    {
      *(_DWORD *)v28 = 138412802;
      v29 = (id)objc_opt_class(v7);
      v30 = 2080;
      v31 = buf;
      v32 = 1024;
      v33 = pid;
      v22 = v29;
      v23 = "%@ process %s[%d] is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
      v24 = v20;
      v25 = 28;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, v28, v25);

    }
    v16 = 0;
    goto LABEL_16;
  }

  v27.receiver = self;
  v27.super_class = (Class)NEHelperHotspotConfigurationManager;
  v10 = -[NEHelperHotspotConfigurationManager init](&v27, "init");
  if (v10)
  {
    objc_opt_self(NEHelperHotspotConfigurationManager);
    if (qword_100042C08 != -1)
      dispatch_once(&qword_100042C08, &stru_100038D18);
    v11 = NECopySigningIdentifierForXPCMessage(v4);
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    v13 = ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v10->_bundleID;
      *(_DWORD *)buf = 138412290;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Created new Hotspot configuration delegate with bundleID = %@", buf, 0xCu);
    }

  }
  self = v10;
  v16 = self;
LABEL_16:

  return v16;
}

- (NSString)name
{
  return self->_bundleID;
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_100042BF8;
}

- (void)handleMessage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_10000826C((uint64_t)self, v4);
  if (!v5)
  {
    v7 = ne_log_obj(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = (id)objc_opt_class(self);
      v9 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ failed to process request.", (uint8_t *)&v10, 0xCu);

    }
    if (xpc_dictionary_get_BOOL(v4, "IsResponseExpected"))
      sub_1000037E4((uint64_t)NEHelperServer, v4, 107, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end

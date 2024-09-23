@implementation MSDLocalEventStreamHandler

+ (id)sharedInstance
{
  if (qword_1001753F8 != -1)
    dispatch_once(&qword_1001753F8, &stru_10013EF18);
  return (id)qword_1001753F0;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  _QWORD handler[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageQueue"));

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100064F94;
  handler[3] = &unk_10013E3B0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.fsevents.matching", v4, handler);

}

- (void)handleEvent:(id)a3 fromStream:(const char *)a4
{
  id v5;
  xpc_type_t type;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *string;
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;

  v5 = a3;
  type = xpc_get_type(v5);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    v7 = (uint64_t)type;
    v8 = sub_1000605D0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C1D4C(v7, v9);
    goto LABEL_4;
  }
  string = xpc_dictionary_get_string(v5, _xpc_event_key_name);
  v11 = sub_1000605D0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = string;
    v15 = 2080;
    v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received XPC event of name: %s from stream: %s", (uint8_t *)&v13, 0x16u);
  }

  if (!strncmp(a4, "com.apple.fsevents.matching", 0x1CuLL)
    && !strncmp(string, "DemoSettingsManagedPreferencesChanged", 0x26uLL))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    -[NSObject toggleSEPDemoModeOnManagedPreferencesChange](v9, "toggleSEPDemoModeOnManagedPreferencesChange");
LABEL_4:

  }
}

@end

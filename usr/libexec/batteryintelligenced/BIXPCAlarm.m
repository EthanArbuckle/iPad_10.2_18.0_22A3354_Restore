@implementation BIXPCAlarm

+ (void)setAlarmWithName:(id)a3 withClock:(int)a4 afterSeconds:(double)a5 wakeUpAP:(BOOL)a6
{
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;

  v9 = a3;
  if (!qword_100035298)
  {
    v10 = sub_10001714C("BIXPCAlarm");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)qword_100035298;
    qword_100035298 = v11;

  }
  v13 = xpc_dictionary_create(0, 0, 0);
  v14 = v13;
  if (v13)
  {
    xpc_dictionary_set_BOOL(v13, "ShouldWake", a6);
    switch(a4)
    {
      case 0:
        v18 = (uint64_t)(((double)time(0) + a5) * 1000000000.0);
        xpc_dictionary_set_string(v14, "Type", "Walltime");
        xpc_dictionary_set_date(v14, "Date", v18);
LABEL_13:
        xpc_set_event("com.apple.alarm", objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), v14);
        goto LABEL_16;
      case 8:
        v15 = (unint64_t)((double)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + a5 * 1000000000.0);
        v16 = "Uptime";
        goto LABEL_12;
      case 4:
        v15 = (unint64_t)((double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) + a5 * 1000000000.0);
        v16 = "Monotonic";
LABEL_12:
        xpc_dictionary_set_string(v14, "Type", v16);
        xpc_dictionary_set_uint64(v14, "Date", v15);
        goto LABEL_13;
    }
    v19 = qword_100035298;
    if (os_log_type_enabled((os_log_t)qword_100035298, OS_LOG_TYPE_ERROR))
      sub_10001F990(v19);
  }
  else
  {
    v17 = qword_100035298;
    if (os_log_type_enabled((os_log_t)qword_100035298, OS_LOG_TYPE_DEBUG))
      sub_10001F950(v17);
  }
LABEL_16:

}

+ (void)deleteAlarmWithName:(id)a3
{
  xpc_set_event("com.apple.alarm", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0);
}

+ (id)getNameForEvent:(id)a3
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a3, _xpc_event_key_name));
}

+ (void)handleAlarmForEvent:(id)a3
{
  id v4;
  xpc_object_t reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getNameForEvent:", v4));
  reply = xpc_dictionary_create_reply(v4);
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  if (reply && v7)
    xpc_connection_send_message(v7, reply);
  objc_msgSend(a1, "deleteAlarmWithName:", v8);

}

@end

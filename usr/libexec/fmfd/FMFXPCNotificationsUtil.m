@implementation FMFXPCNotificationsUtil

+ (void)handleDarwinNotificationsWithHandlers:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C934;
  v8[3] = &unk_10009A0D0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002CB34;
  v6[3] = &unk_10009A0F8;
  v7 = v4;
  v5 = v7;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v6);

}

+ (void)handleDistributedNotificationsWithHandlers:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002CCAC;
  v8[3] = &unk_10009A0D0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002CEAC;
  v6[3] = &unk_10009A0F8;
  v7 = v4;
  v5 = v7;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, v6);

}

@end

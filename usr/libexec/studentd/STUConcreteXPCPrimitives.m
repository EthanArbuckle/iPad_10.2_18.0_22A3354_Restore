@implementation STUConcreteXPCPrimitives

- (void)registerHandlerForNotificationEventStream:(id)a3
{
  id v3;
  _QWORD handler[4];
  id v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000B00C;
  handler[3] = &unk_1000C9AD8;
  v5 = a3;
  v3 = v5;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

}

- (void)registerHandlerForFilePathKeepAliveEventStream:(id)a3
{
  id v3;
  _QWORD handler[4];
  id v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000B114;
  handler[3] = &unk_1000C9AD8;
  v5 = a3;
  v3 = v5;
  xpc_set_event_stream_handler("com.apple.fsevents.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

}

- (id)listenerForMachServiceName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v3);

  return v4;
}

- (id)valueForEntitlement:(id)a3 onConnection:(id)a4
{
  return _objc_msgSend(a4, "valueForEntitlement:", a3);
}

@end

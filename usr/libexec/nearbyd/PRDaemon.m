@implementation PRDaemon

- (PRDaemon)init
{
  PRDaemon *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *eventQueue;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[3];
  _QWORD *v11;

  v9.receiver = self;
  v9.super_class = (Class)PRDaemon;
  v2 = -[PRDaemon init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nearbyd.eventQueue", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

    v5 = sub_1002CA108();
    v10[0] = off_1007FB370;
    v11 = v10;
    sub_1002CA198((uint64_t)v5, (uint64_t)v10);
    v6 = v11;
    if (v11 == v10)
    {
      v7 = 4;
      v6 = v10;
      goto LABEL_6;
    }
    if (v11)
    {
      v7 = 5;
LABEL_6:
      (*(void (**)(void))(*v6 + 8 * v7))();
    }
  }
  return v2;
}

- (void)run
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] run", buf, 2u);
  }
  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for iokit xpc events", v9, 2u);
  }
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)self->_eventQueue, &stru_1007FB2D8);
  -[PRDaemon checkForUnlockSinceBoot](self, "checkForUnlockSinceBoot");
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for notifyd xpc events", v8, 2u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_eventQueue, &stru_1007FB2F8);
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for CBDiscovery xpc events", v7, 2u);
  }
  xpc_set_event_stream_handler("com.apple.bluetooth.discovery", (dispatch_queue_t)self->_eventQueue, &stru_1007FB318);
  -[PRDaemon startServices](self, "startServices");
}

- (void)startServices
{
  NSObject *v3;
  PRXPCActivityManager *v4;
  PRXPCActivityManager *xpcActivityManager;
  PRXPCServicesManager *v6;
  PRXPCServicesManager *xpcManager;
  uint8_t v8[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] starting services", v8, 2u);
  }
  v4 = -[PRXPCActivityManager initWithQueue:]([PRXPCActivityManager alloc], "initWithQueue:", self->_eventQueue);
  xpcActivityManager = self->_xpcActivityManager;
  self->_xpcActivityManager = v4;

  v6 = objc_alloc_init(PRXPCServicesManager);
  xpcManager = self->_xpcManager;
  self->_xpcManager = v6;

  -[PRXPCServicesManager startServices](self->_xpcManager, "startServices");
}

- (void)checkForUnlockSinceBoot
{
  OS_dispatch_queue *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000476D0;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)eventQueue, block);
}

- (void)deviceHasUnlockedSinceBoot
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047918;
  block[3] = &unk_1007FB340;
  block[4] = self;
  if (qword_100853EE0 != -1)
    dispatch_once(&qword_100853EE0, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end

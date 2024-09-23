@implementation CLGatheringXPCServer

- (CLGatheringXPCServer)initWithQueue:(id)a3 settings:(id)a4 advStore:(id)a5 btClient:(id)a6
{
  CLGatheringXPCServer *v10;
  NSXPCListener *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLGatheringXPCServer;
  v10 = -[CLGatheringXPCServer init](&v13, "init");
  if (v10)
  {
    v10->_queue = (OS_dispatch_queue *)a3;
    v10->_advStore = (CLGatheringDiscoveryStore *)a5;
    v10->_btClient = (CLGatheringBluetoothClient *)a6;
    v10->_settings = (CLGatheringSettings *)a4;
    v11 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.locationd.gathering"));
    v10->_listener = v11;
    -[NSXPCListener setDelegate:](v11, "setDelegate:", v10);
    -[NSXPCListener _setQueue:](v10->_listener, "_setQueue:", v10->_queue);
    -[NSXPCListener activate](v10->_listener, "activate");
  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v23;
  uint8_t *v24;
  _WORD v25[8];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  unsigned int v31;

  if (a4)
  {
    v6 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.adpd_gathering"));
    if (!v6
      || (v8 = v6, v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) == 0)
      || (objc_msgSend(v8, "BOOLValue") & 1) == 0)
    {
      v10 = objc_msgSend(a4, "processIdentifier");
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102159998);
      v11 = qword_1022A0158;
      if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 1026;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerGathering\", \"pid\":%{public}d}", buf, 0x18u);
        if (qword_1022A0150 != -1)
          dispatch_once(&qword_1022A0150, &stru_102159998);
      }
      v12 = qword_1022A0158;
      if (os_signpost_enabled((os_log_t)qword_1022A0158))
      {
        *(_DWORD *)buf = 68289282;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v30 = 1026;
        v31 = v10;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "process is not entitled to use CLLocationManagerGathering", "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerGathering\", \"pid\":%{public}d}", buf, 0x18u);
      }
    }
    objc_msgSend(a4, "setInterruptionHandler:", &stru_102159930);
    objc_msgSend(a4, "setInvalidationHandler:", &stru_102159950);
    objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLLocationManagerGatheringServerInterface));
    v13 = objc_msgSend(a4, "exportedInterface");
    v15 = objc_opt_class(NSArray, v14);
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(CLGatheringBleAdvertisement, v16), 0), "fetchAdvertisementsWithCompletion:", 0, 1);
    v17 = objc_msgSend(a4, "exportedInterface");
    v19 = objc_opt_class(NSArray, v18);
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, objc_opt_class(CLGatheringBleAdvertisement, v20), 0), "fetchAdvertisementsDetailedWithCompletion:", 0, 1);
    objc_msgSend(a4, "setExportedObject:", self);
    objc_msgSend(a4, "activate");
  }
  else
  {
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102159998);
    v21 = qword_1022A0158;
    if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Why didn't we get a connection?", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0150 != -1)
        dispatch_once(&qword_1022A0150, &stru_102159998);
      v25[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 17, "Why didn't we get a connection?", v25, 2);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 0, "-[CLGatheringXPCServer listener:shouldAcceptNewConnection:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
  }
  return a4 != 0;
}

- (void)fetchAdvertisementsWithCompletion:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  const char *v7;
  uint8_t *v8;
  _QWORD block[6];
  _WORD v10[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102159998);
  v5 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fetching advertisements history", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102159998);
    v10[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "fetching advertisements history", v10, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringXPCServer fetchAdvertisementsWithCompletion:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10089953C;
  block[3] = &unk_102159978;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAdvertisementsDetailedWithCompletion:(id)a3
{
  NSObject *v5;
  NSObject *queue;
  const char *v7;
  uint8_t *v8;
  _QWORD block[6];
  _WORD v10[8];
  uint8_t buf[1640];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102159998);
  v5 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fetching detailed advertisements history", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102159998);
    v10[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 2, "fetching detailed advertisements history", v10, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringXPCServer fetchAdvertisementsDetailedWithCompletion:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008998EC;
  block[3] = &unk_102159978;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)configure:(id)a3 withCompletion:(id)a4
{
  int var0;
  int var1;
  NSObject *v8;
  NSObject *queue;
  const char *v10;
  uint8_t *v11;
  _QWORD block[6];
  int v13;
  int v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;

  var0 = a3.var0;
  var1 = a3.var1;
  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_102159998);
  v8 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v19 = var0;
    v20 = 1024;
    v21 = var1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "configure with adv: %d scan: %d", buf, 0xEu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_102159998);
    v15[0] = 67109376;
    v15[1] = var0;
    v16 = 1024;
    v17 = var1;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 0, "configure with adv: %d scan: %d", v15, 14);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringXPCServer configure:withCompletion:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100899DB4;
  block[3] = &unk_1021380F8;
  block[4] = self;
  block[5] = a4;
  v13 = var0;
  v14 = var1;
  dispatch_async(queue, block);
}

@end

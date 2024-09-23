@implementation CLTileDownloadSchedulingService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_102305088 != -1)
    dispatch_once(&qword_102305088, &stru_1021597E0);
  return (id)qword_102305080;
}

- (CLTileDownloadSchedulingService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingService;
  return -[CLTileDownloadSchedulingService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTileDownloadSchedulingServiceProtocol, &OBJC_PROTOCOL___CLTileDownloadSchedulingClientProtocol);
}

- (void)dealloc
{
  objc_super v3;

  -[CLTileDownloadSchedulingService setClients:](self, "setClients:", 0);
  xpc_activity_unregister("com.apple.locationd.TileDownloadWifiReachability");
  xpc_activity_unregister("com.apple.locationd.TileDownloadCellReachability");
  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingService;
  -[CLTileDownloadSchedulingService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  objc_msgSend(-[CLTileDownloadSchedulingService universe](self, "universe"), "silo");
}

- (void)endService
{
  objc_msgSend(-[CLTileDownloadSchedulingService universe](self, "universe"), "silo");
}

- (void)requestForSchedulingTileDownload:(id)a3
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t *v9;
  __int128 v10;
  uint8_t buf[4];
  id v12;

  if ((-[NSMutableArray containsObject:](-[CLTileDownloadSchedulingService clients](self, "clients"), "containsObject:", a3) & 1) != 0)
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102159800);
    v5 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, warning, client is re-subscribing", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102159800);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "#tiledownloadscheduler, warning, client is re-subscribing");
LABEL_23:
      v9 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLTileDownloadSchedulingService requestForSchedulingTileDownload:]", "%s\n", v6);
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    -[NSMutableArray addObject:](-[CLTileDownloadSchedulingService clients](self, "clients"), "addObject:", a3);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102159800);
    v7 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v12 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, add client, count, %ld", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102159800);
      v8 = qword_1022A0028;
      -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "#tiledownloadscheduler, add client, count, %ld", &v10);
      goto LABEL_23;
    }
  }
  if (!-[CLTileDownloadSchedulingService hasRegisteredForWifiConnectivity](self, "hasRegisteredForWifiConnectivity"))
    -[CLTileDownloadSchedulingService scheduleDownloadsWithWifiConnectivity](self, "scheduleDownloadsWithWifiConnectivity");
  if (!-[CLTileDownloadSchedulingService hasRegisteredForCellularConnectivity](self, "hasRegisteredForCellularConnectivity"))-[CLTileDownloadSchedulingService scheduleDownloadsWithCellularConnectivity](self, "scheduleDownloadsWithCellularConnectivity");
}

- (void)stopListeningForForScheduledTileDownload:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  -[NSMutableArray removeObject:](-[CLTileDownloadSchedulingService clients](self, "clients"), "removeObject:", a3);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102159800);
  v4 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v11 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, client unsubscribe, count, %{public}ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102159800);
    v5 = qword_1022A0028;
    v8 = 134349056;
    v9 = -[NSMutableArray count](-[CLTileDownloadSchedulingService clients](self, "clients"), "count");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 2, "#tiledownloadscheduler, client unsubscribe, count, %{public}ld", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLTileDownloadSchedulingService stopListeningForForScheduledTileDownload:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)scheduleDownloadsWithWifiConnectivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  if (!-[CLTileDownloadSchedulingService hasRegisteredForWifiConnectivity](self, "hasRegisteredForWifiConnectivity"))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    sub_100896E5C(v3, 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100896F48;
    handler[3] = &unk_102144B48;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadWifiReachability", v3, handler);
    xpc_release(v3);
    -[CLTileDownloadSchedulingService setHasRegisteredForWifiConnectivity:](self, "setHasRegisteredForWifiConnectivity:", 1);
  }
}

- (void)scheduleDownloadsWithCellularConnectivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  if (!-[CLTileDownloadSchedulingService hasRegisteredForCellularConnectivity](self, "hasRegisteredForCellularConnectivity"))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    sub_100896E5C(v3, 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1008975BC;
    handler[3] = &unk_102144B48;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadCellReachability", v3, handler);
    xpc_release(v3);
    -[CLTileDownloadSchedulingService setHasRegisteredForCellularConnectivity:](self, "setHasRegisteredForCellularConnectivity:", 1);
  }
}

- (NSMutableArray)clients
{
  NSMutableArray *result;

  result = self->_clients;
  if (!result)
  {
    result = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_clients = result;
  }
  return result;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)hasRegisteredForWifiConnectivity
{
  return self->_hasRegisteredForWifiConnectivity;
}

- (void)setHasRegisteredForWifiConnectivity:(BOOL)a3
{
  self->_hasRegisteredForWifiConnectivity = a3;
}

- (BOOL)hasRegisteredForCellularConnectivity
{
  return self->_hasRegisteredForCellularConnectivity;
}

- (void)setHasRegisteredForCellularConnectivity:(BOOL)a3
{
  self->_hasRegisteredForCellularConnectivity = a3;
}

@end

@implementation CLRayTracingTileManagerAdapter

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
  if (qword_10230C3B8 != -1)
    dispatch_once(&qword_10230C3B8, &stru_10219E848);
  return (id)qword_10230C3B0;
}

- (CLRayTracingTileManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLRayTracingTileManagerAdapter;
  return -[CLRayTracingTileManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLRayTracingTileManagerProtocol, &OBJC_PROTOCOL___CLRayTracingTileManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_101093F44((uint64_t)-[CLRayTracingTileManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10193D8A0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_10230C3C8 != -1)
    dispatch_once(&qword_10230C3C8, &stru_10219E868);
  return byte_10230C3C0;
}

- (void)requestRTTiles:(double)a3 longitude:(double)a4 numberOfTiles:(int)a5
{
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_10219EA10);
  v9 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,requestRTTiles", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10219EA10);
    v12[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLRayTracingTileManager,requestRTTiles", v12, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter requestRTTiles:longitude:numberOfTiles:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  sub_101094390((uint64_t)-[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"), a5, a3, a4);
}

- (void)triggerPreCaching
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_10219EA10);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,triggerPreCaching", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10219EA10);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLRayTracingTileManager,triggerPreCaching", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter triggerPreCaching]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10109486C((uint64_t)-[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"));
}

- (void)cancelRequest
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_10219EA10);
  v3 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRayTracingTileManager,cancelRequest", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10219EA10);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLRayTracingTileManager,cancelRequest", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRayTracingTileManagerAdapter cancelRequest]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_101094BE8((uint64_t)-[CLRayTracingTileManagerAdapter adaptee](self, "adaptee"));
}

@end

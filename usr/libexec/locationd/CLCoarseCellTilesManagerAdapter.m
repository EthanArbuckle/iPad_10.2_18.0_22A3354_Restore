@implementation CLCoarseCellTilesManagerAdapter

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
  if (qword_102307AA8 != -1)
    dispatch_once(&qword_102307AA8, &stru_10217D738);
  return (id)qword_102307AA0;
}

- (CLCoarseCellTilesManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCoarseCellTilesManagerAdapter;
  return -[CLCoarseCellTilesManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCoarseCellTilesManagerProtocol, &OBJC_PROTOCOL___CLCoarseCellTilesManagerClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100CB0CC0((uint64_t)-[CLCoarseCellTilesManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101924AC0();
    sub_100CB0CC0(v3);
  }
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCoarseCellTilesManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCoarseCellTilesManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCoarseCellTilesManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  int v2;
  NSObject *v3;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  v2 = sub_100761E88();
  if (v2)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10217D9C0);
    v3 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLCoarseCellTilesManager is not supported in diagnostics mode", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10217D9C0);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 0, "CLCoarseCellTilesManager is not supported in diagnostics mode", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "+[CLCoarseCellTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
  }
  return v2 ^ 1;
}

- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6
{
  CFAbsoluteTime Current;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;

  if ((a3 - 6) < 3 || a3 == 12)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v13 = -[CLCoarseCellTilesManagerAdapter adaptee](self, "adaptee");
    v14 = a3;
    v16 = a4;
    v17 = a5;
    v15 = a6;
    v18 = Current;
  }
  else
  {
    v13 = (void *)sub_101924C38(self, a2, *(__n128 *)&a4, *(__n128 *)&a5);
  }
  sub_100CB1038((uint64_t)v13, v14, v15, v16, v17, v18);
}

@end

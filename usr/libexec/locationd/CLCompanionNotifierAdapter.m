@implementation CLCompanionNotifierAdapter

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
  if (qword_1023030B0 != -1)
    dispatch_once(&qword_1023030B0, &stru_102148BC8);
  return (id)qword_1023030A8;
}

- (CLCompanionNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCompanionNotifierAdapter;
  return -[CLCompanionNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLCompanionNotifierProtocol, &OBJC_PROTOCOL___CLCompanionNotifierClientProtocol);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCompanionNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCompanionNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLCompanionNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)beginService
{
  __objc2_class *v2;
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;

  v3 = self;
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10061E218((uint64_t)-[CLCompanionNotifierAdapter universe](self, "universe")));
  if (!objc_msgSend(v3, "notifier"))
  {
    sub_1019023D8();
LABEL_11:
    dispatch_once(&qword_10229FC70, &stru_102148E18);
    goto LABEL_6;
  }
  v4 = objc_msgSend(v3, "notifier");
  if (v4)
  else
    v3 = 0;
  v2 = DefaultObserver;
  if (qword_10229FC70 != -1)
    goto LABEL_11;
LABEL_6:
  v5 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v11 = qword_1023030C0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "companion idsService (beginService) %p", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (v2[79].vtable != (void *)-1)
      dispatch_once(&qword_10229FC70, &stru_102148E18);
    v8 = 134217984;
    v9 = qword_1023030C0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 2, "companion idsService (beginService) %p", &v8);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionNotifierAdapter(isSupported) beginService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  sub_10061EDFC((uint64_t)v3, qword_1023030C0);
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);

  qword_1023030C0 = 0;
}

- (void)setSilo:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_102148E18);
  v5 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLCompanionNotifier suspending silo until IDS becomes available (CLCompanionTransport)\"}", buf, 0x12u);
  }
  objc_msgSend(a3, "suspend");
  v8.receiver = self;
  v8.super_class = (Class)CLCompanionNotifierAdapter;
  -[CLCompanionNotifierAdapter setSilo:](&v8, "setSilo:", a3);
  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_102148E18);
  v6 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLCompanionNotifier waiting on IDS to become available (CLCompanionTransport)\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100620154;
  v7[3] = &unk_102148D60;
  v7[4] = a3;
  +[IDSService serviceWithIdentifier:completion:](IDSService, "serviceWithIdentifier:completion:", CFSTR("com.apple.private.alloy.location.motion"), v7);
}

@end

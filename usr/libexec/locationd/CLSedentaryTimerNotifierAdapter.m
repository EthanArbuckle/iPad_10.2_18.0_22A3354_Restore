@implementation CLSedentaryTimerNotifierAdapter

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
  if (qword_102301818 != -1)
    dispatch_once(&qword_102301818, &stru_102142208);
  return (id)qword_102301810;
}

- (CLSedentaryTimerNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSedentaryTimerNotifierAdapter;
  return -[CLSedentaryTimerNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSedentaryTimerNotifierProtocol, &OBJC_PROTOCOL___CLSedentaryTimerNotifierClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100535198((uint64_t)-[CLSedentaryTimerNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1018FDF04();
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetIsTimerArmed
{
  return *((_BYTE *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee") + 176);
}

- (int)syncgetStartTimerForClient:(id)a3 andOptions:(id)a4
{
  NSObject *v7;
  int v8;
  const char *v10;
  char *v11;
  int v12;
  id v13;
  _BYTE buf[12];
  char v15;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021424E0);
  v7 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStartTimerForClient starting timer for client,%{public}@!", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021424E0);
    v12 = 138543362;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 0, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStartTimerForClient starting timer for client,%{public}@!", &v12, 12);
    v11 = (char *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetStartTimerForClient:andOptions:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  sub_1015A2E04(buf, (char *)objc_msgSend(a3, "UTF8String"));
  v8 = sub_10053552C((uint64_t)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"), (uint64_t)buf, a4);
  if (v15 < 0)
    operator delete(*(void **)buf);
  return v8;
}

- (int)syncgetStopTimerForClient:(id)a3
{
  NSObject *v5;
  const char *v7;
  char *v8;
  int v9;
  id v10;
  _BYTE buf[12];
  char v12;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021424E0);
  v5 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStopTimerForClient stopping timer for client,%{public}@!", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021424E0);
    v9 = 138543362;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 0, "[SedentaryTimerTriage] SedentaryAlarm, syncgetStopTimerForClient stopping timer for client,%{public}@!", &v9, 12);
    v8 = (char *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetStopTimerForClient:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  sub_1015A2E04(buf, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100535F68((uint64_t)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"));
  if (v12 < 0)
    operator delete(*(void **)buf);
  return 100;
}

- (int)syncgetSedentaryAlarmData:(void *)a3 since:(double)a4
{
  NSObject *v7;
  const char *v9;
  uint8_t *v10;
  int v11;
  double v12;
  uint8_t buf[4];
  double v14;

  if (qword_10229FC70 != -1)
    dispatch_once(&qword_10229FC70, &stru_1021424E0);
  v7 = qword_10229FC78;
  if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SedentaryTimerTriage] SedentaryAlarm, syncgetSedentaryAlarmData with start time,%{public}f!", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021424E0);
    v11 = 134349056;
    v12 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 0, "[SedentaryTimerTriage] SedentaryAlarm, syncgetSedentaryAlarmData with start time,%{public}f!", &v11, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLSedentaryTimerNotifierAdapter syncgetSedentaryAlarmData:since:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  return sub_1013545EC(*((_QWORD *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee") + 23), (void **)a3, a4);
}

- (void)timeZoneDidChange:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee", a3) + 47);
  if (v3)
    sub_1004CA654(v3);
}

+ (BOOL)isSupported
{
  if (qword_102301828 != -1)
    dispatch_once(&qword_102301828, &stru_102142228);
  return byte_102301820;
}

@end

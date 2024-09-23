@implementation CLDaemonStatusAdapter

- (BOOL)syncgetIsSleeping
{
  return *((_BYTE *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 248);
}

- (void)fetchIsAirplaneModeEnabledWithReply:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "airplaneMode"));
}

- (void)fetchReachabilityWithReply:(id)a3
{
  (*((void (**)(id, id))a3 + 2))(a3, objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "reachability"));
}

- (void)fetchIsBatteryConnectedWithReply:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = 7;
  v4 = -[CLDaemonStatusAdapter adaptee](self, "adaptee", 0xBFF0000000000000, 0, 0);
  v5 = (*(uint64_t (**)(void *, int *, uint64_t *))(*(_QWORD *)v4 + 128))(v4, &v9, &v7);
  if (BYTE1(v8))
    v6 = v5;
  else
    v6 = 0;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)fetchWirelessModemClientCountWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  _DWORD v6[7];
  int v7;

  v7 = 12;
  LOBYTE(v6[0]) = 0;
  v4 = -[CLDaemonStatusAdapter adaptee](self, "adaptee");
  if ((*(unsigned int (**)(void *, int *, _DWORD *))(*(_QWORD *)v4 + 128))(v4, &v7, v6))
    v5 = v6[0];
  else
    v5 = 0;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (BOOL)syncgetRegisterPowerKeepAlive:(BOOL)a3 client:(unint64_t)a4 dbgMessage:(id)a5
{
  return sub_100008B88((uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"), a3, a4, (uint64_t)objc_msgSend(a5, "UTF8String"));
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_1023030F0 != -1)
    dispatch_once(&qword_1023030F0, &stru_102149418);
  return (id)qword_1023030E8;
}

- (CLDaemonStatusAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonStatusAdapter;
  return -[CLDaemonStatusAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDaemonStatusProtocol, &OBJC_PROTOCOL___CLDaemonStatusClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1006429C0((uint64_t)-[CLDaemonStatusAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_1019030DC();
    sub_1006429C0(v3);
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDaemonStatusAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDaemonStatusAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLDaemonStatusAdapter adaptee](self, "adaptee"));
  return 0;
}

- (BOOL)syncgetAirplaneMode:(BOOL *)a3
{
  *a3 = objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "airplaneMode");
  return 1;
}

- (int)syncgetReachability
{
  return objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "reachability");
}

- (BOOL)syncgetHasLingerClients
{
  int v3;

  v3 = 18;
  return sub_1001B7864((uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"), &v3, 1) != 0;
}

- (void)notifyMigrationPerformed
{
  sub_100642B80((uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"));
}

- (void)triggerMetricHeartbeatNotification
{
  sub_100642D48((uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"));
}

- (int)syncgetThermalLevel
{
  return objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "thermalLevel");
}

- (BOOL)syncgetBatterySaverMode
{
  return objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "batterySaverModeEnabled");
}

@end

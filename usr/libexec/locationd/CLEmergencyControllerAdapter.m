@implementation CLEmergencyControllerAdapter

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
  if (qword_102309300 != -1)
    dispatch_once(&qword_102309300, &stru_102195D90);
  return (id)qword_1023092F8;
}

+ (BOOL)isSupported
{
  if (qword_102309310 != -1)
    dispatch_once(&qword_102309310, &stru_102195DB0);
  return (byte_102309308 & 1) == 0;
}

- (CLEmergencyControllerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEmergencyControllerAdapter;
  return -[CLEmergencyControllerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLEmergencyControllerProtocol, &OBJC_PROTOCOL___CLEmergencyClientProtocol);
}

- (void)beginService
{
  -[CLEmergencyControllerAdapter universe](self, "universe");
  sub_100F72FDC();
}

- (void)endService
{
  uint64_t v2;

  qword_102311A78 = 0;
  v2 = qword_102311A70;
  sub_100F7943C(qword_102311A70, 0);
  _CTServerConnectionSendBarrier(*(_QWORD *)(v2 + 552), &stru_102195DD0);
}

- (void)startMonitoringEmergencyState:(id)a3
{
  sub_100F734B0((char *)qword_102311A70, a3);
}

- (void)stopMonitoringEmergencyState:(id)a3
{
  sub_100F738E4(qword_102311A70, a3);
}

- (void)onCLEmergencyEnablementAssertion:(BOOL)a3
{
  sub_100F73928(qword_102311A70, a3);
}

- (void)shouldDisplayEEDUIWithReply:(id)a3
{
  uint64_t v4;

  v4 = sub_101391308(*(_QWORD *)(qword_102311A70 + 688));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)getEEDCloakingKeyWithReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v4 = sub_1013914EC(*(_QWORD *)(qword_102311A70 + 688), &v5);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v5, v4);
}

- (void)getEEDEmergencyContactNamesWithReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v4 = sub_1013914F4(*(_QWORD *)(qword_102311A70 + 688), &v5);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v5, v4);
}

- (void)callEventHandler:(id)a3
{
  _QWORD v3[6];

  if (a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100F73B8C;
    v3[3] = &unk_10212BB30;
    v3[4] = a3;
    v3[5] = self;
    objc_msgSend(objc_msgSend(-[CLEmergencyControllerAdapter universe](self, "universe"), "silo"), "async:", v3);
  }
}

- (void)checkEmergencyCallStatus
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = objc_msgSend((id)qword_102311A78, "currentCalls");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
      if (v7)
      {
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "isEmergency") & 1) != 0)
          break;
      }
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v7 = 0;
  }
  sub_100F741AC(qword_102311A70, v7);
}

- (void)interactiveStateChangedNotification:(id)a3
{
  sub_100F74808(qword_102311A70);
}

@end

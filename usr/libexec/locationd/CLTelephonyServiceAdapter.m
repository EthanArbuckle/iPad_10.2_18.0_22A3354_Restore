@implementation CLTelephonyServiceAdapter

- (void)fetchSignalStrengthMeasurementForSim:(int)a3 withReply:(id)a4
{
  sub_1000180C0((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), a3, (uint64_t)a4);
}

- (void)fetchIsCellAvailableWithReply:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  v5 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 216))(v4);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (void)sendNotificationToClients:(id)a3 notificationData:(id)a4
{
  void *v6;

  v6 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, id, id))(*(_QWORD *)v6 + 272))(v6, a3, a4);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (BOOL)syncgetRefreshCellMonitor
{
  sub_1002395D4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
  return 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
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
  if (qword_102301CE8 != -1)
    dispatch_once(&qword_102301CE8, &stru_102145E88);
  return (id)qword_102301CE0;
}

- (CLTelephonyServiceAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTelephonyServiceAdapter;
  return -[CLTelephonyServiceAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTelephonyServiceProtocol, &OBJC_PROTOCOL___CLTelephonyServiceClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100595A28((uint64_t)-[CLTelephonyServiceAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101900464();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)fetchActiveOrHeldWithReply:(id)a3
{
  _BOOL4 v4;
  _BOOL8 v5;
  BOOL v6;

  v6 = 0;
  v4 = sub_100595B9C((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &v6);
  v5 = v6 && v4;
  (*((void (**)(id, _BOOL8))a3 + 2))(a3, v5);
}

- (void)requestCamping:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;

  v3 = a3;
  v4 = *((_QWORD *)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 18);
  if (v4)
    v5 = _CTServerConnectionSetCampOnlyMode(v4, v3) == 0;
  else
    v5 = 0;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021460E0);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 1026;
    v11 = v3;
    v12 = 1026;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#camp request\", \"campRequest\":%{public}hhd, \"success\":%{public}hhd}", (uint8_t *)v7, 0x1Eu);
  }
}

- (BOOL)syncgetCampOnlyState
{
  return sub_100596068((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (void)updateTAInfo:(TAData *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  v4 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  v5 = *(_OWORD *)&a3->var4;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  v7 = *(_QWORD *)&a3->var6;
  sub_1005964D4((uint64_t)v4, (uint64_t)v6);
}

- (void)assertCommCenter:(int)a3 with:(int)a4
{
  sub_100596858((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), a3, a4);
}

- (BOOL)syncgetUplinkFrequency:(float *)a3 andBandwidth:(float *)a4
{
  float *v6;

  v6 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  *a3 = v6[41];
  *a4 = v6[42];
  return 1;
}

- (id)syncgetRegistrationInfoDictionary
{
  return (id)sub_100596A54((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (void)fetchUmtsApnWithReply:(id)a3
{
  sub_10096C1E8((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 176, (uint64_t)a3);
}

- (void)fetchUmtsApnForInstance:(int)a3 WithReply:(id)a4
{
  sub_10096C8D0((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 176, a3, (uint64_t)a4);
}

- (void)fetchIratStreamingInfoWithReply:(id)a3
{
  sub_100596CB4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (BOOL)syncgetDetectedCells:(void *)a3
{
  return sub_100596DC8((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t *)a3);
}

- (BOOL)syncgetIsRegisteredOnCell
{
  void *v2;

  v2 = -[CLTelephonyServiceAdapter adaptee](self, "adaptee");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 216))(v2);
}

- (int)syncgetRadioAccessTechnology
{
  return sub_100597DE0((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (int)syncgetRadioAccessTechnologyForSim:(int)a3
{
  return sub_100597E3C((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), a3);
}

- (int)syncgetRegistrationStatus
{
  return sub_10008FDF8((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"));
}

- (int)syncgetRegistrationStatusForSim:(int)a3
{
  return sub_100597EB4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), a3);
}

- (int)syncgetCellTransmitStatus
{
  return *((_DWORD *)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 34);
}

- (BOOL)syncgetActiveCall:(BOOL *)a3
{
  BOOL result;
  BOOL v5;

  v5 = 0;
  result = sub_100595B9C((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &v5);
  *a3 = v5;
  return result;
}

- (BOOL)syncgetRefreshCellMonitorForSim:(int)a3
{
  sub_100597F84((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), a3);
  return 1;
}

- (BOOL)syncgetCopyServingOperator:(id *)a3
{
  BOOL v4;
  id v5;
  std::string *p_p;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  v4 = sub_1005981BC((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  v5 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  *a3 = objc_msgSend(v5, "initWithUTF8String:", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

- (id)syncgetCopyServingOperatorForSim:(int)a3
{
  return sub_10096D544((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 176, a3);
}

- (BOOL)syncgetCopyServingProvider:(id *)a3
{
  BOOL v4;
  id v5;
  std::string *p_p;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  v4 = sub_1005981BC((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  v5 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  *a3 = objc_msgSend(v5, "initWithUTF8String:", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

- (BOOL)syncgetCopyServingProviderFromCarrierBundle:(id *)a3
{
  BOOL v4;
  id v5;
  std::string *p_p;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  v4 = sub_1005986B4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), &__p);
  v5 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  *a3 = objc_msgSend(v5, "initWithUTF8String:", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v4;
}

- (id)syncgetCopyServingProviderFromCarrierBundleForSim:(int)a3
{
  return sub_10096D554((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 176, a3);
}

- (BOOL)syncgetSignalStrength:(int *)a3
{
  return sub_100598AA8((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (int)syncgetSignalStrengthForSim:(int)a3
{
  return sub_10096D524((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee") + 176, a3);
}

- (void)resetModemWithReason:(id)a3
{
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  id v15;

  v4 = sub_100599038((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (char *)objc_msgSend(a3, "UTF8String"));
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102146100);
  v5 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_FAULT))
  {
    v8 = 68289539;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    v14 = 2081;
    v15 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"attempt to reset modem\", \"success\":%{public}hhd, \"reason\":%{private, location:escape_only}s}", (uint8_t *)&v8, 0x22u);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102146100);
  }
  v6 = qword_1022A0028;
  if (os_signpost_enabled((os_log_t)qword_1022A0028))
  {
    v7 = objc_msgSend(a3, "UTF8String");
    v8 = 68289539;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    v14 = 2081;
    v15 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "attempt to reset modem", "{\"msg%{public}.0s\":\"attempt to reset modem\", \"success\":%{public}hhd, \"reason\":%{private, location:escape_only}s}", (uint8_t *)&v8, 0x22u);
  }
}

- (void)dumpLogWithReason:(id)a3
{
  sub_100599418((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (char *)objc_msgSend(a3, "UTF8String"));
}

- (BOOL)syncgetServingCells:(void *)a3 addNeighborCells:(BOOL)a4
{
  return sub_1005997EC((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t *)a3, a4);
}

- (BOOL)syncgetServingGsmCell:(Cell *)a3
{
  return sub_1005999B4((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

+ (BOOL)isSupported
{
  return 1;
}

@end

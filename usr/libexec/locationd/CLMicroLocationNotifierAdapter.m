@implementation CLMicroLocationNotifierAdapter

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
  if (qword_102309190 != -1)
    dispatch_once(&qword_102309190, &stru_102192648);
  return (id)qword_102309188;
}

- (CLMicroLocationNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationNotifierAdapter;
  return -[CLMicroLocationNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMicroLocationNotifierProtocol, &OBJC_PROTOCOL___CLMicroLocationNotifierClientProtocol);
}

- (void)beginService
{
  uint64_t v3;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100F197E4((uint64_t)-[CLMicroLocationNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = sub_101932F2C();
    sub_100F197E4(v3);
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
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)registerForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
  sub_100F19970((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3, a4);
}

- (void)unregisterForMiloServiceEventUpdatesForClient:(id)a3 withToken:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee", a3);
  sub_100F19D04((uint64_t)v5, v6, a4);
}

- (void)registerForMiloPredictionEventUpdates:(id)a3
{
  sub_100F19F60((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)unregisterForMiloPredictionEventUpdates:(id)a3
{
  sub_100F1A1A8((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)createServiceForClient:(id)a3 withServiceType:(unint64_t)a4 locationTypes:(id)a5 connectionToken:(id)a6 forUser:(id)a7
{
  void *__p[2];
  std::string v13;

  sub_1015A2E04(&v13, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a7, "UTF8String"));
  sub_100F1A4AC((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &v13, a4, a5, (uint64_t)a6, (uint64_t)__p);
}

- (void)deleteServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  void *__p[2];
  char v11;
  std::string v12;

  sub_1015A2E04(&v12, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a6, "UTF8String"));
  sub_100F1AAC0((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &v12, a4, (uint64_t)a5, (unsigned __int8 *)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

- (void)queryServicesForClient:(id)a3 withConnectionToken:(id)a4 forUser:(id)a5
{
  void *__p[2];
  void *v9[2];

  sub_1015A2E04(v9, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a5, "UTF8String"));
  sub_100F1AFF8((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)v9, (uint64_t)a4, (uint64_t)__p);
}

- (void)connectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  void *__p[2];
  char v11;
  std::string v12;

  sub_1015A2E04(&v12, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a6, "UTF8String"));
  sub_100F1B34C((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &v12, a4, a5, (const void **)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

- (void)disconnectToServiceForClient:(id)a3 withServiceIdentifier:(id)a4 withConnectionToken:(id)a5 forUser:(id)a6
{
  void *__p[2];
  char v11;
  std::string v12;

  sub_1015A2E04(&v12, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a6, "UTF8String"));
  sub_100F1B7C4((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &v12, a4, a5, (unsigned __int8 *)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

- (void)requestSingleShotMiLoPredictionForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
  std::string __p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1BC10((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &__p, a4, a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)requestObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withConnectionToken:(id)a7
{
  std::string __p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1C138((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &__p, a4, a5, a6);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)requestLabelSingleObservationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 withObservationRequestIdentifier:(id)a7 withConnectionToken:(id)a8
{
  void *v13;
  uint64_t v14;
  void *__p;
  char v16;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  v13 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100F1C674((uint64_t)v13, v14, a4, a5, a6, a7);
  if (v16 < 0)
    operator delete(__p);
}

- (void)requestLabelObservationsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withPlaceIdentifier:(id)a6 betweenStartDate:(id)a7 endDate:(id)a8 withConnectionToken:(id)a9
{
  void *v15;
  uint64_t v16;
  void *__p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  v15 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100F1C838((uint64_t)v15, v16, a4, a5, a6, (uint64_t)a7, (uint64_t)a8);
}

- (void)requestRemoveLabelsForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withLabels:(id)a6 withConnectionToken:(id)a7
{
  void *__p[2];

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1C9F4((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t *)__p, (uint64_t)a4, a5, (uint64_t)a6);
}

- (void)requestRemoveCustomLoiWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 withLoiIdentifier:(id)a5 withConnectionToken:(id)a6
{
  sub_100F1CCB0((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), a3, a4, a5);
}

- (void)requestStartUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConfiguration:(id)a6 withConnectionToken:(id)a7
{
  std::string __p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1CE80((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &__p, a4, a5, a6);
}

- (void)requestStopUpdatingMicroLocationForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5 withConnectionToken:(id)a6
{
  std::string __p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1D200((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &__p, a4, a5);
}

- (void)requestMicroLocationLearningForClient:(id)a3 withServiceIdentifier:(id)a4 withRequestIdentifier:(id)a5
{
  NSObject *v9;
  void *v10;
  void *__p;
  __int16 v12;
  const char *v13;
  char v14;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102192BD0);
  v9 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    __p = (void *)68289026;
    v12 = 2082;
    v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestMicroLocationLearningForClient\"}", (uint8_t *)&__p, 0x12u);
  }
  v10 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1D72C((uint64_t)v10, (uint64_t)&__p, a4, a5);
  if (v14 < 0)
    operator delete(__p);
}

- (void)requestPurgeAllMiLoDataFromClient:(id)a3 withRequestIdentifier:(id)a4
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *__p;
  __int16 v11;
  const char *v12;
  char v13;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102192BD0);
  v7 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    __p = (void *)68289026;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestPurgeAllMiLoData\"}", (uint8_t *)&__p, 0x12u);
  }
  v8 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1D924((uint64_t)v8, v9, a4);
  if (v13 < 0)
    operator delete(__p);
}

- (void)requestExportMiLoDatabaseTablesFromClient:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *__p;
  __int16 v12;
  const char *v13;

  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102192BD0);
  v8 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    __p = (void *)68289026;
    v12 = 2082;
    v13 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation adapter requestExportMiLoDatabaseTablesFromClient\"}", (uint8_t *)&__p, 0x12u);
  }
  v9 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1DAF4((uint64_t)v9, v10, a4);
}

- (void)queryMiloConnectionStatus:(id)a3
{
  void *v3;
  _BOOL8 v4;

  v3 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  v4 = sub_1000A1914((uint64_t)v3 + 248);
  sub_100F27034((uint64_t)v3, v4);
}

- (void)enableMiLoAtCurrentLocationWithServiceIdentifier:(id)a3 withRequestIdentifier:(id)a4 connectionToken:(id)a5
{
  sub_100F1DD64((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), a3, a4, a5);
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4
{
  -[CLMicroLocationNotifierAdapter requestCurrentMicroLocationForClient:withAdditionalInformation:withReply:](self, "requestCurrentMicroLocationForClient:withAdditionalInformation:withReply:", a3, a4, 0);
}

- (void)requestCurrentMicroLocationForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
  std::string __p;

  sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1E098(-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), &__p, a4, (void (**)(_QWORD, _QWORD))a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)requestMicroLocationRecordingScanForClient:(id)a3 withAdditionalInformation:(id)a4 withReply:(id)a5
{
  void *__p[2];
  char v9;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F1E458(-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (char *)__p, a4, (void (**)(_QWORD, _QWORD))a5);
  if (v9 < 0)
    operator delete(__p[0]);
}

- (BOOL)syncgetMicroLocationInternalVersion:(id *)a3
{
  NSObject *v4;
  std::string *p_p;
  std::string *v6;
  std::string __p;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  std::string *v14;

  -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100F21580(&__p);
  if (qword_1022A00F0 != -1)
    dispatch_once(&qword_1022A00F0, &stru_102192BD0);
  v4 = qword_1022A00F8;
  if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 68289282;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2082;
    v14 = p_p;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation Internal Version request\", \"version\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &__p;
  else
    v6 = (std::string *)__p.__r_.__value_.__r.__words[0];
  *a3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return 1;
}

- (void)_exportMiloData:(BOOL)a3 withUserIdentifier:(id)a4 WithReply:(id)a5
{
  _BOOL4 v6;
  NSObject *v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  _QWORD *v12;
  NSObject *v13;
  NSDictionary *v14;
  char v15[23];
  char v16;
  _QWORD *v17;
  char v18;
  _QWORD *v19;
  char v20;
  char v21;
  void *__p;
  char v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint64_t buf;
  __int16 v29;
  const char *v30;
  __int16 v31;
  char *v32;

  v6 = a3;
  sub_1015A2E04(&__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_100F1EC9C((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), v6, v15);
  if (v21)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102192BD0);
    v8 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v15;
      if (v16 < 0)
        v9 = *(char **)v15;
      buf = 68289282;
      v29 = 2082;
      v30 = "";
      v31 = 2082;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation DB Tables exported\", \"path\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
    v26[0] = CFSTR("FileName");
    if (v18 >= 0)
      v10 = &v17;
    else
      v10 = v17;
    v27[0] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10);
    v26[1] = CFSTR("ExportDir");
    if (v16 >= 0)
      v11 = v15;
    else
      v11 = *(char **)v15;
    v27[1] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11);
    v26[2] = CFSTR("SandboxExt");
    if (v20 >= 0)
      v12 = &v19;
    else
      v12 = v19;
    v27[2] = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12);
    (*((void (**)(id, _QWORD, NSDictionary *))a5 + 2))(a5, 0, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 3));
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102192BD0);
    v13 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v29 = 2082;
      v30 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation DB Tables not exported\"}", (uint8_t *)&buf, 0x12u);
    }
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("exportMicroLocationDatabaseTables failed internally.");
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    (*((void (**)(id, NSError *, _QWORD))a5 + 2))(a5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v14), 0);
  }
  sub_100F2BD90((uint64_t)v15);
  if (v23 < 0)
    operator delete(__p);
}

- (void)exportMicroLocationDatabaseTablesWithReply:(id)a3
{
  -[CLMicroLocationNotifierAdapter _exportMiloData:withUserIdentifier:WithReply:](self, "_exportMiloData:withUserIdentifier:WithReply:", 0, &stru_1021D8FB8, a3);
}

- (void)exportMicroLocationDataForMigrationWithReply:(id)a3
{
  -[CLMicroLocationNotifierAdapter _exportMiloData:withUserIdentifier:WithReply:](self, "_exportMiloData:withUserIdentifier:WithReply:", 1, &stru_1021D8FB8, a3);
}

- (void)exportMicroLocationDataForMigrationWithUserIdentifier:(id)a3 withReply:(id)a4
{
  -[CLMicroLocationNotifierAdapter _exportMiloData:withUserIdentifier:WithReply:](self, "_exportMiloData:withUserIdentifier:WithReply:", 1, a3, a4);
}

- (void)requestAnchorValueStatisticsWithReply:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *v5;
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  double v12;
  _QWORD *v13;
  unsigned __int8 *v14;
  double v15;
  uint8_t *v16;
  NSString *v17;
  NSString *v18;
  NSObject *v19;
  NSDictionary *v20;
  void (**v21)(id, _QWORD, NSMutableDictionary *);
  _QWORD *v22;
  _QWORD v23[2];
  _QWORD *v24;
  uint64_t v25;
  char v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  _QWORD v29[2];
  uint8_t buf[8];
  __int16 v31;
  const char *v32;
  char v33;

  sub_100F20040((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), v23);
  if (v26)
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102192BD0);
    v4 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v31 = 2082;
      v32 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"anchor statistics map retrieved\"}", buf, 0x12u);
    }
    v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 10 * v25);
    v21 = (void (**)(id, _QWORD, NSMutableDictionary *))a3;
    v6 = v24;
    if (v24)
    {
      do
      {
        v22 = v6;
        v7 = (uint64_t *)v6[6];
        if (v7)
        {
          v8 = v6 + 2;
          do
          {
            v9 = sub_1002A1BA8(v23, v8);
            if (!v9 || (v10 = v7 + 2, (v11 = sub_1001986C8(v9 + 4, (unsigned __int8 *)v7 + 16)) == 0))
              sub_100263950("unordered_map::at: key not found");
            v12 = *((double *)v11 + 6);
            v13 = sub_1002A1BA8(v23, v8);
            if (!v13 || (v14 = sub_1001986C8(v13 + 4, (unsigned __int8 *)v7 + 16)) == 0)
              sub_100263950("unordered_map::at: key not found");
            v15 = *((double *)v14 + 5);
            sub_10035A24C((uint64_t)v8, (uint64_t)buf);
            if (v33 >= 0)
              v16 = buf;
            else
              v16 = *(uint8_t **)buf;
            v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16, v21);
            if (*((char *)v7 + 39) < 0)
              v10 = (_QWORD *)*v10;
            v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10);
            if (!-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v18))
              -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 10), v18);
            v29[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15);
            v29[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12);
            objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v18), "setObject:forKeyedSubscript:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2), v17);
            if (v33 < 0)
              operator delete(*(void **)buf);
            v7 = (uint64_t *)*v7;
          }
          while (v7);
        }
        v6 = (_QWORD *)*v22;
      }
      while (*v22);
    }
    v21[2](v21, 0, v5);
  }
  else
  {
    if (qword_1022A00F0 != -1)
      dispatch_once(&qword_1022A00F0, &stru_102192BD0);
    v19 = qword_1022A00F8;
    if (os_log_type_enabled((os_log_t)qword_1022A00F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v31 = 2082;
      v32 = "";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"retrieving anchor statistics map failed\"}", buf, 0x12u);
    }
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("retriving anchor statistics map failed internally.");
    v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    (*((void (**)(id, NSError *, _QWORD))a3 + 2))(a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v20), 0);
  }
  if (v26)
    sub_100300B8C((uint64_t)v23);
}

- (void)requestMicroLocationLearningForClient_Legacy:(id)a3 withReply:(id)a4
{
  void *__p[2];
  char v7;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_100F20598((const void **)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t *)__p, a4);
  if (v7 < 0)
    operator delete(__p[0]);
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 recordingTriggerUUID:(id)a5 withReply:(id)a6
{
  char v10;
  id v11;
  id v12;
  NSDictionary *v13;
  void *__p[2];
  char v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v10 = sub_100F20A88((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t)__p, a4, a5);
  if (a6)
  {
    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v12 = objc_alloc((Class)NSError);
      v16 = NSLocalizedDescriptionKey;
      v17 = CFSTR("donateTruthTagLabelForClient failed internally");
      v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v11 = objc_msgSend(v12, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v13);
    }
    (*((void (**)(id, id))a6 + 2))(a6, v11);
  }
  if (v15 < 0)
    operator delete(__p[0]);
}

- (void)donateTruthTagLabelForClient:(id)a3 truthLabelUUID:(id)a4 betweenDate:(id)a5 andDate:(id)a6 withReply:(id)a7
{
  char v12;
  id v13;
  id v14;
  NSDictionary *v15;
  void *__p[2];
  char v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v12 = sub_100F20D84((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee"), (uint64_t *)__p, a4, (uint64_t)a5, (uint64_t)a6);
  if (a7)
  {
    if ((v12 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v14 = objc_alloc((Class)NSError);
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("donateTruthTagLabelForClient failed internally");
      v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v13 = objc_msgSend(v14, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, v15);
    }
    (*((void (**)(id, id))a7 + 2))(a7, v13);
  }
  if (v17 < 0)
    operator delete(__p[0]);
}

- (void)purgeMicroLocationSemiSupervisedDataForClient:(id)a3
{
  void *__p[2];
  char v5;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1003822B4((uint64_t)-[CLMicroLocationNotifierAdapter adaptee](self, "adaptee") + 584, (uint64_t)__p);
  if (v5 < 0)
    operator delete(__p[0]);
}

- (void)purgeAllMicroLocationData
{
  void *v2;

  v2 = -[CLMicroLocationNotifierAdapter adaptee](self, "adaptee");
  sub_100382100((uint64_t)v2 + 584);
  sub_100F27EC0((uint64_t)v2);
}

@end

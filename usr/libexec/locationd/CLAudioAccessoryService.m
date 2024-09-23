@implementation CLAudioAccessoryService

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
  if (qword_10230E310 != -1)
    dispatch_once(&qword_10230E310, &stru_1021AF200);
  return (id)qword_10230E308;
}

- (CLAudioAccessoryService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAudioAccessoryService;
  return -[CLAudioAccessoryService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAudioAccessoryServiceProtocol, &OBJC_PROTOCOL___CLAudioAccessoryServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10230E320 != -1)
    dispatch_once(&qword_10230E320, &stru_1021AF220);
  return byte_10230E318;
}

- (void)beginService
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v3 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Starting up CLAudioAccessoryService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] Starting up CLAudioAccessoryService", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService beginService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = sub_10055EAE4();
  sub_100561380(v4, (uint64_t)sub_101329558, (uint64_t)self);
  -[CLAudioAccessoryService setClients:](self, "setClients:", objc_opt_new(NSMutableSet));
  -[CLAudioAccessoryService setLatestData:](self, "setLatestData:", 0);
}

- (void)endService
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v3 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Shutting down CLAudioAccessoryService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] Shutting down CLAudioAccessoryService", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService endService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = sub_10055EAE4();
  sub_1005613D0(v4, (uint64_t)self);

  -[CLAudioAccessoryService setClients:](self, "setClients:", 0);
  -[CLAudioAccessoryService setLatestData:](self, "setLatestData:", 0);
}

- (void)registerForUsageMetricsUpdates:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v5 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] AccessoryService - registerForUsageMetricsUpdates %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v12 = 138412290;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] AccessoryService - registerForUsageMetricsUpdates %@", &v12, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[NSMutableSet addObject:](-[CLAudioAccessoryService clients](self, "clients"), "addObject:", a3);
  if (-[CLAudioAccessoryService latestData](self, "latestData"))
  {
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v6 = qword_10229FD88;
    if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Sending cached data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD80 != -1)
        dispatch_once(&qword_10229FD80, &stru_1021AF240);
      LOWORD(v12) = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] Sending cached data", &v12, v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    objc_msgSend(a3, "onUsageMetricsEvent:", -[CLAudioAccessoryService latestData](self, "latestData"));
  }
}

- (void)unregisterForUsageMetricsUpdates:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v5 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] AccessoryService - unregisterForUsageMetricsUpdates %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v8 = 138412290;
    v9 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] AccessoryService - unregisterForUsageMetricsUpdates %@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService unregisterForUsageMetricsUpdates:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[NSMutableSet removeObject:](-[CLAudioAccessoryService clients](self, "clients"), "removeObject:", a3);
}

- (void)onAudioAccessoryInterfaceDailyUsageCallback:(int)a3 data:(id)a4
{
  double Current;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  int v24;
  CLAudioAccessoryService *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  int v31;
  _BYTE v32[14];
  __int16 v33;
  int v34;
  uint8_t buf[4];
  _BYTE v36[14];
  __int16 v37;
  int v38;

  Current = CFAbsoluteTimeGetCurrent();
  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v8 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v36 = a3;
    *(_WORD *)&v36[4] = 2048;
    *(_QWORD *)&v36[6] = -[NSMutableSet count](-[CLAudioAccessoryService clients](self, "clients"), "count");
    v37 = 1024;
    v38 = (int)Current;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Service received bluetooth event:%d, numClients:%lu, timestamp:%d", buf, 0x18u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v20 = qword_10229FD88;
    v31 = 67109632;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 2048;
    *(_QWORD *)&v32[6] = -[NSMutableSet count](-[CLAudioAccessoryService clients](self, "clients"), "count");
    v33 = 1024;
    v34 = (int)Current;
    LODWORD(v23) = 24;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "[HeadphoneUsage] Service received bluetooth event:%d, numClients:%lu, timestamp:%d", &v31, v23, v24);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
  -[CLAudioAccessoryService fireMotionAlarm](self, "fireMotionAlarm");
  v9 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)Current), CFSTR("timestamp_received_on_companion"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = self;
  v10 = -[CLAudioAccessoryService clients](self, "clients");
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v14);
        if (qword_10229FD80 != -1)
          dispatch_once(&qword_10229FD80, &stru_1021AF240);
        v16 = qword_10229FD88;
        if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v36 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] AccessoryService - Notifying client %@", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FD80 != -1)
            dispatch_once(&qword_10229FD80, &stru_1021AF240);
          v31 = 138412290;
          *(_QWORD *)v32 = v15;
          LODWORD(v23) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 2, "[HeadphoneUsage] AccessoryService - Notifying client %@", &v31, v23);
          v18 = (uint8_t *)v17;
          sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]", "%s\n", v17);
          if (v18 != buf)
            free(v18);
        }
        objc_msgSend(v15, "onUsageMetricsEvent:", v9);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v12 = v19;
    }
    while (v19);
  }
  -[CLAudioAccessoryService setLatestData:](v25, "setLatestData:", v9);
}

- (void)fireMotionAlarm
{
  id v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  v2 = objc_msgSend(objc_msgSend(-[CLAudioAccessoryService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLMotionAlarmNotifier"));
  if (qword_10229FD80 != -1)
    dispatch_once(&qword_10229FD80, &stru_1021AF240);
  v3 = qword_10229FD88;
  if (os_log_type_enabled((os_log_t)qword_10229FD88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Firing motion alarm kCMMotionAlarmTriggerTypeMetricsEvent", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD80 != -1)
      dispatch_once(&qword_10229FD80, &stru_1021AF240);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD88, 0, "[HeadphoneUsage] Firing motion alarm kCMMotionAlarmTriggerTypeMetricsEvent", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLAudioAccessoryService fireMotionAlarm]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  objc_msgSend(v2, "fireEventAlarm:", 27);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)latestData
{
  return self->_latestData;
}

- (void)setLatestData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

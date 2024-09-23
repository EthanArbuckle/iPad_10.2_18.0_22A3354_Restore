@implementation CLVisionNotifier

- (void)deregisterForVisionNotifications:(id)a3
{
  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[NSMutableSet removeObject:](self->_clients, "removeObject:", a3);
}

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
  if (qword_1023015D8 != -1)
    dispatch_once(&qword_1023015D8, &stru_10213FFC0);
  return (id)qword_1023015D0;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLVisionNotifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVisionNotifier;
  return -[CLVisionNotifier initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVisionNotifierServiceProtocol, &OBJC_PROTOCOL___CLVisionNotifierClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  _QWORD v7[5];
  uint8_t buf[1640];

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[CLVisionNotifier setArSessionActive:](self, "setArSessionActive:", 0);
  -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", -1.0);
  -[CLVisionNotifier setSessionTimer:](self, "setSessionTimer:", objc_msgSend(objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo"), "newTimer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004F7BD8;
  v7[3] = &unk_10212BB58;
  v7[4] = self;
  -[CLTimer setHandler:](-[CLVisionNotifier sessionTimer](self, "sessionTimer"), "setHandler:", v7);
  -[CLVisionNotifier setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  if (qword_1022A00C0 != -1)
    dispatch_once(&qword_1022A00C0, &stru_102140030);
  v3 = qword_1022A00C8;
  if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLVN,beginService,vision notifier started.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v6 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00C8, 2, "CLVN,beginService,vision notifier started.", &v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)endService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[CLVisionNotifier setArSessionActive:](self, "setArSessionActive:", 0);
  -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", -1.0);
  -[CLTimer invalidate](-[CLVisionNotifier sessionTimer](self, "sessionTimer"), "invalidate");
  -[CLVisionNotifier setSessionTimer:](self, "setSessionTimer:", 0);
  -[CLVisionNotifier setClients:](self, "setClients:", 0);
  if (qword_1022A00C0 != -1)
    dispatch_once(&qword_1022A00C0, &stru_102140030);
  v3 = qword_1022A00C8;
  if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLVN,endService,vision notifier ended.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00C8, 2, "CLVN,endService,vision notifier ended.", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier endService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)registerForVisionNotifications:(id)a3
{
  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[NSMutableSet addObject:](self->_clients, "addObject:", a3);
}

- (void)sendARSessionState:(id)a3 fromClient:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  v13 = 0;
  if (a3 && objc_msgSend(a3, "length") == (id)8)
  {
    objc_msgSend(a3, "getBytes:length:", &v13, 8);
    if (v13 == 1)
    {
      if (-[CLVisionNotifier isARSessionActive](self, "isARSessionActive"))
      {
        if (qword_1022A00C0 != -1)
          dispatch_once(&qword_1022A00C0, &stru_102140030);
        v7 = qword_1022A00C8;
        if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,sendARSessionState:fromClient:,New session has started without end notification of previous session.", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A00C0 != -1)
            dispatch_once(&qword_1022A00C0, &stru_102140030);
          v12 = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00C8, 2, "CLVN,sendARSessionState:fromClient:,New session has started without end notification of previous session.", &v12, 2);
          v11 = (uint8_t *)v10;
          sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier sendARSessionState:fromClient:]", "%s\n", v10);
          if (v11 != buf)
            free(v11);
        }
        -[CLVisionNotifier closeSessionWithState:fromClient:](self, "closeSessionWithState:fromClient:", 2, a4);
      }
      -[CLVisionNotifier startSessionWithState:fromClient:](self, "startSessionWithState:fromClient:", v13, a4);
    }
    else
    {
      -[CLVisionNotifier closeSessionWithState:fromClient:](self, "closeSessionWithState:fromClient:", v13, a4);
    }
  }
  else
  {
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v8 = qword_1022A00C8;
    if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendARSessionState:fromClient:,Could not decode payload\"}", buf, 0x12u);
      if (qword_1022A00C0 != -1)
        dispatch_once(&qword_1022A00C0, &stru_102140030);
    }
    v9 = qword_1022A00C8;
    if (os_signpost_enabled((os_log_t)qword_1022A00C8))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendARSessionState:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendARSessionState:fromClient:,Could not decode payload\"}", buf, 0x12u);
    }
  }
}

- (void)sendVIOEstimation:(id)a3 fromClient:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[6];
  __int16 v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  v17 = 0;
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(_CLVIOEstimation, v7)), a3, &v17);
  if (v17 || (v9 = v8) == 0)
  {
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v11 = qword_1022A00C8;
    if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendVIOEstimation:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A00C0 != -1)
        dispatch_once(&qword_1022A00C0, &stru_102140030);
    }
    v12 = qword_1022A00C8;
    if (os_signpost_enabled((os_log_t)qword_1022A00C8))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendVIOEstimation:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendVIOEstimation:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (!-[CLVisionNotifier isARSessionActive](self, "isARSessionActive"))
    {
      if (qword_1022A00C0 != -1)
        dispatch_once(&qword_1022A00C0, &stru_102140030);
      v10 = qword_1022A00C8;
      if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLVN,sendVIOEstimation:fromClient:,Payload was sent without start notification of current session", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00C0 != -1)
          dispatch_once(&qword_1022A00C0, &stru_102140030);
        v16 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00C8, 2, "CLVN,sendVIOEstimation:fromClient:,Payload was sent without start notification of current session", &v16, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier sendVIOEstimation:fromClient:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      -[CLVisionNotifier startSessionWithState:fromClient:](self, "startSessionWithState:fromClient:", 1, a4);
    }
    -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", sub_1001FCBB4());
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1004F868C;
    v15[3] = &unk_10213FFE8;
    v15[4] = v9;
    v15[5] = a4;
    -[CLVisionNotifier updateClientsWithHandler:](self, "updateClientsWithHandler:", v15);
  }
}

- (void)sendVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  _QWORD v15[6];
  __int16 v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  v17 = 0;
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(_CLVLLocalizationResult, v7)), a3, &v17);
  if (v17 || (v9 = v8) == 0)
  {
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v11 = qword_1022A00C8;
    if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A00C0 != -1)
        dispatch_once(&qword_1022A00C0, &stru_102140030);
    }
    v12 = qword_1022A00C8;
    if (os_signpost_enabled((os_log_t)qword_1022A00C8))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2114;
      v23 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (!-[CLVisionNotifier isARSessionActive](self, "isARSessionActive"))
    {
      if (qword_1022A00C0 != -1)
        dispatch_once(&qword_1022A00C0, &stru_102140030);
      v10 = qword_1022A00C8;
      if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLVN,sendVLLocalizationResult:fromClient:,Payload was sent without start notification of current session", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A00C0 != -1)
          dispatch_once(&qword_1022A00C0, &stru_102140030);
        v16 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A00C8, 2, "CLVN,sendVLLocalizationResult:fromClient:,Payload was sent without start notification of current session", &v16, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier sendVLLocalizationResult:fromClient:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      -[CLVisionNotifier startSessionWithState:fromClient:](self, "startSessionWithState:fromClient:", 1, a4);
    }
    -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", sub_1001FCBB4());
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1004F8A24;
    v15[3] = &unk_10213FFE8;
    v15[4] = v9;
    v15[5] = a4;
    -[CLVisionNotifier updateClientsWithHandler:](self, "updateClientsWithHandler:", v15);
  }
}

- (void)updateClientsWithHandler:(id)a3
{
  NSMutableSet *clients;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  clients = self->_clients;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(clients);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)startSessionWithState:(unint64_t)a3 fromClient:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[6];
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  id v19;

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[CLVisionNotifier setArSessionActive:](self, "setArSessionActive:", 1);
  -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", sub_1001FCBB4());
  -[CLTimer setNextFireDelay:interval:](-[CLVisionNotifier sessionTimer](self, "sessionTimer"), "setNextFireDelay:interval:", 5.0, 5.0);
  if (qword_1022A00C0 != -1)
    dispatch_once(&qword_1022A00C0, &stru_102140030);
  v7 = qword_1022A00C8;
  if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v17 = a3;
    v18 = 2082;
    v19 = objc_msgSend(a4, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,startSessionWithState:%{public}lu fromClient:%{public}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v8 = qword_1022A00C8;
    v12 = 134349314;
    v13 = a3;
    v14 = 2082;
    v15 = objc_msgSend(a4, "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "CLVN,startSessionWithState:%{public}lu fromClient:%{public}s", &v12, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier startSessionWithState:fromClient:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004F8D84;
  v11[3] = &unk_102140010;
  v11[4] = a4;
  v11[5] = a3;
  -[CLVisionNotifier updateClientsWithHandler:](self, "updateClientsWithHandler:", v11);
}

- (void)closeSessionWithState:(unint64_t)a3 fromClient:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[6];
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  id v19;

  objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo");
  -[CLVisionNotifier setArSessionActive:](self, "setArSessionActive:", 0);
  -[CLVisionNotifier setLastARKitUpdate:](self, "setLastARKitUpdate:", -1.0);
  -[CLTimer setNextFireDelay:interval:](-[CLVisionNotifier sessionTimer](self, "sessionTimer"), "setNextFireDelay:interval:", 1.79769313e308, 1.79769313e308);
  if (qword_1022A00C0 != -1)
    dispatch_once(&qword_1022A00C0, &stru_102140030);
  v7 = qword_1022A00C8;
  if (os_log_type_enabled((os_log_t)qword_1022A00C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v17 = a3;
    v18 = 2082;
    v19 = objc_msgSend(a4, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,closeSessionWithState:%{public}lu fromClient:%{public}s", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A00C0 != -1)
      dispatch_once(&qword_1022A00C0, &stru_102140030);
    v8 = qword_1022A00C8;
    v12 = 134349314;
    v13 = a3;
    v14 = 2082;
    v15 = objc_msgSend(a4, "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "CLVN,closeSessionWithState:%{public}lu fromClient:%{public}s", &v12, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLVisionNotifier closeSessionWithState:fromClient:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004F8FE8;
  v11[3] = &unk_102140010;
  v11[4] = a4;
  v11[5] = a3;
  -[CLVisionNotifier updateClientsWithHandler:](self, "updateClientsWithHandler:", v11);
}

- (BOOL)hasSessionTimedOut:(double)a3
{
  double v5;
  double v7;

  -[CLVisionNotifier lastARKitUpdate](self, "lastARKitUpdate");
  if (v5 < 0.0)
    return 1;
  -[CLVisionNotifier lastARKitUpdate](self, "lastARKitUpdate");
  return vabdd_f64(a3, v7) > 10.0;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (double)lastARKitUpdate
{
  return self->_lastARKitUpdate;
}

- (void)setLastARKitUpdate:(double)a3
{
  self->_lastARKitUpdate = a3;
}

- (CLTimer)sessionTimer
{
  return self->_sessionTimer;
}

- (void)setSessionTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end

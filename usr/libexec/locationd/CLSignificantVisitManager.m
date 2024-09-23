@implementation CLSignificantVisitManager

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
  if (qword_102304B30 != -1)
    dispatch_once(&qword_102304B30, &stru_1021552C0);
  return (id)qword_102304B28;
}

+ (BOOL)isSupported
{
  return 0;
}

- (CLSignificantVisitManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSignificantVisitManager;
  return -[CLSignificantVisitManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSignificantVisitManagerProtocol, &OBJC_PROTOCOL___CLSignificantVisitManagerClientProtocol);
}

- (void)beginService
{
  CLSettingsMirror *v3;
  _QWORD v4[5];

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v3 = (CLSettingsMirror *)objc_msgSend(objc_alloc((Class)CLSettingsMirror), "initInUniverse:", -[CLSignificantVisitManager universe](self, "universe"));
  self->fSettings = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10080A14C;
  v4[3] = &unk_102153360;
  v4[4] = self;
  -[CLSettingsMirror setSettingsChangeHandler:](v3, "setSettingsChangeHandler:", v4);
  -[CLSignificantVisitManager universe](self, "universe");
  sub_1001B6A0C();
}

- (void)endService
{
  void *v3;
  void *v4;
  Client *value;
  void *v6;
  void *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *v11;
  BOOL v12;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  -[CLSignificantVisitManager ensureStop](self, "ensureStop");
  v3 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  (*(void (**)(void *))(*(_QWORD *)v3 + 960))(v3);
  v4 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  (*(void (**)(void *))(*(_QWORD *)v4 + 960))(v4);
  -[CLSignificantVisitManager flushAll](self, "flushAll");
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v6 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  if (v6)
    (*(void (**)(void *))(*(_QWORD *)v6 + 8))(v6);
  -[CLSignificantVisitManager setClientInterest:](self, "setClientInterest:", 0);
  v7 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  if (v7)
    (*(void (**)(void *))(*(_QWORD *)v7 + 8))(v7);
  -[CLSignificantVisitManager setClientAuthDate:](self, "setClientAuthDate:", 0);
  -[CLSignificantVisitManager setClientAuthorizationCache:](self, "setClientAuthorizationCache:", 0);
  -[CLSignificantVisitManager setRecentVisits:](self, "setRecentVisits:", 0);
  -[CLSignificantVisitManager setRoutineMonitor:](self, "setRoutineMonitor:", 0);
  p_pair1 = &self->_clientToKey.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)self->_clientToKey.__tree_.__begin_node_;
  if (begin_node != &self->_clientToKey.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v11 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)begin_node[2].__value_.__left_;
          v12 = v11->__value_.__left_ == begin_node;
          begin_node = v11;
        }
        while (!v12);
      }
      begin_node = v11;
    }
    while (v11 != p_pair1);
  }
  sub_100008848((uint64_t)&self->_clientToKey, (_QWORD *)self->_clientToKey.__tree_.__pair1_.__value_.__left_);
  self->_clientToKey.__tree_.__pair1_.__value_.__left_ = 0;
  self->_clientToKey.__tree_.__pair3_.__value_ = 0;
  self->_clientToKey.__tree_.__begin_node_ = p_pair1;

}

- (void)flushAuthDates
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  v2 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v2 + 944))(v2) & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#slv Could not store client auth dates\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v4 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Could not store client auth dates", "{\"msg%{public}.0s\":\"#slv Could not store client auth dates\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)flushInterest
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  v2 = -[CLSignificantVisitManager clientInterest](self, "clientInterest");
  if (((*(uint64_t (**)(void *))(*(_QWORD *)v2 + 944))(v2) & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#slv Could not store significant location visit clients\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v4 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Could not store significant location visit clients", "{\"msg%{public}.0s\":\"#slv Could not store significant location visit clients\"}", (uint8_t *)&v5, 0x12u);
    }
  }
}

- (void)flushAll
{
  -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
  -[CLSignificantVisitManager flushInterest](self, "flushInterest");
}

- (void)ensureMonitoringWithType:(int)a3
{
  NSObject *v5;
  CLRoutineMonitorServiceProtocol *v6;
  NSObject *v7;
  CLRoutineMonitorServiceProtocol *v8;
  NSObject *v9;
  const char *v10;
  CLRoutineMonitorServiceProtocol *v11;
  NSObject *v12;
  CLRoutineMonitorServiceProtocol *v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102155348);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    v14 = 68289794;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 1026;
    v19 = a3;
    v20 = 1026;
    v21 = -[CLSignificantVisitManager monitoring](self, "monitoring");
    v22 = 1026;
    v23 = -[CLSignificantVisitManager leeching](self, "leeching");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv ensureMonitoringWithType\", \"type\":%{public}d, \"monitoring\":%{public}hhd, \"leeching\":%{public}hhd}", (uint8_t *)&v14, 0x24u);
  }
  if (a3 == 1)
  {
    if (!-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      v11 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:](v11, "startLeechingVisitsForClient:", CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 1);
      if (-[CLSignificantVisitManager monitoring](self, "monitoring"))
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102155348);
        v12 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 68289026;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Currently monitoring. Stop monitoring and switch to leeching\"}", (uint8_t *)&v14, 0x12u);
        }
        v13 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
        -[CLRoutineMonitorServiceProtocol stopMonitoringVisitsForClient:](v13, "stopMonitoringVisitsForClient:", CLISP_ME_TOKEN);
        -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 0);
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v10 = "{\"msg%{public}.0s\":\"#slv Begin leeching\"}";
        goto LABEL_29;
      }
    }
  }
  else if (!a3 && !-[CLSignificantVisitManager monitoring](self, "monitoring"))
  {
    v6 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
    -[CLRoutineMonitorServiceProtocol startMonitoringVisitsForClient:](v6, "startMonitoringVisitsForClient:", CLISP_ME_TOKEN);
    -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 1);
    if (-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v7 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Currently leeching. Stop leeching and switch to monitoring\"}", (uint8_t *)&v14, 0x12u);
      }
      v8 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](v8, "stopLeechingVisitsForClient:", CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 0);
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v10 = "{\"msg%{public}.0s\":\"#slv Begin monitoring\"}";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, 0x12u);
    }
  }
}

- (void)ensureStop
{
  NSObject *v3;
  NSObject *v4;
  CLRoutineMonitorServiceProtocol *v5;
  CLRoutineMonitorServiceProtocol *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102155348);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289538;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = -[CLSignificantVisitManager monitoring](self, "monitoring");
    v16 = 1026;
    v17 = -[CLSignificantVisitManager leeching](self, "leeching");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv ensureStop\", \"monitoring\":%{public}hhd, \"leeching\":%{public}hhd}", buf, 0x1Eu);
  }
  if (-[CLSignificantVisitManager monitoring](self, "monitoring")
    || -[CLSignificantVisitManager leeching](self, "leeching"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#slv Stop monitoring or leeching", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#slv Stop monitoring or leeching", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLSignificantVisitManager ensureStop]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[CLSignificantVisitManager setRecentVisits:](self, "setRecentVisits:", +[NSMutableArray array](NSMutableArray, "array"));
    if (-[CLSignificantVisitManager monitoring](self, "monitoring"))
    {
      v5 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopMonitoringVisitsForClient:](v5, "stopMonitoringVisitsForClient:", CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setMonitoring:](self, "setMonitoring:", 0);
    }
    if (-[CLSignificantVisitManager leeching](self, "leeching"))
    {
      v6 = -[CLSignificantVisitManager routineMonitor](self, "routineMonitor");
      -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](v6, "stopLeechingVisitsForClient:", CLISP_ME_TOKEN);
      -[CLSignificantVisitManager setLeeching:](self, "setLeeching:", 0);
    }
  }
}

- (void)removeOldVisits
{
  -[NSMutableArray filterUsingPredicate:](-[CLSignificantVisitManager recentVisits](self, "recentVisits"), "filterUsingPredicate:", +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_102155300));
}

- (BOOL)isClientWithKeyInterested:(id)a3
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v10 = 0;
  if (!-[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", objc_msgSend(a3, "UTF8String"), &v10)|| v10)
  {
    LOBYTE(v7) = v10 == 1;
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v4 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v5 = objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2082;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Client in store with no interest\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v6 = qword_1022A01D8;
    v7 = os_signpost_enabled((os_log_t)qword_1022A01D8);
    if (v7)
    {
      v8 = objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2082;
      v16 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Client in store with no interest", "{\"msg%{public}.0s\":\"#slv Client in store with no interest\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)sendVisitsToClient:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t buf;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v5 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v5)
  {
    v6 = v5;
    if (-[CLSignificantVisitManager isClientWithKeyInterested:](self, "isClientWithKeyInterested:", v5))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v7 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        buf = 68289282;
        v22 = 2082;
        v23 = "";
        v24 = 2082;
        v25 = objc_msgSend(v6, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client is interested\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
      -[CLSignificantVisitManager removeOldVisits](self, "removeOldVisits");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = -[CLSignificantVisitManager recentVisits](self, "recentVisits", 0);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            -[CLSignificantVisitManager deliverVisit:toClient:](self, "deliverVisit:toClient:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), a3);
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v15 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        buf = 68289282;
        v22 = 2082;
        v23 = "";
        v24 = 2082;
        v25 = objc_msgSend(v6, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client has no interest\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v13 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      buf = 68289026;
      v22 = 2082;
      v23 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Can't deliver visit to client that hasn't connected\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v14 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      buf = 68289026;
      v22 = 2082;
      v23 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Can't deliver visit to client that hasn't connected", "{\"msg%{public}.0s\":\"#slv Can't deliver visit to client that hasn't connected\"}", (uint8_t *)&buf, 0x12u);
    }
  }
}

- (void)deliverVisit:(id)a3 toClient:(id)a4
{
  _QWORD v7[7];

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10080B568;
  v7[3] = &unk_10212BBA8;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  -[CLSignificantVisitManager performBlockWhenArmed:](self, "performBlockWhenArmed:", v7);
}

- (void)performBlockWhenArmed:(id)a3
{
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (-[CLSignificantVisitManager armed](self, "armed"))
    (*((void (**)(id))a3 + 2))(a3);
  else
    -[CLClientAuthorizationCacheProtocol notifyWhenCacheIsPopulatedWithReply:](-[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"), "notifyWhenCacheIsPopulatedWithReply:", a3);
}

- (id)keyForClient:(id)a3
{
  CLSignificantVisitManager *left;
  CLSignificantVisitManager *p_pair1;
  unint64_t value;
  BOOL v8;
  CLSignificantVisitManager **p_clientManagerClient;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return 0;
  p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
  do
  {
    value = left->_clientToKey.__tree_.__pair3_.__value_;
    v8 = value >= (unint64_t)a3;
    if (value >= (unint64_t)a3)
      p_clientManagerClient = (CLSignificantVisitManager **)left;
    else
      p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
    if (v8)
      p_pair1 = left;
    left = *p_clientManagerClient;
  }
  while (*p_clientManagerClient);
  if (p_pair1 != (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
    && p_pair1->_clientToKey.__tree_.__pair3_.__value_ <= (unint64_t)a3)
  {
    return p_pair1->fSettings;
  }
  else
  {
    return 0;
  }
}

- (void)connectClient:(id)a3 withKey:(id)a4
{
  NSObject *v7;
  CLSignificantVisitManager *left;
  CLSignificantVisitManager *p_pair1;
  unint64_t value;
  BOOL v11;
  CLSignificantVisitManager **p_clientManagerClient;
  id v13;
  id v14;
  id v15;
  uint8_t buf[8];
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  v15 = a3;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102155348);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = objc_msgSend(a4, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Client is connecting\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  left = (CLSignificantVisitManager *)self->_clientToKey.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_;
    do
    {
      value = left->_clientToKey.__tree_.__pair3_.__value_;
      v11 = value >= (unint64_t)a3;
      if (value >= (unint64_t)a3)
        p_clientManagerClient = (CLSignificantVisitManager **)left;
      else
        p_clientManagerClient = (CLSignificantVisitManager **)&left->_clientManagerClient;
      if (v11)
        p_pair1 = left;
      left = *p_clientManagerClient;
    }
    while (*p_clientManagerClient);
    if (p_pair1 != (CLSignificantVisitManager *)&self->_clientToKey.__tree_.__pair1_
      && p_pair1->_clientToKey.__tree_.__pair3_.__value_ <= (unint64_t)a3)
    {

    }
  }
  *(_QWORD *)buf = &v15;
  sub_10006221C((uint64_t **)&self->_clientToKey, (unint64_t *)&v15, (uint64_t)&unk_101B9EB60, (uint64_t **)buf)[5] = (uint64_t)a4;
  v13 = v15;
  v14 = a4;
  -[CLSignificantVisitManager sendVisitsToClient:](self, "sendVisitsToClient:", v15);
}

- (void)startMonitoringSignificantVisitsForClient:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  std::string __p;
  uint8_t buf[8];
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v7 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v7)
  {
    v8 = v7;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2082;
      v17 = objc_msgSend(v8, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Client start\", \"key\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", objc_msgSend(v8, "UTF8String"), "interest", 1);
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", objc_msgSend(v8, "UTF8String"), "type", v4);
    -[CLSignificantVisitManager flushInterest](self, "flushInterest");
    if (-[CLSignificantVisitManager authorizationDateForClientWithKey:](self, "authorizationDateForClientWithKey:", v8))
    {
      sub_1015A2E04(&__p, (char *)objc_msgSend(v8, "UTF8String"));
      sub_100204320(&__p, (uint64_t)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      sub_1007E6938();
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Tried to start monitoring for a client that isn't connected\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v11 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v14 = 2082;
      v15 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Tried to start monitoring for a client that isn't connected", "{\"msg%{public}.0s\":\"#slv Tried to start monitoring for a client that isn't connected\"}", buf, 0x12u);
    }
  }
}

- (void)stopMonitoringSignificantVisitsForClient:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v5 = -[CLSignificantVisitManager keyForClient:](self, "keyForClient:", a3);
  if (v5)
  {
    v6 = v5;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 68289282;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2082;
      v15 = objc_msgSend(v6, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv client stop\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
    }
    -[CLSignificantVisitManager removeInterestForClientKey:](self, "removeInterestForClientKey:", v6);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Tried to stop monitoring for a client that isn't connected\"}", (uint8_t *)&v10, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v9 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Tried to stop monitoring for a client that isn't connected", "{\"msg%{public}.0s\":\"#slv Tried to stop monitoring for a client that isn't connected\"}", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (void)removeInterestForClientKey:(id)a3
{
  int v5;

  v5 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", objc_msgSend(a3, "UTF8String"), &v5);
  if (v5 == 1)
  {
    -[CLSignificantVisitManager clientInterestStoreSetValueForClientKey:parameterKey:value:](self, "clientInterestStoreSetValueForClientKey:parameterKey:value:", objc_msgSend(a3, "UTF8String"), "interest", 2);
    -[CLSignificantVisitManager flushAll](self, "flushAll");
    -[CLSignificantVisitManager actOnPendingDeleteForClientKey:](self, "actOnPendingDeleteForClientKey:", a3);
    -[CLSignificantVisitManager checkForMonitoring](self, "checkForMonitoring");
  }
}

- (void)actOnPendingDeleteForClientKey:(id)a3
{
  _QWORD v5[6];
  _QWORD v6[5];
  int v7;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v7 = 0;
  -[CLSignificantVisitManager interestForClientKey:outInterest:](self, "interestForClientKey:outInterest:", objc_msgSend(a3, "UTF8String"), &v7);
  if (v7 != 2)
    sub_10190AF98();
  v5[5] = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10080C29C;
  v6[3] = &unk_102155328;
  v6[4] = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10080C2D8;
  v5[3] = &unk_10212BB30;
  v5[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:](-[CLSignificantVisitManager clientManager](self, "clientManager"), "doAsync:withReply:", v6, v5);
}

- (void)simulateVisit:(id)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102155368);
  v5 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Sending simulated visit to clients\"}", (uint8_t *)v6, 0x12u);
  }
  -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", a3);
}

- (void)disconnectClient:(id)a3
{
  map<id<CLSignificantVisitManagerClientProtocol>, NSString *, std::less<id<CLSignificantVisitManagerClientProtocol>>, std::allocator<std::pair<const id<CLSignificantVisitManagerClientProtocol>, NSString *>>> *p_clientToKey;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *p_pair1;
  unint64_t v8;
  BOOL v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **v10;
  id v11;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  p_clientToKey = &self->_clientToKey;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> *)p_clientToKey->__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &p_clientToKey->__tree_.__pair1_;
    do
    {
      v8 = (unint64_t)left[4].__value_.__left_;
      v9 = v8 >= (unint64_t)a3;
      if (v8 >= (unint64_t)a3)
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **)left;
      else
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id<CLSignificantVisitManagerClientProtocol>, NSString *>, void *>>> **)&left[1];
      if (v9)
        p_pair1 = left;
      left = *v10;
    }
    while (*v10);
    if (p_pair1 != &p_clientToKey->__tree_.__pair1_)
    {
      v11 = p_pair1[4].__value_.__left_;
      if (v11 <= a3)
      {

        sub_10008A9F0((uint64_t **)p_clientToKey, (uint64_t *)p_pair1);
        operator delete(p_pair1);
      }
    }
  }
}

- (void)notifyClientsOfVisit:(id)a3
{
  _QWORD v5[6];

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (!a3)
    sub_10190B104();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10080C580;
  v5[3] = &unk_10212BB30;
  v5[4] = a3;
  v5[5] = self;
  -[CLSignificantVisitManager performBlockWhenArmed:](self, "performBlockWhenArmed:", v5);
}

- (id)authorizationDateForClientWithKey:(id)a3
{
  NSDate *v5;
  NSObject *v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[8];
  __int16 v13;
  const char *v14;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (!-[CLSignificantVisitManager armed](self, "armed"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv #warning Can't produce a meaningful authorization date before arming is complete.  Returning nil\"}", buf, 0x12u);
    }
    return 0;
  }
  if ((objc_msgSend(-[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:](-[CLSignificantVisitManager clientAuthorizationCache](self, "clientAuthorizationCache"), "syncgetAuthorizationContextIfClientIsNonZonal:", a3), "isAuthorizedForServiceTypeMask:", 64) & 1) == 0)
  {
    sub_100525484((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"), (const char *)objc_msgSend(a3, "UTF8String"), 0xFFFFFFFFLL);
    -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
    return 0;
  }
  *(_QWORD *)buf = 0;
  if ((sub_1001FD98C((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"), (const char *)objc_msgSend(a3, "UTF8String"), buf) & 1) != 0)return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)buf);
  objc_msgSend(objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"), "currentLatchedAbsoluteTimestamp");
  v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v8 = -[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate");
  v9 = (const char *)objc_msgSend(a3, "UTF8String");
  -[NSDate timeIntervalSinceReferenceDate](v5, "timeIntervalSinceReferenceDate");
  v11 = v10;
  sub_10018A4CC((uint64_t)v8, v9, &v11);
  -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
  return v5;
}

- (void)checkForMonitoring
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[8];
  __int16 v9;
  const char *v10;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (-[CLSignificantVisitManager armed](self, "armed"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v3 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#slv Checking if SLV should be active\"}", buf, 0x12u);
    }
    v5 = 0;
    v6 = 0;
    v7 = 0;
    sub_100525A8C((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"));
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102155348);
  v4 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#slv Not checking for monitoring... not armed\"}", buf, 0x12u);
  }
}

- (void)migrateClientInterestData
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  v3 = 0;
  v4 = 0;
  v5 = 0;
  sub_100525A8C((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"));
}

- (BOOL)interestForClientKey:(const char *)a3 outInterest:(int *)a4
{
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  return -[CLSignificantVisitManager clientInterestStoreGetValueForClientKey:parameterKey:value:](self, "clientInterestStoreGetValueForClientKey:parameterKey:value:", a3, "interest", a4);
}

- (BOOL)interestTypeForClientKey:(const char *)a3 outType:(int *)a4
{
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  return -[CLSignificantVisitManager clientInterestStoreGetValueForClientKey:parameterKey:value:](self, "clientInterestStoreGetValueForClientKey:parameterKey:value:", a3, "type", a4);
}

- (BOOL)clientInterestStoreGetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int *)a5
{
  char v9;
  _QWORD v11[2];

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  sub_100119F3C(v11);
  if (sub_100006BB4((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), a3, v11))
    v9 = sub_1001E4B84((uint64_t)v11, a4, a5);
  else
    v9 = 0;
  sub_10011A5A8(v11);
  return v9;
}

- (BOOL)clientInterestStoreSetValueForClientKey:(const char *)a3 parameterKey:(const char *)a4 value:(int)a5
{
  BOOL v8;
  _QWORD v10[2];
  int v11;

  v11 = a5;
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  sub_100119F3C(v10);
  sub_100006BB4((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), a3, v10);
  v8 = sub_10011B4E4((uint64_t)v10, a4, &v11)
    && sub_1000CADE4((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"), a3, (uint64_t)v10);
  sub_10011A5A8(v10);
  return v8;
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  if (a3)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Received visit from routined\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
    -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", a3);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v8, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
    }
    v7 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Attempting to notify nil visit", "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)onClientManagerNotification:(int)a3 data:(NotificationData *)a4
{
  void *p_p;
  NSObject *v9;
  NSObject *v10;
  void *__p;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe", *(_QWORD *)&a3, a4, a5), "silo");
  switch(a3)
  {
    case 0:
    case 4:
      if (*((_DWORD *)a4 + 47) != 1)
      {
        sub_100525288((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"));
        -[CLSignificantVisitManager flushAuthDates](self, "flushAuthDates");
        -[CLSignificantVisitManager ensureStop](self, "ensureStop");
      }
      break;
    case 1:
      sub_1001A885C((uint64_t)a4, (uint64_t)&__p);
      if (v15 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      -[CLSignificantVisitManager removeInterestForClientKey:](self, "removeInterestForClientKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
      if (SHIBYTE(v15) < 0)
        operator delete(__p);
      break;
    case 2:
      -[CLSignificantVisitManager checkForMonitoring](self, "checkForMonitoring");
      break;
    default:
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102155348);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
      {
        __p = (void *)68289282;
        v12 = 2082;
        v13 = "";
        v14 = 1026;
        v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv received unhandled notification\", \"notification\":%{public}d}", (uint8_t *)&__p, 0x18u);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102155348);
      }
      v10 = qword_1022A01D8;
      if (os_signpost_enabled((os_log_t)qword_1022A01D8))
      {
        __p = (void *)68289282;
        v12 = 2082;
        v13 = "";
        v14 = 1026;
        v15 = a3;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv received unhandled notification", "{\"msg%{public}.0s\":\"#slv received unhandled notification\", \"notification\":%{public}d}", (uint8_t *)&__p, 0x18u);
      }
      break;
  }
}

- (void)onInterestStoreTimer
{
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  sub_100586288((uint64_t)-[CLSignificantVisitManager clientInterest](self, "clientInterest"));
}

- (void)onAuthDateStoreTimer
{
  objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo");
  sub_100586288((uint64_t)-[CLSignificantVisitManager clientAuthDate](self, "clientAuthDate"));
}

- (void)settingsDidChange:(id)a3
{
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  double v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CLLocationCoordinate2D v18;
  id v19;
  NSObject *v20;
  _DWORD v21[2];
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;

  if (objc_msgSend(a3, "dictionaryForKey:defaultValue:", CFSTR("SpoofSignificantVisit"), 0))
  {
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("Latitude"), 34.076452);
    v6 = v5;
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("Longitude"), -118.429474);
    v8 = v7;
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("Accuracy"), 54.321);
    v10 = v9;
    objc_msgSend(objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"), "currentLatchedAbsoluteTimestamp");
    v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = +[NSDate distantFuture](NSDate, "distantFuture");
    objc_msgSend(objc_msgSend(-[CLSignificantVisitManager universe](self, "universe"), "silo"), "currentLatchedAbsoluteTimestamp");
    v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("ArrivalTimestamp"), 0.0);
    if (v14 != 0.0)
      v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("DepartureTimestamp"), 0.0);
    if (v15 != 0.0)
      v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(a3, "doubleForKey:defaultValue:", CFSTR("DetectionTimestamp"), 0.0);
    if (v16 != 0.0)
      v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = objc_alloc((Class)CLVisit);
    v18 = CLLocationCoordinate2DMake(v6, v8);
    v19 = objc_msgSend(v17, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:", v11, v12, v13, v18.latitude, v18.longitude, v10);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102155348);
    v20 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 68289283;
      v21[1] = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#slv Spoofing a Significant Visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)v21, 0x1Cu);
    }
    -[CLSignificantVisitManager notifyClientsOfVisit:](self, "notifyClientsOfVisit:", v19);
  }
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (BOOL)leeching
{
  return self->_leeching;
}

- (void)setLeeching:(BOOL)a3
{
  self->_leeching = a3;
}

- (void)clientInterest
{
  return self->_clientInterest;
}

- (void)setClientInterest:(void *)a3
{
  self->_clientInterest = a3;
}

- (void)clientAuthDate
{
  return self->_clientAuthDate;
}

- (void)setClientAuthDate:(void *)a3
{
  self->_clientAuthDate = a3;
}

- (CLClientAuthorizationCacheProtocol)clientAuthorizationCache
{
  return self->_clientAuthorizationCache;
}

- (void)setClientAuthorizationCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)recentVisits
{
  return self->_recentVisits;
}

- (void)setRecentVisits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CLRoutineMonitorServiceProtocol)routineMonitor
{
  return self->_routineMonitor;
}

- (void)setRoutineMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CLClientManagerPublicProtocol)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)armed
{
  return self->_armed;
}

- (void)setArmed:(BOOL)a3
{
  self->_armed = a3;
}

- (unint64_t)currentJournalIdentifier
{
  return self->_currentJournalIdentifier;
}

- (void)setCurrentJournalIdentifier:(unint64_t)a3
{
  self->_currentJournalIdentifier = a3;
}

- (void).cxx_destruct
{
  Client *value;

  sub_100008848((uint64_t)&self->_clientToKey, (_QWORD *)self->_clientToKey.__tree_.__pair1_.__value_.__left_);
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

@end

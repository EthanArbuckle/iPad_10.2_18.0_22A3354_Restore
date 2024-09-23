@implementation CLClientManagerStateTracker

- (int)locationServicesEnabledStatus
{
  return self->_state.locationServicesEnabledStatus;
}

- (BOOL)locationRestricted
{
  return self->_state.locationRestricted;
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  NSObject *v6;
  NSObject *v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;

  if (a4 <= 7)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102154528);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v9 = 68289538;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = 8;
      v15 = 2050;
      v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v9, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102154528);
    }
    v7 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v9 = 68289538;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2050;
      v14 = 8;
      v15 = 2050;
      v16 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v9, 0x26u);
    }
  }
  else
  {
    *(_CLClientManagerStateTrackerState *)a3 = self->_state;
  }
  return a4 > 7;
}

+ (const)trackerStateTypeName
{
  return "_CLClientManagerStateTrackerState";
}

+ (unint64_t)trackerStateSize
{
  return 8;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return -[CLClientManagerStateTracker initInSilo:withIdentifier:state:](self, "initInSilo:withIdentifier:state:", a3, a4, 0);
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  objc_msgSend(a3, "assertInside");
  return -[CLClientManagerStateTracker initWithQueue:identifier:state:](self, "initWithQueue:identifier:state:", objc_msgSend(a3, "queue"), a4, a5);
}

- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return -[CLClientManagerStateTracker initWithQueue:identifier:state:](self, "initWithQueue:identifier:state:", a3, a4, 0);
}

- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  CLClientManagerStateTracker *v7;
  CLClientManagerStateTracker *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[18];

  v14.receiver = self;
  v14.super_class = (Class)CLClientManagerStateTracker;
  v7 = -[CLClientManagerStateTracker initWithQueue:](&v14, "initWithQueue:", a3);
  v8 = v7;
  if (!v7)
    return v8;
  v7->_identifier = a4;
  if (!a5)
    goto LABEL_7;
  if (v7->_inTransaction)
  {
    sub_1019080B4();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLClientManagerStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_1022A01D0 == -1)
      goto LABEL_5;
  }
  dispatch_once(&qword_1022A01D0, &stru_102154528);
LABEL_5:
  v9 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[CLClientManagerStateTracker identifier](v8, "identifier");
    *(_DWORD *)buf = 68290562;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "state_transition";
    v21 = 2082;
    v22 = "ClientManager";
    v23 = 2050;
    v24 = v10;
    v25 = 2082;
    v26 = "init";
    v27 = 1040;
    *(_DWORD *)v28 = 8;
    *(_WORD *)&v28[4] = 2098;
    *(_QWORD *)&v28[6] = &v8->_state;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLClientManagerStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102154528);
  }
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[CLClientManagerStateTracker identifier](v8, "identifier");
    *(_DWORD *)buf = 68290562;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "state_transition";
    v21 = 2082;
    v22 = "ClientManager";
    v23 = 2050;
    v24 = v12;
    v25 = 2082;
    v26 = "lifecycle";
    v27 = 2050;
    *(_QWORD *)v28 = 0;
    *(_WORD *)&v28[8] = 2050;
    *(_QWORD *)&v28[10] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CLClientManagerStateTracker *v18;
  __int16 v19;
  uint64_t v20;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102154528);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290562;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2082;
    v10 = "state_transition";
    v11 = 2082;
    v12 = "ClientManager";
    v13 = 2050;
    v14 = -[CLClientManagerStateTracker identifier](self, "identifier");
    v15 = 2082;
    v16 = "lifecycle";
    v17 = 2050;
    v18 = self;
    v19 = 2050;
    v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLClientManagerStateTracker;
  -[CLClientManagerStateTracker dealloc](&v4, "dealloc");
}

- (void)setLocationServicesEnabledStatus:(int)a3
{
  NSObject *v5;
  void *v6;
  int locationServicesEnabledStatus;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  if (!self->_inTransaction)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102154528);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLClientManagerStateTracker identifier](self, "identifier");
      locationServicesEnabledStatus = self->_state.locationServicesEnabledStatus;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "ClientManager";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "locationServicesEnabledStatus";
      v19 = 1026;
      v20 = locationServicesEnabledStatus;
      v21 = 1026;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}d, \"new\":%{public}d}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.locationServicesEnabledStatus = a3;
}

- (void)setLocationRestricted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL4 locationRestricted;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;

  v3 = a3;
  if (!self->_inTransaction)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102154528);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLClientManagerStateTracker identifier](self, "identifier");
      locationRestricted = self->_state.locationRestricted;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "ClientManager";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "locationRestricted";
      v19 = 1026;
      v20 = locationRestricted;
      v21 = 1026;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.locationRestricted = v3;
}

- (void)updateState:(id)a3
{
  CLClientManagerStateTracker *v3;
  _CLClientManagerStateTrackerState *p_state;
  NSObject *v5;
  _CLClientManagerStateTrackerState state;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _CLClientManagerStateTrackerState *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _CLClientManagerStateTrackerState *v26;

  p_state = &self->_state;
  state = self->_state;
  if (self->_inTransaction)
  {
    sub_101908220();
  }
  else
  {
    v3 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLClientManagerStateTracker *))a3 + 2))(a3, self);
    v3->_inTransaction = 0;
    if (qword_1022A01D0 == -1)
      goto LABEL_3;
  }
  dispatch_once(&qword_1022A01D0, &stru_102154528);
LABEL_3:
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68291074;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = "state_transition";
    v13 = 2082;
    v14 = "ClientManager";
    v15 = 2050;
    v16 = -[CLClientManagerStateTracker identifier](v3, "identifier");
    v17 = 2082;
    v18 = "allStates";
    v19 = 1040;
    v20 = 8;
    v21 = 2098;
    v22 = &state;
    v23 = 1040;
    v24 = 8;
    v25 = 2098;
    v26 = p_state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLClientManagerStateTrackerState}.*P, \"new\":%{public, location:_CLClientManagerStateTrackerState}.*P}", buf, 0x5Au);
  }
}

- (void)identifier
{
  return self->_identifier;
}

@end

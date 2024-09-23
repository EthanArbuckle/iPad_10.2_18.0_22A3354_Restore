@implementation CLDaemonStatusStateTracker

- (BOOL)airplaneMode
{
  return self->_state.airplaneMode;
}

- (int)reachability
{
  return self->_state.reachability;
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  uint64_t v6;
  __int128 v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;

  if (a4 <= 0x27)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v11 = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2050;
      v16 = 40;
      v17 = 2050;
      v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v11, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    }
    v9 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v11 = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2050;
      v16 = 40;
      v17 = 2050;
      v18 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    v6 = *(_QWORD *)&self->_state.airplaneMode;
    v7 = *(_OWORD *)&self->_state.batteryData.wasConnected;
    *(_OWORD *)a3 = *(_OWORD *)&self->_state.batteryData.level;
    *((_OWORD *)a3 + 1) = v7;
    *((_QWORD *)a3 + 4) = v6;
  }
  return a4 > 0x27;
}

- (Battery)batteryData
{
  *retstr = *(Battery *)&self->wasConnected;
  return self;
}

+ (const)trackerStateTypeName
{
  return "_CLDaemonStatusStateTrackerState";
}

+ (unint64_t)trackerStateSize
{
  return 40;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return -[CLDaemonStatusStateTracker initInSilo:withIdentifier:state:](self, "initInSilo:withIdentifier:state:", a3, a4, 0);
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  objc_msgSend(a3, "assertInside");
  return -[CLDaemonStatusStateTracker initWithQueue:identifier:state:](self, "initWithQueue:identifier:state:", objc_msgSend(a3, "queue"), a4, a5);
}

- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return -[CLDaemonStatusStateTracker initWithQueue:identifier:state:](self, "initWithQueue:identifier:state:", a3, a4, 0);
}

- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  CLDaemonStatusStateTracker *v7;
  CLDaemonStatusStateTracker *v8;
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
  v14.super_class = (Class)CLDaemonStatusStateTracker;
  v7 = -[CLDaemonStatusStateTracker initWithQueue:](&v14, "initWithQueue:", a3);
  v8 = v7;
  if (!v7)
    return v8;
  v7->_identifier = a4;
  if (!a5)
    goto LABEL_7;
  if (v7->_inTransaction)
  {
    sub_101902DF4();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLDaemonStatusStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_1022A01D0 == -1)
      goto LABEL_5;
  }
  dispatch_once(&qword_1022A01D0, &stru_1021495A8);
LABEL_5:
  v9 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[CLDaemonStatusStateTracker identifier](v8, "identifier");
    *(_DWORD *)buf = 68290562;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "state_transition";
    v21 = 2082;
    v22 = "DaemonStatus";
    v23 = 2050;
    v24 = v10;
    v25 = 2082;
    v26 = "init";
    v27 = 1040;
    *(_DWORD *)v28 = 40;
    *(_WORD *)&v28[4] = 2098;
    *(_QWORD *)&v28[6] = &v8->_state;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLDaemonStatusStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
  }
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[CLDaemonStatusStateTracker identifier](v8, "identifier");
    *(_DWORD *)buf = 68290562;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2082;
    v20 = "state_transition";
    v21 = 2082;
    v22 = "DaemonStatus";
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
  CLDaemonStatusStateTracker *v18;
  __int16 v19;
  uint64_t v20;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021495A8);
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
    v12 = "DaemonStatus";
    v13 = 2050;
    v14 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
    v15 = 2082;
    v16 = "lifecycle";
    v17 = 2050;
    v18 = self;
    v19 = 2050;
    v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonStatusStateTracker;
  -[CLDaemonStatusStateTracker dealloc](&v4, "dealloc");
}

- (void)setBatteryData:(Battery *)a3
{
  NSObject *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _CLDaemonStatusStateTrackerState *p_state;
  __int16 v22;
  int v23;
  __int16 v24;
  Battery *v25;

  if (!self->_inTransaction)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68291074;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2082;
      v11 = "state_transition";
      v12 = 2082;
      v13 = "DaemonStatus";
      v14 = 2050;
      v15 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      v16 = 2082;
      v17 = "batteryData";
      v18 = 1040;
      v19 = 24;
      v20 = 2098;
      p_state = &self->_state;
      v22 = 1040;
      v23 = 24;
      v24 = 2098;
      v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLDaemonStatus_Type::Battery}.*P, \"new\":%{public, location:CLDaemonStatus_Type::Battery}.*P}", (uint8_t *)v7, 0x5Au);
    }
  }
  v6 = *(_QWORD *)&a3->wasConnected;
  *(_OWORD *)&self->_state.batteryData.level = *(_OWORD *)&a3->level;
  *(_QWORD *)&self->_state.batteryData.wasConnected = v6;
}

- (void)setReachability:(int)a3
{
  NSObject *v5;
  void *v6;
  uint64_t reachability;
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
  uint64_t v20;
  __int16 v21;
  uint64_t v22;

  if (!self->_inTransaction)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      reachability = self->_state.reachability;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "DaemonStatus";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "reachability";
      v19 = 2050;
      v20 = reachability;
      v21 = 2050;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLDaemonStatus_Type::Reachability}lld, \"new\":%{public, location:CLDaemonStatus_Type::Reachability}lld}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.reachability = a3;
}

- (int)thermalLevel
{
  return self->_state.thermalLevel;
}

- (void)setThermalLevel:(int)a3
{
  NSObject *v5;
  void *v6;
  int thermalLevel;
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
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      thermalLevel = self->_state.thermalLevel;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "DaemonStatus";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "thermalLevel";
      v19 = 1026;
      v20 = thermalLevel;
      v21 = 1026;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}d, \"new\":%{public}d}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.thermalLevel = a3;
}

- (void)setAirplaneMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL4 airplaneMode;
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
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      airplaneMode = self->_state.airplaneMode;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "DaemonStatus";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "airplaneMode";
      v19 = 1026;
      v20 = airplaneMode;
      v21 = 1026;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.airplaneMode = v3;
}

- (BOOL)batterySaverModeEnabled
{
  return self->_state.batterySaverModeEnabled;
}

- (void)setBatterySaverModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL4 batterySaverModeEnabled;
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
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      batterySaverModeEnabled = self->_state.batterySaverModeEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "DaemonStatus";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "batterySaverModeEnabled";
      v19 = 1026;
      v20 = batterySaverModeEnabled;
      v21 = 1026;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.batterySaverModeEnabled = v3;
}

- (BOOL)restrictedMode
{
  return self->_state.restrictedMode;
}

- (void)setRestrictedMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL4 restrictedMode;
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
      dispatch_once(&qword_1022A01D0, &stru_1021495A8);
    v5 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[CLDaemonStatusStateTracker identifier](self, "identifier");
      restrictedMode = self->_state.restrictedMode;
      v8[0] = 68290562;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2082;
      v12 = "state_transition";
      v13 = 2082;
      v14 = "DaemonStatus";
      v15 = 2050;
      v16 = v6;
      v17 = 2082;
      v18 = "restrictedMode";
      v19 = 1026;
      v20 = restrictedMode;
      v21 = 1026;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.restrictedMode = v3;
}

- (void)updateState:(id)a3
{
  CLDaemonStatusStateTracker *v3;
  _CLDaemonStatusStateTrackerState *p_state;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  __int128 *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _CLDaemonStatusStateTrackerState *v29;

  p_state = &self->_state;
  v5 = *(_OWORD *)&self->_state.batteryData.wasConnected;
  v7 = *(_OWORD *)&self->_state.batteryData.level;
  v8 = v5;
  v9 = *(_QWORD *)&self->_state.airplaneMode;
  if (self->_inTransaction)
  {
    ((void (*)(CLDaemonStatusStateTracker *, SEL, id))sub_101902F68)(self, a2, a3);
  }
  else
  {
    v3 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLDaemonStatusStateTracker *))a3 + 2))(a3, self);
    v3->_inTransaction = 0;
    if (qword_1022A01D0 == -1)
      goto LABEL_3;
  }
  dispatch_once(&qword_1022A01D0, &stru_1021495A8);
LABEL_3:
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68291074;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = "state_transition";
    v16 = 2082;
    v17 = "DaemonStatus";
    v18 = 2050;
    v19 = -[CLDaemonStatusStateTracker identifier](v3, "identifier", v7, v8, v9);
    v20 = 2082;
    v21 = "allStates";
    v22 = 1040;
    v23 = 40;
    v24 = 2098;
    v25 = &v7;
    v26 = 1040;
    v27 = 40;
    v28 = 2098;
    v29 = p_state;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLDaemonStatusStateTrackerState}.*P, \"new\":%{public, location:_CLDaemonStatusStateTrackerState}.*P}", buf, 0x5Au);
  }
}

- (void)identifier
{
  return self->_identifier;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0xBFF0000000000000;
  *((_WORD *)self + 12) = 0;
  *((_DWORD *)self + 7) = 0;
  *((_BYTE *)self + 32) = 0;
  *((_DWORD *)self + 9) = 0;
  return self;
}

@end

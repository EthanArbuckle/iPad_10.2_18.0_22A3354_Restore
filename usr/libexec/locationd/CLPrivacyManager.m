@implementation CLPrivacyManager

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
  if (qword_1023101B0 != -1)
    dispatch_once(&qword_1023101B0, &stru_1021D7638);
  return (id)qword_1023101A8;
}

- (CLPrivacyManager)init
{
  CLPrivacyManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLPrivacyManager;
  v2 = -[CLPrivacyManager initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPrivacyManagerProtocol, &OBJC_PROTOCOL___CLPrivacyManagerClientProtocol);
  if (v2)
    v2->_activities = objc_opt_new(NSMutableDictionary);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_activities = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPrivacyManager;
  -[CLPrivacyManager dealloc](&v3, "dealloc");
}

- (void)beginService
{
  int v3;
  _BOOL4 disabled;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint8_t buf[8];
  _BYTE v11[10];

  self->_timeStarted = mach_continuous_approximate_time();
  sub_1001E4804(buf);
  v9 = 0;
  v3 = sub_1001E4874(*(uint64_t *)buf, "DisableCLPrivacyManager", &v9);
  if (v9)
    disabled = v3;
  else
    disabled = 0;
  self->_disabled = disabled;
  v5 = *(std::__shared_weak_count **)v11;
  if (*(_QWORD *)v11)
  {
    v6 = (unint64_t *)(*(_QWORD *)v11 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    disabled = self->_disabled;
  }
  if (disabled)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v11 = 2082;
      *(_QWORD *)&v11[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning CLPrivacyManager is disabled by defaults write!\"}", buf, 0x12u);
    }
  }
  -[CLPrivacyManager universe](self, "universe");
  sub_1001B6A0C();
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  const __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;

  if ((objc_msgSend(a1, "valid") & 1) != 0)
  {
    if (a3 == 4)
    {
      if (*(_DWORD *)(a4 + 188) != 1)
      {
        v7 = CFSTR("LocationServicesStatus");
        goto LABEL_15;
      }
    }
    else if (!a3)
    {
      v7 = CFSTR("ResetLocationPrivacy");
LABEL_15:
      _objc_msgSend(a1, "scheduleVacuumWithReason:", v7);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor\"}", (uint8_t *)&v10, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    }
    v9 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v10 = 68289026;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor", "{\"msg%{public}.0s\":\"CLISP bug: CLPrivacyManager still receiving messages after invalidation by the service vendor\"}", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (void)scheduleVacuumWithReason:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *deferVacuum;
  dispatch_time_t v10;
  dispatch_block_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;

  v5 = _os_activity_create((void *)&_mh_execute_header, "CL: Scheduling vacuum", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D7658);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = "activity";
    v22 = 2114;
    v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Scheduling vacuum\", \"event\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (self->_disabled)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Not vacuuming due to defaults-based disablement\"}", buf, 0x12u);
    }
  }
  else if (self->_deferVacuum)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v8 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Deferring previously scheduled vacuum\"}", buf, 0x12u);
    }
    deferVacuum = self->_deferVacuum;
    v10 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(deferVacuum, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    self->_deferVacuum = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(-[CLPrivacyManager silo](self, "silo"), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1018CCB60;
    block[3] = &unk_10212BB58;
    block[4] = self;
    v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_source_set_event_handler((dispatch_source_t)self->_deferVacuum, v11);

    v12 = self->_deferVacuum;
    v13 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_activate((dispatch_object_t)self->_deferVacuum);
  }
  os_activity_scope_leave(&state);
}

- (void)vacuumAll
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D7658);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Vacuuming all\"}", buf, 0x12u);
  }
  if (!sub_1018CCCEC(CFSTR("B")))
    -[CLPrivacyManager retryActivityForEncryptionClass:reason:](self, "retryActivityForEncryptionClass:reason:", CFSTR("B"), 1);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1018CD250;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  objc_msgSend(objc_msgSend(-[CLPrivacyManager universe](self, "universe"), "silo"), "afterInterval:async:", v4, 15.0);
}

- (void)checkInForActivityWithIdentifier:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1018CD30C;
  v3[3] = &unk_102148358;
  v3[4] = self;
  v3[5] = a3;
  xpc_activity_register((const char *)objc_msgSend(a3, "UTF8String"), XPC_ACTIVITY_CHECK_IN, v3);
}

- (BOOL)isReadyToVacuumEncryptionClass:(id)a3
{
  _xpc_activity_s *v5;
  xpc_object_t v6;
  void *v7;
  const char *v8;
  _BOOL4 v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("B")))
  {
LABEL_13:
    v10 = 1;
    goto LABEL_14;
  }
  v5 = (_xpc_activity_s *)-[NSMutableDictionary objectForKeyedSubscript:](self->_activities, "objectForKeyedSubscript:", a3);
  v6 = xpc_activity_copy_criteria(v5);
  if (!v6)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v15 = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2114;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to copy criteria\", \"encryptionClass\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    }
    v12 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v15 = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2114;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to copy criteria", "{\"msg%{public}.0s\":\"failed to copy criteria\", \"encryptionClass\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
    goto LABEL_13;
  }
  v7 = v6;
  v8 = (const char *)XPC_ACTIVITY_REQUIRES_CLASS_B;
  v9 = xpc_dictionary_get_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_B);
  if (v9)
  {
    xpc_dictionary_set_BOOL(v7, v8, 0);
    xpc_activity_set_criteria(v5, v7);
  }
  v10 = !v9;

LABEL_14:
  v13 = mach_continuous_approximate_time();
  if (sub_100127828(v13 - self->_timeStarted) >= 660.0)
    return v10;
  else
    return 0;
}

- (void)retryActivityForEncryptionClass:(id)a3 reason:(int)a4
{
  NSObject *v7;
  _xpc_activity_s *v8;
  _xpc_activity_s *v9;
  xpc_object_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D7658);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 68289538;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2114;
    v22 = a3;
    v23 = 1026;
    v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"retrying activity\", \"encryptionClass\":%{public, location:escape_only}@, \"reason\":%{public}d}", (uint8_t *)&v17, 0x22u);
  }
  v8 = (_xpc_activity_s *)-[NSMutableDictionary objectForKeyedSubscript:](self->_activities, "objectForKeyedSubscript:", a3);
  if (v8)
  {
    v9 = v8;
    v10 = xpc_activity_copy_criteria(v8);
    if (v10)
    {
      v11 = v10;
      if (a4 == 1)
      {
        xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_4_HOURS);
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("B")))
          xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
      }
      else
      {
        xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
      }
      xpc_activity_set_criteria(v9, v11);

      return;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v16 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2114;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to copy criteria\", \"encryptionClass\":%{public, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2114;
      v22 = a3;
      v14 = "failed to copy criteria";
      v15 = "{\"msg%{public}.0s\":\"failed to copy criteria\", \"encryptionClass\":%{public, location:escape_only}@}";
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2114;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to get activity\", \"encryptionClass\":%{public, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v17 = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2114;
      v22 = a3;
      v14 = "failed to get activity";
      v15 = "{\"msg%{public}.0s\":\"failed to get activity\", \"encryptionClass\":%{public, location:escape_only}@}";
LABEL_24:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, (uint8_t *)&v17, 0x1Cu);
    }
  }
}

- (void)onActivity:(id)a3 withIdentifier:(id)a4
{
  xpc_activity_state_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  xpc_activity_state_t v33;

  v7 = xpc_activity_get_state((xpc_activity_t)a3);
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: CLPrivacyManager activity handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021D7658);
  v9 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    v25 = 0;
    v26 = 2082;
    v27 = "";
    v28 = 2082;
    v29 = "activity";
    v30 = 2114;
    v31 = (const char *)a4;
    v32 = 2050;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLPrivacyManager activity handler\", \"event\":%{public, location:escape_only}s, \"job identifier\":%{public, location:escape_only}@, \"state\":%{public}ld}", buf, 0x30u);
  }
  v10 = objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("."));
  if ((objc_msgSend(objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "isEqualToString:", CFSTR("CLPrivacyManager")) & 1) == 0)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021D7678);
    v20 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "[a[0] isEqualToString:@\"CLPrivacyManager\"]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021D7678);
    }
    v21 = qword_1022A02D8;
    if (os_signpost_enabled((os_log_t)qword_1022A02D8))
    {
      *(_DWORD *)buf = 68289539;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "[a[0] isEqualToString:@\"CLPrivacyManager\"]";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021D7678);
    }
    v22 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2082;
      v29 = "assert";
      v30 = 2081;
      v31 = "[a[0] isEqualToString:@\"CLPrivacyManager\"]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/PrivacyManager/CLPrivacyManager.mm", 320, "-[CLPrivacyManager onActivity:withIdentifier:]");
    __break(1u);
LABEL_43:
    dispatch_once(&qword_1022A01D0, &stru_1021D7658);
LABEL_8:
    v12 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected activity state. XPC bug?\"}", buf, 0x12u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
    }
    v13 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      *(_DWORD *)buf = 68289026;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected activity state. XPC bug?", "{\"msg%{public}.0s\":\"Unexpected activity state. XPC bug?\"}", buf, 0x12u);
    }
    goto LABEL_31;
  }
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  switch(v7)
  {
    case 0:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activities, "setObject:forKeyedSubscript:", a3, v11);
      goto LABEL_31;
    case 1:
    case 3:
    case 4:
    case 5:
      if (qword_1022A01D0 == -1)
        goto LABEL_8;
      goto LABEL_43;
    case 2:
      if (self->_disabled)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021D7658);
        v14 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          v25 = 0;
          v26 = 2082;
          v27 = "";
          v15 = "{\"msg%{public}.0s\":\"#warning Not vacuuming due to defaults-based disablement\"}";
          v16 = v14;
          v17 = 18;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
      if (!-[CLPrivacyManager isReadyToVacuumEncryptionClass:](self, "isReadyToVacuumEncryptionClass:", v11))
      {
        v19 = 0;
LABEL_30:
        -[CLPrivacyManager retryActivityForEncryptionClass:reason:](self, "retryActivityForEncryptionClass:reason:", v11, v19);
        goto LABEL_31;
      }
      if (sub_1018CCCEC(v11))
        goto LABEL_31;
      if (!xpc_activity_should_defer((xpc_activity_t)a3) || !xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        v19 = 1;
        goto LABEL_30;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021D7658);
      v18 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289282;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        v28 = 2114;
        v29 = (const char *)v11;
        v15 = "{\"msg%{public}.0s\":\"activity deferred\", \"encryptionClass\":%{public, location:escape_only}@}";
        v16 = v18;
        v17 = 28;
        goto LABEL_18;
      }
LABEL_31:
      os_activity_scope_leave(&state);
      return;
    default:
      goto LABEL_31;
  }
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end

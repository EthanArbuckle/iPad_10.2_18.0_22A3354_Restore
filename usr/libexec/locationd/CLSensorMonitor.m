@implementation CLSensorMonitor

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
  if (qword_102304528 != -1)
    dispatch_once(&qword_102304528, &stru_1021523F8);
  return (id)qword_102304520;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLSensorMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSensorMonitor;
  return -[CLSensorMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSensorMonitorProtocol, &OBJC_PROTOCOL___CLSensorMonitorClientProtocol);
}

- (void)beginService
{
  objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "silo");
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLStepCountNotifier")))
  {
    -[CLSensorMonitor universe](self, "universe");
    sub_10022AF5C();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLFallNotifier")))
  {
    -[CLSensorMonitor universe](self, "universe");
    sub_100A36140();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLOdometerNotifier")))
  {
    -[CLSensorMonitor universe](self, "universe");
    sub_1004FAEDC();
  }
  if (objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLCatherineNotifier")))
  {
    -[CLSensorMonitor universe](self, "universe");
    sub_100A01AFC();
  }
  if ((objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLMotionStateMediator")) & 1) != 0)
  {
    -[CLSensorMonitor universe](self, "universe");
    sub_1006CB5B4();
  }
  -[CLSensorMonitor universe](self, "universe");
  sub_100647FA8();
}

- (void)endService
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;
  Client *v11;
  Client *v12;
  Client *v13;
  Client *v14;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "silo");
  value = self->_stepCountClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
    objc_msgSend(*((id *)self->_stepCountClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_stepCountClient.__ptr_.__value_ + 1), 3);
    v4 = self->_stepCountClient.__ptr_.__value_;
    self->_stepCountClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }

  v5 = self->_odometerClient.__ptr_.__value_;
  if (v5)
  {
    objc_msgSend(*((id *)v5 + 2), "unregister:forNotification:", *((_QWORD *)v5 + 1), 4);
    objc_msgSend(*((id *)self->_odometerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_odometerClient.__ptr_.__value_ + 1), 7);
    v6 = self->_odometerClient.__ptr_.__value_;
    self->_odometerClient.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  }

  v7 = self->_heartRateClient.__ptr_.__value_;
  if (v7)
  {
    objc_msgSend(*((id *)v7 + 2), "unregister:forNotification:", *((_QWORD *)v7 + 1), 10);
    v8 = self->_heartRateClient.__ptr_.__value_;
    self->_heartRateClient.__ptr_.__value_ = 0;
    if (v8)
      (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
  }

  v9 = self->_fallClient.__ptr_.__value_;
  if (v9)
  {
    objc_msgSend(*((id *)v9 + 2), "unregister:forNotification:", *((_QWORD *)v9 + 1), 2);
    v10 = self->_fallClient.__ptr_.__value_;
    self->_fallClient.__ptr_.__value_ = 0;
    if (v10)
      (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
  }

  v11 = self->_motionStateMediatorClient.__ptr_.__value_;
  if (v11)
  {
    objc_msgSend(*((id *)v11 + 2), "unregister:forNotification:", *((_QWORD *)v11 + 1), 4);
    v12 = self->_motionStateMediatorClient.__ptr_.__value_;
    self->_motionStateMediatorClient.__ptr_.__value_ = 0;
    if (v12)
      (*(void (**)(Client *))(*(_QWORD *)v12 + 8))(v12);
  }

  v13 = self->_daemonStatusClient.__ptr_.__value_;
  if (v13)
  {
    objc_msgSend(*((id *)v13 + 2), "unregister:forNotification:", *((_QWORD *)v13 + 1), 11);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 17);
    v14 = self->_daemonStatusClient.__ptr_.__value_;
    self->_daemonStatusClient.__ptr_.__value_ = 0;
    if (v14)
      (*(void (**)(Client *))(*(_QWORD *)v14 + 8))(v14);
  }
}

- (void)onAppUninstallationCheckActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t *v13;
  _BYTE v14[24];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  xpc_activity_state_t v18;

  if (!a3)
  {
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    v8 = qword_10229FF28;
    if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    *(_WORD *)v14 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 16, "Invalid xpc activity.", v14, 2, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
LABEL_31:
    v13 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLSensorMonitor onAppUninstallationCheckActivity:]", "%s\n", v9);
    if (v13 != buf)
      free(v13);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    v7 = qword_10229FF28;
    if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preparing to delete configurations from uninstalled apps", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF20 != -1)
        dispatch_once(&qword_10229FF20, &stru_102152460);
      *(_WORD *)v14 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "Preparing to delete configurations from uninstalled apps", v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onAppUninstallationCheckActivity:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLSensorMonitor clearConfigurationsForUninstalledApps:](self, "clearConfigurationsForUninstalledApps:", a3);
    return;
  }
  if (qword_10229FF20 != -1)
    dispatch_once(&qword_10229FF20, &stru_102152460);
  v10 = qword_10229FF28;
  if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "com.apple.locationd.AppUninstallationCheck";
    v17 = 2048;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected %{public}s activity state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    *(_DWORD *)v14 = 136446466;
    *(_QWORD *)&v14[4] = "com.apple.locationd.AppUninstallationCheck";
    *(_WORD *)&v14[12] = 2048;
    *(_QWORD *)&v14[14] = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 16, "Unexpected %{public}s activity state: %ld", v14, 22, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
    goto LABEL_31;
  }
}

- (void)scheduleAppUninstallationCheck
{
  NSObject *v3;
  xpc_object_t v4;
  const char *v5;
  uint8_t *v6;
  _QWORD handler[5];
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int64_t v15;

  if (qword_10229FF20 != -1)
    dispatch_once(&qword_10229FF20, &stru_102152460);
  v3 = qword_10229FF28;
  if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "com.apple.locationd.AppUninstallationCheck";
    v14 = 2050;
    v15 = XPC_ACTIVITY_INTERVAL_1_MIN;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with delay=(%{public}lld)", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    v8 = 136446466;
    v9 = "com.apple.locationd.AppUninstallationCheck";
    v10 = 2050;
    v11 = XPC_ACTIVITY_INTERVAL_1_MIN;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "%{public}s: Registering XPC Activity with delay=(%{public}lld)", &v8, 22);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor scheduleAppUninstallationCheck]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100780A5C;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLSensorMonitor"));
  xpc_activity_register("com.apple.locationd.AppUninstallationCheck", v4, handler);
  xpc_release(v4);
}

- (void)clearConfigurationsForUninstalledApps:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD v15[6];
  int v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = sub_100EFA98C();
  sub_100EFD3D8(v6, (uint64_t)v5);
  if (!-[CLSensorMonitor deferXpcActivityIfNecessary:](self, "deferXpcActivityIfNecessary:", a3))
  {
    sub_100197040();
    if (sub_100195F08() && objc_msgSend(v5, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v5, "setObject:atIndexedSubscript:", objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "stringByAppendingPathExtension:", CFSTR("watchkitapp")), v7);
        if (qword_10229FF20 != -1)
          dispatch_once(&qword_10229FF20, &stru_102152460);
        v8 = qword_10229FF28;
        if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEBUG))
        {
          v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
          *(_DWORD *)buf = 138543362;
          v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updated bundleId to %{public}@ for uninstall check", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FF20 != -1)
            dispatch_once(&qword_10229FF20, &stru_102152460);
          v10 = qword_10229FF28;
          v11 = objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
          v16 = 138543362;
          v17 = v11;
          LODWORD(v14) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "Updated bundleId to %{public}@ for uninstall check", &v16, v14);
          v13 = (uint8_t *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor clearConfigurationsForUninstalledApps:]", "%s\n", v12);
          if (v13 != buf)
            free(v13);
        }
        ++v7;
      }
      while (v7 < (unint64_t)objc_msgSend(v5, "count"));
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100780F34;
    v15[3] = &unk_102152420;
    v15[4] = self;
    v15[5] = a3;
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLAppMonitor"), CFSTR("CLSensorMonitor")), "checkApplications:withReply:", v5, v15);
  }
}

- (BOOL)deferXpcActivityIfNecessary:(id)a3
{
  _BOOL4 should_defer;
  NSObject *v5;
  NSObject *v6;
  xpc_activity_state_t state;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  xpc_activity_state_t v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  xpc_activity_state_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  xpc_activity_state_t v24;

  should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
  if (should_defer)
  {
    if (qword_10229FF20 != -1)
      dispatch_once(&qword_10229FF20, &stru_102152460);
    v5 = qword_10229FF28;
    if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v22 = "com.apple.locationd.AppUninstallationCheck";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to defer %{public}s activity", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF20 != -1)
        dispatch_once(&qword_10229FF20, &stru_102152460);
      v17 = 136446210;
      v18 = "com.apple.locationd.AppUninstallationCheck";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "Attempting to defer %{public}s activity", &v17, 12);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor deferXpcActivityIfNecessary:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    if (xpc_activity_set_state((xpc_activity_t)a3, 3))
    {
      LOBYTE(should_defer) = 1;
    }
    else
    {
      if (qword_10229FF20 != -1)
        dispatch_once(&qword_10229FF20, &stru_102152460);
      v6 = qword_10229FF28;
      if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_FAULT))
      {
        state = xpc_activity_get_state((xpc_activity_t)a3);
        *(_DWORD *)buf = 136446466;
        v22 = "com.apple.locationd.AppUninstallationCheck";
        v23 = 2050;
        v24 = state;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Failed to mark %{public}s activity as deferred. Current state is %{public}ld", buf, 0x16u);
      }
      v8 = sub_1001BFF7C(115, 0);
      LOBYTE(should_defer) = 0;
      if (v8)
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FF20 != -1)
          dispatch_once(&qword_10229FF20, &stru_102152460);
        v11 = qword_10229FF28;
        v12 = xpc_activity_get_state((xpc_activity_t)a3);
        v17 = 136446466;
        v18 = "com.apple.locationd.AppUninstallationCheck";
        v19 = 2050;
        v20 = v12;
        LODWORD(v16) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 17, "Failed to mark %{public}s activity as deferred. Current state is %{public}ld", &v17, v16);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 0, "-[CLSensorMonitor deferXpcActivityIfNecessary:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
        LOBYTE(should_defer) = 0;
      }
    }
  }
  return should_defer;
}

- (void)onStepNotification:(int)a3 data:(NotificationData *)a4
{
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;
  char v18;
  char v19;
  id v20;
  NSObject *v21;
  double v22;
  unsigned int v23;
  int v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  NSNumber *v32;
  NSNumber *v33;
  NSNumber *v34;
  NSNumber *v35;
  NSNumber *v36;
  double v37;
  unsigned int v38;
  int v39;
  const char *v40;
  uint8_t *v41;
  const char *v42;
  uint8_t *v43;
  uint64_t v44;
  NSNumber *v45;
  uint64_t v46;
  NSNumber *v47;
  unsigned int v48;
  CLSensorMonitor *v49;
  id v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  double v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  double v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  unsigned int v81;
  __int16 v82;
  unsigned int v83;
  __int16 v84;
  unsigned int v85;
  __int16 v86;
  unsigned int v87;
  __int16 v88;
  int v89;
  uint8_t buf[4];
  double v91;
  __int16 v92;
  unsigned int v93;
  __int16 v94;
  double v95;
  __int16 v96;
  int v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  double v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  unsigned int v115;
  __int16 v116;
  unsigned int v117;
  __int16 v118;
  unsigned int v119;
  __int16 v120;
  unsigned int v121;
  __int16 v122;
  int v123;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "silo");
  if (a3 == 3)
  {
    v20 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *(double *)a4);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v21 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(double *)a4;
      v23 = *((unsigned __int8 *)a4 + 8);
      v24 = *((unsigned __int8 *)a4 + 9);
      *(_DWORD *)buf = 134349568;
      v91 = v22;
      v92 = 1026;
      v93 = v23;
      v94 = 1026;
      LODWORD(v95) = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - OdometerSuitability values,startDate,%{public}.8f,suitableForRunning,%{public}d,suitableForWalking,%{public}d", buf, 0x18u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v37 = *(double *)a4;
      v38 = *((unsigned __int8 *)a4 + 8);
      v39 = *((unsigned __int8 *)a4 + 9);
      v56 = 134349568;
      v57 = v37;
      v58 = 1026;
      v59 = v38;
      v60 = 1026;
      LODWORD(v61) = v39;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - OdometerSuitability values,startDate,%{public}.8f,suitableForRunning,%{public}d,suitableForWalking,%{public}d", &v56, 24);
      v41 = (uint8_t *)v40;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v40);
      if (v41 != buf)
        free(v41);
    }
    v25 = objc_msgSend(objc_alloc((Class)CMOdometerSuitability), "initWithStartDate:suitableForRunning:suitableForWalking:", v20, *((unsigned __int8 *)a4 + 8), *((unsigned __int8 *)a4 + 9));
    -[SRSensorWriter provideSample:](self->_odometerSuitabilityWriter, "provideSample:", v25);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v26 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - OdometerSuitability sample sent to SensorKit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v56) = 0;
      LODWORD(v44) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - OdometerSuitability sample sent to SensorKit", &v56, v44);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
  }
  else
  {
    if (a3)
      return;
    v49 = self;
    v8 = *((double *)a4 + 1);
    v7 = *((double *)a4 + 2);
    v9 = *((_DWORD *)a4 + 6);
    v10 = *((double *)a4 + 4);
    v12 = *((unsigned int *)a4 + 16);
    v11 = *((unsigned int *)a4 + 17);
    v14 = *((double *)a4 + 9);
    v13 = *((double *)a4 + 10);
    v15 = *((double *)a4 + 11);
    v16 = *((_DWORD *)a4 + 24);
    v17 = *((_QWORD *)a4 + 13);
    v18 = *((_BYTE *)a4 + 112);
    v19 = *((_BYTE *)a4 + 113);
    v54 = *((_DWORD *)a4 + 37);
    v55 = *((_DWORD *)a4 + 36);
    v51 = *((_DWORD *)a4 + 39);
    v52 = *((_DWORD *)a4 + 40);
    v53 = *((unsigned __int8 *)a4 + 166);
    if (v17)
      v50 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v17);
    else
      v50 = 0;
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v29 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134353152;
      v91 = v8;
      v92 = 1026;
      v93 = v9;
      v94 = 2050;
      v95 = v10;
      v96 = 1026;
      v97 = v12;
      v98 = 1026;
      v99 = v11;
      v100 = 1026;
      v101 = v16;
      v102 = 2050;
      v103 = v14;
      v104 = 2050;
      v105 = v13;
      v106 = 2050;
      v107 = v7;
      v108 = 2050;
      v109 = v15;
      v110 = 1026;
      v111 = v18 & 1;
      v112 = 1026;
      v113 = v19 & 1;
      v114 = 1026;
      v115 = v55;
      v116 = 1026;
      v117 = v54;
      v118 = 1026;
      v119 = v51;
      v120 = 1026;
      v121 = v52;
      v122 = 1026;
      v123 = v53;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - StepCount values,startDate,%{public}.8f,count,%{public}d,distance,%{public}.3f,floorsAscended,%{public}d,floorsDescended,%{public}d,recordId,%{public}d,currentPace,%{public}.3f,currentCadence,%{public}.3f,firstStepTime,%{public}.8f,activeTime,%{public}.8f,isOdometerDistance,%{public}d,isOdometerPace,%{public}d,pushCount,%{public}d,workoutType,%{public}d,elevationAscended,%{public}d,elevationDescended,%{public}d,distanceSource,%{public}d", buf, 0x80u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v56 = 134353152;
      v57 = v8;
      v58 = 1026;
      v59 = v9;
      v60 = 2050;
      v61 = v10;
      v62 = 1026;
      v63 = v12;
      v64 = 1026;
      v65 = v11;
      v66 = 1026;
      v67 = v16;
      v68 = 2050;
      v69 = v14;
      v70 = 2050;
      v71 = v13;
      v72 = 2050;
      v73 = v7;
      v74 = 2050;
      v75 = v15;
      v76 = 1026;
      v77 = v18 & 1;
      v78 = 1026;
      v79 = v19 & 1;
      v80 = 1026;
      v81 = v55;
      v82 = 1026;
      v83 = v54;
      v84 = 1026;
      v85 = v51;
      v86 = 1026;
      v87 = v52;
      v88 = 1026;
      v89 = v53;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - StepCount values,startDate,%{public}.8f,count,%{public}d,distance,%{public}.3f,floorsAscended,%{public}d,floorsDescended,%{public}d,recordId,%{public}d,currentPace,%{public}.3f,currentCadence,%{public}.3f,firstStepTime,%{public}.8f,activeTime,%{public}.8f,isOdometerDistance,%{public}d,isOdometerPace,%{public}d,pushCount,%{public}d,workoutType,%{public}d,elevationAscended,%{public}d,elevationDescended,%{public}d,distanceSource,%{public}d", &v56, 128);
      v43 = (uint8_t *)v42;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onStepNotification:data:]", "%s\n", v42);
      if (v43 != buf)
        free(v43);
    }
    v48 = v9;
    v30 = v16;
    v31 = objc_alloc((Class)CMPedometerData);
    v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12);
    v33 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11);
    if (v14 == 0.0)
      v47 = 0;
    else
      v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14);
    v34 = v32;
    if (v13 == 0.0)
      v35 = 0;
    else
      v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13);
    v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15);
    LODWORD(v46) = v53;
    v45 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18 & 1);
    v20 = v50;
    v25 = objc_msgSend(v31, "initWithStartDate:endDate:steps:distance:floorsAscended:floorsDescended:recordID:currentPace:currentCadence:firstStepTime:activeTime:sourceId:isOdometerDistance:isOdometerPace:pushes:workoutType:elevationAscended:elevationDescended:distanceSource:", v48, v34, v33, v30, v47, v35, v8, v8, v10, v7, v36, v50, v45, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v19 & 1), __PAIR64__(v54, v55),
            +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v51),
            +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v52),
            v46);
    -[SRSensorWriter provideSample:](v49->_pedometerWriter, "provideSample:", v25);
  }

}

- (void)onFallSnippetNotification:(int)a3 data:(ImpactStreamData *)a4
{
  id v6;
  NSDate *v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  NSString *v18;
  uint8_t buf[4];
  NSString *v20;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe", *(_QWORD *)&a3), "silo");
  v6 = objc_msgSend(objc_alloc((Class)CMFallStats), "initWithBufferAndLength:length:", *(_QWORD *)((char *)&a4->var5 + 7), *(_QWORD *)((char *)&a4->var6 + 7) - *(_QWORD *)((char *)&a4->var5 + 7));
  LOBYTE(v17) = 0;
  sub_1018BF25C(buf, "SensorMonitorFallFileDump", (unsigned __int8 *)&v17, 0);
  if (buf[1])
  {
    v7 = +[NSDate date](NSDate, "date");
    v8 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v8, "setDateFormat:", CFSTR("yyyyMMdd_HH-mm-ss"));
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("file:///tmp/com.apple.locationd/CMFallSnippetData_%@.msl"), objc_msgSend(v8, "stringFromDate:", v7));
    objc_msgSend(objc_msgSend(v6, "binarySampleRepresentation"), "writeToURL:atomically:", objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v9), 1);
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102152480);
    v10 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Dumped snippet in [%@]", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102152480);
      v17 = 138412290;
      v18 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "Dumped snippet in [%@]", &v17, 12);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onFallSnippetNotification:data:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021524A0);
  v11 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = (NSString *)v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#SensorMonitor get fall stats %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021524A0);
    v17 = 138412290;
    v18 = (NSString *)v6;
    LODWORD(v16) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 2, "#SensorMonitor get fall stats %@", &v17, v16);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onFallSnippetNotification:data:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  -[SRSensorWriter provideSample:](self->_fallStatsWriter, "provideSample:", v6);

}

- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  int v11;
  int v12;
  int v13;
  id v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  NSDate *v26;
  uint64_t v27;
  CLOdometerEntry *p_previousOdometerEntry;
  double startTime;
  NSNumber *v30;
  NSObject *v31;
  double v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  double v36;
  int v37;
  int v38;
  int v39;
  const char *v40;
  uint8_t *v41;
  const char *v42;
  uint8_t *v43;
  const char *v44;
  uint8_t *v45;
  const char *v46;
  uint8_t *v47;
  double v48;
  const char *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSDate *v54;
  uint64_t v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  CLOdometerTrackProximityInfo v63;
  __int128 v64;
  __int128 v65;
  int v66;
  double v67;
  __int16 v68;
  _BYTE v69[10];
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  int v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  double v89;
  int v90;
  uint8_t buf[4];
  double v92;
  __int16 v93;
  _BYTE v94[10];
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  double v101;
  __int16 v102;
  int v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  double v111;
  __int16 v112;
  double v113;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "silo");
  if (a3 == 7)
  {
LABEL_4:
    v7 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *((double *)a4 + 1));
    v8 = *((int *)a4 + 10);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v9 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      v10 = *((double *)a4 + 1);
      v11 = *((_DWORD *)a4 + 4);
      v12 = *((_DWORD *)a4 + 5);
      v13 = *((_DWORD *)a4 + 10);
      *(_DWORD *)buf = 134349824;
      v92 = v10;
      v93 = 1026;
      *(_DWORD *)v94 = v11;
      *(_WORD *)&v94[4] = 1026;
      *(_DWORD *)&v94[6] = v12;
      LOWORD(v95) = 1026;
      *(_DWORD *)((char *)&v95 + 2) = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Elevation values,startTime,%{public}.8f,elevationAscended,%{public}d,elevationDescended,%{public}d,source,%{public}d", buf, 0x1Eu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v36 = *((double *)a4 + 1);
      v37 = *((_DWORD *)a4 + 4);
      v38 = *((_DWORD *)a4 + 5);
      v39 = *((_DWORD *)a4 + 10);
      v66 = 134349824;
      v67 = v36;
      v68 = 1026;
      *(_DWORD *)v69 = v37;
      *(_WORD *)&v69[4] = 1026;
      *(_DWORD *)&v69[6] = v38;
      LOWORD(v70) = 1026;
      *(_DWORD *)((char *)&v70 + 2) = v39;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Elevation values,startTime,%{public}.8f,elevationAscended,%{public}d,elevationDescended,%{public}d,source,%{public}d", &v66, 30);
      v41 = (uint8_t *)v40;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v40);
      if (v41 != buf)
        free(v41);
    }
    v14 = objc_msgSend(objc_alloc((Class)CMElevationData), "initWithStartDate:endDate:elevationAscended:elevationDescended:source:recordId:sourceId:", v7, v7, *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), v8, 0, 0);
    -[SRSensorWriter provideSample:](self->_elevationWriter, "provideSample:", v14);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v15 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Elevation sample sent to SensorKit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v66) = 0;
      LODWORD(v51) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Elevation sample sent to SensorKit", &v66, v51);
      v43 = (uint8_t *)v42;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v42);
      if (v43 != buf)
        free(v43);
    }

    return;
  }
  if (a3 != 4)
  {
    if (a3 != 3)
      return;
    goto LABEL_4;
  }
  v16 = *(double *)a4;
  v17 = *((double *)a4 + 1);
  v18 = *((double *)a4 + 2);
  v19 = *((double *)a4 + 4);
  v20 = *((double *)a4 + 5);
  v21 = *((double *)a4 + 7);
  v57 = *((double *)a4 + 6);
  v58 = *((double *)a4 + 3);
  v22 = *((double *)a4 + 8);
  v89 = *((double *)a4 + 9);
  v23 = *((_DWORD *)a4 + 21);
  v90 = *((_DWORD *)a4 + 20);
  v55 = *((_QWORD *)a4 + 11);
  v24 = *((double *)a4 + 13);
  v59 = v19;
  v60 = *((double *)a4 + 12);
  v64 = *((_OWORD *)a4 + 7);
  v65 = *((_OWORD *)a4 + 8);
  v25 = *((double *)a4 + 18);
  v61 = *((double *)a4 + 19);
  v62 = *((_OWORD *)a4 + 10);
  v63 = (CLOdometerTrackProximityInfo)*((_OWORD *)a4 + 11);
  v26 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v16);
  v27 = v23 == 1;
  if (v23 == 2)
    v27 = 2;
  v53 = v27;
  v54 = v26;
  p_previousOdometerEntry = &self->_previousOdometerEntry;
  startTime = self->_previousOdometerEntry.startTime;
  v56 = v23;
  if (startTime == 0.0)
    goto LABEL_25;
  if (vabdd_f64(v16, startTime) >= 1800.0)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v31 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      v32 = p_previousOdometerEntry->startTime;
      *(_DWORD *)buf = 134349312;
      v92 = v16;
      v93 = 2050;
      *(double *)v94 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Ignoring cached OdometerEntry due to significant time between entries (%{public}.2f) (%{public}.2f)", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v48 = p_previousOdometerEntry->startTime;
      v66 = 134349312;
      v67 = v16;
      v68 = 2050;
      *(double *)v69 = v48;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "Ignoring cached OdometerEntry due to significant time between entries (%{public}.2f) (%{public}.2f)", &v66, 22);
      v50 = (uint8_t *)v49;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v49);
      if (v50 != buf)
        free(v50);
    }
LABEL_25:
    v30 = 0;
    goto LABEL_26;
  }
  v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v60 - self->_previousOdometerEntry.groundAltitude);
LABEL_26:
  v33 = objc_msgSend(objc_alloc((Class)CMOdometerData), "initWithDeltaDistance:startDate:endDate:accuracy:rawSpeed:gpsSpeedAccuracy:timestampGps:deltaGroundAltitude:groundAltitudeUncertainty:originDevice:slope:maxAbsSlope:", v54, v54, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22), v17, v30, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24), v53, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v61));
  if (qword_1022A0250 != -1)
    dispatch_once(&qword_1022A0250, &stru_102152440);
  v34 = qword_1022A0258;
  if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134286337;
    v92 = v17;
    v93 = 2050;
    *(double *)v94 = v16;
    *(_WORD *)&v94[8] = 2049;
    v95 = v59;
    v96 = 2049;
    v97 = v20;
    v98 = 2049;
    v99 = v21;
    v100 = 2049;
    v101 = v18;
    v102 = 1025;
    v103 = v56;
    v104 = 2049;
    v105 = v60;
    v106 = 2049;
    v107 = v24;
    v108 = 2049;
    v109 = v22;
    v110 = 2049;
    v111 = v25;
    v112 = 2049;
    v113 = v61;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Odometer values,distance,%{private}.8f,startTime,%{public}.8f,speed,%{private}.8f,rawSpeed,%{private}.4f,gpsSpeedAccuracy,%{private}.4f,accuracy,%{private}.4f,originDevice,%{private}d,groundAltitude,%{private}.4f,groundAltitudeUncertainty,%{private}.4f,timestampGps,%{private}.4f,slope,%{private}.4f,maxAbsSlope,%{private}.4f", buf, 0x76u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v66 = 134286337;
    v67 = v17;
    v68 = 2050;
    *(double *)v69 = v16;
    *(_WORD *)&v69[8] = 2049;
    v70 = v59;
    v71 = 2049;
    v72 = v20;
    v73 = 2049;
    v74 = v21;
    v75 = 2049;
    v76 = v18;
    v77 = 1025;
    v78 = v56;
    v79 = 2049;
    v80 = v60;
    v81 = 2049;
    v82 = v24;
    v83 = 2049;
    v84 = v22;
    v85 = 2049;
    v86 = v25;
    v87 = 2049;
    v88 = v61;
    LODWORD(v52) = 118;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Odometer values,distance,%{private}.8f,startTime,%{public}.8f,speed,%{private}.8f,rawSpeed,%{private}.4f,gpsSpeedAccuracy,%{private}.4f,accuracy,%{private}.4f,originDevice,%{private}d,groundAltitude,%{private}.4f,groundAltitudeUncertainty,%{private}.4f,timestampGps,%{private}.4f,slope,%{private}.4f,maxAbsSlope,%{private}.4f", &v66, v52);
    v45 = (uint8_t *)v44;
    sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v44);
    if (v45 != buf)
      free(v45);
  }
  -[SRSensorWriter provideSample:](self->_odometerWriter, "provideSample:", v33);
  if (qword_1022A0250 != -1)
    dispatch_once(&qword_1022A0250, &stru_102152440);
  v35 = qword_1022A0258;
  if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Odometer sample sent to SensorKit", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    LOWORD(v66) = 0;
    LODWORD(v52) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Odometer sample sent to SensorKit", &v66, v52);
    v47 = (uint8_t *)v46;
    sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onOdometerNotification:data:]", "%s\n", v46);
    if (v47 != buf)
      free(v47);
  }
  p_previousOdometerEntry->startTime = v16;
  self->_previousOdometerEntry.distance = v17;
  self->_previousOdometerEntry.accuracy = v18;
  self->_previousOdometerEntry.gpsAltitude = v58;
  self->_previousOdometerEntry.speed = v59;
  self->_previousOdometerEntry.rawSpeed = v20;
  self->_previousOdometerEntry.odometer = v57;
  self->_previousOdometerEntry.gpsSpeedAccuracy = v21;
  self->_previousOdometerEntry.timestampGps = v22;
  self->_previousOdometerEntry.machContinuousTime = v89;
  self->_previousOdometerEntry.quality = v90;
  self->_previousOdometerEntry.originDevice = v56;
  *(_QWORD *)&self->_previousOdometerEntry.type = v55;
  self->_previousOdometerEntry.groundAltitude = v60;
  self->_previousOdometerEntry.groundAltitudeUncertainty = v24;
  *(_OWORD *)&self->_previousOdometerEntry.smoothedGPSAltitude = v64;
  *(_OWORD *)&self->_previousOdometerEntry.gpsCourseRadians = v65;
  self->_previousOdometerEntry.slope = v25;
  self->_previousOdometerEntry.maxAbsSlope = v61;
  *(_OWORD *)&self->_previousOdometerEntry.batchedLocationFixType = v62;
  self->_previousOdometerEntry.trackProximityInfo = v63;

}

- (void)onCatherineNotification:(int)a3 data:(NotificationData *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint8_t *v27;
  const char *v28;
  uint8_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  uint64_t v66;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe"), "silo");
  if (a3 == 10)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *((double *)a4 + 5));
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v8 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      v9 = *((_QWORD *)a4 + 1);
      v10 = *((_QWORD *)a4 + 2);
      v11 = *((unsigned __int8 *)a4 + 24);
      v12 = *(_DWORD *)a4;
      v14 = *((_QWORD *)a4 + 4);
      v13 = *((_QWORD *)a4 + 5);
      v15 = *((_DWORD *)a4 + 14);
      *(_DWORD *)buf = 134351105;
      v50 = v13;
      v51 = 2049;
      v52 = v9;
      v53 = 2049;
      v54 = v10;
      v55 = 1026;
      v56 = v11;
      v57 = 1026;
      v58 = v12;
      v59 = 2050;
      v60 = v14;
      v61 = 1026;
      v62 = v15;
      v63 = 1026;
      v64 = v15 == 5;
      v65 = 2050;
      v66 = 0x3FF0000000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - HeartRate values,startTime,%{public}.8f,catherine,%{private}.0f,confidence,%{private}.0f,error,%{public}d,dataSource,%{public}d,timestamp,%{public}.8f,context,%{public}d,convertedMode,%{public}d,frequency,%{public}f", buf, 0x4Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v19 = *((_QWORD *)a4 + 1);
      v20 = *((_QWORD *)a4 + 2);
      v21 = *((unsigned __int8 *)a4 + 24);
      v22 = *(_DWORD *)a4;
      v24 = *((_QWORD *)a4 + 4);
      v23 = *((_QWORD *)a4 + 5);
      v25 = *((_DWORD *)a4 + 14);
      v31 = 134351105;
      v32 = v23;
      v33 = 2049;
      v34 = v19;
      v35 = 2049;
      v36 = v20;
      v37 = 1026;
      v38 = v21;
      v39 = 1026;
      v40 = v22;
      v41 = 2050;
      v42 = v24;
      v43 = 1026;
      v44 = v25;
      v45 = 1026;
      v46 = v25 == 5;
      v47 = 2050;
      v48 = 0x3FF0000000000000;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - HeartRate values,startTime,%{public}.8f,catherine,%{private}.0f,confidence,%{private}.0f,error,%{public}d,dataSource,%{public}d,timestamp,%{public}.8f,context,%{public}d,convertedMode,%{public}d,frequency,%{public}f", &v31, 76);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onCatherineNotification:data:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    if (*((double *)a4 + 2) >= 0.4 && *(_DWORD *)a4 == 3)
    {
      v16 = objc_msgSend(objc_alloc((Class)CMHeartRateData), "initWithHeartRate:confidence:timestamp:startDate:error:dataSource:mode:", v7, *((unsigned __int8 *)a4 + 24), 3, *((_DWORD *)a4 + 14) == 5, *((double *)a4 + 1), *((double *)a4 + 2), *((double *)a4 + 4));
      objc_msgSend(v16, "setFrequency:", 1.0);
      v17 = objc_msgSend(objc_alloc((Class)CMHighFrequencyHeartRateData), "initWithHeartRateData:", v16);
      if (v17)
      {
        -[SRSensorWriter provideSample:](self->_heartRateWriter, "provideSample:", v17);
        if (qword_1022A0250 != -1)
          dispatch_once(&qword_1022A0250, &stru_102152440);
        v18 = qword_1022A0258;
        if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Heart rate sample sent to SensorKit", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0250 != -1)
            dispatch_once(&qword_1022A0250, &stru_102152440);
          LOWORD(v31) = 0;
          LODWORD(v30) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Heart rate sample sent to SensorKit", &v31, v30);
          v29 = (uint8_t *)v28;
          sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onCatherineNotification:data:]", "%s\n", v28);
          if (v29 != buf)
            free(v29);
        }
      }

    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t *v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (*a3 == 4)
  {
    v10 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *(double *)a4);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v11 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)a4;
      v13 = *((_QWORD *)a4 + 1);
      v14 = *((_QWORD *)a4 + 2);
      v15 = *((_QWORD *)a4 + 3);
      v16 = *((_QWORD *)a4 + 4);
      v17 = *((_QWORD *)a4 + 5);
      v18 = *((_QWORD *)a4 + 6);
      *(_DWORD *)buf = 134350593;
      v48 = v12;
      v49 = 2049;
      v50 = v13;
      v51 = 2049;
      v52 = v14;
      v53 = 2050;
      v54 = v15;
      v55 = 2050;
      v56 = v16;
      v57 = 2049;
      v58 = v17;
      v59 = 2049;
      v60 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - PhysicalActivityEvent values,startTime,%{public}.8f,eventType,%{private}ld,action,%{private}ld,reason,%{public}ld,workoutType,%{public}ld,recoveryStart,%{private}.8f,recoveryEnd,%{private}.8f", buf, 0x48u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v21 = *(_QWORD *)a4;
      v22 = *((_QWORD *)a4 + 1);
      v23 = *((_QWORD *)a4 + 2);
      v24 = *((_QWORD *)a4 + 3);
      v25 = *((_QWORD *)a4 + 4);
      v26 = *((_QWORD *)a4 + 5);
      v27 = *((_QWORD *)a4 + 6);
      v33 = 134350593;
      v34 = v21;
      v35 = 2049;
      v36 = v22;
      v37 = 2049;
      v38 = v23;
      v39 = 2050;
      v40 = v24;
      v41 = 2050;
      v42 = v25;
      v43 = 2049;
      v44 = v26;
      v45 = 2049;
      v46 = v27;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - PhysicalActivityEvent values,startTime,%{public}.8f,eventType,%{private}ld,action,%{private}ld,reason,%{public}ld,workoutType,%{public}ld,recoveryStart,%{private}.8f,recoveryEnd,%{private}.8f", &v33, 72);
      v29 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onMotionStateMediatorNotification:data:]", "%s\n", v28);
      if (v29 != buf)
        free(v29);
    }
    v19 = objc_msgSend(objc_alloc((Class)CMActivityEventData), "initWithStartDate:eventType:action:reason:workoutType:", v10, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2), *((_QWORD *)a4 + 3), *((_QWORD *)a4 + 4));
    objc_msgSend(v19, "setHeartRateRecoveryStartTime:", *((double *)a4 + 5));
    objc_msgSend(v19, "setHeartRateRecoveryEndTime:", *((double *)a4 + 6));
    -[SRSensorWriter provideSample:](self->_physicalActivityEventWriter, "provideSample:", v19);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v20 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLSensorMonitor - Physical Activity Event sample sent to SensorKit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v33) = 0;
      LODWORD(v32) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "CLSensorMonitor - Physical Activity Event sample sent to SensorKit", &v33, v32);
      v31 = (uint8_t *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onMotionStateMediatorNotification:data:]", "%s\n", v30);
      if (v31 != buf)
        free(v31);
    }

  }
}

- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  Client *value;
  Client *v8;
  NSObject *v9;
  int v10;
  int v11;
  const char *v12;
  uint8_t *v13;
  _DWORD v14[4];
  uint8_t buf[4];
  int v16;

  objc_msgSend(-[CLSensorMonitor universe](self, "universe", a3, a4), "silo");
  if (*a3 == 17 || *a3 == 11)
  {
    value = self->_daemonStatusClient.__ptr_.__value_;
    if (value)
    {
      objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 11);
      objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 17);
      v8 = self->_daemonStatusClient.__ptr_.__value_;
      self->_daemonStatusClient.__ptr_.__value_ = 0;
      if (v8)
        (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v9 = qword_1022A0258;
      if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *a3;
        *(_DWORD *)buf = 67109120;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received %d notification from daemon status", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0250 != -1)
          dispatch_once(&qword_1022A0250, &stru_102152440);
        v11 = *a3;
        v14[0] = 67109120;
        v14[1] = v11;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 0, "Received %d notification from daemon status", v14);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor onDaemonStatusNotification:data:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
      -[CLSensorMonitor scheduleAppUninstallationCheck](self, "scheduleAppUninstallationCheck");
    }
  }
}

- (Class)classForSensorIdentifier:(id)a3
{
  uint64_t v4;
  _QWORD *v5;

  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4200()) & 1) != 0)
  {
    v5 = CMPedometerData_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4208()) & 1) != 0)
  {
    v5 = CMOdometerSuitability_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4210()) & 1) != 0)
  {
    v5 = CMFallStats_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4218()) & 1) != 0)
  {
    v5 = CMElevationData_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4220()) & 1) != 0)
  {
    v5 = CMOdometerData_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if ((objc_msgSend(a3, "isEqualToString:", off_1022A4228()) & 1) != 0)
  {
    v5 = CMHighFrequencyHeartRateData_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  if (objc_msgSend(a3, "isEqualToString:", off_1022A4230()))
  {
    v5 = CMActivityEventData_ptr;
    return (Class)objc_opt_class(*v5, v4);
  }
  return 0;
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  Client *value;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  Client *v13;
  NSObject *v14;
  Client *v15;
  NSObject *v16;
  Client *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  Client *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  const char *v29;
  uint8_t *v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  uint8_t *v34;
  uint8_t *v35;
  _QWORD v36[2];
  uint8_t buf[1640];

  if (self->_pedometerWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v7 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts pedometerWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts pedometerWriter", v36, 2);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    value = self->_stepCountClient.__ptr_.__value_;
    v10 = *((_QWORD *)value + 1);
    v9 = (void *)*((_QWORD *)value + 2);
    v11 = 0;
    goto LABEL_67;
  }
  if (self->_odometerSuitabilityWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v12 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts odometerSuitabilityWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts odometerSuitabilityWriter", v36, 2);
      v30 = (uint8_t *)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    v13 = self->_stepCountClient.__ptr_.__value_;
    v10 = *((_QWORD *)v13 + 1);
    v9 = (void *)*((_QWORD *)v13 + 2);
    v11 = 3;
    goto LABEL_67;
  }
  if (self->_fallStatsWriter == a3)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102152480);
    v14 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts fallStatsWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102152480);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "sensorWriterWillStartMonitoring: starts fallStatsWriter", v36, 2);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    v15 = self->_fallClient.__ptr_.__value_;
    v10 = *((_QWORD *)v15 + 1);
    v9 = (void *)*((_QWORD *)v15 + 2);
    v11 = 2;
    goto LABEL_67;
  }
  if (self->_elevationWriter == a3 && self->_odometerClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v16 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts elevationWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts elevationWriter", v36, 2);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    v17 = self->_odometerClient.__ptr_.__value_;
    v10 = *((_QWORD *)v17 + 1);
    v9 = (void *)*((_QWORD *)v17 + 2);
    v11 = 7;
    goto LABEL_67;
  }
  if (self->_odometerWriter == a3)
  {
    v18 = 24;
    if (self->_odometerClient.__ptr_.__value_)
    {
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v19 = qword_1022A0258;
      if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts odometerWriter", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_66;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts odometerWriter", v36, 2, v36[0]);
LABEL_92:
      v35 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v20);
      if (v35 != buf)
        free(v35);
LABEL_66:
      v24 = *(_QWORD *)&self->CLIntersiloService_opaque[v18];
      v10 = *(_QWORD *)(v24 + 8);
      v9 = *(void **)(v24 + 16);
      v11 = 4;
LABEL_67:
      objc_msgSend(v9, "register:forNotification:registrationInfo:", v10, v11, 0);
      return;
    }
  }
  if (self->_heartRateWriter == a3 && self->_heartRateClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v21 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts heartRateWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts heartRateWriter", v36, 2);
      v34 = (uint8_t *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
    v22 = self->_heartRateClient.__ptr_.__value_;
    v10 = *((_QWORD *)v22 + 1);
    v9 = (void *)*((_QWORD *)v22 + 2);
    v11 = 10;
    goto LABEL_67;
  }
  if (self->_physicalActivityEventWriter == a3)
  {
    v18 = 40;
    if (self->_motionStateMediatorClient.__ptr_.__value_)
    {
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v23 = qword_1022A0258;
      if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "sensorWriterWillStartMonitoring: starts physicalActivityEventWriter", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_66;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterWillStartMonitoring: starts physicalActivityEventWriter", v36, 2, v36[0]);
      goto LABEL_92;
    }
  }
  if (qword_1022A0250 != -1)
    dispatch_once(&qword_1022A0250, &stru_102152440);
  v4 = qword_1022A0258;
  if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "sensorWriterWillStartMonitoring - Unexpected writer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    LOWORD(v36[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 16, "sensorWriterWillStartMonitoring - Unexpected writer", v36, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 0, "-[CLSensorMonitor sensorWriterWillStartMonitoring:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  Client *value;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  Client *v13;
  NSObject *v14;
  Client *v15;
  NSObject *v16;
  Client *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  Client *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint8_t *v26;
  const char *v27;
  uint8_t *v28;
  const char *v29;
  uint8_t *v30;
  const char *v31;
  uint8_t *v32;
  const char *v33;
  uint8_t *v34;
  uint8_t *v35;
  _QWORD v36[2];
  uint8_t buf[1640];

  if (self->_pedometerWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v7 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops pedometerWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops pedometerWriter", v36, 2);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    value = self->_stepCountClient.__ptr_.__value_;
    v10 = *((_QWORD *)value + 1);
    v9 = (void *)*((_QWORD *)value + 2);
    v11 = 0;
    goto LABEL_67;
  }
  if (self->_odometerSuitabilityWriter == a3 && self->_stepCountClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v12 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops odometerSuitabilityWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops odometerSuitabilityWriter", v36, 2);
      v30 = (uint8_t *)v29;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v29);
      if (v30 != buf)
        free(v30);
    }
    v13 = self->_stepCountClient.__ptr_.__value_;
    v10 = *((_QWORD *)v13 + 1);
    v9 = (void *)*((_QWORD *)v13 + 2);
    v11 = 3;
    goto LABEL_67;
  }
  if (self->_fallStatsWriter == a3)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102152480);
    v14 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops fallStatsWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102152480);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD98, 2, "sensorWriterDidStopMonitoring: stops fallStatsWriter", v36, 2);
      v28 = (uint8_t *)v27;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v27);
      if (v28 != buf)
        free(v28);
    }
    v15 = self->_fallClient.__ptr_.__value_;
    v10 = *((_QWORD *)v15 + 1);
    v9 = (void *)*((_QWORD *)v15 + 2);
    v11 = 2;
    goto LABEL_67;
  }
  if (self->_elevationWriter == a3 && self->_odometerClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v16 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops elevationWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops elevationWriter", v36, 2);
      v32 = (uint8_t *)v31;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v31);
      if (v32 != buf)
        free(v32);
    }
    v17 = self->_odometerClient.__ptr_.__value_;
    v10 = *((_QWORD *)v17 + 1);
    v9 = (void *)*((_QWORD *)v17 + 2);
    v11 = 7;
    goto LABEL_67;
  }
  if (self->_odometerWriter == a3)
  {
    v18 = 24;
    if (self->_odometerClient.__ptr_.__value_)
    {
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v19 = qword_1022A0258;
      if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops odometerWriter", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_66;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops odometerWriter", v36, 2, v36[0]);
LABEL_92:
      v35 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v20);
      if (v35 != buf)
        free(v35);
LABEL_66:
      v24 = *(_QWORD *)&self->CLIntersiloService_opaque[v18];
      v10 = *(_QWORD *)(v24 + 8);
      v9 = *(void **)(v24 + 16);
      v11 = 4;
LABEL_67:
      objc_msgSend(v9, "unregister:forNotification:", v10, v11);
      return;
    }
  }
  if (self->_heartRateWriter == a3 && self->_heartRateClient.__ptr_.__value_)
  {
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    v21 = qword_1022A0258;
    if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops heartRateWriter", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops heartRateWriter", v36, 2);
      v34 = (uint8_t *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
    v22 = self->_heartRateClient.__ptr_.__value_;
    v10 = *((_QWORD *)v22 + 1);
    v9 = (void *)*((_QWORD *)v22 + 2);
    v11 = 10;
    goto LABEL_67;
  }
  if (self->_physicalActivityEventWriter == a3)
  {
    v18 = 40;
    if (self->_motionStateMediatorClient.__ptr_.__value_)
    {
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      v23 = qword_1022A0258;
      if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "sensorWriterDidStopMonitoring: stops physicalActivityEventWriter", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_66;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0250 != -1)
        dispatch_once(&qword_1022A0250, &stru_102152440);
      LOWORD(v36[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 2, "sensorWriterDidStopMonitoring: stops physicalActivityEventWriter", v36, 2, v36[0]);
      goto LABEL_92;
    }
  }
  if (qword_1022A0250 != -1)
    dispatch_once(&qword_1022A0250, &stru_102152440);
  v4 = qword_1022A0258;
  if (os_log_type_enabled((os_log_t)qword_1022A0258, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "sensorWriterWillStartMonitoring - Unexpected writer", buf, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0250 != -1)
      dispatch_once(&qword_1022A0250, &stru_102152440);
    LOWORD(v36[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0258, 16, "sensorWriterWillStartMonitoring - Unexpected writer", v36, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 0, "-[CLSensorMonitor sensorWriterDidStopMonitoring:]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)sensorWriter:(id)a3 didReceiveUpdateToConfigurationRequests:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _DWORD v22[4];
  uint8_t buf[4];
  int v24;
  _BYTE v25[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(a4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = sub_100EFA98C();
        v11 = sub_100EFC074(v10, v9);
        if (v11 != 100)
        {
          v12 = v11;
          if (qword_10229FF20 != -1)
            dispatch_once(&qword_10229FF20, &stru_102152460);
          v13 = qword_10229FF28;
          if (os_log_type_enabled((os_log_t)qword_10229FF28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            v24 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Dynamic Config] Error on config insertion: %{public}d", buf, 8u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FF20 != -1)
              dispatch_once(&qword_10229FF20, &stru_102152460);
            v22[0] = 67240192;
            v22[1] = v12;
            LODWORD(v17) = 8;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF28, 0, "[Dynamic Config] Error on config insertion: %{public}d", v22, v17);
            v15 = (uint8_t *)v14;
            sub_100512490("Generic", 1, 0, 2, "-[CLSensorMonitor sensorWriter:didReceiveUpdateToConfigurationRequests:]", "%s\n", v14);
            if (v15 != buf)
              free(v15);
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      v6 = v16;
    }
    while (v16);
  }
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;

  value = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->_heartRateClient.__ptr_.__value_;
  self->_heartRateClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->_odometerClient.__ptr_.__value_;
  self->_odometerClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->_fallClient.__ptr_.__value_;
  self->_fallClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  v8 = self->_stepCountClient.__ptr_.__value_;
  self->_stepCountClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 30) = 0;
  return self;
}

@end

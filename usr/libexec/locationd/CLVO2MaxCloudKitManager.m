@implementation CLVO2MaxCloudKitManager

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
  if (qword_1023016B0 != -1)
    dispatch_once(&qword_1023016B0, &stru_102140BF8);
  return (id)qword_1023016A8;
}

- (CLVO2MaxCloudKitManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLVO2MaxCloudKitManager;
  return -[CLVO2MaxCloudKitManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLVO2MaxCloudKitManagerProtocol, &OBJC_PROTOCOL___CLVO2MaxCloudKitManagerClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_1023016C0 != -1)
    dispatch_once(&qword_1023016C0, &stru_102140C18);
  return byte_1023016B8;
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLVO2MaxCloudKitManager", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LOWORD(v13) = 0;
    LODWORD(v12) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Starting up CLVO2MaxCloudKitManager", &v13, v12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager beginService]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  self->_syncEngine = 0;
  self->fDeviceUnlocked = 0;
  HIBYTE(v12) = 0;
  sub_10050C4D8((unsigned __int8 *)&v12 + 7, buf);
  sub_1002B7674((uint64_t)&self->fInputCache, (__int128 *)buf);
  v4 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v5 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  sub_10050C5D8((uint64_t *)&self->fInputCache, buf);
  sub_1002B7674((uint64_t)&self->fInputStore, (__int128 *)buf);
  v7 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  operator new();
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  Client *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLVO2MaxCloudKitManager", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Shutting down CLVO2MaxCloudKitManager", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CKAccountChangedNotification, 0);
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
  v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5)
    objc_msgSend(*((id *)v5 + 2), "unregister:forNotification:", *((_QWORD *)v5 + 1), 6);

  self->_syncEngine = 0;
  self->_container = 0;
}

- (void)saveInputsAndOutputsForSessionId:(id)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  -[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:](self, "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:", a3, 1, 1);
  objc_autoreleasePoolPop(v5);
}

- (void)saveRetrocomputedOutputs
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  uint8_t buf[8];
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 uu1[8];
  uint64_t v14;

  if (self->_syncEngine)
  {
    *(_QWORD *)buf = 0;
    v11 = 0;
    v12 = 0;
    sub_1011F6B30((uint64_t)self->fStagingOutputStore.__ptr_.__value_, buf);
    *(_QWORD *)uu1 = 0;
    v14 = 0;
    v3 = *(unsigned __int8 **)buf;
    v4 = v11;
    if (*(unsigned __int8 **)buf != v11)
    {
      do
      {
        v5 = objc_autoreleasePoolPush();
        if (uuid_compare(uu1, v3 + 24))
        {
          uuid_copy(uu1, v3 + 24);
          -[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:](self, "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:", objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v3 + 24), "UUIDString"), 1, 0);
        }
        objc_autoreleasePoolPop(v5);
        v3 += 184;
      }
      while (v3 != v4);
      v3 = *(unsigned __int8 **)buf;
    }
    if (v3)
    {
      v11 = v3;
      operator delete(v3);
    }
  }
  else
  {
    v6 = sub_101125448();
    if ((sub_101126C04(v6) & 1) == 0)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v7 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Attempt to save retrocomputed outputs to CloudKit failed", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        *(_WORD *)uu1 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Attempt to save retrocomputed outputs to CloudKit failed", uu1, 2);
        v9 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager saveRetrocomputedOutputs]", "%s\n", v8);
        if (v9 != buf)
          free(v9);
      }
    }
  }
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe"), "silo");
  if (!*a3)
    -[CLVO2MaxCloudKitManager updateDeviceUnlocked:](self, "updateDeviceUnlocked:", *(_DWORD *)a4 == 1);
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  int v8;
  int v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe"), "silo");
  if (*a3 == 6)
  {
    -[CLVO2MaxCloudKitManager handleWatchAppFitnessTrackingUpdate:](self, "handleWatchAppFitnessTrackingUpdate:", *(_DWORD *)a4);
  }
  else if (*a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_FAULT))
    {
      v8 = *a3;
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[CKManager] #Warning: Unhandled FitnessTracking notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = *a3;
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 17, "[CKManager] #Warning: Unhandled FitnessTracking notification type, %d", v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager onFitnessTrackingNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
  else
  {
    -[CLVO2MaxCloudKitManager handleFitnessTrackingEnabled:](self, "handleFitnessTrackingEnabled:", *(_BYTE *)a4 & 1);
  }
}

- (void)setUpSyncActivity
{
  double Current;
  uint64_t v4;
  double v5;
  NSObject *v6;
  double v7;
  int64_t v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD handler[6];
  double v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  id v22[2];
  int v23;
  const char *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  int64_t v34;

  sub_100131938(v22, (uint64_t)"VO2MaxCloudKitManager.setUpSyncActivity", 0);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = sub_100127B9C();
  sub_100081C10(v4, &v20);
  v19 = 0.0;
  sub_1001FD98C(v20, "VO2MaxCloudKitManagerNextActivityTime", &v19);
  v5 = v19;
  if (v19 > Current + (double)XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "VO2MaxCloudKitManagerNextActivityTime";
      v31 = 2050;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s is too far in the future (%{public}.2f). Resetting!", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v23 = 136446466;
      v24 = "VO2MaxCloudKitManagerNextActivityTime";
      v25 = 2050;
      v26 = v19;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "%{public}s is too far in the future (%{public}.2f). Resetting!", &v23, 22);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    sub_100525484(v20, "VO2MaxCloudKitManagerNextActivityTime", 0xFFFFFFFFLL);
    v19 = 0.0;
    v5 = 0.0;
  }
  v7 = v5 - Current;
  if (XPC_ACTIVITY_INTERVAL_30_MIN <= (uint64_t)v7)
    v8 = (uint64_t)v7;
  else
    v8 = XPC_ACTIVITY_INTERVAL_30_MIN;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v30 = "com.apple.vo2max.CloudKitManager";
    v31 = 2050;
    v32 = v19;
    v33 = 2050;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v23 = 136446722;
    v24 = "com.apple.vo2max.CloudKitManager";
    v25 = 2050;
    v26 = v19;
    v27 = 2050;
    v28 = v8;
    LODWORD(v17) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "%{public}s: Registering XPC Activity with nextPreprocessingTime=(%{public}.2f) and delay=(%{public}lld)", &v23, v17);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager setUpSyncActivity]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  xpc_activity_unregister("com.apple.vo2max.CloudKitManager");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100501154;
  handler[3] = &unk_1021384B8;
  handler[4] = objc_msgSend(objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVO2MaxCloudKitManager"));
  handler[5] = v8;
  xpc_activity_register("com.apple.vo2max.CloudKitManager", XPC_ACTIVITY_CHECK_IN, handler);
  v10 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  sub_100131740(v22);
}

- (void)resetSyncActivity:(id)a3 withDelay:(int64_t)a4
{
  double v6;
  NSObject *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  xpc_activity_state_t state;
  const char *v14;
  char *v15;
  uint64_t v16;
  xpc_activity_state_t v17;
  const char *v18;
  char *v19;
  uint64_t v20;
  double v21;
  int v22;
  const char *v23;
  __int16 v24;
  double v25;
  _BYTE buf[1628];

  v6 = CFAbsoluteTimeGetCurrent() + (double)a4;
  v21 = v6;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "VO2MaxCloudKitManagerNextActivityTime";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Resetting next activity time to: %{public}.1f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v22 = 136446466;
    v23 = "VO2MaxCloudKitManagerNextActivityTime";
    v24 = 2050;
    v25 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "%{public}s: Resetting next activity time to: %{public}.1f", &v22, 22);
    v15 = (char *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  v8 = sub_100127B9C();
  sub_100081C10(v8, buf);
  sub_10018A4CC(*(uint64_t *)buf, "VO2MaxCloudKitManagerNextActivityTime", &v21);
  v9 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v12 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_FAULT))
    {
      state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = state;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Failed to mark activity as Done. Current state is %{public}ld", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v16 = qword_10229FEC8;
      v17 = xpc_activity_get_state((xpc_activity_t)a3);
      v22 = 134349056;
      v23 = (const char *)v17;
      LODWORD(v20) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 17, "Failed to mark activity as Done. Current state is %{public}ld", &v22, v20);
      v19 = (char *)v18;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  -[CLVO2MaxCloudKitManager setUpSyncActivity](self, "setUpSyncActivity");
}

- (void)onSyncActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t *v10;
  __int128 v11;
  uint8_t buf[4];
  xpc_activity_state_t v13;

  if (!a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Invalid xpc activity.");
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager onSyncActivity:]", "%s\n", v8);
    if (v10 != buf)
      free(v10);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    -[CLVO2MaxCloudKitManager handleSyncUpload:](self, "handleSyncUpload:", a3);
    return;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected activity state: %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unexpected activity state: %ld", &v11);
    goto LABEL_22;
  }
}

- (void)handleSyncUpload:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  uint32_t v10;
  int v11;
  double fMinTimeBetweenForcedFetches;
  int v13;
  NSObject *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  const int64_t *v27;
  const char *v28;
  char *v29;
  const char *v30;
  char *v31;
  const char *v32;
  char *v33;
  const char *v34;
  char *v35;
  const char *v36;
  char *v37;
  uint64_t v38;
  double v39;
  _BYTE v40[12];
  __int16 v41;
  double v42;
  __int16 v43;
  uint32_t v44;
  int v45;
  const char *v46;
  double v47;
  id v48;
  _BYTE buf[22];
  __int16 v50;
  uint32_t v51;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "com.apple.vo2max.CloudKitManager";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CKManager] Running XPC activity: %{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v45 = 136446210;
    v46 = "com.apple.vo2max.CloudKitManager";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "[CKManager] Running XPC activity: %{public}s", &v45, 12);
    v29 = (char *)v28;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v28);
    if (v29 != buf)
      free(v29);
  }
  -[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:](self, "checkForDeletionOfVO2MaxData:", self->fCloudKitDeletionState);
  -[CLVO2MaxCloudKitManager getCKSyncEngineMetadata](self, "getCKSyncEngineMetadata");
  if (v48 && objc_msgSend(v48, "length"))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine metadata available, so attempting to upload unsynced local data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      *(_WORD *)v40 = 0;
      LODWORD(v38) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine metadata available, so attempting to upload unsynced local data", v40, v38);
      v35 = (char *)v34;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v34);
      if (v35 != buf)
        free(v35);
    }
    v7 = 0;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No sync engine metadata available, so attempting to upload all local data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      *(_WORD *)v40 = 0;
      LODWORD(v38) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "No sync engine metadata available, so attempting to upload all local data", v40, v38);
      v31 = (char *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v30);
      if (v31 != buf)
        free(v31);
    }
    v7 = 1;
  }
  -[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:](self, "bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:", v7, 1, 1, 1);
  v9 = 0.0;
  if (v47 != 1.79769313e308)
    v9 = CFAbsoluteTimeGetCurrent() - v47;
  v10 = arc4random_uniform(self->fMinTimeBetweenForcedFetches);
  sub_100197040();
  v11 = sub_10075D288();
  fMinTimeBetweenForcedFetches = self->fMinTimeBetweenForcedFetches;
  if (fMinTimeBetweenForcedFetches == 0.0)
    v13 = v11;
  else
    v13 = 0;
  if (v13 == 1)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v14 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CKManager] INTERNAL - Forcing CloudKit Fetch. Does not count towards daily stats (VO2MaxCloudKitMinTimeBetweenForcedFetches == 0)", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      *(_WORD *)v40 = 0;
      LODWORD(v38) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "[CKManager] INTERNAL - Forcing CloudKit Fetch. Does not count towards daily stats (VO2MaxCloudKitMinTimeBetweenForcedFetches == 0)", v40, v38);
      v33 = (char *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
    -[CKSyncEngine setNeedsToFetchChanges](self->_syncEngine, "setNeedsToFetchChanges");
  }
  else if (v9 > fMinTimeBetweenForcedFetches + (double)v10)
  {
    v39 = 0.0;
    v15 = sub_100127B9C();
    sub_100081C10(v15, buf);
    sub_1001FD98C(*(uint64_t *)buf, "VO2MaxCloudKitLastForcedFetch", &v39);
    v16 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v17 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    v19 = CFAbsoluteTimeGetCurrent() - v39;
    if (v19 > self->fMinTimeBetweenForcedFetches)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v20 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(double *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v19;
        v50 = 1026;
        v51 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Forcing fetch from CloudKit. secondsSinceMetadataUpdate: %{public}f, secondsSinceLastForcedFetch: %{public}f, buffer: %{public}d", buf, 0x1Cu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        *(_DWORD *)v40 = 134349568;
        *(double *)&v40[4] = v9;
        v41 = 2050;
        v42 = v19;
        v43 = 1026;
        v44 = v10;
        LODWORD(v38) = 28;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Forcing fetch from CloudKit. secondsSinceMetadataUpdate: %{public}f, secondsSinceLastForcedFetch: %{public}f, buffer: %{public}d", v40, v38);
        v37 = (char *)v36;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleSyncUpload:]", "%s\n", v36);
        if (v37 != buf)
          free(v37);
      }
      -[CKSyncEngine setNeedsToFetchChanges](self->_syncEngine, "setNeedsToFetchChanges");
      v21 = sub_100127B9C();
      sub_100081C10(v21, buf);
      v22 = *(_QWORD *)buf;
      *(_QWORD *)v40 = CFAbsoluteTimeGetCurrent();
      sub_10018A4CC(v22, "VO2MaxCloudKitLastForcedFetch", v40);
      v23 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v24 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      ++self->fDailyStats.forcedFetchRequestedCount;
    }
  }
  v26 = _os_feature_enabled_impl("CoreLocation", "VO2MaxRetrocompute");
  v27 = &XPC_ACTIVITY_INTERVAL_4_HOURS;
  if (!v26)
    v27 = &XPC_ACTIVITY_INTERVAL_1_DAY;
  -[CLVO2MaxCloudKitManager resetSyncActivity:withDelay:](self, "resetSyncActivity:withDelay:", a3, *v27);
}

- (void)cloudKitAccountDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100502754;
  block[3] = &unk_10212BB58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLVO2MaxCloudKitManager universe](self, "universe", a3), "silo"), "queue"), block);
}

- (void)validateAccount
{
  CKContainer *container;
  _QWORD v3[5];

  container = self->_container;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005027BC;
  v3[3] = &unk_102140C68;
  v3[4] = self;
  -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v3);
}

- (void)deleteLocalVO2MaxData
{
  NSObject *v3;
  _QWORD *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CKManager] Deleting all VO2 Max data local to this device", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "[CKManager] Deleting all VO2 Max data local to this device", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager deleteLocalVO2MaxData]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = (_QWORD *)sub_101125448();
  sub_101125704(v4);
  sub_101109800((uint64_t)self->fInputStore.__ptr_);
  sub_1011F6E30(self->fStagingOutputStore.__ptr_.__value_);
  sub_101139070((_QWORD *)self->fRetrocomputeDb.__ptr_.__value_ + 9);
}

- (void)deleteCloudKitRecords
{
  CKDatabase *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _QWORD v7[5];
  _WORD v8[8];
  uint8_t buf[1640];

  if (self->_container && self->_syncEngine)
  {
    self->fCloudKitDeletionState = 2;
    v3 = -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1005037F0;
    v7[3] = &unk_10212BB80;
    v7[4] = self;
    -[CKDatabase fetchAllRecordZonesWithCompletionHandler:](v3, "fetchAllRecordZonesWithCompletionHandler:", v7);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v4 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[CKManager] Attempted to delete records without a CKContainer or CKSyncEngine", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "[CKManager] Attempted to delete records without a CKContainer or CKSyncEngine", v8, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager deleteCloudKitRecords]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    self->fCloudKitDeletionState = 3;
  }
}

- (BOOL)shouldKeepLocalDataOnAccountChange
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  BOOL result;
  uint64_t v7;
  std::__shared_weak_count *v8;
  BOOL v9;

  v9 = 0;
  v2 = sub_100127B9C();
  sub_100081C10(v2, &v7);
  sub_1001E4874(v7, "VO2MaxCloudKitKeepLocalDataOnAccountChange", &v9);
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  sub_100197040();
  result = sub_10075D288();
  if (!v9)
    return 0;
  return result;
}

- (void)setUserRecordIDName:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v4 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting userRecordIDName to %{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v9 = 138477827;
    v10 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Setting userRecordIDName to %{private}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager setUserRecordIDName:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  v5 = sub_1001FD94C();
  sub_10052861C(v5, CFSTR("kCloudKitUserRecordId"), (char *)objc_msgSend(a3, "UTF8String"));
  v6 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
}

- (id)getUserRecordIDName
{
  uint64_t v2;
  std::string::size_type size;
  id v4;
  std::string *p_p;
  id v6;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  v2 = sub_1001FD94C();
  sub_1000BD5F0(v2, (uint64_t)CFSTR("kCloudKitUserRecordId"), &__p);
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (!size)
  {
    v6 = 0;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      return v6;
    goto LABEL_8;
  }
  v4 = objc_alloc((Class)NSString);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v6 = objc_msgSend(v4, "initWithUTF8String:", p_p);
  if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_8:
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)updateDeviceUnlocked:(BOOL)a3
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (!self->_syncEngine && !self->fDeviceUnlocked && a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device has been unlocked. Will now initialize the sync engine.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Device has been unlocked. Will now initialize the sync engine.", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateDeviceUnlocked:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[CLVO2MaxCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
  }
  self->fDeviceUnlocked = a3;
}

- (void)handleWatchAppFitnessTrackingUpdate:(int)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (a3)
  {
    if (a3 == 2)
    {
      self->fCloudKitDeletionState = 1;
      -[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:](self, "checkForDeletionOfVO2MaxData:", 1);
    }
    else if (a3 == 1)
    {
      self->fCloudKitDeletionState = 0;
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v3 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CKManager] Received an unknown Watch.app Fitness Tracking state", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "[CKManager] Received an unknown Watch.app Fitness Tracking state", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleWatchAppFitnessTrackingUpdate:]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
  }
}

- (void)checkForDeletionOfVO2MaxData:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD v13[2];
  uint8_t buf[4];
  int v15;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CKManager] Checking if CloudKit deletion is necessary. State=%{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LODWORD(v13[0]) = 67240192;
    HIDWORD(v13[0]) = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "[CKManager] Checking if CloudKit deletion is necessary. State=%{public}d", v13, 8);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (a3 == 3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CKManager] Re-attempting VO2 Max data deletion after previous failure", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_21;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LOWORD(v13[0]) = 0;
    LODWORD(v12) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "[CKManager] Re-attempting VO2 Max data deletion after previous failure", v13, v12, v13[0]);
    goto LABEL_30;
  }
  if (a3 != 1)
    return;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v6 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CKManager] VO2Max disabled via Watch FitnessTracking switch. Deleting VO2 Max data", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LOWORD(v13[0]) = 0;
    LODWORD(v12) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "[CKManager] VO2Max disabled via Watch FitnessTracking switch. Deleting VO2 Max data", v13, v12, v13[0]);
LABEL_30:
    v11 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager checkForDeletionOfVO2MaxData:]", "%s\n", v7);
    if (v11 != buf)
      free(v11);
  }
LABEL_21:
  -[CLVO2MaxCloudKitManager deleteLocalVO2MaxData](self, "deleteLocalVO2MaxData");
  -[CLVO2MaxCloudKitManager deleteCloudKitRecords](self, "deleteCloudKitRecords");
}

- (VO2MaxCloudKitSyncEngineMetadata)getCKSyncEngineMetadata
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  VO2MaxCloudKitSyncEngineMetadata *result;
  uint64_t v8;
  id v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  retstr->var3 = 0;
  v4 = sub_101125448();
  sub_101126070(v4, (uint64_t)retstr);
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(retstr->var3, "length");
    *(_DWORD *)buf = 134349056;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loaded sync engine metadata, length = %{public}lu", buf, 0xCu);
  }
  result = (VO2MaxCloudKitSyncEngineMetadata *)sub_1001BFF7C(115, 2);
  if ((_DWORD)result)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    v9 = objc_msgSend(retstr->var3, "length");
    v12 = 134349056;
    v13 = v9;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "Loaded sync engine metadata, length = %{public}lu", &v12, 12);
    v11 = (uint8_t *)v10;
    result = (VO2MaxCloudKitSyncEngineMetadata *)sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager getCKSyncEngineMetadata]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  return result;
}

- (void)initializeSyncEngine
{
  xpc_object_t v3;
  id v4;
  CKSyncEngine *syncEngine;
  CKSyncEngine *v6;
  __int128 v7;
  CKRecordZoneID *fInputZoneID;
  CKRecordZoneID *fOutputZoneID;

  if (self)
    -[CLVO2MaxCloudKitManager getCKSyncEngineMetadata](self, "getCKSyncEngineMetadata");
  else
    v7 = 0u;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  v4 = objc_msgSend(objc_alloc((Class)CKSyncEngineConfiguration), "initWithDatabase:dataSource:metadata:", -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"), self, *((_QWORD *)&v7 + 1));
  objc_msgSend(v4, "setApsMachServiceName:", CFSTR("com.apple.aps.locationd.vo2max.cloudkit"));
  objc_msgSend(v4, "setPriority:", 2);
  objc_msgSend(v4, "setXpcActivityCriteriaOverrides:", v3);
  self->_syncEngine = (CKSyncEngine *)objc_msgSend(objc_alloc((Class)CKSyncEngine), "initWithConfiguration:", v4);
  self->fDailyStats.syncEngineEnabled = 1;
  syncEngine = self->_syncEngine;
  fOutputZoneID = self->fOutputZoneID;
  -[CKSyncEngine fetchChangesForZoneIDs:completionHandler:](syncEngine, "fetchChangesForZoneIDs:completionHandler:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &fOutputZoneID, 1), &stru_102140C88);
  if (self->fFetchChangesForInputZone)
  {
    v6 = self->_syncEngine;
    fInputZoneID = self->fInputZoneID;
    -[CKSyncEngine fetchChangesForZoneIDs:completionHandler:](v6, "fetchChangesForZoneIDs:completionHandler:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &fInputZoneID, 1), &stru_102140CA8);
  }
  xpc_release(v3);
  -[CLVO2MaxCloudKitManager setUpSyncActivity](self, "setUpSyncActivity");
}

- (void)createVO2MaxOutputZone
{
  NSObject *v3;
  CKSyncEngine *syncEngine;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  id v8;
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxOutputs zone", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Creating VO2MaxOutputs zone", &v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createVO2MaxOutputZone]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  syncEngine = self->_syncEngine;
  v8 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", self->fOutputZoneID);
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](syncEngine, "addRecordZonesToSave:recordZoneIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1), 0);
}

- (void)createVO2MaxInputZone
{
  NSObject *v3;
  CKSyncEngine *syncEngine;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  id v8;
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v3 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating VO2MaxInputs zone", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Creating VO2MaxInputs zone", &v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createVO2MaxInputZone]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  syncEngine = self->_syncEngine;
  v8 = objc_msgSend(objc_alloc((Class)CKRecordZone), "initWithZoneID:", self->fInputZoneID);
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](syncEngine, "addRecordZonesToSave:recordZoneIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1), 0);
}

- (void)deleteZone:(id)a3
{
  NSObject *v5;
  CKSyncEngine *syncEngine;
  const char *v7;
  uint8_t *v8;
  id v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting zone with zoneID = %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v10 = 138543362;
    v11 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Deleting zone with zoneID = %{public}@", &v10, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager deleteZone:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  syncEngine = self->_syncEngine;
  v9 = a3;
  -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:](syncEngine, "addRecordZonesToSave:recordZoneIDsToDelete:", 0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
}

- (void)addRecordIDsForSessionId:(id)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5
{
  _BOOL4 v6;
  NSObject *v8;
  id v9;
  CKSyncEngine *syncEngine;
  NSObject *v11;
  id v12;
  CKSyncEngine *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  id v23;
  int v24;
  id v25;
  uint8_t buf[4];
  id v27;

  if (self->_syncEngine)
  {
    v6 = a5;
    if (a4)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxOutputZone", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v24 = 138543362;
        v25 = a3;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxOutputZone", &v24, 12);
        v18 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v17);
        if (v18 != buf)
          free(v18);
      }
      v9 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", a3, self->fOutputZoneID);
      syncEngine = self->_syncEngine;
      v23 = v9;
      -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1), 0);
      ++self->fDailyStats.outputSaveQueuedCount;
    }
    if (v6)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v11 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxInputZone", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v24 = 138543362;
        v25 = a3;
        LODWORD(v21) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Adding sessionId %{public}@ to RecordIDs for sync engine to save to VO2MaxInputZone", &v24, v21);
        v20 = (uint8_t *)v19;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v19);
        if (v20 != buf)
          free(v20);
      }
      v12 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", a3, self->fInputZoneID);
      v13 = self->_syncEngine;
      v22 = v12;
      -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v13, "addRecordIDsToSave:recordIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1), 0);
      ++self->fDailyStats.inputSaveQueuedCount;
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v14 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sync engine uninitialized, so not adding sessionId %{public}@ to RecordIDs for sync engine to save", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v24 = 138543362;
      v25 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine uninitialized, so not adding sessionId %{public}@ to RecordIDs for sync engine to save", &v24, 12);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)bulkUploadRecordIDsShouldReupload:(BOOL)a3 shouldUploadToOutputZone:(BOOL)a4 shouldUploadToInputZone:(BOOL)a5 shouldThrottle:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  _BOOL8 v20;
  char v21;
  char v22;
  NSObject *v23;
  int fMaxSessionsForUploadThrottling;
  int v25;
  const char *v26;
  uint8_t *v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  uint64_t v31;
  int v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  void *__p;
  __n128 *v37;
  uint64_t v38;
  _DWORD v39[4];
  uint8_t buf[8];
  __int128 v41;
  _OWORD v42[3];
  __int128 v43;

  v6 = a6;
  v34 = a5;
  v35 = a4;
  __p = 0;
  v37 = 0;
  v38 = 0;
  v9 = sub_101125448();
  sub_101125E14(v9, &__p);
  v10 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((char *)v37 - (_BYTE *)__p) >> 4));
  *(_QWORD *)buf = sub_100506018;
  if (v37 == __p)
    v11 = 0;
  else
    v11 = v10;
  sub_10050C884((__n128 *)__p, v37, (unsigned int (**)(_QWORD, _QWORD))buf, v11, 1);
  *(_QWORD *)buf = sub_100506038;
  v12 = sub_10050E73C((__int128 *)__p, (__int128 *)v37, (unsigned int (**)(_QWORD, _QWORD))buf);
  if (v37 != (__n128 *)v12)
    v37 = (__n128 *)v12;
  v33 = v6 && 0xCCCCCCCCCCCCCCCDLL * (((char *)v12 - (_BYTE *)__p) >> 4) > self->fMaxSessionsForUploadThrottling;
  if (__p != v12)
  {
    v32 = 0;
    v13 = (__int128 *)((char *)__p + 80);
    do
    {
      v41 = *(v13 - 5);
      v14 = *(v13 - 4);
      v15 = *(v13 - 3);
      v16 = *(v13 - 1);
      v42[2] = *(v13 - 2);
      v43 = v16;
      v42[0] = v14;
      v42[1] = v15;
      v17 = objc_autoreleasePoolPush();
      v18 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v42);
      if (v35)
      {
        v19 = 1;
        if (!a3 && (_QWORD)v43)
          v19 = objc_msgSend((id)v43, "length") == 0;
      }
      else
      {
        v19 = 0;
      }
      v20 = v34
         && (a3 || !*((_QWORD *)&v43 + 1) || !objc_msgSend(*((id *)&v43 + 1), "length"))
         && sub_10110980C((uint64_t *)self->fInputStore.__ptr_, (const unsigned __int8 *)v42);
      if ((v19 || v20)
        && (-[CLVO2MaxCloudKitManager addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:](self, "addRecordIDsForSessionId:shouldUploadToOutputZone:shouldUploadToInputZone:", objc_msgSend(v18, "UUIDString"), v19, v20), v33)&& (++v32, v32 >= self->fMaxSessionsForUploadThrottling))
      {
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v23 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
        {
          fMaxSessionsForUploadThrottling = self->fMaxSessionsForUploadThrottling;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = fMaxSessionsForUploadThrottling;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Hit the max of %{public}d sessions per CloudKit upload. Will check for more data later.", buf, 8u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102140CF0);
          v25 = self->fMaxSessionsForUploadThrottling;
          v39[0] = 67240192;
          v39[1] = v25;
          LODWORD(v31) = 8;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Hit the max of %{public}d sessions per CloudKit upload. Will check for more data later.", v39, v31);
          v27 = (uint8_t *)v26;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]", "%s\n", v26);
          if (v27 != buf)
            free(v27);
        }
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
      objc_autoreleasePoolPop(v17);
      if (v13 == v12)
        v22 = 1;
      else
        v22 = v21;
      v13 += 5;
    }
    while ((v22 & 1) == 0);
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v28 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Done adding sessions to sync", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LOWORD(v41) = 0;
    LODWORD(v31) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Done adding sessions to sync", &v41, v31);
    v30 = (uint8_t *)v29;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:]", "%s\n", v29);
    if (v30 != buf)
      free(v30);
  }
  if (__p)
  {
    v37 = (__n128 *)__p;
    operator delete(__p);
  }
}

- (id)getSystemFieldsFromCKRecord:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(a3, "encodeSystemFieldsWithCoder:", v4);
  objc_msgSend(v4, "finishEncoding");
  return objc_msgSend(v4, "encodedData");
}

- (id)createCKRecordForOutput:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  CLCKVO2MaxSessionOutput *v12;
  double Current;
  uint64_t v14;
  NSObject *v15;
  CFAbsoluteTime v16;
  NSObject *v17;
  uint8_t *v19;
  uint64_t v20;
  CFAbsoluteTime v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  uint8_t *v25;
  double v26;
  int v27;
  double v28;
  uint8_t buf[4];
  double v30;
  _OWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[0] = 0;
  v34[1] = 0;
  objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(a3, "recordName")), "getUUIDBytes:", v34);
  v32 = 0;
  v33 = 0;
  v5 = sub_101125448();
  if (!sub_101125D48(v5, (const unsigned __int8 *)v34, v31))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v11 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v27 = 138543362;
    v28 = *(double *)&a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", &v27, 12);
    goto LABEL_36;
  }
  if (objc_msgSend(v32, "length"))
  {
    v26 = 0.0;
    v6 = objc_alloc((Class)NSKeyedUnarchiver);
    v7 = objc_msgSend(v6, "initForReadingFromData:error:", objc_msgSend(v32, "copy"), &v26);
    objc_msgSend(v7, "setRequiresSecureCoding:", 1);
    v8 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithCoder:", v7);
    objc_msgSend(v7, "finishDecoding");
    if (!v8)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to decode output record from system fields data: %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v27 = 138543362;
      v28 = v26;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Failed to decode output record from system fields data: %{public}@", &v27, 12);
LABEL_36:
      v19 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v10);
      if (v19 != buf)
        free(v19);
      return 0;
    }
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("VO2MaxOutput"), a3);
  }
  v12 = objc_alloc_init(CLCKVO2MaxSessionOutput);
  Current = CFAbsoluteTimeGetCurrent();
  v14 = sub_101125448();
  if (sub_101126080(v14, (const unsigned __int8 *)v34, v12))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v15 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      v30 = v16 - Current;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Completed fetch of output proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v20 = qword_10229FEC8;
      v21 = CFAbsoluteTimeGetCurrent();
      v27 = 134349056;
      v28 = v21 - Current;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 2, "Completed fetch of output proto; duration: %{public}f",
        &v27,
        12);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
    objc_msgSend(objc_msgSend(v8, "encryptedValuesByKey"), "setObject:forKeyedSubscript:", -[CLCKVO2MaxSessionOutput data](v12, "data"), CFSTR("sessionData"));
    ++self->fDailyStats.outputSaveAttemptedCount;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v17 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to get output due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      LOWORD(v27) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to get output due to device being locked, clearing the sync engine and will try again later.", &v27, 2);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForOutput:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
    v8 = 0;
    self->_syncEngine = 0;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
  }
  return v8;
}

- (void)updateOutputSystemFields:(id)a3 outputRecord:(id)a4
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint8_t *v22;
  void *__p;
  __int128 *v24;
  uint64_t v25;
  int v26;
  char *v27;
  char out[48];
  __int128 v29;
  _OWORD v30[3];
  __int128 v31;
  uint8_t buf[4];
  char *v33;
  _QWORD v34[2];

  v34[0] = 0;
  v34[1] = 0;
  objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(objc_msgSend(a4, "recordID"), "recordName")), "getUUIDBytes:", v34);
  __p = 0;
  v24 = 0;
  v25 = 0;
  v7 = sub_101125448();
  if (sub_101125DE4(v7, (const unsigned __int8 *)v34, (uint64_t)&__p))
  {
    v8 = (__int128 *)__p;
    v9 = v24;
    if (__p != v24)
    {
      do
      {
        v29 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v12 = v8[4];
        v30[2] = v8[3];
        v31 = v12;
        v30[0] = v10;
        v30[1] = v11;
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v30, out);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v13 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving output metadata %s", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102140CF0);
          v26 = 136315138;
          v27 = out;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "Saving output metadata %s", (const char *)&v26);
          v16 = (uint8_t *)v15;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]", "%s\n", v15);
          if (v16 != buf)
            free(v16);
        }
        *(_QWORD *)&v31 = a3;
        v14 = sub_101125448();
        sub_101125CA8(v14, (uint64_t)&v29);
        v8 += 5;
      }
      while (v8 != v9);
    }
    ++self->fDailyStats.outputSaveSuccessCount;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v17 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)objc_msgSend(a4, "recordID");
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v19 = qword_10229FEC8;
      v20 = objc_msgSend(a4, "recordID");
      LODWORD(v29) = 138543362;
      *(_QWORD *)((char *)&v29 + 4) = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 16, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", &v29, 12);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }
  if (__p)
  {
    v24 = (__int128 *)__p;
    operator delete(__p);
  }
}

- (void)handleFetchedOutputRecord:(id)a3
{
  CLCKVO2MaxSessionOutput *v5;
  double Current;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  int v18;
  double v19;
  uint8_t buf[4];
  double v21;

  v5 = -[CLCKVO2MaxSessionOutput initWithData:]([CLCKVO2MaxSessionOutput alloc], "initWithData:", objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", CFSTR("sessionData")));
  Current = CFAbsoluteTimeGetCurrent();
  v7 = sub_101125448();
  if ((sub_1011264CC(v7, v5, (uint64_t)-[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3)) & 1) != 0)
  {
    ++self->fDailyStats.outputFetchSuccessCount;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to persist fetched output due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      LOWORD(v18) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to persist fetched output due to device being locked, clearing the sync engine and will try again later.", &v18, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    self->_syncEngine = 0;
    self->fDailyStats.syncEngineEnabled = 0;
    self->fDeviceUnlocked = 0;
    ++self->fDailyStats.outputFetchFailureCount;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v9 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134349056;
    v21 = v10 - Current;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Completed save of output proto; duration: %{public}f",
      buf,
      0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v11 = qword_10229FEC8;
    v12 = CFAbsoluteTimeGetCurrent();
    v18 = 134349056;
    v19 = v12 - Current;
    LODWORD(v17) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 2, "Completed save of output proto; duration: %{public}f",
      &v18,
      v17);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedOutputRecord:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
}

- (id)createCKRecordForInput:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  CLCKVO2MaxSessionInput *v12;
  double Current;
  NSObject *v14;
  CFAbsoluteTime v15;
  NSObject *v16;
  uint8_t *v18;
  uint64_t v19;
  CFAbsoluteTime v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint8_t *v24;
  double v25;
  int v26;
  double v27;
  uint8_t buf[4];
  double v29;
  _OWORD v30[4];
  uint64_t v31;
  id v32;
  _QWORD v33[2];

  v33[0] = 0;
  v33[1] = 0;
  objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(a3, "recordName")), "getUUIDBytes:", v33);
  v31 = 0;
  v32 = 0;
  v5 = sub_101125448();
  if (!sub_101125D48(v5, (const unsigned __int8 *)v33, v30))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v11 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = *(double *)&a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v26 = 138543362;
    v27 = *(double *)&a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Failed to retrieve VO2MaxSessionAttributes for CKRecordID: %{public}@", &v26, 12);
    goto LABEL_37;
  }
  if (objc_msgSend(v32, "length"))
  {
    v25 = 0.0;
    v6 = objc_alloc((Class)NSKeyedUnarchiver);
    v7 = objc_msgSend(v6, "initForReadingFromData:error:", objc_msgSend(v32, "copy"), &v25);
    objc_msgSend(v7, "setRequiresSecureCoding:", 1);
    v8 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithCoder:", v7);
    objc_msgSend(v7, "finishDecoding");
    if (!v8)
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to decode input record from system fields data: %{public}@", buf, 0xCu);
      }
      if (!sub_1001BFF7C(115, 0))
        return 0;
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v26 = 138543362;
      v27 = v25;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Failed to decode input record from system fields data: %{public}@", &v26, 12);
LABEL_37:
      v18 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v10);
      if (v18 != buf)
        free(v18);
      return 0;
    }
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("VO2MaxInput"), a3);
  }
  v12 = objc_alloc_init(CLCKVO2MaxSessionInput);
  Current = CFAbsoluteTimeGetCurrent();
  if (sub_10110982C((uint64_t *)self->fInputStore.__ptr_, (const unsigned __int8 *)v33, v12))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v14 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      v15 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      v29 = v15 - Current;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Completed fetch of input proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v19 = qword_10229FEC8;
      v20 = CFAbsoluteTimeGetCurrent();
      v26 = 134349056;
      v27 = v20 - Current;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "Completed fetch of input proto; duration: %{public}f",
        &v26,
        12);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
    if (-[NSMutableArray count](-[CLCKVO2MaxSessionInput inputs](v12, "inputs"), "count"))
    {
      objc_msgSend(objc_msgSend(v8, "encryptedValuesByKey"), "setObject:forKeyedSubscript:", -[CLCKVO2MaxSessionInput data](v12, "data"), CFSTR("sessionData"));
      ++self->fDailyStats.inputSaveAttemptedCount;
      return v8;
    }
    return 0;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v16 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to get input due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LOWORD(v26) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to get input due to device being locked, clearing the sync engine and will try again later.", &v26, 2);
    v24 = (uint8_t *)v23;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager createCKRecordForInput:]", "%s\n", v23);
    if (v24 != buf)
      free(v24);
  }
  v8 = 0;
  self->_syncEngine = 0;
  self->fDailyStats.syncEngineEnabled = 0;
  self->fDeviceUnlocked = 0;
  return v8;
}

- (void)updateInputSystemFields:(id)a3 inputRecord:(id)a4
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint8_t *v22;
  void *__p;
  __int128 *v24;
  uint64_t v25;
  int v26;
  char *v27;
  char out[48];
  __int128 v29;
  _OWORD v30[3];
  __int128 v31;
  uint8_t buf[4];
  char *v33;
  _QWORD v34[2];

  v34[0] = 0;
  v34[1] = 0;
  objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", objc_msgSend(objc_msgSend(a4, "recordID"), "recordName")), "getUUIDBytes:", v34);
  __p = 0;
  v24 = 0;
  v25 = 0;
  v7 = sub_101125448();
  if (sub_101125DE4(v7, (const unsigned __int8 *)v34, (uint64_t)&__p))
  {
    v8 = (__int128 *)__p;
    v9 = v24;
    if (__p != v24)
    {
      do
      {
        v29 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v12 = v8[4];
        v30[2] = v8[3];
        v31 = v12;
        v30[0] = v10;
        v30[1] = v11;
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v30, out);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v13 = qword_10229FEC8;
        if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v33 = out;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Saving input metadata %s", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FEC0 != -1)
            dispatch_once(&qword_10229FEC0, &stru_102140CF0);
          v26 = 136315138;
          v27 = out;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "Saving input metadata %s", (const char *)&v26);
          v16 = (uint8_t *)v15;
          sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]", "%s\n", v15);
          if (v16 != buf)
            free(v16);
        }
        *((_QWORD *)&v31 + 1) = a3;
        v14 = sub_101125448();
        sub_101125CA8(v14, (uint64_t)&v29);
        v8 += 5;
      }
      while (v8 != v9);
    }
    ++self->fDailyStats.inputSaveSuccessCount;
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v17 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)objc_msgSend(a4, "recordID");
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v19 = qword_10229FEC8;
      v20 = objc_msgSend(a4, "recordID");
      LODWORD(v29) = 138543362;
      *(_QWORD *)((char *)&v29 + 4) = v20;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 16, "Failed to retrieve VO2MaxSessionAttributes for CKRecord with ID: %{public}@", &v29, 12);
      v22 = (uint8_t *)v21;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:]", "%s\n", v21);
      if (v22 != buf)
        free(v22);
    }
  }
  if (__p)
  {
    v24 = (__int128 *)__p;
    operator delete(__p);
  }
}

- (void)handleFetchedInputRecord:(id)a3
{
  CLCKVO2MaxSessionInput *v5;
  double Current;
  uint64_t *ptr;
  NSObject *v8;
  NSObject *v9;
  CFAbsoluteTime v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  int v18;
  double v19;
  uint8_t buf[4];
  double v21;

  if (self->fFetchChangesForInputZone)
  {
    v5 = -[CLCKVO2MaxSessionInput initWithData:]([CLCKVO2MaxSessionInput alloc], "initWithData:", objc_msgSend(objc_msgSend(a3, "encryptedValuesByKey"), "objectForKeyedSubscript:", CFSTR("sessionData")));
    Current = CFAbsoluteTimeGetCurrent();
    ptr = (uint64_t *)self->fInputStore.__ptr_;
    -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3);
    if ((sub_1011099F4(ptr, v5) & 1) != 0)
    {
      ++self->fDailyStats.inputFetchSuccessCount;
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to persist fetched input due to device being locked, clearing the sync engine and will try again later.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        LOWORD(v18) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Unable to persist fetched input due to device being locked, clearing the sync engine and will try again later.", &v18, 2);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
      self->_syncEngine = 0;
      self->fDailyStats.syncEngineEnabled = 0;
      self->fDeviceUnlocked = 0;
      ++self->fDailyStats.inputFetchFailureCount;
    }
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v9 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
    {
      v10 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134349056;
      v21 = v10 - Current;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Completed save of input proto; duration: %{public}f",
        buf,
        0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v11 = qword_10229FEC8;
      v12 = CFAbsoluteTimeGetCurrent();
      v18 = 134349056;
      v19 = v12 - Current;
      LODWORD(v17) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 2, "Completed save of input proto; duration: %{public}f",
        &v18,
        v17);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleFetchedInputRecord:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  CKSyncEngine *syncEngine;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  id v13;
  int v14;
  id v15;
  uint8_t buf[4];
  id v17;

  if (a3)
  {
    if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", CFSTR("VO2MaxOutput")))
    {
      -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:](self, "updateOutputSystemFields:outputRecord:", -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3), a3);
    }
    else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", CFSTR("VO2MaxInput")))
    {
      -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:](self, "updateInputSystemFields:inputRecord:", -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a3), a3);
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = objc_msgSend(a3, "recordType");
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CloudKit provided server record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v10 = qword_10229FEC8;
        v14 = 138543362;
        v15 = objc_msgSend(a3, "recordType");
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 16, "CloudKit provided server record of unexpected type: %{public}@", &v14, 12);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
    }
    syncEngine = self->_syncEngine;
    v13 = objc_msgSend(a3, "recordID");
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1), 0);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Expected server record is missing from error after failed record save", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Expected server record is missing from error after failed record save", &v14, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleServerRecordChanged:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)handleUnknownItem:(id)a3
{
  NSObject *v5;
  CKSyncEngine *syncEngine;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  id v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", CFSTR("VO2MaxOutput")))
  {
    -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:](self, "updateOutputSystemFields:outputRecord:", 0, a3);
  }
  else if (objc_msgSend(objc_msgSend(a3, "recordType"), "isEqualToString:", CFSTR("VO2MaxInput")))
  {
    -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:](self, "updateInputSystemFields:inputRecord:", 0, a3);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = objc_msgSend(a3, "recordType");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CloudKit provided record of unexpected type: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v7 = qword_10229FEC8;
      v11 = 138543362;
      v12 = objc_msgSend(a3, "recordType");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 16, "CloudKit provided record of unexpected type: %{public}@", &v11, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleUnknownItem:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  syncEngine = self->_syncEngine;
  v10 = objc_msgSend(a3, "recordID");
  -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1), 0);
}

- (void)handleZoneNotFound:(id)a3
{
  CKSyncEngine *syncEngine;
  id *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;
  id v15;
  id v16;

  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"), "isEqualToString:", CFSTR("VO2MaxOutputZone")))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
    syncEngine = self->_syncEngine;
    v16 = objc_msgSend(a3, "recordID");
    v6 = &v16;
LABEL_5:
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](syncEngine, "addRecordIDsToSave:recordIDsToDelete:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1), 0);
    return;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName"), "isEqualToString:", CFSTR("VO2MaxInputZone")))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
    syncEngine = self->_syncEngine;
    v15 = objc_msgSend(a3, "recordID");
    v6 = &v15;
    goto LABEL_5;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Will not attempt to save unexpected zone: %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    v11 = 138543362;
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"), "zoneName");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 16, "Will not attempt to save unexpected zone: %{public}@", &v11, 12);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZoneNotFound:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
}

- (void)handleZoneDeleted:(id)a3
{
  CLVO2MaxCloudKitManager *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  uint8_t *v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  uint8_t *v16;
  int v17;
  id v18;
  uint8_t buf[4];
  id v20;

  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CFSTR("VO2MaxOutputZone")))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
    v5 = self;
    v6 = 1;
    v7 = 0;
LABEL_5:
    -[CLVO2MaxCloudKitManager bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:](v5, "bulkUploadRecordIDsShouldReupload:shouldUploadToOutputZone:shouldUploadToInputZone:shouldThrottle:", 1, v6, v7, 0);
    return;
  }
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CFSTR("VO2MaxInputZone")))
  {
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
    v5 = self;
    v6 = 0;
    v7 = 1;
    goto LABEL_5;
  }
  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CKRecordZoneDefaultName))
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = objc_msgSend(a3, "zoneName");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CKManager] Delete reported for zone (%@)", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = qword_10229FEC8;
      v17 = 138412290;
      v18 = objc_msgSend(a3, "zoneName");
      v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 1, "[CKManager] Delete reported for zone (%@)", &v17, 12);
      v12 = v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n", v10);
LABEL_24:
      if (v12 != buf)
        free(v12);
    }
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v13 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = objc_msgSend(a3, "zoneName");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Delete reported for unexpected zone: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v14 = qword_10229FEC8;
      v17 = 138543362;
      v18 = objc_msgSend(a3, "zoneName");
      v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 16, "Delete reported for unexpected zone: %{public}@", &v17, 12);
      v12 = v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZoneDeleted:]", "%s\n", v15);
      goto LABEL_24;
    }
  }
}

- (void)handleZonePurge:(id)a3
{
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CFSTR("VO2MaxOutputZone")))
  {
    v5 = (_QWORD *)sub_101125448();
    sub_101125704(v5);
    -[CLVO2MaxCloudKitManager createVO2MaxOutputZone](self, "createVO2MaxOutputZone");
  }
  else if (objc_msgSend(objc_msgSend(a3, "zoneName"), "isEqualToString:", CFSTR("VO2MaxInputZone")))
  {
    sub_101109800((uint64_t)self->fInputStore.__ptr_);
    -[CLVO2MaxCloudKitManager createVO2MaxInputZone](self, "createVO2MaxInputZone");
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = objc_msgSend(a3, "zoneName");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Will not attempt to purge unexpected zone: %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v7 = qword_10229FEC8;
      v10 = 138543362;
      v11 = objc_msgSend(a3, "zoneName");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 16, "Will not attempt to purge unexpected zone: %{public}@", &v10, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager handleZonePurge:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)stopSyncing:(BOOL)a3
{
  _BOOL4 v3;
  Client *value;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  v3 = a3;
  self->_syncEngine = 0;
  self->fDailyStats.syncEngineEnabled = 0;
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
  }
  else
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attempting unregistration when fDataProtectionClient is not initialized", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Attempting unregistration when fDataProtectionClient is not initialized", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager stopSyncing:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
  if (v3)
  {
    v6 = sub_101125448();
    sub_101126078(v6);
  }
}

- (void)resetDailyStats
{
  self->fDailyStatsStartTime = CFAbsoluteTimeGetCurrent();
  *(_OWORD *)&self->fDailyStats.outputSaveQueuedCount = 0u;
  *(_OWORD *)&self->fDailyStats.outputFetchSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputSaveSuccessCount = 0u;
  *(_OWORD *)&self->fDailyStats.inputFetchFailureCount = 0u;
}

- (void)receiveVO2MaxCloudKitDailyStatsFromWatch:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  objc_class *v8;
  unsigned int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned int v25;
  _WORD v26[8];
  _BYTE v27[64];
  uint8_t buf[1640];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received daily stats message from paired watch", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    *(_WORD *)v27 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Received daily stats message from paired watch", v27, 2);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  if (objc_opt_class(MCProfileConnection, v6)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v27[0] = 0;
    *(_QWORD *)&v7 = -1;
    *((_QWORD *)&v7 + 1) = -1;
    *(_OWORD *)&v27[4] = v7;
    *(_OWORD *)&v27[20] = v7;
    *(_OWORD *)&v27[36] = v7;
    *(_DWORD *)&v27[52] = -1;
    *(_QWORD *)&v27[56] = 0xBFF0000000000000;
    objc_msgSend(a3, "getBytes:length:", v27, 64);
    self->fDailyStats.secondsOfDataCollection = CFAbsoluteTimeGetCurrent() - self->fDailyStatsStartTime;
    v8 = -[objc_class sharedInstance](off_1022A2738(), "sharedInstance");
    if (v8)
    {
      if (-[objc_class isPaired](v8, "isPaired"))
      {
        v9 = objc_msgSend(-[objc_class getPairedDevices](-[objc_class sharedInstance](off_1022A2738(), "sharedInstance"), "getPairedDevices"), "count");
LABEL_34:
        v20[1] = 3221225472;
        v21 = *(_OWORD *)v27;
        v22 = *(_OWORD *)&v27[16];
        v23 = *(_OWORD *)&v27[32];
        v20[0] = _NSConcreteStackBlock;
        v20[2] = sub_1005094DC;
        v20[3] = &unk_102140CD0;
        v20[4] = self;
        v25 = v9;
        v24 = *(_OWORD *)&v27[48];
        AnalyticsSendEventLazy(CFSTR("com.apple.VO2MaxCloudKitDailyCounts"), v20);
        goto LABEL_35;
      }
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v15 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to retrieve number of paired watches: not paired according to device registry", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
      {
LABEL_33:
        v9 = -1;
        goto LABEL_34;
      }
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v26[0] = 0;
      LODWORD(v19) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unable to retrieve number of paired watches: not paired according to device registry", v26, v19);
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v13 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to retrieve number of paired watches: device registry unavailable", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        goto LABEL_33;
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v26[0] = 0;
      LODWORD(v19) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Unable to retrieve number of paired watches: device registry unavailable", v26, v19);
    }
    v18 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v14);
    if (v18 != buf)
      free(v18);
    goto LABEL_33;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v10 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "VO2MaxCloudKitDailyCounts,Not sending analytics, no IHA permission", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    *(_WORD *)v27 = 0;
    LODWORD(v19) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 2, "VO2MaxCloudKitDailyCounts,Not sending analytics, no IHA permission", v27, v19);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager receiveVO2MaxCloudKitDailyStatsFromWatch:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
LABEL_35:
  -[CLVO2MaxCloudKitManager resetDailyStats](self, "resetDailyStats");
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved CKRecordZone %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = 138543362;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Successfully saved CKRecordZone %{public}@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecordZone:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports successful deletion of CKRecordZone with zoneID: %{public}@. Will recreate zone and reupload local data.", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = 138543362;
      v10 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine reports successful deletion of CKRecordZone with zoneID: %{public}@. Will recreate zone and reupload local data.", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordZoneWithID:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[CLVO2MaxCloudKitManager handleZoneDeleted:](self, "handleZoneDeleted:", a4);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v8 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v16 = a4;
    v17 = 2114;
    v18 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to save CKRecordZone: %{public}@, error = %{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v11 = 138543618;
    v12 = a4;
    v13 = 2114;
    v14 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Failed to save CKRecordZone: %{public}@, error = %{public}@", &v11, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecordZone:error:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(a5, "code") == (id)112)
      -[CLVO2MaxCloudKitManager deleteZone:](self, "deleteZone:", objc_msgSend(a4, "zoneID"));
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = a5;
    v16 = 2114;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we should not be deleting any zones", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v10 = 138543618;
    v11 = a5;
    v12 = 2114;
    v13 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 17, "Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we should not be deleting any zones", &v10, 22);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordZoneWithID:error:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ changed", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = 138543362;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine reports that CKRecordZone with identifier %{public}@ changed", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDChanged:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ was deleted", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = 138543362;
      v10 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine reports that CKRecordZone with identifier %{public}@ was deleted", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasDeleted:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[CLVO2MaxCloudKitManager handleZoneDeleted:](self, "handleZoneDeleted:", a4);
  }
}

- (void)syncEngine:(id)a3 zoneWithIDWasPurged:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine reports that CKRecordZone with identifier %{public}@ was purged", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = 138543362;
      v10 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine reports that CKRecordZone with identifier %{public}@ was purged", &v9, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:zoneWithIDWasPurged:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    -[CLVO2MaxCloudKitManager handleZonePurge:](self, "handleZonePurge:", a4);
  }
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v4;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  const char *v18;
  uint8_t *v19;
  uint8_t *v20;
  uint64_t v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;

  if (self->_syncEngine != a3)
    return 0;
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sync engine is asking for CKRecord with ID %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    LODWORD(v22) = 138543362;
    *(_QWORD *)((char *)&v22 + 4) = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine is asking for CKRecord with ID %{public}@", &v22, 12);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"), "isEqualToString:", CFSTR("VO2MaxOutputZone")))
  {
    v4 = -[CLVO2MaxCloudKitManager createCKRecordForOutput:](self, "createCKRecordForOutput:", a4);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Returning output CKRecord: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      LODWORD(v22) = 138412290;
      *(_QWORD *)((char *)&v22 + 4) = v4;
      LODWORD(v21) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Returning output CKRecord: %@", &v22, v21, v22);
LABEL_40:
      v20 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v9);
      if (v20 != buf)
        free(v20);
    }
  }
  else
  {
    if (!objc_msgSend(objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName"), "isEqualToString:", CFSTR("VO2MaxInputZone")))
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v12 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName");
        *(_DWORD *)buf = 138543362;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "RecordID associated with unexpected zone: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v14 = qword_10229FEC8;
        v15 = objc_msgSend(objc_msgSend(a4, "zoneID"), "zoneName");
        LODWORD(v22) = 138543362;
        *(_QWORD *)((char *)&v22 + 4) = v15;
        LODWORD(v21) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 16, "RecordID associated with unexpected zone: %{public}@", &v22, v21);
        v17 = (uint8_t *)v16;
        sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:recordToSaveForRecordID:]", "%s\n", v16);
        if (v17 != buf)
          free(v17);
      }
      return 0;
    }
    v4 = -[CLVO2MaxCloudKitManager createCKRecordForInput:](self, "createCKRecordForInput:", a4);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v10 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning input CKRecord: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      LODWORD(v22) = 138412290;
      *(_QWORD *)((char *)&v22 + 4) = v4;
      LODWORD(v21) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Returning input CKRecord: %@", &v22, v21, v22);
      goto LABEL_40;
    }
  }
  return v4;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v6 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v22 = objc_msgSend(a4, "recordID");
      v23 = 2113;
      v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sync engine saved CKRecord with CKRecordID %{public}@, record = %{private}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v9 = qword_10229FEC8;
      v17 = 138543619;
      v18 = objc_msgSend(a4, "recordID");
      v19 = 2113;
      v20 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "Sync engine saved CKRecord with CKRecordID %{public}@, record = %{private}@", &v17, 22);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxOutput")))
    {
      -[CLVO2MaxCloudKitManager updateOutputSystemFields:outputRecord:](self, "updateOutputSystemFields:outputRecord:", -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a4), a4);
    }
    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxInput")))
    {
      -[CLVO2MaxCloudKitManager updateInputSystemFields:inputRecord:](self, "updateInputSystemFields:inputRecord:", -[CLVO2MaxCloudKitManager getSystemFieldsFromCKRecord:](self, "getSystemFieldsFromCKRecord:", a4), a4);
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v7 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_msgSend(a4, "recordType");
        *(_DWORD *)buf = 138543362;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CloudKit reporting saved record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v12 = qword_10229FEC8;
        v13 = objc_msgSend(a4, "recordType");
        v17 = 138543362;
        v18 = v13;
        LODWORD(v16) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 16, "CloudKit reporting saved record of unexpected type: %{public}@", &v17, v16);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:didSaveRecord:]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
    }
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  NSObject *v8;
  int *p_outputSaveFailureCount;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544131;
      v22 = objc_msgSend(a5, "domain");
      v23 = 2050;
      v24 = objc_msgSend(a5, "code");
      v25 = 2114;
      v26 = a5;
      v27 = 2113;
      v28 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %{private}@", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v10 = qword_10229FEC8;
      v13 = 138544131;
      v14 = objc_msgSend(a5, "domain");
      v15 = 2050;
      v16 = objc_msgSend(a5, "code");
      v17 = 2114;
      v18 = a5;
      v19 = 2113;
      v20 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 16, "Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %{private}@", &v13, 42);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToSaveRecord:error:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxOutput")))
    {
      p_outputSaveFailureCount = &self->fDailyStats.outputSaveFailureCount;
    }
    else
    {
      if (!objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxInput")))
        goto LABEL_12;
      p_outputSaveFailureCount = &self->fDailyStats.inputSaveFailureCount;
    }
    ++*p_outputSaveFailureCount;
LABEL_12:
    if (CKErrorIsCode(a5, 14))
    {
      -[CLVO2MaxCloudKitManager handleServerRecordChanged:](self, "handleServerRecordChanged:", objc_msgSend(objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", CKRecordChangedErrorServerRecordKey));
    }
    else if (CKErrorIsCode(a5, 11))
    {
      -[CLVO2MaxCloudKitManager handleUnknownItem:](self, "handleUnknownItem:", a4);
    }
    else if (CKErrorIsCode(a5, 26))
    {
      -[CLVO2MaxCloudKitManager handleZoneNotFound:](self, "handleZoneNotFound:", a4);
    }
    else if (CKErrorIsCode(a5, 9))
    {
      -[CLVO2MaxCloudKitManager stopSyncing:](self, "stopSyncing:", 0);
    }
    else if (CKErrorIsCode(a5, 112))
    {
      -[CLVO2MaxCloudKitManager deleteZone:](self, "deleteZone:", objc_msgSend(objc_msgSend(a4, "recordID"), "zoneID"));
    }
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v5 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync engine deleted CKRecord with CKRecordID %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = 138543362;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 0, "Sync engine deleted CKRecord with CKRecordID %{public}@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didDeleteRecordWithID:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    v20 = objc_msgSend(a5, "domain");
    v21 = 2050;
    v22 = objc_msgSend(a5, "code");
    v23 = 2114;
    v24 = a5;
    v25 = 2114;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@", buf, 0x2Au);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    v11 = 138544130;
    v12 = objc_msgSend(a5, "domain");
    v13 = 2050;
    v14 = objc_msgSend(a5, "code");
    v15 = 2114;
    v16 = a5;
    v17 = 2114;
    v18 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 16, "Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@", &v11, 42);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:failedToDeleteRecordWithID:error:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  int fCloudKitDeletionState;
  _BOOL4 fFetchChangesForInputZone;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  uint64_t v18;
  const char *v19;
  uint8_t *v20;
  int v21;
  const char *v22;
  uint8_t *v23;
  uint64_t v24;
  int v25;
  _QWORD v26[3];
  uint8_t buf[4];
  _QWORD v28[204];

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v28[0] = objc_msgSend(a4, "zoneName");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Sync engine asking if it should fetch changes for %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v18 = qword_10229FEC8;
    v25 = 138543362;
    v26[0] = objc_msgSend(a4, "zoneName");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 2, "Sync engine asking if it should fetch changes for %{public}@", &v25, 12);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  if (self->_syncEngine != a3)
    goto LABEL_13;
  if (self->fCloudKitDeletionState)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v8 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_INFO))
    {
      fCloudKitDeletionState = self->fCloudKitDeletionState;
      *(_DWORD *)buf = 67240450;
      LODWORD(v28[0]) = fCloudKitDeletionState;
      WORD2(v28[0]) = 2114;
      *(_QWORD *)((char *)v28 + 6) = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[CKManager] CloudKit deletion was requested (state=%{public}d). Not fetching changes for zone: %{public}@", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v21 = self->fCloudKitDeletionState;
      v25 = 67240450;
      LODWORD(v26[0]) = v21;
      WORD2(v26[0]) = 2114;
      *(_QWORD *)((char *)v26 + 6) = a4;
      LODWORD(v24) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 1, "[CKManager] CloudKit deletion was requested (state=%{public}d). Not fetching changes for zone: %{public}@", &v25, v24);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
LABEL_13:
    LOBYTE(fFetchChangesForInputZone) = 0;
    return fFetchChangesForInputZone;
  }
  if ((objc_msgSend(objc_msgSend(a4, "zoneName"), "isEqualToString:", CFSTR("VO2MaxOutputZone")) & 1) != 0)
  {
    fFetchChangesForInputZone = 1;
  }
  else if (objc_msgSend(objc_msgSend(a4, "zoneName"), "isEqualToString:", CFSTR("VO2MaxInputZone")))
  {
    fFetchChangesForInputZone = self->fFetchChangesForInputZone;
  }
  else
  {
    fFetchChangesForInputZone = 0;
  }
  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v12 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(a4, "zoneName");
    *(_DWORD *)buf = 67240450;
    LODWORD(v28[0]) = fFetchChangesForInputZone;
    WORD2(v28[0]) = 2114;
    *(_QWORD *)((char *)v28 + 6) = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Answering sync engine shouldFetchChangesForZone = %{public}d for zone: %{public}@", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v14 = qword_10229FEC8;
    v15 = objc_msgSend(a4, "zoneName");
    v25 = 67240450;
    LODWORD(v26[0]) = fFetchChangesForInputZone;
    WORD2(v26[0]) = 2114;
    *(_QWORD *)((char *)v26 + 6) = v15;
    LODWORD(v24) = 18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 0, "Answering sync engine shouldFetchChangesForZone = %{public}d for zone: %{public}@", &v25, v24);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:shouldFetchChangesForZoneID:]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
  return fFetchChangesForInputZone;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  if (self->_syncEngine == a3)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v7 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      v23 = objc_msgSend(a4, "recordID");
      v24 = 2113;
      v25 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sync engine fetched CKRecord with CKRecordID %{public}@, record = %{private}@", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v10 = qword_10229FEC8;
      v18 = 138543619;
      v19 = objc_msgSend(a4, "recordID");
      v20 = 2113;
      v21 = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 0, "Sync engine fetched CKRecord with CKRecordID %{public}@, record = %{private}@", &v18, 22);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxOutput")))
    {
      -[CLVO2MaxCloudKitManager handleFetchedOutputRecord:](self, "handleFetchedOutputRecord:", a4);
    }
    else if (objc_msgSend(objc_msgSend(a4, "recordType"), "isEqualToString:", CFSTR("VO2MaxInput")))
    {
      -[CLVO2MaxCloudKitManager handleFetchedInputRecord:](self, "handleFetchedInputRecord:", a4);
    }
    else
    {
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8 = qword_10229FEC8;
      if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(a4, "recordType");
        *(_DWORD *)buf = 138543362;
        v23 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Fetched record of unexpected type: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FEC0 != -1)
          dispatch_once(&qword_10229FEC0, &stru_102140CF0);
        v13 = qword_10229FEC8;
        v14 = objc_msgSend(a4, "recordType");
        v18 = 138543362;
        v19 = v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 16, "Fetched record of unexpected type: %{public}@", &v18, v17);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:didFetchRecord:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  if (qword_10229FEC0 != -1)
    dispatch_once(&qword_10229FEC0, &stru_102140CF0);
  v7 = qword_10229FEC8;
  if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v15 = a4;
    v16 = 2114;
    v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Sync engine unexpectedly fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v10 = 138543618;
    v11 = a4;
    v12 = 2114;
    v13 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEC8, 16, "Sync engine unexpectedly fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@", &v10, 22);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CLVO2MaxCloudKitManager syncEngine:recordWithIDWasDeleted:recordType:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  NSObject *v5;
  CFAbsoluteTime Current;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  int v11;
  id v12;
  __int128 buf;
  CFAbsoluteTime v14;
  id v15;

  if (self->_syncEngine == a3)
  {
    if (qword_10229FEC0 != -1)
      dispatch_once(&qword_10229FEC0, &stru_102140CF0);
    v5 = qword_10229FEC8;
    if (os_log_type_enabled((os_log_t)qword_10229FEC8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(a4, "length");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received updated metadata from sync engine, length = %{public}lu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_10229FEC0 != -1)
        dispatch_once(&qword_10229FEC0, &stru_102140CF0);
      v8 = qword_10229FEC8;
      v11 = 134349056;
      v12 = objc_msgSend(a4, "length");
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v8, 0, "Received updated metadata from sync engine, length = %{public}lu", &v11, 12);
      v10 = (char *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLVO2MaxCloudKitManager syncEngine:didUpdateMetadata:]", "%s\n", v9);
      if (v10 != (char *)&buf)
        free(v10);
    }
    Current = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)&buf = 0;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    v14 = Current;
    v15 = a4;
    v7 = sub_101125448();
    sub_101125E90(v7, (uint64_t)&buf);
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  CLVO2MaxRetrocomputeRecorderDb *v5;
  CLVO2MaxStagingOutputStore *v6;

  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->fRetrocomputeDb.__ptr_.__value_;
  self->fRetrocomputeDb.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(CLVO2MaxRetrocomputeRecorderDb *, SEL))(*(_QWORD *)v5 + 24))(v5, a2);
  v6 = self->fStagingOutputStore.__ptr_.__value_;
  self->fStagingOutputStore.__ptr_.__value_ = 0;
  if (v6)
    sub_10050C830((uint64_t)&self->fStagingOutputStore, (uint64_t)v6);
  sub_100261F44((uint64_t)&self->fInputStore);
  sub_100261F44((uint64_t)&self->fInputCache);
}

- (id).cxx_construct
{
  __int128 v2;

  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_BYTE *)self + 112) = 0;
  *((_DWORD *)self + 41) = -1;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)((char *)self + 148) = v2;
  *(_OWORD *)((char *)self + 132) = v2;
  *(_OWORD *)((char *)self + 116) = v2;
  *((_QWORD *)self + 21) = 0xBFF0000000000000;
  return self;
}

@end

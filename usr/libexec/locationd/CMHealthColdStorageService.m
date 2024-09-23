@implementation CMHealthColdStorageService

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
  if (qword_10230BB08 != -1)
    dispatch_once(&qword_10230BB08, &stru_102199A80);
  return (id)qword_10230BB00;
}

- (CMHealthColdStorageService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageService;
  return -[CMHealthColdStorageService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CMHealthColdStorageServiceProtocol, &OBJC_PROTOCOL___CMHealthColdStorageServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_10230BB18 != -1)
    dispatch_once(&qword_10230BB18, &stru_102199AA0);
  return byte_10230BB10;
}

- (void)beginService
{
  int v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _DWORD v6[4];
  uint8_t buf[8];

  LOBYTE(v6[0]) = 0;
  sub_1018BF25C(buf, "ColdStorageManagerEnableCloudKit", (unsigned __int8 *)v6, 0);
  v2 = buf[1];
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning CMHealthColdStorageService, CloudKit sync: %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Beginning CMHealthColdStorageService, CloudKit sync: %d", v6);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
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

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Shutting down CMHealthColdStorageService", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
  v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5)
  {
    objc_msgSend(*((id *)v5 + 2), "unregister:forNotification:", *((_QWORD *)v5 + 1), 0);
    objc_msgSend(*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fFitnessTrackingClient.__ptr_.__value_ + 1), 6);
  }
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  CMHealthColdStorageManager *value;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v7 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onDataProtectionNotification", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "onDataProtectionNotification", v11, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService onDataProtectionNotification:data:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  if (!*a3)
  {
    value = self->fManager.__ptr_.__value_;
    if (value)
      sub_100F6590C(value, *(_DWORD *)a4 == 1);
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  int v8;
  CMHealthColdStorageManager *value;
  __int16 v10;
  NSObject *v11;
  int v12;
  int v13;
  double v14;
  uint8_t *v15;
  uint8_t *v16;
  NSObject *v17;
  double v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  _DWORD v23[4];
  uint8_t buf[4];
  int v25;

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v7 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onFitnessTrackingNotification", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    LOWORD(v23[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "onFitnessTrackingNotification", v23, 2);
    v21 = (uint8_t *)v20;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n", v20);
    if (v21 != buf)
      free(v21);
  }
  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  if (*a3 == 6)
  {
    v8 = *(_DWORD *)a4;
    if (*(_DWORD *)a4)
    {
      if (v8 == 2)
      {
        value = self->fManager.__ptr_.__value_;
        v10 = 0;
      }
      else
      {
        if (v8 != 1)
          return;
        value = self->fManager.__ptr_.__value_;
        v10 = 1;
      }
      sub_100F67744((uint64_t)value, v10);
    }
    else
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v17 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[Service] Received an unknown Watch.app Fitness Tracking state", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        LOWORD(v23[0]) = 0;
        LODWORD(v22) = 2;
        v18 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[Service] Received an unknown Watch.app Fitness Tracking state", v23, v22);
        v16 = v19;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n", v18);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (!*a3)
    {
      sub_100F673A0((uint64_t)self->fManager.__ptr_.__value_, *((unsigned __int8 *)a4 + 3));
      return;
    }
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v11 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_FAULT))
    {
      v12 = *a3;
      *(_DWORD *)buf = 67109120;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "FitnessTracking: Unexpected notification type %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v13 = *a3;
      v23[0] = 67109120;
      v23[1] = v13;
      v14 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 17, "FitnessTracking: Unexpected notification type %d", v23);
      v16 = v15;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n", v14);
LABEL_29:
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)registerDatabaseAtURL:(id)a3 tableName:(id)a4 isClassB:(BOOL)a5 sourceDevice:(int)a6 cloudKitDelegate:(id)a7
{
  uint64_t v9;
  id v12;
  NSObject *v13;
  void **v14;
  void **v15;
  void **v16;
  void **v17;
  const char *v18;
  uint8_t *v19;
  void *__p[2];
  char v21;
  void *__dst[2];
  char v23;
  int v24;
  void **v25;
  __int16 v26;
  void **v27;
  uint8_t buf[4];
  void **v29;
  __int16 v30;
  void **v31;

  if (a4 && a3 && self->fManager.__ptr_.__value_)
  {
    v9 = *(_QWORD *)&a6;
    v12 = objc_msgSend(a3, "absoluteString");
    sub_10035ACF4(__dst, objc_msgSend(v12, "UTF8String"), (size_t)objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4));
    sub_10035ACF4(__p, objc_msgSend(a4, "UTF8String"), (size_t)objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4));
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v13 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      v14 = __p;
      if (v21 < 0)
        v14 = (void **)__p[0];
      v15 = __dst;
      if (v23 < 0)
        v15 = (void **)__dst[0];
      *(_DWORD *)buf = 136315394;
      v29 = v14;
      v30 = 2080;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Service] Adding DB for table %s in %s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v16 = __p;
      if (v21 < 0)
        v16 = (void **)__p[0];
      v17 = __dst;
      if (v23 < 0)
        v17 = (void **)__dst[0];
      v24 = 136315394;
      v25 = v16;
      v26 = 2080;
      v27 = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[Service] Adding DB for table %s in %s", (const char *)&v24, 22);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    sub_100F64DDC((uint64_t)self->fManager.__ptr_.__value_, (uint64_t)__dst, (std::string::size_type)__p, a5, v9, (uint64_t)a7, 0);
  }
}

- (id)syncgetFetchColdStorageConfiguration
{
  std::string *p_p;
  NSString *v3;
  std::string __p;
  _QWORD v6[3];
  _QWORD v7[3];

  sub_100584CC0(2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v6[0] = CMColdStorageDatabasePath;
  v7[0] = -[NSString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", CFSTR("cold_encryptedB.db"));
  v7[1] = &off_102220A20;
  v6[1] = CMColdStorageCardioTableNames;
  v6[2] = CMColdStorageMobilityTableNames;
  v7[2] = &off_102220A38;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
}

- (void)setupSyncActivity
{
  xpc_object_t v3;
  _QWORD v4[5];
  unsigned __int8 v5[8];
  int64_t value;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  sub_1018CA5B4(v5, "HealthColdStorageSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_101019198;
  v4[3] = &unk_102144B48;
  v4[4] = objc_msgSend(objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CMHealthColdStorageService"));
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageSync", v3, v4);
  xpc_release(v3);
}

- (void)onSyncActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD v11[5];
  int v12;
  const char *v13;
  __int16 v14;
  xpc_activity_state_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  xpc_activity_state_t v19;

  if (!a3)
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "com.apple.locationd.Motion.ColdStorageSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v12 = 136315138;
    v13 = "com.apple.locationd.Motion.ColdStorageSync";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "Invalid xpc activity (%s).", &v12);
LABEL_22:
    v10 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService onSyncActivity:]", "%s\n", v8);
    if (v10 != buf)
      free(v10);
    return;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_101019814;
    v11[3] = &unk_10213F4C0;
    v11[4] = a3;
    -[CMHealthColdStorageService performSyncWithCompletion:activity:](self, "performSyncWithCompletion:activity:", v11, a3);
    return;
  }
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v9 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "com.apple.locationd.Motion.ColdStorageSync";
    v18 = 2048;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Service] Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v12 = 136315394;
    v13 = "com.apple.locationd.Motion.ColdStorageSync";
    v14 = 2048;
    v15 = v6;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[Service] Unexpected activity (%s) state: %ld", &v12, 22);
    goto LABEL_22;
  }
}

- (void)performSyncWithCompletion:(id)a3 activity:(id)a4
{
  NSObject *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  _QWORD block[7];
  _QWORD v13[7];
  dispatch_group_t group;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  dispatch_object_t v19;

  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  v7 = dispatch_group_create();
  sub_100F6635C((uint64_t)self->fManager.__ptr_.__value_, &v16);
  sub_1002B7674((uint64_t)&self->fStats, &v16);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
  if (*((_QWORD *)&v16 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v19 = v7;
  if (v7)
    dispatch_retain(v7);
  -[CMHealthColdStorageService queryHealthKitWithGroup:](self, "queryHealthKitWithGroup:", &v19);
  if (v19)
    dispatch_release(v19);
  *(_QWORD *)&v16 = 0;
  *((_QWORD *)&v16 + 1) = &v16;
  v17 = 0x2020000000;
  v18 = 100;
  v15 = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }
  v11 = objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768;
  v13[2] = sub_101019EF0;
  v13[3] = &unk_102199AF0;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = &v16;
  group = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }
  objc_msgSend(v11, "async:", v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10101A02C;
  block[3] = &unk_102199B28;
  block[4] = self;
  block[5] = a3;
  block[6] = &v16;
  dispatch_group_notify(v7, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo"), "queue"), block);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (v7)
  {
    dispatch_group_leave(v7);
    dispatch_release(v7);
    _Block_object_dispose(&v16, 8);
    dispatch_release(v7);
  }
  else
  {
    _Block_object_dispose(&v16, 8);
  }
}

- (BOOL)checkDeferral:(id)a3
{
  _BOOL4 should_defer;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  xpc_activity_state_t state;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  xpc_activity_state_t v14;
  const char *v15;
  uint64_t v17;
  int v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;

  if (a3)
  {
    should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v5 = qword_10229FFA8;
      if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "com.apple.locationd.Motion.ColdStorageSync";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        v18 = 136446210;
        v19 = "com.apple.locationd.Motion.ColdStorageSync";
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[Service] Cancelling (%{public}s) early due to deferral.", &v18, 12);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        v6 = qword_10229FFA8;
        if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }
        if (!sub_1001BFF7C(115, 2))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        LOWORD(v18) = 0;
        LODWORD(v17) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[Service] Activity deferred", &v18, v17);
        v8 = (uint8_t *)v7;
        sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v7);
        if (v8 == buf)
          goto LABEL_24;
      }
      else
      {
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        v9 = qword_10229FFA8;
        if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_FAULT))
        {
          state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          v21 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[Service] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_1001BFF7C(115, 0))
          goto LABEL_24;
        bzero(buf, 0x65CuLL);
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102199C50);
        v13 = qword_10229FFA8;
        v14 = xpc_activity_get_state((xpc_activity_t)a3);
        v18 = 134349056;
        v19 = (const char *)v14;
        LODWORD(v17) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 17, "[Service] Failed to defer activity. Current state is %{public}ld", &v18, v17);
        v8 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v15);
        if (v8 == buf)
          goto LABEL_24;
      }
      free(v8);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }
  else
  {
    LOBYTE(should_defer) = 0;
  }
  return should_defer;
}

- (int64_t)getHealthColdStorageDbCleanupActivityInterval
{
  NSObject *v2;
  const char *v4;
  uint8_t *v5;
  unsigned __int8 v6[24];
  int64_t v7;
  int v8;
  int64_t v9;
  uint8_t buf[4];
  int64_t v11;

  v7 = XPC_ACTIVITY_INTERVAL_4_HOURS;
  sub_1018CA5B4(v6, "HealthColdStorageDbCleanupActivityInterval", &v7, 0);
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v2 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HealthColdStorage: Db Vacuum interval, %lld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v8 = 134217984;
    v9 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "HealthColdStorage: Db Vacuum interval, %lld", &v8);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService getHealthColdStorageDbCleanupActivityInterval]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  return v7;
}

- (void)setupDbCleanupActivity
{
  xpc_object_t v3;
  _QWORD handler[5];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, -[CMHealthColdStorageService getHealthColdStorageDbCleanupActivityInterval](self, "getHealthColdStorageDbCleanupActivityInterval"));
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10101A83C;
  handler[3] = &unk_102144B48;
  handler[4] = objc_msgSend(objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CMHealthColdStorageService"));
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageDbCleanup", v3, handler);
  xpc_release(v3);
}

- (void)performDbCleanUpOnActivity:(id)a3
{
  objc_msgSend(-[CMHealthColdStorageService universe](self, "universe", a3), "silo");
  sub_100F6775C((uint64_t)self->fManager.__ptr_.__value_);
}

- (void)onDbCleanupActivity:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  xpc_activity_state_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  xpc_activity_state_t v21;

  if (!a3)
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v11 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "Invalid xpc activity (%s).", &v14);
LABEL_32:
    v10 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v12);
    if (v10 == buf)
      return;
    goto LABEL_33;
  }
  state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (v6 = state, state == 2))
  {
    -[CMHealthColdStorageService performDbCleanUpOnActivity:](self, "performDbCleanUpOnActivity:", a3);
    if (xpc_activity_get_state((xpc_activity_t)a3) == 3 || xpc_activity_set_state((xpc_activity_t)a3, 5))
      return;
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      v20 = 2050;
      v21 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[Service] Failed to mark (%s) activity as done. Current state is %{public}ld", buf, 0x16u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v8 = qword_10229FFA8;
    v14 = 136315394;
    v15 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
    v16 = 2050;
    v17 = xpc_activity_get_state((xpc_activity_t)a3);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 17, "[Service] Failed to mark (%s) activity as done. Current state is %{public}ld", &v14, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v9);
    if (v10 == buf)
      return;
LABEL_33:
    free(v10);
    return;
  }
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v13 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
    v20 = 2048;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[Service] Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[Service] Unexpected activity (%s) state: %ld", &v14, 22);
    goto LABEL_32;
  }
}

- (void)resetAnalytics
{
  CLHealthColdStorageStats *ptr;
  CLHealthColdStorageStats *v4;

  ptr = self->fStats.__ptr_;
  *(_QWORD *)ptr = 0;
  *((_QWORD *)ptr + 1) = 0;
  *((_DWORD *)ptr + 4) = 0;
  sub_100090AE4((uint64_t)ptr + 24, *((char **)ptr + 4));
  *((_QWORD *)ptr + 3) = (char *)ptr + 32;
  *((_QWORD *)ptr + 5) = 0;
  *((_QWORD *)ptr + 4) = 0;
  v4 = self->fStats.__ptr_;
  *((_DWORD *)v4 + 13) = 0;
  *((_DWORD *)v4 + 14) = 0;
}

- (void)logAnalytics:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[7];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10101B318;
  v10[3] = &unk_102199B50;
  v10[4] = v4;
  v10[5] = v5;
  v10[6] = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102199C50);
  v7 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Daily additions\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
  }
  v8 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Daily purges\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
  }
  v9 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Other\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }

}

- (void)sendAnalytics
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  CLHealthColdStorageStats *ptr;
  CLHealthColdStorageStats *v6;
  CLHealthColdStorageStats *v7;
  CLHealthColdStorageStats *v8;
  CLHealthColdStorageStats *v9;
  CLHealthColdStorageStats *v10;
  CLHealthColdStorageStats *v11;
  CLHealthColdStorageStats *v12;
  CLHealthColdStorageStats *v13;
  CLHealthColdStorageStats *v14;
  CLHealthColdStorageStats *v15;
  CLHealthColdStorageStats *v16;
  CLHealthColdStorageStats *v17;
  CLHealthColdStorageStats *v18;
  CLHealthColdStorageStats *v19;
  CLHealthColdStorageStats *v20;
  CLHealthColdStorageStats *v21;
  CLHealthColdStorageStats *v22;
  CLHealthColdStorageStats *v23;
  CLHealthColdStorageStats *v24;
  CLHealthColdStorageStats *v25;
  CLHealthColdStorageStats *v26;
  CLHealthColdStorageStats *v27;
  CLHealthColdStorageStats *v28;
  CLHealthColdStorageStats *v29;
  CLHealthColdStorageStats *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  NSDictionary *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint8_t *v41;
  NSObject *v42;
  const char *v43;
  _QWORD v44[5];
  void *__p;
  _BYTE *v46;
  uint64_t v47;
  void *v48;
  _BYTE *v49;
  uint64_t v50;
  void *v51[2];
  char v52;
  void *v53[2];
  char v54;
  void *v55[2];
  char v56;
  void *v57[2];
  char v58;
  void *v59[2];
  char v60;
  void *v61[2];
  char v62;
  void *v63[2];
  char v64;
  void *v65[2];
  char v66;
  void *v67[2];
  char v68;
  void *v69[2];
  char v70;
  void *v71[2];
  char v72;
  void *v73[2];
  char v74;
  void *v75[2];
  char v76;
  void *v77[2];
  char v78;
  void *v79[2];
  char v80;
  void *v81[2];
  char v82;
  void *v83[2];
  char v84;
  void *v85[2];
  char v86;
  void *v87[2];
  char v88;
  void *v89[2];
  char v90;
  void *v91[2];
  char v92;
  void *v93[2];
  char v94;
  void *v95[2];
  char v96;
  void *v97[2];
  char v98;
  void *v99[2];
  char v100;
  void **v101;
  uint8_t buf[8];
  int v103;
  char v104;
  _QWORD v105[35];
  _QWORD v106[35];

  v3 = atomic_load((unsigned __int8 *)&qword_10230BB38);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_10230BB38))
  {
    *(_QWORD *)buf = 0x3E800000000;
    v103 = 10000;
    sub_100EC0C5C(qword_10230BB20, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100EC0CDC, qword_10230BB20, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10230BB38);
  }
  v4 = atomic_load((unsigned __int8 *)&qword_10230BB58);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_10230BB58))
  {
    *(_QWORD *)buf = &_mh_execute_header;
    v103 = 2;
    sub_100EC0C5C(qword_10230BB40, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100EC0CDC, qword_10230BB40, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10230BB58);
  }
  v105[0] = CFSTR("CountCKError_Others");
  v106[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_DWORD *)self->fStats.__ptr_);
  v105[1] = CFSTR("CountCKError_PrivateMissingManateeIdentity");
  v106[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->fStats.__ptr_ + 1));
  v105[2] = CFSTR("CountCKError_ServerRecordChanged");
  v106[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->fStats.__ptr_ + 2));
  v105[3] = CFSTR("CountCKError_UnknownItem");
  v106[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->fStats.__ptr_ + 3));
  v105[4] = CFSTR("CountCKError_ZoneNotFound");
  v106[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->fStats.__ptr_ + 4));
  v105[5] = CFSTR("NumDailyRecords_HRRIHH");
  ptr = self->fStats.__ptr_;
  sub_1015A2E04(buf, "HRRecoveryInputHRHistory");
  v99[0] = buf;
  v106[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)ptr + 3, (const void **)buf, (uint64_t)&unk_101B9EB60, (_OWORD **)v99)+ 14));
  v105[6] = CFSTR("NumDailyRecords_HRRIWH");
  v6 = self->fStats.__ptr_;
  sub_1015A2E04(v99, "HRRecoveryInputWRHistory");
  v97[0] = v99;
  v106[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v6 + 3, (const void **)v99, (uint64_t)&unk_101B9EB60, (_OWORD **)v97)+ 14));
  v105[7] = CFSTR("NumDailyRecords_HRRSH");
  v7 = self->fStats.__ptr_;
  sub_1015A2E04(v97, "HRRecoverySessionHistory");
  v95[0] = v97;
  v106[7] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v7 + 3, (const void **)v97, (uint64_t)&unk_101B9EB60, (_OWORD **)v95)+ 14));
  v105[8] = CFSTR("NumDailyRecords_MBMH");
  v8 = self->fStats.__ptr_;
  sub_1015A2E04(v95, "MobilityBoutMetricsHistory");
  v93[0] = v95;
  v106[8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v8 + 3, (const void **)v95, (uint64_t)&unk_101B9EB60, (_OWORD **)v93)+ 14));
  v105[9] = CFSTR("NumDailyRecords_PWDBH");
  v9 = self->fStats.__ptr_;
  sub_1015A2E04(v93, "PredictedWalkDistanceBoutHistory");
  v91[0] = v93;
  v106[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v9 + 3, (const void **)v93, (uint64_t)&unk_101B9EB60, (_OWORD **)v91)+ 14));
  v105[10] = CFSTR("NumDailyRecords_SCH");
  v10 = self->fStats.__ptr_;
  sub_1015A2E04(v91, "StrideCalHistory");
  v89[0] = v91;
  v106[10] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v10 + 3, (const void **)v91, (uint64_t)&unk_101B9EB60, (_OWORD **)v89)+ 14));
  v105[11] = CFSTR("NumDailyRecords_WSSC");
  v11 = self->fStats.__ptr_;
  sub_1015A2E04(v89, "WalkingSpeedStrideCal");
  v87[0] = v89;
  v106[11] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v11 + 3, (const void **)v89, (uint64_t)&unk_101B9EB60, (_OWORD **)v87)+ 14));
  v105[12] = CFSTR("NumDailyRecords_SGMH");
  v12 = self->fStats.__ptr_;
  sub_1015A2E04(v87, "SmoothedGaitMetricsHistory");
  v85[0] = v87;
  v106[12] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v12 + 3, (const void **)v87, (uint64_t)&unk_101B9EB60, (_OWORD **)v85)+ 14));
  v105[13] = CFSTR("NumDailyRecords_EGH");
  v13 = self->fStats.__ptr_;
  sub_1015A2E04(v85, "ElevationGradeHistory");
  v83[0] = v85;
  v106[13] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v13 + 3, (const void **)v85, (uint64_t)&unk_101B9EB60, (_OWORD **)v83)+ 14));
  v105[14] = CFSTR("NumDailyRecords_VOMH");
  v14 = self->fStats.__ptr_;
  sub_1015A2E04(v83, "VO2MaxHistory");
  v81[0] = v83;
  v106[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v14 + 3, (const void **)v83, (uint64_t)&unk_101B9EB60, (_OWORD **)v81)+ 14));
  v105[15] = CFSTR("NumDailyRecords_VOMIH");
  v15 = self->fStats.__ptr_;
  sub_1015A2E04(v81, "VO2MaxInputHistory");
  v79[0] = v81;
  v106[15] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v15 + 3, (const void **)v81, (uint64_t)&unk_101B9EB60, (_OWORD **)v79)+ 14));
  v105[16] = CFSTR("NumDailyRecords_VOMSAH");
  v16 = self->fStats.__ptr_;
  sub_1015A2E04(v79, "VO2MaxSessionAttributesHistory");
  v77[0] = v79;
  v106[16] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v16 + 3, (const void **)v79, (uint64_t)&unk_101B9EB60, (_OWORD **)v77)+ 14));
  v105[17] = CFSTR("NumDailyRecords_VOMSH");
  v17 = self->fStats.__ptr_;
  sub_1015A2E04(v77, "VO2MaxSummaryHistory");
  v75[0] = v77;
  v106[17] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v17 + 3, (const void **)v77, (uint64_t)&unk_101B9EB60, (_OWORD **)v75)+ 14));
  v105[18] = CFSTR("NumPurgedDailyRecords_HRRIHH");
  v18 = self->fStats.__ptr_;
  sub_1015A2E04(v75, "HRRecoveryInputHRHistory");
  v73[0] = v75;
  v106[18] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v18 + 3, (const void **)v75, (uint64_t)&unk_101B9EB60, (_OWORD **)v73)+ 15));
  v105[19] = CFSTR("NumPurgedDailyRecords_HRRIWH");
  v19 = self->fStats.__ptr_;
  sub_1015A2E04(v73, "HRRecoveryInputWRHistory");
  v71[0] = v73;
  v106[19] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v19 + 3, (const void **)v73, (uint64_t)&unk_101B9EB60, (_OWORD **)v71)+ 15));
  v105[20] = CFSTR("NumPurgedDailyRecords_HRRSH");
  v20 = self->fStats.__ptr_;
  sub_1015A2E04(v71, "HRRecoverySessionHistory");
  v69[0] = v71;
  v106[20] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v20 + 3, (const void **)v71, (uint64_t)&unk_101B9EB60, (_OWORD **)v69)+ 15));
  v105[21] = CFSTR("NumPurgedDailyRecords_MBMH");
  v21 = self->fStats.__ptr_;
  sub_1015A2E04(v69, "MobilityBoutMetricsHistory");
  v67[0] = v69;
  v106[21] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v21 + 3, (const void **)v69, (uint64_t)&unk_101B9EB60, (_OWORD **)v67)+ 15));
  v105[22] = CFSTR("NumPurgedDailyRecords_PWDBH");
  v22 = self->fStats.__ptr_;
  sub_1015A2E04(v67, "PredictedWalkDistanceBoutHistory");
  v65[0] = v67;
  v106[22] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v22 + 3, (const void **)v67, (uint64_t)&unk_101B9EB60, (_OWORD **)v65)+ 15));
  v105[23] = CFSTR("NumPurgedDailyRecords_SCH");
  v23 = self->fStats.__ptr_;
  sub_1015A2E04(v65, "StrideCalHistory");
  v63[0] = v65;
  v106[23] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v23 + 3, (const void **)v65, (uint64_t)&unk_101B9EB60, (_OWORD **)v63)+ 15));
  v105[24] = CFSTR("NumPurgedDailyRecords_WSSC");
  v24 = self->fStats.__ptr_;
  sub_1015A2E04(v63, "WalkingSpeedStrideCal");
  v61[0] = v63;
  v106[24] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v24 + 3, (const void **)v63, (uint64_t)&unk_101B9EB60, (_OWORD **)v61)+ 15));
  v105[25] = CFSTR("NumPurgedDailyRecords_SGMH");
  v25 = self->fStats.__ptr_;
  sub_1015A2E04(v61, "SmoothedGaitMetricsHistory");
  v59[0] = v61;
  v106[25] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v25 + 3, (const void **)v61, (uint64_t)&unk_101B9EB60, (_OWORD **)v59)+ 15));
  v105[26] = CFSTR("NumPurgedDailyRecords_EGH");
  v26 = self->fStats.__ptr_;
  sub_1015A2E04(v59, "ElevationGradeHistory");
  v57[0] = v59;
  v106[26] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v26 + 3, (const void **)v59, (uint64_t)&unk_101B9EB60, (_OWORD **)v57)+ 15));
  v105[27] = CFSTR("NumPurgedDailyRecords_VOMH");
  v27 = self->fStats.__ptr_;
  sub_1015A2E04(v57, "VO2MaxHistory");
  v55[0] = v57;
  v106[27] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v27 + 3, (const void **)v57, (uint64_t)&unk_101B9EB60, (_OWORD **)v55)+ 15));
  v105[28] = CFSTR("NumPurgedDailyRecords_VOMIH");
  v28 = self->fStats.__ptr_;
  sub_1015A2E04(v55, "VO2MaxInputHistory");
  v53[0] = v55;
  v106[28] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v28 + 3, (const void **)v55, (uint64_t)&unk_101B9EB60, (_OWORD **)v53)+ 15));
  v105[29] = CFSTR("NumPurgedDailyRecords_VOMSAH");
  v29 = self->fStats.__ptr_;
  sub_1015A2E04(v53, "VO2MaxSessionAttributesHistory");
  v51[0] = v53;
  v106[29] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v29 + 3, (const void **)v53, (uint64_t)&unk_101B9EB60, (_OWORD **)v51)+ 15));
  v105[30] = CFSTR("NumPurgedDailyRecords_VOMSH");
  v30 = self->fStats.__ptr_;
  sub_1015A2E04(v51, "VO2MaxSummaryHistory");
  v101 = v51;
  v106[30] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)sub_100318A40((uint64_t **)v30 + 3, (const void **)v51, (uint64_t)&unk_101B9EB60, (_OWORD **)&v101)+ 15));
  v105[31] = CFSTR("CKSyncEnabled");
  v106[31] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned __int8 *)self->fStats.__ptr_ + 48));
  v105[32] = CFSTR("DailyStepCounts");
  v31 = *((_DWORD *)self->fStats.__ptr_ + 13);
  v49 = 0;
  v50 = 0;
  v48 = 0;
  sub_10027205C(&v48, (const void *)qword_10230BB20[0], unk_10230BB28, (unk_10230BB28 - qword_10230BB20[0]) >> 2);
  if (v49 == v48)
  {
    v32 = 0;
  }
  else
  {
    v32 = 0;
    v33 = (v49 - (_BYTE *)v48) >> 2;
    if (v33 <= 1)
      v33 = 1;
    while (*((_DWORD *)v48 + v32) < v31)
    {
      if (v33 == ++v32)
      {
        v32 = v33;
        break;
      }
    }
  }
  v106[32] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32);
  v105[33] = CFSTR("OutdoorPedWorkoutCounts");
  v34 = *((_DWORD *)self->fStats.__ptr_ + 14);
  v46 = 0;
  v47 = 0;
  __p = 0;
  sub_10027205C(&__p, (const void *)qword_10230BB40[0], unk_10230BB48, (unk_10230BB48 - qword_10230BB40[0]) >> 2);
  if (v46 == __p)
  {
    v35 = 0;
  }
  else
  {
    v35 = 0;
    v36 = (v46 - (_BYTE *)__p) >> 2;
    if (v36 <= 1)
      v36 = 1;
    while (*((_DWORD *)__p + v35) < v34)
    {
      if (v36 == ++v35)
      {
        v35 = v36;
        break;
      }
    }
  }
  v106[33] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v35);
  v105[34] = CFSTR("TotalDbSizeMB");
  v106[34] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->fStats.__ptr_ + 15));
  v37 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v106, v105, 35);
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  if (v52 < 0)
    operator delete(v51[0]);
  if (v54 < 0)
    operator delete(v53[0]);
  if (v56 < 0)
    operator delete(v55[0]);
  if (v58 < 0)
    operator delete(v57[0]);
  if (v60 < 0)
    operator delete(v59[0]);
  if (v62 < 0)
    operator delete(v61[0]);
  if (v64 < 0)
    operator delete(v63[0]);
  if (v66 < 0)
    operator delete(v65[0]);
  if (v68 < 0)
    operator delete(v67[0]);
  if (v70 < 0)
    operator delete(v69[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  if (v74 < 0)
    operator delete(v73[0]);
  if (v76 < 0)
    operator delete(v75[0]);
  if (v78 < 0)
    operator delete(v77[0]);
  if (v80 < 0)
    operator delete(v79[0]);
  if (v82 < 0)
    operator delete(v81[0]);
  if (v84 < 0)
    operator delete(v83[0]);
  if (v86 < 0)
    operator delete(v85[0]);
  if (v88 < 0)
    operator delete(v87[0]);
  if (v90 < 0)
    operator delete(v89[0]);
  if (v92 < 0)
    operator delete(v91[0]);
  if (v94 < 0)
    operator delete(v93[0]);
  if (v96 < 0)
    operator delete(v95[0]);
  if (v98 < 0)
    operator delete(v97[0]);
  if (v100 < 0)
    operator delete(v99[0]);
  if (v104 < 0)
    operator delete(*(void **)buf);
  -[CMHealthColdStorageService logAnalytics:](self, "logAnalytics:", v37);
  if (objc_opt_class(MCProfileConnection, v38)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10101C7B0;
    v44[3] = &unk_102132010;
    v44[4] = v37;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.ColdStorage"), v44);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v39 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "HealthColdStorage, sent Core Analytics event.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      LOWORD(v99[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "HealthColdStorage, sent Core Analytics event.", v99, 2);
      v41 = (uint8_t *)v40;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService sendAnalytics]", "%s\n", v40);
LABEL_92:
      if (v41 != buf)
        free(v41);
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v42 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "HealthColdStorage, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      LOWORD(v99[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "HealthColdStorage, not sending analytics, no IHA permission", v99, 2);
      v41 = (uint8_t *)v43;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService sendAnalytics]", "%s\n", v43);
      goto LABEL_92;
    }
  }
}

- (void)queryHealthKitWithGroup:(group *)a3
{
  CLHealthColdStorageStats *ptr;
  double Current;
  char *gr_name;
  double v8;
  id *v9;
  id *v10;
  _QWORD v11[5];
  dispatch_group_t group;
  _QWORD v13[5];
  dispatch_group_t object;
  char *v15;

  ptr = self->fStats.__ptr_;
  *((_DWORD *)ptr + 13) = 0;
  *((_DWORD *)ptr + 14) = 0;
  Current = CFAbsoluteTimeGetCurrent();
  gr_name = a3->gr_name;
  v15 = gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  v8 = Current + -86400.0;
  v9 = (id *)self->fHKQueryDelegate.__ptr_;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768;
  v13[2] = sub_10101C96C;
  v13[3] = &unk_102199BB0;
  v13[4] = self;
  object = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  sub_1010DE2B0(v9, (uint64_t)v13, v8, Current);
  v10 = (id *)self->fHKQueryDelegate.__ptr_;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768;
  v11[2] = sub_10101D0CC;
  v11[3] = &unk_102199C20;
  v11[4] = self;
  group = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  sub_1010E08D0(v10, (uint64_t)v11, v8, Current);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (object)
  {
    dispatch_group_leave(object);
    if (object)
      dispatch_release(object);
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

- (int)getTotalDBSizeInMB
{
  std::string *v2;
  NSString *v3;
  NSString *v4;
  NSDictionary *v5;
  BOOL v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  const char *v11;
  std::string *v12;
  const char *v13;
  std::string *v14;
  std::string::size_type v15;
  int v16;
  NSString *v17;
  __int16 v18;
  unint64_t v19;
  std::string __p[68];

  sub_100584CC0(2, __p);
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v2 = __p;
  else
    v2 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  v4 = -[NSString stringByAppendingPathComponent:](v3, "stringByAppendingPathComponent:", CFSTR("cold_encryptedB.db"));
  v15 = 0;
  v5 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", v4, &v15);
  if (v5)
    v6 = v15 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = -[NSDictionary fileSize](v5, "fileSize");
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v9 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138543618;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
      WORD2(__p[0].__r_.__value_.__r.__words[1]) = 2050;
      *(std::string::size_type *)((char *)&__p[0].__r_.__value_.__r.__words[1] + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "getTotalDBSize(%{public}@) %{public}llu bytes", (uint8_t *)__p, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v16 = 138543618;
      v17 = v4;
      v18 = 2050;
      v19 = v8;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FFA8, 1, "getTotalDBSize(%{public}@) %{public}llu bytes", &v16, 22);
      v14 = (std::string *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", v13);
      if (v14 != __p)
        free(v14);
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102199C50);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get total DB size: %@", (uint8_t *)__p, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102199C50);
      v16 = 138412290;
      v17 = (NSString *)v15;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FFA8, 16, "Unable to get total DB size: %@", &v16, 12);
      v12 = (std::string *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", v11);
      if (v12 != __p)
        free(v12);
    }
    v8 = 0;
  }
  return (int)((double)v8 / 1000000.0);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  sub_100261F44((uint64_t)&self->fStats);
  sub_100261F44((uint64_t)&self->fHKQueryDelegate);
  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  sub_10101DD58((uint64_t *)&self->fManager, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end

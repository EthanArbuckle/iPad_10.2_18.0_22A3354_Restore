@implementation CMHealthColdStorageWatchService

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
  if (qword_102302FD8 != -1)
    dispatch_once(&qword_102302FD8, &stru_102148298);
  return (id)qword_102302FD0;
}

- (CMHealthColdStorageWatchService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageWatchService;
  return -[CMHealthColdStorageWatchService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CMHealthColdStorageWatchServiceProtocol, &OBJC_PROTOCOL___CMHealthColdStorageWatchServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_102302FE8 != -1)
    dispatch_once(&qword_102302FE8, &stru_1021482B8);
  return byte_102302FE0;
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[8];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102148378);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CMHealthColdStorageWatchService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Starting up CMHealthColdStorageWatchService", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  self->fCurrentTableIndex = 0;
  self->fIterationCount = 0;
  -[CMHealthColdStorageWatchService setupSyncActivity](self, "setupSyncActivity");
  self->fCompanionConnected = 0;
  sub_1001B6924();
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  Client *v5;
  NSObject *fAggregationTimer;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102148378);
  v3 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageWatchService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "Shutting down CMHealthColdStorageWatchService", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService endService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  value = self->fCompanionClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    v5 = self->fCompanionClient.__ptr_.__value_;
    self->fCompanionClient.__ptr_.__value_ = 0;
    if (v5)
      (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
}

- (void)setUpAggregationOnTimer
{
  OS_dispatch_source *v3;
  NSObject *fAggregationTimer;
  _QWORD handler[5];

  sub_10061125C((void **)self->fElevationGradeAggregator.__ptr_.__value_, 604800.0);
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0, 0x4E94914F0000uLL, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100611510;
  handler[3] = &unk_10212BB58;
  handler[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, handler);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  int v8;
  int v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo");
  if (*a3 == 5)
  {
    self->fCompanionConnected = *(_BYTE *)a4;
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      v8 = *a3;
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[WatchService] Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      v9 = *a3;
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[WatchService] Unhandled notification type, %d", v12);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService onCompanionNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)sendCompanionData:(id)a3 activity:(id)a4
{
  void *v7;
  _QWORD v8[7];

  v7 = objc_autoreleasePoolPush();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100611EE0;
  v8[3] = &unk_102148330;
  v8[4] = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", a3), 1, 0);
  v8[5] = self;
  v8[6] = a4;
  objc_msgSend(objc_msgSend(objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLCompanionNotifier")), "doAsync:", v8);
  objc_msgSend(a3, "removeAllObjects");
  objc_autoreleasePoolPop(v7);
}

- (void)continueSync:(id)a3
{
  id v5;
  uint64_t fCurrentTableIndex;
  id v7;
  unint64_t v8;
  int v9;
  NSObject *v10;
  int fIterationCount;
  NSObject *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint8_t *v19;
  int v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint8_t *v24;
  int v25;
  int v26;
  uint8_t buf[4];
  int v28;

  if (!-[CMHealthColdStorageWatchService checkDeferral:](self, "checkDeferral:"))
  {
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    self->fLastBatchSize = 0;
    fCurrentTableIndex = self->fCurrentTableIndex;
    if (fCurrentTableIndex <= 4)
    {
      v7 = v5;
      switch(dword_101BB7FF0[fCurrentTableIndex])
      {
        case 1:
          v8 = sub_101000648((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 2:
          v8 = sub_1010001CC((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 3:
          v8 = sub_100FFFD84(self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 4:
          v8 = sub_100B159B4(self->fPredWalkDistanceSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 5:
          v8 = sub_10098D12C((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_, v5, 0x30D40u);
LABEL_9:
          v9 = v8;
          if (v8)
          {
            if (qword_10229FFA0 != -1)
              dispatch_once(&qword_10229FFA0, &stru_102148378);
            v10 = qword_10229FFA8;
            if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
            {
              fIterationCount = self->fIterationCount;
              self->fIterationCount = fIterationCount + 1;
              *(_DWORD *)buf = 67240192;
              v28 = fIterationCount;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[WatchService] Sending companion data iteration:(%{public}d)", buf, 8u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FFA0 != -1)
                dispatch_once(&qword_10229FFA0, &stru_102148378);
              v16 = qword_10229FFA8;
              v17 = self->fIterationCount;
              self->fIterationCount = v17 + 1;
              v25 = 67240192;
              v26 = v17;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 1, "[WatchService] Sending companion data iteration:(%{public}d)", &v25, 8);
              v19 = (uint8_t *)v18;
              sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v18);
              if (v19 != buf)
                free(v19);
            }
            self->fLastBatchSize = v9;
            -[CMHealthColdStorageWatchService sendCompanionData:activity:](self, "sendCompanionData:activity:", v7, a3);
          }
          else
          {
            LODWORD(fCurrentTableIndex) = self->fCurrentTableIndex;
LABEL_17:
            self->fCurrentTableIndex = fCurrentTableIndex + 1;
            if (qword_10229FFA0 != -1)
              dispatch_once(&qword_10229FFA0, &stru_102148378);
            v12 = qword_10229FFA8;
            if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
            {
              v13 = self->fCurrentTableIndex;
              *(_DWORD *)buf = 67109120;
              v28 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[WatchService] Advancing to next table: %d", buf, 8u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_10229FFA0 != -1)
                dispatch_once(&qword_10229FFA0, &stru_102148378);
              v20 = self->fCurrentTableIndex;
              v25 = 67109120;
              v26 = v20;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[WatchService] Advancing to next table: %d", &v25);
              v22 = (uint8_t *)v21;
              sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v21);
              if (v22 != buf)
                free(v22);
            }
            if (self->fCurrentTableIndex > 4u)
            {
              if (qword_10229FFA0 != -1)
                dispatch_once(&qword_10229FFA0, &stru_102148378);
              v15 = qword_10229FFA8;
              if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[WatchService] Data transfer completed", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FFA0 != -1)
                  dispatch_once(&qword_10229FFA0, &stru_102148378);
                LOWORD(v25) = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[WatchService] Data transfer completed", &v25, 2);
                v24 = (uint8_t *)v23;
                sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v23);
                if (v24 != buf)
                  free(v24);
              }
              -[CMHealthColdStorageWatchService setActivityAsDone:](self, "setActivityAsDone:", a3);
            }
            else
            {
              v14 = objc_autoreleasePoolPush();
              -[CMHealthColdStorageWatchService continueSync:](self, "continueSync:", a3);
              objc_autoreleasePoolPop(v14);
            }
          }
          break;
        default:
          goto LABEL_17;
      }
    }
  }
}

- (void)saveCurrentSyncProgress
{
  uint64_t fCurrentTableIndex;
  int *p_fLastBatchSize;
  int *p_numRecordsSync_HRRSH;

  fCurrentTableIndex = self->fCurrentTableIndex;
  if (fCurrentTableIndex <= 4)
  {
    switch(dword_101BB7FF0[fCurrentTableIndex])
    {
      case 1:
        sub_101000E88((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRSH;
        goto LABEL_8;
      case 2:
        sub_101000CA8((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIWH;
        goto LABEL_8;
      case 3:
        sub_101000AC8((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIHH;
        goto LABEL_8;
      case 4:
        sub_100B15E3C((uint64_t)self->fPredWalkDistanceSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_PWDBH;
        goto LABEL_8;
      case 5:
        sub_10098D558((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_EGH;
LABEL_8:
        *p_numRecordsSync_HRRSH += *p_fLastBatchSize;
        break;
      default:
        return;
    }
  }
}

- (void)setupSyncActivity
{
  xpc_object_t v3;
  _QWORD handler[6];
  unsigned __int8 v5[8];
  int64_t value;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_1018CA5B4(v5, "CMHealthColdStorageCompanionSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_8_HOURS, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100612A78;
  handler[3] = &unk_102148358;
  handler[4] = self;
  handler[5] = objc_msgSend(objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CMHealthColdStorageWatchService"));
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageWatchSync", v3, handler);
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
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _QWORD v14[6];
  int v15;
  const char *v16;
  __int16 v17;
  xpc_activity_state_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  xpc_activity_state_t v22;

  if (a3)
  {
    state = xpc_activity_get_state((xpc_activity_t)a3);
    if (state == 4 || (v6 = state, state == 2))
    {
      if (self->fCompanionConnected)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100613260;
        v14[3] = &unk_10212BB30;
        v14[4] = self;
        v14[5] = a3;
        objc_msgSend(objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo"), "async:", v14);
      }
      else
      {
        if (qword_10229FFA0 != -1)
          dispatch_once(&qword_10229FFA0, &stru_102148378);
        v11 = qword_10229FFA8;
        if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WatchService] Cannot send data, companion not nearby", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FFA0 != -1)
            dispatch_once(&qword_10229FFA0, &stru_102148378);
          LOWORD(v15) = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 0, "[WatchService] Cannot send data, companion not nearby", &v15, 2);
          v13 = (uint8_t *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v12);
          if (v13 != buf)
            free(v13);
        }
        -[CMHealthColdStorageWatchService setActivityAsDone:](self, "setActivityAsDone:", a3);
      }
      return;
    }
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v9 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      v21 = 2048;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[WatchService] Unexpected activity (%s) state: %ld", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      v15 = 136315394;
      v16 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      v17 = 2048;
      v18 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[WatchService] Unexpected activity (%s) state: %ld", &v15, 22);
LABEL_22:
      v10 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v8);
      if (v10 != buf)
        free(v10);
    }
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[WatchService] Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      v15 = 136315138;
      v16 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 16, "[WatchService] Invalid xpc activity (%s).", &v15);
      goto LABEL_22;
    }
  }
}

- (BOOL)checkDeferral:(id)a3
{
  _BOOL4 should_defer;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  xpc_activity_state_t state;
  OS_os_transaction *fTransaction;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  xpc_activity_state_t v16;
  const char *v17;
  uint64_t v19;
  int v20;
  const char *v21;
  uint8_t buf[4];
  const char *v23;

  if (!a3)
  {
    LOBYTE(should_defer) = 0;
    return should_defer;
  }
  should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
  if (!should_defer)
    return should_defer;
  if (qword_10229FFA0 != -1)
    dispatch_once(&qword_10229FFA0, &stru_102148378);
  v6 = qword_10229FFA8;
  if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v23 = "com.apple.locationd.Motion.ColdStorageWatchSync";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[WatchService] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v20 = 136446210;
    v21 = "com.apple.locationd.Motion.ColdStorageWatchSync";
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[WatchService] Cancelling (%{public}s) early due to deferral.", &v20, 12);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  if (xpc_activity_set_state((xpc_activity_t)a3, 3))
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v7 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[WatchService] Activity deferred", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_24;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    LOWORD(v20) = 0;
    LODWORD(v19) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[WatchService] Activity deferred", &v20, v19);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v8);
    if (v9 == buf)
      goto LABEL_24;
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v10 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_FAULT))
    {
      state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      v23 = (const char *)state;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "[WatchService] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_24;
    bzero(buf, 0x65CuLL);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v15 = qword_10229FFA8;
    v16 = xpc_activity_get_state((xpc_activity_t)a3);
    v20 = 134349056;
    v21 = (const char *)v16;
    LODWORD(v19) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 17, "[WatchService] Failed to defer activity. Current state is %{public}ld", &v20, v19);
    v9 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v17);
    if (v9 == buf)
      goto LABEL_24;
  }
  free(v9);
LABEL_24:
  -[CMHealthColdStorageWatchService sendAnalytics](self, "sendAnalytics");
  self->fCurrentTableIndex = 0;
  self->fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0;
  }
  LOBYTE(should_defer) = 1;
  return should_defer;
}

- (void)setActivityAsDone:(id)a3
{
  NSObject *v5;
  OS_os_transaction *fTransaction;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  const char *v11;
  __int16 v12;
  xpc_activity_state_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  xpc_activity_state_t state;

  -[CMHealthColdStorageWatchService sendAnalytics](self, "sendAnalytics");
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v5 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      v16 = 2050;
      state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[WatchService] failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      v7 = qword_10229FFA8;
      v10 = 136446466;
      v11 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      v12 = 2050;
      v13 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 17, "[WatchService] failed to mark %{public}s activity as Done. Current state is %{public}ld", &v10, 22);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService setActivityAsDone:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  self->fCurrentTableIndex = 0;
  self->fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0;
  }
}

- (void)sendAnalytics
{
  NSDictionary *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  int v11;
  NSDictionary *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  uint8_t buf[4];
  NSDictionary *v16;

  if (objc_opt_class(MCProfileConnection, a2)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v13[0] = CFSTR("NumErrors");
    v14[0] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numErrors);
    v13[1] = CFSTR("NumRecordsSync_EGH");
    v14[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_EGH);
    v13[2] = CFSTR("NumRecordsSync_HRRIHH");
    v14[2] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRIHH);
    v13[3] = CFSTR("NumRecordsSync_HRRIWH");
    v14[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRIWH);
    v13[4] = CFSTR("NumRecordsSync_HRRSH");
    v14[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_HRRSH);
    v13[5] = CFSTR("NumRecordsSync_PWDBH");
    v14[5] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->fStats.numRecordsSync_PWDBH);
    v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100613D80;
    v10[3] = &unk_102132010;
    v10[4] = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.ColdStorageWatchSync"), v10);
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v4 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[WatchService] sent Core Analytics event: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      v11 = 138412290;
      v12 = v3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 1, "[WatchService] sent Core Analytics event: %@", &v11, 12);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
    -[CMHealthColdStorageWatchService resetAnalytics](self, "resetAnalytics");
  }
  else
  {
    if (qword_10229FFA0 != -1)
      dispatch_once(&qword_10229FFA0, &stru_102148378);
    v5 = qword_10229FFA8;
    if (os_log_type_enabled((os_log_t)qword_10229FFA8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[WatchService] not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFA0 != -1)
        dispatch_once(&qword_10229FFA0, &stru_102148378);
      LOWORD(v11) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FFA8, 2, "[WatchService] not sending analytics, no IHA permission", &v11, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
  }
}

- (void)resetAnalytics
{
  *(_QWORD *)&self->fStats.numRecordsSync_HRRIHH = 0;
  *(_QWORD *)&self->fStats.numRecordsSync_HRRSH = 0;
  *(_QWORD *)&self->fStats.numErrors = 0;
}

- (void).cxx_destruct
{
  Client *value;
  CLHRRecoveryCompanionSyncManager *v4;

  sub_10041D2EC((uint64_t *)&self->fElevationGradeAggregator, 0);
  sub_100261F44((uint64_t)&self->fElevationGradeRecorderDb);
  sub_100261F44((uint64_t)&self->fBoutRecorderDb);
  sub_100261F44((uint64_t)&self->fSessionDb);
  sub_100261F44((uint64_t)&self->fInputWRDb);
  sub_100261F44((uint64_t)&self->fInputHRDb);
  value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  sub_10061403C((uint64_t *)&self->fElevationGradeSyncManager, 0);
  sub_100614000((uint64_t *)&self->fPredWalkDistanceSyncManager, 0);
  v4 = self->fHRRSyncManager.__ptr_.__value_;
  self->fHRRSyncManager.__ptr_.__value_ = 0;
  if (v4)
    sub_100613FB4((uint64_t)&self->fHRRSyncManager, (uint64_t)v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 21) = 0;
  return self;
}

@end

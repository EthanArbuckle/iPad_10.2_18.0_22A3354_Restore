@implementation CLFenceAnalyticsManager

+ (BOOL)isSupported
{
  if (qword_1023050B8 != -1)
    dispatch_once(&qword_1023050B8, &stru_102159D28);
  return byte_1023050B0;
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
  if (qword_1023050C8 != -1)
    dispatch_once(&qword_1023050C8, &stru_102159D48);
  return (id)qword_1023050C0;
}

- (CLFenceAnalyticsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsManager;
  return -[CLFenceAnalyticsManager initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLFenceAnalyticsManagerServiceProtocol, &OBJC_PROTOCOL___CLFenceAnalyticsManagerClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  _WORD v10[8];
  uint8_t buf[1640];

  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102159E08);
  v3 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FenceAnalyticsManager beginService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102159E08);
    v10[0] = 0;
    LODWORD(v9) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "FenceAnalyticsManager beginService", v10, v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager beginService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  self->_stateChangeAnalytics = -[CLFenceStateChangeAnalytics initWithUniverse:fenceAnalyticsManager:]([CLFenceStateChangeAnalytics alloc], "initWithUniverse:fenceAnalyticsManager:", -[CLFenceAnalyticsManager universe](self, "universe"), self);
  if (objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLMotionState")))self->_motionStateProxy = (CLMotionStateProtocol *)objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLMotionState"), CFSTR("CLFenceAnalyticsManager"));
  HIBYTE(v9) = 0;
  sub_1008A4628((unsigned __int8 *)&v9 + 7, buf);
  sub_1002B7674((uint64_t)&self->_stepCountDb, (__int128 *)buf);
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
  self->_historicalFenceStates = objc_opt_new(NSMutableDictionary);
  if (objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLFenceManager")))self->_fenceManagerProxy = (CLFenceManagerProtocol *)objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLFenceManager"), CFSTR("CLFenceAnalyticsManager"));
  self->_routineMonitor = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLRoutineMonitor"), CFSTR("CLFenceAnalyticsManager"));
  -[CLFenceAnalyticsManager universe](self, "universe");
  sub_1001B5C7C();
}

- (void)endService
{
  CLMotionStateProtocol *motionStateProxy;
  CLFenceManagerProtocol *fenceManagerProxy;
  CLFenceStateChangeAnalytics *stateChangeAnalytics;
  CLRoutineMonitorServiceProtocol *routineMonitor;

  self->_historicalFenceStates = 0;
  motionStateProxy = self->_motionStateProxy;
  if (motionStateProxy)
  {

    self->_motionStateProxy = 0;
  }
  fenceManagerProxy = self->_fenceManagerProxy;
  if (fenceManagerProxy)
  {

    self->_fenceManagerProxy = 0;
  }
  stateChangeAnalytics = self->_stateChangeAnalytics;
  if (stateChangeAnalytics)
  {

    self->_stateChangeAnalytics = 0;
  }
  routineMonitor = self->_routineMonitor;
  if (routineMonitor)
  {

    self->_routineMonitor = 0;
  }
}

- (id)queue
{
  return objc_msgSend(objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe"), "silo"), "queue");
}

- (void)fetchMotionActivitiesInInterval:(id)a3 handler:(id)a4
{
  CLMotionStateProtocol *motionStateProxy;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLFenceAnalyticsManager.mm"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  motionStateProxy = self->_motionStateProxy;
  objc_msgSend(objc_msgSend(a3, "startDate"), "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(objc_msgSend(a3, "endDate"), "timeIntervalSinceReferenceDate");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008A3708;
  v11[3] = &unk_102159D70;
  v11[4] = self;
  v11[5] = a4;
  -[CLMotionStateProtocol queryMotionStatesWithStartTime:endTime:isFromInternalClient:withReply:](motionStateProxy, "queryMotionStatesWithStartTime:endTime:isFromInternalClient:withReply:", 1, v11, v9, v10);
}

- (void)fetchDominantMotionActivityInInterval:(id)a3 handler:(id)a4
{
  _QWORD v7[7];

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLFenceAnalyticsManager.mm"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008A37FC;
  v7[3] = &unk_102159D98;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[CLFenceAnalyticsManager fetchMotionActivitiesInInterval:handler:](self, "fetchMotionActivitiesInInterval:handler:", a3, v7);
}

- (CLStepDistance)fetchStepCountInInterval:(SEL)a3
{
  CLStepCountRecorderDb *ptr;
  double v7;
  double v8;
  double v9;
  CLStepDistance *result;

  *(_QWORD *)&retstr->var7 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  ptr = self->_stepCountDb.__ptr_;
  objc_msgSend(objc_msgSend(a4, "startDate"), "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(objc_msgSend(a4, "endDate"), "timeIntervalSinceReferenceDate");
  sub_100087DE0((uint64_t)ptr, 0, (uint64_t)retstr, v8, v9);
  return result;
}

+ (id)regionForFence:(Fence *)a3
{
  id v5;
  int *p_var0;
  id v7;
  id v8;
  CLLocationCoordinate2D v9;

  if (a3[5].var0.var0 != *(_QWORD *)&a3[5].var0.__r_.var0)
    return 0;
  v5 = objc_alloc((Class)NSString);
  p_var0 = &a3->var0.__r_.var0;
  if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0)
    p_var0 = *(int **)p_var0;
  v7 = objc_msgSend(v5, "initWithCString:encoding:", p_var0, 4);
  v8 = objc_alloc((Class)CLCircularRegion);
  v9 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&a3[1].var0.var0, *(CLLocationDegrees *)&a3[2].var0.__r_.__value_.var0.var1.__data_);
  return objc_msgSend(v8, "initWithCenter:radius:identifier:", v7, v9.latitude, v9.longitude, *(double *)&a3[2].var0.__r_.__value_.var0.var1.__size_);
}

- (void)fetchLocationOfInterestForFence:(Fence *)a3 handler:
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *__dst[2];
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  id v16;
  void *__p;
  void *v18;

  v4 = v3;
  if (!v3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLFenceAnalyticsManager.mm"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  v7 = (void *)objc_opt_class(self, a2);
  sub_1004E5748((char *)__dst, (__int128 *)a3->var0.__r_.__value_.var0.var0.__data_);
  -[CLFenceAnalyticsManager fetchLocationOfInterestForRegion:handler:](self, "fetchLocationOfInterestForRegion:handler:", objc_msgSend(v7, "regionForFence:", __dst), v4);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }

  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  if (v9 < 0)
    operator delete(__dst[0]);
}

- (void)fetchLocationOfInterestForRegion:(id)a3 handler:(id)a4
{
  uint64_t v7;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  _QWORD v9[6];

  if (!a4)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLFenceAnalyticsManager.mm"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  if (self->_routineMonitor
    && (v7 = objc_opt_class(CLCircularRegion, a2), (objc_opt_isKindOfClass(a3, v7) & 1) != 0))
  {
    routineMonitor = self->_routineMonitor;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1008A3B9C;
    v9[3] = &unk_102159DC0;
    v9[4] = self;
    v9[5] = a4;
    -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestForRegion:withReply:](routineMonitor, "fetchLocationOfInterestForRegion:withReply:", a3, v9);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (BOOL)updateHistoricalFenceStateWithNotificationData:(NotificationData *)a3
{
  id v6;
  _QWORD *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  const char *v21;
  uint8_t *v22;
  _OWORD v23[8];
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  int v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;

  v6 = objc_alloc((Class)NSString);
  v7 = (_QWORD *)((char *)a3 + 24);
  if (*((char *)a3 + 47) < 0)
    v7 = (_QWORD *)*v7;
  v8 = objc_msgSend(v6, "initWithCString:encoding:", v7, 4);
  v9 = *((_DWORD *)a3 + 318);
  v10 = *((unsigned int *)a3 + 163);
  if (v9 == -1)
    v11 = 3;
  else
    v11 = v9;
  v12 = *((_OWORD *)a3 + 57);
  v31 = *((_OWORD *)a3 + 56);
  v32 = v12;
  v33[0] = *((_OWORD *)a3 + 58);
  *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)((char *)a3 + 940);
  v13 = *((_OWORD *)a3 + 53);
  v27 = *((_OWORD *)a3 + 52);
  v28 = v13;
  v14 = *((_OWORD *)a3 + 55);
  v29 = *((_OWORD *)a3 + 54);
  v30 = v14;
  v15 = *((_OWORD *)a3 + 51);
  v25 = *((_OWORD *)a3 + 50);
  v26 = v15;
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102159E08);
  v16 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *((_QWORD *)a3 + 99);
    *(_DWORD *)buf = 138413058;
    v43 = v8;
    v44 = 1024;
    v45 = v11;
    v46 = 1024;
    v47 = v10;
    v48 = 2048;
    v49 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#FenceMetrics update historical fence state %@, previousStatus %d, currentStatus %d, timeOfLocationReceived %f", buf, 0x22u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102159E08);
    v20 = *((_QWORD *)a3 + 99);
    v34 = 138413058;
    v35 = v8;
    v36 = 1024;
    v37 = v11;
    v38 = 1024;
    v39 = v10;
    v40 = 2048;
    v41 = v20;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics update historical fence state %@, previousStatus %d, currentStatus %d, timeOfLocationReceived %f", &v34, 34);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager updateHistoricalFenceStateWithNotificationData:]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
  if (!-[NSMutableDictionary objectForKey:](self->_historicalFenceStates, "objectForKey:", v8))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_historicalFenceStates, "setObject:forKeyedSubscript:", objc_alloc_init(CLFenceAnalyticsHistoricalStates), v8);
  v18 = -[NSMutableDictionary objectForKey:](self->_historicalFenceStates, "objectForKey:", v8);
  v23[6] = v31;
  v23[7] = v32;
  v24[0] = v33[0];
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)((char *)v33 + 12);
  v23[2] = v27;
  v23[3] = v28;
  v23[4] = v29;
  v23[5] = v30;
  v23[0] = v25;
  v23[1] = v26;
  objc_msgSend(v18, "updateCurrentState:previousState:location:locationReceivedTime:", v10, v11, v23, *((double *)a3 + 99));
  return 1;
}

- (void)updateTimeToInitialStateChangeForFence:(CLFenceAnalyticsManager *)self previousStatus:(SEL)a2 timeOfStateChange:(Fence *)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v13;
  id v14;
  int *p_var0;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (v3 == -1)
  {
    v16 = v9;
    v17 = v5;
    v18 = v4;
    v13 = v8 - *(double *)&a3[3].var0.__r_.__value_.var0.var1.__data_;
    v14 = objc_alloc((Class)NSString);
    p_var0 = &a3->var0.__r_.var0;
    if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0)
      p_var0 = *(int **)p_var0;
    _objc_msgSend(-[NSMutableDictionary objectForKey:](self->_historicalFenceStates, "objectForKey:", objc_msgSend(v14, "initWithCString:encoding:", p_var0, 4, v10, v16, v17, v18, v6, v7)), "updateTimeToInitialStateChange:", v13);
  }
}

- (void)fetchLocationSystemStateWithHandler:(id)a3
{
  _QWORD v5[6];

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLFenceAnalyticsManager.mm"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008A400C;
  v5[3] = &unk_102159DE8;
  v5[4] = self;
  v5[5] = a3;
  sub_1001B6EA4(-[CLFenceAnalyticsManager universe](self, "universe"), (uint64_t)v5);
}

- (id)historicalFenceStateForFence:(Fence *)a3
{
  id v5;
  int *p_var0;

  v5 = objc_alloc((Class)NSString);
  p_var0 = &a3->var0.__r_.var0;
  if (a3[1].var0.__r_.__value_.var0.var0.__data_[7] < 0)
    p_var0 = *(int **)p_var0;
  return -[CLFenceAnalyticsManager historicalFenceStateForFenceName:](self, "historicalFenceStateForFenceName:", objc_msgSend(v5, "initWithCString:encoding:", p_var0, 4));
}

- (id)historicalFenceStateForFenceName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[CLFenceAnalyticsManager historicalFenceStates](self, "historicalFenceStates"), "objectForKey:", a3);
}

- (void)onMonitorNotification:(int)a3 data:(NotificationData *)a4
{
  NSObject *v8;
  CLFenceStateChangeAnalytics *stateChangeAnalytics;
  CLFenceStateChangeAnalytics *v10;
  NSObject *v11;
  const char *v12;
  char *v13;
  const char *v14;
  char *v15;
  char v16[1608];
  char v17[1608];
  char v18[1608];
  _DWORD v19[4];
  _DWORD v20[410];

  objc_msgSend(-[CLFenceAnalyticsManager universe](self, "universe", *(_QWORD *)&a3, a4, a5), "silo");
  if (qword_1022A0060 != -1)
    dispatch_once(&qword_1022A0060, &stru_102159E08);
  v8 = qword_1022A0068;
  if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Received FenceMonitor notification, processing metrics for state change", (uint8_t *)v20, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(v20, 0x65CuLL);
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102159E08);
    LOWORD(v19[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, v20, 1628, &_mh_execute_header, qword_1022A0068, 0, "#FenceMetrics Received FenceMonitor notification, processing metrics for state change", v19, 2);
    v13 = (char *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLFenceAnalyticsManager onMonitorNotification:data:]", "%s\n", v12);
    if (v13 != (char *)v20)
      free(v13);
  }
  if (a3 == 11)
  {
    sub_1008A44AC(v18, (__int128 *)a4);
    -[CLFenceAnalyticsManager updateHistoricalFenceStateWithNotificationData:](self, "updateHistoricalFenceStateWithNotificationData:", v18);
    sub_100115F78((uint64_t)v18);
    stateChangeAnalytics = self->_stateChangeAnalytics;
    sub_1008A44AC(v17, (__int128 *)a4);
    -[CLFenceStateChangeAnalytics submitAllMetricsFromNotification:](stateChangeAnalytics, "submitAllMetricsFromNotification:", v17);
    sub_100115F78((uint64_t)v17);
    v10 = self->_stateChangeAnalytics;
    sub_1008A44AC(v16, (__int128 *)a4);
    -[CLFenceStateChangeAnalytics evaluatePossibleFalseExitFromNotification:](v10, "evaluatePossibleFalseExitFromNotification:", v16);
    sub_100115F78((uint64_t)v16);
  }
  else
  {
    if (qword_1022A0060 != -1)
      dispatch_once(&qword_1022A0060, &stru_102159E08);
    v11 = qword_1022A0068;
    if (os_log_type_enabled((os_log_t)qword_1022A0068, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 67109120;
      v20[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#FenceMetrics analytics received invalid notification type, %u", (uint8_t *)v20, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(v20, 0x65CuLL);
      if (qword_1022A0060 != -1)
        dispatch_once(&qword_1022A0060, &stru_102159E08);
      v19[0] = 67109120;
      v19[1] = a3;
      _os_log_send_and_compose_impl(2, 0, v20, 1628, &_mh_execute_header, qword_1022A0068, 16, "#FenceMetrics analytics received invalid notification type, %u", v19);
      v15 = (char *)v14;
      sub_100512490("Generic", 1, 0, 0, "-[CLFenceAnalyticsManager onMonitorNotification:data:]", "%s\n", v14);
      if (v15 != (char *)v20)
        free(v15);
    }
  }
}

- (CLRoutineMonitorServiceProtocol)routineMonitor
{
  return self->_routineMonitor;
}

- (void)setRoutineMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CLFenceStateChangeAnalytics)stateChangeAnalytics
{
  return self->_stateChangeAnalytics;
}

- (void)setStateChangeAnalytics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isSimulatingLocation
{
  return self->_isSimulatingLocation;
}

- (void)setIsSimulatingLocation:(BOOL)a3
{
  self->_isSimulatingLocation = a3;
}

- (NSMutableDictionary)historicalFenceStates
{
  return self->_historicalFenceStates;
}

- (void)setHistoricalFenceStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_fenceMonitorClient.__ptr_.__value_;
  self->_fenceMonitorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  sub_100261F44((uint64_t)&self->_stepCountDb);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end

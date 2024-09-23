@implementation CLContextManagerWaterSubmersionDemo

- (CLContextManagerWaterSubmersionDemo)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  NSObject *v11;
  CLContextManagerWaterSubmersionDemo *v12;
  CLContextManagerWaterSubmersionDemo *v13;
  uint64_t i;
  __CFNotificationCenter *DarwinNotifyCenter;
  float v16;
  char v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  const char *v23;
  uint8_t *v24;
  _QWORD v25[16];
  char v26;
  _QWORD v27[3];
  double v28;
  _QWORD v29[3];
  double v30;
  _QWORD v31[4];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  uint64_t v42;
  double v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  double v49;
  _QWORD v50[4];
  _QWORD v51[4];
  objc_super v52;
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021677E0);
  v11 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demo context manager started", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021677E0);
    LOWORD(v51[0]) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "Demo context manager started", v51, 2);
    v24 = (uint8_t *)v23;
    sub_100512490("Generic", 1, 0, 2, "-[CLContextManagerWaterSubmersionDemo initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v23);
    if (v24 != buf)
      free(v24);
  }
  v52.receiver = self;
  v52.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  v12 = -[CLContextManagerWaterSubmersionBase initWithUniverse:delegate:withBuffer:withSourceAggregator:](&v52, "initWithUniverse:delegate:withBuffer:withSourceAggregator:", a3, a4, a5, a6);
  v13 = v12;
  if (v12)
  {
    -[CLContextManagerWaterSubmersionDemo retrieveCachedSubmersionState](v12, "retrieveCachedSubmersionState");
    v13->_measurementTimer = (CLTimer *)objc_msgSend(objc_msgSend(a3, "silo"), "newTimer");
    -[CLContextManagerWaterSubmersionBase setSubmersionState:](v13, "setSubmersionState:", 100);
    for (i = 0; i != 5; ++i)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)sub_100AA94B8, off_102167758[i], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    *(_QWORD *)buf = 0;
    v54 = buf;
    v55 = 0x2020000000;
    v56 = 0x405954CCCCCCCCCDLL;
    -[CLContextManagerWaterSubmersionDemo updateTargetDemoDepth](v13, "updateTargetDemoDepth");
    LODWORD(v50[0]) = 1036831949;
    sub_1018C2254((unsigned __int8 *)v51, "DemoMetersPerSecond", v50, 0);
    v16 = *((float *)v51 + 1);
    LOBYTE(v50[0]) = 1;
    sub_1018BF25C((unsigned __int8 *)v51, "DemoCycleMinMaxDepth", (unsigned __int8 *)v50, 0);
    v17 = BYTE1(v51[0]);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    *(double *)&v51[3] = v16 * 1020.0 * 9.80665016 / 1000.0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0x40595407FC6B3FB5;
    v46 = 0;
    v47 = (double *)&v46;
    v48 = 0x2020000000;
    v49 = 0.0;
    LODWORD(v40) = 1101004800;
    sub_1018C2254((unsigned __int8 *)v44, "DemoInitialTemperature", &v40, 0);
    v49 = *((float *)v44 + 1);
    v44[0] = 0;
    v44[1] = v44;
    v45 = 0;
    v18 = *((_QWORD *)v47 + 3);
    v44[2] = 0x2020000000;
    v45 = v18;
    v40 = 0;
    v41 = (double *)&v40;
    v42 = 0x2020000000;
    v43 = 0.0;
    LODWORD(v32) = 1094713344;
    sub_1018C2254((unsigned __int8 *)&v36, "DemoFinalTemperature", &v32, 0);
    v43 = *((float *)&v36 + 1);
    v36 = 0;
    v37 = (double *)&v36;
    v38 = 0x2020000000;
    v39 = 0x4014000000000000;
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x2020000000;
    v35 = 0x3FF0000000000000;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0x4014000000000000;
    LODWORD(v27[0]) = 1106247680;
    sub_1018C2254((unsigned __int8 *)v29, "DemoTemperatureSettlingTime", v27, 0);
    v19 = *((float *)v29 + 1);
    v29[0] = 0;
    v29[1] = v29;
    v30 = 0.0;
    v20 = (v47[3] - v41[3]) / v19;
    v29[2] = 0x2020000000;
    v30 = v20;
    v27[0] = 0;
    v27[1] = v27;
    v28 = 0.0;
    v21 = v37[3] - v33[3];
    v27[2] = 0x2020000000;
    v28 = v21 / v19;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100AA970C;
    v25[3] = &unk_102167788;
    v26 = v17;
    v25[4] = v13;
    v25[5] = buf;
    v25[6] = v51;
    v25[7] = v44;
    v25[8] = &v46;
    v25[9] = &v40;
    v25[10] = v29;
    v25[11] = v31;
    v25[12] = &v36;
    v25[13] = &v32;
    v25[14] = v27;
    v25[15] = v50;
    -[CLTimer setHandler:](v13->_measurementTimer, "setHandler:", v25);
    -[CLContextManagerWaterSubmersionDemo startUpdates](v13, "startUpdates");
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(buf, 8);
  }
  return v13;
}

- (float)targetPressure
{
  return self->_targetDemoDepth * 9.80665016 + 101.325;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  v4.receiver = self;
  v4.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  -[CLContextManagerWaterSubmersionBase dealloc](&v4, "dealloc");
}

- (void)updateEvent_bounce:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWaterSubmersion>)a3
{
  CLBarometerCalibrationWaterSubmersion *ptr;
  id v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v13[6];
  std::__shared_weak_count *v14;

  ptr = a3.__ptr_;
  v5 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo", a3.__ptr_, a3.__cntrl_);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768;
  v13[2] = sub_100AA9AA4;
  v13[3] = &unk_1021677B0;
  v7 = *(_QWORD *)ptr;
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v13[4] = self;
  v13[5] = v7;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  objc_msgSend(v5, "async:", v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (void)pauseEvent_bounce
{
  id v3;
  _QWORD v4[5];

  v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AA9BDC;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  objc_msgSend(v3, "async:", v4);
}

- (void)resumeEvent_bounce
{
  id v3;
  _QWORD v4[5];

  v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AA9C54;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  objc_msgSend(v3, "async:", v4);
}

- (void)demoDepthUpdate_bounce
{
  id v3;
  _QWORD v4[5];

  v3 = -[CLIntersiloUniverse silo](self->super.super._universe, "silo");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AA9CCC;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  objc_msgSend(v3, "async:", v4);
}

- (void)retrieveCachedSubmersionState
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLContextManagerWaterSubmersionDemo;
  -[CLContextManagerWaterSubmersionBase retrieveCachedSubmersionState](&v8, "retrieveCachedSubmersionState");
  if (self)
  {
    -[CLContextManagerWaterSubmersionBase aopSubmersionState](self, "aopSubmersionState");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[CLContextManagerWaterSubmersionBase updateSubmersionStateFromAOPState:](self, "updateSubmersionStateFromAOPState:", &v6);
  v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

+ (double)settleToTemperatureFromStart:(double)a3 toStop:(double)a4 withCurrent:(double)a5 withDecrement:(double)a6
{
  double v6;
  double v7;

  if (a3 >= a4)
    v6 = a4;
  else
    v6 = a3;
  if (a3 < a4)
    a3 = a4;
  v7 = a5 - a6;
  if (a3 < v7 || v7 < v6)
    return a4;
  else
    return v7;
}

+ (double)boundedIncrementBetweenStart:(double)a3 andStop:(double)a4 withCurrent:(double)a5 withIncrement:(double *)a6
{
  double v6;
  double v7;
  double v8;
  double result;

  if (a3 >= a4)
    v6 = a4;
  else
    v6 = a3;
  if (a3 >= a4)
    v7 = a3;
  else
    v7 = a4;
  v8 = *a6;
  result = *a6 + a5;
  if (result < v6 || v7 < result)
  {
    *a6 = -v8;
    return a5 - v8;
  }
  return result;
}

+ (double)incrementTowardsTarget:(double)result andCurrent:(double)a4 withIncrement:(double)a5
{
  double v5;

  v5 = fabs(a5);
  if (vabdd_f64(result, a4) > v5)
  {
    if (result - a4 >= 0.0)
      return v5 + a4;
    else
      return a4 - v5;
  }
  return result;
}

- (void)startUpdates
{
  -[CLTimer setNextFireDelay:interval:](self->_measurementTimer, "setNextFireDelay:interval:", 0.01, 1.0);
}

- (void)stopUpdates
{
  -[CLTimer setNextFireDelay:interval:](self->_measurementTimer, "setNextFireDelay:interval:", 1.79769313e308, 1.0);
}

- (void)updateTargetDemoDepth
{
  double v3;
  int v4;
  unsigned __int8 v5[4];
  float v6;

  -[CLSubmersionStateMachine nearDepthLimitThreshold](-[CLContextManagerWaterSubmersionBase submersionStateMachine](self, "submersionStateMachine"), "nearDepthLimitThreshold");
  *(float *)&v3 = v3;
  v4 = LODWORD(v3);
  sub_1018C2254(v5, "DemoMaxDepthMeters", &v4, 0);
  self->_targetDemoDepth = v6;
}

@end

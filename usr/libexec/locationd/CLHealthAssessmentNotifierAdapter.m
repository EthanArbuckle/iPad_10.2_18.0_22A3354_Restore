@implementation CLHealthAssessmentNotifierAdapter

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
  if (qword_1023013E0 != -1)
    dispatch_once(&qword_1023013E0, &stru_10213D9F0);
  return (id)qword_1023013D8;
}

- (CLHealthAssessmentNotifierAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHealthAssessmentNotifierAdapter;
  return -[CLHealthAssessmentNotifierAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLHealthAssessmentNotifierProtocol, &OBJC_PROTOCOL___CLHealthAssessmentNotifierClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  uint64_t v4;
  double Current;
  uint64_t v6;
  double *p_monitorKinesiasStart;
  double monitorKinesiasStart;
  uint64_t v9;
  double *p_monitorKinesiasExpiration;
  double v11;
  NSObject *v12;
  double v13;
  double v14;
  uint64_t v15;
  double lastProcessedTime;
  double v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  double v21;
  double v22;
  const char *v23;
  uint8_t *v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  int v28;
  double v29;
  __int16 v30;
  double v31;
  uint8_t buf[4];
  double v33;
  __int16 v34;
  double v35;

  if (qword_10229FFF0 != -1)
    dispatch_once(&qword_10229FFF0, &stru_10213DB60);
  v3 = off_10229FFF8;
  if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLHealthAssessmentNotifier starting up", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    LOWORD(v28) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "CLHealthAssessmentNotifier starting up", &v28, 2);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_10049C6F0((uint64_t)-[CLHealthAssessmentNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_1018FBA8C();
  v4 = sub_1001FD94C();
  if (sub_100525C4C(v4))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = sub_1001FD94C();
    p_monitorKinesiasStart = &self->_monitorKinesiasStart;
    sub_1001FD9FC(v6, (uint64_t)CFSTR("kMonitorKinesiasStart"), &self->_monitorKinesiasStart);
    monitorKinesiasStart = self->_monitorKinesiasStart;
    if (Current < monitorKinesiasStart)
      monitorKinesiasStart = Current;
    *p_monitorKinesiasStart = monitorKinesiasStart;
    v9 = sub_1001FD94C();
    p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
    sub_1001FD9FC(v9, (uint64_t)CFSTR("kMonitorKinesiasExpiration"), &self->_monitorKinesiasExpiration);
    v11 = *p_monitorKinesiasStart + 604800.0;
    if (v11 >= self->_monitorKinesiasExpiration)
      v11 = *p_monitorKinesiasExpiration;
    *p_monitorKinesiasExpiration = v11;
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v12 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      v13 = *p_monitorKinesiasStart;
      v14 = *p_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      v33 = v13;
      v34 = 2050;
      v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Loaded monitoring period start: %{public}f expiration date: %{public}f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v21 = *p_monitorKinesiasStart;
      v22 = *p_monitorKinesiasExpiration;
      v28 = 134349312;
      v29 = v21;
      v30 = 2050;
      v31 = v22;
      LODWORD(v27) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Loaded monitoring period start: %{public}f expiration date: %{public}f", &v28, v27);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
    v15 = sub_1001FD94C();
    sub_1001FD9FC(v15, (uint64_t)CFSTR("kMonitorKinesiasLastProcessed"), &self->_lastProcessedTime);
    lastProcessedTime = self->_lastProcessedTime;
    if (Current < lastProcessedTime)
      lastProcessedTime = Current;
    self->_lastProcessedTime = lastProcessedTime;
    -[CLHealthAssessmentNotifierAdapter setupService](self, "setupService");
    -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
    if (v17 > Current)
    {
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v18 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Resume sensor recording on service start", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        LOWORD(v28) = 0;
        LODWORD(v27) = 2;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Resume sensor recording on service start", &v28, v27);
        v26 = (uint8_t *)v25;
        sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v25);
        if (v26 != buf)
          free(v26);
      }
      -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
      self->fDyskinesiaSubscribed = 1;
      self->fTremorSubscribed = 1;
    }
  }
}

- (void)endService
{
  CLNotifierBase *v3;

  v3 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v3->var0 + 2))(v3);

}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)setupService
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  CLTimer *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  char *v13;
  _QWORD v14[5];
  double v15;
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  _OWORD buf[102];

  if (!-[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"))
  {
    -[CLHealthAssessmentNotifierAdapter setSensorRecorder:](self, "setSensorRecorder:", objc_alloc_init((Class)CMSensorRecorder));
    sub_10049CC10((uint64_t)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"));
    -[CLHealthAssessmentNotifierAdapter setChoreaDetectionService:](self, "setChoreaDetectionService:", objc_alloc_init(CLHealthAssessmentChoreaDetectionService));
    -[CLHealthAssessmentChoreaDetectionService setDelegate:](-[CLHealthAssessmentNotifierAdapter choreaDetectionService](self, "choreaDetectionService"), "setDelegate:", self);
    -[CLHealthAssessmentNotifierAdapter setTremorDetectionService:](self, "setTremorDetectionService:", objc_alloc_init(CLHealthAssessmentTremorDetectionService));
    -[CLHealthAssessmentTremorDetectionService setDelegate:](-[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService"), "setDelegate:", self);
    -[CLHealthAssessmentNotifierAdapter setFSensorRecorderQueryTimer:](self, "setFSensorRecorderQueryTimer:", objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "newTimer"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10049CE04;
    v16[3] = &unk_10212BB58;
    v16[4] = self;
    -[CLTimer setHandler:](-[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"), "setHandler:", v16);
    v15 = 15.0;
    v3 = sub_100127B9C();
    sub_100081C10(v3, buf);
    sub_1001FD98C(*(uint64_t *)&buf[0], "kMonitorKinesiasProcessingDelay", &v15);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
    if (*((_QWORD *)&buf[0] + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = -[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer");
    -[CLTimer setNextFireDelay:](v7, "setNextFireDelay:", v15);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v8 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      -[CLTimer nextFireTime](-[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"), "nextFireTime");
      LODWORD(buf[0]) = 134349056;
      *(_QWORD *)((char *)buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fSensorRecorderQueryTimer.nextFireTime, %{public}f", (uint8_t *)buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v10 = off_10229FFF8;
      -[CLTimer nextFireTime](-[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"), "nextFireTime");
      v17 = 134349056;
      v18 = v11;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 1, "fSensorRecorderQueryTimer.nextFireTime, %{public}f", &v17, 12);
      v13 = (char *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter setupService]", "%s\n", v12);
      if (v13 != (char *)buf)
        free(v13);
    }
    -[CLHealthAssessmentNotifierAdapter setFAggregateRecordsTimer:](self, "setFAggregateRecordsTimer:", objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "newTimer"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10049CE0C;
    v14[3] = &unk_10212BB58;
    v14[4] = self;
    -[CLTimer setHandler:](-[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"), "setHandler:", v14);
    -[CLHealthAssessmentNotifierAdapter aggregateRecords](self, "aggregateRecords");
  }
}

- (void)teardownService
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_10229FFF0 != -1)
    dispatch_once(&qword_10229FFF0, &stru_10213DB60);
  v3 = off_10229FFF8;
  if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 0, "Tearing down service", v11, 2);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter teardownService]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v4 = sub_1001FD94C();
  sub_1005254E4(v4);
  v5 = sub_1001FD94C();
  sub_1005254E4(v5);
  self->_monitorKinesiasStart = 0.0;
  v6 = sub_1001FD94C();
  sub_1005254E4(v6);
  self->_monitorKinesiasExpiration = 0.0;
  v7 = sub_1001FD94C();
  sub_1005254E4(v7);
  self->_lastProcessedTime = 0.0;
  self->_updateStartTime = 0.0;
  v8 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 944))(v8);
  -[CLHealthAssessmentNotifierAdapter setFSensorRecorderQueryTimer:](self, "setFSensorRecorderQueryTimer:", 0);
  -[CLHealthAssessmentNotifierAdapter setFAggregateRecordsTimer:](self, "setFAggregateRecordsTimer:", 0);
  -[CLHealthAssessmentNotifierAdapter setFSensorRecorderSubscribeTimer:](self, "setFSensorRecorderSubscribeTimer:", 0);

  -[CLHealthAssessmentNotifierAdapter setChoreaDetectionService:](self, "setChoreaDetectionService:", 0);
  -[CLHealthAssessmentNotifierAdapter setTremorDetectionService:](self, "setTremorDetectionService:", 0);

  -[CLHealthAssessmentNotifierAdapter setSensorRecorder:](self, "setSensorRecorder:", 0);
}

- (void)updateSensorRecorderSubscription
{
  double v3;
  double v4;
  double v5;
  NSObject *global_queue;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  _WORD v10[8];
  _QWORD block[5];
  _QWORD v12[5];
  uint8_t buf[1640];

  -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
  if (v4 >= v5)
  {
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v7 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Stop renewing sensorRecorder subscription", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Stop renewing sensorRecorder subscription", v10, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    if (!-[CLHealthAssessmentNotifierAdapter fSensorRecorderSubscribeTimer](self, "fSensorRecorderSubscribeTimer"))
    {
      -[CLHealthAssessmentNotifierAdapter setFSensorRecorderSubscribeTimer:](self, "setFSensorRecorderSubscribeTimer:", objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "newTimer"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10049D2FC;
      v12[3] = &unk_10212BB58;
      v12[4] = self;
      -[CLTimer setHandler:](-[CLHealthAssessmentNotifierAdapter fSensorRecorderSubscribeTimer](self, "fSensorRecorderSubscribeTimer"), "setHandler:", v12);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10049D304;
    block[3] = &unk_10212BB58;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

- (void)updateSensorRecorderQuery
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10049D958;
  v2[3] = &unk_10212BB58;
  v2[4] = self;
  objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "async:", v2);
}

- (void)processDataWithMaxDuration:(double)a3 endTime:(double)a4
{
  double Current;
  double v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  unsigned int v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  char v23;
  double v24;
  int v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  unsigned int v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  unsigned int v40;

  if (a3 > 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= a4)
    {
      v8 = a4;
    }
    else
    {
      v8 = Current;
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v9 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        v34 = v8;
        v35 = 2050;
        v36 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Limiting processing up to timestamp %{public}lf (asked %{public}lf)", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v25 = 134349312;
        v26 = v8;
        v27 = 2050;
        v28 = a4;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Limiting processing up to timestamp %{public}lf (asked %{public}lf)", &v25, 22);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
    v24 = a3;
    v23 = 1;
    v12 = 0;
    if (a3 > 0.0)
    {
      while (v12 <= 0x1D)
      {
        -[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:](self, "processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:", &v24, &v23, v8);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v13 = off_10229FFF8;
        if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349312;
          v34 = v24;
          v35 = 1026;
          LODWORD(v36) = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Remaining duration to process = %{public}lf, current iteration = %{public}i", buf, 0x12u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FFF0 != -1)
            dispatch_once(&qword_10229FFF0, &stru_10213DB60);
          v25 = 134349312;
          v26 = v24;
          v27 = 1026;
          LODWORD(v28) = v12;
          LODWORD(v22) = 18;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Remaining duration to process = %{public}lf, current iteration = %{public}i", &v25, v22);
          v15 = (uint8_t *)v14;
          sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v14);
          if (v15 != buf)
            free(v15);
        }
        ++v12;
        if (v24 <= 0.0 || !v23)
          goto LABEL_33;
      }
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v16 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v34) = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Exceeding maximum number of iterations when processing data = %{public}i - interrupting the processing", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v25 = 67240192;
        LODWORD(v26) = v12;
        LODWORD(v22) = 8;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 0, "Exceeding maximum number of iterations when processing data = %{public}i - interrupting the processing", &v25, v22);
        v21 = (uint8_t *)v20;
        sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v20);
        if (v21 != buf)
          free(v21);
      }
      v23 = 0;
    }
LABEL_33:
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v17 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349824;
      v34 = a3;
      v35 = 2050;
      v36 = v8;
      v37 = 2050;
      v38 = a3 - v24;
      v39 = 1026;
      v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Processed data up to max duration = %{public}lf, endTime = %{public}lf, total duration processed = %{public}lf, number of iterations %{public}i", buf, 0x26u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v25 = 134349824;
      v26 = a3;
      v27 = 2050;
      v28 = v8;
      v29 = 2050;
      v30 = a3 - v24;
      v31 = 1026;
      v32 = v12;
      LODWORD(v22) = 38;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Processed data up to max duration = %{public}lf, endTime = %{public}lf, total duration processed = %{public}lf, number of iterations %{public}i", &v25, v22);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
}

- (void)processNextIntervalWithRemainingDurationToProcess:(double *)a3 endTime:(double)a4 updateCanContinue:(BOOL *)a5
{
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __objc2_class *v24;
  NSObject *v25;
  NSObject *superclass;
  NSObject *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v43;
  float v44;
  double v45;
  float v46;
  double v47;
  float v48;
  CLHealthAssessmentTremorDetectionService *v49;
  double v50;
  double v51;
  double v52;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  CLHealthAssessmentTremorDetectionService *v60;
  double v61;
  double v62;
  double v63;
  CLHealthAssessmentChoreaDetectionService *v64;
  double v65;
  double v66;
  double v67;
  NSObject *v68;
  const char *v69;
  double v70;
  _BYTE *v71;
  double v72;
  NSObject *v73;
  uint64_t v74;
  double v75;
  NSObject *v76;
  double v77;
  double v78;
  char v79;
  NSObject *v80;
  uint64_t v81;
  const char *v82;
  int *v83;
  void *v84;
  double v85;
  uint64_t v86;
  int *v87;
  void *v88;
  double v89;
  const char *v90;
  int *v91;
  const char *v92;
  int *v93;
  const char *v94;
  int *v95;
  const char *v96;
  int *v97;
  void *v98;
  double v99;
  const char *v100;
  uint8_t *v101;
  void *v102;
  uint64_t v103;
  double v104;
  const char *v105;
  uint8_t *v106;
  void *v107;
  uint64_t v108;
  const char *v109;
  uint8_t *v110;
  uint64_t v111;
  double *v112;
  BOOL *v113;
  uint64_t v114;
  id v115;
  CMSensorDataList *v116;
  char v117[64];
  char v118[64];
  double v119;
  double v120;
  int v121;
  _BYTE v122[10];
  _BYTE v123[10];
  uint8_t buf[4];
  _BYTE v125[10];
  _BYTE v126[10];
  int v127;
  double v128;
  __int16 v129;
  double v130;
  __int16 v131;
  uint64_t v132;
  int v133;
  double v134;
  __int16 v135;
  double v136;
  __int16 v137;
  uint64_t v138;

  if ((sub_10008950C(*((_QWORD *)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee") + 20) + 72) & 1) != 0)
  {
    -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
    if (v9 == 0.0)
    {
      -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
      if (v10 > 0.0)
      {
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v11 = off_10229FFF8;
        if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
        {
          -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
          v133 = 134349056;
          v134 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating start time to %{public}f based on last processed time", (uint8_t *)&v133, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&v133, 0x65CuLL);
          if (qword_10229FFF0 != -1)
            dispatch_once(&qword_10229FFF0, &stru_10213DB60);
          v88 = off_10229FFF8;
          -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
          v127 = 134349056;
          v128 = v89;
          _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, v88, 1, "Updating start time to %{public}f based on last processed time", &v127, 12);
          v91 = (int *)v90;
          sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v90);
          if (v91 != &v133)
            free(v91);
        }
        -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
        -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
      }
    }
    if (*a3 <= 0.0 || (-[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime", *a3), v13 > a4))
    {
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v14 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        v15 = *a3;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        v133 = 134349568;
        v134 = v15;
        v135 = 2050;
        v136 = a4;
        v137 = 2050;
        v138 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No processing to do, remainingDurationToProcess=%{public}f, endTime=%{public}f, updateStartTime=%{public}f", (uint8_t *)&v133, 0x20u);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_17;
      bzero(&v133, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v84 = off_10229FFF8;
      v85 = *a3;
      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      v127 = 134349568;
      v128 = v85;
      v129 = 2050;
      v130 = a4;
      v131 = 2050;
      v132 = v86;
      LODWORD(v111) = 32;
      _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, v84, 1, "No processing to do, remainingDurationToProcess=%{public}f, endTime=%{public}f, updateStartTime=%{public}f", &v127, v111);
LABEL_106:
      v87 = (int *)v69;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v69);
      if (v87 != &v133)
        free(v87);
LABEL_17:
      *a5 = 0;
      return;
    }
    v18 = fmin(*a3, 43200.0);
    -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
    v119 = a4;
    v120 = v19;
    +[CLHealthAssessmentUtilities limitStart:andEnd:maxDuration:from:](CLHealthAssessmentUtilities, "limitStart:andEnd:maxDuration:from:", &v120, &v119, 259190.0, CFAbsoluteTimeGetCurrent());
    if (!sub_10049F2F0(-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"), &v120, &v119, v18))
    {
      -[CLHealthAssessmentNotifierAdapter setLastProcessedTime:](self, "setLastProcessedTime:", v119);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v68 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        v133 = 134349056;
        v134 = v119;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "No valid period, marking up to %{public}f as processed", (uint8_t *)&v133, 0xCu);
      }
      if (!sub_1001BFF7C(115, 2))
        goto LABEL_17;
      bzero(&v133, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v127 = 134349056;
      v128 = v119;
      LODWORD(v111) = 12;
      _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, off_10229FFF8, 1, "No valid period, marking up to %{public}f as processed", &v127, v111);
      goto LABEL_106;
    }
    v113 = a5;
    v119 = fmin(v119, a4);
    v20 = objc_alloc((Class)NSDate);
    v21 = objc_msgSend(v20, "initWithTimeIntervalSinceReferenceDate:", v120);
    v22 = objc_alloc((Class)NSDate);
    v23 = objc_msgSend(v22, "initWithTimeIntervalSinceReferenceDate:", v119 + 2.0);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v24 = DefaultObserver;
    v25 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      v133 = 134349312;
      v134 = v120;
      v135 = 2050;
      v136 = v119;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Requesting sensorRecorder data from %{public}f to %{public}f", (uint8_t *)&v133, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&v133, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v127 = 134349312;
      v128 = v120;
      v129 = 2050;
      v130 = v119;
      LODWORD(v111) = 22;
      _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, off_10229FFF8, 1, "Requesting sensorRecorder data from %{public}f to %{public}f", &v127, v111);
      v93 = (int *)v92;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v92);
      if (v93 != &v133)
        free(v93);
      v24 = DefaultObserver;
    }
    v116 = -[CMSensorRecorder accelerometerDataFromDate:toDate:](-[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"), "accelerometerDataFromDate:toDate:", v21, v23);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    superclass = v24[102].superclass;
    if (os_log_type_enabled(superclass, OS_LOG_TYPE_INFO))
    {
      LOWORD(v133) = 0;
      _os_log_impl((void *)&_mh_execute_header, superclass, OS_LOG_TYPE_INFO, "Received accel data", (uint8_t *)&v133, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&v133, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      LOWORD(v127) = 0;
      LODWORD(v111) = 2;
      _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, off_10229FFF8, 1, "Received accel data", &v127, v111);
      v95 = (int *)v94;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v94);
      if (v95 != &v133)
        free(v95);
      v24 = DefaultObserver;
    }
    v115 = -[CMSensorRecorder gyroDataFromDate:toDate:](-[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"), "gyroDataFromDate:toDate:", v21, v23);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v27 = v24[102].superclass;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v133) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Received gyro data", (uint8_t *)&v133, 2u);
    }
    v112 = a3;
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&v133, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      LOWORD(v127) = 0;
      LODWORD(v111) = 2;
      _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, off_10229FFF8, 1, "Received gyro data", &v127, v111);
      v97 = (int *)v96;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v96);
      if (v97 != &v133)
        free(v97);
    }
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v114 = 0;
    v32 = 0;
    while (1)
    {
      if (v30 >= v28)
      {
        v33 = -[CMSensorDataList countByEnumeratingWithState:objects:count:](v116, "countByEnumeratingWithState:objects:count:", v118, &v133, 700);
        if (!v33)
          goto LABEL_73;
        v28 = (unint64_t)v33;
        v30 = 0;
      }
      if (v31 >= v29)
      {
        v34 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", v117, &v127, 700);
        if (!v34)
          goto LABEL_73;
        v29 = (unint64_t)v34;
        v31 = 0;
      }
      v35 = (void *)*((_QWORD *)&v133 + v30);
      v36 = (void *)*((_QWORD *)&v127 + v31);
      objc_msgSend(v35, "startTime");
      v38 = v37;
      objc_msgSend(v36, "startTime");
      v40 = v39;
      if (v38 > v119 && v39 > v119)
        break;
      if (v38 < v39)
      {
        if (v38 <= v119 && v38 > v120)
        {
          objc_msgSend(v35, "acceleration");
          v55 = v54;
          objc_msgSend(v35, "acceleration");
          v57 = v56;
          objc_msgSend(v35, "acceleration");
          v59 = v58;
          v60 = -[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService");
          *(float *)&v61 = v55;
          *(float *)&v62 = v57;
          *(float *)&v63 = v59;
          -[CLHealthAssessmentTremorDetectionService feedAccelSample:time:](v60, "feedAccelSample:time:", v61, v62, v63, v38);
          v64 = -[CLHealthAssessmentNotifierAdapter choreaDetectionService](self, "choreaDetectionService");
          *(float *)&v65 = v55;
          *(float *)&v66 = v57;
          *(float *)&v67 = v59;
          -[CLHealthAssessmentChoreaDetectionService feedAccelSample:time:](v64, "feedAccelSample:time:", v65, v66, v67, v38);
          -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v38);
          ++v114;
        }
        ++v30;
      }
      else
      {
        if (v39 <= v119 && v39 > v120)
        {
          objc_msgSend(v36, "rotationRate");
          v44 = v43;
          objc_msgSend(v36, "rotationRate");
          v46 = v45;
          objc_msgSend(v36, "rotationRate");
          v48 = v47;
          v49 = -[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService");
          *(float *)&v50 = v44;
          *(float *)&v51 = v46;
          *(float *)&v52 = v48;
          -[CLHealthAssessmentTremorDetectionService feedGyroSample:time:](v49, "feedGyroSample:time:", v50, v51, v52, v40);
          -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v40);
          ++v32;
        }
        ++v31;
      }
    }
    -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
LABEL_73:
    if (v114 | v32)
    {
      v71 = v113;
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v76 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        *(_DWORD *)buf = 67240704;
        *(_DWORD *)v125 = v114;
        *(_WORD *)&v125[4] = 1026;
        *(_DWORD *)&v125[6] = v32;
        *(_WORD *)v126 = 2050;
        *(double *)&v126[2] = v77 - v120;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "New records read, accel = %{public}d, gyro = %{public}d, duration processed = %{public}lf", buf, 0x18u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v98 = off_10229FFF8;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        v121 = 67240704;
        *(_DWORD *)v122 = v114;
        *(_WORD *)&v122[4] = 1026;
        *(_DWORD *)&v122[6] = v32;
        *(_WORD *)v123 = 2050;
        *(double *)&v123[2] = v99 - v120;
        LODWORD(v111) = 24;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v98, 1, "New records read, accel = %{public}d, gyro = %{public}d, duration processed = %{public}lf", &v121, v111);
        v101 = (uint8_t *)v100;
        sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v100);
        if (v101 != buf)
          free(v101);
        v71 = v113;
      }
      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      *v112 = *v112 - (v78 - v120);
    }
    else
    {
      v70 = CFAbsoluteTimeGetCurrent() + -600.0;
      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      v71 = v113;
      if (v72 >= v70)
      {
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v80 = off_10229FFF8;
        if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
        {
          -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
          *(_DWORD *)buf = 134349056;
          *(_QWORD *)v125 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "No new records from sensorRecorder, updateStartTime is up to date (%{public}f)", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FFF0 != -1)
            dispatch_once(&qword_10229FFF0, &stru_10213DB60);
          v107 = off_10229FFF8;
          -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
          v121 = 134349056;
          *(_QWORD *)v122 = v108;
          LODWORD(v111) = 12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v107, 1, "No new records from sensorRecorder, updateStartTime is up to date (%{public}f)", &v121, v111);
          v110 = (uint8_t *)v109;
          sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v109);
          if (v110 != buf)
            free(v110);
          v79 = 0;
          v71 = v113;
          goto LABEL_97;
        }
        goto LABEL_96;
      }
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v73 = off_10229FFF8;
      if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
      {
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        v75 = v119;
        if (v70 < v119)
          v75 = v70;
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)v125 = v74;
        *(_WORD *)&v125[8] = 2050;
        *(double *)v126 = v75;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "No new records from sensorRecorder, advancing startUpdateTime from %{public}f to %{public}f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FFF0 != -1)
          dispatch_once(&qword_10229FFF0, &stru_10213DB60);
        v102 = off_10229FFF8;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        v104 = v119;
        if (v70 < v119)
          v104 = v70;
        v121 = 134349312;
        *(_QWORD *)v122 = v103;
        *(_WORD *)&v122[8] = 2050;
        *(double *)v123 = v104;
        LODWORD(v111) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v102, 1, "No new records from sensorRecorder, advancing startUpdateTime from %{public}f to %{public}f", &v121, v111);
        v106 = (uint8_t *)v105;
        sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v105);
        if (v106 != buf)
          free(v106);
        v71 = v113;
      }
      if (v70 < v119)
      {
        -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v70);
LABEL_96:
        v79 = 0;
        goto LABEL_97;
      }
      -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
    }
    v79 = 1;
LABEL_97:
    *v71 = v79;
    return;
  }
  if (qword_10229FFF0 != -1)
    dispatch_once(&qword_10229FFF0, &stru_10213DB60);
  v17 = off_10229FFF8;
  if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v133) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "DB not accessible, cannot process accel, gyro data", (uint8_t *)&v133, 2u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(&v133, 0x65CuLL);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    LOWORD(v127) = 0;
    _os_log_send_and_compose_impl(2, 0, &v133, 1628, &_mh_execute_header, off_10229FFF8, 16, "DB not accessible, cannot process accel, gyro data", &v127, 2);
    v83 = (int *)v82;
    sub_100512490("Generic", 1, 0, 0, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v82);
    if (v83 != &v133)
      free(v83);
  }
  *a5 = 0;
  -[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee");
  sub_10049F284();
}

- (BOOL)anySubscribedToSensorRecorder
{
  return self->fTremorSubscribed || self->fDyskinesiaSubscribed;
}

- (void)addMonitoringPeriodFrom:(double)a3 until:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double *p_monitorKinesiasExpiration;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  double monitorKinesiasStart;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  uint8_t *v20;
  int v21;
  double v22;
  __int16 v23;
  uint64_t v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  uint64_t v28;

  -[CLHealthAssessmentNotifierAdapter monitorKinesiasStart](self, "monitorKinesiasStart");
  if (v7 == 0.0
    || (-[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration"), v8 < a3))
  {
    self->_monitorKinesiasStart = a3;
    v9 = sub_1001FD94C();
    sub_10018A534(v9, CFSTR("kMonitorKinesiasStart"), &self->_monitorKinesiasStart);
    v10 = sub_1001FD94C();
    buf[0] = 1;
    sub_10011B81C(v10, CFSTR("kMonitorKinesiasHasData"), buf);
  }
  p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
  self->_monitorKinesiasExpiration = a4;
  v12 = sub_1001FD94C();
  sub_10018A534(v12, CFSTR("kMonitorKinesiasExpiration"), &self->_monitorKinesiasExpiration);
  v13 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v13 + 944))(v13);
  if (qword_10229FFF0 != -1)
    dispatch_once(&qword_10229FFF0, &stru_10213DB60);
  v14 = off_10229FFF8;
  if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
  {
    monitorKinesiasStart = self->_monitorKinesiasStart;
    v16 = *(_QWORD *)p_monitorKinesiasExpiration;
    *(_DWORD *)buf = 134349312;
    v26 = monitorKinesiasStart;
    v27 = 2050;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Updated monitoring period to %{public}f - %{public}f", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v17 = self->_monitorKinesiasStart;
    v18 = *(_QWORD *)p_monitorKinesiasExpiration;
    v21 = 134349312;
    v22 = v17;
    v23 = 2050;
    v24 = v18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Updated monitoring period to %{public}f - %{public}f", &v21, 22);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter addMonitoringPeriodFrom:until:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
}

- (void)startUpdatesforAnalyzer:(int)a3
{
  unsigned __int8 v5;
  int *v6;

  v5 = -[CLHealthAssessmentNotifierAdapter anySubscribedToSensorRecorder](self, "anySubscribedToSensorRecorder");
  if (!a3)
  {
    v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fTremorSubscribed;
    if ((v5 & 1) != 0)
      goto LABEL_7;
LABEL_6:
    -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
    goto LABEL_7;
  }
  if (a3 != 1)
    return;
  v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fDyskinesiaSubscribed;
  if ((v5 & 1) == 0)
    goto LABEL_6;
LABEL_7:
  self->super.CLIntersiloService_opaque[*v6] = 1;
}

- (void)stopMonitoring
{
  double v3;
  double v4;
  double v5;
  double *p_monitorKinesiasExpiration;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double monitorKinesiasStart;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint8_t *v15;
  int v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  uint64_t v23;

  -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
  if (v5 > v4)
  {
    p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
    self->_monitorKinesiasExpiration = v4;
    v7 = sub_1001FD94C();
    sub_10018A534(v7, CFSTR("kMonitorKinesiasExpiration"), &self->_monitorKinesiasExpiration);
    v8 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 944))(v8);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v9 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      monitorKinesiasStart = self->_monitorKinesiasStart;
      v11 = *(_QWORD *)p_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      v21 = monitorKinesiasStart;
      v22 = 2050;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Stop monitoring, set period to %{public}f - %{public}f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v12 = self->_monitorKinesiasStart;
      v13 = *(_QWORD *)p_monitorKinesiasExpiration;
      v16 = 134349312;
      v17 = v12;
      v18 = 2050;
      v19 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Stop monitoring, set period to %{public}f - %{public}f", &v16, 22);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter stopMonitoring]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    self->fDyskinesiaSubscribed = 0;
    self->fTremorSubscribed = 0;
    -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
  }
}

- (void)syncgetResultReady:(id)a3 ForAnalyzer:(int)a4
{
  sub_1004A0494((uint64_t)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"), a3, a4);
}

- (void)aggregateRecords
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;

  if (sub_1004A0F38((uint64_t)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee")))
  {
    -[CLTimer setNextFireDelay:](-[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"), "setNextFireDelay:", 3600.0);
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v3 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      -[CLTimer nextFireTime](-[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"), "nextFireTime");
      *(_DWORD *)buf = 134349056;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "fAggregateRecordsTimer.nextFireTime, %{public}f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      v5 = off_10229FFF8;
      -[CLTimer nextFireTime](-[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"), "nextFireTime");
      v12 = 134349056;
      v13 = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 1, "fAggregateRecordsTimer.nextFireTime, %{public}f", &v12, 12);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
  else
  {
    if (qword_10229FFF0 != -1)
      dispatch_once(&qword_10229FFF0, &stru_10213DB60);
    v9 = off_10229FFF8;
    if (os_log_type_enabled((os_log_t)off_10229FFF8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Closing down CLHealthAssessmentNotifier, past timeout period for stored data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FFF0 != -1)
        dispatch_once(&qword_10229FFF0, &stru_10213DB60);
      LOWORD(v12) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, off_10229FFF8, 1, "Closing down CLHealthAssessmentNotifier, past timeout period for stored data", &v12, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CLHealthAssessmentNotifierAdapter teardownService](self, "teardownService");
  }
}

- (void)setLastProcessedTime:(double)a3
{
  double *p_lastProcessedTime;
  uint64_t v6;
  uint64_t v7;
  double v8;

  p_lastProcessedTime = &self->_lastProcessedTime;
  if (self->_lastProcessedTime < a3)
  {
    *p_lastProcessedTime = a3;
    v6 = sub_1001FD94C();
    sub_10018A534(v6, CFSTR("kMonitorKinesiasLastProcessed"), p_lastProcessedTime);
    v7 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 944))(v7);
  }
  -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
  if (v8 < a3)
    v8 = a3;
  -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v8);
}

- (CMSensorRecorder)sensorRecorder
{
  return self->_sensorRecorder;
}

- (void)setSensorRecorder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CLTimer)fSensorRecorderSubscribeTimer
{
  return self->_fSensorRecorderSubscribeTimer;
}

- (void)setFSensorRecorderSubscribeTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CLTimer)fSensorRecorderQueryTimer
{
  return self->_fSensorRecorderQueryTimer;
}

- (void)setFSensorRecorderQueryTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CLTimer)fAggregateRecordsTimer
{
  return self->_fAggregateRecordsTimer;
}

- (void)setFAggregateRecordsTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (double)updateStartTime
{
  return self->_updateStartTime;
}

- (void)setUpdateStartTime:(double)a3
{
  self->_updateStartTime = a3;
}

- (double)monitorKinesiasStart
{
  return self->_monitorKinesiasStart;
}

- (void)setMonitorKinesiasStart:(double)a3
{
  self->_monitorKinesiasStart = a3;
}

- (double)monitorKinesiasExpiration
{
  return self->_monitorKinesiasExpiration;
}

- (void)setMonitorKinesiasExpiration:(double)a3
{
  self->_monitorKinesiasExpiration = a3;
}

- (double)lastProcessedTime
{
  return self->_lastProcessedTime;
}

- (CLHealthAssessmentChoreaDetectionService)choreaDetectionService
{
  return self->_choreaDetectionService;
}

- (void)setChoreaDetectionService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CLHealthAssessmentTremorDetectionService)tremorDetectionService
{
  return self->_tremorDetectionService;
}

- (void)setTremorDetectionService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

+ (BOOL)isSupported
{
  if (qword_1023013F0 != -1)
    dispatch_once(&qword_1023013F0, &stru_10213DA20);
  return byte_1023013E8;
}

@end

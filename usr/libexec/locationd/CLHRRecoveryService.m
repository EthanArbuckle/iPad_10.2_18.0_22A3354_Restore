@implementation CLHRRecoveryService

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
  if (qword_1023014E8 != -1)
    dispatch_once(&qword_1023014E8, &stru_10213F208);
  return (id)qword_1023014E0;
}

- (CLHRRecoveryService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHRRecoveryService;
  return -[CLHRRecoveryService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLHRRecoveryServiceProtocol, &OBJC_PROTOCOL___CLHRRecoveryServiceClientProtocol);
}

+ (BOOL)isSupported
{
  if (qword_1023014F8 != -1)
    dispatch_once(&qword_1023014F8, &stru_10213F228);
  return byte_1023014F0;
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

  if (qword_10229FF60 != -1)
    dispatch_once(&qword_10229FF60, &stru_10213F268);
  v3 = qword_10229FF68;
  if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CLHRRecoveryService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v10[0] = 0;
    LODWORD(v9) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 0, "Starting up CLHRRecoveryService", v10, v9);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService beginService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  HIBYTE(v9) = 0;
  sub_1004EBF2C((unsigned __int8 *)&v9 + 7, buf);
  sub_1002B7674((uint64_t)&self->fInputHRDb, (__int128 *)buf);
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
  operator new();
}

- (void)endService
{
  NSObject *v3;
  NSObject *fAggregationTimer;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_10229FF60 != -1)
    dispatch_once(&qword_10229FF60, &stru_10213F268);
  v3 = qword_10229FF68;
  if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CLHRRecoveryService", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 0, "Shutting down CLHRRecoveryService", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService endService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }

  self->fHkHealthStore = 0;
}

- (void)setUpAggregationOnTimer
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  OS_dispatch_source *v8;
  NSObject *fAggregationTimer;
  _QWORD v10[5];
  uint64_t v11;
  std::__shared_weak_count *v12;
  int v13;

  sub_1004E7AF0((void **)self->fInputHRAggregator.__ptr_.__value_, 259200.0);
  sub_1004E7DA4((void **)self->fInputWRAggregator.__ptr_.__value_, 259200.0);
  sub_1004E8058((void **)self->fSessionAggregator.__ptr_.__value_, 15552000.0);
  v13 = 86400;
  v3 = sub_100127B9C();
  sub_100081C10(v3, &v11);
  sub_1001E4B84(v11, "HRRecoveryAggregationTimeInterval", &v13);
  v4 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = 1000000000 * v13;
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo"), "queue"));
  self->fAggregationTimer = v8;
  dispatch_source_set_timer((dispatch_source_t)v8, 0, v7, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004E830C;
  v10[3] = &unk_10212BB58;
  v10[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v10);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCatherineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  float v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[4];
  uint8_t buf[4];
  int v15;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  if (*a3 == 9)
  {
    sub_100924798((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (uint64_t)a4);
  }
  else if (*a3 == 7)
  {
    v7 = *((double *)a4 + 3);
    sub_1009245D4((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, v7);
  }
  else
  {
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v8 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_ERROR))
    {
      v9 = *a3;
      *(_DWORD *)buf = 67109120;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_10213F268);
      v10 = *a3;
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 16, "CLHRRecoveryService: Unhandled notification type, %d", v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLHRRecoveryService onCatherineNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v10;
  int v11;
  int v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (*a3 == 2)
  {
    sub_1009257E8((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (uint64_t)a4);
    if (*((_QWORD *)a4 + 2) == 1
      && sub_100925C98((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, *((_QWORD *)a4 + 14))
      && sub_100925E7C((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, *((_QWORD *)a4 + 28)))
    {
      if (-[CLHRRecoveryService shouldForceWriteSampleToHealthKit](self, "shouldForceWriteSampleToHealthKit"))
        -[CLHRRecoveryService forceWriteSampleToHealthKit:](self, "forceWriteSampleToHealthKit:", a4);
    }
  }
  else
  {
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v10 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_ERROR))
    {
      v11 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_10213F268);
      v12 = *a3;
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 16, "CLHRRecoveryService: Unhandled notification type, %d", v15);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLHRRecoveryService onMotionStateMediatorNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[4];
  uint8_t buf[4];
  int v15;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  v7 = *a3;
  if (*a3 == 9)
  {
    sub_100925570((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, *((_DWORD *)a4 + 26), *((_DWORD *)a4 + 22), *((double *)a4 + 2), *((float *)a4 + 39), *((double *)a4 + 12), *((double *)a4 + 4));
  }
  else if (v7 == 6)
  {
    -[CLHRRecoveryService logVO2MaxStats:](self, "logVO2MaxStats:", a4);
  }
  else if (v7 == 2)
  {
    sub_10092433C((uint64_t)self->fHRRecoveryEstimator.__ptr_.__value_, (__int128 *)a4);
    -[CLHRRecoveryService logBodyMetrics:](self, "logBodyMetrics:", a4);
  }
  else
  {
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v8 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_ERROR))
    {
      v9 = *a3;
      *(_DWORD *)buf = 67109120;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLHRRecoveryService: Unhandled notification type, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_10213F268);
      v10 = *a3;
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 16, "CLHRRecoveryService: Unhandled notification type, %d", v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLHRRecoveryService onNatalimetryNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)onHRRecoverySessionStart
{
  objc_msgSend(*((id *)self->fCatherineClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fCatherineClient.__ptr_.__value_ + 1), 9, 0);
  objc_msgSend(*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fNatalimetryClient.__ptr_.__value_ + 1), 9, 0);
}

- (void)onHRRecoverySessionEnd
{
  objc_msgSend(*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fNatalimetryClient.__ptr_.__value_ + 1), 9);
  self->fSessionStats.biologicalSex = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)&self->fSessionStats.age = _D0;
  self->fSessionStats.betaBlockerUse = 0;
  self->fSessionStats.status = 0;
  *(int64x2_t *)&self->fSessionStats.diffTimeRecoveryOnsetWorkout = vdupq_n_s64(0xC7EFFFFFE0000000);
  *(_QWORD *)&self->fSessionStats.hrRecovery = -1;
  __asm { FMOV            V2.4S, #-1.0 }
  *(_OWORD *)&self->fSessionStats.peakHR = xmmword_101BB39E0;
  *(_OWORD *)&self->fSessionStats.recoveryLoad = _Q2;
  *(_QWORD *)&self->fSessionStats.recoveryMetsStdDev = _D0;
  self->fSessionStats.isOtherwiseEligibleForLongitudinal = 0;
  *(_OWORD *)&self->fSessionStats.hrRecoveryReference = _Q2;
  self->fSessionStats.isEligibleForHK = 0;
  *(_OWORD *)&self->fSessionStats.minHRAfterWorkoutEnd = _Q2;
  *(_QWORD *)&self->fSessionStats.hrmax = _D0;
  *(_QWORD *)&self->fSessionStats.estimationStatus = -13;
  *(_QWORD *)&self->fSessionStats.lambda = _D0;
  *(_QWORD *)&self->fSessionStats.explainedVarianceScore = 3212836864;
  self->fSessionStats.workoutType = 0;
  *(_QWORD *)&self->fSessionStats.sessionDuration = 0x1BF800000;
}

- (void)onHRRecoveryEstimate:(HRRecoveryResult *)a3
{
  -[CLHRRecoveryService logSessionStats:](self, "logSessionStats:");
  if ((a3->var0 == 1 || a3->var34) && a3->var27)
    -[CLHRRecoveryService storeHRRecoveryToHealthKit:](self, "storeHRRecoveryToHealthKit:", a3);
}

- (void)onHRRecoveryUnregisterHRNotification
{
  objc_msgSend(*((id *)self->fCatherineClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->fCatherineClient.__ptr_.__value_ + 1), 9);
}

- (void)onHRRecoveryRegisterHRNotification
{
  objc_msgSend(*((id *)self->fCatherineClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->fCatherineClient.__ptr_.__value_ + 1), 9, 0);
}

- (void)storeHRRecoveryToHealthKit:(const HRRecoveryResult *)a3
{
  id v5;
  NSDate *v6;
  HKQuantity *v7;
  id v8;
  _UNKNOWN **v9;
  void *v10;
  HKQuantitySample *v11;
  HKHealthStore *fHkHealthStore;
  HKQuantitySample *v13;

  if (objc_opt_class(HKQuantity, a2))
  {
    v5 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierHeartRateRecoveryOneMinute);
    v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->var1);
    v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("count/min")), a3->var2);
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_10221B0A8, HKMetadataKeyAlgorithmVersion);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_10221B0C0, HKMetadataKeyHeartRateRecoveryTestType);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CLHRRecoveryService mapWorkoutTypeToHKWorkoutActivityType:](self, "mapWorkoutTypeToHKWorkoutActivityType:", a3->var4)), HKMetadataKeyHeartRateRecoveryActivityType);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit secondUnit](HKUnit, "secondUnit"), a3->var3), HKMetadataKeyHeartRateRecoveryActivityDuration);
    if (a3->var17 > 0.0)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("count/min")), a3->var17), HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate);
    if (a3->var21)
      v9 = &off_10221B0D8;
    else
      v9 = &off_10221B0C0;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, HKMetadataKeyUserMotionContext);
    if (a3->var5)
      v10 = &__kCFBooleanTrue;
    else
      v10 = &__kCFBooleanFalse;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, _HKPrivateMetadataKeyUserOnBetaBlocker);
    if (a3->var0 == 1 && a3->var22 > 0.0)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("count/min")), a3->var22), HKMetadataKeySessionEstimate);
    v11 = +[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:metadata:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v5, v7, v6, v6, v8);
    fHkHealthStore = self->fHkHealthStore;
    v13 = v11;
    -[HKHealthStore saveObjects:withCompletion:](fHkHealthStore, "saveObjects:withCompletion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1), &stru_10213F248);

  }
}

- (unint64_t)mapWorkoutTypeToHKWorkoutActivityType:(int64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 <= 14)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
        return 37;
      return 3000;
    }
  }
  else if (a3 != 15)
  {
    if (a3 == 24)
      return result;
    if (a3 == 17)
      return 37;
    return 3000;
  }
  return 52;
}

- (BOOL)shouldForceWriteSampleToHealthKit
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
  sub_1001E4874(v7, "ForceWriteHRRToHealthKit", &v9);
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

- (void)forceWriteSampleToHealthKit:(const WorkoutEvent *)a3
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  CLHRRecoveryEstimator *value;
  CFAbsoluteTime Current;
  uint64_t v15;
  uint64_t v16;
  double v17;
  int64_t workoutType;
  int v19;
  NSObject *v25;
  const char *v26;
  char *v27;
  int v28;
  CFAbsoluteTime v29;
  uint64_t v30;
  double v31;
  int64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int16 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  CFAbsoluteTime v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int64_t v60;
  __int16 v61;
  double v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  int v66;
  _BYTE buf[22];
  __int16 v68;
  int64_t v69;
  __int16 v70;
  double v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  int v75;

  v54 = 0x4039000000000000;
  v5 = sub_100127B9C();
  sub_100081C10(v5, buf);
  sub_1001FD98C(*(uint64_t *)buf, "FakeHRRValue", &v54);
  v6 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v7 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v53 = 0x4057C00000000000;
  v9 = sub_100127B9C();
  sub_100081C10(v9, buf);
  sub_1001FD98C(*(uint64_t *)buf, "FakeHRRMaxObservedRecoveryHR", &v53);
  v10 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  value = self->fHRRecoveryEstimator.__ptr_.__value_;
  v28 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v29 = Current;
  v16 = v53;
  v15 = v54;
  v17 = a3->endTime - a3->startTime;
  v30 = v54;
  v31 = v17;
  workoutType = a3->workoutSettings.workoutType;
  v32 = workoutType;
  v19 = *((unsigned __int8 *)value + 144);
  v33 = v19;
  v34 = 0u;
  v35 = 0u;
  v36 = 0;
  __asm { FMOV            V1.2D, #-1.0 }
  v37 = _Q1;
  v38 = 0u;
  v39 = 0u;
  v40 = v53;
  v52 = 0;
  v42 = 0;
  v43 = 0;
  v41 = 0;
  v44 = 0;
  v45 = 0u;
  v46 = 0u;
  v47 = 0;
  v51 = 0;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  if (qword_10229FF60 != -1)
    dispatch_once(&qword_10229FF60, &stru_10213F268);
  v25 = qword_10229FF68;
  if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134284801;
    *(CFAbsoluteTime *)&buf[4] = Current;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v15;
    v68 = 2050;
    v69 = workoutType;
    v70 = 2050;
    v71 = v17;
    v72 = 2049;
    v73 = v16;
    v74 = 1025;
    v75 = v19;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Forcing a fake HR Recovery sample to HealthKit: timeOfEstimate, %{private}f, hrRecovery, %{private}f, workoutType, %{public}ld, activityDuration, %{public}f, maxRecoveryHR, %{private}f, betaBlockerUse, %{private}d", buf, 0x3Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v55 = 134284801;
    v56 = Current;
    v57 = 2049;
    v58 = v15;
    v59 = 2050;
    v60 = workoutType;
    v61 = 2050;
    v62 = v17;
    v63 = 2049;
    v64 = v16;
    v65 = 1025;
    v66 = v19;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 0, "Forcing a fake HR Recovery sample to HealthKit: timeOfEstimate, %{private}f, hrRecovery, %{private}f, workoutType, %{public}ld, activityDuration, %{public}f, maxRecoveryHR, %{private}f, betaBlockerUse, %{private}d", &v55, 58);
    v27 = (char *)v26;
    sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService forceWriteSampleToHealthKit:]", "%s\n", v26);
    if (v27 != buf)
      free(v27);
  }
  -[CLHRRecoveryService storeHRRecoveryToHealthKit:](self, "storeHRRecoveryToHealthKit:", &v28);
}

- (void)logBodyMetrics:(const CLBodyMetrics *)a3
{
  float weightKG;
  float heightM;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  self->fSessionStats.age = a3->age;
  self->fSessionStats.biologicalSex = a3->biologicalSex;
  self->fSessionStats.betaBlockerUse = a3->betaBlockerUse;
  weightKG = a3->weightKG;
  if (weightKG != 0.0)
  {
    heightM = a3->heightM;
    if (heightM != 0.0)
      self->fSessionStats.userBMI = weightKG / (float)(heightM * heightM);
  }
  self->fSessionStats.hrmax = a3->hrmax;
}

- (void)logVO2MaxStats:(const VO2MaxResult *)a3
{
  int v5;
  int var12;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  v5 = llround(a3->var2);
  var12 = a3->var12;
  self->fSessionStats.estimationStatus = a3->var11;
  self->fSessionStats.vo2MaxValue = v5;
  self->fSessionStats.sessionType = var12;
}

- (void)logSessionStats:(const HRRecoveryResult *)a3
{
  CLHRRecoveryStats *p_fSessionStats;
  float var3;
  double var6;
  float var14;
  double var29;
  double var15;
  float v11;
  float var20;
  float var24;
  float64x2_t v14;
  NSObject *v15;
  double age;
  int biologicalSex;
  _BOOL4 betaBlockerUse;
  double userBMI;
  double sevenDayRestingHR;
  double hrmax;
  int status;
  double diffTimeRecoveryOnsetWorkout;
  double diffTimeTDropWorkoutEnd;
  int hrRecovery;
  int hrRecoverySession;
  double peakHR;
  double steadyStateHR;
  double hrMinAdjusted;
  double observedHRRecovery;
  double recoveryLoad;
  double maxRecoveryHR;
  double minRecoveryHR;
  double recoveryMetsMean;
  double recoveryMetsStdDev;
  double biasAdjustment;
  _BOOL4 isOtherwiseEligibleForLongitudinal;
  double hrRecoveryReference;
  double hrRecoveryReferencePeak;
  double hrOneMinPostRecovery;
  double hrOneMinExponential;
  _BOOL4 isEligibleForHK;
  double minHRAfterWorkoutEnd;
  double maxHRAfterWorkoutEnd;
  double oneMinusFHRAfterWorkoutEnd;
  double peakHrOneMinusFhr;
  int vo2MaxValue;
  int estimationStatus;
  double lambda;
  double meanSquaredError;
  double explainedVarianceScore;
  int sessionType;
  int64_t workoutType;
  double sessionDuration;
  unsigned int hrRecoveryAlgorithmVersion;
  double v56;
  int v57;
  _BOOL4 v58;
  double v59;
  double v60;
  double v61;
  int v62;
  double v63;
  double v64;
  int v65;
  int v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  _BOOL4 v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _BOOL4 v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int v87;
  int v88;
  double v89;
  double v90;
  double v91;
  int v92;
  int64_t v93;
  double v94;
  unsigned int v95;
  const char *v96;
  uint8_t *v97;
  int v98;
  double v99;
  __int16 v100;
  int v101;
  __int16 v102;
  _BOOL4 v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  int v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  int v117;
  __int16 v118;
  int v119;
  __int16 v120;
  double v121;
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  double v127;
  __int16 v128;
  double v129;
  __int16 v130;
  double v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  double v137;
  __int16 v138;
  double v139;
  __int16 v140;
  _BOOL4 v141;
  __int16 v142;
  double v143;
  __int16 v144;
  double v145;
  __int16 v146;
  double v147;
  __int16 v148;
  double v149;
  __int16 v150;
  _BOOL4 v151;
  __int16 v152;
  double v153;
  __int16 v154;
  double v155;
  __int16 v156;
  double v157;
  __int16 v158;
  double v159;
  __int16 v160;
  int v161;
  __int16 v162;
  int v163;
  __int16 v164;
  double v165;
  __int16 v166;
  double v167;
  __int16 v168;
  double v169;
  __int16 v170;
  int v171;
  __int16 v172;
  int v173;
  __int16 v174;
  double v175;
  __int16 v176;
  unsigned int v177;
  uint8_t buf[4];
  double v179;
  __int16 v180;
  int v181;
  __int16 v182;
  _BOOL4 v183;
  __int16 v184;
  double v185;
  __int16 v186;
  double v187;
  __int16 v188;
  double v189;
  __int16 v190;
  int v191;
  __int16 v192;
  double v193;
  __int16 v194;
  double v195;
  __int16 v196;
  int v197;
  __int16 v198;
  int v199;
  __int16 v200;
  double v201;
  __int16 v202;
  double v203;
  __int16 v204;
  double v205;
  __int16 v206;
  double v207;
  __int16 v208;
  double v209;
  __int16 v210;
  double v211;
  __int16 v212;
  double v213;
  __int16 v214;
  double v215;
  __int16 v216;
  double v217;
  __int16 v218;
  double v219;
  __int16 v220;
  _BOOL4 v221;
  __int16 v222;
  double v223;
  __int16 v224;
  double v225;
  __int16 v226;
  double v227;
  __int16 v228;
  double v229;
  __int16 v230;
  _BOOL4 v231;
  __int16 v232;
  double v233;
  __int16 v234;
  double v235;
  __int16 v236;
  double v237;
  __int16 v238;
  double v239;
  __int16 v240;
  int v241;
  __int16 v242;
  int v243;
  __int16 v244;
  double v245;
  __int16 v246;
  double v247;
  __int16 v248;
  double v249;
  __int16 v250;
  int v251;
  __int16 v252;
  int v253;
  __int16 v254;
  double v255;
  __int16 v256;
  unsigned int v257;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  p_fSessionStats = &self->fSessionStats;
  self->fSessionStats.status = a3->var0;
  var3 = a3->var3;
  self->fSessionStats.sessionDuration = var3;
  self->fSessionStats.workoutType = a3->var4;
  var6 = a3->var6;
  self->fSessionStats.diffTimeRecoveryOnsetWorkout = a3->var7 - var6;
  self->fSessionStats.diffTimeTDropWorkoutEnd = a3->var13 - var6;
  self->fSessionStats.hrRecovery = llround(a3->var2);
  self->fSessionStats.hrRecoverySession = llround(a3->var22);
  *(float32x2_t *)&self->fSessionStats.peakHR = vcvt_f32_f64(*(float64x2_t *)&a3->var8);
  var14 = a3->var14;
  self->fSessionStats.hrMinAdjusted = var14;
  var29 = a3->var29;
  var15 = a3->var15;
  v11 = var29 - var15;
  self->fSessionStats.observedHRRecovery = v11;
  *(float32x4_t *)&self->fSessionStats.recoveryLoad = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var16), *(float64x2_t *)&a3->var18);
  var20 = a3->var20;
  self->fSessionStats.recoveryMetsStdDev = var20;
  var24 = a3->var24;
  self->fSessionStats.biasAdjustment = var24;
  self->fSessionStats.isOtherwiseEligibleForLongitudinal = a3->var34;
  *(float *)&var15 = var15;
  *(float *)&var29 = var29;
  self->fSessionStats.hrRecoveryReference = *(float *)&var15;
  self->fSessionStats.hrRecoveryReferencePeak = *(float *)&var29;
  *(float *)&var29 = a3->var28;
  self->fSessionStats.hrOneMinPostRecovery = *(float *)&var29;
  *(float *)&var29 = a3->var30;
  self->fSessionStats.hrOneMinExponential = *(float *)&var29;
  self->fSessionStats.isEligibleForHK = a3->var27;
  v14.f64[0] = a3->var33;
  v14.f64[1] = a3->var35;
  *(float32x4_t *)&self->fSessionStats.minHRAfterWorkoutEnd = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var31), v14);
  *(float *)&var29 = a3->var23;
  self->fSessionStats.peakHrOneMinusFhr = *(float *)&var29;
  *(float32x2_t *)&self->fSessionStats.lambda = vcvt_f32_f64(*(float64x2_t *)&a3->var10);
  *(float *)&var29 = a3->var12;
  self->fSessionStats.explainedVarianceScore = *(float *)&var29;
  if (qword_10229FF60 != -1)
    dispatch_once(&qword_10229FF60, &stru_10213F268);
  v15 = qword_10229FF68;
  if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_DEBUG))
  {
    age = self->fSessionStats.age;
    biologicalSex = p_fSessionStats->biologicalSex;
    betaBlockerUse = self->fSessionStats.betaBlockerUse;
    userBMI = self->fSessionStats.userBMI;
    sevenDayRestingHR = self->fSessionStats.sevenDayRestingHR;
    hrmax = self->fSessionStats.hrmax;
    status = self->fSessionStats.status;
    diffTimeRecoveryOnsetWorkout = self->fSessionStats.diffTimeRecoveryOnsetWorkout;
    diffTimeTDropWorkoutEnd = self->fSessionStats.diffTimeTDropWorkoutEnd;
    hrRecovery = self->fSessionStats.hrRecovery;
    hrRecoverySession = self->fSessionStats.hrRecoverySession;
    peakHR = self->fSessionStats.peakHR;
    steadyStateHR = self->fSessionStats.steadyStateHR;
    hrMinAdjusted = self->fSessionStats.hrMinAdjusted;
    observedHRRecovery = self->fSessionStats.observedHRRecovery;
    recoveryLoad = self->fSessionStats.recoveryLoad;
    maxRecoveryHR = self->fSessionStats.maxRecoveryHR;
    minRecoveryHR = self->fSessionStats.minRecoveryHR;
    recoveryMetsMean = self->fSessionStats.recoveryMetsMean;
    recoveryMetsStdDev = self->fSessionStats.recoveryMetsStdDev;
    biasAdjustment = self->fSessionStats.biasAdjustment;
    isOtherwiseEligibleForLongitudinal = self->fSessionStats.isOtherwiseEligibleForLongitudinal;
    hrRecoveryReference = self->fSessionStats.hrRecoveryReference;
    hrRecoveryReferencePeak = self->fSessionStats.hrRecoveryReferencePeak;
    hrOneMinPostRecovery = self->fSessionStats.hrOneMinPostRecovery;
    hrOneMinExponential = self->fSessionStats.hrOneMinExponential;
    isEligibleForHK = self->fSessionStats.isEligibleForHK;
    minHRAfterWorkoutEnd = self->fSessionStats.minHRAfterWorkoutEnd;
    maxHRAfterWorkoutEnd = self->fSessionStats.maxHRAfterWorkoutEnd;
    oneMinusFHRAfterWorkoutEnd = self->fSessionStats.oneMinusFHRAfterWorkoutEnd;
    peakHrOneMinusFhr = self->fSessionStats.peakHrOneMinusFhr;
    estimationStatus = self->fSessionStats.estimationStatus;
    vo2MaxValue = self->fSessionStats.vo2MaxValue;
    lambda = self->fSessionStats.lambda;
    meanSquaredError = self->fSessionStats.meanSquaredError;
    explainedVarianceScore = self->fSessionStats.explainedVarianceScore;
    sessionType = self->fSessionStats.sessionType;
    workoutType = self->fSessionStats.workoutType;
    sessionDuration = self->fSessionStats.sessionDuration;
    hrRecoveryAlgorithmVersion = self->fSessionStats.hrRecoveryAlgorithmVersion;
    *(_DWORD *)buf = 134227968;
    v179 = age;
    v180 = 1024;
    v181 = biologicalSex;
    v182 = 1024;
    v183 = betaBlockerUse;
    v184 = 2048;
    v185 = userBMI;
    v186 = 2048;
    v187 = sevenDayRestingHR;
    v188 = 2048;
    v189 = hrmax;
    v190 = 1024;
    v191 = status;
    v192 = 2048;
    v193 = diffTimeRecoveryOnsetWorkout;
    v194 = 2048;
    v195 = diffTimeTDropWorkoutEnd;
    v196 = 1024;
    v197 = hrRecovery;
    v198 = 1024;
    v199 = hrRecoverySession;
    v200 = 2048;
    v201 = peakHR;
    v202 = 2048;
    v203 = steadyStateHR;
    v204 = 2048;
    v205 = hrMinAdjusted;
    v206 = 2048;
    v207 = observedHRRecovery;
    v208 = 2048;
    v209 = recoveryLoad;
    v210 = 2048;
    v211 = maxRecoveryHR;
    v212 = 2048;
    v213 = minRecoveryHR;
    v214 = 2048;
    v215 = recoveryMetsMean;
    v216 = 2048;
    v217 = recoveryMetsStdDev;
    v218 = 2048;
    v219 = biasAdjustment;
    v220 = 1024;
    v221 = isOtherwiseEligibleForLongitudinal;
    v222 = 2048;
    v223 = hrRecoveryReference;
    v224 = 2048;
    v225 = hrRecoveryReferencePeak;
    v226 = 2048;
    v227 = hrOneMinPostRecovery;
    v228 = 2048;
    v229 = hrOneMinExponential;
    v230 = 1024;
    v231 = isEligibleForHK;
    v232 = 2048;
    v233 = minHRAfterWorkoutEnd;
    v234 = 2048;
    v235 = maxHRAfterWorkoutEnd;
    v236 = 2048;
    v237 = oneMinusFHRAfterWorkoutEnd;
    v238 = 2048;
    v239 = peakHrOneMinusFhr;
    v240 = 1024;
    v241 = estimationStatus;
    v242 = 1024;
    v243 = vo2MaxValue;
    v244 = 2048;
    v245 = lambda;
    v246 = 2048;
    v247 = meanSquaredError;
    v248 = 2048;
    v249 = explainedVarianceScore;
    v250 = 1024;
    v251 = sessionType;
    v252 = 1024;
    v253 = workoutType;
    v254 = 2048;
    v255 = sessionDuration;
    v256 = 1024;
    v257 = hrRecoveryAlgorithmVersion;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "HRRecovery Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,sevenDayRestingHR,%.2f,hrmax,%.2f,status,%d,diffTimeRecoveryOnsetWorkout,%.2f,diffTimeTDropWorkoutEnd,%.2f,hrRecovery,%d,hrRecoverySession,%d,peakHR,%.2f,steadyStateHR,%.2f,hrMinAdjusted,%.2f,observedHRRecovery,%.2f,recoveryLoad,%.2f,maxRecoveryHR,%.2f,minRecoveryHR,%.2f,recoveryMetsMean,%.2f,recoveryMetsStdDev,%.2f,biasAdjustment,%.2f,isOtherwiseEligibleForLongitudinal,%d,hrRecoveryReference,%.2f,hrRecoveryReferencePeak,%.2f,hrOneMinPostRecovery,%.2f,hrOneMinExponential,%.2f,isEligibleForHK,%d,minHRAfterWorkoutEnd,%.2f,maxHRAfterWorkoutEnd,%.2f,oneMinusFHRAfterWorkoutEnd,%.2f,peakHrOneMinusFhr,%.2f,vo2MaxestimationStatus,%d,vo2MaxValue,%d,lambda,%.2f,mse,%.2f,evs,%.2f,sessionType,%d,workoutType,%d,sessionDuration,%.2f,hrRecoveryAlgorithmVersion,%d", buf, 0x162u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v56 = self->fSessionStats.age;
    v57 = p_fSessionStats->biologicalSex;
    v58 = self->fSessionStats.betaBlockerUse;
    v59 = self->fSessionStats.userBMI;
    v60 = self->fSessionStats.sevenDayRestingHR;
    v61 = self->fSessionStats.hrmax;
    v62 = self->fSessionStats.status;
    v64 = self->fSessionStats.diffTimeRecoveryOnsetWorkout;
    v63 = self->fSessionStats.diffTimeTDropWorkoutEnd;
    v65 = self->fSessionStats.hrRecovery;
    v66 = self->fSessionStats.hrRecoverySession;
    v67 = self->fSessionStats.peakHR;
    v68 = self->fSessionStats.steadyStateHR;
    v69 = self->fSessionStats.hrMinAdjusted;
    v70 = self->fSessionStats.observedHRRecovery;
    v71 = self->fSessionStats.recoveryLoad;
    v72 = self->fSessionStats.maxRecoveryHR;
    v73 = self->fSessionStats.minRecoveryHR;
    v74 = self->fSessionStats.recoveryMetsMean;
    v75 = self->fSessionStats.recoveryMetsStdDev;
    v76 = self->fSessionStats.biasAdjustment;
    v77 = self->fSessionStats.isOtherwiseEligibleForLongitudinal;
    v78 = self->fSessionStats.hrRecoveryReference;
    v79 = self->fSessionStats.hrRecoveryReferencePeak;
    v80 = self->fSessionStats.hrOneMinPostRecovery;
    v81 = self->fSessionStats.hrOneMinExponential;
    v82 = self->fSessionStats.isEligibleForHK;
    v83 = self->fSessionStats.minHRAfterWorkoutEnd;
    v84 = self->fSessionStats.maxHRAfterWorkoutEnd;
    v85 = self->fSessionStats.oneMinusFHRAfterWorkoutEnd;
    v86 = self->fSessionStats.peakHrOneMinusFhr;
    v88 = self->fSessionStats.estimationStatus;
    v87 = self->fSessionStats.vo2MaxValue;
    v89 = self->fSessionStats.lambda;
    v90 = self->fSessionStats.meanSquaredError;
    v91 = self->fSessionStats.explainedVarianceScore;
    v92 = self->fSessionStats.sessionType;
    v93 = self->fSessionStats.workoutType;
    v94 = self->fSessionStats.sessionDuration;
    v95 = self->fSessionStats.hrRecoveryAlgorithmVersion;
    v98 = 134227968;
    v99 = v56;
    v100 = 1024;
    v101 = v57;
    v102 = 1024;
    v103 = v58;
    v104 = 2048;
    v105 = v59;
    v106 = 2048;
    v107 = v60;
    v108 = 2048;
    v109 = v61;
    v110 = 1024;
    v111 = v62;
    v112 = 2048;
    v113 = v64;
    v114 = 2048;
    v115 = v63;
    v116 = 1024;
    v117 = v65;
    v118 = 1024;
    v119 = v66;
    v120 = 2048;
    v121 = v67;
    v122 = 2048;
    v123 = v68;
    v124 = 2048;
    v125 = v69;
    v126 = 2048;
    v127 = v70;
    v128 = 2048;
    v129 = v71;
    v130 = 2048;
    v131 = v72;
    v132 = 2048;
    v133 = v73;
    v134 = 2048;
    v135 = v74;
    v136 = 2048;
    v137 = v75;
    v138 = 2048;
    v139 = v76;
    v140 = 1024;
    v141 = v77;
    v142 = 2048;
    v143 = v78;
    v144 = 2048;
    v145 = v79;
    v146 = 2048;
    v147 = v80;
    v148 = 2048;
    v149 = v81;
    v150 = 1024;
    v151 = v82;
    v152 = 2048;
    v153 = v83;
    v154 = 2048;
    v155 = v84;
    v156 = 2048;
    v157 = v85;
    v158 = 2048;
    v159 = v86;
    v160 = 1024;
    v161 = v88;
    v162 = 1024;
    v163 = v87;
    v164 = 2048;
    v165 = v89;
    v166 = 2048;
    v167 = v90;
    v168 = 2048;
    v169 = v91;
    v170 = 1024;
    v171 = v92;
    v172 = 1024;
    v173 = v93;
    v174 = 2048;
    v175 = v94;
    v176 = 1024;
    v177 = v95;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 2, "HRRecovery Analytics,age,%.2f,biologicalSex,%d,useBetaBlocker,%d,userBMI,%.2f,sevenDayRestingHR,%.2f,hrmax,%.2f,status,%d,diffTimeRecoveryOnsetWorkout,%.2f,diffTimeTDropWorkoutEnd,%.2f,hrRecovery,%d,hrRecoverySession,%d,peakHR,%.2f,steadyStateHR,%.2f,hrMinAdjusted,%.2f,observedHRRecovery,%.2f,recoveryLoad,%.2f,maxRecoveryHR,%.2f,minRecoveryHR,%.2f,recoveryMetsMean,%.2f,recoveryMetsStdDev,%.2f,biasAdjustment,%.2f,isOtherwiseEligibleForLongitudinal,%d,hrRecoveryReference,%.2f,hrRecoveryReferencePeak,%.2f,hrOneMinPostRecovery,%.2f,hrOneMinExponential,%.2f,isEligibleForHK,%d,minHRAfterWorkoutEnd,%.2f,maxHRAfterWorkoutEnd,%.2f,oneMinusFHRAfterWorkoutEnd,%.2f,peakHrOneMinusFhr,%.2f,vo2MaxestimationStatus,%d,vo2MaxValue,%d,lambda,%.2f,mse,%.2f,evs,%.2f,sessionType,%d,workoutType,%d,sessionDuration,%.2f,hrRecoveryAlgorithmVersion,%d", COERCE_DOUBLE(&v98), 354);
    v97 = (uint8_t *)v96;
    sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService logSessionStats:]", "%s\n", v96);
    if (v97 != buf)
      free(v97);
  }
  -[CLHRRecoveryService sendAnalytics](self, "sendAnalytics");
}

- (void)sendAnalytics
{
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[5];
  _WORD v13[8];
  uint8_t buf[16];
  __int128 v15;
  int v16;

  objc_msgSend(-[CLHRRecoveryService universe](self, "universe"), "silo");
  if (objc_opt_class(MCProfileConnection, v3)
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v4 = atomic_load((unsigned __int8 *)&qword_102301518);
    if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_102301518))
    {
      LODWORD(v15) = 1153138688;
      *(_OWORD *)buf = xmmword_101BB39F0;
      sub_10041C4B4(&qword_102301500, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102301500, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102301518);
    }
    v5 = atomic_load((unsigned __int8 *)&qword_102301538);
    if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_102301538))
    {
      v16 = 1118961664;
      *(_OWORD *)buf = xmmword_101BB3A04;
      v15 = unk_101BB3A14;
      sub_10041C4B4(&qword_102301520, buf, 9uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102301520, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102301538);
    }
    v6 = atomic_load((unsigned __int8 *)&qword_102301558);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_102301558))
    {
      LODWORD(v15) = 1108056474;
      *(_OWORD *)buf = xmmword_101BB3A28;
      sub_10041C4B4(&qword_102301540, buf, 5uLL);
      __cxa_atexit((void (*)(void *))sub_10041C534, &qword_102301540, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_102301558);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1004EB508;
    v12[3] = &unk_102132010;
    v12[4] = self;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.HRRecoveryEstimate"), v12);
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v7 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Sent Core Analytics event", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_10213F268);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 1, "Sent Core Analytics event", v13, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService sendAnalytics]", "%s\n", v8);
LABEL_23:
      if (v9 != buf)
        free(v9);
    }
  }
  else
  {
    if (qword_10229FF60 != -1)
      dispatch_once(&qword_10229FF60, &stru_10213F268);
    v10 = qword_10229FF68;
    if (os_log_type_enabled((os_log_t)qword_10229FF68, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "HRRecovery, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF60 != -1)
        dispatch_once(&qword_10229FF60, &stru_10213F268);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF68, 2, "HRRecovery, not sending analytics, no IHA permission", v13, 2);
      v9 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLHRRecoveryService sendAnalytics]", "%s\n", v11);
      goto LABEL_23;
    }
  }
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  CLHRRecoveryEstimator *v6;

  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->fCatherineClient.__ptr_.__value_;
  self->fCatherineClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->fHRRecoveryEstimator.__ptr_.__value_;
  self->fHRRecoveryEstimator.__ptr_.__value_ = 0;
  if (v6)
    sub_1004EC22C((uint64_t)&self->fHRRecoveryEstimator, (uint64_t)v6);
  sub_10041D2EC((uint64_t *)&self->fSessionAggregator, 0);
  sub_100261F44((uint64_t)&self->fSessionDb);
  sub_10041D2EC((uint64_t *)&self->fInputWRAggregator, 0);
  sub_100261F44((uint64_t)&self->fInputWRDb);
  sub_10041D2EC((uint64_t *)&self->fInputHRAggregator, 0);
  sub_100261F44((uint64_t)&self->fInputHRDb);
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
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)((char *)self + 100) = _D0;
  *((_BYTE *)self + 108) = 0;
  *((_DWORD *)self + 28) = 0;
  *(int64x2_t *)((char *)self + 120) = vdupq_n_s64(0xC7EFFFFFE0000000);
  *((_QWORD *)self + 17) = -1;
  __asm { FMOV            V2.4S, #-1.0 }
  *((_OWORD *)self + 9) = xmmword_101BB39E0;
  *((_OWORD *)self + 10) = _Q2;
  *((_QWORD *)self + 22) = _D0;
  *((_BYTE *)self + 184) = 0;
  *(_OWORD *)((char *)self + 188) = _Q2;
  *((_BYTE *)self + 204) = 0;
  *((_OWORD *)self + 13) = _Q2;
  *((_QWORD *)self + 28) = _D0;
  *((_QWORD *)self + 29) = -13;
  *((_QWORD *)self + 30) = _D0;
  *((_QWORD *)self + 33) = 0x1BF800000;
  *((_QWORD *)self + 31) = 3212836864;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 36) = 0;
  return self;
}

@end

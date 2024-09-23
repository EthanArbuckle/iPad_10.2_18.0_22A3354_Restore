@implementation CLSubmersionDataCollector

- (void)startUnlocked
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  _WORD v12[8];
  uint8_t buf[1640];

  v3 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierUnderwaterDepth);
  v4 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierWaterTemperature);
  self->_depthCollector = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", self->_healthStore, CFSTR("com.apple.coremotion"), v3);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102192450);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "healthkit resume with completion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v12[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "healthkit resume with completion", v12, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector startUnlocked]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[HKDataCollector resumeWithCompletion:](self->_depthCollector, "resumeWithCompletion:", &stru_102192390);
  self->_tempCollector = (HKDataCollector *)objc_msgSend(objc_alloc((Class)HKDataCollector), "initWithHealthStore:bundleIdentifier:quantityType:", self->_healthStore, CFSTR("com.apple.coremotion"), v4);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102192450);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "healthkit resume temperature with completion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v12[0] = 0;
    LODWORD(v11) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "healthkit resume temperature with completion", v12, v11);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector startUnlocked]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  -[HKDataCollector resumeWithCompletion:](self->_tempCollector, "resumeWithCompletion:", &stru_1021923B0);
}

- (void)startAt:(double)a3
{
  self->_lastSampleTime = a3;
  if (self->_unlockedSinceFirstBoot)
    -[CLSubmersionDataCollector startUnlocked](self, "startUnlocked");
}

- (void)collectWithSubmersionQuantities:(shared_ptr<CLSubmersionQuantities>)a3 shouldLog:(BOOL)a4
{
  int var1;
  CLSubmersionQuantities *var0;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint8_t *v16;
  id v18;
  id v19;
  double v20;
  id v21;
  id v22;
  double *v23;
  CFAbsoluteTime Current;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  const char *v39;
  uint8_t *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  NSDictionary *v48;
  HKDataCollector *depthCollector;
  double v50;
  double *value;
  double v52;
  double v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  HKDataCollector *tempCollector;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  const char *v79;
  uint8_t *v80;
  double v81;
  double v82;
  int v83;
  id v84;
  int v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  NSString *v90;
  void *v91;
  int v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  _BYTE v99[10];
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  _QWORD v107[199];

  var1 = (int)a3.var1;
  var0 = a3.var0;
  if (*(double *)(*(_QWORD *)a3.var0 + 32) <= *(double *)(*(_QWORD *)a3.var0 + 40))
  {
    v18 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)a3.var0 + 32));
    v86 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)var0 + 40));
    v87 = v18;
    v19 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v18, v86);
    if (**(_BYTE **)var0)
    {
      -[CLSubmersionStateMachine sensorErrorThreshold](self->_submersionStateMachine, "sensorErrorThreshold");
      *(float *)&v20 = v20;
      v92 = LODWORD(v20);
      sub_1018C2254(buf, "SensorErrorDepthMeters", &v92, 0);
      *(double *)(*(_QWORD *)var0 + 8) = *(float *)&v101;
    }
    v21 = objc_msgSend(objc_alloc((Class)HKQuantityDatum), "initWithIdentifier:dateInterval:quantity:resumeContext:", +[NSUUID UUID](NSUUID, "UUID"), v19, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit meterUnit](HKUnit, "meterUnit"), *(double *)(*(_QWORD *)var0 + 8)), 0);
    v22 = objc_msgSend(objc_alloc((Class)HKQuantityDatum), "initWithIdentifier:dateInterval:quantity:resumeContext:", +[NSUUID UUID](NSUUID, "UUID"), v19, +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit"), *(double *)(*(_QWORD *)var0 + 16)), 0);
    v23 = *(double **)var0;
    if (*(double *)(*(_QWORD *)var0 + 8) >= 1.0)
    {
      if (var1)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (vabdd_f64(Current, self->_lastDefaultLogDepthTimestamp) >= 7.5)
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102192450);
          v41 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(objc_msgSend(v21, "quantity"), "doubleValueForUnit:", +[HKUnit meterUnit](HKUnit, "meterUnit"));
            v43 = v42;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v45 = v44;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            v46 = **(_BYTE **)var0;
            *(_DWORD *)buf = 134349824;
            v101 = v43;
            v102 = 2050;
            v103 = v45;
            v104 = 2050;
            v105 = v47;
            v106 = 1026;
            LODWORD(v107[0]) = v46;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", buf, 0x26u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102192450);
            v72 = qword_10229FE88;
            objc_msgSend(objc_msgSend(v21, "quantity"), "doubleValueForUnit:", +[HKUnit meterUnit](HKUnit, "meterUnit"));
            v74 = v73;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v76 = v75;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            v77 = **(_BYTE **)var0;
            v92 = 134349824;
            v93 = v74;
            v94 = 2050;
            v95 = v76;
            v96 = 2050;
            v97 = v78;
            v98 = 1026;
            *(_DWORD *)v99 = v77;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v72, 0, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", &v92, 38);
            v80 = (uint8_t *)v79;
            sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v79);
            if (v80 != buf)
              free(v80);
          }
          self->_lastDefaultLogDepthTimestamp = Current;
        }
        else
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102192450);
          v25 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(objc_msgSend(v21, "quantity"), "doubleValueForUnit:", +[HKUnit meterUnit](HKUnit, "meterUnit"));
            v27 = v26;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v29 = v28;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            v30 = **(_BYTE **)var0;
            *(_DWORD *)buf = 134349824;
            v101 = v27;
            v102 = 2050;
            v103 = v29;
            v104 = 2050;
            v105 = v31;
            v106 = 1026;
            LODWORD(v107[0]) = v30;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", buf, 0x26u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102192450);
            v32 = qword_10229FE88;
            objc_msgSend(objc_msgSend(v21, "quantity"), "doubleValueForUnit:", +[HKUnit meterUnit](HKUnit, "meterUnit"));
            v34 = v33;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v36 = v35;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            v37 = **(_BYTE **)var0;
            v92 = 134349824;
            v93 = v34;
            v94 = 2050;
            v95 = v36;
            v96 = 2050;
            v97 = v38;
            v98 = 1026;
            *(_DWORD *)v99 = v37;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v32, 1, "inserting into healthkit,depth,%{public}f,sampleTime,%{public}f,startTime,%{public}f,atSensorLimit,%{public}d", &v92, 38);
            v40 = (uint8_t *)v39;
            sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v39);
            if (v40 != buf)
              free(v40);
          }
        }
      }
      if (**(_BYTE **)var0)
      {
        v90 = HKMetadataKeyQuantityClampedToUpperBound;
        v91 = &__kCFBooleanTrue;
        v48 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
      }
      else
      {
        v48 = 0;
      }
      depthCollector = self->_depthCollector;
      v89 = v21;
      -[HKDataCollector insertDatums:device:metadata:completion:](depthCollector, "insertDatums:device:metadata:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1), +[HKDevice localDevice](HKDevice, "localDevice"), v48, &stru_1021923D0);
      v23 = *(double **)var0;
      v50 = *(double *)(*(_QWORD *)var0 + 8);
      if (v50 > self->_maxDepthWritten)
        self->_maxDepthWritten = v50;
    }
    if (v23[3] <= self->_waterTempUncertaintyCap)
    {
      value = (double *)self->_temperatureDecimator.__ptr_.__value_;
      v52 = v23[4];
      v53 = v23[2];
      if (vabdd_f64(v53, value[2]) >= *value || vabdd_f64(v52, value[3]) >= value[1])
      {
        value[2] = v53;
        value[3] = v52;
        if (var1)
        {
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102192450);
          v54 = qword_10229FE88;
          if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(objc_msgSend(v22, "quantity"), "doubleValueForUnit:", +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit"));
            v56 = v55;
            v57 = v21;
            v58 = *(_QWORD *)(*(_QWORD *)var0 + 24);
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v60 = v59;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            *(_DWORD *)buf = 134349824;
            v101 = v56;
            v102 = 2050;
            v103 = v58;
            v21 = v57;
            v104 = 2050;
            v105 = v60;
            v106 = 2050;
            v107[0] = v61;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "inserting into healthkit,temperature,%{public}f,uncertainty,%{public}f,sampleTime,%{public}f,endTime,%{public}f", buf, 0x2Au);
          }
          if (sub_1001BFF7C(115, 2))
          {
            v84 = v21;
            bzero(buf, 0x65CuLL);
            if (qword_10229FE80 != -1)
              dispatch_once(&qword_10229FE80, &stru_102192450);
            v63 = qword_10229FE88;
            objc_msgSend(objc_msgSend(v22, "quantity"), "doubleValueForUnit:", +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit"));
            v65 = v64;
            v66 = *(_QWORD *)(*(_QWORD *)var0 + 24);
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "endDate"), "timeIntervalSinceReferenceDate");
            v68 = v67;
            objc_msgSend(objc_msgSend(objc_msgSend(v22, "dateInterval"), "startDate"), "timeIntervalSinceReferenceDate");
            v92 = 134349824;
            v93 = v65;
            v94 = 2050;
            v95 = v66;
            v96 = 2050;
            v97 = v68;
            v98 = 2050;
            *(_QWORD *)v99 = v69;
            LODWORD(v81) = 42;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v63, 0, "inserting into healthkit,temperature,%{public}f,uncertainty,%{public}f,sampleTime,%{public}f,endTime,%{public}f", &v92, *(_QWORD *)&v81);
            v71 = (uint8_t *)v70;
            sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v70);
            if (v71 != buf)
              free(v71);
            v21 = v84;
          }
        }
        tempCollector = self->_tempCollector;
        v88 = v22;
        -[HKDataCollector insertDatums:device:metadata:completion:](tempCollector, "insertDatums:device:metadata:completion:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1), +[HKDevice localDevice](HKDevice, "localDevice"), 0, &stru_1021923F0);
      }
    }

  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v6 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)var0 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)var0 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)var0 + 8);
      v10 = **(_BYTE **)var0;
      *(_DWORD *)buf = 134219008;
      v101 = v7;
      v102 = 2048;
      v103 = v8;
      v104 = 2048;
      v105 = v9;
      v106 = 1024;
      LODWORD(v107[0]) = v10;
      WORD2(v107[0]) = 1024;
      *(_DWORD *)((char *)v107 + 6) = var1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "HKDataCollector, startTime after endTime not storing sample,startTime,%f,endTime,%f,depth,%f,atSensorLimit,%d,shouldLog,%d", buf, 0x2Cu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102192450);
      v11 = *(_QWORD *)(*(_QWORD *)var0 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)var0 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)var0 + 8);
      v14 = **(_BYTE **)var0;
      v92 = 134219008;
      v93 = v11;
      v94 = 2048;
      v95 = v12;
      v96 = 2048;
      v97 = v13;
      v98 = 1024;
      *(_DWORD *)v99 = v14;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = var1;
      LODWORD(v81) = 44;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 16, "HKDataCollector, startTime after endTime not storing sample,startTime,%f,endTime,%f,depth,%f,atSensorLimit,%d,shouldLog,%d", COERCE_DOUBLE(&v92), v81, v82, v83, v85);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
  }
}

- (void)collectAt:(double)a3 measurement:(id)a4 atSensorLimit:(BOOL)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t *v16;
  double lastSampleTime;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  int v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const char *v27;
  uint8_t *v28;
  _WORD v29[8];
  char *v30;
  std::__shared_weak_count *v31;
  __int128 v32;
  uint8_t buf[1640];

  objc_msgSend(a4, "depth");
  v10 = v9;
  objc_msgSend(a4, "temperature");
  v12 = v11;
  objc_msgSend(a4, "temperatureUncertainty");
  v14 = v13;
  v15 = operator new(0x48uLL);
  v15[1] = 0;
  v16 = v15 + 1;
  v15[2] = 0;
  *v15 = off_102192480;
  *((_BYTE *)v15 + 24) = a5;
  lastSampleTime = self->_lastSampleTime;
  *((_BYTE *)v15 + 25) = 0;
  v15[4] = v10;
  v15[5] = v12;
  v15[6] = v14;
  *((double *)v15 + 7) = lastSampleTime;
  *((double *)v15 + 8) = a3;
  *(_QWORD *)&v32 = v15 + 3;
  *((_QWORD *)&v32 + 1) = v15;
  if (self->_unlockedSinceFirstBoot)
  {
    self->_lastSampleTime = a3;
    v30 = (char *)(v15 + 3);
    v31 = (std::__shared_weak_count *)v15;
    do
      v18 = __ldxr(v16);
    while (__stxr(v18 + 1, v16));
    -[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:](self, "collectWithSubmersionQuantities:shouldLog:", &v30, 1);
    v19 = v31;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  else
  {
    if (self->_decimationCount >= 0)
      v22 = self->_decimationCount & 1;
    else
      v22 = -(self->_decimationCount & 1);
    self->_decimationCount = v22;
    if (!v22)
    {
      if (self->_submersionCollection.__size_.__value_ >= self->_maxQuantities)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_102192450);
        v23 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "failed to cache healthkit data", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_102192450);
          v29[0] = 0;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "failed to cache healthkit data", v29, 2);
          v28 = (uint8_t *)v27;
          sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector collectAt:measurement:atSensorLimit:]", "%s\n", v27);
          if (v28 != buf)
            free(v28);
        }
      }
      else
      {
        self->_lastSampleTime = a3;
        sub_100F0EED8(&self->_submersionCollection.__map_.__first_, &v32);
      }
    }
    ++self->_decimationCount;
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
}

- (void)finish
{
  int64x2_t *v3;
  int64x2_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  double maxDepthWritten;
  CFAbsoluteTime Current;
  uint64_t v12;
  double v13;
  CFAbsoluteTime v14;
  const char *v15;
  char *v16;
  const char *v17;
  char *v18;
  double v19;
  int v20;
  double v21;
  __int16 v22;
  CFAbsoluteTime v23;
  _BYTE buf[1628];

  if (self->_unlockedSinceFirstBoot)
  {
    -[CLSubmersionDataCollector finishUnlocked](self, "finishUnlocked");
  }
  else if (self->_submersionCollection.__size_.__value_ >= self->_maxQuantities)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v8 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "failed to cache healthkit data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102192450);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "failed to cache healthkit data", &v20, 2);
      v18 = (char *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finish]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
  else
  {
    v3 = (int64x2_t *)operator new(0x48uLL);
    v3[1].i64[0] = 0;
    v3->i64[0] = (uint64_t)off_102192480;
    v3->i64[1] = 0;
    v4 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v3[2] = v4;
    v3[3] = v4;
    v3[4].i64[0] = 0x7FEFFFFFFFFFFFFFLL;
    *(_QWORD *)&buf[8] = v3;
    v3[1].i16[4] = 256;
    *(_QWORD *)buf = (char *)v3 + 24;
    sub_100F0EED8(&self->_submersionCollection.__map_.__first_, (__int128 *)buf);
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v6 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  if (self->_maxDepthWritten >= 0.0)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      maxDepthWritten = self->_maxDepthWritten;
      Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = maxDepthWritten;
      *(_WORD *)&buf[12] = 2048;
      *(CFAbsoluteTime *)&buf[14] = Current;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deepest depth written to HK,depth,%f,timestamp,%f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_102192450);
      v12 = qword_10229FE88;
      v13 = self->_maxDepthWritten;
      v14 = CFAbsoluteTimeGetCurrent();
      v20 = 134218240;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      LODWORD(v19) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 0, "Deepest depth written to HK,depth,%f,timestamp,%f", COERCE_DOUBLE(&v20), v19);
      v16 = (char *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finish]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    self->_maxDepthWritten = -1.0;
  }
}

- (void)finishUnlocked
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102192450);
  v3 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "healthkit finishWithCompletion", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "healthkit finishWithCompletion", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector finishUnlocked]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[HKDataCollector finishWithCompletion:](self->_depthCollector, "finishWithCompletion:", &stru_102192410);
  -[HKDataCollector finishWithCompletion:](self->_tempCollector, "finishWithCompletion:", &stru_102192430);

  self->_tempCollector = 0;
  self->_depthCollector = 0;
}

- (CLSubmersionDataCollector)initWithUniverse:(id)a3 andStateMachine:(id)a4
{
  CLSubmersionDataCollector *v6;
  uint64_t v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSubmersionDataCollector;
  v6 = -[CLSubmersionDataCollector init](&v10, "init");
  if (v6)
  {
    v6->_healthStore = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_decimationCount = 0;
    sub_1004AD1D8((unsigned __int8 *)&v8, "MaxSubmersionHK", dword_101C2EE10, 0);
    v6->_maxQuantities = HIDWORD(v8);
    v6->_submersionStateMachine = (CLSubmersionStateMachine *)a4;
    sub_1018BEA14((unsigned __int8 *)&v8, "WaterTempResolutionHK", &qword_101C2EE18, 0);
    v6->_waterTempResolution = v9;
    sub_1018BEA14((unsigned __int8 *)&v8, "WaterTempTimeResolutionHK", &qword_101C2EE20, 0);
    v6->_waterTempTimeResolution = v9;
    sub_1018BEA14((unsigned __int8 *)&v8, "WaterTempUncertaintyCapHK", &qword_101C2EE28, 0);
    v6->_waterTempUncertaintyCap = v9;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  HKHealthStore *healthStore;
  HKDataCollector *depthCollector;
  HKDataCollector *tempCollector;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSubmersionDataCollector;
  -[CLSubmersionDataCollector dealloc](&v6, "dealloc");
  healthStore = self->_healthStore;
  if (healthStore)

  depthCollector = self->_depthCollector;
  if (depthCollector)

  tempCollector = self->_tempCollector;
  if (tempCollector)

}

- (void)logCollectionData
{
  void **begin;
  unint64_t start;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t value;
  unint64_t v12;
  const char *v13;
  uint8_t *v14;
  double v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;

  begin = self->_submersionCollection.__map_.__begin_;
  start = self->_submersionCollection.__start_;
  v5 = (*(_QWORD **)((char *)begin + ((start >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * start];
  if (*(_BYTE *)(v5 + 1))
    v5 = (*(_QWORD **)((char *)begin + (((start + 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (start + 1)];
  v6 = start + self->_submersionCollection.__size_.__value_;
  v7 = (*(_QWORD **)((char *)begin + (((v6 - 1) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (v6 - 1)];
  if (*(_BYTE *)(v7 + 1))
    v7 = (*(_QWORD **)((char *)begin + (((v6 - 2) >> 5) & 0x7FFFFFFFFFFFFF8)))[2 * (v6 - 2)];
  v8 = *(_QWORD *)(v5 + 32);
  v9 = *(_QWORD *)(v7 + 40);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_102192450);
  v10 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_INFO))
  {
    value = self->_submersionCollection.__size_.__value_;
    *(_DWORD *)buf = 134218496;
    v23 = value;
    v24 = 2048;
    v25 = v8;
    v26 = 2048;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "inserting into healthkit,numValues,%lu,firstStartTime,%f,lastEndTime,%f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_102192450);
    v12 = self->_submersionCollection.__size_.__value_;
    v16 = 134218496;
    v17 = v12;
    v18 = 2048;
    v19 = v8;
    v20 = 2048;
    v21 = v9;
    LODWORD(v15) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 1, "inserting into healthkit,numValues,%lu,firstStartTime,%f,lastEndTime,%f", &v16, v15);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLSubmersionDataCollector logCollectionData]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
}

- (void)writeDataOnUnlock
{
  deque<std::shared_ptr<CLSubmersionQuantities>, std::allocator<std::shared_ptr<CLSubmersionQuantities>>> *p_submersionCollection;
  BOOL v4;
  void **begin;
  void **end;
  unint64_t start;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  int64x2_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  if (self->_submersionCollection.__size_.__value_)
  {
    p_submersionCollection = &self->_submersionCollection;
    v4 = 1;
    while (1)
    {
      -[CLSubmersionDataCollector logCollectionData](self, "logCollectionData", v25);
      sub_100F103F4((uint64_t)&v27, p_submersionCollection);
      begin = self->_submersionCollection.__map_.__begin_;
      end = self->_submersionCollection.__map_.__end_;
      if (end == begin)
      {
        end = self->_submersionCollection.__map_.__begin_;
      }
      else
      {
        start = self->_submersionCollection.__start_;
        v8 = &begin[start >> 8];
        v9 = (uint64_t)*v8 + 16 * start;
        v10 = *(uint64_t *)((char *)begin
                         + (((self->_submersionCollection.__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
            + 16 * (LOBYTE(self->_submersionCollection.__size_.__value_) + start);
        if (v9 != v10)
        {
          do
          {
            v9 = sub_100261F44(v9) + 16;
            if (v9 - (_QWORD)*v8 == 4096)
            {
              v11 = (uint64_t)v8[1];
              ++v8;
              v9 = v11;
            }
          }
          while (v9 != v10);
          begin = self->_submersionCollection.__map_.__begin_;
          end = self->_submersionCollection.__map_.__end_;
        }
      }
      self->_submersionCollection.__size_.__value_ = 0;
      v12 = (char *)end - (char *)begin;
      if (v12 >= 0x11)
      {
        do
        {
          operator delete(*begin);
          v13 = self->_submersionCollection.__map_.__end_;
          begin = self->_submersionCollection.__map_.__begin_ + 1;
          self->_submersionCollection.__map_.__begin_ = begin;
          v12 = (char *)v13 - (char *)begin;
        }
        while (v12 > 0x10);
      }
      if (v12 >> 3 == 1)
        break;
      if (v12 >> 3 == 2)
      {
        v14 = 256;
LABEL_16:
        self->_submersionCollection.__start_ = v14;
      }
      if (v28 != v27.i64[1])
      {
        v15 = (_QWORD *)(v27.i64[1] + 8 * (v29 >> 8));
        v16 = (uint64_t *)(*v15 + 16 * v29);
        v17 = *(_QWORD *)(v27.i64[1] + (((v30 + v29) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v30 + v29);
        while (v16 != (uint64_t *)v17)
        {
          if (v4)
            -[CLSubmersionDataCollector startUnlocked](self, "startUnlocked");
          v4 = *(_BYTE *)(*v16 + 1) != 0;
          if (*(_BYTE *)(*v16 + 1))
          {
            -[CLSubmersionDataCollector finishUnlocked](self, "finishUnlocked");
          }
          else
          {
            v19 = (std::__shared_weak_count *)v16[1];
            v25 = *v16;
            v26 = v19;
            if (v19)
            {
              p_shared_owners = (unint64_t *)&v19->__shared_owners_;
              do
                v21 = __ldxr(p_shared_owners);
              while (__stxr(v21 + 1, p_shared_owners));
            }
            -[CLSubmersionDataCollector collectWithSubmersionQuantities:shouldLog:](self, "collectWithSubmersionQuantities:shouldLog:", &v25, 0);
            v22 = v26;
            if (v26)
            {
              v23 = (unint64_t *)&v26->__shared_owners_;
              do
                v24 = __ldaxr(v23);
              while (__stlxr(v24 - 1, v23));
              if (!v24)
              {
                ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
                std::__shared_weak_count::__release_weak(v22);
              }
            }
          }
          sub_10017F858(&v27);
          v16 += 2;
          if ((uint64_t *)((char *)v16 - *v15) == (uint64_t *)4096)
          {
            v18 = (uint64_t *)v15[1];
            ++v15;
            v16 = v18;
          }
        }
      }
      sub_1006F0FB8(&v27);
      if (!self->_submersionCollection.__size_.__value_)
        return;
    }
    v14 = 128;
    goto LABEL_16;
  }
}

- (_BYTE)onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  char v4;
  _BYTE *v5;
  BOOL v6;

  if (a3 == 1)
  {
    v4 = BYTE4(a4);
    v5 = result;
    if (result[24])
      v6 = 1;
    else
      v6 = (a4 & (unint64_t)&_mh_execute_header) == 0;
    if (!v6)
    {
      if (*((_QWORD *)result + 14))
        result = objc_msgSend(result, "writeDataOnUnlock");
    }
    v5[24] = v4 & 1;
  }
  return result;
}

- (void).cxx_destruct
{
  void *value;
  Client *v4;

  value = self->_temperatureDecimator.__ptr_.__value_;
  self->_temperatureDecimator.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  sub_1006F0FB8(&self->_submersionCollection.__map_.__first_);
  v4 = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end

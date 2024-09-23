@implementation CLWMMotionState

- (id)getRecordEventBlock
{
  return *(id *)&self->_startLocation.fromSimulationController;
}

- (CLWMMotionState)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  CLWMMotionState *v8;
  CLWMMotionState *v9;
  _QWORD aBlock[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLWMMotionState;
  v8 = -[CLWMBase init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_disableLatLong = a5->disableLatLong;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1018D2668;
    aBlock[3] = &unk_1021D79C8;
    aBlock[4] = v9;
    *(_QWORD *)&v9->_startLocation.fromSimulationController = _Block_copy(aBlock);
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
  sub_1006CB5B4();
}

- (void)teardownListeners
{
  Client *value;

  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  -[CLWMMotionState releaseBlocks](self, "releaseBlocks");
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  objc_super v7;
  uint8_t buf[1640];

  self->_metadata = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLWMMotionState;
  -[CLWMBase dealloc](&v7, "dealloc");
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D79E8);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWMMotionState deallocation is complete", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D79E8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWMMotionState deallocation is complete", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWMMotionState dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)setGetStartLocation:(id)a3
{
  double ellipsoidalAltitude;

  ellipsoidalAltitude = self->_startLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0)
    _Block_release(*(const void **)&ellipsoidalAltitude);
  *(_QWORD *)&self->_startLocation.ellipsoidalAltitude = _Block_copy(a3);
}

- (void)setBlockUpdateIsCycling:(id)a3
{
  id getstartLocation;

  getstartLocation = self->_getstartLocation;
  if (getstartLocation)
    _Block_release(getstartLocation);
  self->_getstartLocation = _Block_copy(a3);
}

- (void)updateCyclingWorkout:(BOOL)a3
{
  void (**getstartLocation)(id, BOOL);

  getstartLocation = (void (**)(id, BOOL))self->_getstartLocation;
  if (getstartLocation)
    getstartLocation[2](getstartLocation, a3);
}

- (CLDaemonLocation)getStartLocation
{
  CLDaemonLocation *result;
  $AB5116BA7E623E054F959CECB034F4E7 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];
  _BYTE v15[28];

  result = *(CLDaemonLocation **)&self->_startLocation.ellipsoidalAltitude;
  if (result)
  {
    result = (CLDaemonLocation *)(*(_QWORD *(**)(_OWORD *__return_ptr))&result->coordinate.longitude)(v14);
    v6 = ($AB5116BA7E623E054F959CECB034F4E7)v14[7];
    *(_OWORD *)&self->_startLocation.lifespan = v14[6];
    self->_startLocation.rawCoordinate = v6;
    *(_OWORD *)&self->_startLocation.rawCourse = *(_OWORD *)v15;
    *(_OWORD *)&self->_startLocation.integrity = *(_OWORD *)&v15[12];
    v7 = v14[3];
    *(_OWORD *)&self->_startLocation.altitude = v14[2];
    *(_OWORD *)&self->_startLocation.speed = v7;
    v8 = v14[5];
    *(_OWORD *)&self->_startLocation.course = v14[4];
    *(_OWORD *)&self->_startLocation.timestamp = v8;
    v9 = v14[1];
    *(_OWORD *)&self->_startLocation.suitability = v14[0];
    *(_OWORD *)&self->_startLocation.coordinate.longitude = v9;
  }
  rawCoordinate = self->_startLocation.rawCoordinate;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->_startLocation.lifespan;
  retstr->rawCoordinate = rawCoordinate;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->_startLocation.rawCourse;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self->_startLocation.integrity;
  v11 = *(_OWORD *)&self->_startLocation.speed;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->_startLocation.altitude;
  *(_OWORD *)&retstr->speed = v11;
  v12 = *(_OWORD *)&self->_startLocation.timestamp;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->_startLocation.course;
  *(_OWORD *)&retstr->timestamp = v12;
  v13 = *(_OWORD *)&self->_startLocation.coordinate.longitude;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->_startLocation.suitability;
  *(_OWORD *)&retstr->coordinate.longitude = v13;
  return result;
}

- (void)writeWorkoutEvent:(const WorkoutEvent *)a3
{
  WriterManager *ptr;
  int64_t eventType;
  NSNumber *v7;
  NSMutableDictionary *metadata;
  const __CFString *v9;
  unint64_t v10;
  NSObject *v11;
  int64_t v12;
  int64_t workoutType;
  int64_t workoutLocationType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t workoutMode;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  double poolLength;
  uint64_t v36;
  int64_t swimLocation;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  const char *v41;
  uint8_t *v42;
  uint8_t buf[4];
  double v44;
  _BYTE v45[10];
  __int16 v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  int v51;
  int64_t v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  int64_t v56;

  ptr = self->_writer.__ptr_;
  if (!ptr || !*((_BYTE *)ptr + 136))
    return;
  ++self->_sampleCount;
  eventType = a3->eventType;
  if ((unint64_t)(eventType - 8) < 2)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->workoutSettings.workoutType), CFSTR("PredictedWorkoutType"));
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->workoutSettings.workoutLocationType);
    metadata = self->_metadata;
    v9 = CFSTR("PredictedWorkoutLocationType");
  }
  else if (eventType)
  {
    if (eventType != 1
      || (sub_1018D34D0((float *)&self->_activitySet, a3->workoutSettings.workoutType, a3->workoutSettings.workoutType) & 1) == 0)
    {
      goto LABEL_13;
    }
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("UniqueWorkoutActivityCount")), "integerValue")+ 1);
    metadata = self->_metadata;
    v9 = CFSTR("UniqueWorkoutActivityCount");
  }
  else
  {
    if ((sub_1018D34D0((float *)&self->_activitySet, a3->workoutSettings.workoutType, a3->workoutSettings.workoutType) & 1) != 0)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("UniqueWorkoutActivityCount")), "integerValue")+ 1), CFSTR("UniqueWorkoutActivityCount"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->workoutSettings.workoutType), CFSTR("WorkoutActivityType"));
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3->workoutSettings.workoutLocationType);
    metadata = self->_metadata;
    v9 = CFSTR("WorkoutActivityLocationType");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](metadata, "setObject:forKeyedSubscript:", v7, v9);
LABEL_13:
  if (!self->_disableLatLong)
  {
    v10 = a3->eventType;
    if (v10 <= 0xD && ((1 << v10) & 0x2300) != 0)
    {
      -[CLWMMotionState getStartLocation](self, "getStartLocation");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(v44)), CFSTR("CoarseLatitude2"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", llround(*(double *)v45)), CFSTR("CoarseLongitude2"));
    }
  }
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D79E8);
  v11 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a3->eventType;
    workoutType = a3->workoutSettings.workoutType;
    workoutLocationType = a3->workoutSettings.workoutLocationType;
    *(_DWORD *)buf = 134218496;
    v44 = *(double *)&v12;
    *(_WORD *)v45 = 2048;
    *(_QWORD *)&v45[2] = workoutType;
    v46 = 2048;
    v47 = workoutLocationType;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received: WorkoutEventType: %ld WorkoutType: %ld Location: %ld", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D79E8);
    v38 = a3->eventType;
    v39 = a3->workoutSettings.workoutType;
    v40 = a3->workoutSettings.workoutLocationType;
    v51 = 134218496;
    v52 = v38;
    v53 = 2048;
    v54 = v39;
    v55 = 2048;
    v56 = v40;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "Received: WorkoutEventType: %ld WorkoutType: %ld Location: %ld", &v51, 32);
    v42 = (uint8_t *)v41;
    sub_100512490("Generic", 1, 0, 2, "-[CLWMMotionState writeWorkoutEvent:]", "%s\n", v41);
    if (v42 != buf)
      free(v42);
  }
  sub_1015EB864(buf);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
  v50 |= 1u;
  v48 = v15;
  sub_101602DC8((uint64_t)buf);
  sub_10163A430(v49);
  v16 = v49;
  v17 = *(_QWORD *)(v49 + 8);
  v18 = a3->workoutSettings.workoutType;
  *(_WORD *)(v17 + 64) |= 0x200u;
  *(_DWORD *)(v17 + 60) = v18;
  v19 = *(_QWORD *)(v16 + 8);
  v20 = a3->eventType;
  *(_WORD *)(v19 + 64) |= 0x10u;
  *(_DWORD *)(v19 + 40) = v20;
  v21 = *(_QWORD *)(v16 + 8);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->eventTime);
  *(_WORD *)(v21 + 64) |= 2u;
  *(_QWORD *)(v21 + 16) = v22;
  v23 = *(_QWORD *)(v16 + 8);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->startTime);
  *(_WORD *)(v23 + 64) |= 8u;
  *(_QWORD *)(v23 + 32) = v24;
  if (a3->endTime != 1.79769313e308)
  {
    v25 = *(_QWORD *)(v16 + 8);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
    *(_WORD *)(v25 + 64) |= 1u;
    *(_QWORD *)(v25 + 8) = v26;
  }
  v27 = *(_QWORD *)(v16 + 8);
  v28 = a3->workoutSettings.workoutLocationType;
  *(_WORD *)(v27 + 64) |= 0x80u;
  *(_DWORD *)(v27 + 52) = v28;
  v29 = *(_QWORD *)(v16 + 8);
  workoutMode = a3->workoutSettings.workoutMode;
  *(_WORD *)(v29 + 64) |= 0x100u;
  *(_DWORD *)(v29 + 56) = workoutMode;
  v31 = a3->workoutSettings.workoutType;
  if (v31 == 14)
  {
    v36 = *(_QWORD *)(v16 + 8);
    swimLocation = a3->workoutSettings.attrib.swim.swimLocation;
    *(_WORD *)(v36 + 64) |= 0x20u;
    *(_DWORD *)(v36 + 44) = swimLocation;
  }
  else if (v31 == 19)
  {
    v32 = *(_QWORD *)(v16 + 8);
    v33 = a3->workoutSettings.attrib.swim.swimLocation;
    *(_WORD *)(v32 + 64) |= 0x40u;
    *(_DWORD *)(v32 + 48) = v33;
    v34 = *(_QWORD *)(v16 + 8);
    poolLength = a3->workoutSettings.attrib.swim.poolLength;
    *(_WORD *)(v34 + 64) |= 4u;
    *(double *)(v34 + 24) = poolLength;
  }
  sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
  sub_1015EE304((PB::Base *)buf);
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[8];
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  if (*a3 == 2)
  {
    v8 = *((_OWORD *)a4 + 13);
    v31 = *((_OWORD *)a4 + 12);
    v32 = v8;
    v33 = *((_QWORD *)a4 + 28);
    v9 = *((_OWORD *)a4 + 9);
    v27 = *((_OWORD *)a4 + 8);
    v28 = v9;
    v10 = *((_OWORD *)a4 + 11);
    v29 = *((_OWORD *)a4 + 10);
    v30 = v10;
    v11 = *((_OWORD *)a4 + 5);
    v23 = *((_OWORD *)a4 + 4);
    v24 = v11;
    v12 = *((_OWORD *)a4 + 7);
    v25 = *((_OWORD *)a4 + 6);
    v26 = v12;
    v13 = *((_OWORD *)a4 + 1);
    *(_OWORD *)buf = *(_OWORD *)a4;
    v20 = v13;
    v14 = *((_OWORD *)a4 + 3);
    v21 = *((_OWORD *)a4 + 2);
    v22 = v14;
    if (!sub_100F72B4C((uint64_t)buf))
    {
      -[CLWMMotionState writeWorkoutEvent:](self, "writeWorkoutEvent:", buf);
      if ((_QWORD)v20 == 18 || (_QWORD)v20 == 14)
        -[CLWMMotionState updateCyclingWorkout:](self, "updateCyclingWorkout:", sub_100F72B3C(v26));
    }
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D79E8);
    v15 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled motion state mediator notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D79E8);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "#Warning Unhandled motion state mediator notification", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLWMMotionState onMotionStateMediatorNotification:data:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
}

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
  if (sub_100F72B4C((uint64_t)a3))
    -[CLWMMotionState writeWorkoutEvent:](self, "writeWorkoutEvent:", a3);
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  sub_100349198(&self->_writer.__ptr_, (uint64_t *)a3.__ptr_);
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)setWorkoutCount:(int)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3), CFSTR("UniqueWorkoutActivityCount"));
}

- (void)releaseBlocks
{
  _Block_release(*(const void **)&self->_startLocation.ellipsoidalAltitude);
  _Block_release(*(const void **)&self->_startLocation.fromSimulationController);
  _Block_release(self->_getstartLocation);
}

- (void).cxx_destruct
{
  unordered_set<CMWorkoutType, std::hash<CMWorkoutType>, std::equal_to<CMWorkoutType>, std::allocator<CMWorkoutType>> *p_activitySet;
  _QWORD *next;
  _QWORD *v5;
  void **value;
  Client *v7;

  p_activitySet = &self->_activitySet;
  next = self->_activitySet.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (_QWORD *)*next;
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_activitySet->__table_.__bucket_list_.__ptr_.__value_;
  p_activitySet->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  sub_100261F44((uint64_t)&self->_writer);
  v7 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_DWORD *)self + 28) = 0xFFFF;
  *(_QWORD *)((char *)self + 116) = 0;
  *(_QWORD *)((char *)self + 124) = 0;
  *(_OWORD *)((char *)self + 132) = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 148) = _Q0;
  *(_OWORD *)((char *)self + 164) = _Q0;
  *(_OWORD *)((char *)self + 180) = _Q0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 56) = 0;
  *((_QWORD *)self + 25) = 0xBFF0000000000000;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  *(_QWORD *)((char *)self + 228) = 0xBFF0000000000000;
  *((_DWORD *)self + 59) = 0x7FFFFFFF;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_BYTE *)self + 264) = 0;
  return self;
}

@end

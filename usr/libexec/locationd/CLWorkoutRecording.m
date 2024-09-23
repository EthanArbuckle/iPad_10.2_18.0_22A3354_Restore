@implementation CLWorkoutRecording

- (id)getLocationBlock
{
  return *(id *)&self->_startLocation.referenceFrame;
}

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->_startLocation.floor;
  if (v3)
    (*(void (**)(uint64_t, const WorkoutEvent *))(v3 + 16))(v3, a3);
}

- (void)initializeTheSettings:(SettingStructure *)a3
{
  BYTE1(self->_fFileTimeInterval) = a3->disableWeatherData;
  BYTE2(self->_fFileTimeInterval) = a3->disableMeanMaxMets;
  LOBYTE(self->_fFileTimeInterval) = a3->disableStrideCalBins;
  self->_recordingType.var0 = a3->recordingType.var0;
  self->_recordingType.__r_.var0 = a3->recordingType.__r_.var0;
  self->_privacyTimeOffset = a3->privacyTimeOffset;
  std::string::operator=((std::string *)&self->_recordingType, (const std::string *)&a3->recordingType);
}

- (CLWorkoutRecording)initWithDelegate:(id)a3 universe:(id)a4 moduleDictionary:(id)a5 setting:(SettingStructure *)a6
{
  NSObject *v11;
  _BOOL4 hasSyncInWatch;
  void **v13;
  uint64_t v14;
  CLWorkoutRecording *v15;
  CLWorkoutRecording *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  NSMutableDictionary *metadata;
  uint64_t v21;
  _BYTE *v22;
  __long *p_recordingType;
  _BYTE *v24;
  NSObject *v25;
  id v26;
  uint64_t v28;
  _BOOL4 v29;
  void **v30;
  uint64_t v31;
  id v32;
  const char *v33;
  char *v34;
  void *v35;
  char *v36;
  char *v37;
  const char *v38;
  _QWORD aBlock[5];
  objc_super v40;
  void *v41[2];
  uint64_t v42;
  _OWORD v43[6];
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *__p[4];
  _BYTE buf[18];
  __int16 v52;
  uint64_t v53;

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6D60);
  v11 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    hasSyncInWatch = a6->hasSyncInWatch;
    if (self)
    {
      -[CLWorkoutRecording getStringSessionId:](self, "getStringSessionId:", a6->workoutRecorderSessionId);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
    }
    else
    {
      memset(__p, 0, 24);
      v13 = __p;
    }
    v14 = *(_QWORD *)&a6[1].hasSyncInWatch;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = hasSyncInWatch;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = v13;
    v52 = 2048;
    v53 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecording: initWithDelegate, hasSync: %d and internal sessionID: %s and activity type: %ld", buf, 0x1Cu);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v28 = qword_10229FE38;
    v29 = a6->hasSyncInWatch;
    if (self)
    {
      -[CLWorkoutRecording getStringSessionId:](self, "getStringSessionId:", a6->workoutRecorderSessionId);
      if (v42 >= 0)
        v30 = v41;
      else
        v30 = (void **)v41[0];
    }
    else
    {
      v41[0] = 0;
      v41[1] = 0;
      v30 = v41;
      v42 = 0;
    }
    v35 = *(void **)&a6[1].hasSyncInWatch;
    LODWORD(__p[0]) = 67109634;
    HIDWORD(__p[0]) = v29;
    LOWORD(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 2) = v30;
    WORD1(__p[2]) = 2048;
    *(void **)((char *)&__p[2] + 4) = v35;
    LODWORD(v38) = 28;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 0, "CLWorkoutRecording: initWithDelegate, hasSync: %d and internal sessionID: %s and activity type: %ld", __p, v38, aBlock[0]);
    v37 = v36;
    if (SHIBYTE(v42) < 0)
      operator delete(v41[0]);
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]", "%s\n", v37);
    if (v37 != buf)
      free(v37);
  }
  v40.receiver = self;
  v40.super_class = (Class)CLWorkoutRecording;
  v15 = -[CLWorkoutRecording init](&v40, "init");
  v16 = v15;
  if (v15)
  {
    v15->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v15->_universe = (CLIntersiloUniverse *)a4;
    v15->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v17 = *(_OWORD *)&a6->privacyTimeOffset;
    v43[2] = *(_OWORD *)&a6->kPrivacyPressureMaxOffset;
    v43[3] = v17;
    v18 = *(_OWORD *)a6->workoutRecorderSessionId;
    v43[4] = *(_OWORD *)&a6->minimumPowerAssertionTimeSeconds;
    v43[5] = v18;
    v19 = *(_OWORD *)&a6->hasSyncInWatch;
    v43[0] = *(_OWORD *)&a6->disableAveragedALS;
    v43[1] = v19;
    if (*((char *)&a6->recordingType.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_100115CE4(&v44, a6->recordingType.__r_.__value_.var0.var1.__data_, a6->recordingType.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      v44 = *(_OWORD *)a6->recordingType.__r_.__value_.var0.var0.__data_;
      v45 = *((_QWORD *)&a6->recordingType.__r_.__value_.var0.var1 + 2);
    }
    v46 = *(_OWORD *)&a6->recordingType.__r_.var0;
    v47 = *(_OWORD *)&a6[1].disableAveragedALS;
    v48 = *(_OWORD *)&a6[1].hasSyncInWatch;
    v49 = *(_OWORD *)&a6[1].kPrivacyPressureMaxOffset;
    -[CLWorkoutRecording initializeTheSettings:](v16, "initializeTheSettings:", v43);
    if (SHIBYTE(v45) < 0)
      operator delete((void *)v44);
    metadata = v16->_metadata;
    v21 = sub_100197040();
    sub_10075A5A0(v21, (uint64_t)buf);
    if ((v53 & 0x80000000) == 0)
      v22 = buf;
    else
      v22 = *(_BYTE **)buf;
    -[NSMutableDictionary setValue:forKey:](metadata, "setValue:forKey:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22), CFSTR("HardwareType"));
    if (SBYTE3(v53) < 0)
      operator delete(*(void **)buf);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_100A10F50()), CFSTR("FallNotifierAvailable"));
    p_recordingType = (__long *)&v16->_recordingType;
    if (*((char *)&v16->_recordingType.__r_.__value_.var0.var1 + 23) < 0)
      p_recordingType = (__long *)p_recordingType->__data_;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_recordingType), CFSTR("RecordingType"));
    -[CLWorkoutRecording getStringSessionId:](v16, "getStringSessionId:", a6->workoutRecorderSessionId);
    if ((v53 & 0x80000000) == 0)
      v24 = buf;
    else
      v24 = *(_BYTE **)buf;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24), CFSTR("workoutRecorderSessionId"));
    if (SBYTE3(v53) < 0)
      operator delete(*(void **)buf);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a6->hasSyncInWatch), CFSTR("hasCompanionPayload"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", &off_10221E128, CFSTR("MeanMaxMets"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", &off_10221DFD0, CFSTR("UniqueWorkoutActivityCount"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", *(_QWORD *)&a6[1].accelIntervalSeconds, CFSTR("ParticipantID"));
    if (a6->hasSyncInWatch)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)&a6[1].hasSyncInWatch), CFSTR("WorkoutActivityType"));
    sub_100197040();
    if (sub_10075D288())
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_metadata, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("InternalInstall"));
    v16->_modulesDict = (NSMutableDictionary *)a5;
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v25 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      v26 = objc_msgSend(-[NSMutableDictionary allKeys](v16->_modulesDict, "allKeys"), "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording:initWithDelegate %lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v31 = qword_10229FE38;
      v32 = objc_msgSend(-[NSMutableDictionary allKeys](v16->_modulesDict, "allKeys"), "count");
      LODWORD(__p[0]) = 134217984;
      *(void **)((char *)__p + 4) = v32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v31, 2, "CLWorkoutRecording:initWithDelegate %lu", __p);
      v34 = (char *)v33;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]", "%s\n", v33);
      if (v34 != buf)
        free(v34);
    }
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1018B4C3C;
    aBlock[3] = &unk_1021D6D40;
    aBlock[4] = v16;
    *(_QWORD *)&v16->_startLocation.referenceFrame = _Block_copy(aBlock);
  }
  return v16;
}

- (basic_string<char,)getStringSessionId:(std::allocator<char>> *__return_ptr)retstr
{
  const unsigned __int8 *v1;
  _BYTE v4[37];

  memset(v4, 0, sizeof(v4));
  uuid_unparse(v1, v4);
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1015A2E04(retstr, v4);
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  objc_super v7;
  uint8_t buf[1640];

  sub_100346F9C(&self->_writer.__ptr_);

  self->_workingDirectory = 0;
  self->_metadata = 0;
  self->_delegate = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLWorkoutRecording;
  -[CLWorkoutRecording dealloc](&v7, "dealloc");
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6D60);
  v3 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecording deallocation is complete.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 0, "CLWorkoutRecording deallocation is complete.", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording dealloc]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (BOOL)start:(id)a3 recentLocation:(CLDaemonLocation *)a4 triggerDelay:(double)a5 recentWeatherData:(id)a6 maxFileCount:(unsigned int)a7
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v18;
  NSObject *v19;
  NSURL *workingDirectory;
  char *v21;
  NSObject *v22;
  BOOL v23;
  shared_ptr<CMMsl::WriterManager> *p_writer;
  __shared_weak_count *cntrl;
  unint64_t *v26;
  unint64_t v27;
  NSURL *v29;
  const char *v30;
  char *v31;
  const char *v32;
  char *v33;
  _BYTE v34[32];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  _BYTE buf[32];
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 __p;
  uint64_t v46;
  __int128 v47;

  if (-[CLWorkoutRecording setWorkingDirectory:](self, "setWorkingDirectory:", a3))
  {
    self->_startLocation.ellipsoidalAltitude = CFAbsoluteTimeGetCurrent();
    v12 = *(_OWORD *)&a4->coordinate.longitude;
    *(_OWORD *)(&self->_fFileTimeInterval + 1) = *(_OWORD *)&a4->suitability;
    *(_OWORD *)(&self->_disableMeanMaxMets + 2) = v12;
    v13 = *(_OWORD *)&a4->course;
    v14 = *(_OWORD *)&a4->timestamp;
    v15 = *(_OWORD *)&a4->speed;
    *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_startLocation.coordinate + 4) = *($AB5116BA7E623E054F959CECB034F4E7 *)&a4->altitude;
    *(_OWORD *)((char *)&self->_startLocation.speedAccuracy + 4) = v14;
    *(_OWORD *)((char *)&self->_startLocation.verticalAccuracy + 4) = v13;
    *(_OWORD *)((char *)&self->_startLocation.horizontalAccuracy + 4) = v15;
    rawCoordinate = a4->rawCoordinate;
    v16 = *(_OWORD *)&a4->rawCourse;
    v18 = *(_OWORD *)&a4->integrity;
    *(_OWORD *)((char *)&self->_startLocation.courseAccuracy + 4) = *(_OWORD *)&a4->lifespan;
    *(_OWORD *)&self->_startLocation.rawCoordinate.longitude = v18;
    *(_OWORD *)(&self->_startLocation.type + 1) = v16;
    *($AB5116BA7E623E054F959CECB034F4E7 *)(&self->_startLocation.confidence + 1) = rawCoordinate;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5), CFSTR("TriggerDelay"));
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v19 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      workingDirectory = self->_workingDirectory;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = workingDirectory;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: Writing files to %@, maxFileCount %d.", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v29 = self->_workingDirectory;
      *(_DWORD *)v34 = 138412546;
      *(_QWORD *)&v34[4] = v29;
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = a7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecording: Writing files to %@, maxFileCount %d.", v34, 18);
      v31 = (char *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]", "%s\n", v30);
      if (v31 != buf)
        free(v31);
    }
    *(_QWORD *)v34 = self->_recordingType.var0;
    *(_DWORD *)&v34[8] = self->_recordingType.__r_.var0;
    *(_DWORD *)&v34[12] = a7;
    sub_1015A2E04(&v34[16], (char *)-[NSURL fileSystemRepresentation](self->_workingDirectory, "fileSystemRepresentation"));
    sub_1015A2E04(&v36, "recording");
    sub_1015A2E04(&v38, "msl");
    LODWORD(v40) = 2;
    *((_QWORD *)&v40 + 1) = 300;
    v21 = (char *)operator new(0xB0uLL);
    *((_QWORD *)v21 + 1) = 0;
    *((_QWORD *)v21 + 2) = 0;
    *(_QWORD *)v21 = off_1021D6D90;
    *(_OWORD *)buf = *(_OWORD *)v34;
    if (SHIBYTE(v35) < 0)
    {
      sub_100115CE4(&buf[16], *(void **)&v34[16], *(unint64_t *)&v34[24]);
    }
    else
    {
      *(_OWORD *)&buf[16] = *(_OWORD *)&v34[16];
      v42 = v35;
    }
    if (SHIBYTE(v37) < 0)
    {
      sub_100115CE4(&v43, (void *)v36, *((unint64_t *)&v36 + 1));
    }
    else
    {
      v43 = v36;
      v44 = v37;
    }
    if (SHIBYTE(v39) < 0)
    {
      sub_100115CE4(&__p, (void *)v38, *((unint64_t *)&v38 + 1));
    }
    else
    {
      __p = v38;
      v46 = v39;
    }
    v47 = v40;
    sub_1015E2E18(v21 + 24, buf);
    if (SHIBYTE(v46) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v44) < 0)
      operator delete((void *)v43);
    if (SHIBYTE(v42) < 0)
      operator delete(*(void **)&buf[16]);
    self->_writer.__ptr_ = (WriterManager *)(v21 + 24);
    p_writer = &self->_writer;
    cntrl = self->_writer.__cntrl_;
    self->_writer.__cntrl_ = (__shared_weak_count *)v21;
    if (cntrl)
    {
      v26 = (unint64_t *)((char *)cntrl + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v23 = *((_BYTE *)p_writer->__ptr_ + 136) != 0;
    if (*((_BYTE *)p_writer->__ptr_ + 136))
    {
      -[CLWorkoutRecording setupModuleWriters](self, "setupModuleWriters");
      -[CLWorkoutRecording setupListeners](self, "setupListeners");
      -[CLWorkoutRecording recordWeatherData:](self, "recordWeatherData:", a6);
    }
    else
    {
      sub_100346F9C(&self->_writer.__ptr_);
    }
    if (SHIBYTE(v39) < 0)
      operator delete((void *)v38);
    if (SHIBYTE(v37) < 0)
      operator delete((void *)v36);
    if (SHIBYTE(v35) < 0)
      operator delete(*(void **)&v34[16]);
  }
  else
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v22 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: start, no working directory", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      *(_WORD *)v34 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecording: start, no working directory", v34, 2);
      v33 = (char *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
    return 0;
  }
  return v23;
}

- (void)stop
{
  CFAbsoluteTime Current;
  WriterManager *ptr;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 __p;
  uint64_t v15;
  __int128 v16;

  -[CLWorkoutRecording teardownListeners](self, "teardownListeners");
  -[CLWorkoutRecording writeStrideCalBins](self, "writeStrideCalBins");
  Current = CFAbsoluteTimeGetCurrent();
  ptr = self->_writer.__ptr_;
  *(CFAbsoluteTime *)&self->_startLocation.signalEnvironmentType = Current;
  if (ptr)
  {
    v9 = *(_OWORD *)ptr;
    if (*((char *)ptr + 39) < 0)
    {
      sub_100115CE4(&v10, *((void **)ptr + 2), *((_QWORD *)ptr + 3));
    }
    else
    {
      v5 = *((_OWORD *)ptr + 1);
      v11 = *((_QWORD *)ptr + 4);
      v10 = v5;
    }
    if (*((char *)ptr + 63) < 0)
    {
      sub_100115CE4(&v12, *((void **)ptr + 5), *((_QWORD *)ptr + 6));
    }
    else
    {
      v6 = *(_OWORD *)((char *)ptr + 40);
      v13 = *((_QWORD *)ptr + 7);
      v12 = v6;
    }
    if (*((char *)ptr + 87) < 0)
    {
      sub_100115CE4(&__p, *((void **)ptr + 8), *((_QWORD *)ptr + 9));
    }
    else
    {
      v7 = *((_OWORD *)ptr + 4);
      v15 = *((_QWORD *)ptr + 10);
      __p = v7;
    }
    v16 = *(_OWORD *)((char *)ptr + 88);
    v8 = *(double *)&self->_startLocation.signalEnvironmentType - (double)(HIDWORD(v9) * DWORD2(v9));
    if (self->_startLocation.ellipsoidalAltitude < v8)
      self->_startLocation.ellipsoidalAltitude = v8;
    if (SHIBYTE(v15) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v13) < 0)
      operator delete((void *)v12);
    if (SHIBYTE(v11) < 0)
      operator delete((void *)v10);
  }
  sub_100346F9C(&self->_writer.__ptr_);
}

- (void)cleanup
{
  -[CLWorkoutRecording deleteWorkingDirectory](self, "deleteWorkingDirectory");
}

- (BOOL)setWorkingDirectory:(id)a3
{
  NSURL *v4;
  NSObject *v5;
  BOOL v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  _BYTE v20[14];
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  _QWORD v25[2];

  v25[0] = objc_msgSend(a3, "path");
  v25[1] = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  v4 = +[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", -[NSURL path](v4, "path")))
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLWorkoutRecording: Recording working directory already exists. This should never happen.", buf, 2u);
    }
    v6 = 0;
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      LOWORD(v17) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutRecording: Recording working directory already exists. This should never happen.", &v17, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
      return 0;
    }
  }
  else
  {
    v16 = 0;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", -[NSURL path](v4, "path"), 1, 0, &v16);
    v6 = v16 == 0;
    if (v16)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v9 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CLWorkoutRecording: Unable to create recording working directory, error: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D6D60);
        v17 = 138543362;
        v18 = v16;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutRecording: Unable to create recording working directory, error: %{public}@", &v17, 12);
        v11 = (uint8_t *)v10;
        sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v10);
        if (v11 != buf)
          free(v11);
      }
    }
    else
    {
      if (self->_workingDirectory)
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D6D60);
        v13 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(_QWORD *)&v20[6] = "";
          v21 = 2082;
          v22 = "assert";
          v23 = 2081;
          v24 = "!_workingDirectory";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D6D60);
        }
        v14 = qword_10229FE38;
        if (os_signpost_enabled((os_log_t)qword_10229FE38))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(_QWORD *)&v20[6] = "";
          v21 = 2082;
          v22 = "assert";
          v23 = 2081;
          v24 = "!_workingDirectory";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLWorkoutRecording : Working directory should only ever be set once.", "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D6D60);
        }
        v15 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)v20 = 0;
          *(_WORD *)&v20[4] = 2082;
          *(_QWORD *)&v20[6] = "";
          v21 = 2082;
          v22 = "assert";
          v23 = 2081;
          v24 = "!_workingDirectory";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/CLWorkoutRecording.mm", 222, "-[CLWorkoutRecording setWorkingDirectory:]");
      }
      self->_workingDirectory = v4;
    }
  }
  return v6;
}

- (double)stopTime
{
  double result;

  -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", *(double *)&self->_startLocation.signalEnvironmentType);
  return result;
}

- (void)updateMetadata
{
  int v3;
  void *i;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  signed int v12;
  double v13;
  NSMutableDictionary *obj;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_modulesDict;
  v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v3 = 0;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v6 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v5), "metadata");
        if (v6)
        {
          v7 = v6;
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(_QWORD *)v18 != v10)
                  objc_enumerationMutation(v7);
                -[NSMutableDictionary setValue:forKey:](self->_metadata, "setValue:forKey:", objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j)), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j));
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v9);
          }
        }
        v12 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v5), "getSampleCount");
        if (v3 <= v12)
          v3 = v12;
      }
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
    v13 = (double)v3;
  }
  else
  {
    v13 = 0.0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13 / (*(double *)&self->_startLocation.signalEnvironmentType - self->_startLocation.ellipsoidalAltitude)), CFSTR("ActiveSamplePerSeconds"));
}

- (NSDictionary)metadata
{
  -[CLWorkoutRecording updateMetadata](self, "updateMetadata");
  return &self->_metadata->super;
}

- (NSArray)recordingURLs
{
  NSURL *workingDirectory;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t i;
  __int128 v6;
  void **v7;
  NSURL *v8;
  NSObject *v9;
  const char *v10;
  char *v11;
  uint64_t v13;
  void *__p[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSURL *v19;
  _BYTE buf[12];
  char v21;

  workingDirectory = self->_workingDirectory;
  if (!workingDirectory)
    return 0;
  sub_1015A2E04(buf, (char *)-[NSURL fileSystemRepresentation](workingDirectory, "fileSystemRepresentation"));
  sub_1015A2E04(__p, "msl");
  sub_101893544((uint64_t *)buf, (uint64_t *)__p, &v16);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  if (v21 < 0)
    operator delete(*(void **)buf);
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v17 - v16) >> 3));
  v4 = v16;
  for (i = v17; v4 != i; v4 += 24)
  {
    if (*(char *)(v4 + 23) < 0)
    {
      sub_100115CE4(__p, *(void **)v4, *(_QWORD *)(v4 + 8));
    }
    else
    {
      v6 = *(_OWORD *)v4;
      v15 = *(_QWORD *)(v4 + 16);
      *(_OWORD *)__p = v6;
    }
    if (v15 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    v8 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7), 0);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v9 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding file to be sent: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v18 = 138412290;
      v19 = v8;
      LODWORD(v13) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Adding file to be sent: %@", &v18, v13);
      v11 = (char *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording recordingURLs]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[NSMutableArray addObject:](v3, "addObject:", v8);
    if (SHIBYTE(v15) < 0)
      operator delete(__p[0]);
  }
  *(_QWORD *)buf = &v16;
  sub_100259608((void ***)buf);
  return &v3->super;
}

- (void)setupListeners
{
  NSMutableDictionary *modulesDict;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  modulesDict = self->_modulesDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(modulesDict);
        objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i)), "setupListener");
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)teardownListeners
{
  NSMutableDictionary *modulesDict;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[1640];
  _BYTE v18[128];

  -[CLWorkoutRecording updateMetadata](self, "updateMetadata");
  -[CLWorkoutRecording releaseBlocks](self, "releaseBlocks");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  modulesDict = self->_modulesDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(modulesDict);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", v8), "teardownListeners");

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

  self->_modulesDict = 0;
  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6D60);
  v9 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Tearing down listeners.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v12[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Tearing down listeners.", v12, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording teardownListeners]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
}

- (void)recordWorkoutSessionPriors:(const void *)a3
{
  WriterManager *ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD v12[452];
  char v13;

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && *((_QWORD *)a3 + 10))
  {
    sub_1015EB864(v12);
    -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v13 |= 1u;
    v12[77] = v6;
    sub_101603D68((uint64_t)v12);
    sub_10163A818(v12[449]);
    v7 = *((_QWORD *)a3 + 6);
    v8 = *((_QWORD *)a3 + 7);
    if (v8 == v7)
      v9 = 0;
    else
      v9 = *(_QWORD *)(v7 + 8 * (*((_QWORD *)a3 + 9) / 0x18uLL)) + 168 * (*((_QWORD *)a3 + 9) % 0x18uLL);
    if (v8 == v7)
    {
      v11 = 0;
    }
    else
    {
      v10 = *((_QWORD *)a3 + 10) + *((_QWORD *)a3 + 9);
      v11 = *(_QWORD *)(v7 + 8 * (v10 / 0x18)) + 168 * (v10 % 0x18);
    }
    if (v9 != v11)
      sub_10163ACEC();
    sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v12);
    sub_1015EE304((PB::Base *)v12);
  }
}

- (void)writeStrideCalBins
{
  WriterManager *ptr;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint8_t *v52;
  id v53;
  double v54;
  double v55;
  id v56;
  id v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[77];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  int v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  int v80;
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  int v88;
  _BYTE v89[128];

  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !LOBYTE(self->_fFileTimeInterval))
  {
    v56 = objc_msgSend(-[CLWorkoutRecordingDelegate vendor](self->_delegate, "vendor"), "proxyForService:", CFSTR("CLStepCountNotifier"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = objc_msgSend(v56, "syncgetCopyRawSpeedToKValueBins");
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v69;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v69 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v6);
          sub_1015EB864(v63);
          -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v67 |= 1u;
          v64 = v8;
          sub_1016055A0((uint64_t)v63);
          v9 = v66;
          objc_msgSend(v7, "begin");
          *(_BYTE *)(v9 + 40) |= 1u;
          *(_QWORD *)(v9 + 8) = v10;
          v11 = v66;
          objc_msgSend(v7, "end");
          *(_BYTE *)(v11 + 40) |= 2u;
          *(_QWORD *)(v11 + 16) = v12;
          v13 = v66;
          objc_msgSend(v7, "valueOut");
          *(_BYTE *)(v13 + 40) |= 4u;
          *(_QWORD *)(v13 + 24) = v14;
          v15 = v66;
          v16 = objc_msgSend(v7, "state");
          *(_BYTE *)(v15 + 40) |= 0x10u;
          *(_DWORD *)(v15 + 36) = v16;
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D6D60);
          v17 = qword_10229FE38;
          if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
          {
            v18 = *(_QWORD *)(v66 + 8);
            v19 = *(_QWORD *)(v66 + 16);
            v20 = *(_QWORD *)(v66 + 24);
            v21 = *(_DWORD *)(v66 + 36);
            *(_DWORD *)buf = 134218752;
            v82 = v18;
            v83 = 2048;
            v84 = v19;
            v85 = 2048;
            v86 = v20;
            v87 = 1024;
            v88 = v21;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: RawSpeedToKValue entry,begin,%f,end,%f,kValue,%f,state,%d", buf, 0x26u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE30 != -1)
              dispatch_once(&qword_10229FE30, &stru_1021D6D60);
            v22 = *(_QWORD *)(v66 + 8);
            v23 = *(_QWORD *)(v66 + 16);
            v24 = *(_QWORD *)(v66 + 24);
            v25 = *(_DWORD *)(v66 + 36);
            v73 = 134218752;
            v74 = v22;
            v75 = 2048;
            v76 = v23;
            v77 = 2048;
            v78 = v24;
            v79 = 1024;
            v80 = v25;
            LODWORD(v54) = 38;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecording: RawSpeedToKValue entry,begin,%f,end,%f,kValue,%f,state,%d", COERCE_DOUBLE(&v73), v54, v55, (_DWORD)v56);
            v27 = (uint8_t *)v26;
            sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v26);
            if (v27 != buf)
              free(v27);
          }
          sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v63);
          sub_1015EE304((PB::Base *)v63);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
        v4 = v28;
      }
      while (v28);
    }
    v57 = objc_msgSend(v56, "syncgetCopyStepCadenceToStrideLengthBins");
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v29 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v60;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v60 != v30)
            objc_enumerationMutation(v57);
          v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v31);
          sub_1015EB864(v63);
          -[CLWorkoutRecording makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v67 |= 1u;
          v64 = v33;
          sub_101605794((uint64_t)v63);
          v34 = v65;
          objc_msgSend(v32, "begin");
          *(_BYTE *)(v34 + 40) |= 1u;
          *(_QWORD *)(v34 + 8) = v35;
          v36 = v65;
          objc_msgSend(v32, "end");
          *(_BYTE *)(v36 + 40) |= 2u;
          *(_QWORD *)(v36 + 16) = v37;
          v38 = v65;
          objc_msgSend(v32, "valueOut");
          *(_BYTE *)(v38 + 40) |= 4u;
          *(_QWORD *)(v38 + 24) = v39;
          v40 = v65;
          v41 = objc_msgSend(v32, "state");
          *(_BYTE *)(v40 + 40) |= 0x10u;
          *(_DWORD *)(v40 + 36) = v41;
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D6D60);
          v42 = qword_10229FE38;
          if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
          {
            v43 = *(_QWORD *)(v65 + 8);
            v44 = *(_QWORD *)(v65 + 16);
            v45 = *(_QWORD *)(v65 + 24);
            v46 = *(_DWORD *)(v65 + 36);
            *(_DWORD *)buf = 134218752;
            v82 = v43;
            v83 = 2048;
            v84 = v44;
            v85 = 2048;
            v86 = v45;
            v87 = 1024;
            v88 = v46;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: StepCadenceToStrideLength entry,begin,%f,end,%f,strideLength,%f,state,%d", buf, 0x26u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE30 != -1)
              dispatch_once(&qword_10229FE30, &stru_1021D6D60);
            v47 = *(_QWORD *)(v65 + 8);
            v48 = *(_QWORD *)(v65 + 16);
            v49 = *(_QWORD *)(v65 + 24);
            v50 = *(_DWORD *)(v65 + 36);
            v73 = 134218752;
            v74 = v47;
            v75 = 2048;
            v76 = v48;
            v77 = 2048;
            v78 = v49;
            v79 = 1024;
            v80 = v50;
            LODWORD(v54) = 38;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "CLWorkoutRecording: StepCadenceToStrideLength entry,begin,%f,end,%f,strideLength,%f,state,%d", COERCE_DOUBLE(&v73), v54, v55, (_DWORD)v56);
            v52 = (uint8_t *)v51;
            sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v51);
            if (v52 != buf)
              free(v52);
          }
          sub_1015E38D8((uint64_t)self->_writer.__ptr_, (uint64_t)v63);
          sub_1015EE304((PB::Base *)v63);
          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        v53 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        v29 = v53;
      }
      while (v53);
    }

  }
}

- (void)recordWeatherData:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  double v9;
  id v10;
  float v11;
  double v12;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  double v20;
  id v21;
  float v22;
  double v23;
  float v24;
  const char *v25;
  uint8_t *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  id v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;

  if (a3 && !BYTE1(self->_fFileTimeInterval))
  {
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v5 = qword_10229FE38;
    if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a3, "timestamp");
      v7 = v6;
      objc_msgSend(a3, "weatherPressure");
      v9 = v8;
      v10 = objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String");
      objc_msgSend(a3, "temperature");
      v12 = v11;
      objc_msgSend(a3, "feelsLikeTemperature");
      *(_DWORD *)buf = 134350082;
      v38 = v7;
      v39 = 2048;
      v40 = v9;
      v41 = 2080;
      v42 = v10;
      v43 = 2048;
      v44 = v12;
      v45 = 2048;
      v46 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WeatherDataUpdate,timestamp,%{public}f,weatherPressure,%f,precipitationType,%s,temperature,%f,feelsLikeTemperature,%f", buf, 0x34u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v16 = qword_10229FE38;
      objc_msgSend(a3, "timestamp");
      v18 = v17;
      objc_msgSend(a3, "weatherPressure");
      v20 = v19;
      v21 = objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String");
      objc_msgSend(a3, "temperature");
      v23 = v22;
      objc_msgSend(a3, "feelsLikeTemperature");
      v27 = 134350082;
      v28 = v18;
      v29 = 2048;
      v30 = v20;
      v31 = 2080;
      v32 = v21;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = v24;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 0, "WeatherDataUpdate,timestamp,%{public}f,weatherPressure,%f,precipitationType,%s,temperature,%f,feelsLikeTemperature,%f", &v27, 52);
      v26 = (uint8_t *)v25;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording recordWeatherData:]", "%s\n", v25);
      if (v26 != buf)
        free(v26);
    }
    objc_msgSend(a3, "timestamp");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("WeatherDataTimestamp"));
    objc_msgSend(a3, "weatherPressure");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), CFSTR("WeatherDataPressure"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String")), CFSTR("WeatherDataPrecipitationType"));
    objc_msgSend(a3, "temperature");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1011A2E1C(v14)), CFSTR("WeatherDataTemperature"));
    objc_msgSend(a3, "feelsLikeTemperature");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1011A2E1C(v15)), CFSTR("WeatherDataFeelsLikeTemperature"));
  }
}

- (double)makeSafeCFAbsoluteTime:(double)a3
{
  if (a3 == 0.0)
    return 0.0;
  else
    return self->_privacyTimeOffset + a3;
}

- (void)recordWorkoutEffort:(const Result *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  int v17;
  const char *v18;
  uint8_t *v19;
  double v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;

  if (qword_10229FE30 != -1)
    dispatch_once(&qword_10229FE30, &stru_1021D6D60);
  v5 = qword_10229FE38;
  if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)a3;
    v7 = *((_QWORD *)a3 + 1);
    v8 = *((float *)a3 + 4);
    v9 = *((float *)a3 + 5);
    v10 = *((unsigned __int8 *)a3 + 24);
    *(_DWORD *)buf = 134219008;
    v32 = v6;
    v33 = 2048;
    v34 = v7;
    v35 = 2048;
    v36 = v8;
    v37 = 2048;
    v38 = v9;
    v39 = 1024;
    v40 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "WorkoutRecorder CM Effort, Writing estimated workout effort to workout recorder startTime,%f,endTime,%f,estimatedWorkoutEffort,%f,estimatedWorkoutEffortPreBiasCorrection,%f,isTransient,%d", buf, 0x30u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE30 != -1)
      dispatch_once(&qword_10229FE30, &stru_1021D6D60);
    v13 = *(_QWORD *)a3;
    v14 = *((_QWORD *)a3 + 1);
    v15 = *((float *)a3 + 4);
    v16 = *((float *)a3 + 5);
    v17 = *((unsigned __int8 *)a3 + 24);
    v21 = 134219008;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    v25 = 2048;
    v26 = v15;
    v27 = 2048;
    v28 = v16;
    v29 = 1024;
    v30 = v17;
    LODWORD(v20) = 48;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "WorkoutRecorder CM Effort, Writing estimated workout effort to workout recorder startTime,%f,endTime,%f,estimatedWorkoutEffort,%f,estimatedWorkoutEffortPreBiasCorrection,%f,isTransient,%d", COERCE_DOUBLE(&v21), v20);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutRecording recordWorkoutEffort:]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)a3), CFSTR("estimatedWorkoutEffortStartTime"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)a3 + 1)), CFSTR("estimatedWorkoutEffortEndTime"));
  LODWORD(v11) = *((_DWORD *)a3 + 4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11), CFSTR("estimatedWorkoutEffort"));
  LODWORD(v12) = *((_DWORD *)a3 + 5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12), CFSTR("estimatedWorkoutEffortPreBiasCorrection"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)a3 + 24)), CFSTR("estimatedWorkoutEffortIsTransient"));
}

- (void)deleteWorkingDirectory
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;

  if (self->_workingDirectory)
  {
    v5 = 0;
    -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", self->_workingDirectory, &v5);
    if (v5)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D6D60);
      v2 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unable to delete recording working directory, error: %{public}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D6D60);
        v6 = 138543362;
        v7 = v5;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "Unable to delete recording working directory, error: %{public}@", &v6, 12);
        v4 = (uint8_t *)v3;
        sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutRecording deleteWorkingDirectory]", "%s\n", v3);
        if (v4 != buf)
          free(v4);
      }
    }
  }
}

- (CLDaemonLocation)getStartLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].speedAccuracy + 4);
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)((char *)&self[1].verticalAccuracy + 4);
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)((char *)&self[1].courseAccuracy + 4);
  v4 = *(_OWORD *)(&self->fromSimulationController + 4);
  *(_OWORD *)&retstr->altitude = *(_OWORD *)(&self->signalEnvironmentType + 1);
  *(_OWORD *)&retstr->speed = v4;
  v5 = *(_OWORD *)((char *)&self[1].horizontalAccuracy + 4);
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->course = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].coordinate
                                                                                               + 4);
  *(_OWORD *)&retstr->timestamp = v5;
  v6 = *(_OWORD *)&self->integrity;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)((char *)&self->rawCoordinate.longitude + 4);
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self[1].confidence;
  return self;
}

- (void)setupModuleWriters
{
  NSMutableDictionary *modulesDict;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  WriterManager *ptr;
  __shared_weak_count *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  modulesDict = self->_modulesDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(modulesDict);
        v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), ptr);
        cntrl = self->_writer.__cntrl_;
        ptr = self->_writer.__ptr_;
        v15 = cntrl;
        if (cntrl)
        {
          v9 = (unint64_t *)((char *)cntrl + 8);
          do
            v10 = __ldxr(v9);
          while (__stxr(v10 + 1, v9));
        }
        objc_msgSend(v7, "setWriter:", &ptr);
        v11 = (std::__shared_weak_count *)v15;
        if (v15)
        {
          v12 = (unint64_t *)((char *)v15 + 8);
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, ptr);
    }
    while (v4);
  }
}

- (void)setMotionStateFunction:(id)a3
{
  const void *v5;

  v5 = *(const void **)&self->_startLocation.floor;
  if (v5)
    _Block_release(v5);
  *(_QWORD *)&self->_startLocation.floor = _Block_copy(a3);
}

- (void)releaseBlocks
{
  _Block_release(*(const void **)&self->_startLocation.floor);
  _Block_release(*(const void **)&self->_startLocation.referenceFrame);
}

- (double)startTime
{
  return self->_startLocation.ellipsoidalAltitude;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_recordingType.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_recordingType.__r_.__value_.var0.var1.__data_);
  sub_100261F44((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *(_OWORD *)((char *)self + 88) = 0uLL;
  *((_QWORD *)self + 10) = 0;
  *((_DWORD *)self + 31) = 0xFFFF;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  __asm { FMOV            V1.2D, #-1.0 }
  *((_OWORD *)self + 9) = xmmword_101BAFC90;
  *((_OWORD *)self + 10) = _Q1;
  *((_OWORD *)self + 11) = _Q1;
  *((_OWORD *)self + 12) = _Q1;
  *((_DWORD *)self + 52) = 0;
  *(_QWORD *)((char *)self + 212) = 0xBFF0000000000000;
  *(_QWORD *)((char *)self + 228) = 0;
  *(_QWORD *)((char *)self + 220) = 0;
  *((_DWORD *)self + 59) = 0;
  *((_QWORD *)self + 30) = 0xBFF0000000000000;
  *((_DWORD *)self + 62) = 0x7FFFFFFF;
  *(_QWORD *)((char *)self + 260) = 0;
  *((_BYTE *)self + 276) = 0;
  *(_QWORD *)((char *)self + 252) = 0;
  *(_QWORD *)((char *)self + 268) = 0;
  return self;
}

@end

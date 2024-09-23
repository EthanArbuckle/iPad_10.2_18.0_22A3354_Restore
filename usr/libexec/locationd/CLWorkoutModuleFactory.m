@implementation CLWorkoutModuleFactory

- (id)initFor:(int)a3
{
  CLWorkoutModuleFactory *v4;
  NSObject *v5;
  vector<ModuleName, std::allocator<ModuleName>> *p_moduleNames;
  uint64_t *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  _WORD v17[8];
  objc_super v18;
  uint8_t buf[1640];

  v18.receiver = self;
  v18.super_class = (Class)CLWorkoutModuleFactory;
  v4 = -[CLWorkoutModuleFactory init](&v18, "init");
  if (v4)
  {
    if (a3 == 1)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D8070);
      v8 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Factory: initFor phone", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D8070);
        v17[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Factory: initFor phone", v17, 2);
        v14 = (uint8_t *)v13;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v13);
        if (v14 != buf)
          free(v14);
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_102310208;
    }
    else if (a3)
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D8070);
      v9 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Factory: initFor default", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D8070);
        v17[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Factory: initFor default", v17, 2);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_102310220;
    }
    else
    {
      if (qword_10229FE30 != -1)
        dispatch_once(&qword_10229FE30, &stru_1021D8070);
      v5 = qword_10229FE38;
      if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Factory: initFor watch", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D8070);
        v17[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 2, "Factory: initFor watch", v17, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutModuleFactory initFor:]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      p_moduleNames = &v4->_moduleNames;
      v7 = &qword_1023101F0;
    }
    if (p_moduleNames != (vector<ModuleName, std::allocator<ModuleName>> *)v7)
      sub_1018E2F54(p_moduleNames, (char *)*v7, (char *)v7[1], (v7[1] - *v7) >> 2);
  }
  return v4;
}

- (id)createNewModules:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5
{
  int *end;
  int *begin;
  int64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_recordingType;
  unsigned int *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t **v21;
  _DWORD *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  unsigned int *v34;
  id v37;
  void *v38;
  void *v39;
  char *v40;
  unsigned int *v41;
  unsigned int *v42;
  _DWORD v43[4];
  uint8_t buf[4];
  int v45;
  _OWORD v46[6];
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[6];
  __int128 __p;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;

  v37 = objc_alloc_init((Class)NSMutableDictionary);
  v38 = 0;
  v39 = 0;
  v40 = 0;
  begin = self->_moduleNames.__begin_;
  end = self->_moduleNames.__end_;
  v9 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v9 < 0)
      sub_100259694();
    v10 = (char *)operator new((char *)end - (char *)begin);
    v11 = &v10[4 * (v9 >> 2)];
    v38 = v10;
    v40 = v11;
    memmove(v10, begin, v9);
    v39 = v11;
  }
  v12 = *(_OWORD *)&a5->privacyTimeOffset;
  v53[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  v53[3] = v12;
  v13 = *(_OWORD *)a5->workoutRecorderSessionId;
  v53[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  v53[5] = v13;
  v14 = *(_OWORD *)&a5->hasSyncInWatch;
  v53[0] = *(_OWORD *)&a5->disableAveragedALS;
  v53[1] = v14;
  p_recordingType = &a5->recordingType;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_100115CE4(&__p, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    __p = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    v55 = *((_QWORD *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
  }
  v56 = *(_OWORD *)&a5->recordingType.__r_.var0;
  v57 = *(_OWORD *)&a5[1].disableAveragedALS;
  v58 = *(_OWORD *)&a5[1].hasSyncInWatch;
  v59 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  -[CLWorkoutModuleFactory removeDisableModules:setting:](self, "removeDisableModules:setting:", &v38, v53);
  if (SHIBYTE(v55) < 0)
    operator delete((void *)__p);
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }
  v16 = v41;
  v34 = v42;
  if (v41 != v42)
  {
    do
    {
      v17 = *v16;
      v18 = &qword_1023101E0;
      v19 = qword_1023101E0;
      if (qword_1023101E0)
      {
        while (1)
        {
          while (1)
          {
            v18 = (uint64_t *)v19;
            v20 = *(_DWORD *)(v19 + 32);
            if (v20 <= (int)v17)
              break;
            v19 = *v18;
            v21 = (uint64_t **)v18;
            if (!*v18)
              goto LABEL_20;
          }
          if (v20 >= (int)v17)
            break;
          v19 = v18[1];
          if (!v19)
          {
            v21 = (uint64_t **)(v18 + 1);
            goto LABEL_20;
          }
        }
      }
      else
      {
        v21 = (uint64_t **)&qword_1023101E0;
LABEL_20:
        v22 = operator new(0x30uLL);
        v22[8] = v17;
        *((_QWORD *)v22 + 5) = 0;
        sub_1018E2EF8((uint64_t)v18, v21, (uint64_t *)v22);
        v18 = (uint64_t *)v22;
      }
      v23 = objc_alloc((Class)v18[5]);
      v24 = *(_OWORD *)&a5->privacyTimeOffset;
      v46[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
      v46[3] = v24;
      v25 = *(_OWORD *)a5->workoutRecorderSessionId;
      v46[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
      v46[5] = v25;
      v26 = *(_OWORD *)&a5->hasSyncInWatch;
      v46[0] = *(_OWORD *)&a5->disableAveragedALS;
      v46[1] = v26;
      if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
      {
        sub_100115CE4(&v47, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
      }
      else
      {
        v47 = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
        v48 = *((_QWORD *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
      }
      v27 = *(_OWORD *)&a5[1].disableAveragedALS;
      v49 = *(_OWORD *)&a5->recordingType.__r_.var0;
      v50 = v27;
      v28 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
      v51 = *(_OWORD *)&a5[1].hasSyncInWatch;
      v52 = v28;
      v29 = objc_msgSend(v23, "initWithDelegate:universeCopy:settings:", a3, a4, v46);
      if (SHIBYTE(v48) < 0)
        operator delete((void *)v47);
      objc_msgSend(v37, "setObject:forKey:", v29, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17));
      if (v29)
      {
        objc_msgSend(v29, "setPrivacyTimeOffset:", a5->privacyTimeOffset);
      }
      else
      {
        if (qword_10229FE30 != -1)
          dispatch_once(&qword_10229FE30, &stru_1021D8070);
        v30 = qword_10229FE38;
        if (os_log_type_enabled((os_log_t)qword_10229FE38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v45 = v17;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "CLWorkoutModuleFactory: the added module is invalid: %d", buf, 8u);
        }
        if (sub_1001BFF7C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE30 != -1)
            dispatch_once(&qword_10229FE30, &stru_1021D8070);
          v43[0] = 67109120;
          v43[1] = v17;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE38, 16, "CLWorkoutModuleFactory: the added module is invalid: %d", v43);
          v32 = (uint8_t *)v31;
          sub_100512490("Generic", 1, 0, 0, "-[CLWorkoutModuleFactory createNewModules:universe:settings:]", "%s\n", v31);
          if (v32 != buf)
            free(v32);
        }
      }
      ++v16;
    }
    while (v16 != v34);
    v16 = v41;
  }
  if (v16)
  {
    v42 = v16;
    operator delete(v16);
  }
  return v37;
}

- (id)generateTheRecording:(id)a3 universe:(id)a4 settings:(SettingStructure *)a5
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_recordingType;
  id v13;
  CLWorkoutRecording *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CLWorkoutRecording *v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[6];
  __int128 __p;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v9 = *(_OWORD *)&a5->privacyTimeOffset;
  v36[2] = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  v36[3] = v9;
  v10 = *(_OWORD *)a5->workoutRecorderSessionId;
  v36[4] = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  v36[5] = v10;
  v11 = *(_OWORD *)&a5->hasSyncInWatch;
  v36[0] = *(_OWORD *)&a5->disableAveragedALS;
  v36[1] = v11;
  p_recordingType = &a5->recordingType;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_100115CE4(&__p, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    __p = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    v38 = *((_QWORD *)&a5->recordingType.__r_.__value_.var0.var1 + 2);
  }
  v39 = *(_OWORD *)&a5->recordingType.__r_.var0;
  v40 = *(_OWORD *)&a5[1].disableAveragedALS;
  v41 = *(_OWORD *)&a5[1].hasSyncInWatch;
  v42 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  v13 = -[CLWorkoutModuleFactory createNewModules:universe:settings:](self, "createNewModules:universe:settings:", a3, a4, v36);
  if (SHIBYTE(v38) < 0)
    operator delete((void *)__p);
  v14 = [CLWorkoutRecording alloc];
  v15 = *(_OWORD *)&a5->privacyTimeOffset;
  v26 = *(_OWORD *)&a5->kPrivacyPressureMaxOffset;
  v27 = v15;
  v16 = *(_OWORD *)a5->workoutRecorderSessionId;
  v28 = *(_OWORD *)&a5->minimumPowerAssertionTimeSeconds;
  v29 = v16;
  v17 = *(_OWORD *)&a5->hasSyncInWatch;
  v24 = *(_OWORD *)&a5->disableAveragedALS;
  v25 = v17;
  if (*((char *)&a5->recordingType.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_100115CE4(&v30, a5->recordingType.__r_.__value_.var0.var1.__data_, a5->recordingType.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    v30 = *(_OWORD *)p_recordingType->__r_.__value_.var0.var0.__data_;
    v31 = *((_QWORD *)&p_recordingType->__r_.__value_.var0.var1 + 2);
  }
  v18 = *(_OWORD *)&a5[1].disableAveragedALS;
  v32 = *(_OWORD *)&a5->recordingType.__r_.var0;
  v33 = v18;
  v19 = *(_OWORD *)&a5[1].kPrivacyPressureMaxOffset;
  v34 = *(_OWORD *)&a5[1].hasSyncInWatch;
  v35 = v19;
  v20 = -[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:](v14, "initWithDelegate:universe:moduleDictionary:setting:", a3, a4, v13, &v24);
  if (SHIBYTE(v31) < 0)
    operator delete((void *)v30);
  v21 = objc_msgSend(v13, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 14, v24, v25, v26, v27, v28, v29));
  if (v21)
  {
    objc_msgSend(v21, "setGetStartLocation:", -[CLWorkoutRecording getLocationBlock](v20, "getLocationBlock"));
    -[CLWorkoutRecording setMotionStateFunction:](v20, "setMotionStateFunction:", objc_msgSend(v21, "getRecordEventBlock"));
    if (a5->hasSyncInWatch)
      objc_msgSend(v21, "setWorkoutCount:", 1);
    v22 = objc_msgSend(v13, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 9));
    if (v22)
      objc_msgSend(v21, "setBlockUpdateIsCycling:", objc_msgSend(v22, "getBlockSetIsCycling"));
  }

  return v20;
}

- (vector<ModuleName,)removeDisableModules:(CLWorkoutModuleFactory *)self setting:(SEL)a3
{
  int *begin;
  int *end;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  int *v14;
  int *v15;
  int *v16;
  int *v17;
  int *v18;
  int *v19;
  int *v20;
  int *v21;
  int *v22;
  int *v23;
  int *v24;
  int *v25;
  int *v26;
  int *v27;
  int *v28;
  int *v29;
  int *v30;
  int *v31;
  int *v32;
  int *v33;
  int *v34;
  int *v35;
  int *v36;
  int *v37;
  int *v38;
  int *v39;
  int *v40;
  vector<ModuleName, std::allocator<ModuleName>> *result;
  int *v42;
  int *v43;
  int v44;

  if (a5->accelIntervalSeconds <= 0.0)
  {
    begin = a4->__begin_;
    end = a4->__end_;
    v44 = 0;
    v10 = sub_1018E2E18(begin, end, &v44);
    if (a4->__end_ != v10)
      a4->__end_ = v10;
  }
  if (a5->disableAveragedALS)
  {
    v11 = a4->__begin_;
    v12 = a4->__end_;
    v44 = 2;
    v13 = sub_1018E2E18(v11, v12, &v44);
    if (a4->__end_ != v13)
      a4->__end_ = v13;
  }
  if (a5->disableHeartRate)
  {
    v14 = a4->__begin_;
    v15 = a4->__end_;
    v44 = 12;
    v16 = sub_1018E2E18(v14, v15, &v44);
    if (a4->__end_ != v16)
      a4->__end_ = v16;
  }
  if (a5->rotationRateIntervalSeconds <= 0.0)
  {
    v17 = a4->__begin_;
    v18 = a4->__end_;
    v44 = 6;
    v19 = sub_1018E2E18(v17, v18, &v44);
    if (a4->__end_ != v19)
      a4->__end_ = v19;
  }
  if (a5->disableHealthKitInfo)
  {
    v20 = a4->__begin_;
    v21 = a4->__end_;
    v44 = 11;
    v22 = sub_1018E2E18(v20, v21, &v44);
    if (a4->__end_ != v22)
      a4->__end_ = v22;
  }
  if (a5->magIntervalSeconds <= 0.0)
  {
    v23 = a4->__begin_;
    v24 = a4->__end_;
    v44 = 13;
    v25 = sub_1018E2E18(v23, v24, &v44);
    if (a4->__end_ != v25)
      a4->__end_ = v25;
  }
  if (a5->disableMotionState)
  {
    v26 = a4->__begin_;
    v27 = a4->__end_;
    v44 = 14;
    v28 = sub_1018E2E18(v26, v27, &v44);
    if (a4->__end_ != v28)
      a4->__end_ = v28;
  }
  if (a5->disableBodyMetrics && a5->disableMeanMaxMets)
  {
    v29 = a4->__begin_;
    v30 = a4->__end_;
    v44 = 4;
    v31 = sub_1018E2E18(v29, v30, &v44);
    if (a4->__end_ != v31)
      a4->__end_ = v31;
  }
  if (a5->disableOdometer)
  {
    v32 = a4->__begin_;
    v33 = a4->__end_;
    v44 = 15;
    v34 = sub_1018E2E18(v32, v33, &v44);
    if (a4->__end_ != v34)
      a4->__end_ = v34;
  }
  if (a5->disablePressure)
  {
    v35 = a4->__begin_;
    v36 = a4->__end_;
    v44 = 16;
    v37 = sub_1018E2E18(v35, v36, &v44);
    if (a4->__end_ != v37)
      a4->__end_ = v37;
  }
  if (a5->disableWatchOrientation && a5->disableWatchOnWristStatus)
  {
    v38 = a4->__begin_;
    v39 = a4->__end_;
    v44 = 18;
    v40 = sub_1018E2E18(v38, v39, &v44);
    if (a4->__end_ != v40)
      a4->__end_ = v40;
  }
  result = (vector<ModuleName, std::allocator<ModuleName>> *)a4->__begin_;
  if (a5->disableWifiScans)
  {
    v42 = a4->__end_;
    v44 = 19;
    v43 = sub_1018E2E18(result, v42, &v44);
    result = (vector<ModuleName, std::allocator<ModuleName>> *)a4->__begin_;
    if (a4->__end_ != v43)
      a4->__end_ = v43;
  }
  else
  {
    v43 = a4->__end_;
  }
  retstr->__begin_ = (int *)result;
  retstr->__end_ = v43;
  retstr->__end_cap_.__value_ = a4->__end_cap_.__value_;
  a4->__begin_ = 0;
  a4->__end_ = 0;
  a4->__end_cap_.__value_ = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLWorkoutModuleFactory;
  -[CLWorkoutModuleFactory dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
  int *begin;

  begin = self->_moduleNames.__begin_;
  if (begin)
  {
    self->_moduleNames.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

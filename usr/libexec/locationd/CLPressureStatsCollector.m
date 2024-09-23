@implementation CLPressureStatsCollector

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
  if (qword_102307E30 != -1)
    dispatch_once(&qword_102307E30, &stru_102181DE8);
  return (id)qword_102307E28;
}

+ (BOOL)isSupported
{
  if (qword_102307E40 != -1)
    dispatch_once(&qword_102307E40, &stru_102181E08);
  return byte_102307E38;
}

- (CLPressureStatsCollector)init
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v12;
  uint8_t *v13;
  objc_super v14;
  __int16 v15;
  uint64_t v16;
  uint8_t buf[1640];

  v16 = 86400 * ((uint64_t)CFAbsoluteTimeGetCurrent() / 86400) + 86400;
  v3 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 936))(v3);
  v4 = sub_1001FD94C();
  if (byte_102307E27 >= 0)
    v5 = (const char *)&qword_102307E10;
  else
    v5 = (const char *)qword_102307E10;
  if ((sub_10052655C(v4, v5, &v16) & 1) == 0)
  {
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102181E28);
    v6 = qword_10229FD78;
    if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD70 != -1)
        dispatch_once(&qword_10229FD70, &stru_102181E28);
      v15 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", &v15, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector init]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v7 = sub_1001FD94C();
    if (byte_102307E27 >= 0)
      v8 = (const char *)&qword_102307E10;
    else
      v8 = (const char *)qword_102307E10;
    sub_1005282E8(v7, v8, &v16);
    v9 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 944))(v9);
    v10 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 936))(v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)CLPressureStatsCollector;
  return -[CLPressureStatsCollector initWithInboundProtocol:outboundProtocol:](&v14, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLPressureStatsCollectorProtocol, &OBJC_PROTOCOL___CLPressureStatsCollectorClientProtocol);
}

- (void)beginService
{
  -[CLPressureStatsCollector universe](self, "universe");
  sub_100647FA8();
}

- (void)endService
{
  -[CLPressureStatsCollector disableCollection](self, "disableCollection");
}

- (void)enableCollection
{
  uint64_t v3;

  if (sub_1000824CC())
  {
    v3 = sub_1000824CC();
    sub_1000A4FD8(v3, 0, (uint64_t)self->fPressureDispatcher.__ptr_.__value_, 0.0399999991);
  }
}

- (void)disableCollection
{
  uint64_t v3;

  if (sub_1000824CC())
  {
    v3 = sub_1000824CC();
    sub_1000A4A6C(v3, 0, (uint64_t)self->fPressureDispatcher.__ptr_.__value_);
  }
}

- (void)onPressureData:(const Sample *)a3
{
  CLK2Detector *p_fK2Detector;
  CLRobustSlopeEstimator *p_fSlopeEstimator;
  _QWORD *begin;
  _BYTE *end;
  unint64_t v9;
  _DWORD *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  float v32;
  float v33;
  CLPressureStatsCollector *v34;
  float v35;
  float v36;
  int v37;
  int v38;
  unsigned int v39;
  __int128 v40;
  int v41;
  char v42;
  uint64_t Current;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  std::string *v49;
  CFAbsoluteTime v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  std::string *v57;
  CLPressureStatsCollector *v58;
  _DWORD v59[8];
  __int128 v60;
  _BYTE v61[7];
  char v62;
  char v63;
  int64_t size;
  _DWORD v65[8];
  __int128 v66;
  _BYTE v67[7];
  char v68;
  char v69;
  _DWORD v70[2];
  _DWORD v71[16];
  char v72;
  uint64_t v73[6];
  void *v74;
  char *v75;
  char *v76;
  void *__p;
  char *v78;
  char *v79;
  std::string v80;
  std::string __str;

  p_fK2Detector = &self->fK2Detector;
  sub_1011A21CC((uint64_t)p_fK2Detector, (uint64_t)p_fK2Detector, a3->var1.var0 * 1000.0);
  sub_1011A21CC((uint64_t)p_fK2Detector, (uint64_t)&p_fK2Detector->fBufTemperatureRaw, a3->var1.var1);
  p_fSlopeEstimator = &self->fSlopeEstimator;
  sub_100B4B27C((uint64_t)&self->fSlopeEstimator, (__n128 *)a3);
  sub_1011A27F4((uint64_t)p_fK2Detector, a3->var1.var0);
  sub_1011A2810((uint64_t)p_fK2Detector, a3->var1.var1);
  if (sub_1011A2184((uint64_t)p_fK2Detector))
  {
    sub_1011A25C0(p_fK2Detector);
    begin = p_fK2Detector->fFeatures.__begin_;
    end = p_fK2Detector->fFeatures.__end_;
    if ((int)(-1431655765 * ((unint64_t)(end - (_BYTE *)begin) >> 3)) >= 301)
    {
      v58 = self;
      __p = 0;
      v78 = 0;
      v79 = 0;
      v74 = 0;
      v75 = 0;
      v76 = 0;
      if (end != (_BYTE *)begin)
      {
        v9 = 0;
        do
        {
          v10 = (_DWORD *)begin[3 * v9];
          v11 = v78;
          if (v78 >= v79)
          {
            v13 = (char *)__p;
            v14 = (v78 - (_BYTE *)__p) >> 2;
            v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 62)
              goto LABEL_85;
            v16 = v79 - (_BYTE *)__p;
            if ((v79 - (_BYTE *)__p) >> 1 > v15)
              v15 = v16 >> 1;
            if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
              v17 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v17 = v15;
            if (v17)
            {
              v18 = (char *)sub_100260634((uint64_t)&v79, v17);
              v13 = (char *)__p;
              v11 = v78;
            }
            else
            {
              v18 = 0;
            }
            v19 = &v18[4 * v14];
            *(_DWORD *)v19 = *v10;
            v12 = v19 + 4;
            while (v11 != v13)
            {
              v20 = *((_DWORD *)v11 - 1);
              v11 -= 4;
              *((_DWORD *)v19 - 1) = v20;
              v19 -= 4;
            }
            __p = v19;
            v78 = v12;
            v79 = &v18[4 * v17];
            if (v13)
              operator delete(v13);
          }
          else
          {
            *(_DWORD *)v78 = *v10;
            v12 = v11 + 4;
          }
          v78 = v12;
          v21 = *((_QWORD *)p_fK2Detector->fFeatures.__begin_ + 3 * v9);
          v22 = v75;
          if (v75 >= v76)
          {
            v24 = (char *)v74;
            v25 = (v75 - (_BYTE *)v74) >> 2;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 62)
LABEL_85:
              sub_100259694();
            v27 = v76 - (_BYTE *)v74;
            if ((v76 - (_BYTE *)v74) >> 1 > v26)
              v26 = v27 >> 1;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
              v28 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)sub_100260634((uint64_t)&v76, v28);
              v24 = (char *)v74;
              v22 = v75;
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[4 * v25];
            *(_DWORD *)v30 = *(_DWORD *)(v21 + 4);
            v23 = v30 + 4;
            while (v22 != v24)
            {
              v31 = *((_DWORD *)v22 - 1);
              v22 -= 4;
              *((_DWORD *)v30 - 1) = v31;
              v30 -= 4;
            }
            v74 = v30;
            v75 = v23;
            v76 = &v29[4 * v28];
            if (v24)
              operator delete(v24);
          }
          else
          {
            *(_DWORD *)v75 = *(_DWORD *)(v21 + 4);
            v23 = v22 + 4;
          }
          v75 = v23;
          ++v9;
          begin = p_fK2Detector->fFeatures.__begin_;
        }
        while (0xAAAAAAAAAAAAAAABLL * (((char *)p_fK2Detector->fFeatures.__end_ - (char *)begin) >> 3) > v9);
      }
      v32 = sub_100D35A10((uint64_t)&__p);
      v33 = sub_100D35A10((uint64_t)&v74);
      sub_100B4A9B0((uint64_t)p_fSlopeEstimator, 2, (uint64_t)v71);
      v34 = v58;
      *(_DWORD *)((char *)v70 + 3) = 0;
      v70[0] = 0;
      v35 = sub_1011A282C((uint64_t)p_fK2Detector);
      v36 = sub_1011A2838((uint64_t)p_fK2Detector);
      v37 = v71[0];
      v38 = v71[1];
      v39 = -[CLPressureStatsCollector getFlightOfStairsIn24Hr](v58, "getFlightOfStairsIn24Hr");
      sub_100197040();
      sub_10075ACDC((uint64_t)&__str);
      std::string::basic_string(&v80, &__str, 3uLL, 2uLL, (std::allocator<char> *)&size);
      v40 = *(_OWORD *)&v80.__r_.__value_.__l.__data_;
      v70[0] = v80.__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v70 + 3) = *(_DWORD *)((char *)&v80.__r_.__value_.__r.__words[2] + 3);
      v41 = SHIBYTE(v80.__r_.__value_.__r.__words[2]);
      *((_BYTE *)&v80.__r_.__value_.__s + 23) = 0;
      v80.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      v42 = v72;
      *(float *)v65 = v32;
      *(float *)&v65[1] = v33;
      *(float *)&v65[2] = v35;
      *(float *)&v65[3] = v36;
      v65[4] = v37;
      v65[5] = v38;
      v65[6] = v39;
      if (v41 < 0)
      {
        sub_100115CE4(&v66, (void *)v40, *((unint64_t *)&v40 + 1));
      }
      else
      {
        v66 = v40;
        *(_DWORD *)v67 = v70[0];
        *(_DWORD *)&v67[3] = *(_DWORD *)((char *)v70 + 3);
        v68 = v41;
      }
      v69 = v42;
      -[CLPressureStatsCollector saveFeaturesToCache:](v58, "saveFeaturesToCache:", v65);
      if (v68 < 0)
        operator delete((void *)v66);
      -[CLPressureStatsCollector submitAWDMetric](v58, "submitAWDMetric");
      Current = (uint64_t)CFAbsoluteTimeGetCurrent();
      size = 86400 * (Current / 86400) + 86400;
      v44 = sub_1001FD94C();
      if (byte_102307E27 >= 0)
        v45 = (const char *)&qword_102307E10;
      else
        v45 = (const char *)qword_102307E10;
      if (sub_10052655C(v44, v45, &size))
      {
        sub_100D37624((unsigned __int8 *)&v80, "PressureStatsCAEnabledTimestamp", &size, 0);
        size = v80.__r_.__value_.__l.__size_;
        if (qword_10229FD70 != -1)
          dispatch_once(&qword_10229FD70, &stru_102181E28);
        v46 = qword_10229FD78;
        if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v80.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)v80.__r_.__value_.__r.__words + 4) = Current;
          WORD2(v80.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v80.__r_.__value_.__r.__words[1] + 6) = size;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] currentTime,%ld,CAEnabledTime,%ld", (uint8_t *)&v80, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&v80, 0x65CuLL);
          if (qword_10229FD70 != -1)
            dispatch_once(&qword_10229FD70, &stru_102181E28);
          LODWORD(__str.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = Current;
          WORD2(__str.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) = size;
          _os_log_send_and_compose_impl(2, 0, &v80, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] currentTime,%ld,CAEnabledTime,%ld", &__str, 22);
          v57 = (std::string *)v56;
          sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector onPressureData:]", "%s\n", v56);
          if (v57 != &v80)
            free(v57);
          v34 = v58;
        }
        if (size < Current)
        {
          *(float *)v59 = v32;
          *(float *)&v59[1] = v33;
          *(float *)&v59[2] = v35;
          *(float *)&v59[3] = v36;
          v59[4] = v37;
          v59[5] = v38;
          v59[6] = v39;
          if (v41 < 0)
          {
            sub_100115CE4(&v60, (void *)v40, *((unint64_t *)&v40 + 1));
          }
          else
          {
            v60 = v40;
            *(_DWORD *)v61 = v70[0];
            *(_DWORD *)&v61[3] = *(_DWORD *)((char *)v70 + 3);
            v62 = v41;
          }
          v63 = v42;
          -[CLPressureStatsCollector sendCAMetric:](v34, "sendCAMetric:", v59);
          if (v62 < 0)
            operator delete((void *)v60);
        }
      }
      else
      {
        if (qword_10229FD70 != -1)
          dispatch_once(&qword_10229FD70, &stru_102181E28);
        v47 = qword_10229FD78;
        if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v80.__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", (uint8_t *)&v80, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(&v80, 0x65CuLL);
          if (qword_10229FD70 != -1)
            dispatch_once(&qword_10229FD70, &stru_102181E28);
          LOWORD(__str.__r_.__value_.__l.__data_) = 0;
          _os_log_send_and_compose_impl(2, 0, &v80, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", &__str, 2);
          v49 = (std::string *)v48;
          sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector onPressureData:]", "%s\n", v48);
          if (v49 != &v80)
            free(v49);
          v34 = v58;
        }
      }
      v50 = CFAbsoluteTimeGetCurrent();
      size = (uint64_t)v50 + 86400 + 86400 * ((uint64_t)v50 / 86400) - (uint64_t)v50;
      v51 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v51 + 936))(v51);
      v52 = sub_1001FD94C();
      if (byte_102307E27 >= 0)
        v53 = (const char *)&qword_102307E10;
      else
        v53 = (const char *)qword_102307E10;
      sub_1005282E8(v52, v53, &size);
      v54 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v54 + 944))(v54);
      v55 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v55 + 936))(v55);
      -[CLPressureStatsCollector reset](v34, "reset");
      if (v41 < 0)
        operator delete((void *)v40);
      sub_10047F25C(v73);
      if (v74)
      {
        v75 = (char *)v74;
        operator delete(v74);
      }
      if (__p)
      {
        v78 = (char *)__p;
        operator delete(__p);
      }
    }
  }
}

- (void)onDaemonStatus:(const int *)a3 data:(const NotificationData *)a4
{
  int v5;
  NSObject *v6;
  double Current;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  double v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint8_t buf[4];
  _BYTE v28[18];

  if (*a3 == 7)
  {
    v5 = *((unsigned __int8 *)a4 + 9);
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102181E28);
    v6 = qword_10229FD78;
    if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] charging,%d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FD70 != -1)
        dispatch_once(&qword_10229FD70, &stru_102181E28);
      v23 = 67109120;
      LODWORD(v24) = v5;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] charging,%d", &v23);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    if (v5 != self->fCharging)
    {
      self->fCharging = v5;
      Current = CFAbsoluteTimeGetCurrent();
      v8 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 936))(v8);
      if (self->fCharging)
      {
        v22 = 0.0;
        v9 = sub_1001FD94C();
        if (byte_102307D37 >= 0)
          v10 = (const char *)&qword_102307D20;
        else
          v10 = (const char *)qword_102307D20;
        sub_1001FD98C(v9, v10, &v22);
        v11 = (uint64_t)(Current - v22);
        sub_100D37624(buf, "PressureStatsMinLoggingWinInSec", &qword_101C225A8, 0);
        v12 = *(_QWORD *)&v28[4];
        if (qword_10229FD70 != -1)
          dispatch_once(&qword_10229FD70, &stru_102181E28);
        v13 = qword_10229FD78;
        if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v28 = v11;
          *(_WORD *)&v28[8] = 2048;
          *(_QWORD *)&v28[10] = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] timeSinceLastUpdate,%ld,minLoggingWinInSec,%ld", buf, 0x16u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FD70 != -1)
            dispatch_once(&qword_10229FD70, &stru_102181E28);
          v23 = 134218240;
          v24 = v11;
          v25 = 2048;
          v26 = v12;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] timeSinceLastUpdate,%ld,minLoggingWinInSec,%ld", &v23, 22);
          v20 = (uint8_t *)v19;
          sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v19);
          if (v20 != buf)
            free(v20);
        }
        if (v12 <= v11)
        {
          self->fAllowLogging = 1;
          -[CLPressureStatsCollector enableCollection](self, "enableCollection");
          if (qword_10229FD70 != -1)
            dispatch_once(&qword_10229FD70, &stru_102181E28);
          v14 = qword_10229FD78;
          if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Collection enabled", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FD70 != -1)
              dispatch_once(&qword_10229FD70, &stru_102181E28);
            LOWORD(v23) = 0;
            LODWORD(v21) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] Collection enabled", &v23, v21);
            v16 = (uint8_t *)v15;
            sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v15);
            if (v16 != buf)
              free(v16);
          }
        }
      }
      else if (self->fAllowLogging)
      {
        -[CLPressureStatsCollector reset](self, "reset");
      }
    }
  }
}

- (int)getFlightOfStairsIn24Hr
{
  id v3;
  double v5;
  CFAbsoluteTime Current;

  if (objc_opt_class(MCProfileConnection, a2)
    && objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = CFAbsoluteTimeGetCurrent() + -86400.0;
    v3 = objc_msgSend(objc_msgSend(-[CLPressureStatsCollector universe](self, "universe", 0, 0, 0, 0), "vendor"), "proxyForService:", CFSTR("CLStepCountNotifier"));
    if (v3)
    {
      objc_msgSend(v3, "syncgetQueryStartTime:andStopTime:", &v5, &Current);
      LODWORD(v3) = 0;
    }
  }
  else
  {
    LODWORD(v3) = 0x7FFFFFFF;
  }
  return (int)v3;
}

- (void)reset
{
  sub_1011A232C((uint64_t)&self->fK2Detector);
  sub_100B4BC30((uint64_t)&self->fSlopeEstimator);
  self->fCharging = 0;
  self->fAllowLogging = 0;
  -[CLPressureStatsCollector disableCollection](self, "disableCollection");
}

- (void)saveFeaturesToCache:(id *)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  _WORD v27[8];
  uint8_t buf[8];

  v4 = sub_1001FD94C();
  if (byte_102307D37 >= 0)
    v5 = (const char *)&qword_102307D20;
  else
    v5 = (const char *)qword_102307D20;
  *(double *)buf = CFAbsoluteTimeGetCurrent();
  sub_10018A4CC(v4, v5, buf);
  v6 = sub_1001FD94C();
  if (byte_102307D4F >= 0)
    v7 = (const char *)&qword_102307D38;
  else
    v7 = (const char *)qword_102307D38;
  *(double *)buf = a3->var0;
  sub_100529E18(v6, v7, buf);
  v8 = sub_1001FD94C();
  if (byte_102307D67 >= 0)
    v9 = (const char *)&qword_102307D50;
  else
    v9 = (const char *)qword_102307D50;
  *(double *)buf = a3->var1;
  sub_100529E18(v8, v9, buf);
  v10 = sub_1001FD94C();
  if (byte_102307D7F >= 0)
    v11 = (const char *)&qword_102307D68;
  else
    v11 = (const char *)qword_102307D68;
  *(double *)buf = a3->var2;
  sub_100529E18(v10, v11, buf);
  v12 = sub_1001FD94C();
  if (byte_102307D97 >= 0)
    v13 = (const char *)&qword_102307D80;
  else
    v13 = (const char *)qword_102307D80;
  *(double *)buf = a3->var3;
  sub_100529E18(v12, v13, buf);
  v14 = sub_1001FD94C();
  if (byte_102307DC7 >= 0)
    v15 = (const char *)&qword_102307DB0;
  else
    v15 = (const char *)qword_102307DB0;
  *(double *)buf = a3->var5;
  sub_100529E18(v14, v15, buf);
  v16 = sub_1001FD94C();
  if (byte_102307DAF >= 0)
    v17 = (const char *)&qword_102307D98;
  else
    v17 = (const char *)qword_102307D98;
  *(double *)buf = a3->var4;
  sub_100529E18(v16, v17, buf);
  v18 = sub_1001FD94C();
  if (byte_102307DDF >= 0)
    v19 = (const char *)&qword_102307DC8;
  else
    v19 = (const char *)qword_102307DC8;
  sub_100529880(v18, v19, &a3->var6);
  v20 = sub_1001FD94C();
  if (byte_102307DF7 >= 0)
    v21 = (const char *)&qword_102307DE0;
  else
    v21 = (const char *)qword_102307DE0;
  sub_10052A3B8(v20, v21, a3->var7.__r_.__value_.var0.var0.__data_);
  v22 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v22 + 944))(v22);
  v23 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v23 + 936))(v23);
  if (qword_10229FD70 != -1)
    dispatch_once(&qword_10229FD70, &stru_102181E28);
  v24 = qword_10229FD78;
  if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] A new record saved to cache.plist", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102181E28);
    v27[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] A new record saved to cache.plist", v27, 2);
    v26 = (uint8_t *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector saveFeaturesToCache:]", "%s\n", v25);
    if (v26 != buf)
      free(v26);
  }
}

- (void)cleanCache
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  _WORD v23[8];
  uint8_t buf[1640];

  v2 = sub_1001FD94C();
  if (byte_102307D4F >= 0)
    v3 = (const char *)&qword_102307D38;
  else
    v3 = (const char *)qword_102307D38;
  sub_100525484(v2, v3, 0xFFFFFFFFLL);
  v4 = sub_1001FD94C();
  if (byte_102307D67 >= 0)
    v5 = (const char *)&qword_102307D50;
  else
    v5 = (const char *)qword_102307D50;
  sub_100525484(v4, v5, 0xFFFFFFFFLL);
  v6 = sub_1001FD94C();
  if (byte_102307D7F >= 0)
    v7 = (const char *)&qword_102307D68;
  else
    v7 = (const char *)qword_102307D68;
  sub_100525484(v6, v7, 0xFFFFFFFFLL);
  v8 = sub_1001FD94C();
  if (byte_102307D97 >= 0)
    v9 = (const char *)&qword_102307D80;
  else
    v9 = (const char *)qword_102307D80;
  sub_100525484(v8, v9, 0xFFFFFFFFLL);
  v10 = sub_1001FD94C();
  if (byte_102307DC7 >= 0)
    v11 = (const char *)&qword_102307DB0;
  else
    v11 = (const char *)qword_102307DB0;
  sub_100525484(v10, v11, 0xFFFFFFFFLL);
  v12 = sub_1001FD94C();
  if (byte_102307DAF >= 0)
    v13 = (const char *)&qword_102307D98;
  else
    v13 = (const char *)qword_102307D98;
  sub_100525484(v12, v13, 0xFFFFFFFFLL);
  v14 = sub_1001FD94C();
  if (byte_102307DDF >= 0)
    v15 = (const char *)&qword_102307DC8;
  else
    v15 = (const char *)qword_102307DC8;
  sub_100525484(v14, v15, 0xFFFFFFFFLL);
  v16 = sub_1001FD94C();
  if (byte_102307DF7 >= 0)
    v17 = (const char *)&qword_102307DE0;
  else
    v17 = (const char *)qword_102307DE0;
  sub_100525484(v16, v17, 0xFFFFFFFFLL);
  v18 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v18 + 944))(v18);
  v19 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v19 + 936))(v19);
  if (qword_10229FD70 != -1)
    dispatch_once(&qword_10229FD70, &stru_102181E28);
  v20 = qword_10229FD78;
  if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] cache.plist reset", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102181E28);
    v23[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] cache.plist reset", v23, 2);
    v22 = (uint8_t *)v21;
    sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector cleanCache]", "%s\n", v21);
    if (v22 != buf)
      free(v22);
  }
}

- (void)displayCache
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  std::string __p;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = 0x47EFFFFFE0000000;
  v30 = 0x47EFFFFFE0000000;
  v27 = 0x47EFFFFFE0000000;
  v28 = 0x47EFFFFFE0000000;
  v25 = 0x47EFFFFFE0000000;
  v26 = 0x47EFFFFFE0000000;
  v24 = 0x7FFFFFFF;
  sub_1015A2E04(&__p, "");
  v2 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 936))(v2);
  v3 = sub_1001FD94C();
  if (byte_102307D4F >= 0)
    v4 = (const char *)&qword_102307D38;
  else
    v4 = (const char *)qword_102307D38;
  v5 = sub_10000CA44(v3, v4);
  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = sub_1001FD94C();
      if (byte_102307D4F >= 0)
        v8 = (const char *)&qword_102307D38;
      else
        v8 = (const char *)qword_102307D38;
      sub_1001FD98C(v7, v8, &v30);
      v9 = sub_1001FD94C();
      if (byte_102307D67 >= 0)
        v10 = (const char *)&qword_102307D50;
      else
        v10 = (const char *)qword_102307D50;
      sub_1001FD98C(v9, v10, &v29);
      v11 = sub_1001FD94C();
      if (byte_102307D7F >= 0)
        v12 = (const char *)&qword_102307D68;
      else
        v12 = (const char *)qword_102307D68;
      sub_1001FD98C(v11, v12, &v28);
      v13 = sub_1001FD94C();
      if (byte_102307D97 >= 0)
        v14 = (const char *)&qword_102307D80;
      else
        v14 = (const char *)qword_102307D80;
      sub_1001FD98C(v13, v14, &v27);
      v15 = sub_1001FD94C();
      if (byte_102307DC7 >= 0)
        v16 = (const char *)&qword_102307DB0;
      else
        v16 = (const char *)qword_102307DB0;
      sub_1001FD98C(v15, v16, &v26);
      v17 = sub_1001FD94C();
      if (byte_102307DAF >= 0)
        v18 = (const char *)&qword_102307D98;
      else
        v18 = (const char *)qword_102307D98;
      sub_1001FD98C(v17, v18, &v25);
      v19 = sub_1001FD94C();
      if (byte_102307DDF >= 0)
        v20 = (const char *)&qword_102307DC8;
      else
        v20 = (const char *)qword_102307DC8;
      sub_1001E4B84(v19, v20, &v24);
      v21 = sub_1001FD94C();
      if (byte_102307DF7 >= 0)
        v22 = (const char *)&qword_102307DE0;
      else
        v22 = (const char *)qword_102307DE0;
      sub_1000BCB64(v21, v22, &__p);
      ++v6;
    }
    while (v5 != v6);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)submitAWDMetric
{
  uint64_t v2;
  const char *v3;
  int v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  float v21;
  char *v22;
  float *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  float *v30;
  int v31;
  float v32;
  char *v33;
  float *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  float *v41;
  int v42;
  float v43;
  char *v44;
  void *v45;
  char *v46;
  int64_t v47;
  unint64_t v48;
  int64_t v49;
  unint64_t v50;
  char *v51;
  float *v52;
  int v53;
  float v54;
  char *v55;
  float *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  int64_t v60;
  unint64_t v61;
  char *v62;
  float *v63;
  int v64;
  float v65;
  char *v66;
  void *v67;
  char *v68;
  int64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  float *v74;
  int v75;
  float v76;
  char *v77;
  float *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  float *v85;
  int v86;
  int v87;
  char *v88;
  _DWORD *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  int *v96;
  int v97;
  _OWORD *v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  int v105;
  CFAbsoluteTime Current;
  char v107[8];
  CFAbsoluteTime v108;
  __int128 v109;
  void *v110[2];
  __int128 v111;
  void *v112[2];
  void *v113[2];
  __int128 v114;
  void *v115[2];
  __int128 v116;
  __int128 v117;
  __int128 __p;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  unint64_t v122;
  std::string v123;
  int v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130[2];

  v2 = sub_1001FD94C();
  if (byte_102307D4F >= 0)
    v3 = (const char *)&qword_102307D38;
  else
    v3 = (const char *)qword_102307D38;
  v105 = sub_10000CA44(v2, v3);
  if (v105 >= 7)
  {
    v129 = 3.40282347e38;
    v130[0] = 3.40282347e38;
    v127 = 3.40282347e38;
    v128 = 3.40282347e38;
    v125 = 3.40282347e38;
    v126 = 3.40282347e38;
    v124 = 0x7FFFFFFF;
    sub_1015A2E04(&v123, "");
    v107[0] = 0;
    v109 = 0u;
    *(_OWORD *)v110 = 0u;
    v111 = 0u;
    *(_OWORD *)v112 = 0u;
    *(_OWORD *)v113 = 0u;
    v114 = 0u;
    *(_OWORD *)v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    __p = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0;
    v4 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    v108 = Current;
    do
    {
      v5 = sub_1001FD94C();
      if (byte_102307D4F >= 0)
        v6 = (const char *)&qword_102307D38;
      else
        v6 = (const char *)qword_102307D38;
      sub_1001FD98C(v5, v6, v130);
      v7 = sub_1001FD94C();
      if (byte_102307D67 >= 0)
        v8 = (const char *)&qword_102307D50;
      else
        v8 = (const char *)qword_102307D50;
      sub_1001FD98C(v7, v8, &v129);
      v9 = sub_1001FD94C();
      if (byte_102307D7F >= 0)
        v10 = (const char *)&qword_102307D68;
      else
        v10 = (const char *)qword_102307D68;
      sub_1001FD98C(v9, v10, &v128);
      v11 = sub_1001FD94C();
      if (byte_102307D97 >= 0)
        v12 = (const char *)&qword_102307D80;
      else
        v12 = (const char *)qword_102307D80;
      sub_1001FD98C(v11, v12, &v127);
      v13 = sub_1001FD94C();
      if (byte_102307DC7 >= 0)
        v14 = (const char *)&qword_102307DB0;
      else
        v14 = (const char *)qword_102307DB0;
      sub_1001FD98C(v13, v14, &v126);
      v15 = sub_1001FD94C();
      if (byte_102307DAF >= 0)
        v16 = (const char *)&qword_102307D98;
      else
        v16 = (const char *)qword_102307D98;
      sub_1001FD98C(v15, v16, &v125);
      v17 = sub_1001FD94C();
      if (byte_102307DDF >= 0)
        v18 = (const char *)&qword_102307DC8;
      else
        v18 = (const char *)qword_102307DC8;
      sub_1001E4B84(v17, v18, &v124);
      v19 = sub_1001FD94C();
      if (byte_102307DF7 >= 0)
        v20 = (const char *)&qword_102307DE0;
      else
        v20 = (const char *)qword_102307DE0;
      sub_1000BCB64(v19, v20, &v123);
      v21 = v126;
      v22 = (char *)*((_QWORD *)&__p + 1);
      if (*((_QWORD *)&__p + 1) >= (unint64_t)v119)
      {
        v24 = (char *)__p;
        v25 = (uint64_t)(*((_QWORD *)&__p + 1) - __p) >> 2;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62)
          sub_100259694();
        v27 = v119 - __p;
        if ((uint64_t)(v119 - __p) >> 1 > v26)
          v26 = v27 >> 1;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
          v28 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)sub_100260634((uint64_t)&v119, v28);
          v22 = (char *)*((_QWORD *)&__p + 1);
          v24 = (char *)__p;
        }
        else
        {
          v29 = 0;
        }
        v30 = (float *)&v29[4 * v25];
        *v30 = v21;
        v23 = v30 + 1;
        while (v22 != v24)
        {
          v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30-- - 1) = v31;
        }
        *(_QWORD *)&__p = v30;
        *((_QWORD *)&__p + 1) = v23;
        *(_QWORD *)&v119 = &v29[4 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        **((float **)&__p + 1) = v21;
        v23 = (float *)(v22 + 4);
      }
      *((_QWORD *)&__p + 1) = v23;
      v32 = v130[0];
      v33 = (char *)v111;
      if ((unint64_t)v111 >= *((_QWORD *)&v111 + 1))
      {
        v35 = (char *)v110[1];
        v36 = (uint64_t)(v111 - (unint64_t)v110[1]) >> 2;
        v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 62)
          sub_100259694();
        v38 = *((_QWORD *)&v111 + 1) - (unint64_t)v110[1];
        if ((uint64_t)(*((_QWORD *)&v111 + 1) - (unint64_t)v110[1]) >> 1 > v37)
          v37 = v38 >> 1;
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
          v39 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v39 = v37;
        if (v39)
        {
          v40 = (char *)sub_100260634((uint64_t)&v111 + 8, v39);
          v35 = (char *)v110[1];
          v33 = (char *)v111;
        }
        else
        {
          v40 = 0;
        }
        v41 = (float *)&v40[4 * v36];
        *v41 = v32;
        v34 = v41 + 1;
        while (v33 != v35)
        {
          v42 = *((_DWORD *)v33 - 1);
          v33 -= 4;
          *((_DWORD *)v41-- - 1) = v42;
        }
        v110[1] = v41;
        *(_QWORD *)&v111 = v34;
        *((_QWORD *)&v111 + 1) = &v40[4 * v39];
        if (v35)
          operator delete(v35);
      }
      else
      {
        *(float *)v111 = v32;
        v34 = (float *)(v33 + 4);
      }
      *(_QWORD *)&v111 = v34;
      v43 = v129;
      v44 = (char *)v112[1];
      if (v112[1] >= v113[0])
      {
        v46 = (char *)v112[0];
        v47 = ((char *)v112[1] - (char *)v112[0]) >> 2;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62)
          sub_100259694();
        v49 = (char *)v113[0] - (char *)v112[0];
        if (((char *)v113[0] - (char *)v112[0]) >> 1 > v48)
          v48 = v49 >> 1;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
          v50 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)sub_100260634((uint64_t)v113, v50);
          v46 = (char *)v112[0];
          v44 = (char *)v112[1];
        }
        else
        {
          v51 = 0;
        }
        v52 = (float *)&v51[4 * v47];
        *v52 = v43;
        v45 = v52 + 1;
        while (v44 != v46)
        {
          v53 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v52-- - 1) = v53;
        }
        v112[0] = v52;
        v112[1] = v45;
        v113[0] = &v51[4 * v50];
        if (v46)
          operator delete(v46);
      }
      else
      {
        *(float *)v112[1] = v43;
        v45 = v44 + 4;
      }
      v112[1] = v45;
      v54 = v128;
      v55 = (char *)v114;
      if ((unint64_t)v114 >= *((_QWORD *)&v114 + 1))
      {
        v57 = (char *)v113[1];
        v58 = (uint64_t)(v114 - (unint64_t)v113[1]) >> 2;
        v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 62)
          sub_100259694();
        v60 = *((_QWORD *)&v114 + 1) - (unint64_t)v113[1];
        if ((uint64_t)(*((_QWORD *)&v114 + 1) - (unint64_t)v113[1]) >> 1 > v59)
          v59 = v60 >> 1;
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFFCLL)
          v61 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v61 = v59;
        if (v61)
        {
          v62 = (char *)sub_100260634((uint64_t)&v114 + 8, v61);
          v57 = (char *)v113[1];
          v55 = (char *)v114;
        }
        else
        {
          v62 = 0;
        }
        v63 = (float *)&v62[4 * v58];
        *v63 = v54;
        v56 = v63 + 1;
        while (v55 != v57)
        {
          v64 = *((_DWORD *)v55 - 1);
          v55 -= 4;
          *((_DWORD *)v63-- - 1) = v64;
        }
        v113[1] = v63;
        *(_QWORD *)&v114 = v56;
        *((_QWORD *)&v114 + 1) = &v62[4 * v61];
        if (v57)
          operator delete(v57);
      }
      else
      {
        *(float *)v114 = v54;
        v56 = (float *)(v55 + 4);
      }
      *(_QWORD *)&v114 = v56;
      v65 = v127;
      v66 = (char *)v115[1];
      if (v115[1] >= (void *)v116)
      {
        v68 = (char *)v115[0];
        v69 = ((char *)v115[1] - (char *)v115[0]) >> 2;
        v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 62)
          sub_100259694();
        v71 = v116 - (unint64_t)v115[0];
        if ((uint64_t)(v116 - (unint64_t)v115[0]) >> 1 > v70)
          v70 = v71 >> 1;
        if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL)
          v72 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v72 = v70;
        if (v72)
        {
          v73 = (char *)sub_100260634((uint64_t)&v116, v72);
          v68 = (char *)v115[0];
          v66 = (char *)v115[1];
        }
        else
        {
          v73 = 0;
        }
        v74 = (float *)&v73[4 * v69];
        *v74 = v65;
        v67 = v74 + 1;
        while (v66 != v68)
        {
          v75 = *((_DWORD *)v66 - 1);
          v66 -= 4;
          *((_DWORD *)v74-- - 1) = v75;
        }
        v115[0] = v74;
        v115[1] = v67;
        *(_QWORD *)&v116 = &v73[4 * v72];
        if (v68)
          operator delete(v68);
      }
      else
      {
        *(float *)v115[1] = v65;
        v67 = v66 + 4;
      }
      v115[1] = v67;
      v76 = v125;
      v77 = (char *)v117;
      if ((unint64_t)v117 >= *((_QWORD *)&v117 + 1))
      {
        v79 = (char *)*((_QWORD *)&v116 + 1);
        v80 = (uint64_t)(v117 - *((_QWORD *)&v116 + 1)) >> 2;
        v81 = v80 + 1;
        if ((unint64_t)(v80 + 1) >> 62)
          sub_100259694();
        v82 = *((_QWORD *)&v117 + 1) - *((_QWORD *)&v116 + 1);
        if ((uint64_t)(*((_QWORD *)&v117 + 1) - *((_QWORD *)&v116 + 1)) >> 1 > v81)
          v81 = v82 >> 1;
        if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL)
          v83 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v83 = v81;
        if (v83)
        {
          v84 = (char *)sub_100260634((uint64_t)&v117 + 8, v83);
          v79 = (char *)*((_QWORD *)&v116 + 1);
          v77 = (char *)v117;
        }
        else
        {
          v84 = 0;
        }
        v85 = (float *)&v84[4 * v80];
        *v85 = v76;
        v78 = v85 + 1;
        while (v77 != v79)
        {
          v86 = *((_DWORD *)v77 - 1);
          v77 -= 4;
          *((_DWORD *)v85-- - 1) = v86;
        }
        *((_QWORD *)&v116 + 1) = v85;
        *(_QWORD *)&v117 = v78;
        *((_QWORD *)&v117 + 1) = &v84[4 * v83];
        if (v79)
          operator delete(v79);
      }
      else
      {
        *(float *)v117 = v76;
        v78 = (float *)(v77 + 4);
      }
      *(_QWORD *)&v117 = v78;
      v87 = v124;
      v88 = (char *)v120;
      if ((unint64_t)v120 >= *((_QWORD *)&v120 + 1))
      {
        v90 = (char *)*((_QWORD *)&v119 + 1);
        v91 = (uint64_t)(v120 - *((_QWORD *)&v119 + 1)) >> 2;
        v92 = v91 + 1;
        if ((unint64_t)(v91 + 1) >> 62)
          sub_100259694();
        v93 = *((_QWORD *)&v120 + 1) - *((_QWORD *)&v119 + 1);
        if ((uint64_t)(*((_QWORD *)&v120 + 1) - *((_QWORD *)&v119 + 1)) >> 1 > v92)
          v92 = v93 >> 1;
        if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
          v94 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v94 = v92;
        if (v94)
        {
          v95 = (char *)sub_100260634((uint64_t)&v120 + 8, v94);
          v90 = (char *)*((_QWORD *)&v119 + 1);
          v88 = (char *)v120;
        }
        else
        {
          v95 = 0;
        }
        v96 = (int *)&v95[4 * v91];
        *v96 = v87;
        v89 = v96 + 1;
        while (v88 != v90)
        {
          v97 = *((_DWORD *)v88 - 1);
          v88 -= 4;
          *--v96 = v97;
        }
        *((_QWORD *)&v119 + 1) = v96;
        *(_QWORD *)&v120 = v89;
        *((_QWORD *)&v120 + 1) = &v95[4 * v94];
        if (v90)
          operator delete(v90);
      }
      else
      {
        *(_DWORD *)v120 = v124;
        v89 = v88 + 4;
      }
      *(_QWORD *)&v120 = v89;
      v98 = (_OWORD *)*((_QWORD *)&v121 + 1);
      if (*((_QWORD *)&v121 + 1) >= v122)
      {
        v100 = sub_1015E796C((uint64_t *)&v121, (__int128 *)&v123);
      }
      else
      {
        if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_100115CE4(*((_BYTE **)&v121 + 1), v123.__r_.__value_.__l.__data_, v123.__r_.__value_.__l.__size_);
        }
        else
        {
          v99 = *(_OWORD *)&v123.__r_.__value_.__l.__data_;
          *(_QWORD *)(*((_QWORD *)&v121 + 1) + 16) = *((_QWORD *)&v123.__r_.__value_.__l + 2);
          *v98 = v99;
        }
        v100 = (uint64_t)v98 + 24;
      }
      *((_QWORD *)&v121 + 1) = v100;
      ++v4;
    }
    while (v4 != v105);
    -[CLPressureStatsCollector cleanCache](self, "cleanCache");
    v101 = sub_1001FD94C();
    if (byte_102307E0F >= 0)
      v102 = (const char *)&qword_102307DF8;
    else
      v102 = (const char *)qword_102307DF8;
    sub_10018A4CC(v101, v102, &Current);
    v103 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v103 + 944))(v103);
    sub_100D37540((uint64_t)v107);
    if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v123.__r_.__value_.__l.__data_);
  }
}

- (void)sendCAMetric:(id *)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSDictionary *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  _QWORD v14[5];
  int v15;
  NSDictionary *v16;
  uint8_t buf[4];
  NSDictionary *v18;
  _QWORD v19[7];
  _QWORD v20[7];

  v19[0] = CFSTR("medianAbsDevOfTCO");
  *(float *)&v3 = a3->var5;
  v20[0] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3);
  v19[1] = CFSTR("meanAbsOfPressureError");
  *(float *)&v5 = a3->var0;
  v20[1] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5);
  v19[2] = CFSTR("varianceOfPressureError");
  *(float *)&v6 = a3->var1;
  v20[2] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6);
  v19[3] = CFSTR("deltaPressure");
  *(float *)&v7 = a3->var2;
  v20[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7);
  v19[4] = CFSTR("deltaTemperature");
  *(float *)&v8 = a3->var3;
  v20[4] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8);
  v19[5] = CFSTR("TCO");
  *(float *)&v9 = a3->var4;
  v20[5] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
  v19[6] = CFSTR("flightsOfStairsIn24Hr");
  v20[6] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var6);
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  if (qword_10229FD70 != -1)
    dispatch_once(&qword_10229FD70, &stru_102181E28);
  v11 = qword_10229FD78;
  if (os_log_type_enabled((os_log_t)qword_10229FD78, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Sending event, %{public}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FD70 != -1)
      dispatch_once(&qword_10229FD70, &stru_102181E28);
    v15 = 138543362;
    v16 = v10;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FD78, 2, "[CLPressureStatsCollector] Sending event, %{public}@", &v15, 12);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLPressureStatsCollector sendCAMetric:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D37428;
  v14[3] = &unk_102132010;
  v14[4] = v10;
  AnalyticsSendEventLazy(CFSTR("com.apple.Motion.PressureStats"), v14);
}

- (void).cxx_destruct
{
  Client *value;
  Dispatcher *v4;

  sub_100B4A370(&self->fSlopeEstimator, a2);
  sub_1011A2180(&self->fK2Detector);
  value = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->fPressureDispatcher.__ptr_.__value_;
  self->fPressureDispatcher.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  self->fPressureDispatcher.__ptr_.__value_ = 0;
  self->fStatusClient.__ptr_.__value_ = 0;
  sub_1011A20F4((uint64_t)&self->fK2Detector);
  sub_100B4A2F8((uint64_t)&self->fSlopeEstimator, 20, 55);
  return self;
}

@end

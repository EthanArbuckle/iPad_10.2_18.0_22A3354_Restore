@implementation CLGnssProviderAdapter

- (BOOL)syncgetActiveGnssBands:(void *)a3
{
  CLNotifierBase *v4;
  void *v5;

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4
  {
    return sub_1000552B8((uint64_t)v5 + 120, (int **)a3);
  }
  else
  {
    return 0;
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (BOOL)isSupported
{
  if (qword_102308968 != -1)
    dispatch_once(&qword_102308968, &stru_102189958);
  return byte_102308960;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_102308978 != -1)
    dispatch_once(&qword_102308978, &stru_102189978);
  return (id)qword_102308970;
}

- (CLGnssProviderAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGnssProviderAdapter;
  return -[CLGnssProviderAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLGnssProviderProtocol, &OBJC_PROTOCOL___CLGnssProviderClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_100E02BF8((uint64_t)-[CLGnssProviderAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_10192BBD0();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)resetControlPlaneStatus
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v2)
  sub_1008519C0(&v2[15].var0);
}

- (BOOL)syncgetControlPlaneStatusReport:(CLGnssControlPlaneStatusReport *)a3
{
  CLNotifierBase *v4;

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  return sub_100851DBC(&v4[15].var0, (uint64_t)a3);
}

- (void)cacheEmergencyAWDStatistics:(CLDaemonLocation *)a3
{
  CLNotifierBase *v4;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];
  _OWORD v10[2];

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  rawCoordinate = a3->rawCoordinate;
  v9[6] = *(_OWORD *)&a3->lifespan;
  v9[7] = rawCoordinate;
  v10[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)&a3->integrity;
  v6 = *(_OWORD *)&a3->speed;
  v9[2] = *(_OWORD *)&a3->altitude;
  v9[3] = v6;
  v7 = *(_OWORD *)&a3->timestamp;
  v9[4] = *(_OWORD *)&a3->course;
  v9[5] = v7;
  v8 = *(_OWORD *)&a3->coordinate.longitude;
  v9[0] = *(_OWORD *)&a3->suitability;
  v9[1] = v8;
  sub_100851BFC((uint64_t)&v4[15], (uint64_t)v9);
}

- (void)fetchOdometryBatchedLocationsWithReply:(id)a3
{
  id v5;
  CLNotifierBase *v6;
  void *v7;
  int *v8;
  unint64_t i;
  id v10;
  CLLocationCoordinate2D v11;
  NSObject *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint8_t *v26;
  _BYTE v27[688];
  std::__shared_weak_count *v28;
  int *v29;
  std::__shared_weak_count *v30;
  void *__p;
  char v32;
  std::__shared_weak_count *v33;
  id v34;
  int v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  CLLocationDegrees v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  sub_100129CA0((uint64_t)v27);
  v6 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v6)
  {
    if (v7)
    {
      sub_100854264((uint64_t)v7 + 120, (uint64_t)v27);
      v8 = v29;
      if (v29)
      {
        for (i = 0; i < sub_10104BD1C(v8); ++i)
        {
          sub_10104B598((uint64_t)v29, i, (uint64_t)buf);
          v10 = objc_alloc((Class)CLLocation);
          v11 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&v38, v39);
          objc_msgSend(v5, "setValue:forKey:", objc_msgSend(objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v47), v11.latitude, v11.longitude, v41, v40, v42, v45, v46, v43, v44),
              "jsonObject"),
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), i));
          v8 = v29;
        }
        if (qword_1022A01C0 != -1)
          dispatch_once(&qword_1022A01C0, &stru_102189B58);
        v12 = qword_1022A01C8;
        if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_DEBUG))
        {
          v13 = sub_10104BD1C(v29);
          *(_DWORD *)buf = 134349056;
          v38 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "fetchOdometryBatchedLocations responding with dataCount,%{public}lu", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01C0 != -1)
            dispatch_once(&qword_1022A01C0, &stru_102189B58);
          v23 = qword_1022A01C8;
          v24 = sub_10104BD1C(v29);
          v35 = 134349056;
          v36 = v24;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "fetchOdometryBatchedLocations responding with dataCount,%{public}lu", &v35, 12);
          v26 = (uint8_t *)v25;
          sub_100512490("Generic", 1, 0, 2, "-[CLGnssProviderAdapter fetchOdometryBatchedLocationsWithReply:]", "%s\n", v25);
          if (v26 != buf)
            free(v26);
        }
      }
    }
  }
  (*((void (**)(id, id))a3 + 2))(a3, v5);

  v14 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v32 < 0)
    operator delete(__p);
  v17 = v30;
  if (v30)
  {
    v18 = (unint64_t *)&v30->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v28;
  if (v28)
  {
    v21 = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

- (void)setBarometricAltitudeAWDData:(BarometricAltitudeDriftRateInfo)a3
{
  uint64_t v3;
  uint64_t v4;
  CLNotifierBase *v5;
  void *v6;
  _QWORD v7[2];

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v5 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v5)
  {
    if (v6)
    {
      v7[0] = v4;
      v7[1] = v3;
      sub_100851D9C((uint64_t)v6 + 120, (uint64_t)v7);
    }
  }
}

- (void)setBarometricAltitudeData:(AltitudeUpdateData *)a3
{
  CLNotifierBase *v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[5];

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  v5 = *(_OWORD *)&a3->var7.var1;
  v7[2] = *(_OWORD *)&a3->var4;
  v7[3] = v5;
  v7[4] = *(_OWORD *)&a3->var7.var3;
  v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  sub_100851DAC((uint64_t)&v4[15], (uint64_t)v7);
}

- (BOOL)syncgetIonosphereParameters:(ThinShellIonosphereParameters *)a3
{
  CLNotifierBase *v4;
  void *v5;

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  return v4
}

- (void)emergencyStateChange:(id)a3
{
  NSObject *v4;
  std::string *v5;
  CLNotifierBase *v6;
  uint64_t v7;
  std::string *p_buf;
  std::string *v9;
  std::string *v10;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  std::string buf;
  int v16;
  std::string *v17;
  std::string __p[68];

  (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&v13, a3, a2);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102189B78);
  v4 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    sub_100CD5278(&v13, __p);
    v5 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? __p
       : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "notifier adapter received emergency state %s", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102189B78);
    v7 = qword_1022A0028;
    sub_100CD5278(&v13, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    v16 = 136315138;
    v17 = p_buf;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v7, 0, "notifier adapter received emergency state %s", (const char *)&v16);
    v10 = v9;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssProviderAdapter emergencyStateChange:]", "%s\n", (const char *)v10);
    if (v10 != __p)
      free(v10);
  }
  v6 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v6)
  v11 = v13;
  v12 = v14;
  sub_100E03528((uint64_t)v6, &v11);
}

- (void)emergencySettingsChange:(id)a3 withReason:(int)a4
{
  uint64_t v4;
  CLNotifierBase *v6;
  _QWORD v7[166];

  v4 = *(_QWORD *)&a4;
  (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  v6 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v6)
  sub_10084B1F0((uint64_t *)&v6[15], (uint64_t)v7, v4);
  sub_100857FD0((uint64_t)v7);
}

- (void)shouldLockoutNilr:(BOOL)a3
{
  _BOOL8 v3;
  CLNotifierBase *v4;

  v3 = a3;
  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  sub_10084B7E8(&v4[15], v3);
}

- (void)addRhythmicGnssClient:(int)a3
{
  CLNotifierBase *v4;
  void *v5;

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  {
    if (v5)
      sub_100E03B04((uint64_t)v5, a3);
  }
}

- (void)removeRhythmicGnssClient:(int)a3
{
  CLNotifierBase *v4;
  void *v5;

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  {
    if (v5)
      sub_100E03F70((uint64_t)v5, a3);
  }
}

- (void)updateRelayedLocation:(id)a3
{
  NSObject *v4;
  CLNotifierBase *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  _BYTE v12[4];
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;

  (*((void (**)(_BYTE *__return_ptr, id, SEL))a3 + 2))(v12, a3, a2);
  if (qword_1022A0070 != -1)
    dispatch_once(&qword_1022A0070, &stru_102189B38);
  v4 = qword_1022A0078;
  if (os_log_type_enabled((os_log_t)qword_1022A0078, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    v20 = v13;
    v21 = 2049;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#updateRelayedLocation location,lat,%{private}+.6f,lon,%{private}.6f>", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0070 != -1)
      dispatch_once(&qword_1022A0070, &stru_102189B38);
    v15 = 134283777;
    v16 = v13;
    v17 = 2049;
    v18 = v14;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0078, 2, "#updateRelayedLocation location,lat,%{private}+.6f,lon,%{private}.6f>", &v15, 22);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLGnssProviderAdapter updateRelayedLocation:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  if ((sub_100182290((uint64_t)v12) & 1) != 0)
  {
    v5 = -[CLNotifierServiceAdapter notifier](self, "notifier");
    if (v5)
    sub_100E046D4((uint64_t)v5, (uint64_t)v12);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102189B98);
    v6 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#updateRelayedLocation,#warning.lastReceivedLocation is invalid.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102189B98);
      LOWORD(v15) = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 2, "#updateRelayedLocation,#warning.lastReceivedLocation is invalid.", &v15, v11);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLGnssProviderAdapter updateRelayedLocation:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
  }
}

@end

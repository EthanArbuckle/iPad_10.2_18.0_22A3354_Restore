@implementation CLLocationProviderAdapter

- (void)locationProvider
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)updateNotification:(int)a3 withRegistrationInfo:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  int v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;

  v8 = sub_1000C2BB4(a4, (uint64_t)a2);
  if (v8)
  {
    v9 = v8;
    v10 = -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a5);
    v11 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    v12 = v11;
    v15 = a3;
    if (!v11
      || ((*(uint64_t (**)(void *, uint64_t, int *, id))(*(_QWORD *)v11 + 216))(v11, v10, &v15, v9) & 1) == 0)
    {
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_10214EF10);
      v13 = qword_1022A0028;
      if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v21 = v12;
        v22 = 1024;
        v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LocationProvider,Failed to updateRegistrationInfoForClient %p (%d)", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0020 != -1)
          dispatch_once(&qword_1022A0020, &stru_10214EF10);
        v16 = 134218240;
        v17 = v12;
        v18 = 1024;
        v19 = v10;
        v14 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "LocationProvider,Failed to updateRegistrationInfoForClient %p (%d)", &v16, 18);
        sub_100512490("Generic", 1, 0, 2, "-[CLLocationProviderAdapter updateNotification:withRegistrationInfo:forClient:]", "%s\n", v14);
        if (v14 != (char *)buf)
          free(v14);
      }
    }
  }
}

- (void)register:(id)a3 forNotification:(int)a4 distanceFilter:(double)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  double v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;

  v14 = a5;
  v7 = -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3);
  v8 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  v9 = v8;
  v13 = a4;
  if (!v8
    || ((*(uint64_t (**)(void *, uint64_t, int *, double *))(*(_QWORD *)v8 + 224))(v8, v7, &v13, &v14) & 1) == 0)
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_10214EF10);
    v10 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349824;
      v24 = v9;
      v25 = 1026;
      v26 = v7;
      v27 = 1026;
      v28 = a4;
      v29 = 2050;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "LocationProvider,Failed to registerForFilteredLocation %{public}p (%{public}d, %{public}d, %{public}f)", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_10214EF10);
      v15 = 134349824;
      v16 = v9;
      v17 = 1026;
      v18 = v7;
      v19 = 1026;
      v20 = a4;
      v21 = 2050;
      v22 = v14;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 17, "LocationProvider,Failed to registerForFilteredLocation %{public}p (%{public}d, %{public}d, %{public}f)", &v15, 34);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLLocationProviderAdapter register:forNotification:distanceFilter:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)start
{
  void *v3;

  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v3 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *))(*(_QWORD *)v3 + 208))(v3);
  }
}

- (void)shutdown
{
  void *v3;

  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v3 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *))(*(_QWORD *)v3 + 16))(v3);
  }
}

- (void)setSimulationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[CLLocationProviderAdapter locationProvider](self, "locationProvider"))
  {
    v5 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
    (*(void (**)(void *, _BOOL8))(*(_QWORD *)v5 + 280))(v5, v3);
  }
}

- (void)sendSimulatedLocation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  _OWORD v22[8];
  _OWORD v23[2];
  _QWORD v24[66];
  std::__shared_weak_count *v25;

  objc_msgSend(objc_msgSend(a3, "gnssOdometerInfo", sub_10012A33C(v24).n128_f64[0]), "odometer");
  v24[0] = v5;
  objc_msgSend(objc_msgSend(a3, "gnssOdometerInfo"), "deltaDistance");
  v24[1] = v6;
  objc_msgSend(objc_msgSend(a3, "gnssOdometerInfo"), "deltaDistanceAccuracy");
  v24[2] = v7;
  objc_msgSend(a3, "trustedTimestamp");
  v24[3] = v8;
  v9 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  if (a3)
  {
    objc_msgSend(a3, "clientLocation");
  }
  else
  {
    v20 = 0u;
    memset(v21, 0, 28);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v22[4] = v17;
  v22[5] = v18;
  v22[2] = v15;
  v22[3] = v16;
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v21 + 12);
  v22[7] = v20;
  v23[0] = v21[0];
  v22[6] = v19;
  v22[0] = v13;
  v22[1] = v14;
  (*(void (**)(void *, _OWORD *, _QWORD *))(*(_QWORD *)v9 + 264))(v9, v22, v24);
  v10 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (void)sendSimulatedLocationUnavailable
{
  void *v2;

  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  (*(void (**)(void *))(*(_QWORD *)v2 + 272))(v2);
}

- (BOOL)syncgetNotification:(const int *)a3 data:(void *)a4
{
  void *v6;

  v6 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, const int *, void *))(*(_QWORD *)v6 + 128))(v6, a3, a4);
}

- (BOOL)syncgetLocation:(id *)a3
{
  void *v4;

  v4 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, $F9C9D9F25812E94101C3878727C1B635 *))(*(_QWORD *)v4 + 232))(v4, a3);
}

- (BOOL)syncgetLocationPrivate:(void *)a3
{
  void *v4;

  v4 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *, void *))(*(_QWORD *)v4 + 240))(v4, a3);
}

- (void)fetchLocationWithReply:(id)a3
{
  void *v9;
  uint64_t v10;
  _BYTE v11[96];
  __int128 v12;
  __int128 v13;
  _BYTE v14[28];
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];

  *(_DWORD *)v11 = 0xFFFF;
  *(_OWORD *)&v11[4] = 0uLL;
  *(_OWORD *)&v11[20] = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v11[36] = _Q0;
  *(_OWORD *)&v11[52] = _Q0;
  *(_OWORD *)&v11[68] = _Q0;
  *(_DWORD *)&v11[84] = 0;
  *(_QWORD *)&v11[88] = 0xBFF0000000000000;
  v12 = 0uLL;
  LODWORD(v13) = 0;
  *(_QWORD *)((char *)&v13 + 4) = 0xBFF0000000000000;
  HIDWORD(v13) = 0x7FFFFFFF;
  memset(v14, 0, 25);
  v9 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  v10 = (*(uint64_t (**)(void *, _BYTE *))(*(_QWORD *)v9 + 248))(v9, v11);
  v22 = v12;
  v23 = v13;
  v24[0] = *(_OWORD *)v14;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&v14[12];
  v18 = *(_OWORD *)&v11[32];
  v19 = *(_OWORD *)&v11[48];
  v20 = *(_OWORD *)&v11[64];
  v21 = *(_OWORD *)&v11[80];
  v16 = *(_OWORD *)v11;
  v17 = *(_OWORD *)&v11[16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006DC874;
  v15[3] = &unk_10214CAA0;
  (*((void (**)(id, uint64_t, id))a3 + 2))(a3, v10, objc_msgSend(v15, "copy"));
}

- (BOOL)syncgetLocationUnavailable
{
  void *v2;

  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  return (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 256))(v2);
}

- (BOOL)syncgetIsSimulationEnabled
{
  return *((_BYTE *)-[CLLocationProviderAdapter locationProvider](self, "locationProvider") + 109);
}

- (id)syncgetName
{
  char *v2;
  __int128 v3;
  void **v4;
  NSString *v5;
  void *__p[2];
  uint64_t v8;

  v2 = -[CLLocationProviderAdapter locationProvider](self, "locationProvider");
  if (v2[31] < 0)
  {
    sub_100115CE4(__p, *((void **)v2 + 1), *((_QWORD *)v2 + 2));
  }
  else
  {
    v3 = *(_OWORD *)(v2 + 8);
    v8 = *((_QWORD *)v2 + 3);
    *(_OWORD *)__p = v3;
  }
  if (v8 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4, __p[0], __p[1], v8);
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);
  return v5;
}

@end

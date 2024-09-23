@implementation CLTrackingAvoidanceService

- (void)onLocationNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  _OWORD v32[8];
  _OWORD v33[2];
  _OWORD v34[8];
  _OWORD v35[2];
  int v36;
  uint64_t v37;
  uint8_t buf[4];
  _BYTE v39[14];

  if (a3 == 22)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v8 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      v9 = sub_10104BD1C(*(int **)(a4 + 800));
      *(_DWORD *)buf = 134283521;
      *(_QWORD *)v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ut received %{private}zu WSB locations", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v28 = qword_1022A0138;
      v29 = sub_10104BD1C(*(int **)(a4 + 800));
      v36 = 134283521;
      v37 = v29;
      v30 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 2, "#ut received %{private}zu WSB locations", &v36, 12);
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v30);
      if (v30 != (char *)buf)
        free(v30);
    }
    if (sub_10104BD1C(*(int **)(a4 + 800)))
    {
      v10 = 0;
      for (i = 132; ; i += 156)
      {
        v12 = sub_1003471B4(*(_QWORD *)(a4 + 800));
        if (*(_DWORD *)(v12 + i) == 2)
          break;
        v13 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v12 + i - 56)), 0, *(double *)(v12 + i - 128), *(double *)(v12 + i - 120), *(double *)(v12 + i - 112), *(double *)(v12 + i - 104), *(double *)(v12 + i - 96), *(double *)(v12 + i - 88), *(double *)(v12 + i - 80), *(double *)(v12 + i - 72), *(_QWORD *)(v12 + i - 64), 0xBFF0000000000000,
                0xBFF0000000000000,
                0,
                0xBFF0000000000000,
                0,
                0xBFF0000000000000);
        objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v13);

        sub_1001795D0((uint64_t)a1 + 224, (__int128 *)a4, (char *)(a4 + 160));
        v14 = objc_alloc((Class)CLLocation);
        v15 = *(_OWORD *)(a4 + 112);
        v32[6] = *(_OWORD *)(a4 + 96);
        v32[7] = v15;
        v33[0] = *(_OWORD *)(a4 + 128);
        *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)(a4 + 140);
        v16 = *(_OWORD *)(a4 + 48);
        v32[2] = *(_OWORD *)(a4 + 32);
        v32[3] = v16;
        v17 = *(_OWORD *)(a4 + 80);
        v32[4] = *(_OWORD *)(a4 + 64);
        v32[5] = v17;
        v18 = *(_OWORD *)(a4 + 16);
        v32[0] = *(_OWORD *)a4;
        v32[1] = v18;
        objc_msgSend(a1, "updateZoneMonitorLocation:", objc_msgSend(v14, "initWithClientLocation:", v32));
        if (++v10 >= (unint64_t)sub_10104BD1C(*(int **)(a4 + 800)))
          return;
      }
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v6 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)v39 = 0;
        *(_WORD *)&v39[4] = 2082;
        *(_QWORD *)&v39[6] = "";
        v7 = "{\"msg%{public}.0s\":\"#ut received china shifted wifi location\"}";
        goto LABEL_37;
      }
    }
  }
  else if (a3 == 5)
  {
    if (*(_DWORD *)(a4 + 132) == 2)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v6 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)v39 = 0;
        *(_WORD *)&v39[4] = 2082;
        *(_QWORD *)&v39[6] = "";
        v7 = "{\"msg%{public}.0s\":\"#ut received china shifted location\"}";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 0x12u);
      }
    }
    else
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v21 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#ut received location", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v36) = 0;
        v31 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received location", &v36, 2);
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v31);
        if (v31 != (char *)buf)
          free(v31);
      }
      v22 = objc_msgSend(objc_alloc((Class)TALocationLite), "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:deltaDistance:deltaDistanceAccuracy:groundAltitude:groundAltitudeUncertainty:pressure:pressureUncertainty:isSimulatedOrSpoofed:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a4 + 76)), *(unsigned __int8 *)(a4 + 672), *(double *)(a4 + 4), *(double *)(a4 + 12), *(double *)(a4 + 20), *(double *)(a4 + 28), *(double *)(a4 + 36), *(double *)(a4 + 44), *(double *)(a4 + 52), *(double *)(a4 + 60), *(_QWORD *)(a4 + 68), *(_QWORD *)(a4 + 168),
              *(_QWORD *)(a4 + 176),
              *(_QWORD *)(a4 + 536),
              *(_QWORD *)(a4 + 544),
              *(_QWORD *)(a4 + 456),
              *(_QWORD *)(a4 + 464));
      objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v22);

      sub_1001795D0((uint64_t)a1 + 224, (__int128 *)a4, (char *)(a4 + 160));
      v23 = objc_alloc((Class)CLLocation);
      v24 = *(_OWORD *)(a4 + 112);
      v34[6] = *(_OWORD *)(a4 + 96);
      v34[7] = v24;
      v35[0] = *(_OWORD *)(a4 + 128);
      *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)(a4 + 140);
      v25 = *(_OWORD *)(a4 + 48);
      v34[2] = *(_OWORD *)(a4 + 32);
      v34[3] = v25;
      v26 = *(_OWORD *)(a4 + 80);
      v34[4] = *(_OWORD *)(a4 + 64);
      v34[5] = v26;
      v27 = *(_OWORD *)(a4 + 16);
      v34[0] = *(_OWORD *)a4;
      v34[1] = v27;
      objc_msgSend(a1, "updateZoneMonitorLocation:", objc_msgSend(v23, "initWithClientLocation:", v34));
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "#ut, received unhandled location notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v36) = 0;
      v20 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled location notification", &v36, 2);
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onLocationNotification:data:]", "%s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
  }
}

- (void)updateZoneMonitorLocation:(id)a3
{
  NSObject *v5;
  unsigned int v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  unsigned int v12;

  if (-[CLTrackingAvoidanceZoneMonitor onLocationUpdate:](self->_zoneMonitor, "onLocationUpdate:"))
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      v6 = -[CLTrackingAvoidanceZoneMonitor isInZone](self->_zoneMonitor, "isInZone");
      v8[0] = 68289282;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 1026;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut zone classification changed\", \"isInZone\":%{public}hhd}", (uint8_t *)v8, 0x18u);
    }
    v7 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 14, -[CLTrackingAvoidanceZoneMonitor isInZone](self->_zoneMonitor, "isInZone"), objc_msgSend(a3, "timestamp"));
    -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v7);

  }
}

- (void)ingestTAEventIfTAServiceRunning:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10020B1C8;
  v3[3] = &unk_10212BB30;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"), v3);
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  NSObject *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  double Current;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  void *__p[2];
  uint64_t v24;
  _WORD v25[8];
  uint8_t buf[16];
  uint64_t v27;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v6 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received advertisement", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v25[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received advertisement", v25, 2);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAvengerAdvertisement:reconciledInformation:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  v7 = +[TASPAdvertisement instancesRespondToSelector:](TASPAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:")));
  v8 = objc_alloc((Class)TASPAdvertisement);
  v9 = objc_msgSend(a3, "address");
  v10 = objc_msgSend(a3, "advertisementData");
  v11 = objc_msgSend(a3, "status");
  v12 = objc_msgSend(a3, "reserved");
  v13 = objc_msgSend(a3, "rssi");
  v14 = objc_msgSend(a3, "scanDate");
  if (v7)
  {
    LODWORD(v21) = objc_msgSend(a3, "detailsBitmask");
    v15 = objc_msgSend(v8, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:detailsBitmask:uuid:protocolID:", v9, v10, v11, v12, v13, v14, v21, objc_msgSend(a4, "uuid"), objc_msgSend(a3, "protocolID"));
  }
  else
  {
    v15 = objc_msgSend(v8, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:uuid:", v9, v10, v11, v12, v13, v14, objc_msgSend(a4, "uuid"));
  }
  v16 = v15;
  if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
  {
    if (objc_msgSend(a3, "isApple") && (objc_msgSend(a3, "isNearOwner") & 1) == 0)
    {
      v17 = (objc_msgSend(a3, "status") >> 4) & 1;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(a3, "status") & 0x10) == 0)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_16;
  }
  v17 = objc_msgSend(objc_msgSend(a3, "advertisementData"), "length") != 0;
LABEL_16:
  sub_1015A2E04(buf, (char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "address"), "hexString"), "UTF8String"));
  if (SHIBYTE(v27) < 0)
  {
    sub_100115CE4(__p, *(void **)buf, *(unint64_t *)&buf[8]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)buf;
    v24 = v27;
  }
  Current = CFAbsoluteTimeGetCurrent();
  sub_100228564((uint64_t)&self->_metrics, v17, (const void **)__p, Current);
  if (SHIBYTE(v24) < 0)
    operator delete(__p[0]);
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v16);

  if (SHIBYTE(v27) < 0)
    operator delete(*(void **)buf);
}

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
  if (qword_10230EB70 != -1)
    dispatch_once(&qword_10230EB70, &stru_1021B47F0);
  return (id)qword_10230EB68;
}

+ (BOOL)isSupported
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  v10 = 0;
  sub_1001E4804(&v8);
  v2 = sub_1001E4874(v8, "TrackingAvoidanceOn", &v10);
  v3 = v2;
  v4 = v9;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v3)
      return v10;
  }
  else
  {
LABEL_5:
    if (v2)
      return v10;
  }
  byte_10230EB78 = 1;
  if (qword_10230EB80 != -1)
    dispatch_once(&qword_10230EB80, &stru_1021B4810);
  return byte_10230EB78;
}

+ (id)convert:(id)a3 andObservationAction:(int64_t)a4
{
  id v5;
  id v6;
  SEL v7;
  uint64_t v8;
  NSInvocation *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  uint64_t v51;
  id v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unsigned __int8 v58;
  _BYTE v59[128];

  v5 = objc_msgSend(a3, "latestAdvertisement");
  if (+[SPUnauthorizedTrackingAdvertisement instancesRespondToSelector:](SPUnauthorizedTrackingAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:"))))
  {
    v6 = objc_msgSend(v5, "performSelector:", NSSelectorFromString(CFSTR("protocolID")));
    v7 = NSSelectorFromString(CFSTR("isPosh"));
    v9 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", objc_msgSend((id)objc_opt_class(v5, v8), "instanceMethodSignatureForSelector:", v7));
    -[NSInvocation setSelector:](v9, "setSelector:", v7);
    -[NSInvocation setTarget:](v9, "setTarget:", v5);
    -[NSInvocation invoke](v9, "invoke");
    v58 = 0;
    -[NSInvocation getReturnValue:](v9, "getReturnValue:", &v58);
    v10 = objc_alloc((Class)SPUnauthorizedTrackingAdvertisement);
    v11 = objc_msgSend(v5, "address");
    v12 = objc_msgSend(v5, "advertisementData");
    v13 = objc_msgSend(v5, "status");
    v14 = objc_msgSend(v5, "reserved");
    v15 = objc_msgSend(v5, "rssi");
    v16 = objc_msgSend(v5, "scanDate");
    v17 = v58;
    if (v6)
      v18 = objc_msgSend(v6, "intValue");
    else
      v18 = 0;
    BYTE1(v51) = v18;
    LOBYTE(v51) = v17 != 0;
    v19 = objc_msgSend(v10, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:", v11, v12, v13, v14, v15, v16, v51);
  }
  else
  {
    v19 = objc_msgSend(objc_alloc((Class)SPUnauthorizedTrackingAdvertisement), "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", objc_msgSend(v5, "address"), objc_msgSend(v5, "advertisementData"), objc_msgSend(v5, "status"), objc_msgSend(v5, "reserved"), objc_msgSend(v5, "rssi"), objc_msgSend(v5, "scanDate"));
  }
  v20 = v19;
  v21 = objc_alloc_init((Class)NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v52 = a3;
  v22 = objc_msgSend(a3, "locationHistory");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v26);
        v28 = objc_alloc((Class)SPObservationLocation);
        v29 = objc_msgSend(v27, "timestamp");
        objc_msgSend(v27, "latitude");
        v31 = v30;
        objc_msgSend(v27, "longitude");
        v33 = v32;
        objc_msgSend(v27, "horizontalAccuracy");
        v35 = v34;
        objc_msgSend(v27, "altitude");
        v37 = v36;
        objc_msgSend(v27, "verticalAccuracy");
        v39 = v38;
        objc_msgSend(v27, "speed");
        v41 = v40;
        objc_msgSend(v27, "speedAccuracy");
        v43 = v42;
        objc_msgSend(v27, "course");
        v45 = v44;
        objc_msgSend(v27, "courseAccuracy");
        v47 = objc_msgSend(v28, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", v29, 0, v31, v33, v35, v37, v39, v41, v43, v45, v46);
        objc_msgSend(v21, "addObject:", v47);

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v24);
  }
  v48 = objc_msgSend(objc_alloc((Class)SPUnauthorizedTrackingObservation), "initWithAction:type:trackingIdentifier:observedLocations:", a4, objc_msgSend(v52, "forceSurfaceReason") == (id)2, v20, v21);

  v49 = v48;
  return v48;
}

+ (id)convertRTLocationOfInterest:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  if (a3)
  {
    v4 = objc_msgSend(a3, "type");
    if (v4)
      v5 = 2 * (v4 == (id)1);
    else
      v5 = 1;
    v6 = objc_alloc((Class)TALocationOfInterest);
    objc_msgSend(objc_msgSend(v3, "location"), "latitude");
    v8 = v7;
    objc_msgSend(objc_msgSend(v3, "location"), "longitude");
    v10 = v9;
    objc_msgSend(objc_msgSend(v3, "location"), "horizontalUncertainty");
    v3 = objc_msgSend(v6, "initWithType:latitude:longitude:horizontalAccuracy:date:", v5, +[NSDate date](NSDate, "date"), v8, v10, v11);
    v12 = v3;
  }
  return v3;
}

- (CLTrackingAvoidanceService)init
{
  CLTrackingAvoidanceService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLTrackingAvoidanceService;
  v2 = -[CLTrackingAvoidanceService initWithInboundProtocol:outboundProtocol:](&v4, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTrackingAvoidanceServiceProtocol, &OBJC_PROTOCOL___CLTrackingAvoidanceClientProtocol);
  if (v2)
  {
    v2->_vehicleStateProxy = 0;
    -[CLTrackingAvoidanceService universe](v2, "universe");
    operator new();
  }
  return 0;
}

- (void)beginService
{
  NSObject *v3;
  char v4;
  BOOL v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  char v9;
  char v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  double v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  TATrackingAvoidanceServiceManager *v21;
  const char *v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  char *v26;
  _BYTE v27[12];
  _OWORD buf[102];

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ut initiating service", (uint8_t *)buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    *(_WORD *)v27 = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut initiating service", v27, 2);
    v23 = (char *)v22;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService beginService]", "%s\n", v22);
    if (v23 != (char *)buf)
      free(v23);
  }
  sub_100197040();
  if (sub_10075D288())
  {
    self->_allowDebugNotification = 1;
    sub_1001E4804(buf);
    v27[0] = 0;
    v4 = sub_1001E4874(*(uint64_t *)&buf[0], "TrackingAvoidanceAllowStagingNotification", v27);
    if (v27[0])
      v5 = v4;
    else
      v5 = 0;
    self->_allowStagedDetectionNotification = v5;
    v6 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
    if (*((_QWORD *)&buf[0] + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  else
  {
    self->_allowDebugNotification = 0;
    self->_allowStagedDetectionNotification = 0;
  }
  self->_SPOwnerSession = (SPOwnerSession *)objc_alloc_init((Class)SPOwnerSession);
  sub_100B3EA74((uint64_t)&self->_metrics);
  self->_settingsVersion = 1;
  self->_metrics.lastLocationPrivate.batchedLocationFixType = 0;
  sub_1001E4804(buf);
  v27[0] = 0;
  v9 = sub_1001E4874(*(uint64_t *)&buf[0], "TrackingAvoidanceAllowSimulatedEvents", v27);
  if (v27[0])
    v10 = v9;
  else
    v10 = 0;
  LOBYTE(self->_signalEnvironment) = v10;
  v11 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
  if (*((_QWORD *)&buf[0] + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  sub_1001E4804(buf);
  *(_QWORD *)v27 = 0;
  v14 = sub_1001FD98C(*(uint64_t *)&buf[0], "TrackingAvoidanceOwnerUTSamplingProbability", v27);
  v15 = *(double *)v27;
  if (!v14)
    v15 = 0.0;
  *(double *)&self->_metrics.lastLocationPrivate.isGnssFromRavenEstimators = v15;
  v16 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
  if (*((_QWORD *)&buf[0] + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v19 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    v20 = *(_QWORD *)&self->_metrics.lastLocationPrivate.isGnssFromRavenEstimators;
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "#ut owner UT sampling probability %lf", (uint8_t *)buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v24 = *(_QWORD *)&self->_metrics.lastLocationPrivate.isGnssFromRavenEstimators;
    *(_DWORD *)v27 = 134217984;
    *(_QWORD *)&v27[4] = v24;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut owner UT sampling probability %lf", COERCE_DOUBLE(v27));
    v26 = (char *)v25;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService beginService]", "%s\n", v25);
    if (v26 != (char *)buf)
      free(v26);
  }
  self->_maxDailyAggressiveScans = 50;
  self->_notificationThrottleMax = -1;
  self->_notificationThrottlePeriodHours = 24;
  self->_zoneMonitor = -[CLTrackingAvoidanceZoneMonitor initWithTimeZone:zoneBoundary:]([CLTrackingAvoidanceZoneMonitor alloc], "initWithTimeZone:zoneBoundary:", CFSTR("Asia/Seoul"), 32.4738662, 38.7975409, 123.760521, 132.275637);
  -[CLTrackingAvoidanceService registerForOTASettingsNotification](self, "registerForOTASettingsNotification");
  -[CLTrackingAvoidanceService registerForDurianService](self, "registerForDurianService");
  v21 = (TATrackingAvoidanceServiceManager *)objc_msgSend(objc_alloc((Class)TATrackingAvoidanceServiceManager), "initWithQueue:settings:", objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"), objc_alloc_init((Class)TASettings));
  self->_taServiceManager = v21;
  -[TATrackingAvoidanceServiceManager addDataSource:](v21, "addDataSource:", self);
  -[TATrackingAvoidanceServiceManager addObserver:](self->_taServiceManager, "addObserver:", self);
  self->_settingsSubscription.__ptr_.__value_ = (CLXOTASubscription *)objc_alloc_init((Class)NSMutableDictionary);
}

- (void)endService
{
  NSObject *v3;
  CLTrackingAvoidanceZoneMonitor *zoneMonitor;
  CLXOTASubscription *value;
  SPOwnerSession *SPOwnerSession;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ut terminating service", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut terminating service", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService endService]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[CLTrackingAvoidanceService unregisterForOTASettingsNotification](self, "unregisterForOTASettingsNotification");
  -[CLTrackingAvoidanceService unregisterForDurianService](self, "unregisterForDurianService");
  zoneMonitor = self->_zoneMonitor;
  if (zoneMonitor)
  {

    self->_zoneMonitor = 0;
  }
  value = self->_settingsSubscription.__ptr_.__value_;
  if (value)
  {

    self->_settingsSubscription.__ptr_.__value_ = 0;
  }
  SPOwnerSession = self->_SPOwnerSession;
  if (SPOwnerSession)
  {

    self->_SPOwnerSession = 0;
  }
  -[TATrackingAvoidanceServiceManager removeDataSource:](self->_taServiceManager, "removeDataSource:", self);

}

- (void)notifyCrucialStates
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  const char *v16;
  uint8_t *v17;
  _WORD v18[7];
  unsigned __int8 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;

  v3 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 10, LOBYTE(self->_signalEnvironment), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v3);

  v19 = 0;
  if ((objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDaemonStatus")), "syncgetAirplaneMode:", &v19) & 1) != 0)
  {
    v4 = objc_alloc((Class)TASystemState);
    v5 = objc_msgSend(v4, "initWithSystemStateType:isOn:date:", 3, v19, +[NSDate date](NSDate, "date"));
    -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v5);

  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut failed to fetch airplane mode state.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut failed to fetch airplane mode state.", v18, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService notifyCrucialStates]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
  }
  v7 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 7, (int)objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDaemonStatus")), "syncgetThermalLevel") > 9, +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v7);

  v8 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 4, objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDaemonStatus")), "syncgetBatterySaverMode"), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v8);

  v9 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 8, sub_10019CFA0() == 1, +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v9);

  v10 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 9, objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLLocationController")), "syncgetIsSimulationEnabled"), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v10);

  v11 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 11, objc_msgSend(objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDataProtectionManager")), "syncgetDeviceUnlockedSinceFirstBoot"), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v11);

  v12 = objc_msgSend(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"), "countryCode");
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v13 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v12, "UTF8String");
    *(_DWORD *)buf = 68289282;
    v21 = 0;
    v22 = 2082;
    v23 = "";
    v24 = 2082;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got last country code\", \"lastCountryCode\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v15 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 13, objc_msgSend(v12, "isEqualToString:", CFSTR("KR")), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v15);

}

- (void)registerForLeechedEvents
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received leeched event registration\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLTrackingAvoidanceService notifyCrucialStates](self, "notifyCrucialStates");
  -[CLTrackingAvoidanceService registerForDaemonStatusNotification](self, "registerForDaemonStatusNotification");
  -[CLTrackingAvoidanceService registerForClientManagerNotification](self, "registerForClientManagerNotification");
  -[CLTrackingAvoidanceService registerForGnssNotification](self, "registerForGnssNotification");
  -[CLTrackingAvoidanceService registerForMotionNotification](self, "registerForMotionNotification");
  -[CLTrackingAvoidanceService registerForLocationNotification](self, "registerForLocationNotification");
  -[CLTrackingAvoidanceService registerForRoutineMonitor](self, "registerForRoutineMonitor");
  -[CLTrackingAvoidanceService registerForWifiServiceNotification](self, "registerForWifiServiceNotification");
  -[CLTrackingAvoidanceService registerForBluetoothServiceNotification](self, "registerForBluetoothServiceNotification");
  -[CLTrackingAvoidanceService registerForVehicleStateNotification](self, "registerForVehicleStateNotification");
  -[CLTrackingAvoidanceService registerForSignalEnvironmentNotification](self, "registerForSignalEnvironmentNotification");
  -[CLTrackingAvoidanceService registerForGeoNavListener](self, "registerForGeoNavListener");
  -[CLTrackingAvoidanceService registerForDataProtectionNotification](self, "registerForDataProtectionNotification");
  -[CLTrackingAvoidanceService registerForGeoCountryCodeConfigurationNotification](self, "registerForGeoCountryCodeConfigurationNotification");
}

- (void)unregisterForLeechedEvents
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received leeched event unregistration\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLTrackingAvoidanceService unregisterForDaemonStatusNotification](self, "unregisterForDaemonStatusNotification");
  -[CLTrackingAvoidanceService unregisterForClientManagerNotification](self, "unregisterForClientManagerNotification");
  -[CLTrackingAvoidanceService unregisterForGnssNotification](self, "unregisterForGnssNotification");
  -[CLTrackingAvoidanceService unregisterForMotionNotification](self, "unregisterForMotionNotification");
  -[CLTrackingAvoidanceService unregisterForLocationNotification](self, "unregisterForLocationNotification");
  -[CLTrackingAvoidanceService unregisterForRoutineMonitor](self, "unregisterForRoutineMonitor");
  -[CLTrackingAvoidanceService unregisterForWifiServiceNotification](self, "unregisterForWifiServiceNotification");
  -[CLTrackingAvoidanceService unregisterForBluetoothServiceNotification](self, "unregisterForBluetoothServiceNotification");
  -[CLTrackingAvoidanceService unregisterForVehicleStateNotification](self, "unregisterForVehicleStateNotification");
  -[CLTrackingAvoidanceService unregisterForSignalEnvironmentNotification](self, "unregisterForSignalEnvironmentNotification");
  -[CLTrackingAvoidanceService unregisterForGeoNavListener](self, "unregisterForGeoNavListener");
  -[CLTrackingAvoidanceService unregisterForDataProtectionNotification](self, "unregisterForDataProtectionNotification");
  -[CLTrackingAvoidanceService unregisterForGeoCountryCodeConfigurationNotification](self, "unregisterForGeoCountryCodeConfigurationNotification");
}

- (void)registerForClientManagerNotification
{
  Client *value;
  std::string v3;

  value = self->_clientManagerClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_1001B6A0C();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 4, 0);
  memset(&v3, 0, sizeof(v3));
  std::string::operator=(&v3, &stru_10230EB50);
  sub_1018CE0BC();
}

- (void)unregisterForClientManagerNotification
{
  Client *value;

  value = self->_clientManagerClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 4);
    objc_msgSend(*((id *)self->_clientManagerClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_clientManagerClient.__ptr_.__value_ + 1), 0);
  }
  BYTE2(self->_signalEnvironment) = 0;
}

- (void)registerForGnssNotification
{
  if (!self->_gnssClient.__ptr_.__value_)
  {
    if (+[CLGnssProviderAdapter isSupported](CLGnssProviderAdapter, "isSupported"))
    {
      -[CLTrackingAvoidanceService universe](self, "universe");
      sub_100E087CC();
    }
  }
}

- (void)unregisterForGnssNotification
{
  Client *value;
  Client *v4;

  value = self->_gnssClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 13);
    v4 = self->_gnssClient.__ptr_.__value_;
    self->_gnssClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForLocationNotification
{
  Client *value;

  value = self->_locationClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_1006AA544();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 5, 0);
  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 22, 0);
}

- (void)unregisterForLocationNotification
{
  Client *value;
  Client *v4;

  value = self->_locationClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 5);
    objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 22);
    v4 = self->_locationClient.__ptr_.__value_;
    self->_locationClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForMotionNotification
{
  Client *value;

  value = self->_motionStateClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_100239888();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 3, 0);
}

- (void)unregisterForMotionNotification
{
  Client *value;
  Client *v4;

  value = self->_motionStateClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 3);
    v4 = self->_motionStateClient.__ptr_.__value_;
    self->_motionStateClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)registerForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *routineProxy;

  routineProxy = self->_routineProxy;
  if (!routineProxy)
  {
    routineProxy = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    self->_routineProxy = routineProxy;
  }
  -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](routineProxy, "registerDelegate:inSilo:", self, -[CLTrackingAvoidanceService silo](self, "silo"));
  -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:](self->_routineProxy, "startLeechingVisitsForClient:", CLISP_ME_TOKEN);
  -[CLRoutineMonitorServiceProtocol startLeechingLowConfidenceVisitsForClient:](self->_routineProxy, "startLeechingLowConfidenceVisitsForClient:", CLISP_ME_TOKEN);
  -[CLTrackingAvoidanceService requestImportantLoisIfNeeded](self, "requestImportantLoisIfNeeded");
}

- (void)registerForGeoCountryCodeConfigurationNotification
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1013E45D8;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch(GEOCountryConfigurationCountryCodeChangedDarwinNotification, &self->_countryCodeNotificationToken, (dispatch_queue_t)objc_msgSend(-[CLTrackingAvoidanceService silo](self, "silo"), "queue"), handler);
}

- (void)unregisterForGeoCountryCodeConfigurationNotification
{
  if (notify_is_valid_token(self->_countryCodeNotificationToken))
  {
    notify_cancel(self->_countryCodeNotificationToken);
    self->_countryCodeNotificationToken = -1;
  }
}

- (void)requestLoiRelatedTo:(id)a3
{
  NSObject *v5;
  double v6;
  uint8_t *v7;
  uint8_t *v8;
  NSObject *v9;
  double v10;
  uint8_t *v11;
  NSObject *v12;
  _WORD v13[8];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  if (self->_routineProxy)
  {
    if (a3)
    {
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "_loiIdentifier"))
      {
        -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestWithIdentifier:withReply:](self->_routineProxy, "fetchLocationOfInterestWithIdentifier:withReply:");
      }
      else
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v12 = qword_1022A0138;
        if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289283;
          v15 = 0;
          v16 = 2082;
          v17 = "";
          v18 = 2113;
          v19 = a3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #loi no inferred place\", \"visit\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
      }
      return;
    }
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#ut #loi cannot request LOI information for a nil visit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v13[0] = 0;
      v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 16, "#ut #loi cannot request LOI information for a nil visit", v13, 2);
      v8 = v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService requestLoiRelatedTo:]", "%s\n", v10);
LABEL_21:
      if (v8 != buf)
        free(v8);
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ut #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v13[0] = 0;
      v6 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 1, "#ut #loi skip requesting LOI information as routine monitor is no up", v13, 2);
      v8 = v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestLoiRelatedTo:]", "%s\n", v6);
      goto LABEL_21;
    }
  }
}

- (void)requestImportantLoisIfNeeded
{
  id v3;
  id v4;
  NSObject *v5;
  NSDate *lastLoiLabelQueryTimestamp;
  NSDate *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint8_t *v13;
  _QWORD v14[5];
  int v15;
  NSDate *v16;
  uint8_t buf[4];
  NSDate *v18;

  if (self->_routineProxy)
  {
    if (!self->_lastLoiLabelQueryTimestamp
      || (v3 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeInterval:sinceDate:", self->_lastLoiLabelQueryTimestamp, 86400.0), v4 = objc_msgSend(v3, "compare:", +[NSDate date](NSDate, "date")), v3, v4 == (id)-1))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1013E52D0;
      v14[3] = &unk_10212BB80;
      v14[4] = self;
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v9 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#ut #loi requesting LOI information for periodic update ...", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v15) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 1, "#ut #loi requesting LOI information for periodic update ...", &v15, 2);
        v12 = (uint8_t *)v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestImportantLoisIfNeeded]", "%s\n", v11);
        if (v12 != buf)
          free(v12);
      }
      -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](self->_routineProxy, "fetchLocationsOfInterestOfType:withReply:", 0, v14);
      -[CLRoutineMonitorServiceProtocol fetchLocationsOfInterestOfType:withReply:](self->_routineProxy, "fetchLocationsOfInterestOfType:withReply:", 1, v14);
    }
    else
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v5 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        lastLoiLabelQueryTimestamp = self->_lastLoiLabelQueryTimestamp;
        *(_DWORD *)buf = 138477827;
        v18 = lastLoiLabelQueryTimestamp;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut #loi skip requesting LOI information in batch because we had done so at %{private}@", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v7 = self->_lastLoiLabelQueryTimestamp;
        v15 = 138477827;
        v16 = v7;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut #loi skip requesting LOI information in batch because we had done so at %{private}@", &v15, 12);
LABEL_31:
        v13 = (uint8_t *)v8;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestImportantLoisIfNeeded]", "%s\n", v8);
        if (v13 != buf)
          free(v13);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ut #loi skip requesting LOI information as routine monitor is no up", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v15) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 1, "#ut #loi skip requesting LOI information as routine monitor is no up", &v15, 2);
      goto LABEL_31;
    }
  }
}

- (void)unregisterForRoutineMonitor
{
  CLRoutineMonitorServiceProtocol *routineProxy;
  NSDate *lastLoiLabelQueryTimestamp;

  routineProxy = self->_routineProxy;
  if (routineProxy)
  {
    -[CLRoutineMonitorServiceProtocol stopLeechingLowConfidenceVisitsForClient:](routineProxy, "stopLeechingLowConfidenceVisitsForClient:", CLISP_ME_TOKEN);
    -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineProxy, "stopLeechingVisitsForClient:", CLISP_ME_TOKEN);

  }
  self->_routineProxy = 0;
  lastLoiLabelQueryTimestamp = self->_lastLoiLabelQueryTimestamp;
  if (lastLoiLabelQueryTimestamp)
  {

    self->_lastLoiLabelQueryTimestamp = 0;
  }
}

- (void)registerForDaemonStatusNotification
{
  Client *value;

  value = self->_daemonStatusClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_100647FA8();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 0, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 1, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 2, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 3, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 6, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 8, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 10, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 15, 0);
  objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 13, 0);
}

- (void)unregisterForDaemonStatusNotification
{
  Client *value;

  value = self->_daemonStatusClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 1);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 2);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 3);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 6);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 8);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 10);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 15);
    objc_msgSend(*((id *)self->_daemonStatusClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_daemonStatusClient.__ptr_.__value_ + 1), 13);
  }
}

- (void)registerForWifiServiceNotification
{
  Client *value;

  value = self->_wifiServiceClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_1001B7DEC();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 1, 0);
}

- (void)unregisterForWifiServiceNotification
{
  Client *value;

  value = self->_wifiServiceClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 1);
  HIBYTE(self->_signalEnvironment) = 0;
}

- (void)registerForBluetoothServiceNotification
{
  Client *value;

  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_100C10C08();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 9, 0);
}

- (void)unregisterForBluetoothServiceNotification
{
  Client *value;

  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 9);
  BYTE1(self->_signalEnvironment) = 0;
}

- (void)registerForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *v3;
  _QWORD handler[5];

  if (objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "isServiceEnabled:", CFSTR("CLVehicleStateNotifier"))&& !self->_vehicleStateProxy)
  {
    v3 = (CLVehicleStateNotifierProtocol *)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLVehicleStateNotifier"));
    self->_vehicleStateProxy = v3;
    -[CLVehicleStateNotifierProtocol registerDelegate:inSilo:](v3, "registerDelegate:inSilo:", self, -[CLTrackingAvoidanceService silo](self, "silo"));
    -[CLVehicleStateNotifierProtocol setDelegateEntityName:](self->_vehicleStateProxy, "setDelegateEntityName:", "CLTrackingAvoidanceService");
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1013E5FD8;
  handler[3] = &unk_10213F4C0;
  handler[4] = self;
  notify_register_dispatch((const char *)objc_msgSend(kCMVehicularStateChangedNotification, "UTF8String"), &self->_vehicularToken, (dispatch_queue_t)objc_msgSend(-[CLTrackingAvoidanceService silo](self, "silo"), "queue"), handler);
}

- (void)unregisterForVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;

  if (notify_is_valid_token(self->_vehicularToken))
  {
    notify_cancel(self->_vehicularToken);
    self->_vehicularToken = -1;
  }
  vehicleStateProxy = self->_vehicleStateProxy;
  if (vehicleStateProxy)
  {

    self->_vehicleStateProxy = 0;
  }
}

- (void)registerForAvengerScanner
{
  NSObject *v3;
  CLTrackingAvoidanceBOMScanManager *bomScanManager;
  CLAvengerScannerServiceProtocol *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received avenger scanner registration\"}", (uint8_t *)v6, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (!self->_scannerClient)
    {
      self->_scannerClient = -[CLAvengerScannerClient initWithDelegate:queue:]([CLAvengerScannerClient alloc], "initWithDelegate:queue:", self, objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"));
      if (_os_feature_enabled_impl("BluetoothFeatures", "BeepOnMoveWake"))
      {
        bomScanManager = self->_bomScanManager;
        if (bomScanManager)
          -[CLTrackingAvoidanceBOMScanManager handleRegisterWithController:](bomScanManager, "handleRegisterWithController:", self->_scannerClient);
        else
          self->_bomScanManager = (CLTrackingAvoidanceBOMScanManager *)-[CLTrackingAvoidanceBOMScanManager initAndStartWithQueue:andController:]([CLTrackingAvoidanceBOMScanManager alloc], "initAndStartWithQueue:andController:", objc_msgSend(-[CLTrackingAvoidanceService silo](self, "silo"), "queue"), self->_scannerClient);
      }
    }
  }
  else if (!self->_avengerScannerProxy)
  {
    v5 = (CLAvengerScannerServiceProtocol *)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLAvengerScanner"));
    self->_avengerScannerProxy = v5;
    -[CLAvengerScannerServiceProtocol registerDelegate:inSilo:](v5, "registerDelegate:inSilo:", self, -[CLTrackingAvoidanceService silo](self, "silo"));
    -[CLAvengerScannerServiceProtocol setDelegateEntityName:](self->_avengerScannerProxy, "setDelegateEntityName:", "CLTrackingAvoidanceService");
    -[CLAvengerScannerServiceProtocol startMonitoringAvengerAdvertisementsForClient:clientName:](self->_avengerScannerProxy, "startMonitoringAvengerAdvertisementsForClient:clientName:", CLISP_ME_TOKEN, CFSTR("CLTrackingAvoidanceService"));
  }
}

- (void)unregisterForAvengerScanner
{
  NSObject *v3;
  CLTrackingAvoidanceBOMScanManager *bomScanManager;
  id *p_scannerClient;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received avenger scanner unregistration\"}", (uint8_t *)v6, 0x12u);
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
  {
    if (_os_feature_enabled_impl("BluetoothFeatures", "BeepOnMoveWake"))
    {
      bomScanManager = self->_bomScanManager;
      if (bomScanManager)
        -[CLTrackingAvoidanceBOMScanManager handleUnRegisterController](bomScanManager, "handleUnRegisterController");
    }
    p_scannerClient = (id *)&self->_scannerClient;
  }
  else
  {
    p_scannerClient = (id *)&self->_avengerScannerProxy;
    if (!*p_scannerClient)
      return;
    objc_msgSend(*p_scannerClient, "stopMonitoringAvengerAdvertisementsForClient:", CLISP_ME_TOKEN);
  }

  *p_scannerClient = 0;
}

- (void)registerForSignalEnvironmentNotification
{
  Client *value;

  value = self->_signalEnvironmentClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_100D7F93C();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 0, 0);
}

- (void)unregisterForSignalEnvironmentNotification
{
  Client *value;

  value = self->_signalEnvironmentClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 0);
}

- (void)registerForGeoNavListener
{
  GEONavigationListener *v3;

  if (!self->_geoNavListener)
  {
    v3 = (GEONavigationListener *)objc_msgSend(objc_alloc((Class)GEONavigationListener), "initWithQueue:", objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"));
    self->_geoNavListener = v3;
    -[GEONavigationListener setDelegate:](v3, "setDelegate:", self);
  }
}

- (void)unregisterForGeoNavListener
{
  GEONavigationListener *geoNavListener;

  geoNavListener = self->_geoNavListener;
  if (geoNavListener)
  {
    -[GEONavigationListener setDelegate:](geoNavListener, "setDelegate:", 0);

    self->_geoNavListener = 0;
  }
}

- (void)registerForDataProtectionNotification
{
  Client *value;

  value = self->_dataProtectionClient.__ptr_.__value_;
  if (!value)
  {
    -[CLTrackingAvoidanceService universe](self, "universe");
    sub_100E35814();
  }
  objc_msgSend(*((id *)value + 2), "register:forNotification:registrationInfo:", *((_QWORD *)value + 1), 1, 0);
}

- (void)unregisterForDataProtectionNotification
{
  Client *value;

  value = self->_dataProtectionClient.__ptr_.__value_;
  if (value)
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 1);
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  uint64_t v5;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  const char *v16;
  uint8_t *v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  int v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  int v26;

  LODWORD(v5) = a5;
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v8 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    v24 = a4;
    v25 = 1025;
    v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#ut received navigation hints - navState %{private}lu; transportType %{private}d",
      buf,
      0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19 = 134283777;
    v20 = a4;
    v21 = 1025;
    v22 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received navigation hints - navState %{private}lu; transportType %{private}d",
      &v19,
      18);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  if (v5 >= 7)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      LODWORD(v24) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#ut unsupported GEOTransportType %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v19 = 67174657;
      LODWORD(v20) = v5;
      LODWORD(v18) = 8;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 16, "#ut unsupported GEOTransportType %{private}d", &v19, v18);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    v5 = 4;
  }
  else
  {
    v5 = v5;
  }
  if (a4 >= 3)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134283521;
      v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#ut unsupported GEONavigationListenerState %{private}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v19 = 134283521;
      v20 = a4;
      LODWORD(v18) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 16, "#ut unsupported GEONavigationListenerState %{private}lu", &v19, v18);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService navigationListener:didChangeNavigationState:transportType:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    a4 = 0;
  }
  v11 = objc_msgSend(objc_alloc((Class)TAGeoNavigationNotification), "initWithTransportType:andNavigationState:date:", v5, a4, +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v11);

}

- (void)registerForOTASettingsNotification
{
  sub_1007530E0(*(_QWORD *)&self->_metrics.lastLocationPrivate.demFlatnessMetricData);
}

- (void)unregisterForOTASettingsNotification
{
  sub_100753348(*(_QWORD **)&self->_metrics.lastLocationPrivate.demFlatnessMetricData);
}

- (void)registerForDurianService
{
  NSObject *v3;
  CLDurianServiceProtocol *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ta register for durian service\"}", (uint8_t *)v5, 0x12u);
  }
  if (!self->_durianServiceProxy)
  {
    v4 = (CLDurianServiceProtocol *)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLDurianService"));
    self->_durianServiceProxy = v4;
    -[CLDurianServiceProtocol registerDelegate:inSilo:](v4, "registerDelegate:inSilo:", self, -[CLTrackingAvoidanceService silo](self, "silo"));
    -[CLDurianServiceProtocol setDelegateEntityName:](self->_durianServiceProxy, "setDelegateEntityName:", "CLTrackingAvoidanceService");
  }
}

- (void)unregisterForDurianService
{
  NSObject *v3;
  CLDurianServiceProtocol *durianServiceProxy;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ta unregister for durian service\"}", (uint8_t *)v5, 0x12u);
  }
  durianServiceProxy = self->_durianServiceProxy;
  if (durianServiceProxy)
  {

    self->_durianServiceProxy = 0;
  }
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _WORD v15[8];
  uint8_t buf[1640];

  if (a3)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut received visit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received visit", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onVisit:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v6 = objc_alloc((Class)TACLVisit);
    objc_msgSend(a3, "coordinate");
    v8 = v7;
    v10 = v9;
    objc_msgSend(a3, "horizontalAccuracy");
    v12 = objc_msgSend(v6, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", objc_msgSend(a3, "arrivalDate"), objc_msgSend(a3, "departureDate"), objc_msgSend(a3, "detectionDate"), 2, v8, v10, v11);
    -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v12);

    -[CLTrackingAvoidanceService requestLoiRelatedTo:](self, "requestLoiRelatedTo:", a3);
    -[CLTrackingAvoidanceService requestImportantLoisIfNeeded](self, "requestImportantLoisIfNeeded");
  }
}

- (void)onLowConfidenceVisit:(id)a3
{
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  const char *v13;
  uint8_t *v14;
  _WORD v15[8];
  uint8_t buf[1640];

  if (a3)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#ut received low confidence visit", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received low confidence visit", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onLowConfidenceVisit:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    v6 = objc_alloc((Class)TACLVisit);
    objc_msgSend(a3, "coordinate");
    v8 = v7;
    v10 = v9;
    objc_msgSend(a3, "horizontalAccuracy");
    v12 = objc_msgSend(v6, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", objc_msgSend(a3, "arrivalDate"), objc_msgSend(a3, "departureDate"), objc_msgSend(a3, "detectionDate"), 1, v8, v10, v11);
    -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v12);

    -[CLTrackingAvoidanceService requestLoiRelatedTo:](self, "requestLoiRelatedTo:", a3);
    -[CLTrackingAvoidanceService requestImportantLoisIfNeeded](self, "requestImportantLoisIfNeeded");
  }
}

- (void)onMotionStateNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  double v10;
  uint8_t *v11;
  uint8_t *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  double v16;
  uint8_t *v17;
  uint64_t v18;
  _WORD v19[8];
  uint8_t buf[1640];

  if (a3 != 3)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled motion notification", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19[0] = 0;
    v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled motion notification", v19, 2);
    v12 = v11;
    sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n", v10);
LABEL_41:
    if (v12 != buf)
      free(v12);
    return;
  }
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v6 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received motion state", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received motion state", v19, 2);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n", v14);
    if (v15 != buf)
      free(v15);
  }
  if ((CLMotionActivity::isInVehicle((CLMotionActivity *)a4) & 1) != 0
    || (CLMotionActivity::isDriving((CLMotionActivity *)a4) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((CLMotionActivity::isWalking((CLMotionActivity *)a4) & 1) != 0
         || (CLMotionActivity::isRunning((CLMotionActivity *)a4) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((CLMotionActivity::isStatic((CLMotionActivity *)a4) & 1) != 0)
  {
    v7 = 1;
  }
  else if (CLMotionActivity::isCycling((CLMotionActivity *)a4))
  {
    v7 = 4;
  }
  else
  {
    v7 = 0;
  }
  if (*(double *)(a4 + 80) > 0.0)
  {
    v8 = objc_msgSend(objc_alloc((Class)TAUserActivity), "initWithActivityType:date:", v7, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a4 + 80)));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v8);

    return;
  }
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v13 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#ut received invalid motion timestamp", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19[0] = 0;
    LODWORD(v18) = 2;
    v16 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received invalid motion timestamp", v19, v18);
    v12 = v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onMotionStateNotification:data:]", "%s\n", v16);
    goto LABEL_41;
  }
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  int v9;
  double v10;
  uint8_t *v11;
  uint8_t *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  uint8_t *v17;
  _DWORD v18[4];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;

  if (a3)
  {
    if (a3 == 4)
    {
      a1[1162] = *(_DWORD *)(a4 + 188) != 0;
      v6 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 8, *(_DWORD *)(a4 + 188) == 1, +[NSDate date](NSDate, "date"));
      objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v6);

      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v7 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_DWORD *)(a4 + 188);
        *(_DWORD *)buf = 67174657;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#ut received client status locationServiceEnabled: %{private}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v9 = *(_DWORD *)(a4 + 188);
        v18[0] = 67174657;
        v18[1] = v9;
        v10 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received client status locationServiceEnabled: %{private}d", v18, 8);
        v12 = v11;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onClientManagerNotification:data:]", "%s\n", v10);
LABEL_24:
        if (v12 != buf)
          free(v12);
      }
    }
    else
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "#ut, received unhandled location client manager notification", buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v18[0]) = 0;
        v16 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled location client manager notification", v18, 2);
        v12 = v17;
        sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onClientManagerNotification:data:]", "%s\n", v16);
        goto LABEL_24;
      }
    }
  }
  else
  {
    v13 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 12, 1, +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v13);

    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v14 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location and privacy reset notification\"}", buf, 0x12u);
    }
  }
}

- (void)onGnssNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _WORD v12[8];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;

  if (a3 == 13)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a4 + 824);
      *(_DWORD *)buf = 68289282;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2050;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut received location simulation event\", \"SimulationStatus\":%{public}ld}", buf, 0x1Cu);
    }
    v8 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 9, *(unsigned __int8 *)(a4 + 824), +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v8);

  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled location notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v12[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled location notification", v12, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onGnssNotification:data:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
  }
}

- (void)onAggressiveScanStarted
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#ut received scan started", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received scan started", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAggressiveScanStarted]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = objc_msgSend(objc_alloc((Class)TAAggressiveScanState), "initWithState:date:", 2, +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v4);

}

- (void)onAggressiveScanEnded
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v3 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#ut received scan ended", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received scan ended", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAggressiveScanEnded]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
  v4 = objc_msgSend(objc_alloc((Class)TAAggressiveScanState), "initWithState:date:", 1, +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v4);

}

- (void)onAdvertisementBufferEmptied
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _WORD v5[8];
  uint8_t buf[1640];

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v2 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#ut received scan buffer emptied", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received scan buffer emptied", v5, 2);
    v4 = (uint8_t *)v3;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onAdvertisementBufferEmptied]", "%s\n", v3);
    if (v4 != buf)
      free(v4);
  }
}

- (id)clientIdentifier
{
  return CFSTR("CLTrackingAvoidanceService");
}

- (void)onNotOptedInBOMScanEnded
{
  if (_os_feature_enabled_impl("BluetoothFeatures", "BeepOnMoveWake"))
    -[CLTrackingAvoidanceBOMScanManager scanCompleted](self->_bomScanManager, "scanCompleted");
}

- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4
{
  NSObject *v6;
  uint8_t *v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  uint8_t *v16;
  uint8_t *v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int v30;
  id v31;
  const char *v32;
  uint8_t *v33;
  const char *v34;
  uint8_t *v35;
  int v36;
  const char *v37;
  uint8_t *v38;
  int v39;
  const char *v40;
  uint8_t *v41;
  int v42;
  const char *v43;
  uint8_t *v44;
  int v45;
  const char *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  int v53;

  switch(a3)
  {
    case 0:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v6 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received daemon status: initialize", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v48) = 0;
        v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status: initialize", &v48, 2, v48, v49);
        goto LABEL_47;
      }
      return;
    case 1:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v9 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#ut received daemon status: shutdown", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v48) = 0;
        v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status: shutdown", &v48, 2, v48, v49);
        goto LABEL_47;
      }
      return;
    case 2:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#ut received daemon status: device sleep", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v48) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status: device sleep", &v48, 2);
        v33 = (uint8_t *)v32;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v32);
        if (v33 != buf)
          free(v33);
      }
      v11 = 0;
      goto LABEL_24;
    case 3:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v13 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#ut received daemon status: device awake", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        LOWORD(v48) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status: device awake", &v48, 2);
        v35 = (uint8_t *)v34;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v34);
        if (v35 != buf)
          free(v35);
        v11 = 1;
LABEL_24:
        v12 = 1;
      }
      else
      {
        v12 = 1;
        v11 = 1;
      }
      goto LABEL_74;
    case 6:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v18 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v19 = *a4;
        v20 = a4[1];
        *(_DWORD *)buf = 67174913;
        v51 = v19;
        v52 = 1025;
        v53 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#ut received daemon status reachability change: %{private}d -> %{private}d", buf, 0xEu);
      }
      if (!sub_1001BFF7C(115, 2))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v21 = *a4;
      v22 = a4[1];
      LODWORD(v48) = 67174913;
      HIDWORD(v48) = v21;
      LOWORD(v49) = 1025;
      *(_DWORD *)((char *)&v49 + 2) = v22;
      v8 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status reachability change: %{private}d -> %{private}d", &v48, 14, v48, v49);
LABEL_47:
      v17 = v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v8);
      goto LABEL_48;
    case 8:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v23 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v24 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        v51 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "#ut received daemon status airplaneMode: %{private}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v36 = *(unsigned __int8 *)a4;
        LODWORD(v48) = 67174657;
        HIDWORD(v48) = v36;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status airplaneMode: %{private}d", &v48, 8);
        v38 = (uint8_t *)v37;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v37);
        if (v38 != buf)
          free(v38);
      }
      v11 = *(_BYTE *)a4 != 0;
      v12 = 3;
      goto LABEL_74;
    case 10:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v25 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v26 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        v51 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "#ut received daemon status displayOn: %{private}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v39 = *(unsigned __int8 *)a4;
        LODWORD(v48) = 67174657;
        HIDWORD(v48) = v39;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status displayOn: %{private}d", &v48, 8);
        v41 = (uint8_t *)v40;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v40);
        if (v41 != buf)
          free(v41);
      }
      v11 = *(_BYTE *)a4 != 0;
      v12 = 2;
      goto LABEL_74;
    case 13:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v27 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v28 = *a4;
        *(_DWORD *)buf = 67174657;
        v51 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "#ut received daemon status thermalLevel: %{private}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v42 = *a4;
        LODWORD(v48) = 67174657;
        HIDWORD(v48) = v42;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status thermalLevel: %{private}d", &v48, 8);
        v44 = (uint8_t *)v43;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v43);
        if (v44 != buf)
          free(v44);
      }
      v11 = *a4 > 9;
      v12 = 7;
      goto LABEL_74;
    case 15:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v29 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v30 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67174657;
        v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "#ut received daemon status batterSaveMode: %{private}d", buf, 8u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v45 = *(unsigned __int8 *)a4;
        LODWORD(v48) = 67174657;
        HIDWORD(v48) = v45;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received daemon status batterSaveMode: %{private}d", &v48, 8);
        v47 = (uint8_t *)v46;
        sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v46);
        if (v47 != buf)
          free(v47);
      }
      v11 = *(_BYTE *)a4 != 0;
      v12 = 4;
LABEL_74:
      v31 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", v12, v11, +[NSDate date](NSDate, "date"));
      objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v31);

      return;
    default:
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "#ut, received unhandled daemon status notification", buf, 2u);
      }
      if (!sub_1001BFF7C(115, 0))
        return;
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v48) = 0;
      v15 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled daemon status notification", &v48, 2);
      v17 = v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onDaemonStatusNotification:data:]", "%s\n", v15);
LABEL_48:
      if (v17 != buf)
        free(v17);
      return;
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(unsigned __int8 *)a4
{
  NSObject *v6;
  int v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  if (a3 == 1)
  {
    a1[1163] = *a4;
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      v7 = *a4;
      *(_DWORD *)buf = 67174657;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received wifi service event - power state %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = *a4;
      v15[0] = 67174657;
      v15[1] = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received wifi service event - power state %{private}d", v15, 8);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onWifiServiceNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v8 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 6, *a4, +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v8);

  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled wifi service notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled wifi service notification", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onWifiServiceNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (void)onBluetoothServiceNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v6;
  int v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  const char *v13;
  uint8_t *v14;
  _DWORD v15[4];
  uint8_t buf[4];
  int v17;

  if (a3 == 9)
  {
    a1[1161] = *(_BYTE *)(a4 + 113);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(unsigned __int8 *)(a4 + 113);
      *(_DWORD *)buf = 67174657;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received bluetooth service event - power state %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = *(unsigned __int8 *)(a4 + 113);
      v15[0] = 67174657;
      v15[1] = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received bluetooth service event - power state %{private}d", v15, 8);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onBluetoothServiceNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    v8 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 5, *(unsigned __int8 *)(a4 + 113), +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v8);

  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "#ut, received unhandled bluetooth service notification", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v15[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#ut, received unhandled bluetooth service notification", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService onBluetoothServiceNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (uint64_t)onSignalEnvironmentNotification:(int)a3 data:(int)a4
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  if (!a3)
  {
    v5 = result;
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received signal environment event - value %{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v9[0] = 67174657;
      v9[1] = a4;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received signal environment event - value %{private}d", v9, 8);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onSignalEnvironmentNotification:data:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
    *(_DWORD *)(v5 + 1136) = a4;
    return sub_100B453CC(v5 + 224, a4);
  }
  return result;
}

- (void)onVehicleStateNotification
{
  CLVehicleStateNotifierProtocol *vehicleStateProxy;
  _QWORD v4[5];

  objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo");
  vehicleStateProxy = self->_vehicleStateProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1013E9858;
  v4[3] = &unk_102161158;
  v4[4] = self;
  -[CLVehicleStateNotifierProtocol fetchVehicularDndStateAndHintsAndOperatorStateWithReply:](vehicleStateProxy, "fetchVehicularDndStateAndHintsAndOperatorStateWithReply:", v4);
}

- (void)onDataProtectionNotification:(int)a3 data:(unint64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint8_t *v10;
  _DWORD v11[4];
  uint8_t buf[4];
  int v13;

  if (a3 == 1)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v6 = qword_1022A0138;
    v7 = HIDWORD(a4) & 1;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#ut received keybag unlock notification state:%{private}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v11[0] = 67174657;
      v11[1] = v7;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut received keybag unlock notification state:%{private}d", v11, 8);
      v10 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService onDataProtectionNotification:data:]", "%s\n", v9);
      if (v10 != buf)
        free(v10);
    }
    v8 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 11, v7, +[NSDate date](NSDate, "date"));
    objc_msgSend(a1, "ingestTAEventIfTAServiceRunning:", v8);

  }
}

- (void)onGeoCountryConfigurationChanged:(id)a3
{
  NSObject *v5;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = objc_msgSend(a3, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received country code\", \"CountryCode\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  v6 = objc_msgSend(objc_alloc((Class)TASystemState), "initWithSystemStateType:isOn:date:", 13, objc_msgSend(a3, "isEqualToString:", CFSTR("KR")), +[NSDate date](NSDate, "date"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v6);

}

- (void)handleNotificationMetrics:(id)a3
{
  CLTrackingAvoidanceMetrics *p_metrics;
  NSArray *v6;
  double Current;
  id v8;
  id v9;
  double v10;
  id v11;

  p_metrics = &self->_metrics;
  v11 = a3;
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1);
  Current = CFAbsoluteTimeGetCurrent();
  sub_100B40E3C((uint64_t)p_metrics, v6, Current);
  v8 = objc_msgSend(a3, "latestAdvertisement");
  v9 = objc_msgSend(a3, "detectionMetrics");
  v10 = CFAbsoluteTimeGetCurrent();
  sub_100B431C0((uint64_t)p_metrics, v8, v9, self->_settingsVersion, v10);
}

- (void)notifyTAWithDeviceInformation:(id)a3 type:(unint64_t)a4 state:(unint64_t)a5 date:(id)a6
{
  id v7;

  v7 = objc_msgSend(objc_alloc((Class)TADeviceInformation), "initWithTASPAdvertisement:deviceType:notificationState:date:", a3, a4, a5, a6);
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v7);

}

- (BOOL)suspiciousDeviceContainsKoreaLocations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CLTrackingAvoidanceZoneMonitor *zoneMonitor;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(a3, "locationHistory", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        zoneMonitor = self->_zoneMonitor;
        objc_msgSend(v9, "latitude");
        v12 = v11;
        objc_msgSend(v9, "longitude");
        v14 = v13;
        objc_msgSend(v9, "horizontalAccuracy");
        if (-[CLTrackingAvoidanceZoneMonitor locationIsInZoneWithLatitude:longitude:horizontalAccuracy:](zoneMonitor, "locationIsInZoneWithLatitude:longitude:horizontalAccuracy:", v12, v14, v15))
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  unsigned int v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double Current;
  id v14;
  NSObject *v15;
  id v16;
  SPOwnerSession *SPOwnerSession;
  const char *v18;
  uint8_t *v19;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _WORD v25[8];
  uint8_t v26[128];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;

  v6 = -[CLTrackingAvoidanceService shouldThrottleNotification](self, "shouldThrottleNotification", a3);
  if (v6)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v7 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#ut notifications throttled", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v25[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut notifications throttled", v25, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService trackingAvoidanceService:didFindSuspiciousDevices:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11);
        if (v6)
        {
          -[CLTrackingAvoidanceService handleNotificationMetrics:](self, "handleNotificationMetrics:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11));
        }
        else if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11)))
        {
          -[CLTrackingAvoidanceService notifyTAWithDeviceInformation:type:state:date:](self, "notifyTAWithDeviceInformation:type:state:date:", objc_msgSend(v12, "latestAdvertisement"), 0, 2, +[NSDate now](NSDate, "now"));
          Current = CFAbsoluteTimeGetCurrent();
          sub_100B44E54((uint64_t)&self->_metrics, CFSTR("ContainsKoreaLocationsInDetection"), self->_settingsVersion, Current);
        }
        else
        {
          v14 = objc_alloc_init((Class)NSMutableSet);
          objc_msgSend(v14, "addObject:", +[CLTrackingAvoidanceService convert:andObservationAction:](CLTrackingAvoidanceService, "convert:andObservationAction:", v12, 1));
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v15 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "address"), "hexString"), "UTF8String");
            *(_DWORD *)buf = 68289283;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            v31 = 2081;
            v32 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for suspicious device\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          SPOwnerSession = self->_SPOwnerSession;
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1013EA468;
          v20[3] = &unk_1021B4838;
          v20[4] = self;
          v20[5] = v12;
          -[SPOwnerSession didObserveUnauthorizedTrackingWithCompletion:completion:](SPOwnerSession, "didObserveUnauthorizedTrackingWithCompletion:completion:", v14, v20);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
}

+ (unint64_t)convertSPDetectedDeviceTypeToTADeviceType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_101CA1A58[a3];
}

+ (id)convertSPTrackingAvoidanceErrorToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB)
    return CFSTR("UncategorizedError");
  else
    return off_1021B49B8[a3 - 1];
}

+ (id)convertSPUnauthorizedTrackingObservationActionToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("Unknown");
  else
    return off_1021B4A18[a3];
}

- (void)resolveAndUpdateTADeviceRecordStatusFor:(id)a3 withCompletion:(id)a4
{
  SEL v7;
  uint64_t v8;
  NSInvocation *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  int v17;
  id v18;
  void *v19;
  SPOwnerSession *SPOwnerSession;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[7];
  unsigned __int8 v25;

  if (a3)
  {
    if (+[SPUnauthorizedTrackingAdvertisement instancesRespondToSelector:](SPUnauthorizedTrackingAdvertisement, "instancesRespondToSelector:", NSSelectorFromString(CFSTR("initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:"))))
    {
      v23 = objc_msgSend(a3, "performSelector:", NSSelectorFromString(CFSTR("protocolID")));
      v7 = NSSelectorFromString(CFSTR("isPosh"));
      v9 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", objc_msgSend((id)objc_opt_class(a3, v8), "instanceMethodSignatureForSelector:", v7));
      -[NSInvocation setSelector:](v9, "setSelector:", v7);
      -[NSInvocation setTarget:](v9, "setTarget:", a3);
      -[NSInvocation invoke](v9, "invoke");
      v25 = 0;
      -[NSInvocation getReturnValue:](v9, "getReturnValue:", &v25);
      v22 = objc_alloc((Class)SPUnauthorizedTrackingAdvertisement);
      v10 = objc_msgSend(a3, "address");
      v11 = objc_msgSend(a3, "advertisementData");
      v12 = objc_msgSend(a3, "status");
      v13 = objc_msgSend(a3, "reserved");
      v14 = objc_msgSend(a3, "rssi");
      v15 = objc_msgSend(a3, "scanDate");
      v16 = v23;
      v17 = v25;
      if (v23)
        v16 = objc_msgSend(v23, "intValue");
      BYTE1(v21) = v16;
      LOBYTE(v21) = v17 != 0;
      v18 = objc_msgSend(v22, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:isPosh:networkID:", v10, v11, v12, v13, v14, v15, v21);
    }
    else
    {
      v18 = objc_msgSend(objc_alloc((Class)SPUnauthorizedTrackingAdvertisement), "initWithAddress:advertisementData:status:reserved:rssi:scanDate:", objc_msgSend(a3, "address"), objc_msgSend(a3, "advertisementData"), objc_msgSend(a3, "status"), objc_msgSend(a3, "reserved"), objc_msgSend(a3, "rssi"), objc_msgSend(a3, "scanDate"));
    }
    v19 = v18;
    SPOwnerSession = self->_SPOwnerSession;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1013EAC3C;
    v24[3] = &unk_1021B4888;
    v24[4] = self;
    v24[5] = a3;
    v24[6] = a4;
    -[SPOwnerSession unauthorizedTrackingTypeWithCompletion:completion:](SPOwnerSession, "unauthorizedTrackingTypeWithCompletion:completion:", v19, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD v35[7];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[7];
  _WORD v41[8];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[1640];
  _BYTE v52[128];
  _BYTE v53[128];

  v4 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v33 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v33)
  {
    v6 = *(_QWORD *)v47;
    v34 = TAOutgoingRequestsAdditionalScanningKey;
    v32 = TAOutgoingRequestsInterVisitMetricsDonationKey;
    v31 = TAOutgoingRequestsVisitMetricsDonationKey;
    v28 = TAOutgoingRequestsAdditionalHawkeyeLowEnergyScanningKey;
    v29 = *(_QWORD *)v47;
    v30 = v4;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v7);
        if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v34))
        {
          -[CLTrackingAvoidanceService requestScan](self, "requestScan");
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v32))
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v9 = objc_msgSend(v8, "additionalInformation");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v43;
LABEL_13:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(v9);
              v14 = objc_msgSend(objc_msgSend(v8, "additionalInformation"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v13));
              v15 = objc_msgSend(v14, "latestAdvertisement");
              if (!v15)
                break;
              v40[0] = _NSConcreteStackBlock;
              v40[1] = 3221225472;
              v40[2] = sub_1013EB544;
              v40[3] = &unk_1021B48B0;
              v40[4] = self;
              v40[5] = v15;
              v40[6] = v14;
              -[CLTrackingAvoidanceService resolveAndUpdateTADeviceRecordStatusFor:withCompletion:](self, "resolveAndUpdateTADeviceRecordStatusFor:withCompletion:", v15, v40);
              if (v11 == (id)++v13)
              {
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
                v6 = v29;
                v4 = v30;
                if (v11)
                  goto LABEL_13;
                goto LABEL_8;
              }
            }
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
            v24 = qword_1022A0138;
            if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "#trackingAvoidanceService:requestingAdditionalInformation null advertisement", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 0))
              return;
            bzero(buf, 0x65CuLL);
            if (qword_1022A0130 != -1)
              goto LABEL_50;
LABEL_48:
            v41[0] = 0;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "#trackingAvoidanceService:requestingAdditionalInformation null advertisement", v41, 2);
            v27 = (uint8_t *)v26;
            sub_100512490("Generic", 1, 0, 0, "-[CLTrackingAvoidanceService trackingAvoidanceService:requestingAdditionalInformation:]", "%s\n", v26);
            if (v27 != buf)
              free(v27);
            return;
          }
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v31))
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v16 = objc_msgSend(v8, "additionalInformation");
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v37;
LABEL_23:
            v20 = 0;
            while (1)
            {
              if (*(_QWORD *)v37 != v19)
                objc_enumerationMutation(v16);
              v21 = objc_msgSend(objc_msgSend(v8, "additionalInformation"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v20));
              v22 = objc_msgSend(v21, "latestAdvertisement");
              if (!v22)
                break;
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_1013EB6D0;
              v35[3] = &unk_1021B48B0;
              v35[4] = self;
              v35[5] = v22;
              v35[6] = v21;
              -[CLTrackingAvoidanceService resolveAndUpdateTADeviceRecordStatusFor:withCompletion:](self, "resolveAndUpdateTADeviceRecordStatusFor:withCompletion:", v22, v35);
              if (v18 == (id)++v20)
              {
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
                v6 = v29;
                v4 = v30;
                if (v18)
                  goto LABEL_23;
                goto LABEL_8;
              }
            }
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
            v25 = qword_1022A0138;
            if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "#trackingAvoidanceService:requestingAdditionalInformation null advertisement", buf, 2u);
            }
            if (!sub_1001BFF7C(115, 0))
              return;
            bzero(buf, 0x65CuLL);
            if (qword_1022A0130 != -1)
LABEL_50:
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
            goto LABEL_48;
          }
        }
        else if (objc_msgSend(objc_msgSend(v8, "key"), "isEqualToString:", v28))
        {
          -[CLTrackingAvoidanceService requestHawkeyeLowEnergyScan](self, "requestHawkeyeLowEnergyScan");
        }
LABEL_8:
        v7 = (char *)v7 + 1;
      }
      while (v7 != v33);
      v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      v33 = v23;
      if (v23)
        continue;
      break;
    }
  }
}

- (void)trackingAvoidanceService:(id)a3 didUpdateSuspiciousDevices:(id)a4
{
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double Current;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 68289283;
    v15 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", v11, v15))
        {
          Current = CFAbsoluteTimeGetCurrent();
          sub_100B44E54((uint64_t)&self->_metrics, CFSTR("ContainsKoreaLocationsInUpdate"), self->_settingsVersion, Current);
        }
        else
        {
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v13 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_msgSend(objc_msgSend(objc_msgSend(v11, "address"), "hexString"), "UTF8String");
            *(_DWORD *)buf = v15;
            v21 = 0;
            v22 = 2082;
            v23 = "";
            v24 = 2081;
            v25 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for updates on new observations\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          -[CLTrackingAvoidanceService submitUtObservationActionOfType:forDevice:](self, "submitUtObservationActionOfType:forDevice:", 2, v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v8);
  }
}

- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4
{
  NSObject *v5;
  id v6;
  _BOOL4 allowStagedDetectionNotification;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double Current;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void **v19;
  void **v20;
  CFUserNotificationRef v21;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  const char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *__p[2];
  char v34;
  void *v35[2];
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _WORD v45[8];
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _BOOL4 v55;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend(a4, "count");
    allowStagedDetectionNotification = self->_allowStagedDetectionNotification;
    *(_DWORD *)buf = 68289539;
    v49 = 0;
    v50 = 2082;
    v51 = "";
    v52 = 2049;
    v53 = v6;
    v54 = 1025;
    v55 = allowStagedDetectionNotification;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got staged devices\", \"count\":%{private}lu, \"allowNotification\":%{private}hhd}", buf, 0x22u);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v10);
        if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", v11))
        {
          Current = CFAbsoluteTimeGetCurrent();
          sub_100B44E54((uint64_t)&self->_metrics, CFSTR("ContainsKoreaLocationsInStaging"), self->_settingsVersion, Current);
        }
        else
        {
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v13 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_msgSend(objc_msgSend(objc_msgSend(v11, "address"), "hexString"), "UTF8String");
            *(_DWORD *)buf = 68289283;
            v49 = 0;
            v50 = 2082;
            v51 = "";
            v52 = 2081;
            v53 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for staged suspicious device\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          -[CLTrackingAvoidanceService submitUtObservationActionOfType:forDevice:](self, "submitUtObservationActionOfType:forDevice:", 0, v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v8);
  }
  if (self->_allowStagedDetectionNotification)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v15)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(a4);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v16);
          sub_1015A2E04(v35, (char *)objc_msgSend(objc_msgSend(objc_msgSend(v17, "address"), "hexString"), "UTF8String"));
          sub_1015A2E04(__p, (char *)objc_msgSend(objc_msgSend(objc_msgSend(v17, "detectionSummary"), "description"), "UTF8String"));
          v18 = objc_alloc_init((Class)NSMutableDictionary);
          if (v36 >= 0)
            v19 = v35;
          else
            v19 = (void **)v35[0];
          objc_msgSend(v18, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Staging UT for %@"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19)), kCFUserNotificationAlertHeaderKey);
          objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Tap-to-Radar"), kCFUserNotificationAlternateButtonTitleKey);
          objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Dismiss"), kCFUserNotificationDefaultButtonTitleKey);
          if (v34 >= 0)
            v20 = __p;
          else
            v20 = (void **)__p[0];
          objc_msgSend(v18, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20), kCFUserNotificationAlertMessageKey);
          v21 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v18);

          if (v21)
          {
            CFRetain(v21);
            RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v21, (CFUserNotificationCallBack)sub_1013F58AC, 0);
            if (RunLoopSource)
            {
              v23 = (__CFRunLoop *)sub_100193530();
              CFRunLoopAddSource(v23, RunLoopSource, kCFRunLoopCommonModes);
              CFRelease(RunLoopSource);
              CFRelease(v21);
              goto LABEL_47;
            }
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
            v27 = qword_1022A0138;
            if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Could not create runloop source for UT staged user notification", buf, 2u);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0130 != -1)
                dispatch_once(&qword_1022A0130, &stru_1021B4958);
              v45[0] = 0;
              LODWORD(v30) = 2;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "Could not create runloop source for UT staged user notification", v45, v30);
              v26 = (uint8_t *)v28;
              sub_100512490("Generic", 1, 0, 0, "void displayStagedUTUserNotification(const std::string &, const std::string &)", "%s\n", v28);
LABEL_56:
              if (v26 != buf)
                free(v26);
            }
          }
          else
          {
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
            v24 = qword_1022A0138;
            if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Could not create UT staged user notification", buf, 2u);
            }
            if (sub_1001BFF7C(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0130 != -1)
                dispatch_once(&qword_1022A0130, &stru_1021B4958);
              v45[0] = 0;
              LODWORD(v30) = 2;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "Could not create UT staged user notification", v45, v30);
              v26 = (uint8_t *)v25;
              sub_100512490("Generic", 1, 0, 0, "void displayStagedUTUserNotification(const std::string &, const std::string &)", "%s\n", v25);
              goto LABEL_56;
            }
          }
LABEL_47:
          if (v34 < 0)
            operator delete(__p[0]);
          if (v36 < 0)
            operator delete(v35[0]);
          v16 = (char *)v16 + 1;
        }
        while (v15 != v16);
        v29 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        v15 = v29;
      }
      while (v29);
    }
  }
}

- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4
{
  NSObject *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double Current;
  NSObject *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t buf;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v6 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    buf = 68289283;
    v23 = 2082;
    v24 = "";
    v25 = 2049;
    v26 = objc_msgSend(a4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut got unstaged devices\", \"count\":%{private}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 68289283;
    v16 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(a4);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        if (-[CLTrackingAvoidanceService suspiciousDeviceContainsKoreaLocations:](self, "suspiciousDeviceContainsKoreaLocations:", v12, v16))
        {
          Current = CFAbsoluteTimeGetCurrent();
          sub_100B44E54((uint64_t)&self->_metrics, CFSTR("ContainsKoreaLocationsInUnstaging"), self->_settingsVersion, Current);
        }
        else
        {
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v14 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(objc_msgSend(objc_msgSend(v12, "address"), "hexString"), "UTF8String");
            buf = v16;
            v23 = 2082;
            v24 = "";
            v25 = 2081;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut notifying SPD for unstaged suspicious device\", \"address\":%{private, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
          -[CLTrackingAvoidanceService submitUtObservationActionOfType:forDevice:](self, "submitUtObservationActionOfType:forDevice:", 3, v12);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
}

- (void)submitUtObservationActionOfType:(int64_t)a3 forDevice:(id)a4
{
  id v7;
  SPOwnerSession *SPOwnerSession;
  _QWORD v9[7];

  v7 = objc_alloc_init((Class)NSMutableSet);
  objc_msgSend(v7, "addObject:", +[CLTrackingAvoidanceService convert:andObservationAction:](CLTrackingAvoidanceService, "convert:andObservationAction:", a4, a3));
  SPOwnerSession = self->_SPOwnerSession;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1013EC52C;
  v9[3] = &unk_1021B48D8;
  v9[5] = a4;
  v9[6] = a3;
  v9[4] = self;
  -[SPOwnerSession didObserveUnauthorizedTrackingWithCompletion:completion:](SPOwnerSession, "didObserveUnauthorizedTrackingWithCompletion:completion:", v7, v9);

}

- (void)trackingAvoidanceService:(id)a3 didRequestAIS:(id)a4
{
  -[CLTrackingAvoidanceService fetchAISInfoForTAUnknownBeacon:client:](self, "fetchAISInfoForTAUnknownBeacon:client:", a4, CLISP_ME_TOKEN);
}

- (void)cancelAISFetchTimeoutForDevice:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v5 = objc_msgSend(-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3), "timoutBlock");
    if (v5)
    {
      v6 = v5;
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v7 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 68289539;
        v8[1] = 0;
        v9 = 2082;
        v10 = "";
        v11 = 2113;
        v12 = a3;
        v13 = 1026;
        v14 = 1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch cancelling timeout\", \"uuid\":%{private, location:escape_only}@, \"scheduledBlock\":%{public}hhd}", (uint8_t *)v8, 0x22u);
      }
      dispatch_block_cancel(v6);
    }
  }
}

- (void)scheduleAISFetchTimeoutForDevice:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_block_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v5 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch scheduling timeout\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  -[CLTrackingAvoidanceService cancelAISFetchTimeoutForDevice:](self, "cancelAISFetchTimeoutForDevice:", a3);
  v6 = dispatch_time(0, 605000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1013ECD08;
  v8[3] = &unk_10212BB30;
  v8[4] = self;
  v8[5] = a3;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  objc_msgSend(-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3), "setTimoutBlock:", v7);
  dispatch_after(v6, (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"), v7);
  _Block_release(v7);
}

- (void)didFetchHawkeyeAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS productData", "{\"msg%{public}.0s\":\"#ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setProductData:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS productData\", \"uuid\":%{private, location:escape_only}@, \"productData\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS productData for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS manufacturer name", "{\"msg%{public}.0s\":\"#ut fails to receive AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setManufacturerName:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name\", \"uuid\":%{private, location:escape_only}@, \"manufacturerName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS manufacturer name for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS manufacturer name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS model name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS model name", "{\"msg%{public}.0s\":\"#ut fails to receive AIS model name\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setModelName:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS model name\", \"uuid\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS model name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS model name for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS model name for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchFirmwareVersion:(id)a3 fromTag:(id)a4 withError:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a4))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a4);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a4;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a4;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS firmware version", "{\"msg%{public}.0s\":\"#ut fails to receive AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setFirmwareVersion:", a3);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a4;
        v21 = 2113;
        v22 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS firmware version\", \"uuid\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS firmware version for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS firmware version for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS firmware version for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS accessory category", "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setAccessoryCategory:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"accessoryCategory\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS accessory category for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS accessory category for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS accessory category for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchHawkeyeAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut fails to receive AIS accessory capabilities", "{\"msg%{public}.0s\":\"#ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setAccessoryCapabilities:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISProductDataFromDevice:(id)a3 productData:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS productData", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS productData\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setProductData:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS productData\", \"uuid\":%{private, location:escape_only}@, \"productData\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS productData for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS productData for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISManufacturerNameFromDevice:(id)a3 manufacturerName:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS manufacturerName", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setManufacturerName:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName\", \"uuid\":%{private, location:escape_only}@, \"manufacturerName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS manufacturerName for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS manufacturerName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISModelNameFromDevice:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS modelName", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setModelName:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName\", \"uuid\":%{private, location:escape_only}@, \"modelName\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS modelName for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS modelName for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISProtocolImplementationFromDevice:(id)a3 protocolImplementation:(unsigned int)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  SEL v14;
  NSObject *v15;
  const char *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2113;
        v24 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS protocolImplementation\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2113;
        v24 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS protocolImplementation", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS protocolImplementation\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
      return;
    }
    v14 = NSSelectorFromString(CFSTR("protocolImplementation"));
    if ((objc_opt_respondsToSelector(objc_msgSend(v9, "accessoryInfo"), v14) & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setProtocolImplementation:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2049;
        v24 = (id)a4;
        v16 = "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation\", \"uuid\":%{private, location:escap"
              "e_only}@, \"protocolImplementation\":%{private}ld}";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v17, 0x26u);
      }
    }
    else
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2049;
        v24 = (id)a4;
        v16 = "{\"msg%{public}.0s\":\"#posh #ut AIS protocolImplementation not sent to TA\", \"uuid\":%{private, location"
              ":escape_only}@, \"protocolImplementation\":%{private}ld}";
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS protocolImplementation for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS protocolImplementation for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
    }
  }
}

- (void)didFetchAISAccessoryCategoryFromDevice:(id)a3 accessoryCategory:(unsigned __int8)a4 error:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v15 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v8 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v8, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v9 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = a3;
        v22 = 2113;
        v23 = a5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory accessoryCategory\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v10 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        *(_DWORD *)buf = 68289539;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = a3;
        v22 = 2113;
        v23 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS accessory accessoryCategory", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory accessoryCategory\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      objc_msgSend(v8, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v8, "accessoryInfo"), "setAccessoryCategory:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v15, 1));
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v13 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(objc_msgSend(v8, "accessoryInfo"), "accessoryCategory");
        *(_DWORD *)buf = 68289539;
        v17 = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2113;
        v21 = a3;
        v22 = 2113;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory category\", \"uuid\":%{private, location:escape_only}@, \"accessoryCategory\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v11 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289283;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v12 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      *(_DWORD *)buf = 68289283;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)didFetchAISAccessoryCapabilitiesFromDevice:(id)a3 accessoryCapabilities:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS accessory capabilities", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setAccessoryCapabilities:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities\", \"uuid\":%{private, location:escape_only}@, \"accessoryCapabilities\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS accessory capabilities for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS accessory capabilities for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISNetworkIDFromDevice:(id)a3 networkID:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  SEL v14;
  NSObject *v15;
  const char *v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;

  v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2113;
        v24 = (unint64_t)a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2113;
        v24 = (unint64_t)a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS networkID", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
      return;
    }
    v14 = NSSelectorFromString(CFSTR("networkID"));
    if ((objc_opt_respondsToSelector(objc_msgSend(v9, "accessoryInfo"), v14) & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), CFSTR("networkID"));
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2049;
        v24 = v6;
        v16 = "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID\", \"uuid\":%{private, location:escape_only}@, \"n"
              "etworkID\":%{private}ld}";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v17, 0x26u);
      }
    }
    else
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v15 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = a3;
        v23 = 2049;
        v24 = v6;
        v16 = "{\"msg%{public}.0s\":\"#posh #ut AIS networkID not sent to TA\", \"uuid\":%{private, location:escape_only}"
              "@, \"networkID\":%{private}ld}";
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS networkID for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS networkID for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
    }
  }
}

- (void)didFetchAISFirmwareVersionFromDevice:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut fails to receive AIS firmwareVersion", "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
      objc_msgSend(v9, "setAllSuccess:", 0);
    }
    else
    {
      objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setFirmwareVersion:", a4);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = 68289539;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = a3;
        v21 = 2113;
        v22 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion\", \"uuid\":%{private, location:escape_only}@, \"firmwareVersion\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v13 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#posh #ut received AIS firmwareVersion for unknown device", "{\"msg%{public}.0s\":\"#posh #ut received AIS firmwareVersion for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

- (void)didFetchAISBatteryTypeFromDevice:(id)a3 batteryType:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  SEL v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;

  v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (!a5)
    {
      v18 = NSSelectorFromString(CFSTR("batteryType"));
      if ((objc_opt_respondsToSelector(objc_msgSend(v9, "accessoryInfo"), v18) & 1) != 0)
      {
        objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), CFSTR("batteryType"));
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v19 = qword_1022A0138;
        if (!os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
          return;
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2049;
        v28 = v6;
        v20 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType\", \"uuid\":%{private, location:escape_only}@, \"
              "batteryType\":%{private}ld}";
      }
      else
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v19 = qword_1022A0138;
        if (!os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
          return;
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2049;
        v28 = v6;
        v20 = "{\"msg%{public}.0s\":\"#posh #ut AIS batteryType not sent to TA\", \"uuid\":%{private, location:escape_onl"
              "y}@, \"batteryType\":%{private}ld}";
      }
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v21, 0x26u);
      return;
    }
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v21 = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2113;
      v28 = (unint64_t)a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryType\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x26u);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v11 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v21 = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2113;
      v28 = (unint64_t)a5;
      v12 = "#posh #ut fails to receive AIS batteryType";
      v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryType\", \"uuid\":%{private, location:escape_onl"
            "y}@, \"error\":%{private, location:escape_only}@}";
      v14 = v11;
      v15 = 38;
LABEL_17:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v21, v15);
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v16 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v17 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v12 = "#posh #ut received AIS batteryType for unknown device";
      v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryType for unknown device\", \"uuid\":%{private, location:escape_only}@}";
      v14 = v17;
      v15 = 28;
      goto LABEL_17;
    }
  }
}

- (void)didFetchAISBatteryLevelFromDevice:(id)a3 batteryLevel:(unsigned __int8)a4 error:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  SEL v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;

  v6 = a4;
  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (a5)
    {
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v10 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
      {
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2113;
        v28 = (unint64_t)a5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryLevel\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x26u);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
      }
      v11 = qword_1022A0138;
      if (os_signpost_enabled((os_log_t)qword_1022A0138))
      {
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2113;
        v28 = (unint64_t)a5;
        v12 = "#posh #ut fails to receive AIS batteryLevel";
        v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS batteryLevel\", \"uuid\":%{private, location:escape_"
              "only}@, \"error\":%{private, location:escape_only}@}";
        v14 = v11;
        v15 = 38;
LABEL_17:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v21, v15);
      }
    }
    else
    {
      v18 = NSSelectorFromString(CFSTR("batteryLevel"));
      if ((objc_opt_respondsToSelector(objc_msgSend(v9, "accessoryInfo"), v18) & 1) != 0)
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v19 = qword_1022A0138;
        if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
        {
          v21 = 68289539;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2113;
          v26 = a3;
          v27 = 2049;
          v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel\", \"uuid\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld}", (uint8_t *)&v21, 0x26u);
        }
        objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6), CFSTR("batteryLevel"));
      }
      else
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v20 = qword_1022A0138;
        if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
        {
          v21 = 68289539;
          v22 = 0;
          v23 = 2082;
          v24 = "";
          v25 = 2113;
          v26 = a3;
          v27 = 2049;
          v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#posh #ut AIS batteryLevel not sent to TA\", \"uuid\":%{private, location:escape_only}@, \"batteryLevel\":%{private}ld}", (uint8_t *)&v21, 0x26u);
        }
      }
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v16 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v17 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v12 = "#posh #ut received AIS batteryLevel for unknown device";
      v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS batteryLevel for unknown device\", \"uuid\":%{private, locatio"
            "n:escape_only}@}";
      v14 = v17;
      v15 = 28;
      goto LABEL_17;
    }
  }
}

- (void)didFetchAISSerialNumberFromDevice:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  SEL v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  if (-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:"))
  {
    v9 = -[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", a3);
    dispatch_group_leave((dispatch_group_t)objc_msgSend(v9, "fetchGroup"));
    if (!a5)
    {
      v18 = NSSelectorFromString(CFSTR("serialNumber"));
      if ((objc_opt_respondsToSelector(objc_msgSend(v9, "accessoryInfo"), v18) & 1) != 0)
      {
        objc_msgSend(objc_msgSend(v9, "accessoryInfo"), "setValue:forKey:", a4, CFSTR("serialNumber"));
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v19 = qword_1022A0138;
        if (!os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
          return;
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2113;
        v28 = a4;
        v20 = "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber\", \"uuid\":%{private, location:escape_only}@, "
              "\"serialNumber\":%{private, location:escape_only}@}";
      }
      else
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v19 = qword_1022A0138;
        if (!os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
          return;
        v21 = 68289539;
        v22 = 0;
        v23 = 2082;
        v24 = "";
        v25 = 2113;
        v26 = a3;
        v27 = 2113;
        v28 = a4;
        v20 = "{\"msg%{public}.0s\":\"#posh #ut AIS serialNumber not sent to TA\", \"uuid\":%{private, location:escape_on"
              "ly}@, \"serialNumber\":%{private, location:escape_only}@}";
      }
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v21, 0x26u);
      return;
    }
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v21 = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2113;
      v28 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS serialNumber\", \"uuid\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x26u);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v11 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v21 = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2113;
      v28 = a5;
      v12 = "#posh #ut fails to receive AIS serialNumber";
      v13 = "{\"msg%{public}.0s\":\"#posh #ut fails to receive AIS serialNumber\", \"uuid\":%{private, location:escape_on"
            "ly}@, \"error\":%{private, location:escape_only}@}";
      v14 = v11;
      v15 = 38;
LABEL_17:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&v21, v15);
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v16 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber for unknown device\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v21, 0x1Cu);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
    }
    v17 = qword_1022A0138;
    if (os_signpost_enabled((os_log_t)qword_1022A0138))
    {
      v21 = 68289283;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v12 = "#posh #ut received AIS serialNumber for unknown device";
      v13 = "{\"msg%{public}.0s\":\"#posh #ut received AIS serialNumber for unknown device\", \"uuid\":%{private, locatio"
            "n:escape_only}@}";
      v14 = v17;
      v15 = 28;
      goto LABEL_17;
    }
  }
}

- (BOOL)shouldThrottleNotification
{
  NSDate *v3;
  uint64_t v4;
  NSDate *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t notificationThrottleMax;
  const char *v14;
  unint64_t notificationThrottlePeriodHours;
  unint64_t v16;
  const char *v17;
  unint64_t v18;
  const char *v19;
  char *v20;
  int v21;
  double v22;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  NSDate *v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  NSDate *v41;

  if (!self->_notificationThrottleMax)
    return 1;
  if (!self->_notificationThrottlePeriodHours)
    return 0;
  v22 = 0.0;
  v3 = +[NSDate date](NSDate, "date");
  v21 = 0;
  v4 = sub_1001FD94C();
  if (sub_1001FD98C(v4, "TACountThrottlePeriodLastResetTimestamp", &v22)
    && (v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v22), (id)-[NSDate compare:](-[NSDate dateByAddingTimeInterval:](v5, "dateByAddingTimeInterval:", (double)(3600 * self->_notificationThrottlePeriodHours)), "compare:", v3) == (id)1))
  {
    v6 = sub_1001FD94C();
    sub_1001E4B84(v6, "TACountNotificationsInThrottlePeriod", &v21);
    v3 = v5;
  }
  else
  {
    v8 = sub_1001FD94C();
    -[NSDate timeIntervalSinceReferenceDate](v3, "timeIntervalSinceReferenceDate");
    *(_QWORD *)buf = v9;
    sub_10018A4CC(v8, "TACountThrottlePeriodLastResetTimestamp", buf);
    v10 = sub_1001FD94C();
    *(_DWORD *)buf = 0;
    sub_10011B4E4(v10, "TACountNotificationsInThrottlePeriod", buf);
    v11 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 944))(v11);
  }
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v12 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
  {
    notificationThrottleMax = self->_notificationThrottleMax;
    v14 = "Do";
    notificationThrottlePeriodHours = self->_notificationThrottlePeriodHours;
    if (v21 < (int)notificationThrottleMax)
      v14 = "Don't";
    *(_DWORD *)buf = 136316163;
    *(_QWORD *)&buf[4] = v14;
    v34 = 1025;
    v35 = v21;
    v36 = 2049;
    v37 = notificationThrottleMax;
    v38 = 2049;
    v39 = notificationThrottlePeriodHours;
    v40 = 2113;
    v41 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "#ut %s throttle notifications, %{private}d/%{private}lu in %{private}lu hours, last reset %{private}@", buf, 0x30u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v16 = self->_notificationThrottleMax;
    v17 = "Do";
    if (v21 < (int)v16)
      v17 = "Don't";
    v18 = self->_notificationThrottlePeriodHours;
    v23 = 136316163;
    v24 = v17;
    v25 = 1025;
    v26 = v21;
    v27 = 2049;
    v28 = v16;
    v29 = 2049;
    v30 = v18;
    v31 = 2113;
    v32 = v3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut %s throttle notifications, %{private}d/%{private}lu in %{private}lu hours, last reset %{private}@", &v23, 48);
    v20 = (char *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService shouldThrottleNotification]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  return self->_notificationThrottleMax <= v21;
}

- (void)incrementNotifications
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  if (self->_notificationThrottleMax)
  {
    if (self->_notificationThrottlePeriodHours)
    {
      v6 = 0;
      v2 = sub_1001FD94C();
      sub_1001E4B84(v2, "TACountNotificationsInThrottlePeriod", &v6);
      v3 = sub_1001FD94C();
      v5 = v6 + 1;
      sub_10011B4E4(v3, "TACountNotificationsInThrottlePeriod", &v5);
      v4 = sub_1001FD94C();
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 944))(v4);
    }
  }
}

- (id)getTrackingAvoidanceSettingsWithOTASettings:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSNumber *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSNumber *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSNumber *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CFTypeRef v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[2];
  void (*v74)(uint64_t, void *);
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];

  sub_1001E4804(&v80);
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
  v5 = v4;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3321888768;
  v74 = sub_1013F1EC4;
  v75 = &unk_1021B4900;
  v78 = v80;
  v79 = v81;
  if (v81)
  {
    p_shared_owners = (unint64_t *)&v81->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v76 = v4;
  v77 = a3;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v8 = +[TASettings getBooleanSettingsKeys](TASettings, "getBooleanSettingsKeys");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v70;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v11);
        LOBYTE(v64) = 0;
        if (sub_1001E4874(v80, (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 1), (BOOL *)&v64))
        {
          v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v64);
        }
        else
        {
          if (!objc_msgSend(a3, "objectForKeyedSubscript:", v12))
            goto LABEL_14;
          v13 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:", v12);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);
LABEL_14:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    }
    while (v9);
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v14 = +[TASettings getDoubleSettingsKeys](TASettings, "getDoubleSettingsKeys");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
  if (!v15)
    goto LABEL_28;
  v16 = *(_QWORD *)v66;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v66 != v16)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v17);
      v64 = 0;
      if (sub_1001FD98C(v80, (const char *)objc_msgSend(v18, "cStringUsingEncoding:", 1), &v64))
      {
        v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)&v64);
      }
      else
      {
        if (!objc_msgSend(a3, "objectForKeyedSubscript:", v18))
          goto LABEL_26;
        v19 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:", v18);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v18);
LABEL_26:
      v17 = (char *)v17 + 1;
    }
    while (v15 != v17);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
  }
  while (v15);
LABEL_28:
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v20 = +[TASettings getIntegerSettingsKeys](TASettings, "getIntegerSettingsKeys");
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
  if (!v21)
    goto LABEL_40;
  v22 = *(_QWORD *)v61;
  while (2)
  {
    v23 = 0;
    while (2)
    {
      if (*(_QWORD *)v61 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v23);
      LODWORD(v64) = 0;
      if (sub_1001E4B84(v80, (const char *)objc_msgSend(v24, "cStringUsingEncoding:", 1), &v64))
      {
        v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v64);
        goto LABEL_37;
      }
      if (objc_msgSend(a3, "objectForKeyedSubscript:", v24))
      {
        v25 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:", v24);
LABEL_37:
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v24);
      }
      if (v21 != (id)++v23)
        continue;
      break;
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
    if (v21)
      continue;
    break;
  }
LABEL_40:
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v26 = +[TASettings getUnsignedIntegerSettingsKeys](TASettings, "getUnsignedIntegerSettingsKeys");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
  if (!v27)
    goto LABEL_52;
  v28 = *(_QWORD *)v57;
  while (2)
  {
    v29 = 0;
    while (2)
    {
      if (*(_QWORD *)v57 != v28)
        objc_enumerationMutation(v26);
      v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v29);
      LODWORD(v64) = 0;
      if (sub_100526244(v80, (const char *)objc_msgSend(v30, "cStringUsingEncoding:", 1), &v64))
      {
        v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v64);
        goto LABEL_49;
      }
      if (objc_msgSend(a3, "objectForKeyedSubscript:", v30))
      {
        v31 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:", v30);
LABEL_49:
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, v30);
      }
      if (v27 != (id)++v29)
        continue;
      break;
    }
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
    if (v27)
      continue;
    break;
  }
LABEL_52:
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v32 = +[TASettings getStringSettingsKeys](TASettings, "getStringSettingsKeys");
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v83, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v53;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v53 != v34)
          objc_enumerationMutation(v32);
        v74((uint64_t)v73, *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v35));
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v83, 16);
    }
    while (v33);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v36 = +[TASettings getArraySettingsKeys](TASettings, "getArraySettingsKeys", 0);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v82, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v49;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(v36);
        v40 = *(const __CFString **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v39);
        v64 = 0;
        if (sub_100527258(v80, v40, &v64))
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v64), v40);
        }
        else if (objc_msgSend(a3, "objectForKeyedSubscript:", v40))
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v40), v40);
        }
        v39 = (char *)v39 + 1;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v48, v82, 16);
    }
    while (v37);
  }
  v41 = v79;
  if (v79)
  {
    v42 = (unint64_t *)&v79->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v44 = v81;
  if (v81)
  {
    v45 = (unint64_t *)&v81->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  return v5;
}

- (void)onUpdatedSettings:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  CLTrackingAvoidanceBOMScanManager *bomScanManager;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[8];
  _BYTE v29[10];
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v3 = -[CLTrackingAvoidanceService getTrackingAvoidanceSettingsWithOTASettings:](self, "getTrackingAvoidanceSettingsWithOTASettings:");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v6);
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v8 = qword_1022A0138;
        if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_msgSend(v7, "UTF8String");
          v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v7);
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)v29 = 2082;
          *(_QWORD *)&v29[2] = "";
          v30 = 2081;
          v31 = v9;
          v32 = 2113;
          v33 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut onUpdatedSetting\", \"key\":%{private, location:escape_only}s, \"value\":%{private, location:escape_only}@}", buf, 0x26u);
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v4);
  }
  v11 = objc_msgSend(objc_alloc((Class)TASettings), "initWithSettings:", v3);
  self->_maxDailyAggressiveScans = (unint64_t)objc_msgSend(v11, "maximumDailyScans");
  self->_notificationThrottlePeriodHours = (unint64_t)objc_msgSend(v11, "notificationThrottleHours");
  self->_notificationThrottleMax = (unint64_t)objc_msgSend(v11, "notificationThrottleMaxPerPeriod");
  -[TATrackingAvoidanceServiceManager onUpdatedSettings:](self->_taServiceManager, "onUpdatedSettings:", v11);
  self->_settingsVersion = (unint64_t)objc_msgSend(v11, "settingsVersion");

  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "TrackingAvoidanceRemainingBOMScansStartingValue"));
  if (v12)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v13 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v29 = 2082;
      *(_QWORD *)&v29[2] = "";
      v30 = 2113;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut got OTA BOM Scan Count\", \"count\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v23 = objc_msgSend(v12, "unsignedIntegerValue");
    sub_1001E4804(buf);
    sub_100019BD4(*(uint64_t *)buf, "TrackingAvoidanceRemainingBOMScansStartingValue", &v23);
    v14 = *(std::__shared_weak_count **)v29;
    if (*(_QWORD *)v29)
    {
      v15 = (unint64_t *)(*(_QWORD *)v29 + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    sub_1001E4804(buf);
    sub_100569514(*(uint64_t *)buf);
    v17 = *(std::__shared_weak_count **)v29;
    if (*(_QWORD *)v29)
    {
      v18 = (unint64_t *)(*(_QWORD *)v29 + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    bomScanManager = self->_bomScanManager;
    if (bomScanManager)
      -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](bomScanManager, "setRemainingBOMScansTo:", v23);
  }
}

- (void)requestScan
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSComparisonResult v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t maxDailyAggressiveScans;
  unint64_t v13;
  const char *v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint8_t *v19;
  int v20;
  double v21;
  _DWORD v22[2];
  __int16 v23;
  unint64_t v24;
  uint8_t buf[8];
  __int16 v26;
  unint64_t v27;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
    v3 = 48;
  else
    v3 = 32;
  if (!*(_QWORD *)&self->CLIntersiloService_opaque[v3])
    return;
  v21 = 0.0;
  v20 = 0;
  v4 = sub_1001FD94C();
  if (sub_1001FD98C(v4, "TACountAggressiveScansLastResetTimestamp", &v21))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    objc_msgSend(v5, "setTimeZone:", +[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
    v6 = objc_msgSend(v5, "startOfDayForDate:", +[NSDate now](NSDate, "now"));

    v7 = -[NSDate compare:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v21), "compare:", v6);
    v8 = sub_1001FD94C();
    if (v7 != NSOrderedAscending)
    {
      sub_1001E4B84(v8, "TACountAggressiveScans", &v20);
      goto LABEL_10;
    }
    *(_DWORD *)buf = 0;
    sub_10011B4E4(v8, "TACountAggressiveScans", buf);
  }
  v9 = sub_1001FD94C();
  *(_QWORD *)buf = CFAbsoluteTimeGetCurrent();
  sub_10018A4CC(v9, "TACountAggressiveScansLastResetTimestamp", buf);
LABEL_10:
  if (self->_maxDailyAggressiveScans <= v20)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v11 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      maxDailyAggressiveScans = self->_maxDailyAggressiveScans;
      *(_DWORD *)buf = 67174913;
      *(_DWORD *)&buf[4] = v20;
      v26 = 2049;
      v27 = maxDailyAggressiveScans;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#ut Aggressive scan requested but daily limit already reached: %{private}d / %{private}lu", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v13 = self->_maxDailyAggressiveScans;
      v22[0] = 67174913;
      v22[1] = v20;
      v23 = 2049;
      v24 = v13;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut Aggressive scan requested but daily limit already reached: %{private}d / %{private}lu", v22, 18);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestScan]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ut Performing aggressive scan", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v22[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut Performing aggressive scan", v22, 2);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestScan]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
    if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
      -[CLAvengerScannerClient performTemporaryAggressiveScan](self->_scannerClient, "performTemporaryAggressiveScan");
    else
      -[CLAvengerScannerServiceProtocol performTemporaryAggressiveScan:](self->_avengerScannerProxy, "performTemporaryAggressiveScan:", CLISP_ME_TOKEN);
    v16 = sub_1001FD94C();
    *(_DWORD *)buf = v20 + 1;
    sub_10011B4E4(v16, "TACountAggressiveScans", buf);
    v17 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 944))(v17);
  }
}

- (void)requestHawkeyeLowEnergyScan
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSComparisonResult v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  unsigned int v18;
  double v19;
  _DWORD v20[2];
  __int16 v21;
  uint64_t v22;
  uint8_t buf[8];
  __int16 v24;
  uint64_t v25;

  if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
    v3 = 48;
  else
    v3 = 32;
  if (!*(_QWORD *)&self->CLIntersiloService_opaque[v3])
    return;
  v19 = 0.0;
  v18 = 0;
  v4 = sub_1001FD94C();
  if (sub_1001FD98C(v4, "TACountHawkeyeLowEnergyScansLastResetTimestamp", &v19))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    objc_msgSend(v5, "setTimeZone:", +[NSTimeZone timeZoneWithAbbreviation:](NSTimeZone, "timeZoneWithAbbreviation:", CFSTR("UTC")));
    v6 = objc_msgSend(v5, "startOfDayForDate:", +[NSDate now](NSDate, "now"));

    v7 = -[NSDate compare:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v19), "compare:", v6);
    v8 = sub_1001FD94C();
    if (v7 != NSOrderedAscending)
    {
      sub_1001E4B84(v8, "TACountHawkeyeLowEnergyScans", &v18);
      goto LABEL_10;
    }
    *(_DWORD *)buf = 0;
    sub_10011B4E4(v8, "TACountHawkeyeLowEnergyScans", buf);
  }
  v9 = sub_1001FD94C();
  *(_QWORD *)buf = CFAbsoluteTimeGetCurrent();
  sub_10018A4CC(v9, "TACountHawkeyeLowEnergyScansLastResetTimestamp", buf);
LABEL_10:
  if (v18 < 0x18)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v13 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#ut Performing hawkeye low energy scan", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(v20[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut Performing hawkeye low energy scan", v20, 2);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestHawkeyeLowEnergyScan]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    if (_os_feature_enabled_impl("BluetoothFeatures", "SentinelNewLocationFeatures"))
      -[CLAvengerScannerClient performTemporaryHawkeyeLowEnergyScan](self->_scannerClient, "performTemporaryHawkeyeLowEnergyScan");
    else
      -[CLAvengerScannerServiceProtocol performTemporaryHawkeyeLowEnergyScan:](self->_avengerScannerProxy, "performTemporaryHawkeyeLowEnergyScan:", CLISP_ME_TOKEN);
    v14 = sub_1001FD94C();
    *(_DWORD *)buf = v18 + 1;
    sub_10011B4E4(v14, "TACountHawkeyeLowEnergyScans", buf);
    v15 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 944))(v15);
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v10 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174913;
      *(_DWORD *)&buf[4] = v18;
      v24 = 2049;
      v25 = 24;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#ut hawkeye low energy scan requested but daily limit already reached: %{private}d / %{private}lu", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      v20[0] = 67174913;
      v20[1] = v18;
      v21 = 2049;
      v22 = 24;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 2, "#ut hawkeye low energy scan requested but daily limit already reached: %{private}d / %{private}lu", v20, 18);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService requestHawkeyeLowEnergyScan]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)showEngineeringUIForOwnerUT:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  CFUserNotificationRef v9;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  void **v17;
  const char *v18;
  void *__p[2];
  char v20;
  _WORD v21[8];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void **v27;

  if (!self->_allowDebugNotification)
    return;
  if ((double)arc4random() / 4294967300.0 > *(double *)&self->_metrics.lastLocationPrivate.isGnssFromRavenEstimators)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v5 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ut user will not be notified of owner device issues", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B4958);
      LOWORD(__p[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 0, "#ut user will not be notified of owner device issues", __p, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLTrackingAvoidanceService showEngineeringUIForOwnerUT:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    return;
  }
  sub_1015A2E04(__p, (char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "address"), "hexString"), "UTF8String"));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Offline Device Issues Detected"), kCFUserNotificationAlertHeaderKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Tap-to-Radar"), kCFUserNotificationAlternateButtonTitleKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Dismiss"), kCFUserNotificationDefaultButtonTitleKey);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Please file a radar"), kCFUserNotificationAlertMessageKey);
  v9 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v8);

  if (!v9)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Could not create UT detected user notification", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_28;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v21[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "Could not create UT detected user notification", v21, 2);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 0, "void displayOwnerUTUserNotification(const std::string &)", "%s\n", v13);
LABEL_40:
    if (v14 != buf)
      free(v14);
    goto LABEL_28;
  }
  CFRetain(v9);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v9, (CFUserNotificationCallBack)sub_1013F5660, 0);
  if (!RunLoopSource)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v15 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Could not create runloop source for UT detected user notification", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 0))
      goto LABEL_28;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v21[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0138, 17, "Could not create runloop source for UT detected user notification", v21, 2);
    v14 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 0, "void displayOwnerUTUserNotification(const std::string &)", "%s\n", v18);
    goto LABEL_40;
  }
  v11 = (__CFRunLoop *)sub_100193530();
  CFRunLoopAddSource(v11, RunLoopSource, kCFRunLoopCommonModes);
  CFRelease(RunLoopSource);
  CFRelease(v9);
LABEL_28:
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v16 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v17 = __p;
    if (v20 < 0)
      v17 = (void **)__p[0];
    *(_DWORD *)buf = 68289283;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2081;
    v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut owner EngineeringUI submitted\", \"address\":%{private, location:escape_only}s}", buf, 0x1Cu);
  }
  -[CLTrackingAvoidanceService incrementNotifications](self, "incrementNotifications");
  if (v20 < 0)
    operator delete(__p[0]);
}

- (void)didFetchSignficantLocationsStatus:(BOOL)a3 forClient:(id)a4
{
  _BOOL4 v5;
  _BOOL8 v7;
  int v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  BOOL v14;
  _BOOL8 v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  int v19;
  _BOOL8 v20;
  _BOOL8 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *v25;
  NSObject *v26;
  _DWORD v27[2];
  __int16 v28;
  const char *v29;
  __int16 v30;
  NSDictionary *v31;
  _QWORD v32[8];
  _QWORD v33[8];

  v5 = a3;
  v7 = BYTE1(self->_signalEnvironment) == 0;
  v8 = BYTE2(self->_signalEnvironment);
  v9 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.FindMySafetyAlertsNotifications"));
  v10 = objc_msgSend(objc_msgSend(v9, "notificationSettings"), "authorizationStatus");

  v11 = objc_alloc_init((Class)RadiosPreferences);
  v12 = objc_msgSend(v11, "airplaneMode");

  v13 = objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "applicationIsInstalled:", CFSTR("com.apple.findmy"));
  v14 = v8 == 0;
  v15 = v8 == 0;
  v16 = v14 || v7;
  v17 = v10 == (id)1;
  v18 = v13 ^ 1;
  if (v10 == (id)1)
    v16 = 1;
  v19 = v16 | v12 | v18;
  v20 = !v5;
  v21 = HIBYTE(self->_signalEnvironment) == 0;
  if (HIBYTE(self->_signalEnvironment))
    v22 = v20;
  else
    v22 = 1;
  v14 = v22 == 0;
  v23 = 3;
  if (v14)
    v23 = 1;
  if (v19)
    v24 = 2;
  else
    v24 = v23;
  v32[0] = UTDisableReasonBTOffKey;
  v33[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7);
  v32[1] = UTDisableReasonLocationServicesOffKey;
  v33[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15);
  v32[2] = UTDisableReasonTrackingNotificationsDisallowedKey;
  v33[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17);
  v32[3] = UTDisableReasonAirplaneModeOnKey;
  v33[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12);
  v32[4] = UTDisableReasonFindMyDeletedKey;
  v33[4] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18);
  v32[5] = UTDegradationReasonSignificantLocationsOffKey;
  v33[5] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20);
  v32[6] = UTDegradationReasonWifiOffKey;
  v33[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21);
  v32[7] = UTEnablementStatusKey;
  v33[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v24);
  v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 8);
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v26 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 68289283;
    v27[1] = 0;
    v28 = 2082;
    v29 = "";
    v30 = 2113;
    v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut didFetchStatusOfUTEnablementRequirementsWithStatus\", \"status\":%{private, location:escape_only}@}", (uint8_t *)v27, 0x1Cu);
  }
  objc_msgSend(a4, "didFetchStatusOfUTEnablementRequirementsWithStatus:", v25);
}

- (void)fetchStatusOfUTEnablementRequirementsForClient:(id)a3
{
  id v5;
  _QWORD v6[7];

  v5 = objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLClientAuthorizationCache"));
  objc_msgSend(v5, "registerDelegate:inSilo:", self, objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1013F36E0;
  v6[3] = &unk_10212BBA8;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  objc_msgSend(v5, "notifyWhenCacheIsPopulatedWithReply:", v6);
}

- (void)fetchAISInfoForPoshTAUnknownBeacon:(id)a3 client:(id)a4
{
  NSObject *v6;
  CLTrackingAvoidanceAISFetchRecord *v7;
  _QWORD block[7];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v6 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(a3, "identifier");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v7 = -[CLTrackingAvoidanceAISFetchRecord initWithUUID:deviceType:]([CLTrackingAvoidanceAISFetchRecord alloc], "initWithUUID:deviceType:", objc_msgSend(a3, "identifier"), objc_msgSend(a3, "deviceType"));
  -[CLXOTASubscription setObject:forKey:](self->_settingsSubscription.__ptr_.__value_, "setObject:forKey:", v7, objc_msgSend(a3, "identifier"));
  -[CLTrackingAvoidanceService scheduleAISFetchTimeoutForDevice:](self, "scheduleAISFetchTimeoutForDevice:", objc_msgSend(a3, "identifier"));
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISProductDataForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISProductDataForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISManufacturerNameForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISManufacturerNameForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISModelNameForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISModelNameForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISProtocolImplementationForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISProtocolImplementationForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISAccessoryCapabilitiesForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISAccessoryCapabilitiesForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISAccessoryCategoryForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISAccessoryCategoryForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISNetworkIDForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISNetworkIDForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISFirmwareVersionForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISFirmwareVersionForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISSerialNumberForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISSerialNumberForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISBatteryTypeForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISBatteryTypeForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchAISBatteryLevelForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchAISBatteryLevelForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013F3C8C;
  block[3] = &unk_10212BBA8;
  block[4] = v7;
  block[5] = a3;
  block[6] = self;
  dispatch_group_notify((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"), (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"), block);
}

- (void)fetchAISInfoForNonPoshTAUnknownBeacon:(id)a3 client:(id)a4
{
  NSObject *v6;
  CLTrackingAvoidanceAISFetchRecord *v7;
  _QWORD block[7];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v6 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(a3, "identifier");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #non-posh AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v7 = -[CLTrackingAvoidanceAISFetchRecord initWithUUID:deviceType:]([CLTrackingAvoidanceAISFetchRecord alloc], "initWithUUID:deviceType:", objc_msgSend(a3, "identifier"), objc_msgSend(a3, "deviceType"));
  -[CLXOTASubscription setObject:forKey:](self->_settingsSubscription.__ptr_.__value_, "setObject:forKey:", v7, objc_msgSend(a3, "identifier"));
  -[CLTrackingAvoidanceService scheduleAISFetchTimeoutForDevice:](self, "scheduleAISFetchTimeoutForDevice:", objc_msgSend(a3, "identifier"));
  if (objc_msgSend(a3, "deviceType") == (id)2)
  {
    dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
    -[CLDurianServiceProtocol fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISManufacturerNameForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
    dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
    -[CLDurianServiceProtocol fetchHawkeyeAISModelNameForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISModelNameForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
    dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
    -[CLDurianServiceProtocol fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISAccessoryCapabilitiesForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
    dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
    -[CLDurianServiceProtocol fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISFirmwareVersionForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  }
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchHawkeyeAISProductDataForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISProductDataForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  dispatch_group_enter((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"));
  -[CLDurianServiceProtocol fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:forClient:](self->_durianServiceProxy, "fetchHawkeyeAISAccessoryCategoryForTAUnknownBeacon:forClient:", a3, CLISP_ME_TOKEN);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1013F4118;
  block[3] = &unk_10212BBA8;
  block[4] = v7;
  block[5] = a3;
  block[6] = self;
  dispatch_group_notify((dispatch_group_t)-[CLTrackingAvoidanceAISFetchRecord fetchGroup](v7, "fetchGroup"), (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLTrackingAvoidanceService universe](self, "universe"), "silo"), "queue"), block);
}

- (void)fetchAISInfoForTAUnknownBeacon:(id)a3 client:(id)a4
{
  SEL v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  int v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;

  v7 = NSSelectorFromString(CFSTR("isPoshAccessory"));
  v8 = (objc_opt_respondsToSelector(a3, v7) & 1) != 0 && objc_msgSend(a3, "performSelector:", v7) != 0;
  if (objc_msgSend(a3, "deviceType") != (id)1 || v8)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v11 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 68289283;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = objc_msgSend(a3, "identifier");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut AIS fetch request\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
    }
    if (!-[CLXOTASubscription objectForKey:](self->_settingsSubscription.__ptr_.__value_, "objectForKey:", objc_msgSend(a3, "identifier")))
    {
      if (objc_msgSend(a3, "identifier"))
      {
        if (self->_durianServiceProxy)
        {
          if (!v8)
          {
            -[CLTrackingAvoidanceService fetchAISInfoForNonPoshTAUnknownBeacon:client:](self, "fetchAISInfoForNonPoshTAUnknownBeacon:client:", a3, a4);
            return;
          }
          if (_os_feature_enabled_impl("CoreLocation", "StandardUT"))
          {
            -[CLTrackingAvoidanceService fetchAISInfoForPoshTAUnknownBeacon:client:](self, "fetchAISInfoForPoshTAUnknownBeacon:client:", a3, a4);
            return;
          }
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v23 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_msgSend(a3, "identifier");
            v26 = 68289283;
            v27 = 0;
            v28 = 2082;
            v29 = "";
            v30 = 2113;
            v31 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut skipping AIS fetch for posh accessories\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
          }
          v21 = qword_1022A0138;
          if (!os_signpost_enabled((os_log_t)qword_1022A0138))
            return;
          v25 = objc_msgSend(a3, "identifier");
          v26 = 68289283;
          v27 = 0;
          v28 = 2082;
          v29 = "";
          v30 = 2113;
          v31 = v25;
          v15 = "#ut skipping AIS fetch for posh accessories";
          v16 = "{\"msg%{public}.0s\":\"#ut skipping AIS fetch for posh accessories\", \"uuid\":%{private, location:escape_only}@}";
        }
        else
        {
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
          v19 = qword_1022A0138;
          if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
          {
            v20 = objc_msgSend(a3, "identifier");
            v26 = 68289283;
            v27 = 0;
            v28 = 2082;
            v29 = "";
            v30 = 2113;
            v31 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut durian service not ready\", \"uuid\":%{private, location:escape_only}@}", (uint8_t *)&v26, 0x1Cu);
            if (qword_1022A0130 != -1)
              dispatch_once(&qword_1022A0130, &stru_1021B4958);
          }
          v21 = qword_1022A0138;
          if (!os_signpost_enabled((os_log_t)qword_1022A0138))
            return;
          v22 = objc_msgSend(a3, "identifier");
          v26 = 68289283;
          v27 = 0;
          v28 = 2082;
          v29 = "";
          v30 = 2113;
          v31 = v22;
          v15 = "#ut durian service not ready";
          v16 = "{\"msg%{public}.0s\":\"#ut durian service not ready\", \"uuid\":%{private, location:escape_only}@}";
        }
        v17 = v21;
        v18 = 28;
      }
      else
      {
        if (qword_1022A0130 != -1)
          dispatch_once(&qword_1022A0130, &stru_1021B4958);
        v13 = qword_1022A0138;
        if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_ERROR))
        {
          v26 = 68289026;
          v27 = 0;
          v28 = 2082;
          v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ut AIS fetch received nil uuid\"}", (uint8_t *)&v26, 0x12u);
          if (qword_1022A0130 != -1)
            dispatch_once(&qword_1022A0130, &stru_1021B4958);
        }
        v14 = qword_1022A0138;
        if (!os_signpost_enabled((os_log_t)qword_1022A0138))
          return;
        v26 = 68289026;
        v27 = 0;
        v28 = 2082;
        v29 = "";
        v15 = "#ut AIS fetch received nil uuid";
        v16 = "{\"msg%{public}.0s\":\"#ut AIS fetch received nil uuid\"}";
        v17 = v14;
        v18 = 18;
      }
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, (uint8_t *)&v26, v18);
      return;
    }
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(a3, "identifier");
      v26 = 68289283;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = v12;
      v10 = "{\"msg%{public}.0s\":\"#ut AIS fetch skipping\", \"uuid\":%{private, location:escape_only}@}";
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v9 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 68289283;
      v27 = 0;
      v28 = 2082;
      v29 = "";
      v30 = 2113;
      v31 = objc_msgSend(a3, "identifier");
      v10 = "{\"msg%{public}.0s\":\"#ut skip AIS fetch due to durian type\", \"uuid\":%{private, location:escape_only}@}";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v26, 0x1Cu);
    }
  }
}

- (void)stageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6
{
  NSObject *v10;
  NSObject *v11;
  SEL v12;
  SEL v13;
  NSObject *v14;
  NSInvocation *v15;
  unint64_t *v16;
  NSInvocation *v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unint64_t v21;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;

  v21 = a4;
  v22 = a3;
  v20 = a5;
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v10 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = a6;
    v29 = 2049;
    v30 = a5;
    v31 = 2113;
    v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
  }
  v11 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2113;
    v28 = a6;
    v29 = 2049;
    v30 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force staging Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld}", buf, 0x26u);
  }
  v12 = NSSelectorFromString(CFSTR("debugStageTADetection:deviceType:detailsBitmask:"));
  v13 = NSSelectorFromString(CFSTR("debugStageTADetection:deviceType:"));
  if ((objc_opt_respondsToSelector(self->_taServiceManager, v12) & 1) != 0)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v14 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = a6;
      v29 = 2049;
      v30 = a5;
      v31 = 2113;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    v15 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:](TATrackingAvoidanceServiceManager, "instanceMethodSignatureForSelector:", v12));
    -[NSInvocation setSelector:](v15, "setSelector:", v12);
    -[NSInvocation setTarget:](v15, "setTarget:", self->_taServiceManager);
    -[NSInvocation setArgument:atIndex:](v15, "setArgument:atIndex:", &v22, 2);
    -[NSInvocation setArgument:atIndex:](v15, "setArgument:atIndex:", &v21, 3);
    v16 = (unint64_t *)&v20;
    v17 = v15;
    v18 = 4;
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v19 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2113;
      v28 = a6;
      v29 = 2049;
      v30 = a5;
      v31 = 2113;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut non-posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    v15 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:](TATrackingAvoidanceServiceManager, "instanceMethodSignatureForSelector:", v13));
    -[NSInvocation setSelector:](v15, "setSelector:", v13);
    -[NSInvocation setTarget:](v15, "setTarget:", self->_taServiceManager);
    -[NSInvocation setArgument:atIndex:](v15, "setArgument:atIndex:", &v22, 2);
    v16 = &v21;
    v17 = v15;
    v18 = 3;
  }
  -[NSInvocation setArgument:atIndex:](v17, "setArgument:atIndex:", v16, v18);
  -[NSInvocation invoke](v15, "invoke");
}

- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5 client:(id)a6
{
  NSObject *v9;
  SEL v10;
  SEL v11;
  NSObject *v12;
  NSInvocation *v13;
  unint64_t *v14;
  NSInvocation *v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  unint64_t v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;

  v19 = a4;
  v20 = a3;
  v18 = a5;
  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v9 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v22 = 0;
    v23 = 2082;
    v24 = "";
    v25 = 2113;
    v26 = a6;
    v27 = 2049;
    v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld}", buf, 0x26u);
  }
  v10 = NSSelectorFromString(CFSTR("debugForceSurfaceStagedDetections:deviceType:detailsBitmask:"));
  v11 = NSSelectorFromString(CFSTR("debugForceSurfaceStagedDetections:deviceType:"));
  if ((objc_opt_respondsToSelector(self->_taServiceManager, v10) & 1) != 0)
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v12 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a6;
      v27 = 2049;
      v28 = a5;
      v29 = 2113;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut #posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    v13 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:](TATrackingAvoidanceServiceManager, "instanceMethodSignatureForSelector:", v10));
    -[NSInvocation setSelector:](v13, "setSelector:", v10);
    -[NSInvocation setTarget:](v13, "setTarget:", self->_taServiceManager);
    -[NSInvocation setArgument:atIndex:](v13, "setArgument:atIndex:", &v20, 2);
    -[NSInvocation setArgument:atIndex:](v13, "setArgument:atIndex:", &v19, 3);
    v14 = (unint64_t *)&v18;
    v15 = v13;
    v16 = 4;
  }
  else
  {
    if (qword_1022A0130 != -1)
      dispatch_once(&qword_1022A0130, &stru_1021B4958);
    v17 = qword_1022A0138;
    if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289795;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a6;
      v27 = 2049;
      v28 = a5;
      v29 = 2113;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut non-posh force pushing staged Detections\", \"client\":%{private, location:escape_only}@, \"detailsBitmask\":%{private}ld, \"address\":%{private, location:escape_only}@}", buf, 0x30u);
    }
    v13 = +[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", +[TATrackingAvoidanceServiceManager instanceMethodSignatureForSelector:](TATrackingAvoidanceServiceManager, "instanceMethodSignatureForSelector:", v11));
    -[NSInvocation setSelector:](v13, "setSelector:", v11);
    -[NSInvocation setTarget:](v13, "setTarget:", self->_taServiceManager);
    -[NSInvocation setArgument:atIndex:](v13, "setArgument:atIndex:", &v20, 2);
    v14 = &v19;
    v15 = v13;
    v16 = 3;
  }
  -[NSInvocation setArgument:atIndex:](v15, "setArgument:atIndex:", v14, v16);
  -[NSInvocation invoke](v13, "invoke");
}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
  -[TATrackingAvoidanceServiceManager fetchTAUnknownBeacon:withCompletion:](self->_taServiceManager, "fetchTAUnknownBeacon:withCompletion:", a3, a4);
}

- (void)didSuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4
{
  NSObject *v7;
  id v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v7 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = a4;
    v14 = 2113;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut playsound success\", \"address\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x26u);
  }
  v8 = objc_msgSend(objc_alloc((Class)TAPlaySoundSuccess), "initWithUUID:address:successType:date:", a3, a4, 1, +[NSDate now](NSDate, "now"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v8);

}

- (void)didUnsuccessfullyPlayUnauthorizedSound:(id)a3 address:(id)a4
{
  NSObject *v7;
  id v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  if (qword_1022A0130 != -1)
    dispatch_once(&qword_1022A0130, &stru_1021B4958);
  v7 = qword_1022A0138;
  if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289539;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = a4;
    v14 = 2113;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut playsound failure\", \"address\":%{private, location:escape_only}@, \"UUID\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x26u);
  }
  v8 = objc_msgSend(objc_alloc((Class)TAPlaySoundSuccess), "initWithUUID:address:successType:date:", a3, a4, 0, +[NSDate now](NSDate, "now"));
  -[CLTrackingAvoidanceService ingestTAEventIfTAServiceRunning:](self, "ingestTAEventIfTAServiceRunning:", v8);

}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  Client *v7;
  Client *v8;
  Client *v9;
  Client *v10;
  Client *v11;

  sub_1004D8F50((uint64_t *)&self->_metrics.lastLocationPrivate.demFlatnessMetricData, 0);
  sub_100261F44((uint64_t)&self->_metrics.lastLocationPrivate.smoothedGPSAltitude);
  sub_100090AE4((uint64_t)&self->_metrics.state.detectedIds, (char *)self->_metrics.state.detectedIds.__tree_.__pair1_.__value_.__left_);
  sub_100090AE4((uint64_t)&self->_metrics, (char *)self->_metrics.state.uniqueIds.__tree_.__pair1_.__value_.__left_);
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  v4 = self->_gnssClient.__ptr_.__value_;
  self->_gnssClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  v5 = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);
  v6 = self->_signalEnvironmentClient.__ptr_.__value_;
  self->_signalEnvironmentClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  v7 = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *))(*(_QWORD *)v7 + 8))(v7);
  v8 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *))(*(_QWORD *)v8 + 8))(v8);
  v9 = self->_daemonStatusClient.__ptr_.__value_;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
  v10 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
  v11 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (v11)
    (*(void (**)(Client *))(*(_QWORD *)v11 + 8))(v11);
}

- (id).cxx_construct
{
  self->_motionStateClient.__ptr_.__value_ = 0;
  self->_locationClient.__ptr_.__value_ = 0;
  self->_daemonStatusClient.__ptr_.__value_ = 0;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  self->_signalEnvironmentClient.__ptr_.__value_ = 0;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  self->_gnssClient.__ptr_.__value_ = 0;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__begin_node_ = &self->_metrics.state.uniqueIds.__tree_.__pair1_;
  self->_metrics.state.detectedIds.__tree_.__pair3_.__value_ = 0;
  *(_QWORD *)&self->_metrics.state.suspiciousVisits = 0;
  self->_metrics.state.detectedIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_metrics.state.uniqueIds.__tree_.__pair3_.__value_ = 0;
  self->_metrics.state.detectedIds.__tree_.__begin_node_ = &self->_metrics.state.detectedIds.__tree_.__pair1_;
  self->_metrics.state.suspiciousOther = 0;
  self->_metrics.state.timeNextSent = 0.0;
  self->_metrics.state.sendHour = 0;
  self->_metrics.state.unitTest = 0;
  self->_metrics.state.nextWeeklySubmissionTime = 0.0;
  self->_metrics.state.weeklyCountOfSuspiciousDevices = 0;
  self->_metrics.state.nextMonthlySubmissionTime = 0.0;
  self->_metrics.state.monthlyCountOfSuspiciousDevices = 0;
  *(_QWORD *)&self->_metrics.signalEnvironment = 0xFFFF00000000;
  *(_QWORD *)&self->_metrics.lastLocation.suitability = 0;
  self->_metrics.lastLocation.coordinate.latitude = 0.0;
  *(_OWORD *)&self->_metrics.lastLocation.coordinate.longitude = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_metrics.lastLocation.altitude = _Q0;
  *(_OWORD *)&self->_metrics.lastLocation.speed = _Q0;
  *(_OWORD *)&self->_metrics.lastLocation.course = _Q0;
  LODWORD(self->_metrics.lastLocation.timestamp) = 0;
  *(double *)((char *)&self->_metrics.lastLocation.timestamp + 4) = -1.0;
  *(double *)((char *)&self->_metrics.lastLocation.lifespan + 4) = 0.0;
  *(_QWORD *)(&self->_metrics.lastLocation.confidence + 1) = 0;
  *(&self->_metrics.lastLocation.type + 1) = 0;
  self->_metrics.lastLocation.rawCoordinate.latitude = -1.0;
  LODWORD(self->_metrics.lastLocation.rawCoordinate.longitude) = 0x7FFFFFFF;
  *(double *)((char *)&self->_metrics.lastLocation.rawCourse + 4) = 0.0;
  *(double *)((char *)&self->_metrics.lastLocation.rawCoordinate.longitude + 4) = 0.0;
  LOBYTE(self->_metrics.lastLocation.rawReferenceFrame) = 0;
  *(_QWORD *)&self->_metrics.lastLocation.integrity = 0;
  sub_10012A33C(&self->_metrics.lastLocation.signalEnvironmentType);
  self->_metrics.lastLocationPrivate.demFlatnessMetricData = 0;
  return self;
}

@end

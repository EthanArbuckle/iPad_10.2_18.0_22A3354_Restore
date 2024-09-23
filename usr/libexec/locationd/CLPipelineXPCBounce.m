@implementation CLPipelineXPCBounce

- (CLIndoorPositionProvider)indoord
{
  return self->_indoord;
}

- (void)setIndoord:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void)indoorGivesUpWithLocation:(id)a3
{
  _QWORD v3[4];
  CLPipelineXPCBounce *v4;
  unsigned __int8 v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10020F904;
  v3[3] = &unk_102148B10;
  v4 = self;
  v5 = objc_msgSend(a3, "requestsGpsAssistance");
  -[CLSilo async:](-[CLPipelineXPCBounce silo](v4, "silo"), "async:", v3);
}

- (NSBundle)indoorBundle
{
  return self->_indoorBundle;
}

- (CLTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (CLPipelineXPCBounce)init
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLPipelineXPCBounce;
  -[CLPipelineXPCBounce doesNotRecognizeSelector:](&v4, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLPipelineXPCBounce)initWithProvider:(void *)a3 onSilo:(id)a4
{
  CLPipelineXPCBounce *v6;
  CLPipelineXPCBounce *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLPipelineXPCBounce;
  v6 = -[CLPipelineXPCBounce init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_provider = a3;
    v6->_silo = (CLSilo *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_daemonControl = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPipelineXPCBounce;
  -[CLPipelineXPCBounce dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  self->_provider = 0;
  -[CLTimer invalidate](-[CLPipelineXPCBounce debounceTimer](self, "debounceTimer"), "invalidate");
  -[CLPipelineXPCBounce setDebounceTimer:](self, "setDebounceTimer:", 0);
  -[CLTimer invalidate](-[CLPipelineXPCBounce routeHintWatchdogTimer](self, "routeHintWatchdogTimer"), "invalidate");
  -[CLPipelineXPCBounce setRouteHintWatchdogTimer:](self, "setRouteHintWatchdogTimer:", 0);
}

- (void)indoorDidFailWithError:(id)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _QWORD v11[6];
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(a3, "description");
  v7 = objc_msgSend(a3, "localizedFailureReason");
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021A47C0);
  v8 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "pipelined failure: %{public}@ because %{public}@", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_1021A47C0);
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 16, "pipelined failure: %{public}@ because %{public}@", &v12, 22);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 0, "-[CLPipelineXPCBounce indoorDidFailWithError:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_101181E74;
  v11[3] = &unk_10212BB30;
  v11[4] = self;
  v11[5] = a3;
  -[CLSilo async:](-[CLPipelineXPCBounce silo](self, "silo"), "async:", v11);
  objc_autoreleasePoolPop(v5);
}

- (void)indoorIsUncertainWithLocation:(id)a3
{
  _QWORD v3[4];
  CLPipelineXPCBounce *v4;
  unsigned __int8 v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1011820B8;
  v3[3] = &unk_102148B10;
  v4 = self;
  v5 = objc_msgSend(a3, "requestsGpsAssistance");
  -[CLSilo async:](-[CLPipelineXPCBounce silo](v4, "silo"), "async:", v3);
}

- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4
{
  uint64_t *v4;
  NSObject *v7;
  double v8;
  double v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  double v19;
  double v20;
  char *v21;
  double v22;
  NSObject *v23;
  _BYTE *v24;
  double v25;
  NSObject *v26;
  _BYTE *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  _BYTE *v31;
  const char *v32;
  uint8_t *v33;
  _BYTE *v34;
  const char *v35;
  uint8_t *v36;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[4];
  __int128 v40;
  uint64_t v41;
  _QWORD v42[4];
  __int128 __p;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[140];
  uint8_t buf[4];
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  int v65;
  const char *v66;
  double v67[10];
  int v68;
  uint8_t v69[4];
  double v70;
  __int16 v71;
  _BYTE *v72;
  int v73;

  if (objc_msgSend(a3, "locationId"))
  {
    if (a3)
    {
      objc_msgSend(a3, "location");
      if (v73 == 11 || (objc_msgSend(a3, "location"), v68 == 10))
      {
        objc_msgSend(a3, "location");
        if (v73 == 10)
        {
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021A47C0);
          v7 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a3, "location");
            v8 = v70;
            objc_msgSend(a3, "location");
            v9 = v67[0];
            objc_msgSend(a3, "location");
            objc_msgSend(a3, "location");
            *(_DWORD *)buf = 134284289;
            v49 = v8;
            v50 = 2049;
            v51 = v9;
            v52 = 2050;
            v53 = *(_QWORD *)&v47[20];
            v54 = 2050;
            v55 = v46;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "@ClxIndoor, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", buf, 0x2Au);
          }
          if (!sub_1001BFF7C(115, 2))
            goto LABEL_27;
          bzero(v69, 0x65CuLL);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021A47C0);
          v10 = qword_1022A0048;
          objc_msgSend(a3, "location");
          v11 = v66;
          objc_msgSend(a3, "location");
          objc_msgSend(a3, "location");
          objc_msgSend(a3, "location");
          v57 = 134284289;
          v58 = v11;
          v59 = 2049;
          v60 = *(_QWORD *)&v47[12];
          v61 = 2050;
          v62 = v45;
          v63 = 2050;
          v64 = v56;
          _os_log_send_and_compose_impl(2, 0, v69, 1628, &_mh_execute_header, v10, 0, "@ClxIndoor, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", &v57, 42);
          v13 = (uint8_t *)v12;
          sub_100512490("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v12);
        }
        else
        {
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021A47C0);
          v18 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(a3, "location");
            v19 = v70;
            objc_msgSend(a3, "location");
            v20 = v67[0];
            objc_msgSend(a3, "location");
            objc_msgSend(a3, "location");
            *(_DWORD *)buf = 134284289;
            v49 = v19;
            v50 = 2049;
            v51 = v20;
            v52 = 2050;
            v53 = *(_QWORD *)&v47[20];
            v54 = 2050;
            v55 = v46;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "@ClxWifi2, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", buf, 0x2Au);
          }
          if (!sub_1001BFF7C(115, 2))
            goto LABEL_27;
          bzero(v69, 0x65CuLL);
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021A47C0);
          v28 = qword_1022A0048;
          objc_msgSend(a3, "location");
          v29 = v66;
          objc_msgSend(a3, "location");
          objc_msgSend(a3, "location");
          objc_msgSend(a3, "location");
          v57 = 134284289;
          v58 = v29;
          v59 = 2049;
          v60 = *(_QWORD *)&v47[12];
          v61 = 2050;
          v62 = v45;
          v63 = 2050;
          v64 = v56;
          _os_log_send_and_compose_impl(2, 0, v69, 1628, &_mh_execute_header, v28, 0, "@ClxWifi2, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", &v57, 42);
          v13 = (uint8_t *)v30;
          sub_100512490("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v30);
        }
        if (v13 != v69)
          free(v13);
LABEL_27:
        objc_msgSend(a3, "location");
        if (v73 == 10)
          v21 = "indoor";
        else
          v21 = "regional";
        sub_1015A2E04(v47, v21);
        objc_msgSend(a3, "location");
        v22 = v70;
        objc_msgSend(a3, "location");
        if (sub_10011CE64(v22, v67[0]))
        {
          if (qword_1022A0040 != -1)
            dispatch_once(&qword_1022A0040, &stru_1021A47C0);
          v23 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
          {
            v24 = v47;
            if (v47[23] < 0)
              v24 = *(_BYTE **)v47;
            *(_DWORD *)v69 = 136380931;
            v70 = COERCE_DOUBLE("pipeline, null");
            v71 = 2081;
            v72 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "ClxMetric, islands, %{private}s, %{private}s", v69, 0x16u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(v69, 0x65CuLL);
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021A47C0);
            v31 = v47;
            if (v47[23] < 0)
              v31 = *(_BYTE **)v47;
            v65 = 136380931;
            v66 = "pipeline, null";
            LOWORD(v67[0]) = 2081;
            *(_QWORD *)((char *)v67 + 2) = v31;
            LODWORD(v37) = 22;
            _os_log_send_and_compose_impl(2, 0, v69, 1628, &_mh_execute_header, qword_1022A0048, 2, "ClxMetric, islands, %{private}s, %{private}s", &v65, v37);
            v33 = (uint8_t *)v32;
            sub_100512490("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v32);
            if (v33 != v69)
              free(v33);
          }
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3321888768;
          v42[2] = sub_101182E10;
          v42[3] = &unk_10214CFF0;
          if ((v47[23] & 0x80000000) != 0)
          {
            sub_100115CE4(&__p, *(void **)v47, *(unint64_t *)&v47[8]);
          }
          else
          {
            __p = *(_OWORD *)v47;
            v44 = *(_QWORD *)&v47[16];
          }
          AnalyticsSendEventLazy(CFSTR("com.apple.clx.islands"), v42);
          if (SHIBYTE(v44) < 0)
            operator delete((void *)__p);
        }
        objc_msgSend(a3, "location");
        v25 = v70;
        if (v70 == -1.0)
        {
          objc_msgSend(a3, "location", v70);
          v25 = v67[0];
          if (v67[0] == -1.0)
          {
            if (qword_1022A0040 != -1)
              dispatch_once(&qword_1022A0040, &stru_1021A47C0);
            v26 = qword_1022A0048;
            if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
            {
              v27 = v47;
              if (v47[23] < 0)
                v27 = *(_BYTE **)v47;
              *(_DWORD *)v69 = 136380931;
              v70 = COERCE_DOUBLE("pipeline, sentinel");
              v71 = 2081;
              v72 = v27;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "ClxMetric, islands, %{private}s, %{private}s", v69, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(v69, 0x65CuLL);
              if (qword_1022A0040 != -1)
                dispatch_once(&qword_1022A0040, &stru_1021A47C0);
              v34 = v47;
              if (v47[23] < 0)
                v34 = *(_BYTE **)v47;
              v65 = 136380931;
              v66 = "pipeline, sentinel";
              LOWORD(v67[0]) = 2081;
              *(_QWORD *)((char *)v67 + 2) = v34;
              LODWORD(v37) = 22;
              _os_log_send_and_compose_impl(2, 0, v69, 1628, &_mh_execute_header, qword_1022A0048, 2, "ClxMetric, islands, %{private}s, %{private}s", &v65, v37);
              v36 = (uint8_t *)v35;
              sub_100512490("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v35);
              if (v36 != v69)
                free(v36);
            }
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3321888768;
            v39[2] = sub_101182EC4;
            v39[3] = &unk_10214CFF0;
            if ((v47[23] & 0x80000000) != 0)
            {
              sub_100115CE4(&v40, *(void **)v47, *(unint64_t *)&v47[8]);
            }
            else
            {
              v40 = *(_OWORD *)v47;
              v41 = *(_QWORD *)&v47[16];
            }
            AnalyticsSendEventLazy(CFSTR("com.apple.clx.islands"), v39);
            if (SHIBYTE(v41) < 0)
              operator delete((void *)v40);
          }
        }
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_101182F78;
        v38[3] = &unk_10212BB30;
        v38[4] = self;
        v38[5] = a3;
        -[CLSilo async:](-[CLPipelineXPCBounce silo](self, "silo", v25), "async:", v38);
        if ((v47[23] & 0x80000000) != 0)
          operator delete(*(void **)v47);
        return;
      }
    }
    sub_101942D10();
    __break(1u);
LABEL_78:
    dispatch_once(&qword_1022A0040, &stru_1021A47C0);
LABEL_20:
    v15 = v4[9];
    LOWORD(v65) = 0;
    _os_log_send_and_compose_impl(2, 0, v69, 1628, &_mh_execute_header, v15, 0, "#Warning, no floor available", &v65, 2);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v16);
    if (v17 != v69)
      free(v17);
    return;
  }
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_1021A47C0);
  v4 = &qword_1022A0000;
  v14 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v69 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Warning, no floor available", v69, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(v69, 0x65CuLL);
    if (qword_1022A0040 == -1)
      goto LABEL_20;
    goto LABEL_78;
  }
}

- (void)provider
{
  return self->_provider;
}

- (void)setIndoorBundle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLIndoorMaintenance)daemonControl
{
  return self->_daemonControl;
}

- (void)setDaemonControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setDebounceTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CLTimer)routeHintWatchdogTimer
{
  return self->_routeHintWatchdogTimer;
}

- (void)setRouteHintWatchdogTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end

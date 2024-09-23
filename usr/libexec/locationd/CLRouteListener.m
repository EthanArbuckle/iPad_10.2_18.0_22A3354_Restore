@implementation CLRouteListener

- (id)initInUniverse:(id)a3 withDelegate:(INotifier *)a4
{
  CLRouteListener *v6;
  CLRouteListener *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLRouteListener;
  v6 = -[CLRouteListener init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_parentNotifier = a4;
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_silo = (CLDispatchSilo *)objc_msgSend(a3, "silo");
    v7->_enabled = 0;
    *(_OWORD *)&v7->_lastEtaInSeconds = xmmword_101BAFC90;
    v7->_lastCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101BC0E58;
    v7->_geoNavListener = (GEONavigationListener *)objc_msgSend(objc_alloc((Class)GEONavigationListener), "initWithQueue:", -[CLDispatchSilo queue](v7->_silo, "queue"));
    sub_1012B2C64();
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[GEONavigationListener setDelegate:](self->_geoNavListener, "setDelegate:", 0);

  self->_geoNavListener = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLRouteListener;
  -[CLRouteListener dealloc](&v3, "dealloc");
}

- (void)enable
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (self->_enabled)
    sub_101907B18();
  -[GEONavigationListener setDelegate:](self->_geoNavListener, "setDelegate:", self);
  self->_enabled = 1;
  -[GEONavigationListener requestRouteSummary](self->_geoNavListener, "requestRouteSummary");
  -[GEONavigationListener requestTransitSummary](self->_geoNavListener, "requestTransitSummary");
  -[GEONavigationListener requestGuidanceState](self->_geoNavListener, "requestGuidanceState");
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102152638);
  v3 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Enabled", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "CLC: Enabled", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener enable]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
}

- (void)disable
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  if (self->_enabled)
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v3 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLC: Disable", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "CLC: Disable", v9, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener disable]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    self->_enabled = 0;
    -[GEONavigationListener setDelegate:](self->_geoNavListener, "setDelegate:", 0);
  }
  else
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v4 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Warning CLC: Disable CLRouteListener when already disabled, shutdown?", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v9[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "#Warning CLC: Disable CLRouteListener when already disabled, shutdown?", v9, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener disable]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)clearLocationData
{
  self->_lastEtaInSeconds = -1.0;
  self->_lastCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_101BC0E58;
}

- (void)notifyFromLastInfo
{
  CFAbsoluteTime Current;
  double v4;
  double v5;

  if (self->_lastEtaInSeconds != -1.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v4 = self->_lastEtaInSeconds + self->_lastEtaAbsTime;
    if (Current < v4)
    {
      v5 = v4 - Current;
      self->_lastEtaInSeconds = v5;
      self->_lastEtaAbsTime = Current;
      (*((void (**)(INotifier *, $AB5116BA7E623E054F959CECB034F4E7 *, double))self->_parentNotifier->var0 + 2))(self->_parentNotifier, &self->_lastCoordinate, v5);
      return;
    }
    self->_lastEtaInSeconds = -1.0;
  }
  (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  NSObject *v6;
  _BOOL4 enabled;
  _BOOL4 v8;
  unsigned int v9;
  _BOOL4 v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  INotifier *parentNotifier;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  unsigned int v21;
  _BOOL4 v22;
  const char *v23;
  uint8_t *v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  _DWORD v28[2];
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  _BOOL4 v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  _BOOL4 v42;

  -[CLDispatchSilo assertInside](self->_silo, "assertInside", a3);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102152638);
  v6 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    enabled = self->_enabled;
    v8 = objc_msgSend(a4, "transportType") == 1;
    v9 = objc_msgSend(a4, "hasDestination");
    v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    v36 = enabled;
    v37 = 1026;
    v38 = v8;
    v39 = 1026;
    v40 = v9;
    v41 = 1026;
    v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLC: Received a route, %{public}d,%{public}d,%{public}d,%{public}d", buf, 0x1Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v18 = qword_1022A0028;
    v19 = self->_enabled;
    v20 = objc_msgSend(a4, "transportType") == 1;
    v21 = objc_msgSend(a4, "hasDestination");
    v22 = self->_lastEtaInSeconds == -1.0;
    v28[0] = 67240960;
    v28[1] = v19;
    v29 = 1026;
    v30 = v20;
    v31 = 1026;
    v32 = v21;
    v33 = 1026;
    v34 = v22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v18, 0, "CLC: Received a route, %{public}d,%{public}d,%{public}d,%{public}d", v28, 26);
    v24 = (uint8_t *)v23;
    sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateRouteSummary:]", "%s\n", v23);
    if (v24 != buf)
      free(v24);
  }
  if (self->_enabled)
  {
    -[CLRouteListener logRoute:](self, "logRoute:", a4);
    if (objc_msgSend(a4, "transportType") == 1)
    {
      objc_msgSend(a4, "travelTime");
      self->_lastEtaInSeconds = v11;
      self->_lastEtaAbsTime = CFAbsoluteTimeGetCurrent();
      if (objc_msgSend(a4, "hasDestination"))
      {
        objc_msgSend(objc_msgSend(objc_msgSend(a4, "destination"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v12;
        v13 = objc_msgSend(a4, "destination");
      }
      else
      {
        if (!objc_msgSend(a4, "hasOrigin"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v16 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Warning CLC: Starting route without an appoximate location", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            LOWORD(v28[0]) = 0;
            LODWORD(v27) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 0, "#Warning CLC: Starting route without an appoximate location", v28, v27);
            v26 = (uint8_t *)v25;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateRouteSummary:]", "%s\n", v25);
            if (v26 != buf)
              free(v26);
          }
          goto LABEL_20;
        }
        objc_msgSend(objc_msgSend(objc_msgSend(a4, "origin"), "latLng"), "lat");
        self->_lastCoordinate.latitude = v14;
        v13 = objc_msgSend(a4, "origin");
      }
      objc_msgSend(objc_msgSend(v13, "latLng"), "lng");
      self->_lastCoordinate.longitude = v15;
LABEL_20:
      parentNotifier = self->_parentNotifier;
      objc_msgSend(a4, "travelTime");
      (*((void (**)(INotifier *, $AB5116BA7E623E054F959CECB034F4E7 *))parentNotifier->var0 + 2))(parentNotifier, &self->_lastCoordinate);
      return;
    }
    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }
}

- (void)navigationListener:(id)a3 didUpdateTransitSummary:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _WORD v9[8];
  uint8_t buf[1640];

  -[CLDispatchSilo assertInside](self->_silo, "assertInside", a3);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102152638);
  v6 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLC: Received a transit route", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v9[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: Received a transit route", v9, 2);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateTransitSummary:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  if (self->_enabled)
    -[CLRouteListener logTransitRoute:](self, "logTransitRoute:", a4);
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  NSObject *v6;
  _BOOL4 enabled;
  _BOOL4 v8;
  unsigned int v9;
  _BOOL4 v10;
  INotifier *parentNotifier;
  id v12;
  int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  unsigned int v20;
  _BOOL4 v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  uint8_t *v25;
  int v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  _BOOL4 v33;
  uint8_t buf[4];
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  _BOOL4 v41;

  -[CLDispatchSilo assertInside](self->_silo, "assertInside", a3);
  if (qword_1022A0020 != -1)
    dispatch_once(&qword_1022A0020, &stru_102152638);
  v6 = qword_1022A0028;
  if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEFAULT))
  {
    enabled = self->_enabled;
    v8 = objc_msgSend(a4, "guidanceLevel") != 2;
    v9 = objc_msgSend(a4, "hasGuidanceLevel");
    v10 = self->_lastEtaInSeconds == -1.0;
    *(_DWORD *)buf = 67240960;
    v35 = enabled;
    v36 = 1026;
    v37 = v8;
    v38 = 1026;
    v39 = v9;
    v40 = 1026;
    v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLC: Received a state change, %{public}d,%{public}d,%{public}d,%{public}d", buf, 0x1Au);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v17 = qword_1022A0028;
    v18 = self->_enabled;
    v19 = objc_msgSend(a4, "guidanceLevel") != 2;
    v20 = objc_msgSend(a4, "hasGuidanceLevel");
    v21 = self->_lastEtaInSeconds == -1.0;
    v26 = 67240960;
    v27 = v18;
    v28 = 1026;
    v29 = v19;
    v30 = 1026;
    v31 = v20;
    v32 = 1026;
    v33 = v21;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v17, 0, "CLC: Received a state change, %{public}d,%{public}d,%{public}d,%{public}d", &v26, 26);
    v23 = (uint8_t *)v22;
    sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener navigationListener:didUpdateGuidanceState:]", "%s\n", v22);
    if (v23 != buf)
      free(v23);
  }
  if (self->_enabled)
  {
    -[CLRouteListener logState:](self, "logState:", a4);
    if (self->_lastEtaInSeconds != -1.0
      && objc_msgSend(a4, "hasGuidanceLevel")
      && objc_msgSend(a4, "guidanceLevel") != 2)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
    if (objc_msgSend(a4, "hasNavigationState"))
    {
      parentNotifier = self->_parentNotifier;
      v12 = objc_msgSend(a4, "navigationState");
      v13 = (int)v12;
      if (v12 >= 9)
      {
        if (qword_1022A0020 != -1)
          dispatch_once(&qword_1022A0020, &stru_102152638);
        v15 = qword_1022A0028;
        if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v35 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CLC: Received a unsupported GEONavigationState, %d", buf, 8u);
        }
        v16 = sub_1001BFF7C(115, 0);
        v14 = 0;
        if (v16)
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v26 = 67109120;
          v27 = v13;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 16, "CLC: Received a unsupported GEONavigationState, %d", &v26);
          v25 = (uint8_t *)v24;
          sub_100512490("Generic", 1, 0, 0, "CLClientNavigationState GEONavigationStateToCLClientNavigationState(const GEONavigationState)", "%s\n", v24);
          if (v25 != buf)
            free(v25);
          v14 = 0;
        }
      }
      else
      {
        v14 = v12;
      }
      (*((void (**)(INotifier *, id))parentNotifier->var0 + 4))(parentNotifier, v14);
    }
  }
}

- (void)logRoute:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  id v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  id v16;
  __CFString *v17;
  const char *v18;
  uint8_t *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t *v29;
  const char *v30;
  uint8_t *v31;
  uint64_t v32;
  int v33;
  _QWORD v34[3];
  uint8_t buf[4];
  _QWORD v36[204];

  if (objc_msgSend(a3, "hasTransportType"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v4 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(a3, "transportType");
      v6 = objc_msgSend(a3, "transportType");
      if (v6 >= 7)
        v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      else
        v7 = off_1021526C0[(int)v6];
      *(_DWORD *)buf = 67174915;
      LODWORD(v36[0]) = v5;
      WORD2(v36[0]) = 2113;
      *(_QWORD *)((char *)v36 + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLC: Route type        : %{private}d, %{private}@", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v14 = qword_1022A0028;
      v15 = objc_msgSend(a3, "transportType");
      v16 = objc_msgSend(a3, "transportType");
      if (v16 >= 7)
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      else
        v17 = off_1021526C0[(int)v16];
      v33 = 67174915;
      LODWORD(v34[0]) = v15;
      WORD2(v34[0]) = 2113;
      *(_QWORD *)((char *)v34 + 6) = v17;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v14, 2, "CLC: Route type        : %{private}d, %{private}@", &v33, 18);
      v31 = (uint8_t *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v30);
      if (v31 != buf)
        free(v31);
    }
  }
  if (objc_msgSend(a3, "hasOrigin"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v8 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v36[0] = "Has origin";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CLC: Route origin      : %{public}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v33 = 136446210;
      v34[0] = "Has origin";
      LODWORD(v32) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: Route origin      : %{public}s", &v33, v32);
      v19 = (uint8_t *)v18;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v18);
      if (v19 != buf)
        free(v19);
    }
  }
  if (objc_msgSend(a3, "hasDestination"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v9 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v36[0] = "Has destination";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Route destination : %{public}s", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v33 = 136446210;
      v34[0] = "Has destination";
      LODWORD(v32) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: Route destination : %{public}s", &v33, v32);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
  }
  if (objc_msgSend(a3, "hasDestinationName"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v10 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(a3, "destinationName");
      *(_DWORD *)buf = 138477827;
      v36[0] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC: Route dest name   : %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v22 = qword_1022A0028;
      v23 = objc_msgSend(a3, "destinationName");
      v33 = 138477827;
      v34[0] = v23;
      LODWORD(v32) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v22, 2, "CLC: Route dest name   : %{private}@", &v33, v32);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
  }
  if (objc_msgSend(a3, "hasTravelTime"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v12 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a3, "travelTime");
      *(_DWORD *)buf = 134283521;
      v36[0] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "CLC: Route travel time : %{private}.01lf", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v26 = qword_1022A0028;
      objc_msgSend(a3, "travelTime");
      v33 = 134283521;
      v34[0] = v27;
      LODWORD(v32) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v26, 2, "CLC: Route travel time : %{private}.01lf", &v33, v32);
      v29 = (uint8_t *)v28;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logRoute:]", "%s\n", v28);
      if (v29 != buf)
        free(v29);
    }
  }
}

- (void)logTransitRoute:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint8_t *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint8_t *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  id v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  id v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  const char *v60;
  uint8_t *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint8_t *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint8_t *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint8_t *v73;
  const char *v74;
  uint8_t *v75;
  const char *v76;
  uint8_t *v77;
  uint64_t v78;
  id v79;
  const char *v80;
  uint8_t *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint8_t *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint8_t *v89;
  uint64_t v90;
  id v91;
  const char *v92;
  uint8_t *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint8_t *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint8_t *v101;
  id v102;
  uint64_t v103;
  id obja;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  int v115;
  id v116;
  uint8_t buf[4];
  id v118;
  _BYTE v119[128];

  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v3 = objc_msgSend(a3, "possibleStops");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v111;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v111 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v7);
        if (qword_1022A0020 != -1)
          dispatch_once(&qword_1022A0020, &stru_102152638);
        v9 = qword_1022A0028;
        if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLC: Transit Stop:", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          LOWORD(v115) = 0;
          LODWORD(v103) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: Transit Stop:", &v115, v103);
          v18 = (uint8_t *)v17;
          sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v17);
          if (v18 != buf)
            free(v18);
        }
        if (objc_msgSend(v8, "hasStopID"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v10 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            v11 = objc_msgSend(v8, "stopID");
            *(_DWORD *)buf = 134283521;
            v118 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v19 = qword_1022A0028;
            v20 = objc_msgSend(v8, "stopID");
            v115 = 134283521;
            v116 = v20;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "CLC:     ID  : %{private}llu", &v115, v103);
            v22 = (uint8_t *)v21;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v21);
            if (v22 != buf)
              free(v22);
          }
        }
        if (objc_msgSend(v8, "hasCoordinate"))
        {
          v12 = objc_msgSend(v8, "coordinate");
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v13 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "lat");
            *(_DWORD *)buf = 134283521;
            v118 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLC:     LAT : %{private}lf", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v23 = qword_1022A0028;
            objc_msgSend(v12, "lat");
            v115 = 134283521;
            v116 = v24;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v23, 2, "CLC:     LAT : %{private}lf", &v115, v103);
            v26 = (uint8_t *)v25;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v25);
            if (v26 != buf)
              free(v26);
          }
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v15 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "lng");
            *(_DWORD *)buf = 134283521;
            v118 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLC:     LON : %{private}lf", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v27 = qword_1022A0028;
            objc_msgSend(v12, "lng");
            v115 = 134283521;
            v116 = v28;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v27, 2, "CLC:     LON : %{private}lf", &v115, v103);
            v30 = (uint8_t *)v29;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v29);
            if (v30 != buf)
              free(v30);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v31 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
      v5 = v31;
    }
    while (v31);
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obja = objc_msgSend(a3, "scheduledLinks");
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v107;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v107 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)v35);
        if (qword_1022A0020 != -1)
          dispatch_once(&qword_1022A0020, &stru_102152638);
        v37 = qword_1022A0028;
        if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "CLC: Transit Link:", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          LOWORD(v115) = 0;
          LODWORD(v103) = 2;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: Transit Link:", &v115, v103);
          v61 = (uint8_t *)v60;
          sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v60);
          if (v61 != buf)
            free(v61);
        }
        if (objc_msgSend(v36, "hasLineID"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v38 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            v39 = objc_msgSend(v36, "lineID");
            *(_DWORD *)buf = 134283521;
            v118 = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "CLC:     ID  : %{private}llu", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v62 = qword_1022A0028;
            v63 = objc_msgSend(v36, "lineID");
            v115 = 134283521;
            v116 = v63;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v62, 2, "CLC:     ID  : %{private}llu", &v115, v103);
            v65 = (uint8_t *)v64;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v64);
            if (v65 != buf)
              free(v65);
          }
        }
        if (objc_msgSend(v36, "hasScheduledDeparture"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v40 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v36, "scheduledDeparture");
            *(_DWORD *)buf = 134283521;
            v118 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "CLC:     DEP : %{private}lf", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v66 = qword_1022A0028;
            objc_msgSend(v36, "scheduledDeparture");
            v115 = 134283521;
            v116 = v67;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v66, 2, "CLC:     DEP : %{private}lf", &v115, v103);
            v69 = (uint8_t *)v68;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v68);
            if (v69 != buf)
              free(v69);
          }
        }
        if (objc_msgSend(v36, "hasScheduledArrival"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v42 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v36, "scheduledArrival");
            *(_DWORD *)buf = 134283521;
            v118 = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "CLC:     ARR : %{private}lf", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v70 = qword_1022A0028;
            objc_msgSend(v36, "scheduledArrival");
            v115 = 134283521;
            v116 = v71;
            LODWORD(v103) = 12;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v70, 2, "CLC:     ARR : %{private}lf", &v115, v103);
            v73 = (uint8_t *)v72;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v72);
            if (v73 != buf)
              free(v73);
          }
        }
        if (objc_msgSend(v36, "hasStopFrom"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v44 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "CLC:     Stop From :", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            LOWORD(v115) = 0;
            LODWORD(v103) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC:     Stop From :", &v115, v103);
            v75 = (uint8_t *)v74;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v74);
            if (v75 != buf)
              free(v75);
          }
          if (objc_msgSend(objc_msgSend(v36, "stopFrom"), "hasStopID"))
          {
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v45 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              v46 = objc_msgSend(objc_msgSend(v36, "stopFrom"), "stopID");
              *(_DWORD *)buf = 134283521;
              v118 = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "CLC:         ID  : %{private}llu", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v78 = qword_1022A0028;
              v79 = objc_msgSend(objc_msgSend(v36, "stopFrom"), "stopID");
              v115 = 134283521;
              v116 = v79;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v78, 2, "CLC:         ID  : %{private}llu", &v115, v103);
              v81 = (uint8_t *)v80;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v80);
              if (v81 != buf)
                free(v81);
            }
          }
          if (objc_msgSend(objc_msgSend(v36, "stopFrom"), "hasCoordinate"))
          {
            v47 = objc_msgSend(objc_msgSend(v36, "stopFrom"), "coordinate");
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v48 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v47, "lat");
              *(_DWORD *)buf = 134283521;
              v118 = v49;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "CLC:         LAT : %{private}lf", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v82 = qword_1022A0028;
              objc_msgSend(v47, "lat");
              v115 = 134283521;
              v116 = v83;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v82, 2, "CLC:         LAT : %{private}lf", &v115, v103);
              v85 = (uint8_t *)v84;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v84);
              if (v85 != buf)
                free(v85);
            }
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v50 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v47, "lng");
              *(_DWORD *)buf = 134283521;
              v118 = v51;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "CLC:         LON : %{private}lf", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v86 = qword_1022A0028;
              objc_msgSend(v47, "lng");
              v115 = 134283521;
              v116 = v87;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v86, 2, "CLC:         LON : %{private}lf", &v115, v103);
              v89 = (uint8_t *)v88;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v88);
              if (v89 != buf)
                free(v89);
            }
          }
        }
        if (objc_msgSend(v36, "hasStopTo"))
        {
          if (qword_1022A0020 != -1)
            dispatch_once(&qword_1022A0020, &stru_102152638);
          v52 = qword_1022A0028;
          if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "CLC:     Stop To :", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            LOWORD(v115) = 0;
            LODWORD(v103) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC:     Stop To :", &v115, v103);
            v77 = (uint8_t *)v76;
            sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v76);
            if (v77 != buf)
              free(v77);
          }
          if (objc_msgSend(objc_msgSend(v36, "stopTo"), "hasStopID"))
          {
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v53 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              v54 = objc_msgSend(objc_msgSend(v36, "stopTo"), "stopID");
              *(_DWORD *)buf = 134283521;
              v118 = v54;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "CLC:         ID  : %{private}llu", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v90 = qword_1022A0028;
              v91 = objc_msgSend(objc_msgSend(v36, "stopTo"), "stopID");
              v115 = 134283521;
              v116 = v91;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v90, 2, "CLC:         ID  : %{private}llu", &v115, v103);
              v93 = (uint8_t *)v92;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v92);
              if (v93 != buf)
                free(v93);
            }
          }
          if (objc_msgSend(objc_msgSend(v36, "stopFrom"), "hasCoordinate"))
          {
            v55 = objc_msgSend(objc_msgSend(v36, "stopTo"), "coordinate");
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v56 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v55, "lat");
              *(_DWORD *)buf = 134283521;
              v118 = v57;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "CLC:         LAT : %{private}lf", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v94 = qword_1022A0028;
              objc_msgSend(v55, "lat");
              v115 = 134283521;
              v116 = v95;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v94, 2, "CLC:         LAT : %{private}lf", &v115, v103);
              v97 = (uint8_t *)v96;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v96);
              if (v97 != buf)
                free(v97);
            }
            if (qword_1022A0020 != -1)
              dispatch_once(&qword_1022A0020, &stru_102152638);
            v58 = qword_1022A0028;
            if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v55, "lng");
              *(_DWORD *)buf = 134283521;
              v118 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "CLC:         LON : %{private}lf", buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1022A0020 != -1)
                dispatch_once(&qword_1022A0020, &stru_102152638);
              v98 = qword_1022A0028;
              objc_msgSend(v55, "lng");
              v115 = 134283521;
              v116 = v99;
              LODWORD(v103) = 12;
              _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v98, 2, "CLC:         LON : %{private}lf", &v115, v103);
              v101 = (uint8_t *)v100;
              sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logTransitRoute:]", "%s\n", v100);
              if (v101 != buf)
                free(v101);
            }
          }
        }
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      v33 = v102;
    }
    while (v102);
  }
}

- (void)logState:(id)a3
{
  NSObject *v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  id v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  const char *v22;
  uint8_t *v23;
  const char *v24;
  uint8_t *v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  int v29;
  __CFString *v30;
  uint8_t buf[4];
  __CFString *v32;

  if (objc_msgSend(a3, "hasGuidanceLevel"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v4 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(a3, "guidanceLevel");
      if (v5 >= 4)
        v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      else
        v6 = off_102152658[(int)v5];
      *(_DWORD *)buf = 138543362;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLC: Guidance Level   : %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v13 = qword_1022A0028;
      v14 = objc_msgSend(a3, "guidanceLevel");
      if (v14 >= 4)
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      else
        v15 = off_102152658[(int)v14];
      v29 = 138543362;
      v30 = v15;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 2, "CLC: Guidance Level   : %{public}@", &v29, 12);
      v23 = (uint8_t *)v22;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v22);
      if (v23 != buf)
        free(v23);
    }
  }
  if (objc_msgSend(a3, "hasNavigationState"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v7 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(a3, "navigationState");
      if (v8 >= 9)
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      else
        v9 = off_102152678[(int)v8];
      *(_DWORD *)buf = 138543362;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLC: Navigation State : %{public}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v16 = qword_1022A0028;
      v17 = objc_msgSend(a3, "navigationState");
      if (v17 >= 9)
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
      else
        v18 = off_102152678[(int)v17];
      v29 = 138543362;
      v30 = v18;
      LODWORD(v28) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v16, 2, "CLC: Navigation State : %{public}@", &v29, v28);
      v25 = (uint8_t *)v24;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v24);
      if (v25 != buf)
        free(v25);
    }
  }
  if (objc_msgSend(a3, "hasTrackedTransportType"))
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v10 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(a3, "trackedTransportType");
      if (v11 >= 7)
        v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      else
        v12 = off_1021526C0[(int)v11];
      *(_DWORD *)buf = 138477827;
      v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLC: Transport Type   : %{private}@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v19 = qword_1022A0028;
      v20 = objc_msgSend(a3, "trackedTransportType");
      if (v20 >= 7)
        v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      else
        v21 = off_1021526C0[(int)v20];
      v29 = 138477827;
      v30 = v21;
      LODWORD(v28) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "CLC: Transport Type   : %{private}@", &v29, v28);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener logState:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
  }
}

- (void)onDarwinNotification:(int)a3 data:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (a3 == 8)
  {
    if (qword_1022A0020 != -1)
      dispatch_once(&qword_1022A0020, &stru_102152638);
    v5 = qword_1022A0028;
    if (os_log_type_enabled((os_log_t)qword_1022A0028, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLC: navigation stopped", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0020 != -1)
        dispatch_once(&qword_1022A0020, &stru_102152638);
      v8[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0028, 2, "CLC: navigation stopped", v8, 2);
      v7 = (uint8_t *)v6;
      sub_100512490("Generic", 1, 0, 2, "-[CLRouteListener onDarwinNotification:data:]", "%s\n", v6);
      if (v7 != buf)
        free(v7);
    }
    if (self->_lastEtaInSeconds != -1.0)
    {
      self->_lastEtaInSeconds = -1.0;
      (*((void (**)(INotifier *))self->_parentNotifier->var0 + 3))(self->_parentNotifier);
    }
  }
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end

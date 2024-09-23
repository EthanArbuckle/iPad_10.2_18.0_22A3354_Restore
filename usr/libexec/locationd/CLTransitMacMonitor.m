@implementation CLTransitMacMonitor

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
  if (qword_10230E2B0 != -1)
    dispatch_once(&qword_10230E2B0, &stru_1021AE880);
  return (id)qword_10230E2A8;
}

- (CLTransitMacMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTransitMacMonitor;
  return -[CLTransitMacMonitor initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLTransitMacMonitorProtocol, &OBJC_PROTOCOL___CLTransitMacMonitorClientProtocol);
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  if (qword_1022A0120 != -1)
    dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
  v3 = qword_1022A0128;
  if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service begin", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 2, "#TransitMacMonitor: service begin", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLTransitMacMonitor setCurrentState:](self, "setCurrentState:", 0);
  -[CLTransitMacMonitor setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  -[CLTransitMacMonitor setObservedTransitAccessPointsCache:](self, "setObservedTransitAccessPointsCache:", +[NSMutableArray array](NSMutableArray, "array"));
  self->_wifiServiceProxy = (CLWifiServiceProtocol *)objc_msgSend(objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLWifiService"));
  -[CLTransitMacMonitor universe](self, "universe");
  sub_1001B7DEC();
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  Client *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  if (qword_1022A0120 != -1)
    dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
  v3 = qword_1022A0128;
  if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service end", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 2, "#TransitMacMonitor: service end", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor endService]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
  -[CLTransitMacMonitor setClients:](self, "setClients:", 0);
  -[CLTransitMacMonitor setObservedTransitAccessPointsCache:](self, "setObservedTransitAccessPointsCache:", 0);

  self->_wifiServiceProxy = 0;
  v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *))(*(_QWORD *)v5 + 8))(v5);

  self->_transitMacTileDataProviderProxy = 0;
}

- (void)startMonitoringTransitStateForClient:(id)a3
{
  uint64_t v5;

  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  if (!-[NSMutableSet count](-[CLTransitMacMonitor clients](self, "clients"), "count"))
  {
    LODWORD(v5) = 3600;
    WORD2(v5) = 257;
    objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "register:forNotification:registrationInfo:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 3, 0, v5, "dwr");
    sub_10061DCC4();
  }
  -[NSMutableSet addObject:](-[CLTransitMacMonitor clients](self, "clients"), "addObject:", a3);
  objc_msgSend(a3, "onTransitStateUpdate:", -[CLTransitMacMonitor currentState](self, "currentState"));
}

- (void)stopMonitoringTransitStateForClient:(id)a3
{
  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  if (-[NSMutableSet containsObject:](-[CLTransitMacMonitor clients](self, "clients"), "containsObject:", a3))
  {
    -[NSMutableSet removeObject:](-[CLTransitMacMonitor clients](self, "clients"), "removeObject:", a3);
    if (!-[NSMutableSet count](-[CLTransitMacMonitor clients](self, "clients"), "count"))
    {
      objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 3);
      objc_msgSend(*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_wifiServiceClient.__ptr_.__value_ + 1), 12);
      objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 4);
    }
  }
}

- (void)setCurrentState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t currentState;
  NSMutableSet *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  unint64_t v12;
  const char *v13;
  uint8_t *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  int v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;

  if (self->_currentState != a3)
  {
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v5 = qword_1022A0128;
    if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_DEBUG))
    {
      currentState = self->_currentState;
      *(_DWORD *)buf = 134349312;
      v25 = currentState;
      v26 = 2050;
      v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: transit state changed from, %{public}lu, to, %{public}lu", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0120 != -1)
        dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
      v12 = self->_currentState;
      v20 = 134349312;
      v21 = v12;
      v22 = 2050;
      v23 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 2, "#TransitMacMonitor: transit state changed from, %{public}lu, to, %{public}lu", &v20, 22);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor setCurrentState:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    self->_currentState = a3;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = -[CLTransitMacMonitor clients](self, "clients");
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "onTransitStateUpdate:", a3);
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }
}

- (void)processNewAccessPoints:(const void *)a3 transitTileResults:(id)a4
{
  CLTransitMacMonitor *v6;
  uint64_t v7;
  int i;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  id v14;
  NSMutableArray *v15;
  CLTransitMacMonitorAccessPoint *v16;
  NSObject *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  char *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *m;
  uint64_t v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  id v51;
  uint64_t v52;
  void *n;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  id v64;
  const char *v65;
  char *v66;
  uint64_t v67;
  id v68;
  const char *v69;
  char *v70;
  uint64_t v71;
  CLTransitMacMonitor *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  int v90;
  _BYTE v91[18];
  __int16 v92;
  double v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  _BYTE buf[22];
  __int16 v98;
  double v99;
  _BYTE v100[128];

  v6 = self;
  objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "silo");
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_101310240;
  v89[3] = &unk_1021AE8A0;
  v89[4] = CFAbsoluteTimeGetCurrent();
  -[NSMutableArray filterUsingPredicate:](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "filterUsingPredicate:", +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v89));
  v7 = *(_QWORD *)a3;
  v72 = v6;
  for (i = 0; v7 != *((_QWORD *)a3 + 1); v7 += 88)
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v86;
      while (2)
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(_QWORD *)v86 != v11)
            objc_enumerationMutation(a4);
          v13 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
          *(_QWORD *)buf = *(_QWORD *)v7;
          v14 = (id)sub_100129380((uint64_t)buf);
          if (v14 == objc_msgSend(v13, "macAddress"))
          {
            v6 = v72;
            v15 = -[CLTransitMacMonitor observedTransitAccessPointsCache](v72, "observedTransitAccessPointsCache");
            v16 = [CLTransitMacMonitorAccessPoint alloc];
            *(_QWORD *)buf = *(_QWORD *)v7;
            -[NSMutableArray addObject:](v15, "addObject:", -[CLTransitMacMonitorAccessPoint initWithMacAddress:timestamp:](v16, "initWithMacAddress:timestamp:", sub_100129380((uint64_t)buf), *(double *)(v7 + 56)));
            ++i;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
        if (v10)
          continue;
        break;
      }
      v6 = v72;
    }
LABEL_12:
    ;
  }
  if (qword_1022A0120 != -1)
    dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
  v17 = qword_1022A0128;
  if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
  {
    v18 = -[NSMutableArray count](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "count");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = i;
    *(_WORD *)&buf[8] = 2050;
    *(_QWORD *)&buf[10] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#TransitMacMonitor: added %{public}d new access point scans, total cache size, %{public}lu", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v63 = qword_1022A0128;
    v64 = -[NSMutableArray count](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "count");
    v90 = 67240448;
    *(_DWORD *)v91 = i;
    *(_WORD *)&v91[4] = 2050;
    *(_QWORD *)&v91[6] = v64;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v63, 1, "#TransitMacMonitor: added %{public}d new access point scans, total cache size, %{public}lu", &v90, 18);
    v66 = (char *)v65;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v65);
    if (v66 != buf)
      free(v66);
  }
  if (!-[NSMutableArray count](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "count"))
  {
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v38 = qword_1022A0128;
    if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "#TransitMacMonitor: no scan history", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_72;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    LOWORD(v90) = 0;
    LODWORD(v71) = 2;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 1, "#TransitMacMonitor: no scan history", &v90, v71);
LABEL_49:
    v39 = (char *)v37;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v37);
    if (v39 != buf)
      free(v39);
    goto LABEL_72;
  }
  v19 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "objectAtIndexedSubscript:", 0), "timestamp");
  v21 = v20;
  objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "objectAtIndexedSubscript:", 0), "timestamp");
  v23 = v22;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v24 = -[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache");
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(_QWORD *)v82 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)k);
        v30 = objc_msgSend(v19, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "macAddress")));
        if (!v30)
        {
          v30 = +[NSMutableArray array](NSMutableArray, "array");
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "macAddress")));
        }
        objc_msgSend(v30, "addObject:", v29);
        objc_msgSend(v29, "timestamp");
        if (v31 < v21)
        {
          objc_msgSend(v29, "timestamp");
          v21 = v32;
        }
        objc_msgSend(v29, "timestamp");
        if (v33 > v23)
        {
          objc_msgSend(v29, "timestamp");
          v23 = v34;
        }
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
    }
    while (v26);
  }
  v35 = v23 - v21;
  if (v35 < 180.0)
  {
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v36 = qword_1022A0128;
    if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(double *)&buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#TransitMacMonitor: not enough scan history, length, %{public}f", buf, 0xCu);
    }
    if (!sub_1001BFF7C(115, 2))
      goto LABEL_72;
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v90 = 134349056;
    *(double *)v91 = v35;
    LODWORD(v71) = 12;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 1, "#TransitMacMonitor: not enough scan history, length, %{public}f", &v90, v71);
    goto LABEL_49;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v40 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
  if (!v40)
  {
LABEL_72:
    v60 = 0;
    goto LABEL_73;
  }
  v41 = v40;
  v42 = *(_QWORD *)v78;
  while (2)
  {
    for (m = 0; m != v41; m = (char *)m + 1)
    {
      if (*(_QWORD *)v78 != v42)
        objc_enumerationMutation(v19);
      v44 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)m);
      v45 = objc_msgSend(v19, "objectForKeyedSubscript:", v44);
      if ((unint64_t)objc_msgSend(v45, "count") >= 3)
      {
        objc_msgSend(objc_msgSend(v45, "objectAtIndexedSubscript:", 0), "timestamp");
        v47 = v46;
        objc_msgSend(objc_msgSend(v45, "objectAtIndexedSubscript:", 0), "timestamp");
        v49 = v48;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v50 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v74;
          do
          {
            for (n = 0; n != v51; n = (char *)n + 1)
            {
              if (*(_QWORD *)v74 != v52)
                objc_enumerationMutation(v45);
              v54 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)n);
              objc_msgSend(v54, "timestamp");
              if (v55 < v47)
              {
                objc_msgSend(v54, "timestamp");
                v47 = v56;
              }
              objc_msgSend(v54, "timestamp");
              if (v57 > v49)
              {
                objc_msgSend(v54, "timestamp");
                v49 = v58;
              }
            }
            v51 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
          }
          while (v51);
        }
        v59 = v49 - v47;
        if (v59 >= 180.0)
        {
          if (qword_1022A0120 != -1)
            dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
          v61 = qword_1022A0128;
          if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
          {
            v62 = objc_msgSend(v45, "count");
            *(_DWORD *)buf = 138478339;
            *(_QWORD *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 2050;
            *(_QWORD *)&buf[14] = v62;
            v98 = 2050;
            v99 = v59;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "#TransitMacMonitor: transit state, on transit, based on mac, %{private}@, history count, %{public}lu, interval, %{public}f", buf, 0x20u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A0120 != -1)
              dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
            v67 = qword_1022A0128;
            v68 = objc_msgSend(v45, "count");
            v90 = 138478339;
            *(_QWORD *)v91 = v44;
            *(_WORD *)&v91[8] = 2050;
            *(_QWORD *)&v91[10] = v68;
            v92 = 2050;
            v93 = v59;
            LODWORD(v71) = 32;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v67, 1, "#TransitMacMonitor: transit state, on transit, based on mac, %{private}@, history count, %{public}lu, interval, %{public}f", &v90, v71);
            v70 = (char *)v69;
            sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v69);
            if (v70 != buf)
              free(v70);
          }
          v60 = 1;
          goto LABEL_73;
        }
      }
    }
    v41 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    v60 = 0;
    if (v41)
      continue;
    break;
  }
LABEL_73:
  -[CLTransitMacMonitor setCurrentState:](v72, "setCurrentState:", v60);
}

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  void (**v7)(uint8_t *__return_ptr);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  const char *v38;
  uint8_t *v39;
  uint64_t v40;
  _QWORD v41[5];
  void *v42[3];
  void *__p;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  _BYTE v49[12];
  uint8_t buf[16];
  __int128 v51[101];

  objc_msgSend(objc_msgSend((id)a1, "universe"), "silo");
  v46 = 0;
  v47 = 0;
  v48 = 0;
  if (a3 != 12)
  {
    if (a3 == 3)
    {
      v7 = (void (**)(uint8_t *__return_ptr))objc_msgSend(*(id *)(a1 + 8), "syncgetScanResult");
      if (v7)
      {
        v7[2](buf);
        v8 = *(_QWORD *)&buf[8];
        v9 = *(_QWORD *)&v51[0];
      }
      else
      {
        v9 = 0;
        v8 = 0;
        *(_OWORD *)buf = 0u;
        v51[0] = 0u;
      }
      sub_10055A264((uint64_t *)&v46, v8, v9, 0x2E8BA2E8BA2E8BA3 * ((v9 - v8) >> 3));
      *(_QWORD *)v49 = &buf[8];
      sub_100279AA4((void ***)v49);
    }
LABEL_18:
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v16 = qword_1022A0128;
    if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#TransitMacMonitor: wifi notification, %{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0120 != -1)
        dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
      *(_DWORD *)v49 = 67240192;
      *(_DWORD *)&v49[4] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 1, "#TransitMacMonitor: wifi notification, %{public}d", v49, 8);
      v39 = (uint8_t *)v38;
      sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v38);
      if (v39 != buf)
        free(v39);
    }
    if (v47 != v46)
    {
      if (objc_msgSend((id)a1, "mostRecentLocation"))
      {
        memset(buf, 0, sizeof(buf));
        *(_QWORD *)&v51[0] = 0;
        sub_1002FF5A4((void **)buf, 0x2E8BA2E8BA2E8BA3 * (v47 - v46));
        v17 = v46;
        if (v46 == v47)
        {
          v21 = *(_QWORD *)&buf[8];
        }
        else
        {
          do
          {
            *(_QWORD *)v49 = *v17;
            v18 = sub_100129380((uint64_t)v49);
            v19 = v18;
            v20 = *(char **)&buf[8];
            if (*(_QWORD *)&buf[8] >= *(_QWORD *)&v51[0])
            {
              v22 = *(char **)buf;
              v23 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3;
              v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 61)
                sub_100259694();
              v25 = *(_QWORD *)&v51[0] - *(_QWORD *)buf;
              if ((uint64_t)(*(_QWORD *)&v51[0] - *(_QWORD *)buf) >> 2 > v24)
                v24 = v25 >> 2;
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
                v26 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v26 = v24;
              if (v26)
              {
                v27 = (char *)sub_10025E6A0((uint64_t)v51, v26);
                v22 = *(char **)buf;
                v20 = *(char **)&buf[8];
              }
              else
              {
                v27 = 0;
              }
              v28 = (uint64_t *)&v27[8 * v23];
              *v28 = v19;
              v21 = (uint64_t)(v28 + 1);
              while (v20 != v22)
              {
                v29 = *((_QWORD *)v20 - 1);
                v20 -= 8;
                *--v28 = v29;
              }
              *(_QWORD *)buf = v28;
              *(_QWORD *)&buf[8] = v21;
              *(_QWORD *)&v51[0] = &v27[8 * v26];
              if (v22)
                operator delete(v22);
            }
            else
            {
              **(_QWORD **)&buf[8] = v18;
              v21 = (uint64_t)(v20 + 8);
            }
            *(_QWORD *)&buf[8] = v21;
            v17 += 11;
          }
          while (v17 != v47);
        }
        v32 = *(void **)(a1 + 24);
        v44 = 0;
        v45 = 0;
        __p = 0;
        sub_10025EA00(&__p, *(const void **)buf, v21, (v21 - *(_QWORD *)buf) >> 3);
        v33 = sub_100958000((uint64_t)&__p);
        objc_msgSend(objc_msgSend((id)a1, "mostRecentLocation"), "coordinate");
        v35 = v34;
        objc_msgSend(objc_msgSend((id)a1, "mostRecentLocation"), "coordinate");
        v37 = v36;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3321888768;
        v41[2] = sub_101310ACC;
        v41[3] = &unk_1021AE8C8;
        v41[4] = a1;
        memset(v42, 0, sizeof(v42));
        sub_10055A7B8(v42, (uint64_t)v46, (uint64_t)v47, 0x2E8BA2E8BA2E8BA3 * (v47 - v46));
        objc_msgSend(v32, "fetchMacAddressesAmong:nearLatitude:longitude:withReply:", v33, v41, v35, v37);
        if (__p)
        {
          v44 = __p;
          operator delete(__p);
        }
        *(_QWORD *)v49 = v42;
        sub_100279AA4((void ***)v49);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        goto LABEL_59;
      }
      if (qword_1022A0120 != -1)
        dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
      v30 = qword_1022A0128;
      if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283521;
        *(_QWORD *)&buf[4] = 0x2E8BA2E8BA2E8BA3 * (v47 - v46);
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#TransitMacMonitor: received a wifi scan with %{private}lu access points, but we don't have a location to query tiles", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A0120 != -1)
          dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
        *(_DWORD *)v49 = 134283521;
        *(_QWORD *)&v49[4] = 0x2E8BA2E8BA2E8BA3 * (v47 - v46);
        LODWORD(v40) = 12;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0128, 1, "#TransitMacMonitor: received a wifi scan with %{private}lu access points, but we don't have a location to query tiles", v49, v40);
        v15 = (uint8_t *)v31;
        sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v31);
LABEL_52:
        if (v15 != buf)
          free(v15);
        goto LABEL_59;
      }
    }
    goto LABEL_59;
  }
  if (!sub_101067CC8(*(_DWORD *)(a4 + 140)))
  {
    if (&v46 != (_QWORD **)(a4 + 112))
      sub_10055A264((uint64_t *)&v46, *(_QWORD *)(a4 + 112), *(_QWORD *)(a4 + 120), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(_QWORD *)(a4 + 120) - *(_QWORD *)(a4 + 112)) >> 3));
    goto LABEL_18;
  }
  if (qword_1022A0120 != -1)
    dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
  v10 = qword_1022A0128;
  if (os_log_type_enabled((os_log_t)qword_1022A0128, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_100CF2174(*(_DWORD *)(a4 + 140));
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: ignoring NotificationScanCache source %{public}s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0120 != -1)
      dispatch_once(&qword_1022A0120, &stru_1021AE8F8);
    v12 = qword_1022A0128;
    v13 = sub_100CF2174(*(_DWORD *)(a4 + 140));
    *(_DWORD *)v49 = 136446210;
    *(_QWORD *)&v49[4] = v13;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "#TransitMacMonitor: ignoring NotificationScanCache source %{public}s", v49, 12);
    v15 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v14);
    goto LABEL_52;
  }
LABEL_59:
  *(_QWORD *)buf = &v46;
  sub_100279AA4((void ***)buf);
}

- (void)onLocationNotification:(int)a3 data:(_OWORD *)a4
{
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  _OWORD v15[8];
  _OWORD v16[2];
  _DWORD v17[4];
  uint8_t buf[4];
  int v19;

  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if ((a3 | 4) == 4)
  {
    v7 = objc_alloc((Class)CLLocation);
    v8 = a4[7];
    v15[6] = a4[6];
    v15[7] = v8;
    v16[0] = a4[8];
    *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)((char *)a4 + 140);
    v9 = a4[3];
    v15[2] = a4[2];
    v15[3] = v9;
    v10 = a4[5];
    v15[4] = a4[4];
    v15[5] = v10;
    v11 = a4[1];
    v15[0] = *a4;
    v15[1] = v11;
    objc_msgSend(a1, "setMostRecentLocation:", objc_msgSend(v7, "initWithClientLocation:", v15));
  }
  else
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_1021AE918);
    v12 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240192;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_1021AE918);
      v17[0] = 67240192;
      v17[1] = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01F8, 17, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", v17, 8);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[CLTransitMacMonitor onLocationNotification:data:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
  }
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)observedTransitAccessPointsCache
{
  return self->_observedTransitAccessPointsCache;
}

- (void)setObservedTransitAccessPointsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CLLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  Client *value;
  Client *v4;

  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

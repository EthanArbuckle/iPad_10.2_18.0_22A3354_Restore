@implementation CLStreamedLocationProviderServerDiscoverer

- (id)initOnQueue:(id)a3
{
  CLStreamedLocationProviderServerDiscoverer *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLStreamedLocationProviderServerDiscoverer;
  v4 = -[CLStreamedLocationProviderServerDiscoverer init](&v7, "init");
  if (v4)
  {
    v4->_workQ = (OS_dispatch_queue *)dispatch_queue_create("CLStreamedLocationProviderServerDiscoverer.workQueue", 0);
    v4->_requestQ = (OS_dispatch_queue *)dispatch_queue_create("CLStreamedLocationProviderServerDiscoverer.requestQueue", 0);
    v4->_nearbyDeviceListener = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    sub_100197040();
    if (sub_10075A02C())
    {
      -[RPCompanionLinkClient setFlags:](v4->_nearbyDeviceListener, "setFlags:", 1);
      v5 = 4;
    }
    else
    {
      v5 = 65538;
    }
    -[RPCompanionLinkClient setControlFlags:](v4->_nearbyDeviceListener, "setControlFlags:", v5);
    -[RPCompanionLinkClient setDispatchQueue:](v4->_nearbyDeviceListener, "setDispatchQueue:", a3);
    -[RPCompanionLinkClient setDeviceFoundHandler:](v4->_nearbyDeviceListener, "setDeviceFoundHandler:", &stru_10213E288);
    -[RPCompanionLinkClient setDeviceLostHandler:](v4->_nearbyDeviceListener, "setDeviceLostHandler:", &stru_10213E2A8);
    -[RPCompanionLinkClient activateWithCompletion:](v4->_nearbyDeviceListener, "activateWithCompletion:", &stru_10213E2E8);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CLStreamedLocationProviderServerDiscoverer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderServerDiscoverer;
  -[CLStreamedLocationProviderServerDiscoverer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSMutableArray *probeClients;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[RPCompanionLinkClient invalidate](self->_nearbyDeviceListener, "invalidate");

  self->_nearbyDeviceListener = 0;
  probeClients = self->_probeClients;
  if (probeClients)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeClients, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(probeClients);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "invalidate");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](probeClients, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
}

- (id)deviceWithEffectiveID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSObject *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[RPCompanionLinkClient activeDevices](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener", 0), "activeDevices");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v9, "effectiveIdentifier"), "isEqualToString:", a3))
        {
          if (qword_1022A01E0 != -1)
            dispatch_once(&qword_1022A01E0, &stru_10213E450);
          v10 = qword_1022A01E8;
          if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEBUG))
          {
            v11 = objc_msgSend(a3, "UTF8String");
            *(_DWORD *)buf = 68289283;
            v18 = 0;
            v19 = 2082;
            v20 = "";
            v21 = 2081;
            v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Multiclient found an active device with effective ID\", \"effectiveID\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          return v9;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 0;
}

+ (BOOL)iOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 16)
    return 0;
  if (a3->var0 == 16)
    return a3->var1 > 3;
  return 1;
}

+ (BOOL)macOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 14)
    return 0;
  if (a3->var0 == 14)
    return a3->var1 > 3;
  return 1;
}

+ (BOOL)validateRemoteDeviceForStreaming:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;

  v4 = (unint64_t)objc_msgSend(a3, "statusFlags");
  if (objc_msgSend(objc_msgSend(a3, "model"), "containsString:", CFSTR("Mac")))
  {
    sub_100197040();
    if (!sub_10075A02C())
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
      v5 = qword_1022A01E8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
        return 0;
      *(_DWORD *)buf = 68289026;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v6 = "{\"msg%{public}.0s\":\"#Multiclient not a VM, so not using mac\"}";
      v7 = v5;
      v8 = 18;
      goto LABEL_42;
    }
    if (a3)
      objc_msgSend(a3, "operatingSystemVersion");
    else
      memset(v27, 0, sizeof(v27));
    if (!+[CLStreamedLocationProviderServerDiscoverer macOSSourceVersionNewEnough:](CLStreamedLocationProviderServerDiscoverer, "macOSSourceVersionNewEnough:", v27))
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
      v12 = qword_1022A01E8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
        return 0;
      v13 = objc_msgSend(a3, "name");
      if (a3)
      {
        objc_msgSend(a3, "operatingSystemVersion");
        v14 = v24;
        objc_msgSend(a3, "operatingSystemVersion");
        v15 = v22;
      }
      else
      {
        v15 = 0;
        v14 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
      }
      *(_DWORD *)buf = 68289795;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v13;
      v34 = 2050;
      v35 = v14;
      v36 = 2050;
      v37 = v15;
      v6 = "{\"msg%{public}.0s\":\"#Multiclient macOS device running too-old software, ignoring\", \"name\":%{private, lo"
           "cation:escape_only}@, \"major\":%{public}ld, \"minor\":%{public}ld}";
      goto LABEL_41;
    }
    return 1;
  }
  if (objc_msgSend(objc_msgSend(a3, "model"), "hasPrefix:", CFSTR("iPhone")))
  {
    if (a3)
      objc_msgSend(a3, "operatingSystemVersion");
    else
      memset(v20, 0, sizeof(v20));
    if (!+[CLStreamedLocationProviderServerDiscoverer iOSSourceVersionNewEnough:](CLStreamedLocationProviderServerDiscoverer, "iOSSourceVersionNewEnough:", v20))
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_10213E450);
      v12 = qword_1022A01E8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
        return 0;
      v16 = objc_msgSend(a3, "name");
      if (a3)
      {
        objc_msgSend(a3, "operatingSystemVersion");
        v17 = v24;
        objc_msgSend(a3, "operatingSystemVersion");
        v18 = v22;
      }
      else
      {
        v18 = 0;
        v17 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
      }
      *(_DWORD *)buf = 68289795;
      v29 = 0;
      v30 = 2082;
      v31 = "";
      v32 = 2113;
      v33 = v16;
      v34 = 2050;
      v35 = v17;
      v36 = 2050;
      v37 = v18;
      v6 = "{\"msg%{public}.0s\":\"#Multiclient iOS device running too-old software, ignoring\", \"name\":%{private, loca"
           "tion:escape_only}@, \"major\":%{public}ld, \"minor\":%{public}ld}";
LABEL_41:
      v7 = v12;
      v8 = 48;
LABEL_42:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
      return 0;
    }
    return 1;
  }
  sub_100197040();
  if (!sub_10075A02C() || (v4 & 0x1000000) == 0)
  {
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_10213E450);
    v11 = qword_1022A01E8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
      return 0;
    *(_DWORD *)buf = 68289795;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = objc_msgSend(a3, "name");
    v34 = 2114;
    v35 = objc_msgSend(a3, "model");
    v36 = 1026;
    LODWORD(v37) = (v4 >> 24) & 1;
    v6 = "{\"msg%{public}.0s\":\"#Multiclient candidate is neither a phone nor a mac host, skipping\", \"name\":%{private"
         ", location:escape_only}@, \"model\":%{public, location:escape_only}@, \"USB?\":%{public}hhd}";
    v7 = v11;
    v8 = 44;
    goto LABEL_42;
  }
  if (qword_1022A01E0 != -1)
    dispatch_once(&qword_1022A01E0, &stru_10213E450);
  v9 = qword_1022A01E8;
  v10 = 1;
  if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2113;
    v33 = objc_msgSend(a3, "name");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Multiclient accepting this device because it looks like it's our host\", \"name\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  return v10;
}

- (void)findCandidateServersWithCompletion:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  NSDictionary *v16;
  dispatch_time_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD block[7];
  _QWORD v25[9];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];

  v23 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v22 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(-[RPCompanionLinkClient localDevice](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "localDevice"), "effectiveIdentifier"), CFSTR("kCLLocationSTreamingMessageRapportDeviceIDKey"));
  self->_probeClients = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(-[RPCompanionLinkClient activeDevices](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "activeDevices"), "count"));
  sub_100197040();
  v26 = 0u;
  v27 = 0u;
  if (sub_10075A02C())
    v4 = 0x380000103C04;
  else
    v4 = 532482;
  v28 = 0uLL;
  v29 = 0uLL;
  v5 = -[RPCompanionLinkClient activeDevices](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "activeDevices");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v21 = RPOptionTimeoutSeconds;
    v20 = RPOptionStatusFlags;
    v19 = RPOptionAllowUnauthenticated;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        v11 = objc_msgSend(v10, "statusFlags");
        sub_100197040();
        if (!sub_10075A02C() || (v11 & 0x1000000) != 0)
        {
          if (+[CLStreamedLocationProviderServerDiscoverer validateRemoteDeviceForStreaming:](CLStreamedLocationProviderServerDiscoverer, "validateRemoteDeviceForStreaming:", v10))
          {
            v15 = objc_alloc_init((Class)RPCompanionLinkClient);
            objc_msgSend(v15, "setDispatchQueue:", -[CLStreamedLocationProviderServerDiscoverer workQ](self, "workQ"));
            sub_100197040();
            if (sub_10075A02C())
            {
              objc_msgSend(v15, "setControlFlags:", v4);
              objc_msgSend(v15, "setFlags:", 1);
              v32[0] = v21;
              v32[1] = v19;
              v33[0] = &off_10221B090;
              v33[1] = &__kCFBooleanTrue;
              v32[2] = v20;
              v33[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v4);
              v16 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
            }
            else
            {
              objc_msgSend(v15, "setControlFlags:", 2);
              v30[0] = v21;
              v30[1] = v20;
              v31[0] = &off_10221B090;
              v31[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v4);
              v16 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
              objc_msgSend(v15, "setControlFlags:", (unint64_t)objc_msgSend(v15, "controlFlags") | 0x100);
            }
            objc_msgSend(v15, "setDestinationDevice:", v10);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1004B6744;
            v25[3] = &unk_10213E360;
            v25[4] = v15;
            v25[5] = self;
            v25[6] = v22;
            v25[7] = v16;
            v25[8] = v23;
            objc_msgSend(v15, "activateWithCompletion:", v25);
            -[NSMutableArray addObject:](-[CLStreamedLocationProviderServerDiscoverer probeClients](self, "probeClients"), "addObject:", v15);
          }
        }
        else
        {
          if (qword_1022A01E0 != -1)
            dispatch_once(&qword_1022A01E0, &stru_10213E450);
          v12 = qword_1022A01E8;
          if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_DEBUG))
          {
            v13 = objc_msgSend(v10, "name");
            v14 = objc_msgSend(v10, "model");
            *(_DWORD *)buf = 68289538;
            v35 = 0;
            v36 = 2082;
            v37 = "";
            v38 = 2114;
            v39 = v13;
            v40 = 2114;
            v41 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Multiclient skipping this device because it's not the host\", \"name\":%{public, location:escape_only}@, \"model\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v7);
  }
  v17 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004B6D44;
  block[3] = &unk_10213E388;
  block[4] = self;
  block[5] = v23;
  block[6] = a3;
  dispatch_after(v17, (dispatch_queue_t)-[RPCompanionLinkClient dispatchQueue](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "dispatchQueue"), block);
}

- (RPCompanionLinkClient)nearbyDeviceListener
{
  return self->_nearbyDeviceListener;
}

- (void)setNearbyDeviceListener:(id)a3
{
  self->_nearbyDeviceListener = (RPCompanionLinkClient *)a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
  self->_workQ = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)requestQ
{
  return self->_requestQ;
}

- (void)setRequestQ:(id)a3
{
  self->_requestQ = (OS_dispatch_queue *)a3;
}

- (NSMutableArray)probeClients
{
  return self->_probeClients;
}

- (void)setProbeClients:(id)a3
{
  self->_probeClients = (NSMutableArray *)a3;
}

@end

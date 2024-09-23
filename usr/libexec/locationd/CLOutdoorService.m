@implementation CLOutdoorService

- (void)onAmbientLightSensorData:(const CLALSLuxResult *)a3
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (-[CLOutdoorService manager](self, "manager"))
    sub_10023D048((uint64_t)-[CLOutdoorService manager](self, "manager"), (__n128 *)a3);
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 1)
  {
    if (-[CLOutdoorService manager](self, "manager"))
      sub_10023D040((uint64_t)-[CLOutdoorService manager](self, "manager"), a4);
  }
}

- (void)onMotionStateCoprocessorData:(const void *)a3
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (-[CLOutdoorService manager](self, "manager"))
    sub_1000D57E4((uint64_t)-[CLOutdoorService manager](self, "manager"), (uint64_t)a3);
}

- (void)onWifiNotification:(const int *)a3 data:(const void *)a4
{
  uint64_t v7;
  _QWORD v8[3];
  void **v9;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 3)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      v7 = *((_QWORD *)a4 + 13);
      memset(v8, 0, sizeof(v8));
      sub_10055A7B8(v8, *((_QWORD *)a4 + 14), *((_QWORD *)a4 + 15), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)a4 + 15) - *((_QWORD *)a4 + 14)) >> 3));
      sub_1000ADDE8((uint64_t)-[CLOutdoorService manager](self, "manager"), &v7);
      v9 = (void **)v8;
      sub_100279AA4(&v9);
    }
  }
}

- (void)onOutdoorUpdate:(const OutdoorUpdate *)a3
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  -[CLOutdoorService notifyClients:](self, "notifyClients:", a3);
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  __n128 *v10;
  _WORD v11[8];
  __n128 buf[102];

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 14)
  {
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v9 = qword_1022A0198;
    if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].n128_u16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received location authorization update", (uint8_t *)buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0190 != -1)
        dispatch_once(&qword_1022A0190, &stru_10218CD58);
      v11[0] = 0;
      v10 = (__n128 *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0198, 0, "Received location authorization update", v11, 2);
      sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService onLocationNotification:data:]", "%s\n", (const char *)v10);
      if (v10 != buf)
        free(v10);
    }
    -[CLOutdoorService updateLocationAuthorization](self, "updateLocationAuthorization");
  }
  else if (*a3 == 5)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      *(float *)&v7 = *(double *)((char *)a4 + 4);
      *(float *)&v8 = *(double *)((char *)a4 + 12);
      buf[0].n128_u64[0] = *(_QWORD *)((char *)a4 + 76);
      buf[0].n128_u64[1] = v7 | ((unint64_t)v8 << 32);
      sub_100121F6C((uint64_t)-[CLOutdoorService manager](self, "manager"), buf);
    }
  }
}

- (void)onGnssAvailabilityPredictorNotification:(const int *)a3 data:(const void *)a4
{
  void *v7;
  __int128 v8;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 36)
  {
    if (-[CLOutdoorService manager](self, "manager"))
    {
      v7 = -[CLOutdoorService manager](self, "manager", CFAbsoluteTimeGetCurrent(), *((_QWORD *)a4 + 166), *((_QWORD *)a4 + 167), *((_QWORD *)a4 + 168));
      sub_100138100((uint64_t)v7, &v8);
    }
  }
}

- (void)manager
{
  return self->_manager;
}

- (void)notifyClients:(const OutdoorUpdate *)a3
{
  __int128 v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];

  v3 = *(_OWORD *)&a3->var2;
  v14 = *(_OWORD *)&a3->var0;
  v15 = v3;
  v16 = *(_OWORD *)&a3->var4;
  v17 = *(_QWORD *)&a3->var6;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CLOutdoorService clients](self, "clients", 0);
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        v19 = v14;
        v20 = v15;
        v21 = v16;
        v22 = v17;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10008C9F8;
        v18[3] = &unk_10218CD98;
        objc_msgSend(v9, "onOutdoorUpdate:", objc_msgSend(v18, "copy"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v6);
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
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
  if (qword_102308C38 != -1)
    dispatch_once(&qword_102308C38, &stru_10218CC38);
  return (id)qword_102308C30;
}

- (CLOutdoorService)init
{
  CLOutdoorService *v2;
  CLOutdoorService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLOutdoorService;
  v2 = -[CLOutdoorService initWithInboundProtocol:outboundProtocol:](&v5, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLOutdoorServiceProtocol, &OBJC_PROTOCOL___CLOutdoorServiceClientProtocol);
  v3 = v2;
  if (v2)
  {
    -[CLOutdoorService setClients:](v2, "setClients:", 0);
    -[CLOutdoorService setCallbackAdapter:](v3, "setCallbackAdapter:", 0);
    -[CLOutdoorService setManager:](v3, "setManager:", 0);
    v3->fBatterySaverModeEnabled = 0;
    v3->fFitnessTrackingEnabled = 0;
    v3->fLocationServicesEnabled = 0;
    v3->fBedtimeSleepModeEnabled = 0;
    v3->fClientAuthorizationCache = 0;
    v3->fBiomeScheduler = 0;
    v3->fBiomeSink = 0;
  }
  return v3;
}

+ (BOOL)isSupported
{
  if (qword_102308C48 != -1)
    dispatch_once(&qword_102308C48, &stru_10218CC58);
  return byte_102308C40;
}

- (void)beginService
{
  -[CLOutdoorService setClients:](self, "setClients:", +[NSMutableSet set](NSMutableSet, "set"));
  operator new();
}

- (void)endService
{
  Client *value;
  Client *v4;
  Client *v5;
  Client *v6;
  CLServiceLocationProvider *v7;
  CLClientAuthorizationCacheProtocol *fClientAuthorizationCache;
  Client *v9;
  Client *v10;
  BMBiomeScheduler *fBiomeScheduler;
  BPSSink *fBiomeSink;
  CLOutdoorManagerCallbackAdapter *v13;

  -[CLOutdoorService unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification](self, "unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification");
  sub_100E67820((uint64_t **)&self->fAlsCollector, 0);
  -[CLOutdoorService teardownManager](self, "teardownManager");
  value = self->fDaemonStatusClient.__ptr_.__value_;
  if (value)
  {
    objc_msgSend(*((id *)value + 2), "unregister:forNotification:", *((_QWORD *)value + 1), 15);
    v4 = self->fDaemonStatusClient.__ptr_.__value_;
    self->fDaemonStatusClient.__ptr_.__value_ = 0;
    if (v4)
      (*(void (**)(Client *))(*(_QWORD *)v4 + 8))(v4);
  }
  v5 = self->fServiceLocationClient.__ptr_.__value_;
  if (v5)
  {
    objc_msgSend(*((id *)v5 + 2), "unregister:forNotification:", *((_QWORD *)v5 + 1), 14);
    v6 = self->fServiceLocationClient.__ptr_.__value_;
    self->fServiceLocationClient.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Client *))(*(_QWORD *)v6 + 8))(v6);
  }
  v7 = self->fServiceLocationProvider.__ptr_.__value_;
  if (v7)
  {
    self->fServiceLocationProvider.__ptr_.__value_ = 0;
    (*(void (**)(CLServiceLocationProvider *))(*(_QWORD *)v7 + 8))(v7);
  }
  fClientAuthorizationCache = self->fClientAuthorizationCache;
  if (fClientAuthorizationCache)
  {

    self->fClientAuthorizationCache = 0;
  }
  v9 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v9)
  {
    objc_msgSend(*((id *)v9 + 2), "unregister:forNotification:", *((_QWORD *)v9 + 1), 0);
    v10 = self->fFitnessTrackingClient.__ptr_.__value_;
    self->fFitnessTrackingClient.__ptr_.__value_ = 0;
    if (v10)
      (*(void (**)(Client *))(*(_QWORD *)v10 + 8))(v10);
  }
  fBiomeScheduler = self->fBiomeScheduler;
  if (fBiomeScheduler)
  {

    self->fBiomeScheduler = 0;
  }
  fBiomeSink = self->fBiomeSink;
  if (fBiomeSink)
  {
    -[BPSSink cancel](fBiomeSink, "cancel");

    self->fBiomeSink = 0;
  }
  v13 = -[CLOutdoorService callbackAdapter](self, "callbackAdapter");
  if (v13)
    (*((void (**)(CLOutdoorManagerCallbackAdapter *))v13->var0 + 1))(v13);
  -[CLOutdoorService setCallbackAdapter:](self, "setCallbackAdapter:", 0);
  -[CLOutdoorService setClients:](self, "setClients:", 0);
}

- (void)setupManager
{
  operator new();
}

- (void)registerForAlgorithmSources
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  operator new();
}

- (void)unregisterForAlgorithmSources
{
  uint64_t v3;
  Dispatcher *value;
  uint64_t v5;
  Dispatcher *v6;
  uint64_t *v7;
  Client *v8;
  Client *v9;
  Client *v10;
  Client *v11;
  Client *v12;
  Client *v13;
  Client *v14;
  Client *v15;
  Client *v16;
  Client *v17;
  Client *v18;
  Client *v19;
  Client *v20;
  Client *v21;
  Client *v22;
  Client *v23;
  Client *v24;

  if (self->fMotionStateCoprocessorDispatcher.__ptr_.__value_)
  {
    v3 = sub_1001FBB04(0);
    sub_1000A4A6C(v3, 0, (uint64_t)self->fMotionStateCoprocessorDispatcher.__ptr_.__value_);
    value = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
    self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(Dispatcher *))(*(_QWORD *)value + 8))(value);
  }
  if (self->fOldMotionCoprocessorDispatcher.__ptr_.__value_)
  {
    v5 = sub_1001FBB04(0);
    sub_1000A4A6C(v5, 1, (uint64_t)self->fOldMotionCoprocessorDispatcher.__ptr_.__value_);
    v6 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
    self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0;
    if (v6)
      (*(void (**)(Dispatcher *))(*(_QWORD *)v6 + 8))(v6);
  }
  v7 = (uint64_t *)self->fAlsCollector.__ptr_.__value_;
  if (v7)
    sub_100883CA4(v7);
  if (sub_1000A42B0())
  {
    v8 = self->fBLSClient.__ptr_.__value_;
    if (v8)
    {
      objc_msgSend(*((id *)v8 + 2), "unregister:forNotification:", *((_QWORD *)v8 + 1), 1);
      v9 = self->fBLSClient.__ptr_.__value_;
      self->fBLSClient.__ptr_.__value_ = 0;
      if (v9)
        (*(void (**)(Client *))(*(_QWORD *)v9 + 8))(v9);
    }
  }
  v10 = self->fStepCountClient.__ptr_.__value_;
  if (v10)
  {
    objc_msgSend(*((id *)v10 + 2), "unregister:forNotification:", *((_QWORD *)v10 + 1), 1);
    v11 = self->fStepCountClient.__ptr_.__value_;
    self->fStepCountClient.__ptr_.__value_ = 0;
    if (v11)
      (*(void (**)(Client *))(*(_QWORD *)v11 + 8))(v11);
  }
  v12 = self->fServiceLocationClient.__ptr_.__value_;
  if (v12)
    objc_msgSend(*((id *)v12 + 2), "unregister:forNotification:", *((_QWORD *)v12 + 1), 5);
  v13 = self->fOdometerClient.__ptr_.__value_;
  if (v13)
  {
    objc_msgSend(*((id *)v13 + 2), "unregister:forNotification:", *((_QWORD *)v13 + 1), 4);
    v14 = self->fOdometerClient.__ptr_.__value_;
    self->fOdometerClient.__ptr_.__value_ = 0;
    if (v14)
      (*(void (**)(Client *))(*(_QWORD *)v14 + 8))(v14);
  }
  v15 = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (v15)
  {
    objc_msgSend(*((id *)v15 + 2), "unregister:forNotification:", *((_QWORD *)v15 + 1), 2);
    v16 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v16)
      (*(void (**)(Client *))(*(_QWORD *)v16 + 8))(v16);
  }
  v17 = self->fWifiClient.__ptr_.__value_;
  if (v17)
  {
    objc_msgSend(*((id *)v17 + 2), "unregister:forNotification:", *((_QWORD *)v17 + 1), 3);
    v18 = self->fWifiClient.__ptr_.__value_;
    self->fWifiClient.__ptr_.__value_ = 0;
    if (v18)
      (*(void (**)(Client *))(*(_QWORD *)v18 + 8))(v18);
  }
  v19 = self->fSignalEnvironmentClient.__ptr_.__value_;
  if (v19)
  {
    objc_msgSend(*((id *)v19 + 2), "unregister:forNotification:", *((_QWORD *)v19 + 1), 0);
    v20 = self->fSignalEnvironmentClient.__ptr_.__value_;
    self->fSignalEnvironmentClient.__ptr_.__value_ = 0;
    if (v20)
      (*(void (**)(Client *))(*(_QWORD *)v20 + 8))(v20);
  }
  v21 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  if (v21)
  {
    objc_msgSend(*((id *)v21 + 2), "unregister:forNotification:", *((_QWORD *)v21 + 1), 36);
    v22 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
    if (v22)
      (*(void (**)(Client *))(*(_QWORD *)v22 + 8))(v22);
  }
  v23 = self->fGnssLeechLocationClient.__ptr_.__value_;
  if (v23)
  {
    objc_msgSend(*((id *)v23 + 2), "unregister:forNotification:", *((_QWORD *)v23 + 1), 5);
    v24 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
    self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
    if (v24)
      (*(void (**)(Client *))(*(_QWORD *)v24 + 8))(v24);
  }
}

- (void)registerForUpdates:(id)a3
{
  -[NSMutableSet addObject:](-[CLOutdoorService clients](self, "clients"), "addObject:", a3);
}

- (void)unregisterForUpdates:(id)a3
{
  -[NSMutableSet removeObject:](-[CLOutdoorService clients](self, "clients"), "removeObject:", a3);
}

- (void)pause
{
  if (-[CLOutdoorService manager](self, "manager"))
    sub_100E6107C(-[CLOutdoorService manager](self, "manager"));
}

- (void)resume
{
  if (-[CLOutdoorService manager](self, "manager"))
    sub_100E61214(-[CLOutdoorService manager](self, "manager"));
}

- (void)bringupManager
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (!-[CLOutdoorService manager](self, "manager"))
  {
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v3 = qword_1022A0198;
    if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bringing up manager", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0190 != -1)
        dispatch_once(&qword_1022A0190, &stru_10218CD58);
      v6[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0198, 0, "Bringing up manager", v6, 2);
      v5 = (uint8_t *)v4;
      sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService bringupManager]", "%s\n", v4);
      if (v5 != buf)
        free(v5);
    }
    -[CLOutdoorService setupManager](self, "setupManager");
    -[CLOutdoorService registerForAlgorithmSources](self, "registerForAlgorithmSources");
  }
}

- (void)teardownManager
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (-[CLOutdoorService manager](self, "manager"))
  {
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v3 = qword_1022A0198;
    if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0190 != -1)
        dispatch_once(&qword_1022A0190, &stru_10218CD58);
      v7[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0198, 0, "Tearing down manager", v7, 2);
      v6 = (uint8_t *)v5;
      sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService teardownManager]", "%s\n", v5);
      if (v6 != buf)
        free(v6);
    }
    -[CLOutdoorService unregisterForAlgorithmSources](self, "unregisterForAlgorithmSources");
    v4 = -[CLOutdoorService manager](self, "manager");
    if (v4)
    {
      sub_100E69AA8((uint64_t)v4);
      operator delete();
    }
    -[CLOutdoorService setManager:](self, "setManager:", 0);
  }
}

- (BOOL)shouldRunManager
{
  return !self->fBatterySaverModeEnabled
      && self->fLocationServicesEnabled
      && self->fFitnessTrackingEnabled
      && !self->fBedtimeSleepModeEnabled;
}

- (void)toggleManagerBySettingFlag:(BOOL *)a3 toState:(BOOL)a4
{
  *a3 = a4;
  if (-[CLOutdoorService shouldRunManager](self, "shouldRunManager"))
    -[CLOutdoorService bringupManager](self, "bringupManager");
  else
    -[CLOutdoorService teardownManager](self, "teardownManager");
}

- (void)updateLocationAuthorization
{
  CLClientAuthorizationCacheProtocol *fClientAuthorizationCache;
  _QWORD v3[5];

  fClientAuthorizationCache = self->fClientAuthorizationCache;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100E68980;
  v3[3] = &unk_10218CCC8;
  v3[4] = self;
  -[CLClientAuthorizationCacheProtocol getAuthorizationContextOfNonZonalClient:withReply:](fClientAuthorizationCache, "getAuthorizationContextOfNonZonalClient:withReply:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle"), v3);
}

- (void)onOldMotionCoprocessorData:(const void *)a3
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (-[CLOutdoorService manager](self, "manager"))
    sub_1000D57E4((uint64_t)-[CLOutdoorService manager](self, "manager"), (uint64_t)a3);
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 4)
  {
    if (-[CLOutdoorService manager](self, "manager"))
      sub_100E613A8((uint64_t)-[CLOutdoorService manager](self, "manager"), (__int128 *)a4);
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe", a3, a4, a5, a6, a7), "silo");
  if (*a3 == 2)
  {
    if (-[CLOutdoorService manager](self, "manager"))
      sub_100E61980((uint64_t)-[CLOutdoorService manager](self, "manager"), (uint64_t *)a4);
  }
}

- (void)onSignalEnvironmentNotification:(const int *)a3 data:(const NotificationData *)a4
{
  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (!*a3)
  {
    if (-[CLOutdoorService manager](self, "manager"))
      sub_100E617A8((uint64_t)-[CLOutdoorService manager](self, "manager"), (int *)a4);
  }
}

- (void)onGnssLeechLocationNotification:(const int *)a3 data:(const void *)a4
{
  __int128 v7;
  void *__p[2];
  __int128 v9;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 5 && -[CLOutdoorService manager](self, "manager"))
  {
    *(_OWORD *)__p = 0u;
    v9 = 0u;
    v7 = 0u;
    if (sub_100BE9C08((uint64_t)a4, (uint64_t)&v7))
      sub_100E613B0((uint64_t)-[CLOutdoorService manager](self, "manager"), (uint64_t)&v7);
    if (__p[1])
    {
      *(void **)&v9 = __p[1];
      operator delete(__p[1]);
    }
  }
}

- (void)onBacklightStateNotification:(const int *)a3 data:(const void *)a4
{
  NSObject *v7;
  int v8;
  uint64_t *value;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[4];
  uint8_t buf[4];
  int v15;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 1)
  {
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v7 = qword_1022A0198;
    if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_INFO))
    {
      v8 = *((unsigned __int8 *)a4 + 56);
      *(_DWORD *)buf = 67109120;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AlwaysOn enablement change, isAlwaysOnEnabled, %d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0190 != -1)
        dispatch_once(&qword_1022A0190, &stru_10218CD58);
      v10 = *((unsigned __int8 *)a4 + 56);
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0198, 1, "AlwaysOn enablement change, isAlwaysOnEnabled, %d", v13);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService onBacklightStateNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    value = (uint64_t *)self->fAlsCollector.__ptr_.__value_;
    if (value)
      sub_100883C98(value);
  }
}

- (void)onDaemonStatusNotification:(const int *)a3 data:(const NotificationData *)a4
{
  NSObject *v7;
  int v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint8_t *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  _BOOL4 v19;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3 == 15)
  {
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v7 = qword_1022A0198;
    if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_BYTE *)a4;
      *(_DWORD *)buf = 67109376;
      v17 = v8;
      v18 = 1024;
      v19 = -[CLOutdoorService manager](self, "manager") == 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Low power mode toggled, isBatterySaverModeEnabled, %d, isManagerNil, %d", buf, 0xEu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0190 != -1)
        dispatch_once(&qword_1022A0190, &stru_10218CD58);
      v9 = qword_1022A0198;
      v10 = *(_BYTE *)a4;
      v13[0] = 67109376;
      v13[1] = v10;
      v14 = 1024;
      v15 = -[CLOutdoorService manager](self, "manager") == 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "Low power mode toggled, isBatterySaverModeEnabled, %d, isManagerNil, %d", v13, 14);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService onDaemonStatusNotification:data:]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    -[CLOutdoorService toggleManagerBySettingFlag:toState:](self, "toggleManagerBySettingFlag:toState:", &self->fBatterySaverModeEnabled, *(_BYTE *)a4);
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  objc_msgSend(-[CLOutdoorService universe](self, "universe"), "silo");
  if (*a3)
    v7 = 1;
  else
    v7 = *((_BYTE *)a4 + 3) == 0;
  v8 = !v7;
  if (qword_1022A0190 != -1)
    dispatch_once(&qword_1022A0190, &stru_10218CD58);
  v9 = qword_1022A0198;
  if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received fitness tracking update, enabled %{public}d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v12[0] = 67240192;
    v12[1] = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0198, 0, "Received fitness tracking update, enabled %{public}d", v12, 8);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService onFitnessTrackingNotification:data:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
  -[CLOutdoorService toggleManagerBySettingFlag:toState:](self, "toggleManagerBySettingFlag:toState:", &self->fFitnessTrackingEnabled, v8);
}

- (void)registerForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;

  if (qword_102308C50 != -1)
    dispatch_once(&qword_102308C50, &stru_10218CD78);
  if (qword_102308C58)
  {
    if (off_1022FBE58[0]())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v4 = (const __CFString *)off_1022FBE58[0]();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100E69418, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

- (void)unregisterForHKNanoLifestylePrivacyPreferencesChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v4;

  if (qword_102308C50 != -1)
    dispatch_once(&qword_102308C50, &stru_10218CD78);
  if (qword_102308C58)
  {
    if (off_1022FBE58[0]())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v4 = (const __CFString *)off_1022FBE58[0]();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
    }
  }
}

- (void)onHKPrivacyPreferencesEnableDaylightTime:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[CLOutdoorService manager](self, "manager"))
    sub_100E61BAC((uint64_t)-[CLOutdoorService manager](self, "manager"), v3);
}

- (void)onBiomeUserFocusSleepModeEvent:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  if (qword_1022A0190 != -1)
    dispatch_once(&qword_1022A0190, &stru_10218CD58);
  v5 = qword_1022A0198;
  if (os_log_type_enabled((os_log_t)qword_1022A0198, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v16 = (int)objc_msgSend(a3, "state");
    v17 = 2048;
    v18 = (int)objc_msgSend(a3, "changeReason");
    v19 = 2112;
    v20 = objc_msgSend(a3, "expectedEndDate");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Biome UserFocusSleepMode, state, %ld, changeReason, %ld, expectedEndDate, %@", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0190 != -1)
      dispatch_once(&qword_1022A0190, &stru_10218CD58);
    v6 = qword_1022A0198;
    v9 = 134218498;
    v10 = (int)objc_msgSend(a3, "state");
    v11 = 2048;
    v12 = (int)objc_msgSend(a3, "changeReason");
    v13 = 2112;
    v14 = objc_msgSend(a3, "expectedEndDate");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v6, 2, "Biome UserFocusSleepMode, state, %ld, changeReason, %ld, expectedEndDate, %@", &v9, 32);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLOutdoorService onBiomeUserFocusSleepModeEvent:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  -[CLOutdoorService toggleManagerBySettingFlag:toState:](self, "toggleManagerBySettingFlag:toState:", &self->fBedtimeSleepModeEnabled, objc_msgSend(a3, "state") == 3);
}

- (void)setClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (CLOutdoorManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLOutdoorManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
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
  Client *v12;
  CLServiceLocationProvider *v13;
  Client *v14;
  Dispatcher *v15;
  Dispatcher *v16;

  value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v4 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v4 + 8))(v4, a2);
  v5 = self->fBLSClient.__ptr_.__value_;
  self->fBLSClient.__ptr_.__value_ = 0;
  if (v5)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
  v6 = self->fGnssLeechLocationClient.__ptr_.__value_;
  self->fGnssLeechLocationClient.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v6 + 8))(v6, a2);
  v7 = self->fGnssAvailabilityPredictorClient.__ptr_.__value_;
  self->fGnssAvailabilityPredictorClient.__ptr_.__value_ = 0;
  if (v7)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v7 + 8))(v7, a2);
  v8 = self->fSignalEnvironmentClient.__ptr_.__value_;
  self->fSignalEnvironmentClient.__ptr_.__value_ = 0;
  if (v8)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v8 + 8))(v8, a2);
  v9 = self->fWifiClient.__ptr_.__value_;
  self->fWifiClient.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v9 + 8))(v9, a2);
  v10 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v10 + 8))(v10, a2);
  v11 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v11)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v11 + 8))(v11, a2);
  v12 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0;
  if (v12)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v12 + 8))(v12, a2);
  v13 = self->fServiceLocationProvider.__ptr_.__value_;
  self->fServiceLocationProvider.__ptr_.__value_ = 0;
  if (v13)
    (*(void (**)(CLServiceLocationProvider *, SEL))(*(_QWORD *)v13 + 8))(v13, a2);
  v14 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v14)
    (*(void (**)(Client *, SEL))(*(_QWORD *)v14 + 8))(v14, a2);
  sub_100E67820((uint64_t **)&self->fAlsCollector, 0);
  v15 = self->fOldMotionCoprocessorDispatcher.__ptr_.__value_;
  self->fOldMotionCoprocessorDispatcher.__ptr_.__value_ = 0;
  if (v15)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v15 + 8))(v15);
  v16 = self->fMotionStateCoprocessorDispatcher.__ptr_.__value_;
  self->fMotionStateCoprocessorDispatcher.__ptr_.__value_ = 0;
  if (v16)
    (*(void (**)(Dispatcher *))(*(_QWORD *)v16 + 8))(v16);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end

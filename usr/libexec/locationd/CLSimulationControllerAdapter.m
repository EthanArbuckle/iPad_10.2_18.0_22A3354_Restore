@implementation CLSimulationControllerAdapter

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
  if (qword_1023072A8 != -1)
    dispatch_once(&qword_1023072A8, &stru_1021798D8);
  return (id)qword_1023072A0;
}

- (CLSimulationControllerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSimulationControllerAdapter;
  return -[CLSimulationControllerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLSimulationControllerProtocol, &OBJC_PROTOCOL___CLSimulationControllerClientProtocol);
}

- (void)beginService
{
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v2 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    v4 = 2082;
    v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Beginning Simulation Service\"}", (uint8_t *)v3, 0x12u);
  }
  operator new();
}

- (void)endService
{
  void *controller;

  controller = self->_controller;
  if (controller)
  {
    sub_100BFFA1C((uint64_t)controller);
    operator delete();
  }
}

- (void)isInEmegencyState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;

  v3 = a3;
  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v5 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side update for isInEmegency\", \"isEmergencyState\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  sub_100BFD218((uint64_t)self->_controller, v3);
}

- (void)stopLocationSimulation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v3 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side request to stop location simulation\"}", (uint8_t *)v4, 0x12u);
  }
  sub_100BFD340((uint64_t)self->_controller);
}

- (void)startLocationSimulation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v3 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side request to start location simulation\"}", (uint8_t *)v4, 0x12u);
  }
  sub_100BFD534((uint64_t)self->_controller);
}

- (void)setSimulationScenario:(id)a3
{
  sub_100BFD66C((uint64_t)self->_controller, a3);
}

- (void)appendSimulatedLocations:(id)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *controller;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  uint64_t v22;
  uint8_t buf[32];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];
  _BYTE v31[128];

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v5 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(_QWORD *)&buf[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reveived daemon-side request to append simulated location\"}", buf, 0x12u);
  }
  v21[0] = v21;
  v21[1] = v21;
  v22 = 0;
  if (a3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (v9)
          {
            objc_msgSend(v9, "clientLocation");
          }
          else
          {
            v29 = 0u;
            memset(v30, 0, 28);
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v24 = 0u;
            memset(buf, 0, sizeof(buf));
          }
          v10 = operator new(0xB0uLL);
          v11 = v29;
          v10[7] = v28;
          v10[8] = v11;
          v10[9] = v30[0];
          *(_OWORD *)((char *)v10 + 156) = *(_OWORD *)((char *)v30 + 12);
          v12 = v25;
          v10[3] = v24;
          v10[4] = v12;
          v13 = v27;
          v10[5] = v26;
          v10[6] = v13;
          v14 = *(_OWORD *)&buf[16];
          v10[1] = *(_OWORD *)buf;
          v10[2] = v14;
          v15 = v21[0];
          *(_QWORD *)v10 = v21[0];
          *((_QWORD *)v10 + 1) = v21;
          *(_QWORD *)(v15 + 8) = v10;
          v21[0] = v10;
          ++v22;
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
      }
      while (v6);
    }
  }
  controller = (uint64_t *)self->_controller;
  sub_100C01200((uint64_t)controller);
  sub_100C00D74(controller, (uint64_t)v21);
  sub_1000F34E0(v21);
}

- (void)clearSimulatedLocations
{
  sub_100C00B08((uint64_t)self->_controller, 1);
}

- (void)setLocationDeliveryBehavior:(unsigned __int8)a3
{
  sub_100BFD93C((unsigned __int8 *)self->_controller, a3);
}

- (void)setLocationRepeatBehavior:(unsigned __int8)a3
{
  sub_100BFDA5C((uint64_t)self->_controller, a3);
}

- (void)setIntermediateLocationDistance:(double)a3
{
  double v3;

  v3 = a3;
  sub_100BFDB84((uint64_t)self->_controller, &v3);
}

- (void)setLocationInterval:(double)a3
{
  double v3;

  v3 = a3;
  sub_100BFDCB0((uint64_t)self->_controller, &v3);
}

- (void)setLocationTravellingSpeed:(double)a3
{
  double v3;

  v3 = a3;
  sub_100BFDDDC((uint64_t)self->_controller, &v3);
}

- (void)simulateVisit:(id)a3
{
  sub_100BFDEEC((id *)self->_controller, (uint64_t)a3);
}

- (void)simulateSignificantLocationChange:(id)a3
{
  sub_100BFE000((id *)self->_controller, a3);
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
  sub_100BFE12C((id *)self->_controller, a3, (uint64_t)a4);
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
  sub_100BFE29C((id *)self->_controller, a3, a4, a5, (uint64_t)a6);
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
  sub_100BFE408((id *)self->_controller, a3, a4, a5, a6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSXPCInterface *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;

  if (qword_1022A0240 != -1)
    dispatch_once(&qword_1022A0240, &stru_102179920);
  v6 = qword_1022A0248;
  if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Should accept incoming connection?\"}", buf, 0x12u);
  }
  v7 = objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.locationd.simulation"));
  if (v7
    && (v9 = v7, v10 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    -[CLSimulationControllerAdapter setConnection:](self, "setConnection:", a4);
    v11 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLSimulationXPCServerInterface);
    v13 = objc_opt_class(NSArray, v12);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(CLLocation, v14), 0), "appendSimulatedLocations:", 0, 0);
    objc_msgSend(a4, "_setQueue:", objc_msgSend(-[CLSimulationControllerAdapter silo](self, "silo"), "queue"));
    objc_msgSend(a4, "setExportedInterface:", v11);
    objc_msgSend(a4, "setExportedObject:", self);
    objc_msgSend(a4, "resume");
    LOBYTE(v15) = 1;
  }
  else
  {
    if (qword_1022A0240 != -1)
      dispatch_once(&qword_1022A0240, &stru_102179920);
    v16 = qword_1022A0248;
    if (os_log_type_enabled((os_log_t)qword_1022A0248, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"unentitled client attempting to simulate location\"}", buf, 0x12u);
      if (qword_1022A0240 != -1)
        dispatch_once(&qword_1022A0240, &stru_102179920);
    }
    v17 = qword_1022A0248;
    v15 = os_signpost_enabled((os_log_t)qword_1022A0248);
    if (v15)
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "unentitled client attempting to simulate location", "{\"msg%{public}.0s\":\"unentitled client attempting to simulate location\"}", buf, 0x12u);
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)controller
{
  return self->_controller;
}

- (void)setController:(void *)a3
{
  self->_controller = a3;
}

@end

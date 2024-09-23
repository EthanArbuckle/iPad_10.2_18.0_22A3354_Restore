@implementation CLCompanionTransport

- (CLCompanionTransport)initWithSilo:(id)a3 iDSService:(id)a4
{
  uint64_t v6;
  CLCompanionTransport *v7;
  NSObject *v8;
  CLCompanionBluetoothServiceProtocol *v9;
  NSObject *v10;
  const char *v12;
  uint8_t *v13;
  const char *v14;
  uint8_t *v15;
  _QWORD v16[5];
  objc_super v17;
  _WORD v18[8];
  uint8_t buf[1640];

  -[CLCompanionTransport setIdsService:](self, "setIdsService:", a4);
  if (objc_opt_class(IDSService, v6))
  {
    v17.receiver = self;
    v17.super_class = (Class)CLCompanionTransport;
    v7 = -[CLCompanionTransport init](&v17, "init");
    if (v7)
    {
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_102173720);
      v8 = qword_10229FC78;
      if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Creating CLCompanionTransport", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FC70 != -1)
          dispatch_once(&qword_10229FC70, &stru_102173720);
        v18[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 1, "Creating CLCompanionTransport", v18, 2);
        v13 = (uint8_t *)v12;
        sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v12);
        if (v13 != buf)
          free(v13);
      }
      -[IDSService addDelegate:queue:](v7->_idsService, "addDelegate:queue:", v7, objc_msgSend(a3, "queue"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100B46D98;
      v16[3] = &unk_10212BB58;
      v16[4] = v7;
      objc_msgSend(a3, "async:", v16);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCyclingSubscribe:service:account:fromID:context:", 0);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCyclingUnsubscribe:service:account:fromID:context:", 1);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCyclingData:service:account:fromID:context:", 2);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerElevationSubscribe:service:account:fromID:context:", 4);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerElevationUnsubscribe:service:account:fromID:context:", 5);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerElevationData:service:account:fromID:context:", 6);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleStrideCalDataSubscribe:service:account:fromID:context:", 7);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleStrideCalDataUnsubscribe:service:account:fromID:context:", 8);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCoarseElevationSubscribe:service:account:fromID:context:", 11);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCoarseElevationUnsubscribe:service:account:fromID:context:", 12);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleOdometerCoarseElevationData:service:account:fromID:context:", 13);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMotionCalsUpdate:service:account:fromID:context:", 14);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMotionStateUpdate:service:account:fromID:context:", 18);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleRemoteAppLaunch:service:account:fromID:context:", 19);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleCompanionPingData:service:account:fromID:context:", 15);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleAbsoluteAltitudeUpdate:service:account:fromID:context:", 20);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleAbsoluteAltitudeSubscribe:service:account:fromID:context:", 22);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleCompanionPingDataForAbsoluteAltitude:service:account:fromID:context:", 23);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleFilteredPressure:service:account:fromID:context:", 36);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handlePredictedWalkDistanceBout:service:account:fromID:context:", 21);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleKappaCollect:service:account:fromID:context:", 24);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleKappaStop:service:account:fromID:context:", 25);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMartyCollect:service:account:fromID:context:", 26);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMartyStop:service:account:fromID:context:", 27);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMartyBicycleCollect:service:account:fromID:context:", 28);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMartyBicycleStop:service:account:fromID:context:", 29);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleSafetyCompanionHeartbeat:service:account:fromID:context:", 30);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleVO2MaxCloudKitDailyStats:service:account:fromID:context:", 31);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleContextConfigurationUpdate:service:account:fromID:context:", 32);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleCardioChangeUpdate:service:account:fromID:context:", 33);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleColdStorageDataUpdate:service:account:fromID:context:", 34);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleMobilityUpdate:service:account:fromID:context:", 35);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](v7->_idsService, "setProtobufAction:forIncomingRequestsOfType:", "handleWorkoutDistanceAnalytics:service:account:fromID:context:", 37);
      v9 = (CLCompanionBluetoothServiceProtocol *)-[CLServiceVendor proxyForService:](+[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance"), "proxyForService:", CFSTR("CLCompanionBluetoothService"));
      v7->_bluetoothCompanionServiceProxy = v9;
      v7->_valid = 1;
      -[CLCompanionBluetoothServiceProtocol registerDelegate:inSilo:](v9, "registerDelegate:inSilo:", v7, a3);
      -[CLCompanionBluetoothServiceProtocol setDelegateEntityName:](v7->_bluetoothCompanionServiceProxy, "setDelegateEntityName:", "CLCompanionTransport");
      -[CLCompanionBluetoothServiceProtocol registerForRSSIUpdatesForClient:](v7->_bluetoothCompanionServiceProxy, "registerForRSSIUpdatesForClient:", v7);
    }
  }
  else
  {
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_102173720);
    v10 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "IDSService CLCompanionTransport is nil!", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_102173720);
      v18[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FC78, 2, "IDSService CLCompanionTransport is nil!", v18, 2);
      v15 = (uint8_t *)v14;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v14);
      if (v15 != buf)
        free(v15);
    }
    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CLCompanionBluetoothServiceProtocol unregisterForRSSIUpdatesForClient:](self->_bluetoothCompanionServiceProxy, "unregisterForRSSIUpdatesForClient:", self);

  v3.receiver = self;
  v3.super_class = (Class)CLCompanionTransport;
  -[CLCompanionTransport dealloc](&v3, "dealloc");
}

- (void)updateIDSStatus
{
  id v3;
  id v4;
  uint64_t v5;
  __objc2_class *v6;
  __objc2_class *v7;
  void *i;
  void *v9;
  NSObject *superclass;
  id v11;
  __objc2_class *v12;
  unsigned int v13;
  __objc2_class *v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  id v18;
  __objc2_class *v19;
  id v20;
  const char *v21;
  uint8_t *v22;
  CLCompanionTransport *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  id v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  unsigned int v40;
  _BYTE v41[128];

  -[CLCompanionTransport setIsConnected:](self, "setIsConnected:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = self;
  obj = -[IDSService devices](-[CLCompanionTransport idsService](self, "idsService"), "devices");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v6 = DefaultObserver;
    v7 = DefaultObserver;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (v6[94].isa != (__objc2_class *)-1)
          dispatch_once(&qword_10229FEB0, &stru_102173740);
        superclass = v7[94].superclass;
        if (os_log_type_enabled(superclass, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(objc_msgSend(v9, "name"), "UTF8String");
          v12 = v7;
          v13 = objc_msgSend(v9, "isNearby");
          v14 = v6;
          v15 = objc_msgSend(v9, "isDefaultPairedDevice");
          v16 = objc_msgSend(v9, "isConnected");
          *(_DWORD *)buf = 68290051;
          *(_DWORD *)v32 = 0;
          *(_WORD *)&v32[4] = 2082;
          *(_QWORD *)&v32[6] = "";
          v33 = 2081;
          v34 = v11;
          v35 = 1026;
          v36 = v13;
          v7 = v12;
          v37 = 1026;
          v38 = v15;
          v6 = v14;
          v39 = 1026;
          v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, superclass, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updateIDSStatus:\", \"name\":%{private, location:escape_only}s, \"isNearby\":%{public}hhd, \"isDefaultPairedDevice\":%{public}hhd, \"isConnected\":%{public}hhd}", buf, 0x2Eu);
        }
        if (objc_msgSend(v9, "isDefaultPairedDevice") && objc_msgSend(v9, "isNearby"))
        {
          -[CLCompanionTransport setIsConnected:](v23, "setIsConnected:", 1);
          -[CLCompanionTransport setPairedDevice:](v23, "setPairedDevice:", v9);
          if (v6[94].isa != (__objc2_class *)-1)
            dispatch_once(&qword_10229FEB0, &stru_102173740);
          v17 = v7[94].superclass;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v18 = objc_msgSend(-[IDSDevice modelIdentifier](-[CLCompanionTransport pairedDevice](v23, "pairedDevice"), "modelIdentifier"), "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v32 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Fitness: Companion model is %s", buf, 0xCu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v6[94].isa != (__objc2_class *)-1)
              dispatch_once(&qword_10229FEB0, &stru_102173740);
            v19 = v7[94].superclass;
            v20 = objc_msgSend(-[IDSDevice modelIdentifier](-[CLCompanionTransport pairedDevice](v23, "pairedDevice"), "modelIdentifier"), "UTF8String");
            v29 = 136315138;
            v30 = v20;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 2, "Fitness: Companion model is %s", (const char *)&v29);
            v22 = (uint8_t *)v21;
            sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport updateIDSStatus]", "%s\n", v21);
            if (v22 != buf)
              free(v22);
          }
          return;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      if (v4)
        continue;
      break;
    }
  }
}

- (void)updateIDSStatusAndNotify
{
  unsigned int v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  void (**v7)(id, BOOL);
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;

  v3 = -[CLCompanionTransport isConnected](self, "isConnected");
  -[CLCompanionTransport updateIDSStatus](self, "updateIDSStatus");
  if (v3 != -[CLCompanionTransport isConnected](self, "isConnected"))
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v4 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v5 = "true";
      else
        v5 = "false";
      if (-[CLCompanionTransport isConnected](self, "isConnected"))
        v6 = "true";
      else
        v6 = "false";
      *(_DWORD *)buf = 136315394;
      v18 = v5;
      v19 = 2080;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prevConnectedState,%s,currConnectedState,%s", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102173740);
      v8 = qword_10229FEB8;
      if (v3)
        v9 = "true";
      else
        v9 = "false";
      if (-[CLCompanionTransport isConnected](self, "isConnected"))
        v10 = "true";
      else
        v10 = "false";
      v13 = 136315394;
      v14 = v9;
      v15 = 2080;
      v16 = v10;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "prevConnectedState,%s,currConnectedState,%s", (const char *)&v13, 22);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport updateIDSStatusAndNotify]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
    if (!-[CLCompanionTransport isConnected](self, "isConnected"))
      -[CLCompanionTransport setPairedDeviceLastSeenTimestamp:](self, "setPairedDeviceLastSeenTimestamp:", CFAbsoluteTimeGetCurrent());
    if (-[CLCompanionTransport connectionUpdateHandler](self, "connectionUpdateHandler"))
    {
      v7 = -[CLCompanionTransport connectionUpdateHandler](self, "connectionUpdateHandler");
      v7[2](v7, -[CLCompanionTransport isConnected](self, "isConnected"));
    }
  }
}

- (void)sendMessage:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 fireAndForget:(BOOL)a6 encrypt:(BOOL)a7 bypassConnectionCheck:(BOOL)a8 timeout:(double)a9 nonWaking:(BOOL)a10 completionHandler:(id)a11
{
  _BOOL4 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  uint64_t v16;
  NSObject *v19;
  uint64_t v20;
  id v21;
  _UNKNOWN **v22;
  NSDictionary *v23;
  IDSService *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSNumber *v31;
  const char *v32;
  uint8_t *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  const char *v39;
  uint8_t *v40;
  uint64_t v41;
  unsigned int v42;
  id v43;
  uint64_t v44;
  const char *v45[3];
  _QWORD v46[3];
  int v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  id v66;
  _QWORD v67[5];
  _QWORD v68[5];

  v12 = a8;
  v13 = a7;
  v14 = a6;
  v16 = a4;
  -[CLCompanionTransport updateIDSStatusAndNotify](self, "updateIDSStatusAndNotify");
  if (-[CLCompanionTransport isConnected](self, "isConnected") || v12)
  {
    v20 = a10;
    v43 = 0;
    v44 = 0;
    v21 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", a3, v16, 0);
    v67[0] = IDSSendMessageOptionTimeoutKey;
    v68[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a9);
    v68[1] = &__kCFBooleanTrue;
    v67[1] = IDSSendMessageOptionLocalDeliveryKey;
    v67[2] = IDSSendMessageOptionFireAndForgetKey;
    v68[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14);
    v67[3] = IDSSendMessageOptionEncryptPayloadKey;
    v68[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13);
    v67[4] = IDSSendMessageOptionNonWakingKey;
    v68[4] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a10);
    v22 = CLPContext_ptr;
    v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 5);
    v24 = -[CLCompanionTransport idsService](self, "idsService");
    v25 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](v24, "sendProtobuf:toDestinations:priority:options:identifier:error:", v21, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), a5, v23, &v43, &v44);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v26 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      v27 = v25;
      v28 = objc_msgSend(v43, "UTF8String");
      v29 = objc_msgSend(objc_msgSend(v21, "data"), "length");
      v30 = objc_msgSend(+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3), "UTF8String");
      *(_DWORD *)buf = 136316162;
      v58 = v28;
      v25 = v27;
      v59 = 2048;
      v60 = v29;
      v22 = CLPContext_ptr;
      v61 = 1024;
      v62 = v16;
      v63 = 1024;
      v64 = (int)v27;
      v65 = 2080;
      v66 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Sending protobuf ID:%s size: %lu type: %d over IDSService - Status %d, md5 %s", buf, 0x2Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      HIDWORD(v41) = a10;
      v34 = v25;
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102173740);
      v35 = qword_10229FEB8;
      v36 = objc_msgSend(v43, "UTF8String");
      v37 = objc_msgSend(objc_msgSend(v21, "data"), "length");
      v38 = objc_msgSend(+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3), "UTF8String");
      v47 = 136316162;
      v48 = v36;
      v49 = 2048;
      v50 = v37;
      v51 = 1024;
      v52 = v16;
      v53 = 1024;
      v25 = v34;
      v54 = (int)v34;
      v55 = 2080;
      v56 = v38;
      LODWORD(v41) = 44;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v35, 2, "Sending protobuf ID:%s size: %lu type: %d over IDSService - Status %d, md5 %s", (const char *)&v47, v41, (_DWORD)v43, v44, v45[0]);
      v40 = (uint8_t *)v39;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:completionHandler:]", "%s\n", v39);
      if (v40 != buf)
        free(v40);
      v20 = v42;
      v22 = CLPContext_ptr;
    }
    if ((_DWORD)v16 != 20)
    {
      v45[0] = CFSTR("type");
      v46[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v16);
      v45[1] = CFSTR("nonWaking");
      v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20);
      v45[2] = CFSTR("action");
      v46[1] = v31;
      v46[2] = &off_10221BC18;
      sub_10019E128((uint64_t)objc_msgSend(v22[210], "dictionaryWithObjects:forKeys:count:", v46, v45, 3), (uint64_t)"MotionPacket");
    }

    if (a11)
      (*((void (**)(id, id, uint64_t))a11 + 2))(a11, v25, v44);
  }
  else
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v19 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No device locally connected - Ignore sending data", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102173740);
      LOWORD(v47) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "No device locally connected - Ignore sending data", &v47, 2);
      v33 = (uint8_t *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:completionHandler:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
    if (a11)
      (*((void (**)(id, _QWORD, _QWORD))a11 + 2))(a11, 0, 0);
  }
}

- (void)receivedMessage:(unsigned __int16)a3 data:(id)a4 identifierString:(id)a5
{
  uint64_t v7;
  NSObject *v9;
  NSObject *v10;
  void (**v11)(id, _QWORD, id);
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  const char *v15;
  uint8_t *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];
  int v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v7 = a3;
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v9 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v30 = objc_msgSend(a5, "UTF8String");
    v31 = 1024;
    v32 = v7;
    v33 = 2048;
    v34 = objc_msgSend(a4, "length");
    v35 = 2080;
    v36 = objc_msgSend(+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received message ID:%s, type:%d, size %lu, md5 %s", buf, 0x26u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v12 = qword_10229FEB8;
    v21 = 136315906;
    v22 = objc_msgSend(a5, "UTF8String");
    v23 = 1024;
    v24 = v7;
    v25 = 2048;
    v26 = objc_msgSend(a4, "length");
    v27 = 2080;
    v28 = objc_msgSend(+[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "Received message ID:%s, type:%d, size %lu, md5 %s", (const char *)&v21, 38, v18, (const char *)v19);
    v14 = (uint8_t *)v13;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport receivedMessage:data:identifierString:]", "%s\n", v13);
    if (v14 != buf)
      free(v14);
  }
  if ((_DWORD)v7 != 20)
  {
    v18 = CFSTR("type");
    v19 = CFSTR("action");
    v20[0] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v7);
    v20[1] = &off_10221BC30;
    sub_10019E128((uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, &v18, 2), (uint64_t)"MotionPacket");
  }
  if (!-[CLCompanionTransport isConnected](self, "isConnected"))
  {
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v10 = qword_10229FEB8;
    if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unexpected message received while disconnected. Updating status.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FEB0 != -1)
        dispatch_once(&qword_10229FEB0, &stru_102173740);
      LOWORD(v21) = 0;
      LODWORD(v17) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FEB8, 2, "Unexpected message received while disconnected. Updating status.", &v21, v17);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport receivedMessage:data:identifierString:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    -[CLCompanionTransport updateIDSStatusAndNotify](self, "updateIDSStatusAndNotify");
  }
  if (-[CLCompanionTransport receivedMessageHandler](self, "receivedMessageHandler"))
  {
    v11 = -[CLCompanionTransport receivedMessageHandler](self, "receivedMessageHandler");
    v11[2](v11, v7, a4);
  }
}

- (void)handleKappaCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 24, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleKappaStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 25, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleMartyCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 26, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleMartyStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 27, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleMartyBicycleCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 28, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleMartyBicycleStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 29, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleSafetyCompanionHeartbeat:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 30, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleOdometerCyclingSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 0, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerCyclingUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 1, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerCyclingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 2, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleOdometerElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 4, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 5, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 6, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleStrideCalDataSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 7, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleStrideCalDataUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 8, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerCoarseElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 11, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerCoarseElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 12, 0, objc_msgSend(a7, "outgoingResponseIdentifier", a3, a4, a5, a6));
}

- (void)handleOdometerCoarseElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 13, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleMotionCalsUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 14, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleCompanionPingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 15, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleMotionStateUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 18, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleRemoteAppLaunch:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 19, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleAbsoluteAltitudeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 20, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleAbsoluteAltitudeSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 22, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleFilteredPressure:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 36, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handlePredictedWalkDistanceBout:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 21, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleCompanionPingDataForAbsoluteAltitude:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 23, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleVO2MaxCloudKitDailyStats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 31, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleContextConfigurationUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 32, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleCardioChangeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 33, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  id v13;
  uint8_t buf[4];
  id v15;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v8 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(a5, "length");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Received data over IDSService size : %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v9 = qword_10229FEB8;
    v12 = 134217984;
    v13 = objc_msgSend(a5, "length");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 2, "Received data over IDSService size : %ld", &v12);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:incomingData:fromID:context:]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint8_t *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v9 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = objc_msgSend(objc_msgSend(a7, "outgoingResponseIdentifier"), "UTF8String");
    v19 = 2048;
    v20 = objc_msgSend(objc_msgSend(a5, "data"), "length");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received unhandled protobuf ID:%s, size:%lu", buf, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v10 = qword_10229FEB8;
    v13 = 136315394;
    v14 = objc_msgSend(objc_msgSend(a7, "outgoingResponseIdentifier"), "UTF8String");
    v15 = 2048;
    v16 = objc_msgSend(objc_msgSend(a5, "data"), "length");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v10, 2, "Received unhandled protobuf ID:%s, size:%lu", (const char *)&v13, 22);
    v12 = (uint8_t *)v11;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:incomingUnhandledProtobuf:fromID:context:]", "%s\n", v11);
    if (v12 != buf)
      free(v12);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;

  v8 = a6;
  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v10 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v21 = objc_msgSend(a5, "UTF8String");
    v22 = 1024;
    v23 = v8;
    v24 = 2080;
    v25 = objc_msgSend(objc_msgSend(a7, "localizedDescription"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Service sent data with ID:%s with success %d error %s", buf, 0x1Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v11 = qword_10229FEB8;
    v14 = 136315650;
    v15 = objc_msgSend(a5, "UTF8String");
    v16 = 1024;
    v17 = v8;
    v18 = 2080;
    v19 = objc_msgSend(objc_msgSend(a7, "localizedDescription"), "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 2, "Service sent data with ID:%s with success %d error %s", (const char *)&v14, 28);
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:identifier:didSendWithSuccess:error:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v7 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = objc_msgSend(a5, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Service data ack on otherside with ID:%s", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v8 = qword_10229FEB8;
    v11 = 136315138;
    v12 = objc_msgSend(a5, "UTF8String");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 2, "Service data ack on otherside with ID:%s", (const char *)&v11);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport service:account:identifier:hasBeenDeliveredWithContext:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
}

- (void)handleColdStorageDataUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 34, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleMobilityUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 35, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

- (void)handleWorkoutDistanceAnalytics:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[CLCompanionTransport receivedMessage:data:identifierString:](self, "receivedMessage:data:identifierString:", 37, objc_msgSend(a3, "data"), objc_msgSend(a7, "outgoingResponseIdentifier"));
}

+ (id)computeMD5:(id)a3
{
  NSMutableString *v3;
  uint64_t i;
  unsigned __int8 md[16];

  CC_MD5(objc_msgSend(a3, "bytes"), (CC_LONG)objc_msgSend(a3, "length"), md);
  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 32);
  for (i = 0; i != 16; ++i)
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%02x"), md[i]);
  return v3;
}

- (void)didUpdateRSSI:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  _DWORD v8[4];
  uint8_t buf[4];
  unsigned int v10;

  if (qword_10229FEB0 != -1)
    dispatch_once(&qword_10229FEB0, &stru_102173740);
  v4 = qword_10229FEB8;
  if (os_log_type_enabled((os_log_t)qword_10229FEB8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(a3, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[CLCompanionBluetoothService] CLCompanionTransport got bt rssi %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FEB0 != -1)
      dispatch_once(&qword_10229FEB0, &stru_102173740);
    v5 = qword_10229FEB8;
    v8[0] = 67109120;
    v8[1] = objc_msgSend(a3, "intValue");
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v5, 2, "[CLCompanionBluetoothService] CLCompanionTransport got bt rssi %d", v8);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLCompanionTransport didUpdateRSSI:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (IDSDevice)pairedDevice
{
  return (IDSDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPairedDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)pairedDeviceLastSeenTimestamp
{
  return self->_pairedDeviceLastSeenTimestamp;
}

- (void)setPairedDeviceLastSeenTimestamp:(double)a3
{
  self->_pairedDeviceLastSeenTimestamp = a3;
}

- (id)receivedMessageHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setReceivedMessageHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)connectionUpdateHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setConnectionUpdateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end

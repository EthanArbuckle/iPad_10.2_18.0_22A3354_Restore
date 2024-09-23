@implementation CLRemoteMotionAlarm

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
  if (qword_102308198 != -1)
    dispatch_once(&qword_102308198, &stru_102184100);
  return (id)qword_102308190;
}

+ (BOOL)isSupported
{
  if (qword_1023081A8 != -1)
    dispatch_once(&qword_1023081A8, &stru_102184120);
  return byte_1023081A0;
}

- (CLRemoteMotionAlarm)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLRemoteMotionAlarm;
  return -[CLRemoteMotionAlarm initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLRemoteMotionAlarmServiceProtocol, &OBJC_PROTOCOL___CLRemoteMotionAlarmClientProtocol);
}

- (void)beginService
{
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo");
  -[CLRemoteMotionAlarm setStreamingConnection:](self, "setStreamingConnection:", objc_msgSend(objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "vendor"), "proxyForService:forClient:", CFSTR("CLLocationStreamingConnectionManager"), CFSTR("CLRemoteMotionAlarm")));
  -[CLLocationStreamingConnectionManagerServiceProtocol addClient:](-[CLRemoteMotionAlarm streamingConnection](self, "streamingConnection"), "addClient:", self);
  -[CLRemoteMotionAlarm setMotionAlarmClients:](self, "setMotionAlarmClients:", +[NSMutableSet set](NSMutableSet, "set"));
  -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0);
  -[CLRemoteMotionAlarm setResendTimer:](self, "setResendTimer:", objc_msgSend(objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo"), "newTimer"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D8BBF8;
  v4[3] = &unk_10212BB58;
  v4[4] = self;
  -[CLTimer setHandler:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setHandler:", v4);
  -[CLRemoteMotionAlarm setRevertToUnknownTimer:](self, "setRevertToUnknownTimer:", objc_msgSend(objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo"), "newTimer"));
  -[CLTimer setHandler:](-[CLRemoteMotionAlarm revertToUnknownTimer](self, "revertToUnknownTimer", _NSConcreteStackBlock, 3221225472, sub_100D8BCD8, &unk_10212BB58, self), "setHandler:", &v3);
}

- (void)endService
{
  objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo");
  -[CLLocationStreamingConnectionManagerServiceProtocol retireClient:](-[CLRemoteMotionAlarm streamingConnection](self, "streamingConnection"), "retireClient:", self);
  -[CLRemoteMotionAlarm setStreamingConnection:](self, "setStreamingConnection:", 0);
  -[CLRemoteMotionAlarm setMotionAlarmClients:](self, "setMotionAlarmClients:", 0);
  -[CLRemoteMotionAlarm setResendTimer:](self, "setResendTimer:", 0);
  -[CLRemoteMotionAlarm setRevertToUnknownTimer:](self, "setRevertToUnknownTimer:", 0);
}

- (void)setLastKnownMotionState:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t buf;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  if (self->_lastKnownMotionState != a3)
  {
    v3 = *(_QWORD *)&a3;
    self->_lastKnownMotionState = a3;
    if (qword_1022A01E0 != -1)
      dispatch_once(&qword_1022A01E0, &stru_102184140);
    v5 = qword_1022A01E8;
    if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
    {
      buf = 68289282;
      v17 = 2082;
      v18 = "";
      v19 = 2050;
      v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Notifying motion alarm\", \"state\":%{public, location:CLLocationProvider_Type::MotionDetected}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients", 0);
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "remoteDeviceMotionUpdate:atTime:", v3, CFAbsoluteTimeGetCurrent());
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)evaluateMotionAlarmState
{
  double v3;
  NSObject *v4;
  double v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;

  if (-[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count"))
  {
    -[CLTimer nextFireDelay](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "nextFireDelay");
    if (v3 == 1.79769313e308)
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102184140);
      v4 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
      {
        v7 = 68289026;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"enabling motion alarm\"}", (uint8_t *)&v7, 0x12u);
      }
      -[CLTimer setFireInterval:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setFireInterval:", 30.0);
      -[CLTimer setNextFireDelay:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setNextFireDelay:", 30.0);
LABEL_15:
      -[CLRemoteMotionAlarm sendMotionAlarmRequest](self, "sendMotionAlarmRequest");
      return;
    }
  }
  if (!-[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count"))
  {
    -[CLTimer nextFireDelay](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "nextFireDelay");
    if (v5 != 1.79769313e308)
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102184140);
      v6 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_INFO))
      {
        v7 = 68289026;
        v8 = 0;
        v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"disabling motion alarm\"}", (uint8_t *)&v7, 0x12u);
      }
      -[CLTimer setNextFireDelay:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setNextFireDelay:", 1.79769313e308);
      -[CLTimer setFireInterval:](-[CLRemoteMotionAlarm resendTimer](self, "resendTimer"), "setFireInterval:", 1.79769313e308);
      -[CLTimer setNextFireDelay:](-[CLRemoteMotionAlarm revertToUnknownTimer](self, "revertToUnknownTimer"), "setNextFireDelay:", 1.79769313e308);
      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0);
      goto LABEL_15;
    }
  }
}

- (void)delayRevertToUnknownTimer
{
  -[CLTimer setNextFireDelay:](-[CLRemoteMotionAlarm revertToUnknownTimer](self, "revertToUnknownTimer"), "setNextFireDelay:", 60.0);
}

- (void)sendMotionAlarmRequest
{
  CLLocationStreamingMessage *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  const __CFString *v6;
  NSNumber *v7;

  v3 = objc_alloc_init(CLLocationStreamingMessage);
  -[CLLocationStreamingMessage setMessageType:](v3, "setMessageType:", CFSTR("kCLLocationStreamingMessageTypeSetMotionAlarm"));
  v6 = CFSTR("kCLLocationStreamingMessageMotionAlarmStateKey");
  v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSMutableSet count](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "count") != 0);
  -[CLLocationStreamingMessage setPayload:](v3, "setPayload:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[CLLocationStreamingMessage setPriority:](v3, "setPriority:", 300);
  v4[0] = IDSSendMessageOptionTimeoutKey;
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 30.0);
  v5[1] = &__kCFBooleanTrue;
  v4[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v4[2] = IDSSendMessageOptionEncryptPayloadKey;
  v5[2] = &__kCFBooleanTrue;
  v5[3] = &__kCFBooleanTrue;
  v4[3] = IDSSendMessageOptionRequireBluetoothKey;
  v4[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v5[4] = CFSTR("kCLLocationStreamingMessageTypeSetMotionAlarm");
  -[CLLocationStreamingMessage setIdsOptions:](v3, "setIdsOptions:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 5));
  -[CLLocationStreamingMessage setProtocolVersion:](v3, "setProtocolVersion:", 0);
  -[CLLocationStreamingConnectionManagerServiceProtocol sendMessage:](-[CLRemoteMotionAlarm streamingConnection](self, "streamingConnection"), "sendMessage:", v3);
}

- (void)registerClientForRemoteMotionAlarm:(id)a3
{
  if ((-[NSMutableSet containsObject:](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableSet addObject:](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "addObject:", a3);
    -[CLRemoteMotionAlarm evaluateMotionAlarmState](self, "evaluateMotionAlarmState");
    objc_msgSend(a3, "remoteDeviceMotionUpdate:atTime:", -[CLRemoteMotionAlarm lastKnownMotionState](self, "lastKnownMotionState"), CFAbsoluteTimeGetCurrent());
  }
}

- (void)unregisterClientForRemoteMotionAlarm:(id)a3
{
  -[NSMutableSet removeObject:](-[CLRemoteMotionAlarm motionAlarmClients](self, "motionAlarmClients"), "removeObject:", a3);
  -[CLRemoteMotionAlarm evaluateMotionAlarmState](self, "evaluateMotionAlarmState");
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;

  if (objc_msgSend(a3, "isEqual:", CFSTR("kCLLocationStreamingMessageTypeMotionAlarmUpdate")))
  {
    v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCLLocationStreamingMessageInMotionKey"));
    if (v7)
    {
      if (objc_msgSend(v7, "BOOLValue"))
        v8 = 1;
      else
        v8 = 2;
      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", v8);
      -[CLRemoteMotionAlarm delayRevertToUnknownTimer](self, "delayRevertToUnknownTimer");
    }
    else
    {
      if (qword_1022A01E0 != -1)
        dispatch_once(&qword_1022A01E0, &stru_102184140);
      v9 = qword_1022A01E8;
      if (os_log_type_enabled((os_log_t)qword_1022A01E8, OS_LOG_TYPE_FAULT))
      {
        v11 = 68289026;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Motion alarm update without any state\"}", (uint8_t *)&v11, 0x12u);
        if (qword_1022A01E0 != -1)
          dispatch_once(&qword_1022A01E0, &stru_102184140);
      }
      v10 = qword_1022A01E8;
      if (os_signpost_enabled((os_log_t)qword_1022A01E8))
      {
        v11 = 68289026;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Motion alarm update without any state", "{\"msg%{public}.0s\":\"Motion alarm update without any state\"}", (uint8_t *)&v11, 0x12u);
      }
      -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0);
    }
  }
  else if (objc_msgSend(a3, "isEqual:", CFSTR("kCLLocationStreamingMessageTypeAliveAgain")))
  {
    -[CLRemoteMotionAlarm sendMotionAlarmRequest](self, "sendMotionAlarmRequest");
  }
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  if (!a3)
    -[CLRemoteMotionAlarm setLastKnownMotionState:](self, "setLastKnownMotionState:", 0);
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableSet)motionAlarmClients
{
  return self->_motionAlarmClients;
}

- (void)setMotionAlarmClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)lastKnownMotionState
{
  return self->_lastKnownMotionState;
}

- (CLTimer)resendTimer
{
  return self->_resendTimer;
}

- (void)setResendTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CLTimer)revertToUnknownTimer
{
  return self->_revertToUnknownTimer;
}

- (void)setRevertToUnknownTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end

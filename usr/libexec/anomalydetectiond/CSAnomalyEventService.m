@implementation CSAnomalyEventService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = a4 + 1;
  if (v5 < (unint64_t)objc_msgSend(v6, "count"))
    objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", v6, v5);

}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_100389380 != -1)
    dispatch_once(&qword_100389380, &stru_10035E448);
  return (id)qword_100389378;
}

- (CSAnomalyEventService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAnomalyEventService;
  return -[CSAnomalyEventService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CSAnomalyEventServiceProtocol, &OBJC_PROTOCOL___CSAnomalyEventServiceClientProtocol);
}

- (void)replyToXPCMessage
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int releasePowerAssertionXPCRefCount;
  BOOL v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (qword_100387460 != -1)
    dispatch_once(&qword_100387460, &stru_10035E490);
  v3 = qword_100387468;
  if (os_log_type_enabled((os_log_t)qword_100387468, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "replyToXPCMessage", buf, 2u);
  }
  while (-[NSMutableArray count](self->_replyList, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_replyList, "objectAtIndex:", 0));
    xpc_dictionary_send_reply();
    -[NSMutableArray removeObjectAtIndex:](self->_replyList, "removeObjectAtIndex:", 0);
    if (qword_100387460 != -1)
      dispatch_once(&qword_100387460, &stru_10035E490);
    v5 = qword_100387468;
    if (os_log_type_enabled((os_log_t)qword_100387468, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "replying to xpc request", v8, 2u);
    }

  }
  -[NSMutableArray removeAllObjects](self->_connectionList, "removeAllObjects");
  if (self->_releasePowerAssertionXPCRefCount >= 1)
  {
    do
    {
      -[CSPower releasePowerAssertion](self->_powerAssertion, "releasePowerAssertion");
      releasePowerAssertionXPCRefCount = self->_releasePowerAssertionXPCRefCount;
      v7 = __OFSUB__(releasePowerAssertionXPCRefCount--, 1);
      self->_releasePowerAssertionXPCRefCount = releasePowerAssertionXPCRefCount;
    }
    while (!((releasePowerAssertionXPCRefCount < 0) ^ v7 | (releasePowerAssertionXPCRefCount == 0)));
  }
}

- (void)handleConnection:(id)a3
{
  _xpc_connection_s *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;
  uint8_t buf[8];
  id location;

  v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  if (qword_100387460 != -1)
    dispatch_once(&qword_100387460, &stru_10035E490);
  v5 = qword_100387468;
  if (os_log_type_enabled((os_log_t)qword_100387468, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "handleConnection", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002501C4;
  handler[3] = &unk_10035E470;
  objc_copyWeak(&v7, &location);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_activate(v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)setupXPCHandler
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *triggerDispatchQueue;
  OS_xpc_object *mach_service;
  OS_xpc_object *triggerListener;
  NSMutableArray *v8;
  NSMutableArray *replyList;
  NSMutableArray *v10;
  NSMutableArray *connectionList;
  OS_xpc_object *v12;
  _QWORD handler[4];
  id v14;
  id buf[2];

  if (qword_100387460 != -1)
    dispatch_once(&qword_100387460, &stru_10035E490);
  v3 = qword_100387468;
  if (os_log_type_enabled((os_log_t)qword_100387468, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "setupXPCHandler", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  self->_releasePowerAssertionXPCRefCount = 0;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Anomalydetectiond", 0);
  triggerDispatchQueue = self->_triggerDispatchQueue;
  self->_triggerDispatchQueue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.anomalydetectiond.trigger", (dispatch_queue_t)self->_triggerDispatchQueue, 1uLL);
  triggerListener = self->_triggerListener;
  self->_triggerListener = mach_service;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  replyList = self->_replyList;
  self->_replyList = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  connectionList = self->_connectionList;
  self->_connectionList = v10;

  v12 = self->_triggerListener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100250694;
  handler[3] = &unk_10035E470;
  objc_copyWeak(&v14, buf);
  xpc_connection_set_event_handler(v12, handler);
  xpc_connection_activate(self->_triggerListener);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)beginService
{
  NSObject *v2;
  uint8_t buf[16];

  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v2 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "beginService", buf, 2u);
  }
  operator new();
}

- (void)endService
{
  NSObject *v2;
  uint8_t v3[16];

  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v2 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "endService", v3, 2u);
  }
}

- (BOOL)isKappaTrigger:(id)a3
{
  id v3;
  _BOOL4 v4;

  v3 = a3;
  if ((*((_BYTE *)objc_msgSend(v3, "c_struct") + 1) & 1) != 0
    || (*((_BYTE *)objc_msgSend(v3, "c_struct") + 1) & 2) != 0
    || (*((_BYTE *)objc_msgSend(v3, "c_struct") + 1) & 4) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = (*((unsigned __int8 *)objc_msgSend(v3, "c_struct") + 1) >> 3) & 1;
  }

  return v4;
}

- (BOOL)isMartyTrigger:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if ((*((_BYTE *)objc_msgSend(v3, "c_struct") + 46) & 4) != 0
    || (*((_BYTE *)objc_msgSend(v3, "c_struct") + 46) & 8) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = *((_BYTE *)objc_msgSend(v3, "c_struct") + 46) & 1;
  }

  return v4;
}

+ (id)generateMslUrl:(id)a3 andSessionType:(int)a4 ttrManagedMsl:(BOOL)a5
{
  _BOOL4 v5;
  char v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if ((v6 & 3) != 0)
  {
    v8 = NSTemporaryDirectory();
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("kappaOutTTR")));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("kappaOut")));
    }
    v12 = (void *)v11;
    goto LABEL_9;
  }
  if ((v6 & 4) != 0)
  {
    v14 = NSTemporaryDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("igneousOut")));
    v17 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));

    v10 = v15;
    v12 = (void *)v17;
LABEL_9:

    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v7, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("msl")));

  return v19;
}

- (BOOL)startRecordingWithTTRManagedMsl:(BOOL)a3 andPreempt:(BOOL)a4
{
  uint64_t v4;
  uint64_t mslRecording;
  NSUUID *uuid;
  _BOOL8 v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  CSMSLDataRecording *v12;
  CSMSLDataRecording *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  mslRecording = 80;
  uuid = self->_uuid;
  if (!uuid)
  {
    sub_100254654();
    __break(1u);
    goto LABEL_22;
  }
  v8 = a3;
  if (!a4)
  {
    if ((CSAOPSvc::isRecording((CSAOPSvc *)self->_aop) & 1) != 0)
    {
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v9 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "cannot start when a recording is already in progress", (uint8_t *)&v18, 2u);
      }
      v10 = 0;
      mslRecording = (uint64_t)self->_mslRecording;
      self->_mslRecording = 0;
      goto LABEL_20;
    }
    uuid = self->_uuid;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](uuid, "UUIDString"));
  mslRecording = objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v11, self->_sessionType, v8));

  v12 = -[CSMSLDataRecording initWithURL:]([CSMSLDataRecording alloc], "initWithURL:", mslRecording);
  v4 = 88;
  v13 = self->_mslRecording;
  self->_mslRecording = v12;

  -[CSMSLDataRecording setTtrManagedMsl:](self->_mslRecording, "setTtrManagedMsl:", v8);
  if (self->_mslRecording)
  {
    if (qword_1003872F0 == -1)
    {
LABEL_12:
      v14 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)&self->CLIntersiloService_opaque[v4];
        v18 = 134218242;
        v19 = v15;
        v20 = 2114;
        v21 = mslRecording;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Recording to %p %{public}@", (uint8_t *)&v18, 0x16u);
      }
      v10 = 1;
      goto LABEL_20;
    }
LABEL_22:
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    goto LABEL_12;
  }
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v16 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_FAULT))
  {
    v18 = 138543362;
    v19 = mslRecording;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unable to open msl recording at %{public}@", (uint8_t *)&v18, 0xCu);
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (void)triggered:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  AnomalySessionDetails *value;
  AnomalySessionDetails *v22;
  NSObject *v23;
  int sessionType;
  NSObject *v25;
  CSMSLDataRecording *v26;
  NSUUID *v27;
  NSUUID *v28;
  NSObject *v29;
  NSUUID *v30;
  NSObject *v31;
  CSMSLDataRecording *v32;
  NSObject *v33;
  int sessionNum;
  NSUUID *v35;
  NSUUID *uuid;
  uint64_t v37;
  int *v38;
  int IgneousToken;
  _BOOL4 v40;
  NSObject *v41;
  CSMSLDataRecording *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  int v46;
  int v47;
  int *v48;
  id v49;
  NSObject *v50;
  int v51;
  char *v52;
  CSMSLDataRecording *mslRecording;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  const __CFString *v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint8_t buf[4];
  __int128 v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;

  v4 = a3;
  v5 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 1);
  v6 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 46);
  v7 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 64);
  -[CSAnomalyEventService setPreTriggerForcedCompanionTrigger](self, "setPreTriggerForcedCompanionTrigger");
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v8 = (id)qword_1003872F8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v57 = v5;
    v9 = v6;
    v10 = v7;
    v11 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 1);
    v12 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 46);
    v13 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 64);
    v14 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 47);
    v15 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 93);
    v16 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 92);
    *(_DWORD *)buf = 67110400;
    LODWORD(v63) = v11;
    WORD2(v63) = 1024;
    *(_DWORD *)((char *)&v63 + 6) = v12;
    WORD5(v63) = 1024;
    HIDWORD(v63) = v13;
    v64 = 1024;
    v65 = v14;
    v66 = 1024;
    v67 = v15;
    v68 = 1024;
    v69 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "triggered: trigger path %d marty path %d igneous path %d enabledMode %d overrideMode %d locallyArmed %d", buf, 0x26u);
    v7 = v10;
    v6 = v9;
    v5 = v57;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  *((_BYTE *)self->_details.__ptr_.__value_ + 26) = objc_msgSend(v17, "isAuthorizedToCollectData");

  *((_BYTE *)self->_details.__ptr_.__value_ + 28) = *((_BYTE *)self->_details.__ptr_.__value_ + 26);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  *((_BYTE *)self->_details.__ptr_.__value_ + 27) = objc_msgSend(v18, "isInternalInstall");

  if (v5 && -[CSAnomalyEventService isKappaTrigger:](self, "isKappaTrigger:", v4))
  {
    v19 = 0;
    v20 = 1;
  }
  else if (v6)
  {
    value = self->_details.__ptr_.__value_;
    if (*((_BYTE *)value + 27))
    {
      v19 = 1;
      *((_BYTE *)value + 26) = 1;
    }
    else
    {
      v19 = 0;
    }
    v20 = 2;
  }
  else if (v7)
  {
    v19 = 0;
    v20 = 4;
  }
  else
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v31 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "no path set, invalid trigger", buf, 2u);
    }
    v19 = 0;
    v20 = 0;
  }
  v22 = self->_details.__ptr_.__value_;
  if (!*((_BYTE *)v22 + 25))
  {
LABEL_42:
    ++self->_sessionNum;
    *((_BYTE *)v22 + 25) = 1;
    self->_sessionType = v20;
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v33 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      sessionNum = self->_sessionNum;
      *(_DWORD *)buf = 67109376;
      LODWORD(v63) = sessionNum;
      WORD2(v63) = 1024;
      *(_DWORD *)((char *)&v63 + 6) = v20;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "starting session %d type=%d", buf, 0xEu);
    }
    v35 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = self->_uuid;
    self->_uuid = v35;

    if ((_DWORD)v20 == 1)
    {
      if (-[CSKappaDetectionService isIdle](self->_kappaDetectionService, "isIdle"))
      {
        v37 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      if ((_DWORD)v20 != 2)
      {
        if ((v20 - 1) >= 2)
        {
          if ((_DWORD)v20 != 4)
          {
            v37 = v20;
            goto LABEL_70;
          }
          IgneousToken = getIgneousToken(0);
          v40 = IgneousToken != 0;
          if (!IgneousToken)
            self->_stopClientCollection = 1;
          self->_stopClientDetection = 1;
          self->_apTriggerTimestamp = CFAbsoluteTimeGetCurrent();
          v37 = 4;
          if (!v40)
            goto LABEL_70;
LABEL_55:
          if (*((_BYTE *)self->_details.__ptr_.__value_ + 26)
            && -[CSAnomalyEventService startRecordingWithTTRManagedMsl:andPreempt:](self, "startRecordingWithTTRManagedMsl:andPreempt:", v19, 0))
          {
            if ((_DWORD)v20 == 1)
            {
              v38 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
            }
            else
            {
              if ((_DWORD)v37 == 4)
              {
                if (*((_BYTE *)objc_msgSend(v4, "c_struct") + 64))
                {
                  v49 = sub_100250DEC();
                  v50 = objc_claimAutoreleasedReturnValue(v49);
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    v51 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 64);
                    v52 = (char *)objc_msgSend(v4, "c_struct");
                    *(_DWORD *)buf = 67109378;
                    LODWORD(v63) = v51;
                    WORD2(v63) = 2080;
                    *(_QWORD *)((char *)&v63 + 6) = v52 + 65;
                    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "igneous trigger path %d with guid %s", buf, 0x12u);
                  }

                  mslRecording = self->_mslRecording;
                  v60[0] = CFSTR("igneousGUID");
                  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (char *)objc_msgSend(v4, "c_struct") + 65));
                  v61[0] = v54;
                  v60[1] = CFSTR("igneousPath");
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 64)));
                  v60[2] = CFSTR("shouldUploadIndependentlyOfSOS");
                  v61[1] = v55;
                  v61[2] = &off_10036C2A0;
                  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 3));
                  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v56);

                }
                goto LABEL_68;
              }
              if ((_DWORD)v37 != 2)
              {
LABEL_68:
                CSAOPSvc::setRecording((id *)self->_aop, self->_mslRecording, self->_uuid, 0);
LABEL_75:
                -[CSAnomalyEventService requestLocation:](self, "requestLocation:", v37);
                v42 = self->_mslRecording;
                v58 = CFSTR("sessionType");
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sessionType));
                v59 = v43;
                v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
                -[CSMSLDataRecording updateMetadata:](v42, "updateMetadata:", v44);

                if (qword_1003872F0 != -1)
                  dispatch_once(&qword_1003872F0, &stru_10035E4B0);
                v45 = (id)qword_1003872F8;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  v46 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 1);
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v63) = v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "got a trigger path %d", buf, 8u);
                }

                goto LABEL_80;
              }
              v38 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
            }
            objc_msgSend(*(id *)&self->CLIntersiloService_opaque[*v38], "setRecording:withUUID:", self->_mslRecording, self->_uuid);
            goto LABEL_68;
          }
LABEL_70:
          if (qword_1003872F0 != -1)
            dispatch_once(&qword_1003872F0, &stru_10035E4B0);
          v41 = qword_1003872F8;
          if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v63) = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "cannot collect recording for %d", buf, 8u);
          }
          -[CSKappaDetectionService setRecording:withUUID:](self->_kappaDetectionService, "setRecording:withUUID:", 0, self->_uuid);
          -[CSMartyDetectionService setRecording:withUUID:](self->_martyDetectionService, "setRecording:withUUID:", 0, self->_uuid);
          CSAOPSvc::setRecording((id *)self->_aop, 0, self->_uuid, 0);
          goto LABEL_75;
        }
LABEL_54:
        v37 = v20;
        goto LABEL_55;
      }
      if (-[CSMartyDetectionService isIdle](self->_martyDetectionService, "isIdle"))
      {
        v37 = 2;
        goto LABEL_55;
      }
    }
    *((_BYTE *)self->_details.__ptr_.__value_ + 26) = 0;
    goto LABEL_54;
  }
  if ((v20 & 1) != 0 && self->_sessionType != 1 && !*((_BYTE *)v22 + 24))
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v23 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
    {
      sessionType = self->_sessionType;
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = sessionType;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "converting session %d into a kappa one", buf, 8u);
    }
    if (self->_sessionType == 2)
    {
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v25 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "aborting marty detection service", buf, 2u);
      }
      -[CSMartyDetectionService abortSession](self->_martyDetectionService, "abortSession");
    }
    v26 = self->_mslRecording;
    self->_mslRecording = 0;

    self->_sessionType = 1;
    *((_BYTE *)self->_details.__ptr_.__value_ + 24) = 1;
    v27 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v28 = self->_uuid;
    self->_uuid = v27;

    if (*((_BYTE *)self->_details.__ptr_.__value_ + 26))
    {
      -[CSAnomalyEventService startRecordingWithTTRManagedMsl:andPreempt:](self, "startRecordingWithTTRManagedMsl:andPreempt:", v19, 1);
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v29 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_uuid;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&v63 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "creating new recording for preemption %@", buf, 0xCu);
      }
    }
    else
    {
      v32 = self->_mslRecording;
      self->_mslRecording = 0;

    }
    CSAOPSvc::restartSession((CSAOPSvc *)self->_aop, self->_mslRecording);
    -[CSKappaDetectionService setRecording:withUUID:](self->_kappaDetectionService, "setRecording:withUUID:", self->_mslRecording, self->_uuid);
    v22 = self->_details.__ptr_.__value_;
    if (!*((_BYTE *)v22 + 25))
    {
      v20 = 1;
      goto LABEL_42;
    }
  }
LABEL_80:
  v47 = self->_sessionType;
  if (v47 == 1)
  {
    if (-[CSAnomalyEventService isKappaTrigger:](self, "isKappaTrigger:", v4))
    {
      v48 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
LABEL_87:
      objc_msgSend(*(id *)&self->CLIntersiloService_opaque[*v48], "triggered:", v4);
      goto LABEL_88;
    }
    v47 = self->_sessionType;
  }
  if (v47 == 2 && -[CSAnomalyEventService isMartyTrigger:](self, "isMartyTrigger:", v4))
  {
    v48 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
    goto LABEL_87;
  }
LABEL_88:

}

- (void)sosActivated
{
  -[CSKappaDetectionService sosActivated](self->_kappaDetectionService, "sosActivated");
}

- (void)feedSortedSamples:(id)a3
{
  id v4;
  int sessionType;
  id *p_martyDetectionService;
  unsigned __int8 v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  sessionType = self->_sessionType;
  if (sessionType == 4)
  {
    CSAOPSvc::stopDetection((uint64_t)self->_aop);
  }
  else
  {
    if (sessionType == 2)
    {
      p_martyDetectionService = (id *)&self->_martyDetectionService;
      v7 = -[CSMartyDetectionService isIdle](self->_martyDetectionService, "isIdle");
    }
    else
    {
      if (sessionType != 1)
        goto LABEL_10;
      p_martyDetectionService = (id *)&self->_kappaDetectionService;
      v7 = -[CSKappaDetectionService isIdle](self->_kappaDetectionService, "isIdle");
    }
    if ((v7 & 1) != 0)
      self->_stopClientDetection = 1;
    else
      objc_msgSend(*p_martyDetectionService, "feedSortedSamples:", v4);
  }
LABEL_10:
  if (self->_stopClientDetection)
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v8 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "stopping detection", buf, 2u);
    }
    CSAOPSvc::stopDetection((uint64_t)self->_aop);
    self->_stopClientDetection = 0;
  }
  if (self->_stopClientCollection)
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v9 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "stopping collection", v10, 2u);
    }
    CSAOPSvc::stopCollection((uint64_t)self->_aop);
    self->_stopClientCollection = 0;
  }

}

- (void)startUploader
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  CSStudiesServerUploader *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  CSStudiesServerUploader *v17;
  CSStudiesServerUploader *uploader;
  CSStudiesServerUploader *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("studiesServerUploaderSpooler")));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v8 = (uint64_t)objc_msgSend(v7, "integerForKey:", CFSTR("KappaDetectionServiceUploaderOverrideRetentionPeriod"));

  if (!v8)
    v8 = 2592000;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  objc_msgSend(v9, "doubleForKey:", CFSTR("KappaDetectionServiceOOBTimeoutOverride"));
  v11 = v10;

  if (v11 == 0.0)
    v11 = 900.0;
  v12 = [CSStudiesServerUploader alloc];
  v13 = NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("studiesServerUploaderSpooler")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration persistentConfiguration](CSStudiesServerConfiguration, "persistentConfiguration"));
  v17 = -[CSStudiesServerUploader initWithSpoolerFolder:serverConfiguration:registrationPeriodInSeconds:retentionPeriodInSeconds:outOfBandMetadataTimeout:defaultsKeyPostfix:](v12, "initWithSpoolerFolder:serverConfiguration:registrationPeriodInSeconds:retentionPeriodInSeconds:outOfBandMetadataTimeout:defaultsKeyPostfix:", v15, v16, v8, v8, &stru_100366D80, v11);
  uploader = self->_uploader;
  self->_uploader = v17;

  -[CSKappaDetectionService setUploader:](self->_kappaDetectionService, "setUploader:", self->_uploader);
  -[CSMartyDetectionService setUploader:](self->_martyDetectionService, "setUploader:", self->_uploader);
  v19 = self->_uploader;
  v23 = 0;
  v20 = -[CSStudiesServerUploader startMonitoringWithError:](v19, "startMonitoringWithError:", &v23);
  v21 = v23;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v22 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    v25 = v20;
    v26 = 2114;
    v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Start monitoring: %{public}d %{public}@", buf, 0x12u);
  }

}

- (void)startIgneousUploader
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  CSStudiesServerUploader *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  CSStudiesServerUploader *v17;
  CSStudiesServerUploader *igneousUploader;
  CSStudiesServerUploader *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("studiesServerUploaderSpoolerIgneous")));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v8 = (uint64_t)objc_msgSend(v7, "integerForKey:", CFSTR("KappaDetectionServiceUploaderOverrideRetentionPeriod"));

  if (!v8)
    v8 = 2592000;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  objc_msgSend(v9, "doubleForKey:", CFSTR("KappaDetectionServiceOOBTimeoutOverride"));
  v11 = v10;

  if (v11 == 0.0)
    v11 = 900.0;
  v12 = [CSStudiesServerUploader alloc];
  v13 = NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("studiesServerUploaderSpoolerIgneous")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSStudiesServerConfiguration persistentConfigurationIgneous](CSStudiesServerConfiguration, "persistentConfigurationIgneous"));
  v17 = -[CSStudiesServerUploader initWithSpoolerFolder:serverConfiguration:registrationPeriodInSeconds:retentionPeriodInSeconds:outOfBandMetadataTimeout:defaultsKeyPostfix:](v12, "initWithSpoolerFolder:serverConfiguration:registrationPeriodInSeconds:retentionPeriodInSeconds:outOfBandMetadataTimeout:defaultsKeyPostfix:", v15, v16, 0, v8, CFSTR("Igneous"), v11);
  igneousUploader = self->_igneousUploader;
  self->_igneousUploader = v17;

  v19 = self->_igneousUploader;
  v23 = 0;
  v20 = -[CSStudiesServerUploader startMonitoringWithError:](v19, "startMonitoringWithError:", &v23);
  v21 = v23;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v22 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    v25 = v20;
    v26 = 2114;
    v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Start igneous monitoring: %{public}d %{public}@", buf, 0x12u);
  }

}

- (void)uploadRecording:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int sessionType;
  CSStudiesServerUploadMetadata *v16;
  const __CFString *v17;
  NSObject *v18;
  CSStudiesServerUploadMetadata *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CSStudiesServerUploader *igneousUploader;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  CSStudiesServerUploader *uploader;
  NSObject *v32;
  NSObject *v33;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  _QWORD v42[3];
  _BYTE v43[128];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc((Class)NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v8);
    }

    sessionType = self->_sessionType;
    if ((sessionType - 1) >= 2)
    {
      if (sessionType != 4)
      {
        if (qword_1003872F0 != -1)
          dispatch_once(&qword_1003872F0, &stru_10035E4B0);
        v29 = qword_1003872F8;
        if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "no metadata type specified", buf, 2u);
        }
        goto LABEL_42;
      }
      v16 = [CSStudiesServerUploadMetadata alloc];
      v17 = CFSTR("IgneousDetectionService");
    }
    else
    {
      v16 = [CSStudiesServerUploadMetadata alloc];
      v17 = CFSTR("DetectionService");
    }
    v19 = -[CSStudiesServerUploadMetadata initWithPayloadType:channel:keyValuePairs:](v16, "initWithPayloadType:channel:keyValuePairs:", CFSTR("KappaMSL"), v17, v6);
    v20 = self->_sessionType;
    if ((v20 - 1) >= 2)
    {
      if (v20 != 4)
      {
        v28 = 0;
        v27 = 0;
LABEL_32:
        if (qword_1003872F0 != -1)
          dispatch_once(&qword_1003872F0, &stru_10035E4B0);
        v32 = qword_1003872F8;
        if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240450;
          LODWORD(v42[0]) = v27;
          WORD2(v42[0]) = 2114;
          *(_QWORD *)((char *)v42 + 6) = v28;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Enqueue for upload: success,%{public}d error,%{public}@", buf, 0x12u);
        }
        if (v28)
        {
          if (qword_1003872F0 != -1)
            dispatch_once(&qword_1003872F0, &stru_10035E4B0);
          v33 = qword_1003872F8;
          if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v42[0] = v28;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "error %{public}@", buf, 0xCu);
          }
        }

LABEL_42:
        goto LABEL_43;
      }
      igneousUploader = self->_igneousUploader;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
      v35 = 0;
      v27 = -[CSStudiesServerUploader enqueueFileWithFilename:andMetadata:error:](igneousUploader, "enqueueFileWithFilename:andMetadata:error:", v26, v19, &v35);
      v28 = v35;

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "path"));

      if (self->_sessionType == 2)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "urlToCopyToOnStop"));
        if (v23)
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "urlToCopyToOnStop"));
        else
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));

        v22 = (void *)v30;
      }
      uploader = self->_uploader;
      v36 = 0;
      v27 = -[CSStudiesServerUploader enqueueFileWithFilename:andMetadata:error:](uploader, "enqueueFileWithFilename:andMetadata:error:", v22, v19, &v36);
      v28 = v36;
    }

    goto LABEL_32;
  }
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v18 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "cannot upload a nil recording", buf, 2u);
  }
LABEL_43:

}

- (void)abortSession
{
  NSObject *v3;
  CSMSLDataRecording *mslRecording;
  uint8_t v5[16];

  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v3 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "aborting session", v5, 2u);
  }
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;

}

- (void)finishSession
{
  NSObject *v3;
  int sessionNum;
  CSMSLDataRecording *mslRecording;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  AnomalySessionDetails *value;
  uint64_t v12;
  CSMSLDataRecording *v13;
  NSNumber *v14;
  void *v15;
  NSNumber *v16;
  NSNumber *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CSMSLDataRecording *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  CSMSLDataRecording *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  _QWORD v31[6];
  _QWORD v32[6];
  const __CFString *v33;
  void *v34;

  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v3 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    sessionNum = self->_sessionNum;
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = sessionNum;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "finish session %d", buf, 8u);
  }
  if (self->_sessionType == 4)
  {
    mslRecording = self->_mslRecording;
    v33 = CFSTR("apTriggerTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_apTriggerTimestamp));
    v34 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v7);

    if ((int)getIgneousToken(0) >= 1)
    {
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v8 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "acquiring igneous token", buf, 2u);
      }
      getIgneousToken(1);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
  v10 = objc_msgSend(v9, "integerForKey:", CFSTR("ServerConfigVersion"));

  value = self->_details.__ptr_.__value_;
  if (*((_BYTE *)value + 1))
    v12 = *(_BYTE *)value | 2u;
  else
    v12 = *(_BYTE *)value;
  v13 = self->_mslRecording;
  v31[0] = CFSTR("kappaTokenCount");
  v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getKappaToken(0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v32[0] = v15;
  v31[1] = CFSTR("martyTokenCount");
  v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getMartyToken(0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v32[1] = v28;
  v31[2] = CFSTR("igneousTokenCount");
  v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getIgneousToken(0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v32[2] = v18;
  v31[3] = CFSTR("configServerVersionNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v32[3] = v19;
  v31[4] = CFSTR("convertToKappa");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_details.__ptr_.__value_ + 24)));
  v32[4] = v20;
  v31[5] = CFSTR("companionForceTriggered");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
  v32[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 6));
  -[CSMSLDataRecording updateMetadata:](v13, "updateMetadata:", v22);

  v23 = self->_mslRecording;
  if (v23)
  {
    -[CSMSLDataRecording stopAndKeep:](v23, "stopAndKeep:", 1);
    -[CSMSLDataRecording dumpMetadata](self->_mslRecording, "dumpMetadata");
    if (*((_BYTE *)self->_details.__ptr_.__value_ + 28))
    {
      if (-[CSMSLDataRecording shouldUpload](self->_mslRecording, "shouldUpload"))
      {
        if (qword_1003872F0 != -1)
          dispatch_once(&qword_1003872F0, &stru_10035E4B0);
        v24 = (id)qword_1003872F8;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSMSLDataRecording url](self->_mslRecording, "url"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "enqueuing recording %@", buf, 0xCu);

        }
        -[CSAnomalyEventService uploadRecording:](self, "uploadRecording:", self->_mslRecording);
      }
    }
  }
  v27 = self->_mslRecording;
  self->_mslRecording = 0;

  self->_sessionType = 0;
  self->_stopClientDetection = 0;
  self->_stopClientCollection = 0;
  operator new();
}

- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5
{
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  _BYTE v16[14];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;

  v6 = a3;
  v7 = a4;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v8 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    v15 = 67109376;
    *(_DWORD *)v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v9 = (id)qword_1003872F8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name")));
    v11 = objc_msgSend(v10, "UTF8String");
    v12 = objc_msgSend(v7, "isNearby");
    v13 = objc_msgSend(v7, "isDefaultPairedDevice");
    v14 = objc_msgSend(v7, "isConnected");
    v15 = 136315906;
    *(_QWORD *)v16 = v11;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v12;
    v17 = 1024;
    v18 = v13;
    v19 = 1024;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Paired device info: name %s, isNearby %d, isDefaultPairedDevice %d, isConnected %d", (uint8_t *)&v15, 0x1Eu);

  }
}

- (void)setForcedCompanionTrigger:(unsigned __int8)a3
{
  int v3;
  double Current;
  NSObject *v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CSAnomalyEventService *v11;
  SEL v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (*((_BYTE *)self->_details.__ptr_.__value_ + 25))
  {
    if (v3 != 2)
    {
      if (v3 == 1)
      {
        if (qword_1003872F0 != -1)
          dispatch_once(&qword_1003872F0, &stru_10035E4B0);
        v6 = qword_1003872F8;
        if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "setting forced kappa trigger", buf, 2u);
        }
        *(_BYTE *)self->_details.__ptr_.__value_ = 1;
        return;
      }
      sub_100254894();
LABEL_27:
      v11 = (CSAnomalyEventService *)sub_100254778();
      -[CSAnomalyEventService setPreTriggerForcedCompanionTrigger](v11, v12);
      return;
    }
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v9 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "setting forced marty trigger", v15, 2u);
    }
    *((_BYTE *)self->_details.__ptr_.__value_ + 1) = 1;
  }
  else
  {
    v7 = Current;
    if (v3 == 2)
    {
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v10 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "setting forced marty trigger ts", v13, 2u);
      }
      *((double *)self->_details.__ptr_.__value_ + 2) = v7;
    }
    else
    {
      if (v3 != 1)
        goto LABEL_27;
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v8 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting forced kappa trigger ts", v14, 2u);
      }
      *((double *)self->_details.__ptr_.__value_ + 1) = v7;
    }
  }
}

- (void)setPreTriggerForcedCompanionTrigger
{
  double Current;
  AnomalySessionDetails *value;
  double v5;
  double v6;
  NSObject *v8;
  double v9;
  double v10;
  NSObject *v12;
  int v13;
  double v14;

  Current = CFAbsoluteTimeGetCurrent();
  value = self->_details.__ptr_.__value_;
  v5 = *((double *)value + 1);
  v6 = Current - v5;
  if (v5 != 0.0 && v6 < 30.0)
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v8 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134217984;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting pre-trigger kappa delta %f", (uint8_t *)&v13, 0xCu);
    }
    value = self->_details.__ptr_.__value_;
    *(_BYTE *)value = 1;
  }
  v9 = *((double *)value + 2);
  v10 = Current - v9;
  if (v9 != 0.0 && v10 < 30.0)
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v12 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134217984;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "setting pre-trigger marty delta %f", (uint8_t *)&v13, 0xCu);
    }
    *((_BYTE *)self->_details.__ptr_.__value_ + 1) = 1;
  }
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  int *v10;
  id *aop;
  CSRemoteSample_Struct *v12;
  NSObject *v13;
  CSRemoteSample_Struct *v14;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v9 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "onCompanionMessage anomaly event service", (uint8_t *)&v14, 2u);
  }
  v10 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
  if ((int)v6 <= 200)
  {
    if (v6 >= 0xC && (v6 - 100) >= 3)
      goto LABEL_28;
    goto LABEL_12;
  }
  if ((int)v6 <= 301)
  {
    if ((int)v6 <= 202)
    {
      if ((_DWORD)v6 != 201)
      {
        -[CSAnomalyEventService setForcedCompanionTrigger:](self, "setForcedCompanionTrigger:", 1);
        v10 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
      }
      goto LABEL_12;
    }
    if ((_DWORD)v6 == 203)
    {
LABEL_12:
      objc_msgSend(*(id *)&self->CLIntersiloService_opaque[*v10], "onCompanionMessage:data:receivedTimestamp:", v6, v8, a5);
      goto LABEL_13;
    }
    if ((_DWORD)v6 != 300)
    {
      if ((_DWORD)v6 != 301)
      {
LABEL_28:
        if (qword_1003872F0 != -1)
          dispatch_once(&qword_1003872F0, &stru_10035E4B0);
        v13 = qword_1003872F8;
        if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_INFO))
        {
          LODWORD(v14) = 67109120;
          HIDWORD(v14) = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "unhandled message %d", (uint8_t *)&v14, 8u);
        }
        goto LABEL_13;
      }
      -[CSAnomalyEventService setForcedCompanionTrigger:](self, "setForcedCompanionTrigger:", 2);
    }
LABEL_11:
    v10 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
    goto LABEL_12;
  }
  if ((v6 - 302) < 5)
    goto LABEL_11;
  if ((_DWORD)v6 == 400)
    sub_1000182A8(v8);
  if ((_DWORD)v6 != 401)
    goto LABEL_28;
  sub_1000185A4(v8, &v14);
  if (v14)
  {
    aop = (id *)self->_aop;
    if (aop)
    {
      CSAOPSvc::onSafetyRemoteSample(aop, v14);
      v12 = v14;
      v14 = 0;
      if (!v12)
        goto LABEL_13;
    }
    else
    {
      v14 = 0;
    }
    operator delete();
  }
LABEL_13:

}

- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5
{
  void *aop;
  CSAnomalyEventService *v6;
  SEL v7;
  int v8;

  aop = self->_aop;
  if (aop)
  {
    CSAOPSvc::onCompanionStatusUpdate((uint64_t)aop, *(uint64_t *)&a3, a5);
  }
  else
  {
    v6 = (CSAnomalyEventService *)sub_1002549B0();
    -[CSAnomalyEventService requestLocation:](v6, v7, v8);
  }
}

- (void)requestLocation:(int)a3
{
  unsigned __int8 v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CLLocationManager *v14;
  CLLocationManager *locationManager;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v17 = (id)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance", *(_QWORD *)&a3));
  v4 = objc_msgSend(v17, "isAuthorizedToCollectData");

  if ((v4 & 1) != 0)
  {
    if (self->_sessionType == 4)
      v5 = 1000.0;
    else
      v5 = (double)(int)kCLLocationAccuracyPrecisionLimitation;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLsForDirectory:inDomains:", 5, 8));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("LocationBundles")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("Emergency SOS.bundle")));
    v10 = objc_alloc((Class)CLLocationManager);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v9));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAnomalyEventService silo](self, "silo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queue"));
    v14 = (CLLocationManager *)objc_msgSend(v10, "initWithEffectiveBundle:delegate:onQueue:", v11, self, v13);
    locationManager = self->_locationManager;
    self->_locationManager = v14;

    -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", v5);
    -[CLLocationManager requestLocation](self->_locationManager, "requestLocation");

  }
  else
  {
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_10035E4B0);
    v16 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "not authorized to collect", buf, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int sessionType;
  NSObject *v11;
  int *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  CSMSLDataRecording *mslRecording;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;

  v6 = a3;
  v7 = a4;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v8 = (id)qword_1003872F8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received location update: %@", buf, 0xCu);

  }
  sessionType = self->_sessionType;
  switch(sessionType)
  {
    case 2:
      v12 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
      goto LABEL_14;
    case 1:
      v12 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
LABEL_14:
      objc_msgSend(*(id *)&self->CLIntersiloService_opaque[*v12], "feedLocationManagerResults:", v7);
      break;
    case 0:
      if (qword_1003872F0 != -1)
        dispatch_once(&qword_1003872F0, &stru_10035E4B0);
      v11 = qword_1003872F8;
      if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignoring gps when not in a session", buf, 2u);
      }
      goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_msgSend(v13, "coordinate");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_msgSend(v16, "coordinate");
  v18 = v17;

  *(float *)&v19 = v15;
  v20 = v18;
  if (self->_sessionType == 4)
  {
    *(float *)&v19 = roundf(*(float *)&v19 / 0.014) * 0.014;
    v20 = roundf(v20 / 0.014) * 0.014;
  }
  mslRecording = self->_mslRecording;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19, CFSTR("coarseLat")));
  v26[1] = CFSTR("coarseLong");
  v27[0] = v22;
  *(float *)&v23 = v20;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  v27[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v25);

LABEL_18:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v7 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error updating location: %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)didInitWithUnprocessedCrash:(id)a3 withCompanionUUID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_10035E4B0);
  v7 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didInitWithUnprocessedCrash recoveredLocalUUID:%@ recoveredCompanionUUID:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  void *martyDetectionService;
  uint64_t v5;

  if (a4 == 2)
  {
    martyDetectionService = self->_martyDetectionService;
    if (martyDetectionService)
    {
      v5 = 2;
      goto LABEL_5;
    }
  }
  else if (a4 == 1)
  {
    martyDetectionService = self->_kappaDetectionService;
    if (martyDetectionService)
    {
      v5 = 1;
LABEL_5:
      objc_msgSend(martyDetectionService, "didReceiveSOSAck:forMode:", a3, v5);
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((_DWORD)v4 == 2)
  {
    v6 = 32;
  }
  else
  {
    if ((_DWORD)v4 != 1)
      goto LABEL_7;
    v6 = 24;
  }
  v7 = *(void **)&self->CLIntersiloService_opaque[v6];
  if (v7)
    objc_msgSend(v7, "didReceiveSOSStatusUpdate:forMode:", v8, v4);
LABEL_7:

}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (void).cxx_destruct
{
  AnomalySessionDetails *value;

  objc_storeStrong((id *)&self->_companionProxy, 0);
  objc_storeStrong((id *)&self->_replyObject, 0);
  objc_storeStrong((id *)&self->_triggerListener, 0);
  objc_storeStrong((id *)&self->_triggerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_connectionList, 0);
  objc_storeStrong((id *)&self->_replyList, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  objc_storeStrong((id *)&self->_igneousUploader, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_coreAnalytics, 0);
  objc_storeStrong((id *)&self->_martyDetectionService, 0);
  objc_storeStrong((id *)&self->_kappaDetectionService, 0);
  objc_storeStrong((id *)&self->_sosSM, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end

@implementation CSMartyDetectionService

- (float)querySamplingRate:(id)a3 withDefault:(float)a4
{
  optional<float> v5;
  float result;

  v5 = -[CSPersistentConfiguration getFloatDefault:](self->_persist, "getFloatDefault:", a3);
  result = v5.var0.var1;
  if ((*(_QWORD *)&v5 & 0xFF00000000) == 0)
    return a4;
  return result;
}

- (void)resetSession
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v3 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "resetSession Marty", v4, 2u);
  }
  -[CSMartyDetectionService sendSessionInfoToCoreAnalytics](self, "sendSessionInfoToCoreAnalytics");
  operator new();
}

- (void)start
{
  optional<int> v2;
  int var1;
  int v4;
  NSObject *v5;
  _DWORD v6[2];

  v2 = -[CSPersistentConfiguration getIntegerDefault:](self->_persist, "getIntegerDefault:", CFSTR("MaxSessionTimeInSeconds"));
  if (v2.var0.var1 <= 0x78u)
    var1 = v2.var0.var1;
  else
    var1 = 600;
  if ((*(_QWORD *)&v2 & 0xFF00000000) != 0)
    v4 = var1;
  else
    v4 = 120;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v5 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "configuring flow controller to have a max session of %d seconds", (uint8_t *)v6, 8u);
  }
  operator new();
}

- (void)initStateMachine
{
  id v3;
  _QWORD *v4;
  id idleState;
  _QWORD *v6;
  id readingState;
  _QWORD *v8;
  id waitForSOSState;
  CSHSMObjc *v10;
  id v11;
  CSHSMObjc *v12;
  CSHSMObjc *hsm;
  CLTimer *v14;
  CLTimer *triggerTimer;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id location;

  v3 = objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10026368C;
  v19[3] = &unk_1003610D0;
  v19[4] = self;
  v4 = objc_retainBlock(v19);
  idleState = self->_idleState;
  self->_idleState = v4;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002636E8;
  v18[3] = &unk_1003610D0;
  v18[4] = self;
  v6 = objc_retainBlock(v18);
  readingState = self->_readingState;
  self->_readingState = v6;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100263970;
  v17[3] = &unk_1003610D0;
  v17[4] = self;
  v8 = objc_retainBlock(v17);
  waitForSOSState = self->_waitForSOSState;
  self->_waitForSOSState = v8;

  v10 = [CSHSMObjc alloc];
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v11 = (id)qword_100387348;
  v12 = -[CSHSMObjc initWithCategory:state:](v10, "initWithCategory:state:", v11, self->_idleState);
  hsm = self->_hsm;
  self->_hsm = v12;

  v14 = (CLTimer *)-[CLSilo newTimer](self->_silo, "newTimer");
  triggerTimer = self->_triggerTimer;
  self->_triggerTimer = v14;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100263BF4;
  v16[3] = &unk_10034B158;
  v16[4] = self;
  -[CLTimer setHandler:](self->_triggerTimer, "setHandler:", v16);

  objc_destroyWeak(&location);
}

- (void)abortSession
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v3 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "aborting marty session", v4, 2u);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 1);
  CSAOPSvc::stopDetection((uint64_t)self->_aop);
  self->_aborted = 1;
  -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 6, 0);
}

- (void)triggered:(id)a3
{
  id v4;
  unsigned __int16 v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  double v11;
  char *v12;
  NSObject *v13;
  _BYTE *v14;
  MartySessionInfo *value;
  char *v16;
  _BYTE *v17;
  MartySessionInfo *v18;
  char *v19;
  uint8_t buf[8];
  __int16 v21;
  int v22;

  v4 = a3;
  v5 = (unsigned __int16)-[CSPersistentConfiguration getBooleanDefault:](self->_persist, "getBooleanDefault:", CFSTR("MartyForceTriggersAreCycling"));
  if (v5 >= 0x100u)
  {
    *((_BYTE *)objc_msgSend(v4, "c_struct") + 94) = v5;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 94);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "forcing marty cycling mode %d", buf, 8u);
    }

  }
  if (self->_uuid)
  {
    if (qword_100387340 == -1)
      goto LABEL_9;
  }
  else
  {
    sub_10026C5E8(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 441, "-[CSMartyDetectionService triggered:]");
    __break(1u);
  }
  dispatch_once(&qword_100387340, &stru_100361118);
LABEL_9:
  v8 = (id)qword_100387348;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 46);
    v10 = *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 94);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v9;
    v21 = 1024;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "marty path value %d type %d", buf, 0xEu);
  }

  -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 1, 0);
  v11 = *(double *)self->_details.__ptr_.__value_;
  if (v11 == 0.0)
  {
    if (*((_BYTE *)objc_msgSend(v4, "c_struct", v11) + 94))
    {
      *((_BYTE *)self->_details.__ptr_.__value_ + 8) = 1;
      v12 = (char *)self->_userInfoStats.__ptr_.__value_ + 24;
    }
    else
    {
      v12 = (char *)self->_userInfoStats.__ptr_.__value_ + 28;
    }
    ++*(_DWORD *)v12;
    *(CFAbsoluteTime *)self->_details.__ptr_.__value_ = CFAbsoluteTimeGetCurrent();
    -[CSMartyDetectionService requestDeviceInfo](self, "requestDeviceInfo");
    -[CSMartyDetectionService sendCompanionUUID:](self, "sendCompanionUUID:", self->_uuid);
  }
  if ((*((_BYTE *)objc_msgSend(v4, "c_struct", v11) + 46) & 4) == 0
    && (*((_BYTE *)objc_msgSend(v4, "c_struct") + 46) & 0x10) == 0)
  {
    *(_BYTE *)self->_sessionInfoStats.__ptr_.__value_ = 1;
  }
  -[CSSafetySOSStateMachine feedPotentialEventWithTimestamp:forMode:martyIsBicycle:](self->_sosSM, "feedPotentialEventWithTimestamp:forMode:martyIsBicycle:", *((_QWORD *)objc_msgSend(v4, "c_struct") + 1), 2, *((unsigned __int8 *)self->_details.__ptr_.__value_ + 8));
  if ((*((_BYTE *)objc_msgSend(v4, "c_struct") + 46) & 9) != 0)
    -[CSMartyDetectionService sendCompanionTrigger:](self, "sendCompanionTrigger:", v4);
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v13 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(re)start the flow controller", buf, 2u);
  }
  CLKappaAlgFlowController::start(self->fFlowControl.__ptr_.__value_, *((_QWORD *)objc_msgSend(v4, "c_struct") + 1));
  if ((*((_BYTE *)objc_msgSend(v4, "c_struct") + 46) & 8) != 0
    || (*((_BYTE *)objc_msgSend(v4, "c_struct") + 46) & 1) != 0)
  {
    v14 = objc_msgSend(v4, "c_struct");
    value = self->_sessionInfoStats.__ptr_.__value_;
    if (v14[94])
    {
      ++*((_DWORD *)value + 13);
      v16 = (char *)self->_userInfoStats.__ptr_.__value_ + 40;
    }
    else
    {
      ++*((_DWORD *)value + 14);
      v16 = (char *)self->_userInfoStats.__ptr_.__value_ + 48;
    }
    ++*(_DWORD *)v16;
  }
  if ((*((_BYTE *)objc_msgSend(v4, "c_struct") + 46) & 4) != 0)
  {
    v17 = objc_msgSend(v4, "c_struct");
    v18 = self->_sessionInfoStats.__ptr_.__value_;
    if (v17[94])
    {
      *((_BYTE *)v18 + 14) = 1;
      v19 = (char *)self->_userInfoStats.__ptr_.__value_ + 44;
    }
    else
    {
      *((_BYTE *)v18 + 15) = 1;
      v19 = (char *)self->_userInfoStats.__ptr_.__value_ + 52;
    }
    ++*(_DWORD *)v19;
  }
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 8) |= *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 92);
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 15) |= *((unsigned __int8 *)objc_msgSend(v4, "c_struct") + 93);

}

- (void)escalateUI
{
  unsigned __int16 v3;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = (unsigned __int16)-[CSPersistentConfiguration getBooleanDefault:](self->_persist, "getBooleanDefault:", CFSTR("MartyShouldEscalateUI"));
  if (v3 < 0x100u || v3 == 0)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v5 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "refused to escalating UI", v7, 2u);
    }
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "escalating UI", buf, 2u);
    }
    *((_BYTE *)self->_details.__ptr_.__value_ + 43) = 1;
    self->_SOSInProgress = 1;
    -[CSSafetySOSStateMachine feedDetectionDecision:uuid:forMode:](self->_sosSM, "feedDetectionDecision:uuid:forMode:", 1, self->_uuid, 2);
  }
}

- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  NSObject *v8;
  CLKappaAlgFlowController *value;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  int v21;
  MartySessionDetails *v22;
  uint64_t v23;
  NSObject *v24;
  MartySessionDetails *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  MartySessionDetails *v31;
  int v32;
  MartySessionInfo *v33;
  NSObject *v34;
  void *v35;
  CSMSLDataRecording *mslRecording;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  _QWORD v52[4];
  _QWORD v53[4];
  uint8_t v54[4];
  int v55;
  uint8_t buf[8];
  _BYTE v57[10];
  __int16 v58;
  unint64_t v59;

  v4 = *(_QWORD *)&a4;
  v7 = +[CSTimeManager SPU_estimate_current_timestamp](CSTimeManager, "SPU_estimate_current_timestamp");
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v8 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240704;
    *(_DWORD *)&buf[4] = v4;
    *(_WORD *)v57 = 2050;
    *(_QWORD *)&v57[2] = a3;
    v58 = 2050;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "close epoch %{public}d aop timestamp %{public}llu, %{public}llu", buf, 0x1Cu);
  }
  value = self->fFlowControl.__ptr_.__value_;
  v10 = *((_QWORD *)value + 52);
  v11 = *((_QWORD *)value + 53);
  *(_QWORD *)buf = v10;
  *(_QWORD *)v57 = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v10 + 152))(&v48);
  sub_10025E048((uint64_t)&v48, &v50);
  v14 = v49;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v50;
  v18 = *(_QWORD *)(v50 + 88);
  if (v18)
    *((double *)self->_details.__ptr_.__value_ + 2) = (double)v18;
  if (*(int *)(v17 + 104) >= 1)
    *((_BYTE *)self->_details.__ptr_.__value_ + 40) = 1;
  v19 = -[CSMartyDetectionService getForceDecision:](self, "getForceDecision:", CFSTR("MartyForceEarlyCrashDetectorDecision"));
  v20 = v50;
  if ((v19 & 1) != 0)
  {
    if (!*(_BYTE *)(v50 + 112))
      goto LABEL_22;
  }
  else if (!*(_BYTE *)(v50 + 112))
  {
    if (!*(_BYTE *)(v50 + 113))
      goto LABEL_33;
    goto LABEL_22;
  }
  *((_WORD *)self->_details.__ptr_.__value_ + 12) |= 1u;
LABEL_22:
  v21 = *(unsigned __int8 *)(v20 + 113);
  v22 = self->_details.__ptr_.__value_;
  if (v21)
    *((_WORD *)v22 + 12) |= 2u;
  v23 = 44;
  if (!*((_BYTE *)v22 + 8))
    v23 = 48;
  ++*(_DWORD *)((char *)self->_sessionInfoStats.__ptr_.__value_ + v23);
  if (!*((_BYTE *)v22 + 41))
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v24 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "requesting companion upload for early crash", v54, 2u);
    }
    -[CSMartyDetectionService requestCompanionUpload:](self, "requestCompanionUpload:", 3);
    v22 = self->_details.__ptr_.__value_;
  }
  *((_BYTE *)v22 + 41) = 1;
LABEL_33:
  if (-[CSMartyDetectionService getForceDecision:](self, "getForceDecision:", CFSTR("MartyForceAlphaCrashDetectorDecision"))|| *(_DWORD *)(v50 + 104))
  {
    v25 = self->_details.__ptr_.__value_;
    v26 = 36;
    if (!*((_BYTE *)v25 + 8))
      v26 = 40;
    ++*(_DWORD *)((char *)self->_sessionInfoStats.__ptr_.__value_ + v26);
    if (!*((_BYTE *)v25 + 40))
    {
      if (qword_100387340 != -1)
        dispatch_once(&qword_100387340, &stru_100361118);
      v27 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "requesting companion upload for alpha crash", v54, 2u);
      }
      -[CSMartyDetectionService requestCompanionUpload:](self, "requestCompanionUpload:", 1);
      v25 = self->_details.__ptr_.__value_;
    }
    *((_BYTE *)v25 + 40) = 1;
  }
  if (-[CSMartyDetectionService getForceDecision:](self, "getForceDecision:", CFSTR("MartyForceSevereCrashDetectorDecision"))|| *(_BYTE *)(v50 + 96))
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v28 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v29 = *((unsigned __int8 *)self->_details.__ptr_.__value_ + 42);
      *(_DWORD *)v54 = 67109120;
      v55 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "_details->severeCrashDetected %d", v54, 8u);
    }
    if (!*((_BYTE *)self->_details.__ptr_.__value_ + 42))
    {
      if (qword_100387340 != -1)
        dispatch_once(&qword_100387340, &stru_100361118);
      v30 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "escalating UI", v54, 2u);
      }
      -[CSMartyDetectionService escalateUI](self, "escalateUI");
      v31 = self->_details.__ptr_.__value_;
      *((double *)v31 + 4) = (double)*(unint64_t *)(v50 + 80);
      *((_BYTE *)v31 + 42) = 1;
      v32 = *((unsigned __int8 *)v31 + 8);
      v33 = self->_sessionInfoStats.__ptr_.__value_;
      if (v32)
        *((_BYTE *)v33 + 22) = 1;
      else
        *((_BYTE *)v33 + 23) = 1;
      if (qword_100387340 != -1)
        dispatch_once(&qword_100387340, &stru_100361118);
      v34 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "requesting companion upload for severe crash", v54, 2u);
      }
      -[CSMartyDetectionService requestCompanionUpload:](self, "requestCompanionUpload:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
      +[CSFeedbackAssistant showFeedbackAssistantSurveyWithUUID:](CSFeedbackAssistant, "showFeedbackAssistantSurveyWithUUID:", v35);

    }
  }
  mslRecording = self->_mslRecording;
  v52[0] = CFSTR("crashTimestamp");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)self->_details.__ptr_.__value_ + 2)));
  v53[0] = v37;
  v52[1] = CFSTR("severeCrashDetectorDecision");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_details.__ptr_.__value_ + 42)));
  v53[1] = v38;
  v52[2] = CFSTR("severeCrashTimestamp");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *((double *)self->_details.__ptr_.__value_ + 4)));
  v53[2] = v39;
  v52[3] = CFSTR("alphaDetectorDecision");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_details.__ptr_.__value_ + 40)));
  v53[3] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 4));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v41);

  -[CSMartyDetectionService sendRemoteSampleToCompanion:epochTs:epochNumber:](self, "sendRemoteSampleToCompanion:epochTs:epochNumber:", v7, a3, v4);
  v42 = v51;
  if (v51)
  {
    v43 = (unint64_t *)&v51->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = *(std::__shared_weak_count **)v57;
  if (*(_QWORD *)v57)
  {
    v46 = (unint64_t *)(*(_QWORD *)v57 + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
}

- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5
{
  CLKappaAlgFlowController *value;
  id v10;
  void *v11;
  int8x16_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::createRemoteSample(value, (uint64_t)&v12);
    if (v15)
    {
      v12.i32[2] = a5;
      v13 = a3;
      v14 = a4;
      v10 = sub_100018418(&v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v11, 401);

    }
  }
}

- (BOOL)shouldKeepTriggerTTR
{
  optional<float> v3;
  float var1;
  uint64_t v5;
  int v6;
  NSObject *v7;
  BOOL result;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  __int16 v13;
  double v14;

  v3 = -[CSPersistentConfiguration getFloatDefault:](self->_persist, "getFloatDefault:", CFSTR("MartyTTRTriggerOnlyPopupRate"));
  if ((*(_QWORD *)&v3 & 0xFF00000000) != 0)
    var1 = v3.var0.var1;
  else
    var1 = 0.2;
  -[CSPersistentConfiguration doubleForKey:](self->_persist, "doubleForKey:", CFSTR("MartyLastTTRTriggerTimestamp"));
  v5 = -[CSMartyDetectionService daysSinceTimestamp:](self, "daysSinceTimestamp:");
  v6 = v5;
  if (v5 >= 1 && -[CSMartyDetectionService coinflip:](self, "coinflip:", var1))
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v7 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109376;
      v12 = v6;
      v13 = 2048;
      v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trigger chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
    }
    return 1;
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v9 = qword_100387348;
    v10 = os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v10)
    {
      v11 = 67109376;
      v12 = v6;
      v13 = 2048;
      v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trigger not chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)shouldKeepCrashTTR
{
  optional<float> v3;
  uint64_t v4;
  int v5;
  float var1;
  NSObject *v7;
  BOOL result;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  __int16 v13;
  double v14;

  v3 = -[CSPersistentConfiguration getFloatDefault:](self->_persist, "getFloatDefault:", CFSTR("MartyTTREarlyCrashPopupRate"));
  -[CSPersistentConfiguration doubleForKey:](self->_persist, "doubleForKey:", CFSTR("MartyLastTTREarlyCrashTimestamp"));
  v4 = -[CSMartyDetectionService daysSinceTimestamp:](self, "daysSinceTimestamp:");
  v5 = v4;
  if ((*(_QWORD *)&v3 & 0xFF00000000) != 0)
    var1 = v3.var0.var1;
  else
    var1 = 1.0;
  if (v4 >= 1 && -[CSMartyDetectionService coinflip:](self, "coinflip:", var1))
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v7 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109376;
      v12 = v5;
      v13 = 2048;
      v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "early crash chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
    }
    return 1;
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v9 = qword_100387348;
    v10 = os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v10)
    {
      v11 = 67109376;
      v12 = v5;
      v13 = 2048;
      v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "early crash not chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
      return 0;
    }
  }
  return result;
}

- (int)getDeescalationPath
{
  CLKappaAlgFlowController *value;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  int v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _Unwind_Exception *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  value = self->fFlowControl.__ptr_.__value_;
  if (!value)
  {
    v18 = (_Unwind_Exception *)sub_10026C6E8();
    sub_10000A718((uint64_t)&v23);
    _Unwind_Resume(v18);
  }
  v3 = *((_QWORD *)value + 52);
  v4 = (std::__shared_weak_count *)*((_QWORD *)value + 53);
  v23 = v3;
  v24 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v3 + 152))(&v19);
  sub_10025E048((uint64_t)&v19, &v21);
  v7 = v20;
  if (v20)
  {
    v8 = (unint64_t *)&v20->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v22;
  v11 = *(_DWORD *)(v21 + 192);
  if (v22)
  {
    v12 = (unint64_t *)&v22->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v14 = v24;
  if (v24)
  {
    v15 = (unint64_t *)&v24->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v11;
}

- (void)stopSession:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v6;
  CSMSLDataRecording *mslRecording;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int MartyToken;
  int MartyAlphaCrashToken;
  int MartyEarlyCrashToken;
  int MartyPunchThruToken;
  MartySessionDetails *value;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  unsigned int v23;
  unsigned int v24;
  char v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  int v33;
  MartySessionDetails *v34;
  uint64_t v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  CompanionDeviceInfo *v41;
  CSMSLDataRecording *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CompanionUUID *v52;
  CSMSLDataRecording *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  CSMSLDataRecording *v58;
  double companionTriggerTime;
  void *v60;
  void *v61;
  CSMSLDataRecording *v62;
  void *v63;
  id v64;
  NSObject *v65;
  _BOOL4 v66;
  id v67;
  _BOOL4 v68;
  id v69;
  NSObject *v70;
  void *v71;
  uint8_t buf[16];
  const __CFString *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  const __CFString *v77;
  void *v78;
  _QWORD v79[9];
  _QWORD v80[9];
  _QWORD v81[5];
  _QWORD v82[5];

  if (self->_detectionEvent >= 2)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v3 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "subsequent detection events cannot take tokens or update metadata", buf, 2u);
    }
    return;
  }
  v6 = -[CSMartyDetectionService shouldUploadRecording](self, "shouldUploadRecording");
  mslRecording = self->_mslRecording;
  v81[0] = CFSTR("algsEndTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v82[0] = v8;
  v81[1] = CFSTR("curationAlgBitmap");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", *((unsigned __int8 *)self->_details.__ptr_.__value_ + 9)));
  v82[1] = v9;
  v81[2] = CFSTR("samplingBitmap");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6));
  v82[2] = v10;
  v81[3] = CFSTR("shouldUploadIndependentlyOfSOS");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (_DWORD)v6 != 0));
  v82[3] = v11;
  v81[4] = CFSTR("deescalationPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CSMartyDetectionService getDeescalationPath](self, "getDeescalationPath")));
  v82[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v82, v81, 5));
  -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v13);

  if ((_DWORD)v6 && self->_mslRecording && self->_companionUUID.__ptr_.__value_)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v14 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "requesting companion to upload", buf, 2u);
    }
    -[CSMartyDetectionService requestCompanionUpload:](self, "requestCompanionUpload:", 0);
  }
  MartyToken = getMartyToken(0);
  MartyAlphaCrashToken = getMartyAlphaCrashToken(0);
  MartyEarlyCrashToken = getMartyEarlyCrashToken(0);
  MartyPunchThruToken = getMartyPunchThruToken(0);
  value = self->_details.__ptr_.__value_;
  if (*((_BYTE *)value + 41))
    v20 = 1;
  else
    v20 = *((_BYTE *)value + 45) != 0;
  if (*((_BYTE *)value + 40))
    v21 = 1;
  else
    v21 = *((_BYTE *)value + 44) != 0;
  if (*((_BYTE *)value + 42))
    v22 = 1;
  else
    v22 = *((unsigned __int8 *)value + 46) != 0;
  v23 = -[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl");
  v24 = v23;
  v25 = !v22;
  if (MartyPunchThruToken < 1)
    v25 = 1;
  if ((v25 & 1) != 0)
  {
    v27 = !v20;
    if (MartyEarlyCrashToken < 1)
      v27 = 1;
    if ((v27 & 1) != 0)
    {
      v29 = !v21;
      if (MartyAlphaCrashToken < 1)
        v29 = 1;
      if ((v29 & 1) != 0)
      {
        if (MartyToken < 1)
        {
          if ((v23 & 1) == 0)
          {
            v69 = sub_100263114();
            v70 = objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "non-ttr collection stopping early", buf, 2u);
            }

            goto LABEL_61;
          }
          v32 = 0;
          if (v22)
            goto LABEL_55;
          goto LABEL_84;
        }
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v31 = qword_100387348;
        if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "acquiring trigger token", buf, 2u);
        }
        getMartyToken(1);
      }
      else
      {
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v30 = qword_100387348;
        if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "acquiring alpha crash token", buf, 2u);
        }
        getMartyAlphaCrashToken(1);
      }
    }
    else
    {
      if (qword_100387340 != -1)
        dispatch_once(&qword_100387340, &stru_100361118);
      v28 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "acquiring early crash token", buf, 2u);
      }
      getMartyEarlyCrashToken(1);
    }
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v26 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "escalation, using punchthru token", buf, 2u);
    }
    getMartyPunchThruToken(1);
  }
  if (v24)
  {
    v32 = 1;
    if (v22)
    {
LABEL_55:
      v33 = 0;
      v34 = self->_details.__ptr_.__value_;
      v35 = 4;
LABEL_56:
      *((_QWORD *)v34 + 7) = v35;
      goto LABEL_57;
    }
LABEL_84:
    if (v20 || v21)
    {
      if (-[CSMartyDetectionService shouldKeepCrashTTR](self, "shouldKeepCrashTTR"))
      {
        v34 = self->_details.__ptr_.__value_;
        v33 = 0;
        if (v20)
          v35 = 3;
        else
          v35 = 2;
        goto LABEL_56;
      }
      v64 = sub_100263114();
      v65 = objc_claimAutoreleasedReturnValue(v64);
      v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG);
      if ((v32 & 1) != 0)
      {
        if (v66)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "_mslRecording.shouldDeleteTTR = YES", buf, 2u);
        }
LABEL_97:

        -[CSMSLDataRecording setShouldDeleteTTR:](self->_mslRecording, "setShouldDeleteTTR:", 1);
        v33 = 0;
        goto LABEL_57;
      }
      if (v66)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "alpha/early ttr not selected, stopping early", buf, 2u);
      }
    }
    else
    {
      if (-[CSMartyDetectionService shouldKeepTriggerTTR](self, "shouldKeepTriggerTTR"))
      {
        v33 = 0;
        v34 = self->_details.__ptr_.__value_;
        v35 = 1;
        goto LABEL_56;
      }
      v67 = sub_100263114();
      v65 = objc_claimAutoreleasedReturnValue(v67);
      v68 = os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG);
      if ((v32 & 1) != 0)
      {
        if (v68)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "_mslRecording.shouldDeleteTTR = YES", buf, 2u);
        }
        goto LABEL_97;
      }
      if (v68)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "trigger ttr not selected, stopping early", buf, 2u);
      }
    }

    v33 = 1;
LABEL_57:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
    v37 = objc_msgSend(v36, "isAuthorizedToCollectData");

    if (((v33 | v37 ^ 1) & 1) == 0 && ((v32 ^ 1) & 1) == 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v38, 2, 0));
      -[CSMSLDataRecording setUrlToCopyToOnStop:](self->_mslRecording, "setUrlToCopyToOnStop:", v39);

      goto LABEL_66;
    }
    -[CSMSLDataRecording setShouldUpload:](self->_mslRecording, "setShouldUpload:", 0);
    if ((v33 & 1) == 0)
      goto LABEL_66;
LABEL_61:
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v40 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "forcefully stopping aop collection", buf, 2u);
    }
    CSAOPSvc::forceStopCollection((CSAOPSvc *)self->_aop);
  }
LABEL_66:
  v41 = self->_companionDeviceInfo.__ptr_.__value_;
  if (v41)
  {
    *((_BYTE *)self->_sessionInfoStats.__ptr_.__value_ + 24) = 1;
    v42 = self->_mslRecording;
    v80[0] = &__kCFBooleanTrue;
    v79[0] = CFSTR("companionConnected");
    v79[1] = CFSTR("companionDeviceModel");
    v43 = (_QWORD *)((char *)v41 + 8);
    if (*((char *)v41 + 31) < 0)
      v43 = (_QWORD *)*v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v43));
    v80[1] = v44;
    v79[2] = CFSTR("companionKappaDeviceType");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 8)));
    v80[2] = v71;
    v79[3] = CFSTR("companionMartyDeviceType");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 9)));
    v80[3] = v45;
    v79[4] = CFSTR("companionKappaTokenCount");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 10)));
    v80[4] = v46;
    v79[5] = CFSTR("companionMartyTokenCount");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 11)));
    v80[5] = v47;
    v79[6] = CFSTR("companionKappaArmedSeconds");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 12)));
    v80[6] = v48;
    v79[7] = CFSTR("companionMartyArmedSeconds");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 13)));
    v80[7] = v49;
    v79[8] = CFSTR("companionEnableMode");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 14)));
    v80[8] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v80, v79, 9));
    -[CSMSLDataRecording updateMetadata:](v42, "updateMetadata:", v51);

  }
  v52 = self->_companionUUID.__ptr_.__value_;
  if (v52)
  {
    v53 = self->_mslRecording;
    v75[0] = CFSTR("companionUUID");
    if (*((char *)v52 + 23) < 0)
      v52 = *(CompanionUUID **)v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v52));
    v75[1] = CFSTR("collectionUUID");
    v76[0] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    v76[1] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v76, v75, 2));
    -[CSMSLDataRecording updateMetadata:](v53, "updateMetadata:", v56);

  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v57 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "no companion marty collection", buf, 2u);
    }
    v58 = self->_mslRecording;
    v77 = CFSTR("collectionUUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    v78 = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
    -[CSMSLDataRecording updateMetadata:](v58, "updateMetadata:", v55);
  }

  companionTriggerTime = self->_companionTriggerTime;
  if (companionTriggerTime != 0.0)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)self->_details.__ptr_.__value_ - companionTriggerTime));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringValue"));

    v62 = self->_mslRecording;
    v73 = CFSTR("deltaTrigger");
    v74 = v61;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
    -[CSMSLDataRecording updateMetadata:](v62, "updateMetadata:", v63);

  }
}

- (void)stop:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  id v7;
  CLTimer *v8;
  CLTimer *sosTimer;
  _Unwind_Exception *v10;
  _QWORD v11[5];
  id buf[2];

  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v5 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stop session", (uint8_t *)buf, 2u);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 1);
  CSAOPSvc::stopDetection((uint64_t)self->_aop);
  v6 = -[CSMartyDetectionService stopSession:](self, "stopSession:", a3);
  if (!self->fFlowControl.__ptr_.__value_)
  {
    v10 = (_Unwind_Exception *)sub_10026C830(v6);

    objc_destroyWeak(buf);
    _Unwind_Resume(v10);
  }
  v7 = objc_initWeak(buf, self);
  v8 = (CLTimer *)-[CLSilo newTimer](self->_silo, "newTimer");
  sosTimer = self->_sosTimer;
  self->_sosTimer = v8;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100265DD4;
  v11[3] = &unk_10034B158;
  v11[4] = self;
  -[CLTimer setHandler:](self->_sosTimer, "setHandler:", v11);
  -[CLTimer setNextFireDelay:interval:](self->_sosTimer, "setNextFireDelay:interval:", 0.0, 1.79769313e308);

  objc_destroyWeak(buf);
}

- (BOOL)isIdle
{
  return -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState);
}

- (void)finishAnomalyEvent
{
  MartySessionDetails *value;
  CSMSLDataRecording *mslRecording;

  self->_detectionEvent = 0;
  -[CSMartyDetectionService decideToShowTTR](self, "decideToShowTTR");
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;

}

- (int64_t)daysSinceTimestamp:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v3, v5, 0));

  v7 = objc_msgSend(v6, "day");
  return (int64_t)v7;
}

- (void)decideToShowTTR
{
  NSObject *v2;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CSPersistentConfiguration *persist;
  double Current;
  const __CFString *v11;
  CSMartyTap2Radar *martyTTR;
  NSUUID *uuid;
  void *v14;
  _BOOL8 v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  NSUUID *v24;
  unsigned int v25;
  id v26;
  _BYTE buf[12];
  __int16 v28;
  unsigned int v29;

  if (!self->_aborted)
  {
    if (!self->_details.__ptr_.__value_
      || !-[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl")
      || !*((_QWORD *)self->_details.__ptr_.__value_ + 7))
    {
      return;
    }
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v4 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *((_QWORD *)self->_details.__ptr_.__value_ + 7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "show TTR %d", buf, 8u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_uuid, "UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSAnomalyEventService generateMslUrl:andSessionType:ttrManagedMsl:](CSAnomalyEventService, "generateMslUrl:andSessionType:ttrManagedMsl:", v6, 2, 1));

    v8 = *((_QWORD *)self->_details.__ptr_.__value_ + 7);
    if ((unint64_t)(v8 - 2) >= 2)
    {
      if (v8 == 1)
      {
        persist = self->_persist;
        Current = CFAbsoluteTimeGetCurrent();
        v11 = CFSTR("MartyLastTTRTriggerTimestamp");
        goto LABEL_19;
      }
      if (v8)
        goto LABEL_20;
      sub_10026C978(buf);

      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 891, "-[CSMartyDetectionService decideToShowTTR]");
      __break(1u);
    }
    persist = self->_persist;
    Current = CFAbsoluteTimeGetCurrent();
    v11 = CFSTR("MartyLastTTREarlyCrashTimestamp");
LABEL_19:
    -[CSPersistentConfiguration setDouble:forKey:](persist, "setDouble:forKey:", v11, Current);
LABEL_20:
    -[CSMSLDataRecording writeMetadataToDisk:](self->_mslRecording, "writeMetadataToDisk:", v7);
    martyTTR = self->_martyTTR;
    uuid = self->_uuid;
    if (*((_QWORD *)self->_details.__ptr_.__value_ + 7) != 4)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](uuid, "UUIDString"));
      -[CSMartyTap2Radar showTTRWithTriggerUUID:ttrManagedFiles:withEventType:](martyTTR, "showTTRWithTriggerUUID:ttrManagedFiles:withEventType:", v16, -[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl"), *((_QWORD *)self->_details.__ptr_.__value_ + 7));
LABEL_29:

      return;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](uuid, "UUIDString"));
    v15 = -[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl");
    v26 = 0;
    -[CSMartyTap2Radar enqueueTTRWithTriggerUUID:ttrManagedFiles:error:](martyTTR, "enqueueTTRWithTriggerUUID:ttrManagedFiles:error:", v14, v15, &v26);
    v16 = v26;

    v17 = sub_100263114();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v20 = -[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        v28 = 1024;
        v29 = v20;
        v21 = "Error enqueuing TTR: %@, ttrManaged,%d";
        v22 = v19;
        v23 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v24 = self->_uuid;
      v25 = -[CSMSLDataRecording ttrManagedMsl](self->_mslRecording, "ttrManagedMsl");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v24;
      v28 = 1024;
      v29 = v25;
      v21 = "Enqueued TTR with UUID %@, ttrManaged,%d";
      v22 = v19;
      v23 = OS_LOG_TYPE_INFO;
      goto LABEL_27;
    }

    goto LABEL_29;
  }
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v2 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "do not send ttr on aborted sessions", buf, 2u);
  }
}

- (void)setRecording:(id)a3 withUUID:(id)a4
{
  void **p_vtable;
  id v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  uint8_t buf[8];
  __int16 v15;
  unsigned int v16;

  v8 = a3;
  v9 = a4;
  if (self->_hsm)
  {
    p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
    if (qword_100387340 == -1)
      goto LABEL_3;
  }
  else
  {
    sub_10026CA78(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 918, "-[CSMartyDetectionService setRecording:withUUID:]");
    __break(1u);
  }
  dispatch_once(&qword_100387340, &stru_100361118);
LABEL_3:
  v10 = (id)qword_100387348;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState);
    v12 = -[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_readingState);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v11;
    v15 = 1024;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "set recording state %d %d", buf, 0xEu);
  }

  if (-[CSHSMObjc isIn:](self->_hsm, "isIn:", self->_idleState))
  {
    objc_storeStrong((id *)&self->_mslRecording, a3);
    objc_storeStrong((id *)&self->_uuid, a4);
  }
  else
  {
    if (p_vtable[104] != (void *)-1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v13 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "recording details may only be set in idle", buf, 2u);
    }
  }

}

- (void)setUploader:(id)a3
{
  objc_storeStrong((id *)&self->_uploader, a3);
}

- (CSMartyDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6
{
  id v11;
  id v12;
  CSMSLDataRecording *mslRecording;
  CSPersistentConfiguration *v14;
  CSPersistentConfiguration *persist;
  CSCompanionServiceProtocol *v16;
  CSCompanionServiceProtocol *companionProxy;
  NSUserDefaults *v18;
  NSUserDefaults *defaults;
  id v21;

  v11 = a3;
  v12 = a4;
  v21 = a6;
  objc_storeStrong((id *)&self->_silo, a3);
  self->_aop = a5;
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;

  self->_detectionEvent = 0;
  objc_storeStrong((id *)&self->_sosSM, a6);
  v14 = (CSPersistentConfiguration *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration", v21));
  persist = self->_persist;
  self->_persist = v14;

  v16 = (CSCompanionServiceProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "proxyForService:", CFSTR("CSCompanionService")));
  companionProxy = self->_companionProxy;
  self->_companionProxy = v16;

  v18 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  defaults = self->_defaults;
  self->_defaults = v18;

  operator new();
}

- (void)dumpSample:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  double v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  int v52;
  int v53;
  float v54;
  int v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  double v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  double v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  int v74;
  id v75;
  __int16 v76;
  _BYTE v77[10];
  _BYTE v78[10];
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;

  v3 = a3;
  v4 = objc_opt_class(CSSPUAccel800);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v7 = *(void **)objc_msgSend(v5, "c_struct");
    v8 = *((float *)objc_msgSend(v5, "c_struct") + 2);
    v9 = *((float *)objc_msgSend(v5, "c_struct") + 3);
    v10 = *((float *)objc_msgSend(v5, "c_struct") + 4);
    v74 = 134218752;
    v75 = v7;
    v76 = 2048;
    *(double *)v77 = v8;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v9;
    *(_WORD *)&v78[8] = 2048;
    v79 = v10;
    v11 = "accel800 %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  v12 = objc_opt_class(CSSPUHgAccel);
  if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
  {
    v13 = v3;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v14 = *(void **)objc_msgSend(v13, "c_struct");
    v15 = *((float *)objc_msgSend(v13, "c_struct") + 2);
    v16 = *((float *)objc_msgSend(v13, "c_struct") + 3);
    v17 = *((float *)objc_msgSend(v13, "c_struct") + 4);
    v74 = 134218752;
    v75 = v14;
    v76 = 2048;
    *(double *)v77 = v15;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v16;
    *(_WORD *)&v78[8] = 2048;
    v79 = v17;
    v11 = "hgaccel %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  v18 = objc_opt_class(CSSPUAccel);
  if ((objc_opt_isKindOfClass(v3, v18) & 1) != 0)
  {
    v19 = v3;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v20 = *(void **)objc_msgSend(v19, "c_struct");
    v21 = *((float *)objc_msgSend(v19, "c_struct") + 2);
    v22 = *((float *)objc_msgSend(v19, "c_struct") + 3);
    v23 = *((float *)objc_msgSend(v19, "c_struct") + 4);
    v74 = 134218752;
    v75 = v20;
    v76 = 2048;
    *(double *)v77 = v21;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v22;
    *(_WORD *)&v78[8] = 2048;
    v79 = v23;
    v11 = "accel %llu x %.7f y %.7f z %.7f\n";
LABEL_16:
    v24 = v6;
    v25 = 42;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v74, v25);
    goto LABEL_18;
  }
  v26 = objc_opt_class(CSSPUKappaTrigger);
  if ((objc_opt_isKindOfClass(v3, v26) & 1) != 0)
  {
    v27 = v3;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v28 = (void *)*((_QWORD *)objc_msgSend(v27, "c_struct") + 1);
    v74 = 134217984;
    v75 = v28;
    v11 = "trigger %llu\n";
    v24 = v6;
    v25 = 12;
    goto LABEL_17;
  }
  v29 = objc_opt_class(CSSPUDM);
  if ((objc_opt_isKindOfClass(v3, v29) & 1) != 0)
  {
    v30 = v3;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = (id)qword_100387348;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v31 = *(void **)((char *)objc_msgSend(v30, "c_struct") + 42);
    v32 = *(float *)objc_msgSend(v30, "c_struct");
    v33 = *((float *)objc_msgSend(v30, "c_struct") + 1);
    v34 = *((float *)objc_msgSend(v30, "c_struct") + 2);
    v35 = *((float *)objc_msgSend(v30, "c_struct") + 3);
    v36 = *((float *)objc_msgSend(v30, "c_struct") + 4);
    v37 = *((float *)objc_msgSend(v30, "c_struct") + 5);
    v38 = *((float *)objc_msgSend(v30, "c_struct") + 6);
    v74 = 134219776;
    v75 = v31;
    v76 = 2048;
    *(double *)v77 = v32;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v33;
    *(_WORD *)&v78[8] = 2048;
    v79 = v34;
    v80 = 2048;
    v81 = v35;
    v82 = 2048;
    v83 = v36;
    v84 = 2048;
    v85 = v37;
    v86 = 2048;
    v87 = v38;
    v11 = "dm6 %llu %.7f %.7f %.7f %.7f %.7f %.7f %.7f\n";
    v24 = v6;
    v25 = 82;
    goto LABEL_17;
  }
  v39 = objc_opt_class(CSSPUGps);
  if ((objc_opt_isKindOfClass(v3, v39) & 1) != 0)
  {
    v40 = v3;
    v41 = sub_100263114();
    v6 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v42 = (void *)*((_QWORD *)objc_msgSend(v40, "c_struct") + 5);
    v43 = *((_QWORD *)objc_msgSend(v40, "c_struct") + 8);
    v44 = *(float *)objc_msgSend(v40, "c_struct");
    v45 = *((float *)objc_msgSend(v40, "c_struct") + 1);
    v46 = *((float *)objc_msgSend(v40, "c_struct") + 2);
    v47 = *((float *)objc_msgSend(v40, "c_struct") + 3);
    v74 = 134219264;
    v75 = v42;
    v76 = 2048;
    *(_QWORD *)v77 = v43;
    *(_WORD *)&v77[8] = 2048;
    *(double *)v78 = v44;
    *(_WORD *)&v78[8] = 2048;
    v79 = v45;
    v80 = 2048;
    v81 = v46;
    v82 = 2048;
    v83 = v47;
    v11 = "gps %llu %f %.7f %.7f %.7f %.7f\n";
    v24 = v6;
    v25 = 62;
    goto LABEL_17;
  }
  v48 = objc_opt_class(CSSPUSteps);
  if ((objc_opt_isKindOfClass(v3, v48) & 1) != 0)
  {
    v49 = v3;
    v50 = sub_100263114();
    v6 = objc_claimAutoreleasedReturnValue(v50);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v51 = *(void **)objc_msgSend(v49, "c_struct");
    v52 = *((_DWORD *)objc_msgSend(v49, "c_struct") + 2);
    v53 = *((_DWORD *)objc_msgSend(v49, "c_struct") + 3);
    v54 = *((float *)objc_msgSend(v49, "c_struct") + 4);
    v55 = *((unsigned __int8 *)objc_msgSend(v49, "c_struct") + 20);
    v74 = 134219008;
    v75 = v51;
    v76 = 1024;
    *(_DWORD *)v77 = v52;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v53;
    *(_WORD *)v78 = 2048;
    *(double *)&v78[2] = v54;
    LOWORD(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 2) = v55;
    v11 = "steps %llu %d %d %.7f %d\n";
    v24 = v6;
    v25 = 40;
    goto LABEL_17;
  }
  v56 = objc_opt_class(CSSPUSpl);
  if ((objc_opt_isKindOfClass(v3, v56) & 1) != 0)
  {
    v57 = v3;
    v58 = sub_100263114();
    v6 = objc_claimAutoreleasedReturnValue(v58);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v59 = *(void **)objc_msgSend(v57, "c_struct");
    v60 = *((float *)objc_msgSend(v57, "c_struct") + 2);
    v74 = 134218240;
    v75 = v59;
    v76 = 2048;
    *(double *)v77 = v60;
    v11 = "SPL %llu %f\n";
    goto LABEL_42;
  }
  v61 = objc_opt_class(CSSPUPressure);
  if ((objc_opt_isKindOfClass(v3, v61) & 1) != 0)
  {
    v62 = v3;
    v63 = sub_100263114();
    v6 = objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v64 = *(void **)objc_msgSend(v62, "c_struct");
    v65 = *((float *)objc_msgSend(v62, "c_struct") + 2);
    v74 = 134218240;
    v75 = v64;
    v76 = 2048;
    *(double *)v77 = v65;
    v11 = "pressure %llu %f\n";
    goto LABEL_42;
  }
  v66 = objc_opt_class(CSSignificantUserInteraction);
  if ((objc_opt_isKindOfClass(v3, v66) & 1) != 0)
  {
    v67 = v3;
    v68 = sub_100263114();
    v6 = objc_claimAutoreleasedReturnValue(v68);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    v74 = 134218240;
    v75 = objc_msgSend(v67, "timestamp");
    v76 = 1024;
    *(_DWORD *)v77 = objc_msgSend(v67, "type");
    v11 = "SUI %llu %u\n";
    v24 = v6;
    v25 = 18;
    goto LABEL_17;
  }
  v69 = objc_opt_class(CSSPURoadInfo);
  if ((objc_opt_isKindOfClass(v3, v69) & 1) == 0)
    goto LABEL_19;
  v70 = v3;
  v71 = sub_100263114();
  v6 = objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v72 = *(void **)objc_msgSend(v70, "c_struct");
    v73 = *((_QWORD *)objc_msgSend(v70, "c_struct") + 1);
    v74 = 134218240;
    v75 = v72;
    v76 = 2048;
    *(_QWORD *)v77 = v73;
    v11 = "roads %llu %f\n";
LABEL_42:
    v24 = v6;
    v25 = 22;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
}

- (void)feedAccel800:(id)a3
{
  CSSPUAccel800 *v4;
  CSSPUAccel800 *v5;
  id v6;

  v4 = (CSSPUAccel800 *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedFastAccel(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026CB78(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1075, "-[CSMartyDetectionService feedAccel800:]");
    __break(1u);
  }
}

- (void)feedHgAccel:(id)a3
{
  CSSPUHgAccel *v4;
  CSSPUHgAccel *v5;
  id v6;

  v4 = (CSSPUHgAccel *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHgAccel(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026CC78(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1083, "-[CSMartyDetectionService feedHgAccel:]");
    __break(1u);
  }
}

- (void)feedAccel:(id)a3
{
  id v3;
  CSMartyDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSMartyDetectionService *)sub_10026CD78();
    -[CSMartyDetectionService feedDeviceMotion:](v4, v5, v6);
  }
}

- (void)feedDeviceMotion:(id)a3
{
  CSSPUDM *v4;
  CSSPUDM *v5;
  id v6;

  v4 = (CSSPUDM *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedDM(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026CEC0(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1101, "-[CSMartyDetectionService feedDeviceMotion:]");
    __break(1u);
  }
}

- (void)feedGPS:(id)a3
{
  CSSPUGps *v4;
  CSSPUGps *v5;
  MartySessionDetails *value;
  int v7;
  NSObject *v8;
  int v9;
  uint8_t buf[8];

  v4 = (CSSPUGps *)a3;
  v5 = v4;
  if (!v4)
  {
    sub_10026CFC0(buf);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1110, "-[CSMartyDetectionService feedGPS:]");
    __break(1u);
LABEL_9:
    dispatch_once(&qword_100387340, &stru_100361118);
    goto LABEL_4;
  }
  value = self->_details.__ptr_.__value_;
  v7 = *((_DWORD *)value + 12);
  if (v7)
    goto LABEL_7;
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 16) = *((unsigned __int8 *)-[CSSPUGps c_struct](v4, "c_struct")
                                                              + 32);
  if (qword_100387340 != -1)
    goto LABEL_9;
LABEL_4:
  v8 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
  {
    v9 = *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 16);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SessionInfo signal %d", buf, 8u);
  }
  value = self->_details.__ptr_.__value_;
  v7 = *((_DWORD *)value + 12);
LABEL_7:
  *((_DWORD *)value + 12) = v7 + 1;
  CLKappaAlgFlowController::feedGPS(self->fFlowControl.__ptr_.__value_, v5);

}

- (void)feedSteps:(id)a3
{
  CSSPUSteps *v4;
  CSSPUSteps *v5;
  id v6;

  v4 = (CSSPUSteps *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedSteps(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D0C0(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1125, "-[CSMartyDetectionService feedSteps:]");
    __break(1u);
  }
}

- (void)feedKappaTrigger:(id)a3
{
  CSSPUKappaTrigger *v4;
  CSSPUKappaTrigger *v5;
  id v6;

  v4 = (CSSPUKappaTrigger *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrigger(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D1C0(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1134, "-[CSMartyDetectionService feedKappaTrigger:]");
    __break(1u);
  }
}

- (void)feedMag:(id)a3
{
  id v3;
  CSMartyDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSMartyDetectionService *)sub_10026D2C0();
    -[CSMartyDetectionService feedPressure:](v4, v5, v6);
  }
}

- (void)feedPressure:(id)a3
{
  CSSPUPressure *v4;
  CSSPUPressure *v5;
  id v6;

  v4 = (CSSPUPressure *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedPressure(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D408(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1150, "-[CSMartyDetectionService feedPressure:]");
    __break(1u);
  }
}

- (void)feedSoundPressureLevel:(id)a3
{
  CSSPUSpl *v4;
  CSSPUSpl *v5;
  id v6;

  v4 = (CSSPUSpl *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedAudioRms(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D508(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1159, "-[CSMartyDetectionService feedSoundPressureLevel:]");
    __break(1u);
  }
}

- (void)feedTrustedAudioResult:(id)a3
{
  CSSPUTrustedAudioResult *v4;
  CSSPUTrustedAudioResult *v5;
  id v6;

  v4 = (CSSPUTrustedAudioResult *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrustedAudioResult(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D608(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1168, "-[CSMartyDetectionService feedTrustedAudioResult:]");
    __break(1u);
  }
}

- (void)feedSignificantUserInteraction:(id)a3
{
  id v3;
  CSMartyDetectionService *v4;
  SEL v5;
  id v6;

  v3 = a3;
  if (v3)
  {

  }
  else
  {
    v4 = (CSMartyDetectionService *)sub_10026D708();
    -[CSMartyDetectionService feedRoads:](v4, v5, v6);
  }
}

- (void)feedRoads:(id)a3
{
  CSSPURoadInfo *v4;
  CSSPURoadInfo *v5;
  id v6;

  v4 = (CSSPURoadInfo *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRoads(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D850(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1184, "-[CSMartyDetectionService feedRoads:]");
    __break(1u);
  }
}

- (void)feedHertzSample:(id)a3
{
  CSSPUHertzSample *v4;
  CSSPUHertzSample *v5;
  id v6;

  v4 = (CSSPUHertzSample *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHertzSample(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026D950(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1192, "-[CSMartyDetectionService feedHertzSample:]");
    __break(1u);
  }
}

- (void)feedCompanionStatus:(id)a3
{
  CSCompanionStatus *v4;
  CSCompanionStatus *v5;
  id v6;

  v4 = (CSCompanionStatus *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedCompanionStatus(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026DA50(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1200, "-[CSMartyDetectionService feedCompanionStatus:]");
    __break(1u);
  }
}

- (void)feedRemoteSample:(id)a3
{
  CSRemoteSample *v4;
  CSRemoteSample *v5;
  id v6;

  v4 = (CSRemoteSample *)a3;
  v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRemoteSample(self->fFlowControl.__ptr_.__value_, v4);

  }
  else
  {
    sub_10026DB50(&v6);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1208, "-[CSMartyDetectionService feedRemoteSample:]");
    __break(1u);
  }
}

- (void)feedSortedSamples:(id)a3
{
  id v4;
  unint64_t i;
  CLKappaAlgFlowController *value;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  _BYTE buf[24];

  v4 = a3;
  for (i = 0; (unint64_t)objc_msgSend(v4, "count") > i; ++i)
  {
    value = self->fFlowControl.__ptr_.__value_;
    if (!value)
    {
      sub_10026DC50(buf);

      abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1217, "-[CSMartyDetectionService feedSortedSamples:]");
      __break(1u);
LABEL_51:
      dispatch_once(&qword_100387340, &stru_100361118);
LABEL_47:
      v28 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "stop consuming samples", buf, 2u);
      }
      break;
    }
    if (!*((_BYTE *)value + 8))
    {
      if (qword_100387340 == -1)
        goto LABEL_47;
      goto LABEL_51;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
    v8 = objc_opt_class(CSSPUAccel800);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedAccel800:](self, "feedAccel800:", v9);
LABEL_31:

      goto LABEL_32;
    }
    v10 = objc_opt_class(CSSPUAccel);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedAccel:](self, "feedAccel:", v9);
      goto LABEL_31;
    }
    v11 = objc_opt_class(CSSPUHgAccel);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedHgAccel:](self, "feedHgAccel:", v9);
      goto LABEL_31;
    }
    v12 = objc_opt_class(CSSPUKappaTrigger);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v9 = v7;
      if ((char)-[NSObject meta](v9, "meta") < 0)
      {
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v15 = (id)qword_100387348;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = -[NSObject timestamp](v9, "timestamp");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "ignoring stop trigger from aop %llu", buf, 0xCu);
        }

      }
      else
      {
        -[CSMartyDetectionService feedKappaTrigger:](self, "feedKappaTrigger:", v9);
      }
      goto LABEL_31;
    }
    v13 = objc_opt_class(CSSPUDM);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedDeviceMotion:](self, "feedDeviceMotion:", v9);
      goto LABEL_31;
    }
    v14 = objc_opt_class(CSSPUGps);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedGPS:](self, "feedGPS:", v9);
      goto LABEL_31;
    }
    v17 = objc_opt_class(CSSPUSteps);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedSteps:](self, "feedSteps:", v9);
      goto LABEL_31;
    }
    v18 = objc_opt_class(CSSPUSpl);
    if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedSoundPressureLevel:](self, "feedSoundPressureLevel:", v9);
      goto LABEL_31;
    }
    v19 = objc_opt_class(CSSPUTrustedAudioResult);
    if ((objc_opt_isKindOfClass(v7, v19) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedTrustedAudioResult:](self, "feedTrustedAudioResult:", v9);
      goto LABEL_31;
    }
    v20 = objc_opt_class(CSSPUPressure);
    if ((objc_opt_isKindOfClass(v7, v20) & 1) != 0)
    {
      v9 = v7;
      -[CSMartyDetectionService feedPressure:](self, "feedPressure:", v9);
      goto LABEL_31;
    }
    v21 = objc_opt_class(CSSignificantUserInteraction);
    if ((objc_opt_isKindOfClass(v7, v21) & 1) != 0)
    {
      -[CSMartyDetectionService feedSignificantUserInteraction:](self, "feedSignificantUserInteraction:", v7);
    }
    else
    {
      v22 = objc_opt_class(CSSPURoadInfo);
      if ((objc_opt_isKindOfClass(v7, v22) & 1) != 0)
      {
        v9 = v7;
        -[CSMartyDetectionService feedRoads:](self, "feedRoads:", v9);
        goto LABEL_31;
      }
      v23 = objc_opt_class(CSSPUHertzSample);
      if ((objc_opt_isKindOfClass(v7, v23) & 1) != 0)
      {
        v9 = v7;
        -[CSMartyDetectionService feedHertzSample:](self, "feedHertzSample:", v9);
        goto LABEL_31;
      }
      v24 = objc_opt_class(CSCompanionStatus);
      if ((objc_opt_isKindOfClass(v7, v24) & 1) != 0)
      {
        v9 = v7;
        -[CSMartyDetectionService feedCompanionStatus:](self, "feedCompanionStatus:", v9);
        goto LABEL_31;
      }
      v25 = objc_opt_class(CSRemoteSample);
      if ((objc_opt_isKindOfClass(v7, v25) & 1) != 0)
      {
        v9 = v7;
        -[CSMartyDetectionService feedRemoteSample:](self, "feedRemoteSample:", v9);
        goto LABEL_31;
      }
      v26 = objc_opt_class(CSSPUMag);
      if ((objc_opt_isKindOfClass(v7, v26) & 1) == 0)
      {
        v27 = sub_100263114();
        v9 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CSMartyDetectionService ignoring %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:

  }
}

- (void)feedLocationManagerResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  float v11;
  MartySessionInfo *value;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a3;
  v5 = v4;
  if (self->_mslRecording)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    objc_msgSend(v6, "coordinate");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    objc_msgSend(v9, "coordinate");
    v11 = v10;

    value = self->_sessionInfoStats.__ptr_.__value_;
    *(float *)&v8 = v8;
    *((_DWORD *)value + 1) = LODWORD(v8);
    *((float *)value + 2) = v11;
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v13 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "coarse location cannot be stored: IS=0 or IS=1 and not the first session in the recording", v14, 2u);
    }
  }

}

- (BOOL)coinflip:(double)a3
{
  NSObject *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  double v13;
  __int16 v14;
  double v15;

  if (a3 >= 0.0 && a3 <= 1.0)
  {
    v7 = drand48();
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v8 = v7 * 100.0;
    v9 = a3 * 100.0;
    v10 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v12 = 134218240;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "coin flip = %f, rbound = %f", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v6) = v8 <= v9 && v8 >= 0.0;
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v5 = qword_100387348;
    v6 = os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "invalid rate specified", (uint8_t *)&v12, 2u);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)printSamplingDefaults
{
  double v2;
  float v4;
  float v5;
  NSObject *v6;
  double v7;
  float v8;
  float v9;
  NSObject *v10;
  double v11;
  float v12;
  float v13;
  NSObject *v14;
  double v15;
  float v16;
  float v17;
  NSObject *v18;
  double v19;
  float v20;
  float v21;
  NSObject *v22;
  int v23;
  double v24;

  LODWORD(v2) = 981668463;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyPerfStandaloneScarifAcceptanceRate"), v2);
  v5 = v4;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v6 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "performance standalone rate %f", (uint8_t *)&v23, 0xCu);
  }
  LODWORD(v7) = 0.75;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyPerfPairedScarifAcceptanceRate"), v7);
  v9 = v8;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v10 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance paired sampling rate %f", (uint8_t *)&v23, 0xCu);
  }
  LODWORD(v11) = 0;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyCurStandaloneScarifAcceptanceRate"), v11);
  v13 = v12;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v14 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "curation standalone rate %f", (uint8_t *)&v23, 0xCu);
  }
  LODWORD(v15) = 1.0;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyCurCrashDetectedAcceptanceRatePaired"), v15);
  v17 = v16;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v18 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "curation paired decision rate %f", (uint8_t *)&v23, 0xCu);
  }
  LODWORD(v19) = 1.0;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyCurCrashDetectedAcceptanceRateStandalone"), v19);
  v21 = v20;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v22 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v23 = 134217984;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "curation standalone decision rate %f", (uint8_t *)&v23, 0xCu);
  }
}

- (BOOL)getForceDecision:(id)a3
{
  id v4;
  unsigned __int16 v5;
  unsigned __int8 v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  int v13;

  v4 = a3;
  v5 = (unsigned __int16)-[CSPersistentConfiguration getBooleanDefault:](self->_persist, "getBooleanDefault:", v4);
  v6 = v5;
  if (v5 >= 0x100u)
  {
    v7 = v5 != 0;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v8 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 1024;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "forcing %@ decision to %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)curationSampling
{
  CSMartyDetectionService *v2;
  void **p_vtable;
  double v4;
  float v5;
  CompanionDeviceInfo *value;
  float v7;
  float v8;
  NSObject *v9;
  double v10;
  const char *v11;
  float v12;
  NSObject *v13;
  double v14;
  double v15;
  float v16;
  uint8_t v18[24];

  if (!self->fFlowControl.__ptr_.__value_)
  {
    sub_10026DD50();
LABEL_24:
    dispatch_once(&qword_100387340, &stru_100361118);
    goto LABEL_10;
  }
  v2 = self;
  value = self->_companionDeviceInfo.__ptr_.__value_;
  if (value && *((_DWORD *)value + 8))
  {
    if (!*((_BYTE *)self->_details.__ptr_.__value_ + 42))
      return 0;
    LODWORD(v4) = 1.0;
    -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyCurCrashDetectedAcceptanceRatePaired"), v4);
    v8 = v7;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v9 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v10 = v8;
      *(_DWORD *)v18 = 134217984;
      *(double *)&v18[4] = v10;
      v11 = "curation paired severe crash decision rate %f";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, v18, 0xCu);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  LODWORD(v4) = 0;
  -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyCurStandaloneScarifAcceptanceRate"), v4);
  v5 = v12;
  p_vtable = &OBJC_METACLASS___CSHSMObjc.vtable;
  if (qword_100387340 != -1)
    goto LABEL_24;
LABEL_10:
  v13 = qword_100387348;
  v14 = v5;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v18 = 134217984;
    *(double *)&v18[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "curation standalone rate %f", v18, 0xCu);
  }
  if (-[CSMartyDetectionService coinflip:](v2, "coinflip:", v14))
    return 1;
  if (*((_BYTE *)v2->_details.__ptr_.__value_ + 42))
  {
    LODWORD(v15) = 1.0;
    -[CSMartyDetectionService querySamplingRate:withDefault:](v2, "querySamplingRate:withDefault:", CFSTR("MartyCurCrashDetectedAcceptanceRateStandalone"), v15);
    v8 = v16;
    if (p_vtable[104] != (void *)-1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v9 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v10 = v8;
      *(_DWORD *)v18 = 134217984;
      *(double *)&v18[4] = v10;
      v11 = "curation standalone alpha detector decision rate %f";
      goto LABEL_18;
    }
LABEL_19:
    v10 = v8;
LABEL_20:
    if (-[CSMartyDetectionService coinflip:](v2, "coinflip:", v10, *(_OWORD *)v18))
      return 1;
  }
  return 0;
}

- (int)performanceSampling
{
  double v2;
  CompanionDeviceInfo *value;
  float v5;
  float v6;
  NSObject *v7;
  double v8;
  const char *v9;
  float v10;
  uint8_t v12[24];

  value = self->_companionDeviceInfo.__ptr_.__value_;
  if (value && *((_DWORD *)value + 8))
  {
    LODWORD(v2) = 0.75;
    -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyPerfPairedScarifAcceptanceRate"), v2);
    v6 = v5;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v7 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v8 = v6;
      *(_DWORD *)v12 = 134217984;
      *(double *)&v12[4] = v8;
      v9 = "performance paired sampling rate %f";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, v12, 0xCu);
      goto LABEL_13;
    }
  }
  else
  {
    LODWORD(v2) = 981668463;
    -[CSMartyDetectionService querySamplingRate:withDefault:](self, "querySamplingRate:withDefault:", CFSTR("MartyPerfStandaloneScarifAcceptanceRate"), v2);
    v6 = v10;
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v7 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
    {
      v8 = v6;
      *(_DWORD *)v12 = 134217984;
      *(double *)&v12[4] = v8;
      v9 = "performance standalone rate %f";
      goto LABEL_11;
    }
  }
  v8 = v6;
LABEL_13:
  if (-[CSMartyDetectionService coinflip:](self, "coinflip:", v8, *(_OWORD *)v12))
    return 2;
  else
    return 0;
}

- (unsigned)shouldUploadRecording
{
  unsigned __int8 v3;

  v3 = -[CSMartyDetectionService curationSampling](self, "curationSampling");
  return -[CSMartyDetectionService performanceSampling](self, "performanceSampling") | v3;
}

- (void)requestDeviceInfo
{
  id v3;
  void *v4;
  int v5;

  v5 = rand();
  v3 = MartyCompanion::serializeDeviceInfoRequest(&v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v4, 303);

}

- (void)requestCompanionUpload:(int)a3
{
  CompanionUUID *value;
  id v6;
  void *v7;
  std::string __p;
  int v9;

  value = self->_companionUUID.__ptr_.__value_;
  if (value)
  {
    if (*((char *)value + 23) < 0)
      value = *(CompanionUUID **)value;
    sub_100007088(&__p, (char *)value);
    v9 = a3;
    v6 = MartyCompanion::serializeRequestUpload(&__p);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v7, 304);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)sendDeviceInfo
{
  void *v3;
  unsigned int v4;
  id v5;
  char *v6;
  int v7;
  NSObject *v8;
  CSArmedClients *v9;
  NSObject *v10;
  const CompanionDeviceInfo *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *__p;
  char v16;
  int v17;
  int v18;
  int KappaToken;
  int MartyToken;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v4 = objc_msgSend(v3, "getSystemHardware");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSystemModel")));
  v6 = (char *)objc_msgSend(v5, "UTF8String");

  if ((objc_msgSend(v3, "isKappaLoggingDevice") & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v3, "isKappaDetectionDevice") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v8 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid kappa device type detected", (uint8_t *)&v14, 2u);
    }
    v7 = -1;
  }
  v9 = objc_alloc_init(CSArmedClients);
  if ((CSAOPSvc::getArmedClients((id *)self->_aop, v9) & 1) == 0)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v10 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to get armed clients state", (uint8_t *)&v14, 2u);
    }
  }
  v14 = v4;
  sub_100007088(&__p, v6);
  v17 = v7;
  v18 = 0;
  KappaToken = getKappaToken(0);
  MartyToken = getMartyToken(0);
  v21 = -[CSArmedClients kappaArmedSeconds](v9, "kappaArmedSeconds");
  v22 = -[CSArmedClients martyArmedSecondsLocal](v9, "martyArmedSecondsLocal");
  v23 = -[CSArmedClients enableMode](v9, "enableMode");
  v12 = MartyCompanion::serializeDeviceInfo((MartyCompanion *)&v14, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v13, 300);

  if (v16 < 0)
    operator delete(__p);

}

- (void)sendCompanionUUID:(id)a3
{
  id v4;
  const CompanionUUID *v5;
  id v6;
  void *v7;
  std::string __p;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString")));
  sub_100007088(&__p, (char *)objc_msgSend(v4, "UTF8String"));

  v6 = MartyCompanion::serializeCompanionUUID(&__p, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v7, 302);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

- (void)receiveUUID:(id)a3
{
  MartyCompanion::deserializeCompanionUUID((MartyCompanion *)a3, (const NSData *)a2);
}

- (void)receiveCompanionTrigger:(id)a3
{
  CompanionTrigger *v4;
  CompanionTrigger *value;
  CompanionTrigger *v6;
  _QWORD v7[2];

  MartyCompanion::deserializeTrigger((MartyCompanion *)a3, (const NSData *)a2);
  v4 = (CompanionTrigger *)v7[0];
  v7[0] = 0;
  value = self->_companionTrigger.__ptr_.__value_;
  self->_companionTrigger.__ptr_.__value_ = v4;
  if (value)
    operator delete();
  v6 = self->_companionTrigger.__ptr_.__value_;
  if ((*((_BYTE *)v6 + 54) & 4) == 0)
  {
    LOWORD(v7[0]) = 3;
    BYTE2(v7[0]) = 4;
    v7[1] = *((_QWORD *)v6 + 2);
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, (const unsigned __int8 *)v7, 0x10u);
    self->_companionTriggerTime = *(double *)self->_companionTrigger.__ptr_.__value_;
  }
  -[CSMartyDetectionService cacheUserInfo](self, "cacheUserInfo", v7[0]);
}

- (void)sendCompanionTrigger:(id)a3
{
  id v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const CompanionTrigger *v11;
  id v12;
  void *v13;
  CFAbsoluteTime Current;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  if (!v4)
  {
    sub_10026DE90(&Current);

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm", 1567, "-[CSMartyDetectionService sendCompanionTrigger:]");
    __break(1u);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (__int128 *)objc_msgSend(v4, "c_struct");
  v6 = *v5;
  v7 = v5[1];
  v17 = v5[2];
  v16 = v7;
  v15 = v6;
  v8 = v5[3];
  v9 = v5[4];
  v10 = v5[5];
  v21 = v5[6];
  v20 = v10;
  v19 = v9;
  v18 = v8;
  v12 = MartyCompanion::serializeTrigger((float16x4_t *)&Current, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CSCompanionServiceProtocol sendData:type:](self->_companionProxy, "sendData:type:", v13, 301);

}

- (void)receiveDeviceInfo:(id)a3
{
  MartyCompanion *v3;
  NSObject *v4;
  const NSData *v5;
  uint8_t buf[16];

  v3 = (MartyCompanion *)a3;
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v4 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "setting companion device info", buf, 2u);
  }
  MartyCompanion::deserializeDeviceInfo(v3, v5);
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MartySessionInfo *value;
  MartySessionInfo *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  double v19;

  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v10 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = a3;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "onCompanionMessage: type: %d, msg: %@ data: %@, receivedTimestamp: %f", (uint8_t *)v13, 0x26u);
  }
  switch(a3)
  {
    case 300:
      -[CSMartyDetectionService receiveDeviceInfo:](self, "receiveDeviceInfo:", v8);
      break;
    case 301:
      -[CSMartyDetectionService receiveCompanionTrigger:](self, "receiveCompanionTrigger:", v8);
      break;
    case 302:
      -[CSMartyDetectionService receiveUUID:](self, "receiveUUID:", v8);
      break;
    case 303:
      -[CSMartyDetectionService sendDeviceInfo](self, "sendDeviceInfo");
      break;
    case 304:
      -[CSMartyDetectionService companionDecidedToUpload:](self, "companionDecidedToUpload:", v8);
      break;
    case 305:
      value = self->_sessionInfoStats.__ptr_.__value_;
      if (value)
        *((_BYTE *)value + 13) = 1;
      break;
    case 306:
      v12 = self->_sessionInfoStats.__ptr_.__value_;
      if (v12)
        *((_BYTE *)v12 + 12) = 1;
      break;
    default:
      break;
  }

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
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v8 = qword_100387348;
  if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
  {
    v15 = 67109376;
    *(_DWORD *)v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_100387340 != -1)
    dispatch_once(&qword_100387340, &stru_100361118);
  v9 = (id)qword_100387348;
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

- (void)companionDecidedToUpload:(id)a3
{
  MartyCompanion::deserializeRequestUpload((MartyCompanion *)a3, (const NSData *)a2);
}

- (void)uploadUserInfoToCoreAnalyticsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  NSObject *v10;
  unint64_t userInfoUploadCadence;
  MartyUserInfo *value;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  unsigned int v43;
  _QWORD v44[24];
  _QWORD v45[24];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_100361158);
  v5 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "sendUserInfoToCoreAnalytics", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v7 = objc_msgSend(v6, "isAuthorizedForIS");

  +[CSCoreAnalyticsUtils getSecondsSinceReboot](CSCoreAnalyticsUtils, "getSecondsSinceReboot");
  v9 = v8;
  if (v8 > (double)self->_userInfoUploadCadence)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361158);
    v10 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      userInfoUploadCadence = self->_userInfoUploadCadence;
      *(_DWORD *)buf = 134217984;
      v41 = userInfoUploadCadence;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "secondsSinceReboot exceeds UserInfo cadence. Capping at cadence pd:%llu", buf, 0xCu);
    }
    v9 = (double)self->_userInfoUploadCadence;
  }
  -[CSMartyDetectionService _updateArmingTimes](self, "_updateArmingTimes");
  if (+[CSCoreAnalyticsUtils shouldAttemptCoreAnalyticsUploadWithInterval:persistentKey:](CSCoreAnalyticsUtils, "shouldAttemptCoreAnalyticsUploadWithInterval:persistentKey:", CFSTR("CSMartyCoreAnalyticsLastSuccessfulUpload"), (double)self->_userInfoUploadCadence))
  {
    if (v7 && (value = self->_userInfoStats.__ptr_.__value_) != 0)
    {
      v44[0] = CFSTR("didEnableKappaDetection");
      v45[0] = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)value + 2)));
      v44[1] = CFSTR("didEnableKappaDetection_companion");
      v38 = (void *)v45[0];
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_userInfoStats.__ptr_.__value_ + 3)));
      v45[1] = v37;
      v44[2] = CFSTR("isImproveSafetyEnabled");
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(_BYTE *)self->_userInfoStats.__ptr_.__value_));
      v45[2] = v36;
      v44[3] = CFSTR("isImproveSafetyEnabled_companion");
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_userInfoStats.__ptr_.__value_ + 1)));
      v45[3] = v35;
      v44[4] = CFSTR("numKappaSessions");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 3)));
      v45[4] = v34;
      v44[5] = CFSTR("numKappaSessions_companion");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 4)));
      v45[5] = v33;
      v44[6] = CFSTR("numKappaTriggersAllSessions");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 1)));
      v45[6] = v32;
      v44[7] = CFSTR("numKappaTriggersAllSessions_companion");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 2)));
      v45[7] = v31;
      v44[8] = CFSTR("numMartySessionsCycle");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 6)));
      v45[8] = v30;
      v44[9] = CFSTR("numMartySessionsMotorbike");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 7)));
      v45[9] = v29;
      v44[10] = CFSTR("numMartySessionsCycle_companion");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 8)));
      v45[10] = v28;
      v44[11] = CFSTR("numMartySessionsMotorbike_companion");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 9)));
      v45[11] = v27;
      v44[12] = CFSTR("numMartyTriggersAllSessionsCycle");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 10)));
      v45[12] = v26;
      v44[13] = CFSTR("numMartyTriggersAllSessionsMotorBike");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 12)));
      v45[13] = v25;
      v44[14] = CFSTR("numMartyTriggersAllSessionsCycle_companion");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 11)));
      v45[14] = v24;
      v44[15] = CFSTR("numMartyTriggersAllSessionsMotorBike_companion");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 13)));
      v45[15] = v23;
      v44[16] = CFSTR("totalDrivingTimeCycle");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 14)));
      v45[16] = v22;
      v44[17] = CFSTR("totalDrivingTimeMotorcycle");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 15)));
      v45[17] = v21;
      v44[18] = CFSTR("totalKappaDrivingTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 16)));
      v45[18] = v20;
      v44[19] = CFSTR("minutesSinceReboot_capped");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9 / 60.0));
      v45[19] = v13;
      v44[20] = CFSTR("numCrashesDetectedAllSessionsCycle");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 19)));
      v45[20] = v14;
      v44[21] = CFSTR("numCrashesDetectedAllSessionsMotorbike");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 20)));
      v45[21] = v15;
      v44[22] = CFSTR("totalDrivingTimeMotorcycleLocal");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 17)));
      v45[22] = v16;
      v44[23] = CFSTR("totalDrivingTimeMotorcycleRemote");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 18)));
      v45[23] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 24));

    }
    else
    {
      v18 = 0;
    }
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361158);
    v19 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v41 = (unint64_t)v18;
      v42 = 1024;
      v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "UserInfo:%@, ImproveSafety:%d", buf, 0x12u);
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10026A6E8;
    v39[3] = &unk_10034B220;
    v39[4] = v18;
    AnalyticsSendEventLazy(CFSTR("com.apple.MartyUserInfo"), v39);
    operator new();
  }
  if (v4)
    v4[2](v4, 1, 0);

}

- (void)_updateArmingTimes
{
  void *v3;
  unsigned __int8 v4;
  NSObject *v5;
  CSCAStat *v6;
  CSAOPSvc *aop;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
  v4 = objc_msgSend(v3, "isKappaLoggingDevice");

  if ((v4 & 1) != 0)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361158);
    v5 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "getStat not supported", (uint8_t *)&v14, 2u);
    }
    *((_QWORD *)self->_userInfoStats.__ptr_.__value_ + 7) = -1;
  }
  else
  {
    v6 = objc_alloc_init(CSCAStat);
    aop = (CSAOPSvc *)self->_aop;
    if (aop && self->_userInfoStats.__ptr_.__value_)
    {
      CSAOPSvc::getStat(aop, v6);
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 14) = -[CSCAStat armedSecMartyBicycle](v6, "armedSecMartyBicycle");
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 15) = -[CSCAStat armedSecMartyLocal](v6, "armedSecMartyLocal");
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 18) = -[CSCAStat armedSecMartyRemote](v6, "armedSecMartyRemote");
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 17) = -[CSCAStat armedSecMartyLocal](v6, "armedSecMartyLocal");
    }
    else
    {
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_100361158);
      v8 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
      {
        v9 = self->_aop != 0;
        v10 = self->_userInfoStats.__ptr_.__value_ != 0;
        v14 = 67109376;
        v15 = v9;
        v16 = 1024;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Unable to query AOP, _aop valid:%d, _userInfoStats valid:%d", (uint8_t *)&v14, 0xEu);
      }
    }

  }
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_100361158);
  v11 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    v12 = *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 14);
    v13 = *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 15);
    v14 = 67109376;
    v15 = v13;
    v16 = 1024;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "martyDrivingTimeMotorcycle:%d, martyDrivingTimeCycle:%d", (uint8_t *)&v14, 0xEu);
  }
}

- (void)sendSessionInfoToCoreAnalytics
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  MartySessionInfo *value;
  void *v7;
  double v8;
  MartySessionInfo *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  unsigned int v48;
  _QWORD v49[28];
  _QWORD v50[28];

  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_100361158);
  v3 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendSessionInfoToCoreAnalytics", buf, 2u);
  }
  if (self->_aborted)
  {
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361158);
    v4 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "aborted sessions will not be sent";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
  else
  {
    value = self->_sessionInfoStats.__ptr_.__value_;
    if (value)
    {
      if (*(_BYTE *)value)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
        v42 = objc_msgSend(v7, "isAuthorizedForIS");

        if (v42 && (v9 = self->_sessionInfoStats.__ptr_.__value_) != 0)
        {
          v49[0] = CFSTR("coarseLat");
          LODWORD(v8) = *((_DWORD *)v9 + 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
          v50[0] = v10;
          v49[1] = CFSTR("coarseLong");
          LODWORD(v11) = *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
          v50[1] = v41;
          v49[2] = CFSTR("companionEscalationDecisionCycle");
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 12)));
          v50[2] = v40;
          v49[3] = CFSTR("companionEscalationDecisionMotorbike");
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 13)));
          v50[3] = v39;
          v49[4] = CFSTR("didCompanionTriggerCycle");
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 14)));
          v50[4] = v38;
          v49[5] = CFSTR("didCompanionTriggerMotorbike");
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 15)));
          v50[5] = v37;
          v49[6] = CFSTR("didPlaceCallCycle");
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 16)));
          v50[6] = v36;
          v49[7] = CFSTR("didPlaceCallMotorbike");
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 17)));
          v50[7] = v35;
          v49[8] = CFSTR("didRaiseUICycle");
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 18)));
          v50[8] = v34;
          v49[9] = CFSTR("didRaiseUICycle_companion");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 19)));
          v50[9] = v33;
          v49[10] = CFSTR("didRaiseUIMotorbike");
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 20)));
          v50[10] = v32;
          v49[11] = CFSTR("didRaiseUIMotorbike_companion");
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 21)));
          v50[11] = v31;
          v49[12] = CFSTR("escalationDecisionCycle");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 22)));
          v50[12] = v30;
          v49[13] = CFSTR("escalationDecisionMotorbike");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 23)));
          v50[13] = v29;
          v49[14] = CFSTR("isCompanionConnected");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 24)));
          v50[14] = v28;
          v49[15] = CFSTR("isSOSAutoInitiatedCycle");
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 25)));
          v50[15] = v27;
          v49[16] = CFSTR("isSOSAutoInitiatedMotorbike");
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 26)));
          v50[16] = v26;
          v49[17] = CFSTR("isSOSUserInitiatedCycle");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 27)));
          v50[17] = v25;
          v49[18] = CFSTR("isSOSUserInitiatedMotorbike");
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 28)));
          v50[18] = v24;
          v49[19] = CFSTR("locallyArmedBitmap");
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 8)));
          v50[19] = v23;
          v49[20] = CFSTR("numAlphaDetectedCycle");
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 9)));
          v50[20] = v22;
          v49[21] = CFSTR("numAlphaDetectedMotorbike");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 10)));
          v50[21] = v21;
          v49[22] = CFSTR("numEarlyCrashesDetectedCycle");
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 11)));
          v50[22] = v12;
          v49[23] = CFSTR("numEarlyCrashesDetectedMotorbike");
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 12)));
          v50[23] = v13;
          v49[24] = CFSTR("numTriggersCycle");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 13)));
          v50[24] = v14;
          v49[25] = CFSTR("numTriggersMotorbike");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 14)));
          v50[25] = v15;
          v49[26] = CFSTR("overrideModeBitmap");
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 15)));
          v50[26] = v16;
          v49[27] = CFSTR("signalEnvironment");
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 16)));
          v50[27] = v17;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 28));

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10026B394;
          v43[3] = &unk_10034B220;
          v18 = v20;
          v44 = v18;
          AnalyticsSendEventLazy(CFSTR("com.apple.MartySession"), v43);

        }
        else
        {
          v18 = 0;
        }
        if (qword_1003873C0 != -1)
          dispatch_once(&qword_1003873C0, &stru_100361158);
        v19 = qword_1003873C8;
        if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v18;
          v47 = 1024;
          v48 = v42;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SessionInfo:%@, ImproveSafety:%d", buf, 0x12u);
        }

      }
      else
      {
        if (qword_1003873C0 != -1)
          dispatch_once(&qword_1003873C0, &stru_100361158);
        v4 = qword_1003873C8;
        if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v5 = "refusing to send a session that was forced or postRiding only";
          goto LABEL_10;
        }
      }
    }
    else
    {
      if (qword_1003873C0 != -1)
        dispatch_once(&qword_1003873C0, &stru_100361158);
      v4 = qword_1003873C8;
      if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "_sessionInfoStats is null";
        goto LABEL_10;
      }
    }
  }
}

- (void)cacheUserInfo
{
  MartyUserInfo *value;
  id v4;

  value = self->_userInfoStats.__ptr_.__value_;
  if (value)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", value, 84));
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:");

  }
}

- (void)updateMartyUserInfoWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  void *v27;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_userInfoStats.__ptr_.__value_)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isImproveSafetyEnabled")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isImproveSafetyEnabled")));
      *(_BYTE *)self->_userInfoStats.__ptr_.__value_ = objc_msgSend(v7, "BOOLValue");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isImproveSafetyEnabled_companion")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isImproveSafetyEnabled_companion")));
      *((_BYTE *)self->_userInfoStats.__ptr_.__value_ + 1) = objc_msgSend(v9, "BOOLValue");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("didEnableKappaDetection")));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("didEnableKappaDetection")));
      *((_BYTE *)self->_userInfoStats.__ptr_.__value_ + 2) = objc_msgSend(v11, "BOOLValue");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("didEnableKappaDetection_companion")));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("didEnableKappaDetection_companion")));
      *((_BYTE *)self->_userInfoStats.__ptr_.__value_ + 3) = objc_msgSend(v13, "BOOLValue");

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numTriggersAllSessions")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numTriggersAllSessions")));
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 1) = objc_msgSend(v15, "intValue");

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numTriggersAllSessions_companion")));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numTriggersAllSessions_companion")));
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 2) = objc_msgSend(v17, "intValue");

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numKappaSessions")));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numKappaSessions")));
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 3) = objc_msgSend(v19, "intValue");

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numKappaSessions_companion")));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numKappaSessions_companion")));
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 4) = objc_msgSend(v21, "intValue");

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalDrivingTime")));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalDrivingTime")));
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 16) = objc_msgSend(v23, "intValue");

    }
    if (qword_1003873C0 != -1)
      dispatch_once(&qword_1003873C0, &stru_100361158);
    v24 = qword_1003873C8;
    if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "updateMartyUserInfoWithInfo updated stats", (uint8_t *)&v26, 2u);
    }
  }
  if (qword_1003873C0 != -1)
    dispatch_once(&qword_1003873C0, &stru_100361158);
  v25 = qword_1003873C8;
  if (os_log_type_enabled((os_log_t)qword_1003873C8, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412290;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }

}

- (void)clearCAStats
{
  CSAOPSvc *aop;

  aop = (CSAOPSvc *)self->_aop;
  if (aop)
    CSAOPSvc::clearStat(aop);
}

- (id)userInfoUploader
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10026B904;
  v5[3] = &unk_1003610F8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  NSObject *v6;
  uint64_t v7;
  _BOOL4 SOSInProgress;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  int64_t v17;

  if (a4 == 2)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v6 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      v16 = 134217984;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didReceiveSOSAck response:%ld", (uint8_t *)&v16, 0xCu);
    }
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 0x65) != 0)
      {
        self->_SOSInProgress = 1;
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v7 = qword_100387348;
        if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
        {
          SOSInProgress = self->_SOSInProgress;
          v16 = 67109120;
          LODWORD(v17) = SOSInProgress;
          v9 = "didReceiveSOSAck setting _SOSInProgress to %d";
          v10 = v7;
          v11 = OS_LOG_TYPE_INFO;
          v12 = 8;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v16, v12);
        }
      }
      else
      {
        self->_SOSInProgress = 0;
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v14 = qword_100387348;
        if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_INFO))
        {
          v15 = self->_SOSInProgress;
          v16 = 67109120;
          LODWORD(v17) = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didReceiveSOSAck setting _SOSInProgress to %d", (uint8_t *)&v16, 8u);
        }
        -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", &off_10036DCF8);
        -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 5, 0);
      }
    }
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v13 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v9 = "sos status ack invalid mode";
      v10 = v13;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 2;
      goto LABEL_16;
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  _UNKNOWN **v16;
  NSObject *v17;
  MartySessionInfo *value;
  NSObject *v19;
  CSMSLDataRecording *mslRecording;
  void *v21;
  void *v22;
  MartySessionInfo *v23;
  CSMSLDataRecording *v24;
  void *v25;
  void *v26;
  MartySessionInfo *v27;
  CSMSLDataRecording *v28;
  void *v29;
  void *v30;
  _BOOL4 SOSInProgress;
  unsigned int v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  _BYTE v41[10];
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  unsigned int v46;

  v4 = a4;
  v6 = a3;
  if (v4 == 2)
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v7 = (id)qword_100387348;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
      v9 = objc_msgSend(v8, "flowState");
      v10 = objc_msgSend(v6, "isKappaFlow");
      v11 = objc_msgSend(v6, "isKappaFlowActive");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)v41 = v9;
      *(_WORD *)&v41[8] = 1024;
      v42 = v10;
      v43 = 1024;
      v44 = v11;
      v45 = 1024;
      v46 = objc_msgSend(v12, "isPairedDeviceStatus");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate state:%ld, isKappaFlow:%d, isKappaFlowActive:%d isFromPaired:%d", buf, 0x1Eu);

    }
    if ((objc_msgSend(v6, "isKappaFlow") & 1) == 0)
    {
      if (qword_100387340 != -1)
        dispatch_once(&qword_100387340, &stru_100361118);
      v13 = qword_100387348;
      if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received non-Kappa flow state from SOS SM (should never happen)", buf, 2u);
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosStatus"));
    v15 = objc_msgSend(v14, "isPairedDeviceStatus");

    switch((unint64_t)objc_msgSend(v6, "sosKappaState"))
    {
      case 1uLL:
        if (v15)
          v16 = &off_10036DD48;
        else
          v16 = &off_10036DD20;
        -[CSMSLDataRecording updateMetadata:](self->_mslRecording, "updateMetadata:", v16);
        if (qword_100387340 != -1)
          dispatch_once(&qword_100387340, &stru_100361118);
        v17 = qword_100387348;
        if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v41 = v15 ^ 1;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate SOSKappaStateUserCheckIn isLocal %d", buf, 8u);
        }
        value = self->_sessionInfoStats.__ptr_.__value_;
        if (*((_BYTE *)self->_details.__ptr_.__value_ + 8))
        {
          if ((v15 & 1) != 0)
            *((_BYTE *)value + 19) = 1;
          else
            *((_BYTE *)value + 18) = 1;
        }
        else if ((v15 & 1) != 0)
        {
          *((_BYTE *)value + 21) = 1;
        }
        else
        {
          *((_BYTE *)value + 20) = 1;
        }
        break;
      case 3uLL:
        mslRecording = self->_mslRecording;
        v38 = CFSTR("userResponse");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState")));
        v39 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
        -[CSMSLDataRecording updateMetadata:](mslRecording, "updateMetadata:", v22);

        v23 = self->_sessionInfoStats.__ptr_.__value_;
        if (*((_BYTE *)self->_details.__ptr_.__value_ + 8))
        {
          *((_BYTE *)v23 + 16) = 1;
          *((_BYTE *)v23 + 27) = 1;
        }
        else
        {
          *((_BYTE *)v23 + 17) = 1;
          *((_BYTE *)v23 + 28) = 1;
        }
        break;
      case 4uLL:
        v24 = self->_mslRecording;
        v36 = CFSTR("userResponse");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState")));
        v37 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        -[CSMSLDataRecording updateMetadata:](v24, "updateMetadata:", v26);

        v27 = self->_sessionInfoStats.__ptr_.__value_;
        if (*((_BYTE *)self->_details.__ptr_.__value_ + 8))
        {
          *((_BYTE *)v27 + 16) = 1;
          *((_BYTE *)v27 + 25) = 1;
        }
        else
        {
          *((_BYTE *)v27 + 17) = 1;
          *((_BYTE *)v27 + 26) = 1;
        }
        break;
      case 6uLL:
        v28 = self->_mslRecording;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "sosKappaState", CFSTR("userResponse"))));
        v35 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
        -[CSMSLDataRecording updateMetadata:](v28, "updateMetadata:", v30);

        break;
      default:
        break;
    }
    SOSInProgress = self->_SOSInProgress;
    if (self->_SOSInProgress)
    {
      v32 = 1;
    }
    else
    {
      v32 = objc_msgSend(v6, "isKappaFlowActive");
      self->_SOSInProgress = v32;
    }
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v33 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v41 = SOSInProgress;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "prev %d, current %d", buf, 0xEu);
    }
    if (SOSInProgress && !v32)
      -[CSHSMObjc signal:data:](self->_hsm, "signal:data:", 5, 0);
  }
  else
  {
    if (qword_100387340 != -1)
      dispatch_once(&qword_100387340, &stru_100361118);
    v19 = qword_100387348;
    if (os_log_type_enabled((os_log_t)qword_100387348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "sos status update for invalid mode", buf, 2u);
    }
  }

}

- (CSMSLDataRecording)mslRecording
{
  return self->_mslRecording;
}

- (void)setMslRecording:(id)a3
{
  objc_storeStrong((id *)&self->_mslRecording, a3);
}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (void).cxx_destruct
{
  MartySessionDetails *value;
  MartySessionInfo *v4;
  MartyUserInfo *v5;
  CompanionUUID *v6;
  CompanionTrigger *v7;
  CompanionDeviceInfo *v8;
  CLKappaAlgFlowController *v9;

  objc_storeStrong((id *)&self->_companionProxy, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value)
    operator delete();
  v4 = self->_sessionInfoStats.__ptr_.__value_;
  self->_sessionInfoStats.__ptr_.__value_ = 0;
  if (v4)
    operator delete();
  v5 = self->_userInfoStats.__ptr_.__value_;
  self->_userInfoStats.__ptr_.__value_ = 0;
  if (v5)
    operator delete();
  objc_storeStrong((id *)&self->_uuid, 0);
  v6 = self->_companionUUID.__ptr_.__value_;
  self->_companionUUID.__ptr_.__value_ = 0;
  if (v6)
    sub_100011294((uint64_t)&self->_companionUUID, (uint64_t)v6);
  v7 = self->_companionTrigger.__ptr_.__value_;
  self->_companionTrigger.__ptr_.__value_ = 0;
  if (v7)
    operator delete();
  v8 = self->_companionDeviceInfo.__ptr_.__value_;
  self->_companionDeviceInfo.__ptr_.__value_ = 0;
  if (v8)
    sub_10026C4A8((uint64_t)&self->_companionDeviceInfo, (uint64_t)v8);
  v9 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v9)
    (*(void (**)(CLKappaAlgFlowController *))(*(_QWORD *)v9 + 8))(v9);
  objc_storeStrong((id *)&self->_sosTimer, 0);
  objc_storeStrong((id *)&self->_triggerTimer, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_persist, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_sosSM, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_martyTTR, 0);
  objc_storeStrong(&self->_waitForSOSState, 0);
  objc_storeStrong(&self->_readingState, 0);
  objc_storeStrong(&self->_idleState, 0);
  objc_storeStrong((id *)&self->_hsm, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 21) = 0;
  return self;
}

@end

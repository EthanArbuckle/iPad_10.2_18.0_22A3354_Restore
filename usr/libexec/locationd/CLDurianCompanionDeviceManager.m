@implementation CLDurianCompanionDeviceManager

- (CLDurianCompanionDeviceManager)init
{
  -[CLDurianCompanionDeviceManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianCompanionDeviceManager)initWithUniverse:(id)a3
{
  CLDurianCompanionDeviceManager *v3;
  SPOwnerSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLDurianCompanionDeviceManager;
  v3 = -[CLDurianCompanionDeviceManager init](&v6, "init", a3);
  if (v3)
  {
    v4 = objc_opt_new(SPOwnerSession);
    v3->_lastObservedBeacon = 0;
    v3->_lastObservedType = 0;
    v3->_ownerSession = v4;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianCompanionDeviceManager;
  -[CLDurianCompanionDeviceManager dealloc](&v3, "dealloc");
}

- (void)onCompanionObservationWithType:(int64_t)a3
{
  SEL v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9[2];
  id location;
  __int16 v11;
  const char *v12;

  v5 = NSSelectorFromString(CFSTR("activeCompanionWithCompletion:"));
  if ((objc_opt_respondsToSelector(self->_ownerSession, v5) & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_101534D94;
    v8[3] = &unk_1021BCB90;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a3;
    -[SPOwnerSession performSelector:withObject:](self->_ownerSession, "performSelector:withObject:", v5, v8);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCBB0);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      location = (id)68289026;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #companion owner session deosn't respond to activeCompanionWithCompletion:\"}", (uint8_t *)&location, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCBB0);
    }
    v7 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      location = (id)68289026;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #companion owner session deosn't respond to activeCompanionWithCompletion:", "{\"msg%{public}.0s\":\"#durian #companion owner session deosn't respond to activeCompanionWithCompletion:\"}", (uint8_t *)&location, 0x12u);
    }
  }
}

- (CLDurianDeviceObservationDelegate)deviceObservationDelegate
{
  return self->_deviceObservationDelegate;
}

- (void)setDeviceObservationDelegate:(id)a3
{
  self->_deviceObservationDelegate = (CLDurianDeviceObservationDelegate *)a3;
}

- (SPOwnerSession)ownerSession
{
  return (SPOwnerSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOwnerSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)lastObservedBeacon
{
  return self->_lastObservedBeacon;
}

- (void)setLastObservedBeacon:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)lastObservedType
{
  return self->_lastObservedType;
}

- (void)setLastObservedType:(int64_t)a3
{
  self->_lastObservedType = a3;
}

@end

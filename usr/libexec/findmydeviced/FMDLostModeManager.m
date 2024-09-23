@implementation FMDLostModeManager

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1003063E8 != -1)
    dispatch_once(&qword_1003063E8, &stru_1002C1608);
  v2 = (void *)qword_1003063E0;
  if (!qword_1003063E0)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMDLostModeManager singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1003063E0;
  }
  return v2;
}

- (FMDLostModeManager)init
{
  id v3;
  NSObject *v4;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100225C60(v4);

  return 0;
}

- (id)initSingleton
{
  FMDLostModeManager *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMDLostModeManager;
  v2 = -[FMDLostModeManager init](&v15, "init");
  if (v2)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100225C9C(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = objc_alloc_init((Class)FMStateCapture);
    -[FMDLostModeManager setStateCapture:](v2, "setStateCapture:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager stateCapture](v2, "stateCapture"));
    objc_msgSend(v13, "setStateCaptureBlock:", &stru_1002C1628);

    -[FMDLostModeManager _loadLostModeInfo](v2, "_loadLostModeInfo");
    -[FMDLostModeManager _updateLocationServicesState](v2, "_updateLocationServicesState");
    objc_storeStrong((id *)&qword_1003063E0, v2);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)qword_1003063E0;
  qword_1003063E0 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMDLostModeManager;
  -[FMDLostModeManager dealloc](&v6, "dealloc");
}

- (void)enableLostModeWithMessage:(id)a3 ownerNumber:(id)a4 facetimeCapable:(BOOL)a5 enableLocationServices:(BOOL)a6 turnOffStatusBarIconAfterLostMode:(BOOL)a7
{
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  int v20;
  EmbeddedOSSupport *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  __CFNotificationCenter *DarwinNotifyCenter;
  unsigned int v35;
  id v36;
  uint8_t buf[16];

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v13 = a3;
  v14 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenMessage](self, "lockScreenMessage"));
  if (v15 != v13)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenMessage](self, "lockScreenMessage"));
    if (!objc_msgSend(v13, "isEqualToString:", v7))
    {
      v16 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenOwnerNumber](self, "lockScreenOwnerNumber"));
  if (v17 == v14)
  {
    v16 = 0;
  }
  else
  {
    v35 = v9;
    v18 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenOwnerNumber](self, "lockScreenOwnerNumber"));
    v20 = (objc_msgSend(v14, "isEqualToString:", v19) & 1) == 0
       && -[FMDLostModeManager lockScreenFacetimeCapable](self, "lockScreenFacetimeCapable") == v10;

    v16 = v20;
    v8 = v18;
    v9 = v35;
  }

  if (v15 != v13)
    goto LABEL_11;
LABEL_12:

  -[FMDLostModeManager setLostModeEnabled:](self, "setLostModeEnabled:", 1);
  -[FMDLostModeManager setLockScreenMessage:](self, "setLockScreenMessage:", v13);
  -[FMDLostModeManager setLockScreenOwnerNumber:](self, "setLockScreenOwnerNumber:", v14);
  -[FMDLostModeManager setLockScreenFacetimeCapable:](self, "setLockScreenFacetimeCapable:", v10);
  -[FMDLostModeManager setEnableLocationServices:](self, "setEnableLocationServices:", v9);
  -[FMDLostModeManager _updateLocationServicesState](self, "_updateLocationServicesState");
  if (!-[FMDLostModeManager turnStatusBarIconOffAfterLostMode](self, "turnStatusBarIconOffAfterLostMode"))
    -[FMDLostModeManager setTurnStatusBarIconOffAfterLostMode:](self, "setTurnStatusBarIconOffAfterLostMode:", v8);
  -[FMDLostModeManager _storeLostModeInfo](self, "_storeLostModeInfo");
  v21 = objc_opt_new(EmbeddedOSSupport);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[EmbeddedOSSupport disableBiometricID](v21, "disableBiometricID"));

  v23 = sub_1000031B8();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  if (v22)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100225D50((uint64_t)v22, v25);
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Disabled biometric ID after entering lost mode", buf, 2u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "iCloudACAccount"));

  v36 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "credentialWithError:", &v36));
  v29 = v36;
  v30 = v29;
  if (!v27 || v29)
  {
    v31 = sub_1000031B8();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_100225CCC((uint64_t)v27, (uint64_t)v30, v32);

  }
  else
  {
    objc_msgSend(v28, "setCredentialItem:forKey:", 0, ACRawPasswordKey);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v33, "postNotificationName:object:", CFSTR("com.apple.AOSNotification.LostModeInfoChanged"), 0);

  if (v16)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
  }

}

- (void)_updateLocationServicesState
{
  unsigned int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = -[FMDLostModeManager enableLocationServices](self, "enableLocationServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager locationServicesAssertion](self, "locationServicesAssertion"));

  if (v3)
  {
    if (!v4)
    {
      v5 = sub_1000031B8();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accquiring emergency location services assertion", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
      v8 = +[CLEmergencyEnablementAssertion newAssertionForBundle:withReason:](CLEmergencyEnablementAssertion, "newAssertionForBundle:withReason:", v7, CFSTR("LostMode"));
      -[FMDLostModeManager setLocationServicesAssertion:](self, "setLocationServicesAssertion:", v8);

    }
  }
  else if (v4)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Releasing the emergency location services assertion", v12, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLostModeManager locationServicesAssertion](self, "locationServicesAssertion"));
    objc_msgSend(v11, "invalidate");

    -[FMDLostModeManager setLocationServicesAssertion:](self, "setLocationServicesAssertion:", 0);
  }
}

- (void)_storeLostModeInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];

  if (-[FMDLostModeManager lostModeEnabled](self, "lostModeEnabled"))
  {
    v15[0] = CFSTR("lostModeEnabled");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDLostModeManager lostModeEnabled](self, "lostModeEnabled")));
    v16[0] = v3;
    v15[1] = CFSTR("lostModeMessage");
    v4 = objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenMessage](self, "lockScreenMessage"));
    v5 = (void *)v4;
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = &stru_1002CD590;
    v16[1] = v6;
    v15[2] = CFSTR("lostModeOwnerNumber");
    v7 = objc_claimAutoreleasedReturnValue(-[FMDLostModeManager lockScreenOwnerNumber](self, "lockScreenOwnerNumber"));
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1002CD590;
    v16[2] = v9;
    v15[3] = CFSTR("lostModeFacetimeCapable");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDLostModeManager lockScreenFacetimeCapable](self, "lockScreenFacetimeCapable")));
    v16[3] = v10;
    v15[4] = off_100304600;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDLostModeManager enableLocationServices](self, "enableLocationServices")));
    v16[4] = v11;
    v15[5] = off_100304608;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDLostModeManager turnStatusBarIconOffAfterLostMode](self, "turnStatusBarIconOffAfterLostMode")));
    v16[5] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 6));

  }
  else
  {
    v13 = 0;
  }
  +[FMDPreferencesMgr setLostModeInfo:](FMDPreferencesMgr, "setLostModeInfo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPSharedStateManager sharedInstance](FMDFMIPSharedStateManager, "sharedInstance"));
  objc_msgSend(v14, "recalculateLostMode");

}

- (void)_loadLostModeInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr lostModeInfo](FMDPreferencesMgr, "lostModeInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lostModeEnabled")));
  -[FMDLostModeManager setLostModeEnabled:](self, "setLostModeEnabled:", objc_msgSend(v3, "BOOLValue"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lockScreenMessage")));
  -[FMDLostModeManager setLockScreenMessage:](self, "setLockScreenMessage:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lockScreenOwnerNumber")));
  -[FMDLostModeManager setLockScreenOwnerNumber:](self, "setLockScreenOwnerNumber:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lostModeFacetimeCapable")));
  -[FMDLostModeManager setLockScreenFacetimeCapable:](self, "setLockScreenFacetimeCapable:", objc_msgSend(v6, "BOOLValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100304600));
  -[FMDLostModeManager setEnableLocationServices:](self, "setEnableLocationServices:", objc_msgSend(v7, "BOOLValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", off_100304608));
  -[FMDLostModeManager setTurnStatusBarIconOffAfterLostMode:](self, "setTurnStatusBarIconOffAfterLostMode:", objc_msgSend(v8, "BOOLValue"));

}

- (void)disableLostMode
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lost mode is being disabled", buf, 2u);
  }

  if (-[FMDLostModeManager enableLocationServices](self, "enableLocationServices"))
  {
    -[FMDLostModeManager setEnableLocationServices:](self, "setEnableLocationServices:", 0);
    -[FMDLostModeManager _updateLocationServicesState](self, "_updateLocationServicesState");
  }
  if (-[FMDLostModeManager turnStatusBarIconOffAfterLostMode](self, "turnStatusBarIconOffAfterLostMode"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Turning off status bar icon since it was off before the device entered lost mode", v8, 2u);
    }

    +[CLLocationManager setStatusBarIconEnabled:forLocationEntityClass:](CLLocationManager, "setStatusBarIconEnabled:forLocationEntityClass:", 0, 4);
    -[FMDLostModeManager setTurnStatusBarIconOffAfterLostMode:](self, "setTurnStatusBarIconOffAfterLostMode:", 0);
  }
  -[FMDLostModeManager setLostModeEnabled:](self, "setLostModeEnabled:", 0);
  -[FMDLostModeManager _storeLostModeInfo](self, "_storeLostModeInfo");
  -[FMDLostModeManager _loadLostModeInfo](self, "_loadLostModeInfo");
  +[FMDMessage stopAllSounds](FMDMessage, "stopAllSounds");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002C1648);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kLostModeChangedNotification, 0, 0, 1u);
}

- (BOOL)lostModeEnabled
{
  return self->_lostModeEnabled;
}

- (void)setLostModeEnabled:(BOOL)a3
{
  self->_lostModeEnabled = a3;
}

- (NSString)lockScreenMessage
{
  return self->_lockScreenMessage;
}

- (void)setLockScreenMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenMessage, a3);
}

- (NSString)lockScreenOwnerNumber
{
  return self->_lockScreenOwnerNumber;
}

- (void)setLockScreenOwnerNumber:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenOwnerNumber, a3);
}

- (BOOL)lockScreenFacetimeCapable
{
  return self->_lockScreenFacetimeCapable;
}

- (void)setLockScreenFacetimeCapable:(BOOL)a3
{
  self->_lockScreenFacetimeCapable = a3;
}

- (BOOL)enableLocationServices
{
  return self->_enableLocationServices;
}

- (void)setEnableLocationServices:(BOOL)a3
{
  self->_enableLocationServices = a3;
}

- (BOOL)turnStatusBarIconOffAfterLostMode
{
  return self->_turnStatusBarIconOffAfterLostMode;
}

- (void)setTurnStatusBarIconOffAfterLostMode:(BOOL)a3
{
  self->_turnStatusBarIconOffAfterLostMode = a3;
}

- (CLAssertion)locationServicesAssertion
{
  return self->_locationServicesAssertion;
}

- (void)setLocationServicesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_locationServicesAssertion, a3);
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_locationServicesAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenOwnerNumber, 0);
  objc_storeStrong((id *)&self->_lockScreenMessage, 0);
}

@end

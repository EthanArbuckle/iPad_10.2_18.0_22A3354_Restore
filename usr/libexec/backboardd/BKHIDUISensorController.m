@implementation BKHIDUISensorController

- (BKHIDUISensorController)initWithSensorConfiguration:(id)a3 displayBrightnessController:(id)a4
{
  id v7;
  id v8;
  BKHIDUISensorController *v9;
  BKHIDUISensorController *v10;
  uint64_t v11;
  BKSHIDUISensorMode *launchTimeLockedMode;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKHIDUISensorController;
  v9 = -[BKHIDUISensorController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_sensor, a3);
    objc_storeStrong((id *)&v10->_displayBrightnessController, a4);
    v11 = objc_claimAutoreleasedReturnValue(+[BKSHIDUISensorMode buildModeForReason:builder:](BKSHIDUISensorMode, "buildModeForReason:builder:", CFSTR("backboardd launch"), &stru_1000EAA98));
    launchTimeLockedMode = v10->_launchTimeLockedMode;
    v10->_launchTimeLockedMode = (BKSHIDUISensorMode *)v11;

    os_unfair_lock_lock(&v10->_lock);
    sub_100044958((uint64_t)v10, v10->_launchTimeLockedMode);
    os_unfair_lock_unlock(&v10->_lock);
  }

  return v10;
}

- (id)sensorCharacteristics
{
  id v3;

  v3 = objc_alloc_init((Class)BKSMutableHIDUISensorCharacteristics);
  -[BKHIDUISensorConfiguring updateCharacteristics:](self->_sensor, "updateCharacteristics:", v3);
  return v3;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  return -[BKHIDUISensorConfiguring supportsProximityLPAEventTransitions](self->_sensor, "supportsProximityLPAEventTransitions");
}

- (void)resetCalibration
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BKHIDUISensorConfiguring resetCalibration](self->_sensor, "resetCalibration");
  os_unfair_lock_unlock(p_lock);
}

- (void)applySensorMode:(id)a3 requestOrigin:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  BKSHIDUISensorMode *launchTimeLockedMode;
  _QWORD block[5];

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  sub_100044958((uint64_t)self, v7);

  if (a4 == 1 && self->_launchTimeLockedMode)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100044C04;
    block[3] = &unk_1000ECDA8;
    block[4] = self;
    if (qword_100117318 != -1)
      dispatch_once(&qword_100117318, block);
    v8 = (id)qword_100117320;
    sub_100044958((uint64_t)self, v8);

    launchTimeLockedMode = self->_launchTimeLockedMode;
    self->_launchTimeLockedMode = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (id)addSensorModeChangeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  uint64_t v6;
  BSCompoundAssertion *observerAssertion;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  id v10;
  void *v11;
  void *v12;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:](BSCompoundAssertion, "assertionWithIdentifier:", CFSTR("BKUISensor.prox-observers")));
    v9 = self->_observerAssertion;
    self->_observerAssertion = v8;

    observerAssertion = self->_observerAssertion;
  }
  v10 = objc_msgSend((id)objc_opt_class(v5, v6), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion acquireForReason:withContext:](observerAssertion, "acquireForReason:withContext:", v11, v5));

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (unint64_t)requestEstimatedProximityEventsWithTimeout:(double)a3 versionedPID:(int64_t)a4
{
  unint64_t v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  BKUISensorClient *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  unsigned int v36;
  _QWORD v37[5];
  _QWORD handler[5];
  NSObject *v39;
  _BYTE buf[24];
  void *v41;
  id v42;
  int64_t v43;

  v6 = (unint64_t)self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (v6)
  {
    os_unfair_lock_assert_owner(p_lock);
    if (objc_msgSend(*(id *)(v6 + 64), "proximityDetectionMode") != 5)
    {
      v11 = BKLogUISensor();
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v10 = "Ignoring request for estimated prox events: we're not locked";
        goto LABEL_24;
      }
LABEL_7:

      v6 = 2;
      goto LABEL_8;
    }
    if (objc_msgSend(*(id *)(v6 + 64), "displayState") == (id)3)
    {
      v8 = BKLogUISensor();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v10 = "Ignoring request for estimated prox events: display state is .InactiveOn";
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    v13 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    v14 = *(_QWORD *)(v6 + 56);
    v15 = BKLogUISensor();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Restarting estimated prox timer with timeout %gs", buf, 0xCu);
      }

      dispatch_source_set_timer(*(dispatch_source_t *)(v6 + 56), v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      v6 = 1;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting estimated prox timer with timeout %gs", buf, 0xCu);
      }

      if (objc_msgSend((id)v6, "estimatedProxPowerAssertionID"))
      {
        v18 = BKLogUISensor();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v36 = objc_msgSend((id)v6, "estimatedProxPowerAssertionID");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v36;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Trying to enable estimated proximity events, but we already have a power assertion taken out with id: %d", buf, 8u);
        }

      }
      else
      {
        LODWORD(handler[0]) = 0;
        LODWORD(v37[0]) = 1;
        v20 = IOPMAssertionDeclareSystemActivity(CFSTR("com.apple.backboardd.pocketDetection"), handler, v37);
        v21 = BKLogUISensor();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        v23 = v22;
        if (v20)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[BKHIDUISensorController _locked_requestEstimatedProximityEventsWithTimeout:versionedPID:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s - Unable to take estimated prox power assertion - returned %#x", buf, 0x12u);
          }

          v24 = 0;
        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = handler[0];
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Acquired estimated prox power assertion with id: %d", buf, 8u);
          }

          v24 = LODWORD(handler[0]);
        }
        objc_msgSend((id)v6, "setEstimatedProxPowerAssertionID:", v24);
      }
      v25 = sub_100044364(v6, (void *)a4, 1);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = (id *)v26;
      if (v26)
      {
        v28 = *(void **)(v26 + 8);
        v29 = v28;
        objc_storeStrong(v27 + 2, v28);
      }
      else
      {
        v29 = 0;
      }
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_100044A74;
      v41 = &unk_1000EAB20;
      v42 = v29;
      v43 = a4;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDUISensorMode buildModeForReason:builder:](BKSHIDUISensorMode, "buildModeForReason:builder:", CFSTR("estimatedProx"), buf));
      sub_100044A54((uint64_t)v27, v31);
      sub_1000445B8(v6, *(void **)(v6 + 64));
      v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      dispatch_source_set_timer(v32, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100044AFC;
      handler[3] = &unk_1000ECD80;
      handler[4] = v6;
      v33 = v32;
      v39 = v33;
      dispatch_source_set_event_handler(v33, handler);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100044BA8;
      v37[3] = &unk_1000ECDA8;
      v37[4] = v6;
      dispatch_source_set_cancel_handler(v33, v37);
      v34 = *(void **)(v6 + 56);
      *(_QWORD *)(v6 + 56) = v33;
      v35 = v33;

      dispatch_resume(v35);
      v6 = 0;
    }
  }
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)requestProximityStatusEventForReason:(id)a3 versionedPID:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *versionedPIDToClient;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[2];
  __int16 v26;
  __int16 v27;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v8 = v7;
  if (self)
  {
    os_unfair_lock_assert_owner(p_lock);
    if (-[BKSHIDUISensorMode proximityDetectionMode](self->_prevailingMode, "proximityDetectionMode") != 5)
    {
      v13 = BKLogUISensor();
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v27 = 0;
        v11 = "Ignoring request for status event: we're not locked";
        v12 = (uint8_t *)&v27;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (-[BKSHIDUISensorMode estimatedProximityMode](self->_prevailingMode, "estimatedProximityMode"))
    {
      v9 = BKLogUISensor();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v26 = 0;
        v11 = "Ignoring request for status event: we're in estimated prox mode";
        v12 = (uint8_t *)&v26;
LABEL_11:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (-[BKSHIDUISensorMode displayState](self->_prevailingMode, "displayState") == (id)3)
    {
      v14 = BKLogUISensor();
      v10 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v11 = "Ignoring request for status event: display state is .InactiveOn";
        v12 = buf;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    versionedPIDToClient = self->_versionedPIDToClient;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](versionedPIDToClient, "objectForKeyedSubscript:", v16));
    v18 = v17;
    if (v17)
      v17 = (_QWORD *)v17[1];
    v19 = objc_msgSend(v17, "copy");

    v20 = -[BKSHIDUISensorMode mutableCopy](self->_prevailingMode, "mutableCopy");
    objc_msgSend(v20, "setPostEventWithCurrentDetectionMask:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reason"));
    v22 = NSStringFromBSVersionedPID(a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(" + %@ (pid:%@)"), v8, v23));
    objc_msgSend(v20, "setReason:", v24);

    objc_msgSend(v20, "setVersionedPID:", a4);
    sub_100044958((uint64_t)self, v20);
    if (v19)
      sub_100044958((uint64_t)self, v19);
    else
      sub_100044504((uint64_t)self, (id)a4);

  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);
}

- (void)removeModesForVersionedPID:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100044504((uint64_t)self, (id)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_cancelEstimatedProx
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_1000440CC((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (BKHIDUISensorConfiguring)sensor
{
  return self->_sensor;
}

- (void)setSensor:(id)a3
{
  objc_storeStrong((id *)&self->_sensor, a3);
}

- (NSMutableDictionary)versionedPIDToClient
{
  return self->_versionedPIDToClient;
}

- (void)setVersionedPIDToClient:(id)a3
{
  objc_storeStrong((id *)&self->_versionedPIDToClient, a3);
}

- (BSCompoundAssertion)observerAssertion
{
  return self->_observerAssertion;
}

- (void)setObserverAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_observerAssertion, a3);
}

- (BKSHIDUISensorMode)launchTimeLockedMode
{
  return self->_launchTimeLockedMode;
}

- (void)setLaunchTimeLockedMode:(id)a3
{
  objc_storeStrong((id *)&self->_launchTimeLockedMode, a3);
}

- (BKDisplayBrightnessController)displayBrightnessController
{
  return self->_displayBrightnessController;
}

- (void)setDisplayBrightnessController:(id)a3
{
  objc_storeStrong((id *)&self->_displayBrightnessController, a3);
}

- (OS_dispatch_source)estimatedProxShutoffTimer
{
  return self->_estimatedProxShutoffTimer;
}

- (void)setEstimatedProxShutoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedProxShutoffTimer, a3);
}

- (unsigned)estimatedProxPowerAssertionID
{
  return self->_estimatedProxPowerAssertionID;
}

- (void)setEstimatedProxPowerAssertionID:(unsigned int)a3
{
  self->_estimatedProxPowerAssertionID = a3;
}

- (BKSHIDUISensorMode)prevailingMode
{
  return self->_prevailingMode;
}

- (void)setPrevailingMode:(id)a3
{
  objc_storeStrong((id *)&self->_prevailingMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevailingMode, 0);
  objc_storeStrong((id *)&self->_estimatedProxShutoffTimer, 0);
  objc_storeStrong((id *)&self->_displayBrightnessController, 0);
  objc_storeStrong((id *)&self->_launchTimeLockedMode, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);
  objc_storeStrong((id *)&self->_versionedPIDToClient, 0);
  objc_storeStrong((id *)&self->_sensor, 0);
}

+ (id)sharedInstance
{
  if (qword_100117308 != -1)
    dispatch_once(&qword_100117308, &stru_1000EAA58);
  return (id)qword_100117310;
}

@end

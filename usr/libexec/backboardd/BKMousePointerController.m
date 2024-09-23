@implementation BKMousePointerController

- (NSArray)availableDevices
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerDeviceAvailabilityMonitor deviceServices](self->_pointerDeviceAvailabilityMonitor, "deviceServices"));
  v5 = objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)hitTestRegionsDidChange:(id)a3 forDisplayUUID:(id)a4
{
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (-[NSSet count](self->_lastEventContexts, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerRegion displayUUID](self->_pointerRegion, "displayUUID"));
    v8 = a4;
    v9 = objc_msgSend(v8, "length");
    v10 = (void *)BKSDisplayUUIDMainKey;
    if (v9)
      v10 = v8;
    v11 = v10;

    v12 = objc_msgSend(v7, "isEqual:", v11);
    if (v12)
    {
      v13 = (void *)mach_absolute_time();
      sub_1000687EC((const os_unfair_lock *)self, v13, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  __IOHIDEvent *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int64_t v27;
  unsigned int v28;
  int Type;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *TimeStamp;
  uint64_t v51;
  NSObject *v52;
  void *v54;
  NSString *v55;
  void *v56;
  uint64_t v57;
  objc_class *v58;
  NSString *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  uint8_t v64[16];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  BKMousePointerController *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  int v78;
  __int16 v79;
  void *v80;

  v8 = *a3;
  if (objc_msgSend(a4, "eventSource") - 11 <= 1)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "displayUUID"));
    v11 = objc_msgSend(v10, "length");
    v12 = (void *)BKSDisplayUUIDMainKey;
    if (v11)
      v12 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerRegion displayUUID](self->_pointerRegion, "displayUUID"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      v19 = BKLogMousePointer(v16, v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "displayUUID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerRegion displayUUID](self->_pointerRegion, "displayUUID"));
        *(_DWORD *)buf = 138543618;
        v70 = v34;
        v71 = 2114;
        v72 = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "processEvent senderDisplayUUID %{public}@ pointerdisplayUUID %{public}@", buf, 0x16u);

      }
      sub_10006970C((uint64_t)self, v13);
    }
    v21 = sub_100068108((const os_unfair_lock *)self);
    os_unfair_lock_unlock(&self->_lock);
    if (v21)
    {
      v25 = BKLogMousePointer(v22, v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "ignoring events because policy", buf, 2u);
      }

      v27 = 1;
      goto LABEL_56;
    }
    sub_10006A3C0((uint64_t)self);
    v28 = objc_msgSend(a4, "eventSource");
    Type = IOHIDEventGetType(v8);
    if (v28 == 12)
    {
      v27 = 1;
      if ((Type - 6) < 2 || Type == 11)
        goto LABEL_56;
      if (Type == 17)
      {
        os_unfair_lock_lock(&self->_lock);
        if (self->_pointerRegion)
        {
          if (IOHIDEventGetType(v8) != 17)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must be a pointer event")));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v55 = NSStringFromSelector("_processTopLevelTrackpadEvent:sender:dispatcher:");
              v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
              v58 = (objc_class *)objc_opt_class(self, v57);
              v59 = NSStringFromClass(v58);
              v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
              *(_DWORD *)buf = 138544642;
              v70 = v56;
              v71 = 2114;
              v72 = v60;
              v73 = 2048;
              v74 = self;
              v75 = 2114;
              v76 = CFSTR("BKMousePointerController.m");
              v77 = 1024;
              v78 = 3299;
              v79 = 2114;
              v80 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

            }
            _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v54), "UTF8String"));
            __break(0);
            JUMPOUT(0x100018A00);
          }
          -[BKMouseEventAccumulator addTopLevelEvent:fromSender:](self->_eventAccumulator, "addTopLevelEvent:fromSender:", v8, a4);
          -[BKMousePointerAnnotationController didReceiveEventFromDevice](self->_annotationController, "didReceiveEventFromDevice");
          v30 = objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator digitizerEvents](self->_eventAccumulator, "digitizerEvents"));
          if (-[NSObject count](v30, "count"))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerRegion displayUUID](self->_pointerRegion, "displayUUID"));
            if (BSEqualObjects(v31, self->_mainDisplayUUID))
              v32 = objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay"));
            else
              v32 = objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", v31));
            v40 = (void *)v32;
            if (self->_touchPadManager)
            {
              v61 = v31;
              v62 = v30;
              v63 = v13;
              v67 = 0u;
              v68 = 0u;
              v65 = 0u;
              v66 = 0u;
              v41 = v30;
              v42 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v66;
                do
                {
                  for (i = 0; i != v43; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v66 != v44)
                      objc_enumerationMutation(v41);
                    *(_QWORD *)v64 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
                    -[BKTouchPadManager processEvent:sender:display:dispatcher:](self->_touchPadManager, "processEvent:sender:display:dispatcher:", v64, a4, v40, a5);
                  }
                  v43 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
                }
                while (v43);
              }

              v30 = v62;
              v13 = v63;
              v31 = v61;
            }

          }
          if (-[BKMouseEventAccumulator eventTypeMask](self->_eventAccumulator, "eventTypeMask"))
          {
            if ((id)-[BKMouseEventAccumulator positionType](self->_eventAccumulator, "positionType") == (id)1)
              ++self->_pointerAnimationRevisionID;
            if (-[BKMouseEventAccumulator touchingPathIndexesDidChange](self->_eventAccumulator, "touchingPathIndexesDidChange"))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKMouseEventAccumulator touchingPathIndexes](self->_eventAccumulator, "touchingPathIndexes"));
              v49 = objc_msgSend(v48, "count");

              if (v49)
                ++self->_pointerAnimationRevisionID;
            }
            sub_10006A514((uint64_t)self);
            TimeStamp = (void *)IOHIDEventGetTimeStamp(v8);
            sub_1000687EC((const os_unfair_lock *)self, TimeStamp, 1);
          }
          else
          {
            v51 = BKLogMousePointer(0, v46, v47);
            v52 = objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v64 = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "no relevant subevents in trackpad collection; ignoring event",
                v64,
                2u);
            }

          }
          os_unfair_lock_unlock(p_lock);
          v27 = 1;
        }
        else
        {
          os_unfair_lock_unlock(&self->_lock);
          v39 = BKLogMousePointer(v36, v37, v38);
          v30 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "ignoring trackpad event; display layout hasn't been initialized",
              buf,
              2u);
          }
          v27 = 0;
        }

        goto LABEL_56;
      }
      goto LABEL_26;
    }
    switch(Type)
    {
      case 6:
        os_unfair_lock_lock(&self->_lock);
        -[BKMouseEventAccumulator addScrollEvent:fromSender:](self->_eventAccumulator, "addScrollEvent:fromSender:", v8, a4);
        sub_10006A514((uint64_t)self);
        break;
      case 7:
        os_unfair_lock_lock(&self->_lock);
        -[BKMouseEventAccumulator addScaleEvent:fromSender:](self->_eventAccumulator, "addScaleEvent:fromSender:", v8, a4);
        break;
      case 17:
        os_unfair_lock_assert_not_owner(&self->_lock);
        os_unfair_lock_lock(&self->_lock);
        -[BKMouseEventAccumulator addTopLevelEvent:fromSender:](self->_eventAccumulator, "addTopLevelEvent:fromSender:", v8, a4);
        sub_10006A514((uint64_t)self);
        -[BKMousePointerAnnotationController didReceiveEventFromDevice](self->_annotationController, "didReceiveEventFromDevice");
        break;
      default:
LABEL_26:
        v27 = 0;
LABEL_56:

        return v27;
    }
    v33 = (void *)IOHIDEventGetTimeStamp(v8);
    v27 = 1;
    sub_1000687EC((const os_unfair_lock *)self, v33, 1);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_56;
  }
  return 0;
}

- (BKMousePointerController)init
{
  id v3;
  void *v4;
  BKMousePointerController *v5;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "standardConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[BKMousePointerController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (BKMousePointerController)initWithConfiguration:(id)a3
{
  BKMousePointerController *v4;
  void *v5;
  BKCADisplayMonitor *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BKCADisplayMonitor *v10;
  BKCADisplayMonitor *displayMonitor;
  uint64_t v12;
  BSInvalidatable *displayMonitorObservingAssertion;
  uint64_t v14;
  BKSLocalDefaults *localDefaults;
  uint64_t v16;
  BKHIDClientConnectionManager *HIDConnectionManager;
  uint64_t v18;
  BKTouchPadManager *touchPadManager;
  uint64_t v20;
  BKKeyboardHIDEventProcessor *keyboardEventProcessor;
  uint64_t v22;
  BKSmartCoverHIDEventProcessor *smartCoverEventProcessor;
  uint64_t v24;
  BSInvalidatable *smartCoverObservationAssertion;
  uint64_t v26;
  BKDisplayController *displayController;
  uint64_t v28;
  BSInvalidatable *displayBlankingObservationAssertion;
  uint64_t v30;
  BSInvalidatable *keyboardEventObservationAssertion;
  BKSLocalDefaults *v32;
  void *v33;
  id v34;
  id v35;
  BKSLocalDefaults *v36;
  void *v37;
  BKMousePointerController *v38;
  id v39;
  BKSLocalDefaults *v40;
  void *v41;
  id v42;
  double v43;
  uint64_t v44;
  BKOrientationManager *orientationManager;
  id *v46;
  uint64_t v47;
  BSInvalidatable *orientationManagerObservationAssertion;
  uint64_t v49;
  NSMutableArray *activePointerAnimations;
  uint64_t v51;
  NSMutableDictionary *modelUpdateSuppressionAssertionsByDisplayID;
  dispatch_queue_t v53;
  OS_dispatch_queue *pointerDeviceAvailabilityMonitorQueue;
  uint64_t v55;
  BKMousePointerDeviceAvailabilityMonitor *pointerDeviceAvailabilityMonitor;
  uint64_t v57;
  BKMousePointerAnalyticsReporter *analyticsReporter;
  BKMousePointerEventStatisticsLogger *v59;
  BKMousePointerEventStatisticsLogger *statisticsLogger;
  uint64_t v61;
  BKMousePointerServiceServer *ipcServer_do_not_access_directly;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  BKMousePointerController *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)BKMousePointerController;
  v4 = -[BKMousePointerController init](&v72, "init");
  if (v4)
  {
    objc_initWeak(&location, v4);
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_preferencesLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v4->_configuration, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayProvider"));
    v6 = [BKCADisplayMonitor alloc];
    v8 = BKLogMousePointer(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[BKCADisplayMonitor initWithDisplayProvider:log:filterPredicate:](v6, "initWithDisplayProvider:log:filterPredicate:", v5, v9, 0);
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = v10;

    v12 = objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor addObserver:](v4->_displayMonitor, "addObserver:", v4));
    displayMonitorObservingAssertion = v4->_displayMonitorObservingAssertion;
    v4->_displayMonitorObservingAssertion = (BSInvalidatable *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localDefaults"));
    localDefaults = v4->_localDefaults;
    v4->_localDefaults = (BKSLocalDefaults *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "clientConnectionManager"));
    HIDConnectionManager = v4->_HIDConnectionManager;
    v4->_HIDConnectionManager = (BKHIDClientConnectionManager *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "touchPadManager"));
    touchPadManager = v4->_touchPadManager;
    v4->_touchPadManager = (BKTouchPadManager *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "keyboardEventProcessor"));
    keyboardEventProcessor = v4->_keyboardEventProcessor;
    v4->_keyboardEventProcessor = (BKKeyboardHIDEventProcessor *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smartCoverEventProcessor"));
    smartCoverEventProcessor = v4->_smartCoverEventProcessor;
    v4->_smartCoverEventProcessor = (BKSmartCoverHIDEventProcessor *)v22;

    v24 = objc_claimAutoreleasedReturnValue(-[BKSmartCoverHIDEventProcessor addSmartCoverObserver:](v4->_smartCoverEventProcessor, "addSmartCoverObserver:", v4));
    smartCoverObservationAssertion = v4->_smartCoverObservationAssertion;
    v4->_smartCoverObservationAssertion = (BSInvalidatable *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "displayController"));
    displayController = v4->_displayController;
    v4->_displayController = (BKDisplayController *)v26;

    v28 = objc_claimAutoreleasedReturnValue(-[BKDisplayController addDisplayBlankingObserver:](v4->_displayController, "addDisplayBlankingObserver:", v4));
    displayBlankingObservationAssertion = v4->_displayBlankingObservationAssertion;
    v4->_displayBlankingObservationAssertion = (BSInvalidatable *)v28;

    v30 = objc_claimAutoreleasedReturnValue(-[BKKeyboardHIDEventProcessor addGlobalKeyboardObserver:](v4->_keyboardEventProcessor, "addGlobalKeyboardObserver:", v4));
    keyboardEventObservationAssertion = v4->_keyboardEventObservationAssertion;
    v4->_keyboardEventObservationAssertion = (BSInvalidatable *)v30;

    v4->_displayLinkDisabled = -[BKMousePointerControllerConfiguration displayLinkDisabled](v4->_configuration, "displayLinkDisabled");
    sub_10006A3C0((uint64_t)v4);
    v32 = v4->_localDefaults;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "visualizeMousePointer"));
    v34 = &_dispatch_main_q;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10006C30C;
    v69[3] = &unk_1000EC7B8;
    objc_copyWeak(&v70, &location);
    v35 = -[BKSLocalDefaults observeDefault:onQueue:withBlock:](v32, "observeDefault:onQueue:withBlock:", v33, &_dispatch_main_q, v69);

    v36 = v4->_localDefaults;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "pointerRegionArrangementEdge"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10006C338;
    v66[3] = &unk_1000EB868;
    v38 = v4;
    v67 = v38;
    objc_copyWeak(&v68, &location);
    v39 = -[BKSLocalDefaults observeDefault:onQueue:withBlock:](v36, "observeDefault:onQueue:withBlock:", v37, &_dispatch_main_q, v66);

    v40 = v4->_localDefaults;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "mouseInterpolation"));
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10006C37C;
    v64[3] = &unk_1000EC7B8;
    objc_copyWeak(&v65, &location);
    v42 = -[BKSLocalDefaults observeDefault:onQueue:withBlock:](v40, "observeDefault:onQueue:withBlock:", v41, &_dispatch_main_q, v64);

    sub_10006C3A8((uint64_t)v38);
    objc_msgSend(a3, "mainDisplayCornerRadius");
    v38->_mainDisplayCornerRadius = v43;
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "orientationManager"));
    orientationManager = v38->_orientationManager;
    v38->_orientationManager = (BKOrientationManager *)v44;

    v46 = sub_10008BB88((id *)&v38->_orientationManager->super.isa, v38);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    orientationManagerObservationAssertion = v38->_orientationManagerObservationAssertion;
    v38->_orientationManagerObservationAssertion = (BSInvalidatable *)v47;

    v38->_mainDisplayInterfaceOrientation = sub_100019D70((uint64_t)v38->_orientationManager);
    v38->_rawDeviceOrientation = sub_10008B254((uint64_t)v38->_orientationManager);
    v49 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    activePointerAnimations = v38->_activePointerAnimations;
    v38->_activePointerAnimations = (NSMutableArray *)v49;

    v51 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    modelUpdateSuppressionAssertionsByDisplayID = v38->_modelUpdateSuppressionAssertionsByDisplayID;
    v38->_modelUpdateSuppressionAssertionsByDisplayID = (NSMutableDictionary *)v51;

    v53 = dispatch_queue_create("com.apple.backboard.BKMousePointerController.availabilityMonitorQueue", 0);
    pointerDeviceAvailabilityMonitorQueue = v38->_pointerDeviceAvailabilityMonitorQueue;
    v38->_pointerDeviceAvailabilityMonitorQueue = (OS_dispatch_queue *)v53;

    v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "deviceAvailabilityMonitor"));
    pointerDeviceAvailabilityMonitor = v38->_pointerDeviceAvailabilityMonitor;
    v38->_pointerDeviceAvailabilityMonitor = (BKMousePointerDeviceAvailabilityMonitor *)v55;

    -[BKMousePointerDeviceAvailabilityMonitor addObserver:queue:](v38->_pointerDeviceAvailabilityMonitor, "addObserver:queue:", v38, v38->_pointerDeviceAvailabilityMonitorQueue);
    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "analyticsReporter"));
    analyticsReporter = v38->_analyticsReporter;
    v38->_analyticsReporter = (BKMousePointerAnalyticsReporter *)v57;

    -[BKMousePointerAnalyticsReporter setMousePointerController:](v38->_analyticsReporter, "setMousePointerController:", v38);
    os_unfair_lock_lock(&v4->_lock);
    sub_10006A8D8((uint64_t)v38);
    sub_100068BB8((uint64_t)v38, (uint64_t)CFSTR("init"));
    os_unfair_lock_unlock(&v4->_lock);
    v59 = objc_alloc_init(BKMousePointerEventStatisticsLogger);
    statisticsLogger = v38->_statisticsLogger;
    v38->_statisticsLogger = v59;

    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceServer"));
    ipcServer_do_not_access_directly = v38->_ipcServer_do_not_access_directly;
    v38->_ipcServer_do_not_access_directly = (BKMousePointerServiceServer *)v61;

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v68);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BKMousePointerController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKMousePointerController;
  -[BKMousePointerController dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  atomic_flag *p_invalid;
  unsigned __int8 v4;
  BKMousePointerAnnotationController *annotationController;
  BSInvalidatable *displayBlankingObservationAssertion;
  BSInvalidatable *keyboardEventObservationAssertion;
  BKCADisplayMonitor *displayMonitor;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *modelUpdateSuppressionAssertionsByDisplayID;
  BSAbsoluteMachTimer *displayLinkPauseTimer;
  BKDisplayLink *displayLink;
  BKMousePointerRegionArrangement *regionArrangement;
  NSMutableDictionary *regionArrangementByDisplayID;
  BSInvalidatable *displayMonitorObservingAssertion;
  BSInvalidatable *smartCoverObservationAssertion;
  BSInvalidatable *orientationManagerObservationAssertion;
  BKMouseEventAccumulator *eventAccumulator;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  p_invalid = &self->_invalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v4 & 1) == 0)
  {
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    -[BKMousePointerAnnotationController invalidate](self->_annotationController, "invalidate");
    annotationController = self->_annotationController;
    self->_annotationController = 0;

    -[BSInvalidatable invalidate](self->_displayBlankingObservationAssertion, "invalidate");
    displayBlankingObservationAssertion = self->_displayBlankingObservationAssertion;
    self->_displayBlankingObservationAssertion = 0;

    -[BSInvalidatable invalidate](self->_keyboardEventObservationAssertion, "invalidate");
    keyboardEventObservationAssertion = self->_keyboardEventObservationAssertion;
    self->_keyboardEventObservationAssertion = 0;

    -[BKCADisplayMonitor invalidate](self->_displayMonitor, "invalidate");
    displayMonitor = self->_displayMonitor;
    self->_displayMonitor = 0;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_modelUpdateSuppressionAssertionsByDisplayID, "allValues", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13), "invalidate");
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    modelUpdateSuppressionAssertionsByDisplayID = self->_modelUpdateSuppressionAssertionsByDisplayID;
    self->_modelUpdateSuppressionAssertionsByDisplayID = 0;

    -[BSAbsoluteMachTimer invalidate](self->_displayLinkPauseTimer, "invalidate");
    displayLinkPauseTimer = self->_displayLinkPauseTimer;
    self->_displayLinkPauseTimer = 0;

    -[BKDisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    regionArrangement = self->_regionArrangement;
    self->_regionArrangement = 0;

    regionArrangementByDisplayID = self->_regionArrangementByDisplayID;
    self->_regionArrangementByDisplayID = 0;

    sub_10006A9D8((uint64_t)self);
    -[BSInvalidatable invalidate](self->_displayMonitorObservingAssertion, "invalidate");
    displayMonitorObservingAssertion = self->_displayMonitorObservingAssertion;
    self->_displayMonitorObservingAssertion = 0;

    -[BSInvalidatable invalidate](self->_smartCoverObservationAssertion, "invalidate");
    smartCoverObservationAssertion = self->_smartCoverObservationAssertion;
    self->_smartCoverObservationAssertion = 0;

    -[BSInvalidatable invalidate](self->_orientationManagerObservationAssertion, "invalidate");
    orientationManagerObservationAssertion = self->_orientationManagerObservationAssertion;
    self->_orientationManagerObservationAssertion = 0;

    -[BKMousePointerDeviceAvailabilityMonitor removeObserver:](self->_pointerDeviceAvailabilityMonitor, "removeObserver:", self);
    -[BKMouseEventAccumulator invalidate](self->_eventAccumulator, "invalidate");
    eventAccumulator = self->_eventAccumulator;
    self->_eventAccumulator = 0;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (id)suppressPointerModelUpdatesAssertionForDisplay:(id)a3 reason:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v7 = BKLogMousePointer(self, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = a3;
    v16 = 2114;
    v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "suppress pointer updates: display:%{public}@ because %{public}@", buf, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_modelUpdateSuppressionAssertionsByDisplayID, "objectForKeyedSubscript:", a3));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("modelUpdate-"), "stringByAppendingString:", a3));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006C248;
    v13[3] = &unk_1000EB890;
    v13[4] = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:](BSCompoundAssertion, "assertionWithIdentifier:stateDidChangeHandler:", v10, v13));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modelUpdateSuppressionAssertionsByDisplayID, "setObject:forKeyedSubscript:", v9, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "acquireForReason:", a4));

  return v11;
}

- (CGPoint)normalizedGlobalPointerPosition
{
  double x;
  double y;
  double v5;
  double v6;
  CGPoint result;

  if (self->_pointerRegion)
  {
    -[BKMousePointerRegionArrangement convertToGlobalPoint:fromRegion:](self->_regionArrangement, "convertToGlobalPoint:fromRegion:", self->_pointerRegionPoint.x, self->_pointerRegionPoint.y);
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  -[BKMousePointerRegionArrangement normalizedGlobalPosition:](self->_regionArrangement, "normalizedGlobalPosition:", x, y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)globalPointerPosition
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_pointerRegion)
    -[BKMousePointerRegionArrangement convertToGlobalPoint:fromRegion:](self->_regionArrangement, "convertToGlobalPoint:fromRegion:", self->_pointerRegionPoint.x, self->_pointerRegionPoint.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  sub_100067210(v4, self->_mainDisplayInterfaceOrientation, self->_displayController);
  v6 = v5;
  v8 = v7;

  os_unfair_lock_unlock(p_lock);
  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)setGlobalPointerPosition:(CGPoint)a3 process:(id)a4
{
  -[BKMousePointerController setGlobalPointerPosition:synthesizeEvents:process:](self, "setGlobalPointerPosition:synthesizeEvents:process:", 1, a4, a3.x, a3.y);
}

- (void)setGlobalPointerPosition:(CGPoint)a3 synthesizeEvents:(BOOL)a4 process:(id)a5
{
  _BOOL4 v6;
  os_unfair_lock_s *p_lock;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  sub_100068748(v9, self->_mainDisplayInterfaceOrientation, self->_displayController);
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setGlobalPointerPosition (%@)"), a5));
  sub_10006764C((uint64_t)self, 0, (uint64_t)v14, v11, v13);

  if (v6)
  {
    v15 = (void *)mach_absolute_time();
    sub_1000687EC((const os_unfair_lock *)self, v15, 1);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 auditPID:(int)a6
{
  uint64_t v6;
  double y;
  double x;
  os_unfair_lock_s *p_lock;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t (*v24[5])(_QWORD, double, double);

  v6 = *(_QWORD *)&a6;
  y = a3.y;
  x = a3.x;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_pointerRegion)
  {
    -[BKMousePointerRegionArrangement convertToGlobalPoint:fromRegion:](self->_regionArrangement, "convertToGlobalPoint:fromRegion:", self->_pointerRegionPoint.x, self->_pointerRegionPoint.y);
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v14 = CGPointZero.x;
    v16 = CGPointZero.y;
  }
  if (-[NSMutableArray count](self->_activePointerAnimations, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_activePointerAnimations, "lastObject"));
    objc_msgSend(v17, "destinationPoint");
    v14 = v18;
    v16 = v19;

  }
  v20 = sub_100068530((uint64_t)self, v14, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v21, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anyObject"));
    v23 = objc_msgSend(v22, "integerValue");

    if ((int)v23 >= 1)
    {
      v24[0] = (uint64_t (*)(_QWORD, double, double))_NSConcreteStackBlock;
      v24[1] = (uint64_t (*)(_QWORD, double, double))3221225472;
      v24[2] = (uint64_t (*)(_QWORD, double, double))sub_10006C1F0;
      v24[3] = (uint64_t (*)(_QWORD, double, double))&unk_1000EB8B8;
      v24[4] = (uint64_t (*)(_QWORD, double, double))a5;
      sub_10006B7C8((uint64_t)self, a4, (uint64_t)v23, v6, v24, x, y);
    }
  }

}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6 auditPID:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t (*v17[5])(_QWORD, double, double);

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor immutableDisplayForUUID:](self->_displayMonitor, "immutableDisplayForUUID:", a4));
  os_unfair_lock_lock(&self->_lock);
  v14 = sub_100068410((uint64_t)self, a3, v13);
  v16 = v15;
  os_unfair_lock_unlock(&self->_lock);
  v17[0] = (uint64_t (*)(_QWORD, double, double))_NSConcreteStackBlock;
  v17[1] = (uint64_t (*)(_QWORD, double, double))3221225472;
  v17[2] = (uint64_t (*)(_QWORD, double, double))sub_10006C198;
  v17[3] = (uint64_t (*)(_QWORD, double, double))&unk_1000EB8B8;
  v17[4] = (uint64_t (*)(_QWORD, double, double))a5;
  sub_10006B7C8((uint64_t)self, a4, v8, v7, v17, v14, v16);

}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7 auditPID:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *p_lock;
  void *v16;
  double v17;
  double v18;
  double v19;
  double y;
  double x;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t (*v27[7])(_QWORD, double, double);

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor immutableDisplayForUUID:](self->_displayMonitor, "immutableDisplayForUUID:", a5));
  v17 = sub_100068410((uint64_t)self, a3, v16);
  v19 = v18;
  x = CGPointZero.x;
  y = CGPointZero.y;
  if (a4)
  {
    v22 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", objc_msgSend(a4, "contextID"), CGPointZero.x, y);
    v23 = sub_100068410((uint64_t)self, v22, v16);
    v25 = v24;
    x = sub_100068410((uint64_t)self, a4, v16) - v23;
    y = v26 - v25;

  }
  os_unfair_lock_unlock(p_lock);
  v27[0] = (uint64_t (*)(_QWORD, double, double))_NSConcreteStackBlock;
  v27[1] = (uint64_t (*)(_QWORD, double, double))3221225472;
  v27[2] = (uint64_t (*)(_QWORD, double, double))sub_10006B77C;
  v27[3] = (uint64_t (*)(_QWORD, double, double))&unk_1000EB8D8;
  v27[4] = *(uint64_t (**)(_QWORD, double, double))&x;
  v27[5] = *(uint64_t (**)(_QWORD, double, double))&y;
  v27[6] = *(uint64_t (**)(_QWORD, double, double))&a6;
  sub_10006B7C8((uint64_t)self, a5, v9, v8, v27, v17, v19);

}

- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6
{
  uint64_t v10;
  BKMousePointerButtonDownRepositionAssertion *v12;
  BKMousePointerButtonDownRepositionAssertion *v13;
  NSMutableOrderedSet *buttonDownRepositionAssertions;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *v16;
  void *v18;
  NSString *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _BYTE location[12];
  __int16 v42;
  void *v43;
  __int16 v44;
  BKMousePointerController *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;

  if (!a4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), 0, a5, *(_QWORD *)&a6, CFSTR("point != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v22 = (objc_class *)objc_opt_class(self, v21);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v20;
      v42 = 2114;
      v43 = v24;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKMousePointerController.m");
      v48 = 1024;
      v49 = 708;
      v50 = 2114;
      v51 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
    __break(0);
    JUMPOUT(0x100061864);
  }
  if (!a3)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v29 = (objc_class *)objc_opt_class(self, v28);
      v30 = NSStringFromClass(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v27;
      v42 = 2114;
      v43 = v31;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKMousePointerController.m");
      v48 = 1024;
      v49 = 709;
      v50 = 2114;
      v51 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
    __break(0);
    JUMPOUT(0x10006195CLL);
  }
  if (!a5)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("displayUUID != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v36 = (objc_class *)objc_opt_class(self, v35);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v34;
      v42 = 2114;
      v43 = v38;
      v44 = 2048;
      v45 = self;
      v46 = 2114;
      v47 = CFSTR("BKMousePointerController.m");
      v48 = 1024;
      v49 = 710;
      v50 = 2114;
      v51 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
    __break(0);
    JUMPOUT(0x100061A54);
  }
  v10 = *(_QWORD *)&a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak((id *)location, self);
  v12 = [BKMousePointerButtonDownRepositionAssertion alloc];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10006B6F8;
  v39[3] = &unk_1000EB950;
  objc_copyWeak(&v40, (id *)location);
  v13 = -[BKMousePointerButtonDownRepositionAssertion initWithIdentifier:forReason:contextRelativePointerPosition:displayUUID:restrictingToPID:invalidationBlock:](v12, "initWithIdentifier:forReason:contextRelativePointerPosition:displayUUID:restrictingToPID:invalidationBlock:", CFSTR("com.apple.backboardd.BKMousePointerController"), a3, a4, a5, v10, v39);
  buttonDownRepositionAssertions = self->_buttonDownRepositionAssertions;
  if (!buttonDownRepositionAssertions)
  {
    v15 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", 1);
    v16 = self->_buttonDownRepositionAssertions;
    self->_buttonDownRepositionAssertions = v15;

    buttonDownRepositionAssertions = self->_buttonDownRepositionAssertions;
  }
  -[NSMutableOrderedSet addObject:](buttonDownRepositionAssertions, "addObject:", v13);
  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)location);
  return v13;
}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  void (**v6)(id, void *, void *, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  const os_unfair_lock *v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  os_unfair_lock_s *v39;
  void (**v40)(id, void *, void *, _QWORD);
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  if (a6)
  {
    v6 = (void (**)(id, void *, void *, _QWORD))a6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCADisplayMonitor immutableDisplayForUUID:](self->_displayMonitor, "immutableDisplayForUUID:", a5));
    if (v14)
    {
      v37 = a4;
      v39 = p_lock;
      v40 = v6;
      v15 = sub_10006718C((const os_unfair_lock *)self, a5);
      sub_100068410((uint64_t)self, a3, v14);
      sub_100067210(v14, (uint64_t)v15, self->_displayController);
      sub_10000F7A0(a5);
      v17 = v16;
      v19 = v18;
      v38 = v14;
      v20 = sub_1000260F0((uint64_t)BKMouseDestination, 0, v14, 0, self->_configuration, self->_lastEventContexts, v16, v18);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(v20);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v23)
              objc_enumerationMutation(obj);
            v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            if (v25 && (*(_DWORD *)(v25 + 12) - 1) <= 0xFFFFFFFD)
            {
              v26 = *(unsigned int *)(v25 + 8);
              v27 = sub_1000266F4(v25, self->_HIDConnectionManager);
              v28 = objc_alloc_init((Class)BKSHIDEventHitTestClientContext);
              objc_msgSend(v28, "setContextID:", v26);
              objc_msgSend(v28, "setPid:", v27);
              objc_msgSend(v12, "addObject:", v28);
              -[BKDisplayController convertCAScreenLocation:toContextID:displayUUID:](self->_displayController, "convertCAScreenLocation:toContextID:displayUUID:", v26, a5, v17, v19);
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:"));
              objc_msgSend(v13, "addObject:", v29);

            }
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v22);
      }
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v30 = v37;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v43 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v12, "addObject:", v35);
            -[BKDisplayController convertCAScreenLocation:toContextID:displayUUID:](self->_displayController, "convertCAScreenLocation:toContextID:displayUUID:", objc_msgSend(v35, "contextID"), a5, v17, v19);
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:"));
            objc_msgSend(v13, "addObject:", v36);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v32);
      }

      p_lock = v39;
      v6 = v40;
      v14 = v38;
    }
    os_unfair_lock_unlock(p_lock);
    v6[2](v6, v12, v13, 0);

  }
}

- (void)setGlobalPointerEventRoutes:(id)a3 forPID:(int)a4 displayUUID:(id)a5
{
  uint64_t v8;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKMousePointerController *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;

  if (a4 <= 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pid > 0")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = (objc_class *)objc_opt_class(self, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      v26 = 2114;
      v27 = v16;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKMousePointerController.m");
      v32 = 1024;
      v33 = 793;
      v34 = 2114;
      v35 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    __break(0);
    JUMPOUT(0x100061F9CLL);
  }
  if (!a5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("displayUUID != ((void *)0)")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v21 = (objc_class *)objc_opt_class(self, v20);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138544642;
      v25 = v19;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKMousePointerController.m");
      v32 = 1024;
      v33 = 794;
      v34 = 2114;
      v35 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    __break(0);
    JUMPOUT(0x100062094);
  }
  v8 = *(_QWORD *)&a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  sub_10006AE70((uint64_t)self, a3, v8, a5);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)stopRoutingGlobalEventsForPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  int v8;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v6 = -[NSMutableDictionary copy](self->_globalEventRoutesByDisplayID, "copy");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006AE58;
  v7[3] = &unk_1000EB978;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (BKSMousePointerDevicePreferences)globalDevicePreferences
{
  os_unfair_lock_s *p_preferencesLock;
  id v4;
  void *v5;

  p_preferencesLock = &self->_preferencesLock;
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(p_preferencesLock);
  v4 = sub_100069E58((const os_unfair_lock *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  os_unfair_lock_unlock(p_preferencesLock);
  return (BKSMousePointerDevicePreferences *)v5;
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
  -[BKMousePointerController setGlobalDevicePreferences:](self, "setGlobalDevicePreferences:", a3, a4);
}

- (void)setGlobalDevicePreferences:(id)a3
{
  os_unfair_lock_s *p_preferencesLock;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;

  p_preferencesLock = &self->_preferencesLock;
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(p_preferencesLock);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_globalDevicePreferencesObservers, "allObjects"));
  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v6, "count"))
  {
    v7 = sub_100069E58((const os_unfair_lock *)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = BSEqualObjects(a3, v8) ^ 1;

  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_assert_owner(p_preferencesLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  v37 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSProtobufSerialization encodeObject:error:](BSProtobufSerialization, "encodeObject:error:", a3, &v37));
  v12 = v37;
  v14 = v12;
  if (v11)
  {
    objc_msgSend(v10, "setGlobalMouseDevicePreferences:", v11);
  }
  else
  {
    v15 = BKLogMousePointer(v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "cannot encode global prefs : %{public}@", buf, 0xCu);
    }

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerDeviceAvailabilityMonitor deviceServices](self->_pointerDeviceAvailabilityMonitor, "deviceServices"));
  v18 = objc_msgSend(v17, "copy");

  os_unfair_lock_unlock(&self->_lock);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        sub_100069FF4((const os_unfair_lock *)self, a3, *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v23));
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v21);
  }

  os_unfair_lock_unlock(p_preferencesLock);
  os_unfair_lock_lock(&self->_lock);
  sub_10006ACC8((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v6;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v28), "mousePointerGlobalDevicePreferencesDidChange:", a3, (_QWORD)v29);
          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v26);
    }

  }
}

- (void)addLifecycleObserver:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_10006AE00((const os_unfair_lock *)self, (uint64_t)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeLifecycleObserver:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_10006ADA8((uint64_t)self, (uint64_t)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)addGlobalDevicePreferencesObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSHashTable *globalDevicePreferencesObservers;
  NSHashTable *v7;
  NSHashTable *v8;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
  if (!globalDevicePreferencesObservers)
  {
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v8 = self->_globalDevicePreferencesObservers;
    self->_globalDevicePreferencesObservers = v7;

    globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
  }
  -[NSHashTable addObject:](globalDevicePreferencesObservers, "addObject:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeGlobalDevicePreferencesObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSHashTable *globalDevicePreferencesObservers;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_globalDevicePreferencesObservers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_globalDevicePreferencesObservers, "count"))
  {
    globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
    self->_globalDevicePreferencesObservers = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayArrangement:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = BKLogMousePointer(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Display arrangement update: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_displayArrangement, a3);
  sub_100068BB8((uint64_t)self, (uint64_t)CFSTR("display arrangement changed"));
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setEventsDisabled:(BOOL)a3 pid:(int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSMutableSet *disableEventsPIDs;
  NSMutableSet *v14;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableSet *v21;
  int v22;
  _QWORD v23[2];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = BKLogMousePointer(self, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109376;
    LODWORD(v23[0]) = v5;
    WORD2(v23[0]) = 1024;
    *(_DWORD *)((char *)v23 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setEventsDisabled:%{BOOL}u pid:%d", (uint8_t *)&v22, 0xEu);
  }

  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v10 = -[NSMutableSet containsObject:](self->_disableEventsPIDs, "containsObject:", v9);
  if (v5)
  {
    if ((v10 & 1) == 0)
    {
      v12 = -[NSMutableSet count](self->_disableEventsPIDs, "count");
      disableEventsPIDs = self->_disableEventsPIDs;
      if (!disableEventsPIDs)
      {
        v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v15 = self->_disableEventsPIDs;
        self->_disableEventsPIDs = v14;

        disableEventsPIDs = self->_disableEventsPIDs;
      }
      v10 = -[NSMutableSet addObject:](disableEventsPIDs, "addObject:", v9);
      if (!v12)
      {
        sub_10006A8D8((uint64_t)self);
        sub_10006A9D8((uint64_t)self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet bs_map:](self->_disableEventsPIDs, "bs_map:", &stru_1000EB9B8));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("disabled by policy: "), "stringByAppendingString:", v17));
        sub_1000679E4((uint64_t)self, (uint64_t)v18);

      }
    }
  }
  else if ((_DWORD)v10)
  {
    -[NSMutableSet removeObject:](self->_disableEventsPIDs, "removeObject:", v9);
    v10 = -[NSMutableSet count](self->_disableEventsPIDs, "count");
    if (!v10)
      sub_1000679E4((uint64_t)self, (uint64_t)CFSTR("enabled by policy"));
  }
  v19 = BKLogMousePointer(v10, v11);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_disableEventsPIDs;
    v22 = 138543362;
    v23[0] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "pids currently disabling events: %{public}@", (uint8_t *)&v22, 0xCu);
  }

  sub_10006932C((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  NSSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_lastEventContexts;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (sub_1000266F4(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), self->_HIDConnectionManager) == a3)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  os_unfair_lock_s *p_lock;
  int64_t v9;
  int64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = sub_100019D70((uint64_t)a3);
  if (self->_mainDisplayInterfaceOrientation != v9)
  {
    self->_mainDisplayInterfaceOrientation = v9;
    sub_100068F08((uint64_t)self);
  }
  v10 = sub_10008B254((uint64_t)a3);
  if (self->_rawDeviceOrientation != v10)
  {
    self->_rawDeviceOrientation = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
    v12 = objc_msgSend(v11, "displayIsBlanked:", 0);

    v13 = sub_100068848((uint64_t)self, v12 ^ 1, -[BKSmartCoverHIDEventProcessor isSmartCoverClosed](self->_smartCoverEventProcessor, "isSmartCoverClosed"), self->_rawDeviceOrientation);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    sub_100068950((id *)&self->super.isa, v14);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)mousePointerDeviceAvailabilityMonitorDidChangeAvailability:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_lifecycleObservers, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerDeviceAvailabilityMonitor deviceServices](self->_pointerDeviceAvailabilityMonitor, "deviceServices"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_lifecycleObservers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "observeMouseAvailabilityDidChange:", objc_msgSend(v5, "count", (_QWORD)v11) != 0);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)mousePointerIOHIDServicesAdded:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  _BKMousePointerSenderProperties *v15;
  uint64_t v16;
  BKMousePointerController *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  float v36;
  float v37;
  float v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  unsigned __int8 v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  unsigned int v64;
  id v65;
  void *v66;
  NSMutableDictionary *senderPropertiesBySenderID;
  NSMutableDictionary *v68;
  NSMutableDictionary *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  void *j;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  _BOOL4 readyToReceiveEvents;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id obj;
  uint64_t v90;
  id v91;
  BKMousePointerController *v92;
  os_unfair_lock *p_lock;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  objc_super v107;
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  _BOOL4 v111;
  __int16 v112;
  void *v113;

  v5 = sub_100069D80((uint64_t)self, a3, (uint64_t)CFSTR("services added"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(&self->_preferencesLock);
  v6 = sub_100069E58((const os_unfair_lock *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v100 != v11)
          objc_enumerationMutation(v8);
        sub_100069FF4((const os_unfair_lock *)self, v7, *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v10);
  }
  v87 = v7;

  os_unfair_lock_unlock(&self->_preferencesLock);
  v92 = self;
  v85 = v8;
  if (self)
  {
    v91 = objc_alloc_init((Class)NSMutableDictionary);
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    obj = v8;
    v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
    if (v94)
    {
      v90 = *(_QWORD *)v104;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v104 != v90)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)v13);
          v15 = [_BKMousePointerSenderProperties alloc];
          if (v15)
          {
            v107.receiver = v15;
            v107.super_class = (Class)_BKMousePointerSenderProperties;
            v17 = -[BKMousePointerController init](&v107, "init");
            if (v17)
            {
              v18 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSDictionary, v16), CFSTR("SurfaceDimensions"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              v21 = v19;
              if (v19)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Width")));
                v24 = objc_opt_class(NSNumber, v23);
                v25 = v22;
                v26 = v25;
                if (v24)
                {
                  if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0)
                    v27 = v26;
                  else
                    v27 = 0;
                }
                else
                {
                  v27 = 0;
                }
                v28 = v27;

                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Height")));
                v31 = objc_opt_class(NSNumber, v30);
                v32 = v29;
                v33 = v32;
                if (v31)
                {
                  if ((objc_opt_isKindOfClass(v32, v31) & 1) != 0)
                    v34 = v33;
                  else
                    v34 = 0;
                }
                else
                {
                  v34 = 0;
                }
                v35 = v34;

                objc_msgSend(v28, "floatValue");
                *(double *)&v17->_configuration = v36;
                objc_msgSend(v35, "floatValue");
                v38 = v37;

                v17->_mainDisplayCornerRadius = v38;
              }
              v39 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v20), CFSTR("HIDScrollResolutionX"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              v42 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v41), CFSTR("HIDScrollResolutionY"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              v45 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v44), CFSTR("HIDScrollResolutionZ"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
              v48 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v47), CFSTR("HIDScrollResolution"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
              if (objc_msgSend(v40, "unsignedIntValue") > 0x120000
                || objc_msgSend(v43, "unsignedIntValue") > 0x120000
                || objc_msgSend(v46, "unsignedIntValue") > 0x120000
                || objc_msgSend(v49, "unsignedIntValue") > 0x120000)
              {
                LOBYTE(v17->_lock._os_unfair_lock_opaque) = 1;
              }
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "propertyForKey:", CFSTR("NeedsHostState"), v85, v87, v88));
              v52 = objc_opt_class(NSNumber, v51);
              v53 = v50;
              v54 = v53;
              if (v52)
              {
                if ((objc_opt_isKindOfClass(v53, v52) & 1) != 0)
                  v55 = v54;
                else
                  v55 = 0;
              }
              else
              {
                v55 = 0;
              }
              v56 = v55;

              v57 = objc_msgSend(v56, "BOOLValue");
              BYTE1(v17->_lock._os_unfair_lock_opaque) = v57;
              v59 = objc_msgSend(v14, "propertyOfClass:forKey:", objc_opt_class(NSNumber, v58), CFSTR("ignoresNaturalScrollingPreference"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
              BYTE2(v17->_lock._os_unfair_lock_opaque) = objc_msgSend(v60, "BOOLValue");

            }
          }
          else
          {
            v17 = 0;
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "senderID", v85)));
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v17, v61);

          v13 = (char *)v13 + 1;
        }
        while (v94 != v13);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
        v94 = v62;
      }
      while (v62);
    }

  }
  else
  {
    v91 = 0;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance", v85));
  v64 = objc_msgSend(v63, "displayIsBlanked:", 0);

  v65 = sub_100068848((uint64_t)v92, v64 ^ 1, -[BKSmartCoverHIDEventProcessor isSmartCoverClosed](v92->_smartCoverEventProcessor, "isSmartCoverClosed"), v92->_rawDeviceOrientation);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  p_lock = &v92->_lock;
  os_unfair_lock_lock(&v92->_lock);
  sub_100068BB8((uint64_t)v92, (uint64_t)v88);
  senderPropertiesBySenderID = v92->_senderPropertiesBySenderID;
  if (!senderPropertiesBySenderID)
  {
    v68 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v69 = v92->_senderPropertiesBySenderID;
    v92->_senderPropertiesBySenderID = v68;

    senderPropertiesBySenderID = v92->_senderPropertiesBySenderID;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](senderPropertiesBySenderID, "addEntriesFromDictionary:", v91);
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v70 = v86;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v72; j = (char *)j + 1)
      {
        if (*(_QWORD *)v96 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)j);
        -[BKMouseEventAccumulator deviceServiceDidAppear:](v92->_eventAccumulator, "deviceServiceDidAppear:", v75);
        sub_100068A60((uint64_t)v92, v75, v66);
        v78 = BKLogMousePointer(v76, v77);
        v79 = objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          readyToReceiveEvents = v92->_readyToReceiveEvents;
          *(_DWORD *)buf = 67109378;
          v111 = readyToReceiveEvents;
          v112 = 2114;
          v113 = v75;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "set _readyToReceiveEvents:%{BOOL}u on %{public}@", buf, 0x12u);
        }

        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v92->_readyToReceiveEvents));
        objc_msgSend(v75, "asyncSetProperty:forKey:", v81, CFSTR("BKReadyToReceivePointerEvents"));

      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v72);
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerDeviceAvailabilityMonitor deviceServices](v92->_pointerDeviceAvailabilityMonitor, "deviceServices"));
  v83 = objc_msgSend(v82, "copy");

  -[BKMousePointerAnalyticsReporter availableDevicesDidChange](v92->_analyticsReporter, "availableDevicesDidChange");
  os_unfair_lock_unlock(p_lock);
  v84 = v83;
  os_unfair_lock_assert_not_owner(p_lock);
  -[BKMousePointerServiceServer pointingDevicesDidChange:](v92->_ipcServer_do_not_access_directly, "pointingDevicesDidChange:", v84);

}

- (void)mousePointerIOHIDServicesRemoved:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  BKDisplayLink *displayLink;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSMutableDictionary *senderPropertiesBySenderID;
  void *v25;
  void *v26;
  id v27;
  id v28;
  os_unfair_lock_s *lock;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v5 = sub_100069D80((uint64_t)self, a3, (uint64_t)CFSTR("services removed"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_assert_not_owner(&self->_lock);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        -[BKMouseEventAccumulator deviceServiceDidTerminate:](self->_eventAccumulator, "deviceServiceDidTerminate:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  displayLink = self->_displayLink;
  v30 = (void *)v6;
  sub_100068BB8((uint64_t)self, v6);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    v31 = (void *)BKSDisplayUUIDMainKey;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17);
        if (!displayLink)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17), "displayUUID"));
          v20 = objc_msgSend(v19, "length");
          v21 = v31;
          if (v20)
            v21 = v19;
          v22 = v21;
          sub_100068184((uint64_t)self, (uint64_t)v22);

        }
        v23 = objc_msgSend(v18, "senderID");
        senderPropertiesBySenderID = self->_senderPropertiesBySenderID;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v23));
        -[NSMutableDictionary removeObjectForKey:](senderPropertiesBySenderID, "removeObjectForKey:", v25);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v15);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerDeviceAvailabilityMonitor deviceServices](self->_pointerDeviceAvailabilityMonitor, "deviceServices"));
  v27 = objc_msgSend(v26, "copy");

  -[BKMousePointerAnalyticsReporter availableDevicesDidChange](self->_analyticsReporter, "availableDevicesDidChange");
  os_unfair_lock_unlock(lock);
  v28 = v27;
  os_unfair_lock_assert_not_owner(lock);
  -[BKMousePointerServiceServer pointingDevicesDidChange:](self->_ipcServer_do_not_access_directly, "pointingDevicesDidChange:", v28);

}

- (void)display:(id)a3 didBecomeBlank:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v7 = sub_100068848((uint64_t)self, !v4, -[BKSmartCoverHIDEventProcessor isSmartCoverClosed](self->_smartCoverEventProcessor, "isSmartCoverClosed"), self->_rawDeviceOrientation);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  sub_100068950((id *)&self->super.isa, v8);
  os_unfair_lock_unlock(p_lock);

}

- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueId"));
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("display became active -- %@"), v10));
  sub_100068BB8((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueId"));
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("display became inactive -- %@"), v10));
  sub_100068BB8((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueId"));
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("displays did change -- %@"), v10));
  sub_100068BB8((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)smartCoverStateDidChange:(int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
  v7 = objc_msgSend(v6, "displayIsBlanked:", 0) ^ 1;

  if (a3 != 3 || (v7 & 1) == 0)
  {
    v8 = sub_100068848((uint64_t)self, v7, a3 == 3, self->_rawDeviceOrientation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    sub_100068950((id *)&self->super.isa, v9);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)globalKeyboardModifiersDidChange:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_activeKeyboardModifiers != a3)
  {
    self->_activeKeyboardModifiers = a3;
    if (-[NSSet count](self->_lastEventContexts, "count"))
    {
      v6 = (void *)mach_absolute_time();
      sub_1000687EC((const os_unfair_lock *)self, v6, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_displayLinkFired:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  unint64_t displayLinkUnpauseTime;
  unint64_t displayLinkPauseTime;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  double v26;
  __int16 v27;
  double v28;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)mach_absolute_time();
  sub_100063E6C((const os_unfair_lock *)self, v6);
  v7 = -[NSMutableArray copy](self->_activePointerAnimations, "copy");
  if (self->_displayLinkPaused)
  {
    self->_displayLinkPaused = 0;
    os_unfair_lock_unlock(p_lock);
    displayLinkPauseTime = self->_displayLinkPauseTime;
    displayLinkUnpauseTime = self->_displayLinkUnpauseTime;
    v10 = mach_absolute_time();
    v11 = self->_displayLinkUnpauseTime;
    v13 = BKLogMousePointer(v10, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v26 = (float)((float)(displayLinkUnpauseTime - displayLinkPauseTime) / 24000000.0);
      v27 = 2048;
      v28 = (float)((float)(v10 - v11) / 24000.0);
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "displayLink unpaused after %.2fs of pausing, took %.2fms to fire after unpause", buf, 0x16u);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "displayLinkFired:", a3, (_QWORD)v20);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (BOOL)eventsDisabled
{
  return self->_eventsDisabled;
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setLocalDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_localDefaults, a3);
}

- (BKHIDClientConnectionManager)HIDConnectionManager
{
  return self->_HIDConnectionManager;
}

- (void)setHIDConnectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_HIDConnectionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDConnectionManager, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_modelUpdateSuppressionAssertionsByDisplayID, 0);
  objc_storeStrong((id *)&self->_hitTestContextsPinnedByMouse, 0);
  objc_storeStrong((id *)&self->_globalContextsPinnedByMouse, 0);
  objc_storeStrong((id *)&self->_globalEventRoutesByDisplayID, 0);
  objc_storeStrong((id *)&self->_buttonDownRepositionAssertions, 0);
  objc_storeStrong((id *)&self->_globalDevicePreferencesObservers, 0);
  objc_storeStrong((id *)&self->_statisticsLogger, 0);
  objc_storeStrong((id *)&self->_lifecycleObservers, 0);
  objc_storeStrong((id *)&self->_ipcServer_do_not_access_directly, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_smartCoverObservationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardEventObservationAssertion, 0);
  objc_storeStrong((id *)&self->_displayBlankingObservationAssertion, 0);
  objc_storeStrong((id *)&self->_orientationManagerObservationAssertion, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_smartCoverEventProcessor, 0);
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_touchPadManager, 0);
  objc_storeStrong((id *)&self->_senderPropertiesBySenderID, 0);
  objc_storeStrong((id *)&self->_lastEventContexts, 0);
  objc_storeStrong((id *)&self->_eventAccumulator, 0);
  objc_storeStrong((id *)&self->_displayLinkPauseTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_disableEventsPIDs, 0);
  objc_storeStrong((id *)&self->_activePointerAnimations, 0);
  objc_storeStrong((id *)&self->_pointerRegion, 0);
  objc_storeStrong((id *)&self->_regionArrangement, 0);
  objc_storeStrong((id *)&self->_displayArrangement, 0);
  objc_storeStrong((id *)&self->_interestingDisplays, 0);
  objc_storeStrong((id *)&self->_regionArrangementByDisplayID, 0);
  objc_storeStrong((id *)&self->_mainDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayMonitorObservingAssertion, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_pointerDeviceAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_pointerDeviceAvailabilityMonitorQueue, 0);
}

+ (id)standardConfiguration
{
  BKMousePointerControllerConfiguration *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ClientConnectionManager;
  void *v10;
  BKMousePointerDeviceAvailabilityMonitor *v11;
  BKMousePointerAnalyticsReporter *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  BKHIDEventHitTestDispatcher *v22;
  uint64_t v23;

  v2 = objc_alloc_init(BKMousePointerControllerConfiguration);
  -[BKMousePointerControllerConfiguration setDisplayProvider:](v2, "setDisplayProvider:", 0);
  v3 = sub_10001A7F4();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[BKMousePointerControllerConfiguration setOrientationManager:](v2, "setOrientationManager:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](BKDisplayController, "sharedInstance"));
  -[BKMousePointerControllerConfiguration setDisplayController:](v2, "setDisplayController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
  -[BKMousePointerControllerConfiguration setLocalDefaults:](v2, "setLocalDefaults:", v6);

  ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(ClientConnectionManager);
  -[BKMousePointerControllerConfiguration setClientConnectionManager:](v2, "setClientConnectionManager:", v10);

  v11 = objc_alloc_init(BKMousePointerDeviceAvailabilityMonitor);
  -[BKMousePointerControllerConfiguration setDeviceAvailabilityMonitor:](v2, "setDeviceAvailabilityMonitor:", v11);

  v12 = objc_alloc_init(BKMousePointerAnalyticsReporter);
  -[BKMousePointerControllerConfiguration setAnalyticsReporter:](v2, "setAnalyticsReporter:", v12);

  -[BKMousePointerControllerConfiguration setServiceServer:](v2, "setServiceServer:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchDeliveryPolicyServer sharedServer](BKTouchDeliveryPolicyServer, "sharedServer"));
  -[BKMousePointerControllerConfiguration setTouchDeliveryPolicyServer:](v2, "setTouchDeliveryPolicyServer:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](BKTouchPadManager, "sharedInstance"));
  -[BKMousePointerControllerConfiguration setTouchPadManager:](v2, "setTouchPadManager:", v15);

  v17 = objc_msgSend(v14, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[BKMousePointerControllerConfiguration setKeyboardEventProcessor:](v2, "setKeyboardEventProcessor:", v18);

  v20 = objc_msgSend(v14, "eventProcessorOfClass:", objc_opt_class(BKSmartCoverHIDEventProcessor, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[BKMousePointerControllerConfiguration setSmartCoverEventProcessor:](v2, "setSmartCoverEventProcessor:", v21);

  v22 = objc_alloc_init(BKHIDEventHitTestDispatcher);
  -[BKMousePointerControllerConfiguration setEventDispatcher:](v2, "setEventDispatcher:", v22);

  -[BKMousePointerControllerConfiguration setDisplayLinkClass:](v2, "setDisplayLinkClass:", objc_opt_class(CADisplayLink, v23));
  -[BKMousePointerControllerConfiguration setShouldUseHighFrequencyAttributeOption:](v2, "setShouldUseHighFrequencyAttributeOption:", 1);
  -[BKMousePointerControllerConfiguration setMainDisplayCornerRadius:](v2, "setMainDisplayCornerRadius:", MGGetFloat32Answer(CFSTR("DeviceCornerRadius"), 0.0));

  return v2;
}

@end

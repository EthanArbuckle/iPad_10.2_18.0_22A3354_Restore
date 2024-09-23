@implementation IMSleepManager

+ (id)sharedInstance
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!qword_3115F0)
  {
    v3 = objc_opt_new(v2);
    v4 = (void *)qword_3115F0;
    qword_3115F0 = v3;

  }
  objc_sync_exit(v2);

  return (id)qword_3115F0;
}

- (void)dealloc
{
  objc_super v3;

  -[IMSleepManager cancelIdleTimer](self, "cancelIdleTimer");
  v3.receiver = self;
  v3.super_class = (Class)IMSleepManager;
  -[IMSleepManager dealloc](&v3, "dealloc");
}

+ (void)startSleepTimer
{
  double v2;
  id v3;

  if (isPad())
    v2 = 345.0;
  else
    v2 = 225.0;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMSleepManager sharedInstance](IMSleepManager, "sharedInstance"));
  objc_msgSend(v3, "setIdleTimerDelay:", v2);

}

+ (void)stopSleepTimer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[IMSleepManager sharedInstance](IMSleepManager, "sharedInstance"));
  objc_msgSend(v2, "setIdleTimerDelay:", 0.0);

}

+ (void)didEnterBackground
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = BCSleepManagerLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "App entered background.", v4, 2u);
  }

}

- (void)startInputCheck
{
  NSTimer *v3;
  NSTimer *idleTimerInputCheck;
  id v5;
  NSObject *v6;
  int v7;
  _UNKNOWN **v8;

  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "idleTimerInputCheck:", 0, 0, 15.0));
  idleTimerInputCheck = self->_idleTimerInputCheck;
  self->_idleTimerInputCheck = v3;

  v5 = BCSleepManagerLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = &off_2B3090;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Input check timer to: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)idleTimerInputCheck:(id)a3
{
  NSTimer *idleTimerInputCheck;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[NSTimer invalidate](self->_idleTimerInputCheck, "invalidate", a3);
  idleTimerInputCheck = self->_idleTimerInputCheck;
  self->_idleTimerInputCheck = 0;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v10, "lastEventDate");
  v8 = v6 - v7;
  -[IMSleepManager idleTimerDelay](self, "idleTimerDelay");
  if (v8 >= v9)
    -[IMSleepManager startInputCheck](self, "startInputCheck");
  else
    -[IMSleepManager startIdleTimer:](self, "startIdleTimer:");

}

- (void)idleTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = BCSleepManagerLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Idle timer fired", v6, 2u);
  }

  -[IMSleepManager cancelIdleTimer](self, "cancelIdleTimer");
  -[IMSleepManager startInputCheck](self, "startInputCheck");
}

- (void)startIdleTimer:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSTimer *v12;
  NSTimer *idleTimerReenableTimer;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;

  -[IMSleepManager cancelIdleTimer](self, "cancelIdleTimer");
  if (a3 > 0.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
    objc_msgSend(v5, "lastEventDate");
    if (v6 == 0.0)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v5, "setLastEventDate:");
    }
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v8 = v7;
    objc_msgSend(v5, "lastEventDate");
    v10 = v8 - v9;
    if (v10 < a3)
    {
      v11 = a3 - v10;
      v12 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "idleTimerFired:", 0, 0, v11));
      idleTimerReenableTimer = self->_idleTimerReenableTimer;
      self->_idleTimerReenableTimer = v12;

      v14 = BCSleepManagerLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Setting idle timer to: %@", (uint8_t *)&v17, 0xCu);

      }
      -[IMSleepManager retainIdleTimerDisabledForObject:](self, "retainIdleTimerDisabledForObject:", self);
    }

  }
}

- (void)cancelIdleTimer
{
  id v3;
  NSObject *v4;
  NSTimer *idleTimerInputCheck;
  NSTimer *idleTimerReenableTimer;
  NSTimer *v7;
  uint8_t v8[16];

  v3 = BCSleepManagerLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Cancel idle timer.", v8, 2u);
  }

  -[NSTimer invalidate](self->_idleTimerInputCheck, "invalidate");
  idleTimerInputCheck = self->_idleTimerInputCheck;
  self->_idleTimerInputCheck = 0;

  idleTimerReenableTimer = self->_idleTimerReenableTimer;
  if (idleTimerReenableTimer)
  {
    -[NSTimer invalidate](idleTimerReenableTimer, "invalidate");
    v7 = self->_idleTimerReenableTimer;
    self->_idleTimerReenableTimer = 0;

    -[IMSleepManager releaseIdleTimerDisabledForObject:](self, "releaseIdleTimerDisabledForObject:", self);
  }
}

- (void)setIdleTimerDelay:(double)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  v6 = objc_opt_class(IMApplication);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (self->_idleTimerDelay != a3)
    {
      self->_idleTimerDelay = a3;
      -[IMSleepManager startIdleTimer:](self, "startIdleTimer:", a3);
    }
  }
  else
  {
    v7 = BCSleepManagerLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1B9E34(v8);

  }
}

- (unint64_t)idleTimerDisableRefCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMSleepManager objectsHoldingIdleTimerDisabled](self, "objectsHoldingIdleTimerDisabled"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSCountedSet)objectsHoldingIdleTimerDisabled
{
  NSCountedSet *objectsHoldingIdleTimerDisabled;
  NSCountedSet *v4;
  NSCountedSet *v5;

  objectsHoldingIdleTimerDisabled = self->_objectsHoldingIdleTimerDisabled;
  if (!objectsHoldingIdleTimerDisabled)
  {
    v4 = objc_opt_new(NSCountedSet);
    v5 = self->_objectsHoldingIdleTimerDisabled;
    self->_objectsHoldingIdleTimerDisabled = v4;

    objectsHoldingIdleTimerDisabled = self->_objectsHoldingIdleTimerDisabled;
  }
  return objectsHoldingIdleTimerDisabled;
}

- (void)retainIdleTimerDisabledForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMSleepManager objectsHoldingIdleTimerDisabled](self, "objectsHoldingIdleTimerDisabled"));
  objc_msgSend(v5, "addObject:", v4);

  -[IMSleepManager reevaluateIdleTimerDisabled](self, "reevaluateIdleTimerDisabled");
}

- (void)releaseIdleTimerDisabledForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMSleepManager objectsHoldingIdleTimerDisabled](self, "objectsHoldingIdleTimerDisabled"));
  objc_msgSend(v5, "removeObject:", v4);

  -[IMSleepManager reevaluateIdleTimerDisabled](self, "reevaluateIdleTimerDisabled");
}

- (void)reevaluateIdleTimerDisabled
{
  void *v3;
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  objc_msgSend(v3, "setIdleTimerDisabled:", -[IMSleepManager idleTimerDisableRefCount](self, "idleTimerDisableRefCount") != 0);
  v4 = BCSleepManagerLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v3, "isIdleTimerDisabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMSleepManager objectsHoldingIdleTimerDisabled](self, "objectsHoldingIdleTimerDisabled"));
    v8[0] = 67109378;
    v8[1] = v6;
    v9 = 2112;
    v10 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "idleTimerDisabled set to %d with holders: %@", (uint8_t *)v8, 0x12u);

  }
}

- (double)idleTimerDelay
{
  return self->_idleTimerDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsHoldingIdleTimerDisabled, 0);
  objc_storeStrong((id *)&self->_idleTimerInputCheck, 0);
  objc_storeStrong((id *)&self->_idleTimerReenableTimer, 0);
}

@end

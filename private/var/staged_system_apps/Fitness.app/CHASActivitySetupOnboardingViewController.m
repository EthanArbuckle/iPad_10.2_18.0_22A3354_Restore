@implementation CHASActivitySetupOnboardingViewController

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (CHASActivitySetupOnboardingViewController)initWithPresentationContext:(int64_t)a3
{
  CHASActivitySetupOnboardingViewController *v4;
  CHASActivitySetupOnboardingViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHASActivitySetupOnboardingViewController;
  v4 = -[CHASActivitySetupOnboardingViewController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_presentationContext = a3;
    -[CHASActivitySetupOnboardingViewController setStyle:](v4, "setStyle:", 98);
  }
  return v5;
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEALTH_TITLE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v4;
}

- (id)imageResourceBundleIdentifier
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  return v4;
}

- (id)imageResource
{
  return CFSTR("activitySetup");
}

- (id)privacyBundles
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.onboarding.activity");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)suggestedButtonTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEALTH_CHOICE_OK"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v4;
}

- (id)alternateButtonString
{
  return &stru_1007AE1D0;
}

- (id)okayButtonTitle
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SKIP_THIS_STEP"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v4;
}

- (id)detailTitleString
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WHAT_IS_HEALTH"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v4;
}

- (id)detailString
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEALTH_DETAIL_FYI"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

  return v4;
}

- (id)moreOptionsButtonString
{
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started Health Setup", v7, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  objc_msgSend(v5, "buddyControllerDone:nextControllerClass:", self, objc_opt_class(CHASActivitySetupViewController, v6));

}

- (void)okayButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipped Health Setup", v10, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activePairingDevice"));

  v7 = FIUIHealthStoreForDevice(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[CHASActivitySetupOnboardingViewController performEndToEndCloudSyncOnSkippingSetupForHealthStore:](CHASActivitySetupOnboardingViewController, "performEndToEndCloudSyncOnSkippingSetupForHealthStore:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  objc_msgSend(v9, "buddyControllerDone:", self);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CHASActivitySetupOnboardingViewController;
  -[CHASActivitySetupOnboardingViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CHASActivitySetupOnboardingViewController;
  -[CHASActivitySetupOnboardingViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

+ (void)performEndToEndCloudSyncOnSkippingSetupForHealthStore:(id)a3
{
  id v4;
  uint64_t active;
  void *v6;
  _QWORD *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  _Unwind_Exception *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  active = FIGetActivePairedDevice();
  v6 = (void *)objc_claimAutoreleasedReturnValue(active);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = (_QWORD *)qword_10083DEF0;
  v18 = qword_10083DEF0;
  if (!qword_10083DEF0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005C7F8;
    v14[3] = &unk_100777F08;
    v14[4] = &v15;
    sub_10005C7F8((uint64_t)v14);
    v7 = (_QWORD *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
  {
    v12 = (_Unwind_Exception *)sub_1005F1C5C();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v12);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", *v7));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)HKSecondaryDevicePairingAgent), "initWithHealthStore:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005C244;
    v13[3] = &unk_100777E68;
    v13[4] = a1;
    objc_msgSend(v10, "performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:", v11, 1, v13);

  }
}

- (id)tapToRadarMetadata
{
  return objc_msgSend(objc_alloc((Class)BPSTTRMetadata), "initWithComponent:", 2);
}

- (BOOL)holdBeforeDisplaying
{
  void *v3;
  void *v4;
  id v5;
  unsigned int v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *healthQueue;
  NSTimer *v9;
  NSTimer *hasExistingMoveGoalTimer;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  CHASActivitySetupOnboardingViewController *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activePairingDevice"));

  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("DB36394D-9CED-4841-BA1D-84B029EA25BB"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  if (v6)
  {
    if (!self->_healthQueue)
    {
      v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Bridge.healthqueue", 0);
      healthQueue = self->_healthQueue;
      self->_healthQueue = v7;

    }
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_timeoutAndMoveOn:", 0, 0, 5.0));
    hasExistingMoveGoalTimer = self->_hasExistingMoveGoalTimer;
    self->_hasExistingMoveGoalTimer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v11, "addTimer:forMode:", self->_hasExistingMoveGoalTimer, NSRunLoopCommonModes);

    v12 = self->_healthQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005C4C4;
    v14[3] = &unk_100777EE0;
    v15 = v4;
    v16 = self;
    dispatch_async(v12, v14);

  }
  return v6;
}

- (void)_timeoutAndMoveOn:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT))
    sub_1005F1D78(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activePairingDevice"));

  v7 = FIUIHealthStoreForDevice(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  +[CHASActivitySetupOnboardingViewController performEndToEndCloudSyncOnSkippingSetupForHealthStore:](CHASActivitySetupOnboardingViewController, "performEndToEndCloudSyncOnSkippingSetupForHealthStore:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupOnboardingViewController delegate](self, "delegate"));
  objc_msgSend(v9, "buddyControllerReleaseHoldAndSkip:", self);

}

- (BOOL)holdWithWaitScreen
{
  return 0;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (id)localizedWaitScreenDescription
{
  return 0;
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (NSTimer)hasExistingMoveGoalTimer
{
  return self->_hasExistingMoveGoalTimer;
}

- (void)setHasExistingMoveGoalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hasExistingMoveGoalTimer, a3);
}

- (OS_dispatch_queue)healthQueue
{
  return self->_healthQueue;
}

- (void)setHealthQueue:(id)a3
{
  objc_storeStrong((id *)&self->_healthQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthQueue, 0);
  objc_storeStrong((id *)&self->_hasExistingMoveGoalTimer, 0);
}

@end

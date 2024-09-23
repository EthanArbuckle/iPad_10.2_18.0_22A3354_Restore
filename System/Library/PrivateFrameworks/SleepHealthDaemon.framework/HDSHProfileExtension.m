@implementation HDSHProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  HDFeatureAvailabilityManager *v4;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDD2E68]))
    v4 = self->_sleepApneaNotificationsAvailabilityManager;
  else
    v4 = 0;
  return v4;
}

- (HDSHProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDSHProfileExtension *v5;
  HDSHProfileExtension *v6;
  HDSHAccessibilityAssertionManager *v7;
  HDSHAccessibilityAssertionManager *accessibilityAssertionManager;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  HDSHWidgetSchedulingManager *v13;
  HDSHWidgetSchedulingManager *widgetSchedulingManager;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  HDFeatureAvailabilityManager *sleepApneaNotificationsAvailabilityManager;
  void *v20;
  char v21;
  void *v22;
  int v23;
  HDSHSleepApneaNotificationUITriggerObserver *v24;
  HDSHSleepApneaNotificationUITriggerObserver *triggerObserver;
  HDSHSleepApneaRescindedNotificationManager *v26;
  HDSHSleepApneaRescindedNotificationManager *rescindedNotificationManager;
  HDSHBreathingDisturbanceAnalysisScheduler *v28;
  HDFeatureAvailabilityManager *v29;
  void *v30;
  uint64_t v31;
  HDSHBreathingDisturbanceAnalysisScheduler *breathingDisturbanceAnalysisScheduler;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HDSHProfileExtension;
  v5 = -[HDSHProfileExtension init](&v38, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_14;
  objc_storeWeak((id *)&v5->_profile, v4);
  v7 = -[HDSHAccessibilityAssertionManager initWithProfile:]([HDSHAccessibilityAssertionManager alloc], "initWithProfile:", v4);
  accessibilityAssertionManager = v6->_accessibilityAssertionManager;
  v6->_accessibilityAssertionManager = v7;

  WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hksp_supportsHealthData");

  if (v12)
  {
    v13 = -[HDSHWidgetSchedulingManager initWithProfile:]([HDSHWidgetSchedulingManager alloc], "initWithProfile:", v4);
    widgetSchedulingManager = v6->_widgetSchedulingManager;
    v6->_widgetSchedulingManager = v13;

  }
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "features");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "nebula");

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BE40AB8], "hdsh_sleepApneaNotificationsAvailabilityManagerWithProfile:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    sleepApneaNotificationsAvailabilityManager = v6->_sleepApneaNotificationsAvailabilityManager;
    v6->_sleepApneaNotificationsAvailabilityManager = (HDFeatureAvailabilityManager *)v18;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isAppleWatch");

      if ((v21 & 1) == 0)
      {
        triggerObserver = (HDSHSleepApneaNotificationUITriggerObserver *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureAvailabilityProviding:healthDataSource:", v6->_sleepApneaNotificationsAvailabilityManager, v4);
        v26 = -[HDSHSleepApneaRescindedNotificationManager initWithProfile:featureStatusProvider:]([HDSHSleepApneaRescindedNotificationManager alloc], "initWithProfile:featureStatusProvider:", v4, triggerObserver);
        rescindedNotificationManager = v6->_rescindedNotificationManager;
        v6->_rescindedNotificationManager = v26;

        v28 = [HDSHBreathingDisturbanceAnalysisScheduler alloc];
        v29 = v6->_sleepApneaNotificationsAvailabilityManager;
        HKSPCurrentDateProvider();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[HDSHBreathingDisturbanceAnalysisScheduler initWithProfile:featureStatusProvider:featureAvailabilityProviding:currentDateProvider:](v28, "initWithProfile:featureStatusProvider:featureAvailabilityProviding:currentDateProvider:", v4, triggerObserver, v29, v30);
        breathingDisturbanceAnalysisScheduler = v6->_breathingDisturbanceAnalysisScheduler;
        v6->_breathingDisturbanceAnalysisScheduler = (HDSHBreathingDisturbanceAnalysisScheduler *)v31;

        goto LABEL_11;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isAppleWatch");

      if (v23)
      {
        v24 = -[HDSHSleepApneaNotificationUITriggerObserver initWithProfile:]([HDSHSleepApneaNotificationUITriggerObserver alloc], "initWithProfile:", v4);
        triggerObserver = v6->_triggerObserver;
        v6->_triggerObserver = v24;
LABEL_11:

      }
    }
  }
  _HKInitializeLogging();
  v33 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    v35 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v40 = v35;
    v36 = v35;
    _os_log_impl(&dword_21AB9E000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);

  }
LABEL_14:

  return v6;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDSHBreathingDisturbanceAnalysisScheduler)breathingDisturbanceAnalysisScheduler
{
  return self->_breathingDisturbanceAnalysisScheduler;
}

- (void)setBreathingDisturbanceAnalysisScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_breathingDisturbanceAnalysisScheduler, a3);
}

- (HDSHAccessibilityAssertionManager)accessibilityAssertionManager
{
  return self->_accessibilityAssertionManager;
}

- (HDSHWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_breathingDisturbanceAnalysisScheduler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_triggerObserver, 0);
  objc_storeStrong((id *)&self->_rescindedNotificationManager, 0);
  objc_storeStrong((id *)&self->_sleepApneaNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertionManager, 0);
}

@end

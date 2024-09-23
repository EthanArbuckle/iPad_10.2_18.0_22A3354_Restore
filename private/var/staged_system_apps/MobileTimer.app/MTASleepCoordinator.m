@implementation MTASleepCoordinator

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
  objc_storeStrong((id *)&self->_sleepStore, a3);
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void)setHealthQueue:(id)a3
{
  objc_storeStrong((id *)&self->_healthQueue, a3);
}

- (void)setFeatureStore:(id)a3
{
  objc_storeStrong((id *)&self->_featureStore, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void)localSetup
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_queue_t v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v3 = (void *)qword_1000BFB70;
  v29 = qword_1000BFB70;
  if (!qword_1000BFB70)
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = (uint64_t)sub_100006708;
    v24 = &unk_100099710;
    v25 = &v26;
    sub_100006708((uint64_t)&v21);
    v3 = (void *)v27[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v26, 8);
  v5 = (void *)objc_opt_new(v4);
  -[MTASleepCoordinator setHealthStore:](self, "setHealthStore:", v5);

  v6 = objc_alloc((Class)HKSPSleepStore);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator healthStore](self, "healthStore"));
  v8 = objc_msgSend(v6, "initWithHealthStore:", v7);
  -[MTASleepCoordinator setSleepStore:](self, "setSleepStore:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator sleepStore](self, "sleepStore"));
  objc_msgSend(v9, "addObserver:", self);

  v10 = dispatch_queue_create("com.apple.mobiletimer.health", 0);
  -[MTASleepCoordinator setHealthQueue:](self, "setHealthQueue:", v10);

  v11 = objc_alloc((Class)HKSPFeatureAvailabilityStore);
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x2020000000;
  v12 = (id *)qword_1000BFB80;
  v24 = (void *)qword_1000BFB80;
  if (!qword_1000BFB80)
  {
    v13 = (void *)sub_100006C2C();
    v12 = (id *)dlsym(v13, "HKFeatureIdentifierSleepCoaching");
    *(_QWORD *)(v22 + 24) = v12;
    qword_1000BFB80 = (uint64_t)v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
    sub_100064F50();
  v14 = *v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator sleepStore](self, "sleepStore"));
  v16 = objc_msgSend(v11, "initWithFeatureIdentifier:sleepStore:", v14, v15);

  -[MTASleepCoordinator setFeatureStore:](self, "setFeatureStore:", v16);
  v17 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  -[MTASleepCoordinator setCalendar:](self, "setCalendar:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator calendar](self, "calendar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v18, "setTimeZone:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"));
  objc_msgSend(v20, "addObserver:forBundleIdentifier:", self, kHKHealthAppBundleIdentifier);

}

- (MTASleepCoordinator)init
{
  uint64_t v3;
  NSObject *v4;
  MTASleepCoordinator *v5;
  MTASleepCoordinator *v6;
  objc_super v8;
  uint8_t buf[4];
  MTASleepCoordinator *v10;

  v3 = MTLogForCategory(7, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)MTASleepCoordinator;
  v5 = -[MTASleepCoordinator init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTASleepCoordinator localSetup](v5, "localSetup");
  return v6;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSPFeatureAvailabilityStore)featureStore
{
  return self->_featureStore;
}

- (BOOL)didCompleteSleepOnboarding
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v11;
  uint8_t buf[4];
  MTASleepCoordinator *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator featureStore](self, "featureStore"));
  v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isCurrentOnboardingVersionCompletedWithError:", &v11));
  v5 = v11;

  v7 = MTLogForCategory(7, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ completed sleep onboarding check with result: %{public}@, error: %{public}@ ", buf, 0x20u);
  }

  if (v5)
    v9 = 0;
  else
    v9 = objc_msgSend(v4, "BOOLValue");

  return v9;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplicationWorkspaceObserver sharedWorkspaceObserver](MTApplicationWorkspaceObserver, "sharedWorkspaceObserver"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTASleepCoordinator;
  -[MTASleepCoordinator dealloc](&v4, "dealloc");
}

- (id)sleepEditController
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)qword_1000BFB88;
  v13 = qword_1000BFB88;
  if (!qword_1000BFB88)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001BA3C;
    v9[3] = &unk_100099710;
    v9[4] = &v10;
    sub_10001BA3C((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v5 = [v4 alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator sleepStore](self, "sleepStore"));
  v7 = objc_msgSend(v5, "initWithSleepStore:", v6);

  objc_msgSend(v7, "setSleepDelegate:", self);
  return v7;
}

- (BOOL)isHealthAppNotInstalled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v3 = objc_msgSend(v2, "healthAppNotInstalled");

  return v3;
}

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  MTASleepCoordinator *v10;

  v4 = a3;
  v6 = MTLogForCategory(7, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller will save schedule", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, &stru_1000996C8);

}

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  MTASleepCoordinator *v9;

  v5 = MTLogForCategory(7, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller did save schedule", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate"));
  objc_msgSend(v7, "didDismissViewController");

}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  MTASleepCoordinator *v11;

  v4 = a3;
  v6 = MTLogForCategory(7, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller did cancel", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, &stru_1000996E8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate"));
  objc_msgSend(v9, "didDismissViewController");

}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  MTASleepCoordinator *v11;
  __int16 v12;
  id v13;

  v5 = a4;
  v7 = MTLogForCategory(7, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller presenting alert: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate"));
  objc_msgSend(v9, "presentSleepAlert:", v5);

}

- (id)sleepMetadata
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator sleepStore](self, "sleepStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator calendar](self, "calendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_sleepMetaDataForUpcomingAlarmInCalendar:error:", v4, 0));

  return v5;
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  MTASleepCoordinator *v9;

  v5 = MTLogForCategory(7, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep schedule model did change", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate"));
  objc_msgSend(v7, "sleepScheduleModelDidChange");

}

- (void)observedApplicationDidInstallForBundleIdentifier:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate", a3));
  objc_msgSend(v3, "healthAppInstallationDidChange");

}

- (void)observedApplicationDidUninstallForBundleIdentifier:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTASleepCoordinator delegate](self, "delegate", a3));
  objc_msgSend(v3, "healthAppInstallationDidChange");

}

- (MTASleepCoordinatorDelegate)delegate
{
  return (MTASleepCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)healthQueue
{
  return self->_healthQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_healthQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

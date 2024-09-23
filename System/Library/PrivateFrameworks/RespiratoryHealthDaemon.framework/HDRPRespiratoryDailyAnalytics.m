@implementation HDRPRespiratoryDailyAnalytics

- (HDRPRespiratoryDailyAnalytics)initWithProfile:(id)a3 featureAvailabilityProvider:(id)a4
{
  id v7;
  id v8;
  HDRPRespiratoryDailyAnalytics *v9;
  HDRPRespiratoryDailyAnalytics *v10;
  double v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDRPRespiratoryDailyAnalytics;
  v9 = -[HDRPRespiratoryDailyAnalytics init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_featureAvailabilityProvider, a4);
    v11 = (double)(uint64_t)*MEMORY[0x24BDAC608];
    v10->_calculationPeriod = (double)(uint64_t)*MEMORY[0x24BDAC638];
    v10->_retryPeriod = v11;
    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    -[HDProfile daemon](v10->_profile, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerDaemonReadyObserver:queue:", v10, v10->_queue);

  }
  return v10;
}

- (void)daemonReady:(id)a3
{
  id v4;
  HDPeriodicActivity *v5;
  HDPeriodicActivity *periodicActivity;
  id v7;

  v4 = objc_alloc(MEMORY[0x24BE40B70]);
  -[HDRPRespiratoryDailyAnalytics profile](self, "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDRPRespiratoryDailyAnalytics calculationPeriod](self, "calculationPeriod");
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, CFSTR("com.apple.healthd.respiratory.DailyAnalyticsCalculator"), self, *MEMORY[0x24BDD3050]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;

}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x24BDAC598];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x24BDAC5D8], 14400.0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  void (**v5)(id, int64_t, id);
  int64_t v6;
  id v7;
  id v8;

  v8 = 0;
  v5 = (void (**)(id, int64_t, id))a4;
  v6 = -[HDRPRespiratoryDailyAnalytics _gatherAndSendDailyAnalyticsAndReturnError:](self, "_gatherAndSendDailyAnalyticsAndReturnError:", &v8);
  v7 = v8;
  -[HDRPRespiratoryDailyAnalytics retryPeriod](self, "retryPeriod");
  v5[2](v5, v6, v7);

}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (int64_t)_gatherAndSendDailyAnalyticsAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  HDRPDailyAnalyticsReport *v14;
  HDProfile *profile;
  HKFeatureAvailabilityProviding *featureAvailabilityProvider;
  void *v17;
  void *v18;
  void *v19;
  HDRPDailyAnalyticsReport *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  int64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v36;
  id *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall") & 1) == 0
    && -[HDRPRespiratoryDailyAnalytics _hasAnalyticsBeenReportedForToday:](self, "_hasAnalyticsBeenReportedForToday:", v5))
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      v41 = (id)objc_opt_class();
      v8 = v41;
      _os_log_impl(&dword_21A8A8000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analytics have already been gathered for today.", buf, 0xCu);

    }
LABEL_14:
    v29 = 1;
    goto LABEL_23;
  }
  if ((AnalyticsIsEventUsed() & 1) == 0)
  {
    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x24BDD3050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      *(_DWORD *)buf = 138543618;
      v41 = (id)objc_opt_class();
      v42 = 2114;
      v43 = CFSTR("com.apple.health.respiratory.Daily");
      v32 = v41;
      _os_log_impl(&dword_21A8A8000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analytics is disabled for %{public}@, skipping.", buf, 0x16u);

    }
    goto LABEL_14;
  }
  v37 = a3;
  v9 = HKImproveHealthAndActivityAnalyticsAllowed();
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543618;
    v41 = (id)objc_opt_class();
    v42 = 1024;
    LODWORD(v43) = v9;
    v12 = v41;
    _os_log_impl(&dword_21A8A8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Collecting daily analytics isHealthDataSubmissionAllowed = %d", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = [HDRPDailyAnalyticsReport alloc];
  profile = self->_profile;
  featureAvailabilityProvider = self->_featureAvailabilityProvider;
  -[HDRPRespiratoryDailyAnalytics profile](self, "profile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRPRespiratoryDailyAnalytics _settingsWithProfile:](self, "_settingsWithProfile:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ControlCenter"));
  LOBYTE(v36) = v9;
  v38 = (void *)v13;
  v20 = -[HDRPDailyAnalyticsReport initWithDate:profile:pairedDeviceRegistry:featureAvailabilityProvider:oxygenSaturationSettings:controlCenterUserDefaults:healthDataCollectionAllowed:](v14, "initWithDate:profile:pairedDeviceRegistry:featureAvailabilityProvider:oxygenSaturationSettings:controlCenterUserDefaults:healthDataCollectionAllowed:", v5, profile, v13, featureAvailabilityProvider, v18, v19, v36);

  v39 = 0;
  -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:](v20, "generatePayloadAndReturnError:", &v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v39;
  _HKInitializeLogging();
  v23 = (void *)*MEMORY[0x24BDD3050];
  v24 = *MEMORY[0x24BDD3050];
  if (v21)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v23;
      v26 = (void *)objc_opt_class();
      v27 = v26;
      objc_msgSend(v21, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      v42 = 2114;
      v43 = CFSTR("com.apple.health.respiratory.Daily");
      v44 = 2114;
      v45 = v28;
      _os_log_impl(&dword_21A8A8000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending %{public}@: %{public}@", buf, 0x20u);

    }
    AnalyticsSendEvent();
    v29 = 0;
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[HDRPRespiratoryDailyAnalytics _gatherAndSendDailyAnalyticsAndReturnError:].cold.1(v23, (uint64_t)self, (uint64_t)v22);
    v33 = v22;
    v34 = v33;
    if (v33)
    {
      if (v37)
        *v37 = objc_retainAutorelease(v33);
      else
        _HKLogDroppedError();
    }

    v29 = 2;
  }

LABEL_23:
  return v29;
}

- (BOOL)_hasAnalyticsBeenReportedForToday:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[HDRPRespiratoryDailyAnalytics periodicActivity](self, "periodicActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastSuccessfulRunDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hk_isDate:withinNumberOfCalendarDays:ofDate:", v6, 0, v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_settingsWithProfile:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkrp_respiratoryDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE808D8]);
  v5 = (void *)objc_msgSend(v4, "initWithUserDefaultsDomain:", *MEMORY[0x24BDD36F0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE808D0]), "initWithUserDefaults:userDefaultsSyncProvider:", v3, v5);

  return v6;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivity, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  return self->_featureAvailabilityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)_gatherAndSendDailyAnalyticsAndReturnError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_21A8A8000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Could not generate analytics report: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

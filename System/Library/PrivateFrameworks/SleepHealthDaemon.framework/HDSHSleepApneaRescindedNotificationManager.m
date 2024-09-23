@implementation HDSHSleepApneaRescindedNotificationManager

- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 queueOverride:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSHSleepApneaRescindedNotificationManager *v11;
  HDSHSleepApneaRescindedNotificationManager *v12;
  uint64_t v13;
  HDKeyValueDomain *localKeyValueDomain;
  id WeakRetained;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSHSleepApneaRescindedNotificationManager;
  v11 = -[HDSHSleepApneaRescindedNotificationManager init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_featureStatusProvider, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE40AD0]), "initWithCategory:domainName:profile:", 100, CFSTR("com.apple.health.Sleep.SleepApneaRescindedNotification"), v8);
    localKeyValueDomain = v12->_localKeyValueDomain;
    v12->_localKeyValueDomain = (HDKeyValueDomain *)v13;

    objc_storeStrong((id *)&v12->_queue, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v12, v12->_queue);

  }
  return v12;
}

- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HDSHSleepApneaRescindedNotificationManager *v9;

  v6 = a4;
  v7 = a3;
  HKCreateSerialDispatchQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDSHSleepApneaRescindedNotificationManager initWithProfile:featureStatusProvider:queueOverride:](self, "initWithProfile:featureStatusProvider:queueOverride:", v7, v6, v8);

  return v9;
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HKFeatureStatusProviding registerObserver:queue:](self->_featureStatusProvider, "registerObserver:queue:", self, self->_queue);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)v9 = 138543618;
    *(_QWORD *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 2112;
    *(_QWORD *)&v9[14] = v5;
    v8 = *(id *)&v9[4];
    _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature status changed to: %@", v9, 0x16u);

  }
  -[HDSHSleepApneaRescindedNotificationManager _queue_sendNotificationRequestIfNeededWithFeatureStatus:](self, "_queue_sendNotificationRequestIfNeededWithFeatureStatus:", v5, *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);

}

- (void)_queue_checkFeatureStatus
{
  HKFeatureStatusProviding *featureStatusProvider;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  featureStatusProvider = self->_featureStatusProvider;
  v10 = 0;
  -[HKFeatureStatusProviding featureStatusWithError:](featureStatusProvider, "featureStatusWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    -[HDSHSleepApneaRescindedNotificationManager _queue_sendNotificationRequestIfNeededWithFeatureStatus:](self, "_queue_sendNotificationRequestIfNeededWithFeatureStatus:", v4);
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      v9 = v8;
      _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature status is nil with error: %@", buf, 0x16u);

    }
  }

}

- (void)_queue_sendNotificationRequestIfNeededWithFeatureStatus:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  HDKeyValueDomain *localKeyValueDomain;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  os_log_t *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HDKeyValueDomain *v25;
  void *v26;
  NSObject *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  HDKeyValueDomain *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "requirementsEvaluationByContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[HDSHSleepApneaRescindedNotificationManager _isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:](self, "_isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:", v7))
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    v39 = 0;
    -[HDKeyValueDomain dateForKey:error:](localKeyValueDomain, "dateForKey:error:", CFSTR("HDSHSleepApneaRescindedNotificationDateShownKey"), &v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v39;
    if (v13)
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v16;
        v42 = 2112;
        v43 = v13;
        v17 = v16;
        _os_log_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not fetch notification last shown date with error: %@", buf, 0x16u);

LABEL_19:
      }
LABEL_20:

      goto LABEL_21;
    }
    if (-[HDSHSleepApneaRescindedNotificationManager _isFeatureRescindedWithRequirementsEvaluation:](self, "_isFeatureRescindedWithRequirementsEvaluation:", v7))
    {
      _HKInitializeLogging();
      v18 = (os_log_t *)MEMORY[0x24BDD3060];
      v19 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v21;
        v42 = 2112;
        v43 = v12;
        v22 = v21;
        _os_log_impl(&dword_21AB9E000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep apnea notifications are rescinded. Notification was last shown: %@", buf, 0x16u);

      }
      if (v12)
        goto LABEL_20;
      objc_msgSend(v7, "highestPriorityUnsatisfiedRequirement");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSHSleepApneaRescindedNotificationManager _rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:](self, "_rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:", v23);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "highestPriorityUnsatisfiedRequirement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSHSleepApneaRescindedNotificationManager _showRescindedNotificationWithTitleAndBodyKeys:rescindedReason:](self, "_showRescindedNotificationWithTitleAndBodyKeys:rescindedReason:", v15, v24);

      v25 = self->_localKeyValueDomain;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      -[HDKeyValueDomain setDate:forKey:error:](v25, "setDate:forKey:error:", v26, CFSTR("HDSHSleepApneaRescindedNotificationDateShownKey"), &v38);
      v27 = v38;

      if (v27)
      {
        _HKInitializeLogging();
        v28 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v41 = v30;
          v42 = 2112;
          v43 = 0;
          v31 = v30;
          _os_log_impl(&dword_21AB9E000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error writing last shown date for notification: %@", buf, 0x16u);

        }
      }
    }
    else
    {
      if (!v12)
        goto LABEL_20;
      -[HDSHSleepApneaRescindedNotificationManager _showRescindedNotificationWithTitleAndBodyKeys:rescindedReason:](self, "_showRescindedNotificationWithTitleAndBodyKeys:rescindedReason:", &unk_24DDBB778, 0);
      v32 = self->_localKeyValueDomain;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("HDSHSleepApneaRescindedNotificationDateShownKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      -[HDKeyValueDomain removeValuesForKeys:error:](v32, "removeValuesForKeys:error:", v33, &v37);
      v15 = v37;

      if (!v15)
        goto LABEL_19;
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x24BDD3060];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v27 = v34;
      v35 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v41 = v35;
      v42 = 2112;
      v43 = 0;
      v36 = v35;
      _os_log_impl(&dword_21AB9E000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error resetting last shown date for notification: %@", buf, 0x16u);

    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543362;
    v41 = (id)objc_opt_class();
    v10 = v41;
    _os_log_impl(&dword_21AB9E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep apnea notifications are unavailable for non-rescinded reasons.", buf, 0xCu);

  }
LABEL_21:

}

- (id)_rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24DDBB790);
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2D08]) & 1) != 0)
  {
    v5 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_REMOTELY_DISABLED");
    v6 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_REMOTELY_DISABLED");
LABEL_9:
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v6, 0);
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v5, 1);
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2DA0]) & 1) != 0)
  {
    v5 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_SEED_EXPIRED");
    v6 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_SEED_EXPIRED");
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2CF8]) & 1) != 0)
  {
    v5 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_UNSUPPORTED_REGION");
    v6 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_UNSUPPORTED_REGION");
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2CF0]))
  {
    v5 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_WATCH_UNSUPPORTED_REGION");
    v6 = CFSTR("SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_WATCH_UNSUPPORTED_REGION");
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_showRescindedNotificationWithTitleAndBodyKeys:(id)a3 rescindedReason:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
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
  id v23;
  _QWORD v24[5];
  id v25;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDF8800];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedUserNotificationStringForKey:arguments:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localizedUserNotificationStringForKey:arguments:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBody:", v15);

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSound:", v16);

  if (v6)
  {
    -[HDSHSleepApneaRescindedNotificationManager _categoryIdentifierFromRescindedReason:](self, "_categoryIdentifierFromRescindedReason:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCategoryIdentifier:", v17);

  }
  else
  {
    objc_msgSend(v9, "setCategoryIdentifier:", *MEMORY[0x24BEA99E0]);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24DDBB7C0, *MEMORY[0x24BDD46A8]);
  objc_msgSend(v9, "setUserInfo:", v18);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v19);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hk_dateByAddingDays:toDate:", 1, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpirationDate:", v21);

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", *MEMORY[0x24BEA9A08], v9, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke;
  v24[3] = &unk_24DDB8B60;
  v24[4] = self;
  v25 = v22;
  v23 = v22;
  dispatch_async(MEMORY[0x24BDAC9B8], v24);

}

void __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void (**v9)(id, _QWORD);
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "unitTesting_postNotificationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "unitTesting_postNotificationHandler");
    v9 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, *(_QWORD *)(a1 + 40));

  }
  else
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      v5 = v12;
      _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] About to show rescinded notification for sleep apnea notifications.", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "notificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke_226;
    v10[3] = &unk_24DDB8B38;
    v8 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "postNotificationWithRequest:completion:", v8, v10);

  }
}

void __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke_226(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v7 = 138543618;
      v8 = (id)objc_opt_class();
      v9 = 2112;
      v10 = v3;
      v6 = v8;
      _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error posting rescinded notification: %@", (uint8_t *)&v7, 0x16u);

    }
  }

}

- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSHSleepApneaRescindedNotificationManager _rescindedRequirementIdentifiers](self, "_rescindedRequirementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v22 = (id)objc_opt_class();
    v23 = 2112;
    v24 = v7;
    v10 = v22;
    _os_log_impl(&dword_21AB9E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for rescinded reasons: %@", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v12) = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  return v12;
}

- (BOOL)_isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSHSleepApneaRescindedNotificationManager _rescindedRequirementIdentifiers](self, "_rescindedRequirementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v22 = (id)objc_opt_class();
    v23 = 2112;
    v24 = v7;
    v10 = v22;
    _os_log_impl(&dword_21AB9E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for non-rescinded reasons: %@", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)))
        {
          LOBYTE(v12) = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

  return v12;
}

- (id)_rescindedRequirementIdentifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDD2DA0];
  v8[0] = *MEMORY[0x24BDD2D08];
  v8[1] = v3;
  v4 = *MEMORY[0x24BDD2CF0];
  v8[2] = *MEMORY[0x24BDD2CF8];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_categoryIdentifierFromRescindedReason:(id)a3
{
  id v3;
  id *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2D08]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA99F8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2DA0]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA9A00];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2CF8]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA99F0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2CF0]))
    {
      v5 = &stru_24DDB8FF8;
      goto LABEL_10;
    }
    v4 = (id *)MEMORY[0x24BEA99E8];
  }
  v5 = (__CFString *)*v4;
LABEL_10:

  return v5;
}

- (id)unitTesting_postNotificationHandler
{
  return self->_unitTesting_postNotificationHandler;
}

- (void)setUnitTesting_postNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end

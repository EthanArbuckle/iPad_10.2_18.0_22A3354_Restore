@implementation HKSHSleepApneaNotificationInteractedAnalyticsEvent

- (HKSHSleepApneaNotificationInteractedAnalyticsEvent)initWithNotificationResponse:(id)a3
{
  id v5;
  HKSHSleepApneaNotificationInteractedAnalyticsEvent *v6;
  HKSHSleepApneaNotificationInteractedAnalyticsEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepApneaNotificationInteractedAnalyticsEvent;
  v6 = -[HKSHSleepApneaNotificationInteractedAnalyticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_response, a3);

  return v7;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  os_log_t *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  HKSHSleepApneaNotificationInteractedAnalyticsEvent *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("areHealthNotificationsAuthorized"));
  -[HKSHSleepApneaNotificationInteractedAnalyticsEvent _notificationType](self, "_notificationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  -[HKSHSleepApneaNotificationInteractedAnalyticsEvent _notificationAction](self, "_notificationAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("action"));

  objc_msgSend(v5, "healthDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "ageWithCurrentDate:error:", v11, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v24;

  v14 = (os_log_t *)MEMORY[0x24BDD3060];
  v15 = v12;
  if (v13)
  {
    _HKInitializeLogging();
    v16 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2112;
      v28 = v13;
      _os_log_error_impl(&dword_20A366000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching age from data source: %@", buf, 0x16u);
    }
    v15 = (void *)*MEMORY[0x24BDD2788];
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD27B0]);
  objc_msgSend(v5, "healthDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(v17, "biologicalSexWithError:", &v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;

  if (v19)
  {
    _HKInitializeLogging();
    v20 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2112;
      v28 = v19;
      _os_log_error_impl(&dword_20A366000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error biological sex from data source: %@", buf, 0x16u);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD27F8], *MEMORY[0x24BDD27C0]);
  }
  else
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDD27C0]);

  }
  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)_notificationType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[UNNotificationResponse notification](self->_response, "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PossibleSleepApnea")) & 1) != 0)
  {
    v6 = CFSTR("possible sleep apnea");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SleepApneaNotificationsRemoteDisabled")) & 1) != 0)
  {
    v6 = CFSTR("remote disabled");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SleepApneaNotificationsSeedExpired")) & 1) != 0)
  {
    v6 = CFSTR("seed expired");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SleepApneaNotificationsLocalDeviceNoLongerSupported")) & 1) != 0)
  {
    v6 = CFSTR("feature no longer supported on local device");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SleepApneaNotificationsActiveRemoteDeviceNoLongerSupported")) & 1) != 0)
  {
    v6 = CFSTR("feature no longer supported on active remote device");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SleepApneaNotificationsFeatureIsAvailableAgainAndEnabled")) & 1) != 0)
  {
    v6 = CFSTR("feature is available again and enabled");
  }
  else
  {
    v6 = (__CFString *)(id)*MEMORY[0x24BDD27F8];
  }

  return v6;
}

- (id)_notificationAction
{
  void *v2;
  __CFString *v3;

  -[UNNotificationResponse actionIdentifier](self->_response, "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF8A60]) & 1) != 0)
  {
    v3 = CFSTR("openApp");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF8A70]) & 1) != 0)
  {
    v3 = CFSTR("dismiss");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SleepApneaNotificationInteractionAnalyticsNotificationActionLearnMore")) & 1) != 0)
  {
    v3 = CFSTR("learnMore");
  }
  else
  {
    v3 = (__CFString *)(id)*MEMORY[0x24BDD27F8];
  }

  return v3;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.bd.notificationinteractions");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end

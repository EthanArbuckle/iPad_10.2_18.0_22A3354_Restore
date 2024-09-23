@implementation HKSHSleepApneaNotificationsBridgeSettingsFactory

- (HKSHSleepApneaNotificationsBridgeSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4;
  HKSHSleepApneaNotificationsBridgeSettingsFactory *v5;
  HKSHSleepApneaNotificationsBridgeSettingsFactory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKSHSleepApneaNotificationsBridgeSettingsFactory;
  v5 = -[HKSHSleepApneaNotificationsBridgeSettingsFactory init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HKSHSleepApneaNotificationsBridgeSettingsFactory setFeatureStatus:](v5, "setFeatureStatus:", v4);

  return v6;
}

- (id)bridgeSettings
{
  _BOOL8 v3;
  void *v4;
  HKSHSleepApneaNotificationsBridgeSettings *v5;
  void *v6;
  HKSHSleepApneaNotificationsBridgeSettings *v7;
  int v8;
  int v9;
  char v10;
  BOOL v11;
  void **v12;
  void *v13;
  id *v14;
  id v15;
  id v16;
  int v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  void *v23;
  HKSHSleepApneaNotificationsBridgeSettings *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HKSHSleepApneaNotificationsBridgeSettings *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[HKSHSleepApneaNotificationsBridgeSettingsFactory _areNotificationsOnboarded](self, "_areNotificationsOnboarded");
  -[HKSHSleepApneaNotificationsBridgeSettingsFactory _requirementsEvaluationForIsOnboarded:](self, "_requirementsEvaluationForIsOnboarded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HKSHSleepApneaNotificationsBridgeSettingsFactory _isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:](self, "_isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:", v3, v4))
  {
    v8 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F68]);
    v9 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F80]);
    v10 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F20]);
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11 || (v10 & 1) == 0)
    {
      +[HKSHSleepApneaNotificationsBridgeSettings hiddenSettings](HKSHSleepApneaNotificationsBridgeSettings, "hiddenSettings");
      v7 = (HKSHSleepApneaNotificationsBridgeSettings *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v12 = (void **)MEMORY[0x1E0CB4F38];
    if (!v3)
      v12 = (void **)MEMORY[0x1E0CB4F48];
    v13 = *v12;
    if (v3)
      v14 = (id *)MEMORY[0x1E0CB4F30];
    else
      v14 = (id *)MEMORY[0x1E0CB4F40];
    v15 = v13;
    v16 = *v14;
    v17 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", v15);
    v18 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", v16);
    v19 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F50]);
    v20 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FC0]);
    v21 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FD0]);
    v22 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FB0]);
    if (v17 && (v18 & 1) != 0)
    {
      if ((v19 & 1) != 0)
      {
        if ((v20 & 1) != 0)
        {
          if ((v22 & 1) != 0)
          {
            if ((v21 & 1) != 0)
            {
              if (v3)
              {
                _HKInitializeLogging();
                v23 = (void *)*MEMORY[0x1E0CB5368];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_INFO))
                  goto LABEL_34;
                goto LABEL_35;
              }
              if (!objc_msgSend(v4, "areAllRequirementsSatisfied"))
              {
                _HKInitializeLogging();
                v23 = (void *)*MEMORY[0x1E0CB5368];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_INFO))
                {
LABEL_34:
                  v31 = v23;
                  *(_DWORD *)v33 = 138412290;
                  *(_QWORD *)&v33[4] = objc_opt_class();
                  v32 = *(id *)&v33[4];
                  _os_log_impl(&dword_1A9B87000, v31, OS_LOG_TYPE_INFO, "[%@]: Requested bridge settings for unknown feature state", v33, 0xCu);

                }
LABEL_35:
                +[HKSHSleepApneaNotificationsBridgeSettings hiddenSettings](HKSHSleepApneaNotificationsBridgeSettings, "hiddenSettings", *(_OWORD *)v33);
                v7 = (HKSHSleepApneaNotificationsBridgeSettings *)objc_claimAutoreleasedReturnValue();
                goto LABEL_29;
              }
              v29 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
              -[HKSHSleepApneaNotificationsBridgeSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = -[HKSHSleepApneaNotificationsBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:](v29, "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, 1, 1, v30);

LABEL_29:
              goto LABEL_30;
            }
            v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
            v25 = v3 ^ 1;
            -[HKSHSleepApneaNotificationsBridgeSettingsFactory _wristDetectionDisabledBridgeSettingFooter](self, "_wristDetectionDisabledBridgeSettingFooter");
            v26 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
            v25 = v3 ^ 1;
            -[HKSHSleepApneaNotificationsBridgeSettingsFactory _sleepTrackingDisabledBridgeSettingFooter](self, "_sleepTrackingDisabledBridgeSettingFooter");
            v26 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
          v25 = v3 ^ 1;
          -[HKSHSleepApneaNotificationsBridgeSettingsFactory _seedExpiredBridgeSettingFooter](self, "_seedExpiredBridgeSettingFooter");
          v26 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
        v25 = v3 ^ 1;
        -[HKSHSleepApneaNotificationsBridgeSettingsFactory _remoteDisabledBridgeSettingFooter](self, "_remoteDisabledBridgeSettingFooter");
        v26 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
      v25 = v3 ^ 1;
      -[HKSHSleepApneaNotificationsBridgeSettingsFactory _regionGatedBridgeSettingFooter](self, "_regionGatedBridgeSettingFooter");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v26;
    v7 = -[HKSHSleepApneaNotificationsBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:](v24, "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, 0, v25, v26);

    goto LABEL_29;
  }
  v5 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
  -[HKSHSleepApneaNotificationsBridgeSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKSHSleepApneaNotificationsBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:](v5, "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, 1, 0, v6);

LABEL_30:
  return v7;
}

- (BOOL)_areNotificationsOnboarded
{
  void *v3;
  BOOL v4;

  if (!-[HKFeatureStatus isOnboardingRecordPresent](self->_featureStatus, "isOnboardingRecordPresent"))
    return 0;
  -[HKFeatureStatus onboardingRecord](self->_featureStatus, "onboardingRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "onboardingState") != 1;

  return v4;
}

- (id)_requirementsEvaluationForIsOnboarded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  v3 = a3;
  -[HKFeatureStatus requirementsEvaluationByContext](self->_featureStatus, "requirementsEvaluationByContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (_QWORD *)MEMORY[0x1E0CB4ED0];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0CB4E70];
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a4, "unsatisfiedRequirementIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8[0] = *MEMORY[0x1E0CB4F58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)_genericBridgeSettingFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSHSleepApneaNotificationsFooter *v10;
  void *v11;
  void *v12;
  HKSHSleepApneaNotificationsFooter *v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_ENABLED_FOOTER_LINK_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FOOTER_FORMAT_STRING"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_ENABLED_FOOTER_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HKSHSleepApneaNotificationsFooter alloc];
  HKSPSleepURL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:](v10, "initWithText:link:url:", v9, v3, v12);

  return v13;
}

- (id)_regionGatedBridgeSettingFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSHSleepApneaNotificationsFooter *v10;
  void *v11;
  void *v12;
  HKSHSleepApneaNotificationsFooter *v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FOOTER_FORMAT_STRING"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FEATURE_REGION_GATED_FOOTER_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HKSHSleepApneaNotificationsFooter alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_NOTIFICATIONS_REGION_GATED_URL"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:](v10, "initWithText:link:url:", v9, v3, v12);

  return v13;
}

- (id)_remoteDisabledBridgeSettingFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSHSleepApneaNotificationsFooter *v10;
  void *v11;
  void *v12;
  HKSHSleepApneaNotificationsFooter *v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FOOTER_FORMAT_STRING"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FEATURE_REGION_GATED_FOOTER_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HKSHSleepApneaNotificationsFooter alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_NOTIFICATIONS_REGION_GATED_URL"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:](v10, "initWithText:link:url:", v9, v3, v12);

  return v13;
}

- (id)_seedExpiredBridgeSettingFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKSHSleepApneaNotificationsFooter *v10;
  void *v11;
  void *v12;
  HKSHSleepApneaNotificationsFooter *v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_FOOTER_FORMAT_STRING"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_SEED_EXPIRED_FOOTER_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HKSHSleepApneaNotificationsFooter alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_NOTIFICATIONS_SEED_EXPIRED_URL"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:](v10, "initWithText:link:url:", v9, v3, v12);

  return v13;
}

- (id)_sleepTrackingDisabledBridgeSettingFooter
{
  HKSHSleepApneaNotificationsFooter *v2;
  void *v3;
  void *v4;
  HKSHSleepApneaNotificationsFooter *v5;

  v2 = [HKSHSleepApneaNotificationsFooter alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_SLEEP_TRACKING_DISABLED_FOOTER_TEXT"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:](v2, "initWithText:link:url:", v4, 0, 0);

  return v5;
}

- (id)_wristDetectionDisabledBridgeSettingFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKSHSleepApneaNotificationsFooter *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PASSCODE_SETTINGS"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_APNEA_WRIST_DETECTION_DISABLED_DESCRIPTION_FOOTER_TEXT_%@"), &stru_1E55DF628, CFSTR("Localizable-Nebula"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKSHSleepApneaNotificationsFooter initWithText:link:url:]([HKSHSleepApneaNotificationsFooter alloc], "initWithText:link:url:", v7, v3, CFSTR("bridge:root=PASSCODE_ID"));
  return v8;
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStatus, 0);
}

@end

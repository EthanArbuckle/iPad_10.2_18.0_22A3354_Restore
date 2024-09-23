@implementation HDSPWakeUpResultsNotificationLocalizer

- (HDSPWakeUpResultsNotificationLocalizer)initWithNotification:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HDSPWakeUpResultsNotificationLocalizer *v9;
  HDSPWakeUpResultsNotificationLocalizer *v10;
  HDSPWakeUpResultsNotificationLocalizer *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSPWakeUpResultsNotificationLocalizer;
  v9 = -[HDSPWakeUpResultsNotificationLocalizer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)localizedTitle
{
  return HDSPLocalizedString(CFSTR("RESULT_NOTIFICATION_TITLE"));
}

- (id)localizedBody
{
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  __CFString *v9;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "category");

  if (v4 == 2)
  {
    v13 = 0;
    v5 = (id *)&v13;
    -[HDSPWakeUpResultsNotificationLocalizer _localizedBodyForTwoWeekNotificationWithError:](self, "_localizedBodyForTwoWeekNotificationWithError:", &v13);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 1)
  {
    v14 = 0;
    v5 = (id *)&v14;
    -[HDSPWakeUpResultsNotificationLocalizer _localizedBodyForOneWeekDayNotificationWithError:](self, "_localizedBodyForOneWeekDayNotificationWithError:", &v14);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v9 = &stru_24D4E68A0;
      return v9;
    }
    v15 = 0;
    v5 = (id *)&v15;
    -[HDSPWakeUpResultsNotificationLocalizer _localizedBodyForOneDayNotificationWithError:](self, "_localizedBodyForOneDayNotificationWithError:", &v15);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = *v5;
  if (v7)
  {
    v9 = -[NSObject copy](v7, "copy");
  }
  else
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v8;
      v12 = v11;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0x16u);

    }
    v9 = &stru_24D4E68A0;
  }

  return v9;
}

- (id)_localizedBodyForOneDayNotificationWithError:(id *)a3
{
  double v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPWakeUpResultsNotificationLocalizer category](self, "category"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 83, CFSTR("This method can only localized content for One Day Wake Up Results; received category %@"),
      v39);

  }
  -[HDSPWakeUpResultsNotificationLocalizer dailySleepDurationGoal](self, "dailySleepDurationGoal");
  v6 = vcvtmd_s64_f64(v5 / 3600.0);
  v7 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 1);
  v9 = objc_claimAutoreleasedReturnValue();

  -[HDSPWakeUpResultsNotificationLocalizer userFirstName](self, "userFirstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameLocalizedStringKey](self, "_embeddedNameLocalizedStringKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPLocalizedCoachingString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && v12)
  {
    -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameLocalizedStringKey](self, "_embeddedNameLocalizedStringKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingString(v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameSubstitutionStringKey](self, "_embeddedNameSubstitutionStringKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingSubstitutionString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v47 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%ld"), &v47, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v47;
      v46 = v18;
      v19 = (void *)v9;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), &v46, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      v22 = v46;

      v45 = v22;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), &v45, v10, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v45;

      v12 = v21;
    }
    else
    {
      v19 = (void *)v9;
      v44 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v44, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v44;
    }
  }
  else
  {
    -[HDSPWakeUpResultsNotificationLocalizer _regularLocalizedStringKey](self, "_regularLocalizedStringKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingString(v25);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeUpResultsNotificationLocalizer _regularSubstitutionStringKey](self, "_regularSubstitutionStringKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingSubstitutionString(v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v43 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%ld"), &v43, v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v43;
      v42 = v28;
      v19 = (void *)v9;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), &v42, v9);
      v29 = v10;
      v30 = v12;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v42;

      v41 = v32;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v41, v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v41;

      v12 = v30;
      v10 = v29;
    }
    else
    {
      v19 = (void *)v9;
      v14 = v14;
      v24 = 0;
      v23 = v14;
    }
  }

  if (v23)
  {
    v33 = v23;
  }
  else
  {
    v34 = v24;
    v35 = v34;
    if (v34)
    {
      if (a3)
      {
        *a3 = objc_retainAutorelease(v34);
      }
      else
      {
        HKSPLogForCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v35;
          _os_log_error_impl(&dword_21610C000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
        }

      }
    }

  }
  return v23;
}

- (id)_localizedBodyForOneWeekDayNotificationWithError:(id *)a3
{
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPWakeUpResultsNotificationLocalizer category](self, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 141, CFSTR("This method can only localized content for One Week Wake Up Results; received category %@"),
      v18);

  }
  v6 = -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved");
  if ((unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v6;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 147, CFSTR("One Week goal achieved count must be 3 or 4; received %@"),
      v21);

  }
  -[HDSPWakeUpResultsNotificationLocalizer userFirstName](self, "userFirstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameLocalizedStringKey](self, "_embeddedNameLocalizedStringKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPLocalizedCoachingString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") && v9)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), &v22, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
    if (!v10)
    {
      v12 = v11;
      v13 = v12;
      if (v12)
      {
        if (a3)
        {
          *a3 = objc_retainAutorelease(v12);
        }
        else
        {
          HKSPLogForCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v13;
            _os_log_error_impl(&dword_21610C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
          }

        }
      }
      goto LABEL_17;
    }
  }
  else
  {
    -[HDSPWakeUpResultsNotificationLocalizer _regularLocalizedStringKey](self, "_regularLocalizedStringKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingString(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v11 = 0;
    if (!v10)
    {
LABEL_17:
      v10 = 0;
      v11 = v13;
    }
  }

  return v10;
}

- (id)_localizedBodyForTwoWeekNotificationWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPWakeUpResultsNotificationLocalizer category](self, "category") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HDSPWakeUpResultsNotificationLocalizer category](self, "category"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 172, CFSTR("This method can only localized content for Two Week Wake Up Results; received category %@"),
      v26);

  }
  -[HDSPWakeUpResultsNotificationLocalizer userFirstName](self, "userFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameLocalizedStringKey](self, "_embeddedNameLocalizedStringKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSPLocalizedCoachingString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && v8)
  {
    -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameLocalizedStringKey](self, "_embeddedNameLocalizedStringKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingString(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeUpResultsNotificationLocalizer _embeddedNameSubstitutionStringKey](self, "_embeddedNameSubstitutionStringKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingSubstitutionString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%ld"), &v31, -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v31;
      v30 = v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@%@"), &v30, v6, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;
LABEL_9:
      v19 = v16;

      goto LABEL_12;
    }
    v29 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v29, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v29;
  }
  else
  {
    -[HDSPWakeUpResultsNotificationLocalizer _regularLocalizedStringKey](self, "_regularLocalizedStringKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingString(v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeUpResultsNotificationLocalizer _regularSubstitutionStringKey](self, "_regularSubstitutionStringKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDSPLocalizedCoachingSubstitutionString(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v28 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%ld"), &v28, -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v28;
      v27 = v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v27, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v27;
      goto LABEL_9;
    }
    v10 = v10;
    v19 = 0;
    v15 = v10;
  }
LABEL_12:

  if (v15)
  {
    v20 = v15;
  }
  else
  {
    v21 = v19;
    v22 = v21;
    if (v21)
    {
      if (a3)
      {
        *a3 = objc_retainAutorelease(v21);
      }
      else
      {
        HKSPLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v33 = v22;
          _os_log_error_impl(&dword_21610C000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected formatting error: %{public}@", buf, 0xCu);
        }

      }
    }

  }
  return v15;
}

- (unint64_t)category
{
  void *v2;
  unint64_t v3;

  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "category");

  return v3;
}

- (int64_t)notificationVariant
{
  void *v2;
  int64_t v3;

  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationVariant");

  return v3;
}

- (double)dailySleepDurationGoal
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;

  if (-[HDSPWakeUpResultsNotificationLocalizer category](self, "category"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 226, CFSTR("Daily sleep duration goal requires OneDay category"));

  }
  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goalAchieved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = v7;

  return v8;
}

- (int64_t)weeklyGoalAchieved
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;
  void *v10;

  if (!-[HDSPWakeUpResultsNotificationLocalizer category](self, "category"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationLocalizer.m"), 235, CFSTR("Weekly goal achieved requires OneWeek or TwoWeek category"));

  }
  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goalAchieved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  v8 = (unint64_t)v7;

  return v8;
}

- (id)userFirstName
{
  void *v2;
  void *v3;

  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedStringKeyBase
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;

  -[HDSPWakeUpResultsNotificationLocalizer notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "category");

  if (v4)
  {
    if (v4 == 2)
    {
      v7 = CFSTR("WAKE_UP_RESULT_TWO_WEEK_GOAL_ACHIEVED");
    }
    else if (v4 == 1)
    {
      v5 = -[HDSPWakeUpResultsNotificationLocalizer weeklyGoalAchieved](self, "weeklyGoalAchieved");
      v6 = CFSTR("WAKE_UP_RESULT_FOUR_DAY_GOAL_ACHIEVED");
      if (v5 == 3)
        v6 = CFSTR("WAKE_UP_RESULT_THREE_DAY_GOAL_ACHIEVED");
      v7 = v6;
    }
    else
    {
      v7 = &stru_24D4E68A0;
    }
  }
  else
  {
    v7 = CFSTR("WAKE_UP_RESULT_ONE_DAY_DURATION");
  }
  return v7;
}

- (id)_regularLocalizedStringKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPWakeUpResultsNotificationLocalizer _localizedStringKeyBase](self, "_localizedStringKeyBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%ld"), v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_regularSubstitutionStringKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPWakeUpResultsNotificationLocalizer _localizedStringKeyBase](self, "_localizedStringKeyBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%ld_SUBSTITUTION"), v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_embeddedNameLocalizedStringKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPWakeUpResultsNotificationLocalizer _localizedStringKeyBase](self, "_localizedStringKeyBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_NAME_%ld"), v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_embeddedNameSubstitutionStringKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPWakeUpResultsNotificationLocalizer _localizedStringKeyBase](self, "_localizedStringKeyBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_NAME_%ld_SUBSTITUTION"), v4, -[HDSPWakeUpResultsNotificationLocalizer notificationVariant](self, "notificationVariant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HDSPWakeUpResultsNotification)notification
{
  return self->_notification;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end

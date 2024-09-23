@implementation SMSafetyMonitorUtilities

+ (id)carPlayNotificationTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("SMCarPlayNotificationTypeUnknown");
  else
    return off_25166E070[a3 - 1];
}

+ (NSString)magnetBreakNotificationTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MAGNET_BREAK_NOTIFICATION_TITLE"), CFSTR("Check In"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)magnetBreakNotificationMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MAGNET_BREAK_NOTIFICATION_MESSAGE"), CFSTR("Apple Watch is no longer connected to iPhone. Check In will continue on iPhone."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)getCarPlayNotificationTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[8];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (v10)
  {
    v28 = *MEMORY[0x24BDD0FC8];
    v11 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeToString:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@, contactName, %@,"), v12, v13, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 - 1 > 3)
    {
      if (a3 == 5)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CARPLAY_NOTIFICATION_TITLE_CACHE_RELEASED"), CFSTR("%@ has been notified."), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@"), 0, v10);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      if (a4 == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("CARPLAY_NOTIFICATION_TITLE_TIMER_SESSION_ANOMALY");
        v20 = CFSTR("Your timer has ended.");
        goto LABEL_16;
      }
      if (a4 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("CARPLAY_NOTIFICATION_TITLE_DESTINATION_SESSION_ANOMALY");
        v20 = CFSTR("It looks like you’re delayed.");
LABEL_16:
        objc_msgSend(v17, "localizedStringForKey:value:table:", v19, v20, 0);
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v22 = (void *)v24;

        v25 = 0;
        if (!a6)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        *a6 = objc_retainAutorelease(v25);
        goto LABEL_19;
      }
    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v16);
    v22 = 0;
    if (!a6)
      goto LABEL_19;
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_245521000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactName", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("contactName"));
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_20:

  return v22;
}

+ (id)getCarPlayNotificationMessageForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 cacheReleaseDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[8];
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v31 = *MEMORY[0x24BDD0FC8];
    v14 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeToString:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@, contactName, %@,"), v15, v16, v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 - 1 > 3)
    {
      if (a3 == 5)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CARPLAY_NOTIFICATION_MESSAGE_CACHE_RELEASED"), CFSTR("Your location is being shared."), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        v28 = 0;
        if (!a7)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    else if (a4 - 1 <= 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CARPLAY_NOTIFICATION_MESSAGE_SESSION_ANOMALY"), CFSTR("%@ will be notified in %lu min."), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v23);
      *(float *)&v24 = v24 / 60.0;
      objc_msgSend(v22, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@%lu"), 0, v12, vcvtas_u32_f32(*(float *)&v24));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v19);
    v25 = 0;
    if (!a7)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    *a7 = objc_retainAutorelease(v28);
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_245521000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactName", buf, 2u);
  }

  if (a7)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("contactName"));
    v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_16:

  return v25;
}

+ (id)getCarPlayNotificationCategoryForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BDD0FC8];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeToString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,"), v9, v10, v11, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 - 1 <= 3)
  {
    if (a4 == 1)
    {
      v14 = SMTimerEndedNotificationCategory;
    }
    else
    {
      if (a4 != 2)
      {
        v17 = 0;
LABEL_12:
        v16 = 0;
        if (!a5)
        {
LABEL_14:
          v15 = v17;

          goto LABEL_15;
        }
LABEL_13:
        *a5 = objc_retainAutorelease(v16);
        goto LABEL_14;
      }
      v14 = SMDestinationAnomalyNotificationCategory;
    }
    v17 = *v14;
    goto LABEL_12;
  }
  if (a3 != 5)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v13);
    v17 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  v15 = CFSTR("CacheReleaseTimedOut");
LABEL_15:

  return v15;
}

+ (id)getCarPlayButtonActionIdentifierForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString **v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BDD0FC8];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeToString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,"), v9, v10, v11, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 - 1 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v13);
      goto LABEL_13;
    }
    v14 = SMCarPlayActionIdentifierOK;
  }
  else
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        v14 = SMCarPlayActionIdentifierExtendDestinationSession;
        goto LABEL_9;
      }
      v15 = 0;
LABEL_13:
      v16 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_10;
    }
    v14 = SMCarPlayActionIdentifierExtendTimerSession;
  }
LABEL_9:
  v16 = *v14;
  v15 = 0;
  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v15);
LABEL_11:
  v17 = v16;

  return v17;
}

+ (id)getCarPlayButtonTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22 = *MEMORY[0x24BDD0FC8];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "carPlayNotificationTypeToString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMSessionConfiguration sessionTypeToString:](SMSessionConfiguration, "sessionTypeToString:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,"), v9, v10, v11, v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 - 1 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v13);
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("CARPLAY_NOTIFICATION_BUTTON_TITLE_CACHE_RELEASED");
    v17 = CFSTR("OK");
  }
  else
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("CARPLAY_NOTIFICATION_BUTTON_TITLE_DESTINATION_SESSION_ANOMALY");
        v17 = CFSTR("Add Time");
        goto LABEL_9;
      }
      v18 = 0;
LABEL_13:
      v19 = 0;
      if (!a5)
        goto LABEL_11;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("CARPLAY_NOTIFICATION_BUTTON_TITLE_TIMER_SESSION_ANOMALY");
    v17 = CFSTR("Add 30 min");
  }
LABEL_9:
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v18);
LABEL_11:
  v20 = v19;

  return v20;
}

+ (id)safeArrivalMessageWithCustomizedSummaryForDestination:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("END_MESSAGE_SAFE_ARRIVAL_CUSTOMISED_DESTINATION_SUMMARY"), CFSTR("Check In: Arrived at %@"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getSuggestionTitleWithoutContactName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_NOTIFICATION_TITLE_NO_CONTACT"), CFSTR("Start a Check In with a friend"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getSuggestionTitleWithContactName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_NOTIFICATION_TITLE"), CFSTR("Start a Check In with %@"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getSuggestionBodyWithPlaceInference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_NOTIFICATION_BODY"), CFSTR("Let them know when you arrive at %@"), 0);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)v6;
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_NOTIFICATION_BODY_FALLBACK"), CFSTR("Let them know when you arrive at your destination"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)getSuggestionFooter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_NOTIFICATION_FOOTER"), CFSTR("Siri Suggestion"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSString)workoutAlwaysPromptBody
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Would you like to be reminded to Check In when starting an outdoor workout? You can customize this in Settings."), &stru_251671BC8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)workoutAlwaysPromptActionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remind Me"), &stru_251671BC8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)getNextTimePromptBody
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NEXT_TIME_PROMPT_BODY"), CFSTR("Let a friend know know next time you workout"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSString)checkInActionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Check In"), &stru_251671BC8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end

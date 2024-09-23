@implementation WFTimeTriggerLogic

+ (id)nextFireDateFromNowWithTrigger:(id)a3 currentSunriseTime:(id)a4 currentSunsetTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(a1, "nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:", v10, v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)nextFireDateForTrigger:(id)a3 currentDate:(id)a4 currentSunriseTime:(id)a5 currentSunsetTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint32_t v31;
  NSObject *v32;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "event") == 2)
  {
    objc_msgSend(v10, "time");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v10, "time");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");

      goto LABEL_13;
    }
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v34 = 136315394;
      v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
      v36 = 2112;
      v37 = (uint64_t)v10;
      v21 = "%s Can't calculate nextFireDate; No time set for %@";
LABEL_23:
      v29 = v17;
      v30 = OS_LOG_TYPE_FAULT;
      v31 = 22;
LABEL_34:
      _os_log_impl(&dword_1C15B3000, v29, v30, v21, (uint8_t *)&v34, v31);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (!objc_msgSend(v10, "event"))
  {
    if (v12)
    {
      v18 = objc_msgSend(v10, "timeOffset");
      v19 = a1;
      v20 = v12;
      goto LABEL_12;
    }
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v34 = 136315138;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    v21 = "%s Can't calculate nextFireDate without sunrise time";
LABEL_33:
    v29 = v17;
    v30 = OS_LOG_TYPE_ERROR;
    v31 = 12;
    goto LABEL_34;
  }
  if (objc_msgSend(v10, "event") != 1)
  {
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v34 = 136315394;
      v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
      v36 = 2048;
      v37 = objc_msgSend(v10, "event");
      v21 = "%s Unhandled time trigger event: %ld; can't calculate nextFireDate";
      goto LABEL_23;
    }
LABEL_35:
    v27 = 0;
    goto LABEL_36;
  }
  if (!v13)
  {
    getWFTriggersLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v34 = 136315138;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    v21 = "%s Can't calculate nextFireDate without sunset time";
    goto LABEL_33;
  }
  v18 = objc_msgSend(v10, "timeOffset");
  v19 = a1;
  v20 = v13;
LABEL_12:
  objc_msgSend(v19, "adjustedTime:byOffset:", v20, v18);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (objc_msgSend(v10, "mode") != 1)
  {
    objc_msgSend(v10, "daysOfWeek");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(v10, "daysOfWeek");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[NSObject copy](v17, "copy");
      -[NSObject setWeekday:](v17, "setWeekday:", objc_msgSend(a1, "nextWeekdayFromDaysOfWeek:timeComponents:currentDate:calendar:", v23, v26, v11, v14));

      goto LABEL_18;
    }
    getWFTriggersLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    goto LABEL_27;
  }
  objc_msgSend(v10, "dayOfMonth");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    getWFTriggersLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
LABEL_28:

      goto LABEL_35;
    }
LABEL_27:
    v34 = 136315394;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    v36 = 2112;
    v37 = (uint64_t)v10;
    _os_log_impl(&dword_1C15B3000, v32, OS_LOG_TYPE_FAULT, "%s Can't calculate nextFireDate; No days of week set for %@",
      (uint8_t *)&v34,
      0x16u);
    goto LABEL_28;
  }
  objc_msgSend(v10, "dayOfMonth");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setDay:](v17, "setDay:", objc_msgSend(v23, "integerValue"));
LABEL_18:

  objc_msgSend(v14, "nextDateAfterDate:matchingComponents:options:", v11, v17, 5120);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v34 = 136315650;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    v36 = 2112;
    v37 = (uint64_t)v10;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_INFO, "%s nextFireDate for trigger (%@): %@", (uint8_t *)&v34, 0x20u);
  }

LABEL_36:
  return v27;
}

+ (int64_t)nextWeekdayFromDaysOfWeek:(id)a3 timeComponents:(id)a4 currentDate:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = objc_msgSend(v11, "component:fromDate:", 512, v10);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __84__WFTimeTriggerLogic_nextWeekdayFromDaysOfWeek_timeComponents_currentDate_calendar___block_invoke;
  v26 = &unk_1E7AEB970;
  v27 = v11;
  v28 = v10;
  v29 = v9;
  v30 = v13;
  v14 = v9;
  v15 = v10;
  v16 = v11;
  objc_msgSend(v12, "if_flatMap:", &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_, v23, v24, v25, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  if (v20 % 7)
    v21 = v20 % 7;
  else
    v21 = 7;

  return v21;
}

+ (id)adjustedTime:(id)a3 byOffset:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      v8 = 32;
      v9 = -4;
      goto LABEL_18;
    case 1uLL:
      v8 = 32;
      v9 = -3;
      goto LABEL_18;
    case 2uLL:
      v8 = 32;
      v9 = -2;
      goto LABEL_18;
    case 3uLL:
      v8 = 32;
      v9 = -1;
      goto LABEL_18;
    case 4uLL:
      v8 = 64;
      v9 = -45;
      goto LABEL_18;
    case 5uLL:
      v8 = 64;
      v9 = -30;
      goto LABEL_18;
    case 6uLL:
      v8 = 64;
      v9 = -15;
      goto LABEL_18;
    case 7uLL:
      v11 = v5;
      goto LABEL_19;
    case 8uLL:
      v8 = 64;
      v9 = 15;
      goto LABEL_18;
    case 9uLL:
      v8 = 64;
      v9 = 30;
      goto LABEL_18;
    case 0xAuLL:
      v8 = 64;
      v9 = 45;
      goto LABEL_18;
    case 0xBuLL:
      v8 = 32;
      v9 = 1;
      goto LABEL_18;
    case 0xCuLL:
      v8 = 32;
      v9 = 2;
      goto LABEL_18;
    case 0xDuLL:
      v8 = 32;
      v9 = 3;
      goto LABEL_18;
    case 0xEuLL:
      v8 = 32;
      v9 = 4;
LABEL_18:
      objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", v8, v9, v5, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v10 = v11;
      break;
    default:
      v10 = 0;
      break;
  }
  objc_msgSend(v7, "components:fromDate:", 96, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __84__WFTimeTriggerLogic_nextWeekdayFromDaysOfWeek_timeComponents_currentDate_calendar___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void **v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "integerValue");
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v3 < v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 + 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = (void **)v16;
LABEL_7:
    objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v3 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v13;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 5120);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isDate:inSameDayAsDate:", v6, *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v10 = &v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4 + 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v10 = &v15;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

- (id)nextFireDateForTrigger:(id)a3
{
  return 0;
}

@end

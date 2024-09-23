@implementation NSDateComponents(ReminderKitAdditions)

+ (id)rem_dateComponentsWithDateUsingArchivingTimeZone:()ReminderKitAdditions isAllDay:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  v6 = v5;
  if (a4)
    v7 = 30;
  else
    v7 = 254;
  _REMDateGetDateComponents(v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[REMLog utility](REMLog, "utility");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[NSDateComponents(ReminderKitAdditions) rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:].cold.1((uint64_t)v6, v7, v9);

    v8 = (void *)objc_opt_new();
  }

  return v8;
}

+ (id)rem_dateComponentsWithDate:()ReminderKitAdditions timeZone:isAllDay:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
    v9 = 30;
  else
    v9 = 254;
  _REMDateGetDateComponents(v7, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[REMLog utility](REMLog, "utility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v13;
      _os_log_fault_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_FAULT, "Could not get a date component with {date %@, timeZone: %@, flags: %@}", (uint8_t *)&v14, 0x20u);

    }
    v10 = (void *)objc_opt_new();
  }

  return v10;
}

+ (id)rem_dateWithDateComponentsUsingArchivingTimeZone:()ReminderKitAdditions
{
  return REMDateComponentsGetDateWithTimeZone(a3, 0);
}

+ (id)rem_dateWithDateComponents:()ReminderKitAdditions timeZone:
{
  return REMDateComponentsGetDateWithTimeZone(a3, a4);
}

+ (id)rem_dateComponentsWithYear:()ReminderKitAdditions month:day:hour:minute:second:allDay:timeZone:
{
  objc_class *v16;
  id v17;
  id v18;
  uint64_t v19;

  v16 = (objc_class *)MEMORY[0x1E0C99D78];
  v17 = a10;
  v18 = objc_alloc_init(v16);
  objc_msgSend(v18, "setYear:", a3);
  objc_msgSend(v18, "setMonth:", a4);
  objc_msgSend(v18, "setDay:", a5);
  if (a9)
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v19 = a6;
  if (a9)
  {
    a7 = 0x7FFFFFFFFFFFFFFFLL;
    a8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v18, "setHour:", v19);
  objc_msgSend(v18, "setMinute:", a7);
  objc_msgSend(v18, "setSecond:", a8);
  objc_msgSend(v18, "setCalendar:", 0);
  objc_msgSend(v18, "setTimeZone:", v17);

  return v18;
}

- (id)rem_gregorianEquivalent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "calendar");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  objc_msgSend(a1, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "rem_isAllDayDateComponents");
    objc_msgSend(a1, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99D78];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateComponentsWithDate:timeZone:isAllDay:", v10, v8, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rem_dateComponentsWithDate:timeZone:isAllDay:", v10, v12, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "setTimeZone:", v8);

  }
  else
  {
LABEL_3:
    v7 = (void *)objc_msgSend(a1, "copy");
  }
  return v7;
}

- (id)rem_dateComponentsByAddingTimeInterval:()ReminderKitAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponents:timeZone:", a1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateComponentsWithDate:timeZone:isAllDay:", v9, v7, objc_msgSend(a1, "rem_isAllDayDateComponents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v5);

  return v10;
}

- (id)rem_strippingTimeZone
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v1, "setTimeZone:", 0);
  return v1;
}

- (id)rem_allDayDateComponents
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v1, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v1, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v1, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v1, "setNanosecond:", 0x7FFFFFFFFFFFFFFFLL);
  return v1;
}

- (uint64_t)rem_isValidDateComponents
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;

  objc_msgSend(a1, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "calendarIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C996C8]),
        v4,
        (v5 & 1) == 0))
  {
    +[REMLog utility](REMLog, "utility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[NSDateComponents(ReminderKitAdditions) rem_isValidDateComponents].cold.2();
  }
  else
  {
    if (objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 1;
      goto LABEL_11;
    }
    +[REMLog utility](REMLog, "utility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[NSDateComponents(ReminderKitAdditions) rem_isValidDateComponents].cold.1();
  }

  v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)rem_isAllDayDateComponents
{
  return objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "second") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)rem_isWeekendDateComponents
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v15;

  objc_msgSend(a1, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "calendarIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C996C8];
    v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Calendar must be nil or Gregorian"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C996C8];
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(a1, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "rem_dateWithDateComponents:timeZone:", a1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rem_dateWithDateComponents:timeZone:", a1, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_msgSend(v8, "component:fromDate:", 512, v11);
  v15 = v13 == 1 || v13 == 7;

  return v15;
}

- (uint64_t)rem_compare:()ReminderKitAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(a1, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {

    if (v7)
    {
      objc_msgSend(a1, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _REMSharedGregorianCalendarForTimeZone(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateFromComponents:", a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "timeZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _REMSharedGregorianCalendarForTimeZone(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateFromComponents:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && v13)
      {
        v14 = objc_msgSend(v10, "compare:", v13);
      }
      else
      {
        +[REMLog utility](REMLog, "utility");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[NSDateComponents(ReminderKitAdditions) rem_compare:].cold.3();

        v14 = 0;
      }

      goto LABEL_17;
    }
    +[REMLog utility](REMLog, "utility");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NSDateComponents(ReminderKitAdditions) rem_compare:].cold.2();
  }
  else
  {

    if (!v7)
    {
      v10 = (void *)objc_msgSend(a1, "copy");
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimeZone:", v17);

      v18 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTimeZone:", v19);

      v14 = objc_msgSend(v10, "rem_compare:", v18);
LABEL_17:

      goto LABEL_18;
    }
    +[REMLog utility](REMLog, "utility");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[NSDateComponents(ReminderKitAdditions) rem_compare:].cold.1();
  }

  v14 = 0;
LABEL_18:

  return v14;
}

- (id)rem_stringRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%ld_%ld_%ld_%ld_%ld_%ld_%ld_%ld"), v3, objc_msgSend(a1, "era"), objc_msgSend(a1, "year"), objc_msgSend(a1, "month"), objc_msgSend(a1, "day"), objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"), objc_msgSend(a1, "second"), objc_msgSend(a1, "nanosecond"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)rem_dateComponentsWithDateUsingArchivingTimeZone:()ReminderKitAdditions isAllDay:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "Could not get a date component with floating time zone {date %@, flags: %@}", (uint8_t *)&v6, 0x16u);

}

- (void)rem_isValidDateComponents
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Calendar must be nil or Gregorian", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)rem_compare:()ReminderKitAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Date components without time zone cannot be compared to date components with timezone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)rem_compare:()ReminderKitAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Date components with time zone cannot be compared to date components without timezone", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)rem_compare:()ReminderKitAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Cannot create date from date components", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end

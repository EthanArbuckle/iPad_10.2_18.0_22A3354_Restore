@implementation NSDate(WBSNSDateExtras)

+ (double)safari_timeIntervalSinceSystemStart
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemUptime");
  v2 = v1;

  return v2;
}

+ (id)safari_dateOfMidnightNumberOfDaysAgo:()WBSNSDateExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x1E0C99D48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDay:", objc_msgSend(v7, "day") - a3);
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)safari_dateFromNTPServerWithTimeout:()WBSNSDateExtras completionHandler:
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD v24[3];
  char v25;

  v6 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke;
  aBlock[3] = &unk_1E649CBC8;
  v22 = v24;
  v23 = a1;
  v21 = v6;
  v8 = v6;
  v9 = _Block_copy(aBlock);

  _Block_object_dispose(v24, 8);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.SafariShared.NTPQueue", v10);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_2;
  block[3] = &unk_1E649CC10;
  v12 = v9;
  v19 = v12;
  dispatch_async(v11, block);
  v13 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __81__NSDate_WBSNSDateExtras__safari_dateFromNTPServerWithTimeout_completionHandler___block_invoke_5;
  v16[3] = &unk_1E649CC10;
  v17 = v12;
  v15 = v12;
  dispatch_after(v13, v14, v16);

}

- (uint64_t)safari_numberOfWeeksUntilDate:()WBSNSDateExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 8208, a1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "day");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;
  objc_msgSend(v5, "maximumRangeOfUnit:", 512);
  if (v8 >= v9 - 1)
  {
    objc_msgSend(v5, "components:fromDate:", 512, a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 512, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "weekday");
    if (v13 == objc_msgSend(v12, "weekday"))
    {
      v14 = objc_msgSend(v6, "day");
      v15 = objc_msgSend(v6, "weekOfYear");
      if (v14 >= 1)
        v10 = v15 + 1;
      else
        v10 = v15 - 1;
    }
    else
    {
      v10 = objc_msgSend(v6, "weekOfYear");
    }

  }
  else
  {
    v10 = objc_msgSend(v6, "weekOfYear");
  }

  return v10;
}

- (uint64_t)safari_numberOfDaysUntilDate:()WBSNSDateExtras
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, a1, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day");
  return v8;
}

- (uint64_t)safari_isInToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateInToday:", a1);

  return v3;
}

- (uint64_t)safari_isInSameDayAsDate:()WBSNSDateExtras
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDate:inSameDayAsDate:", a1, v5);

  return v7;
}

- (id)safari_startOfDay
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)safari_isInclusivelyBetweenDate:()WBSNSDateExtras andDate:
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "compare:", a1);
  v8 = objc_msgSend(a1, "compare:", v6);

  return v7 <= 0 && v8 < 1 || (v7 | v8) >= 0;
}

- (uint64_t)safari_isNowOrInRecentPast
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "safari_isInclusivelyBetweenDate:andDate:", v3, v2);

  return v4;
}

- (double)safari_timeIntervalUntilNow
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceNow");
  return -v1;
}

- (uint64_t)safari_filenameFormattedString
{
  if (safari_filenameFormattedString_onceToken != -1)
    dispatch_once(&safari_filenameFormattedString_onceToken, &__block_literal_global_17);
  return objc_msgSend((id)safari_filenameFormattedString_dateFormatter, "stringFromDate:", a1);
}

- (id)_safari_stringWithDashSeparatorWithDateFormatter:()WBSNSDateExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "dateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("./, "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDateFormat:", v8);
  objc_msgSend(v4, "stringFromDate:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)safari_stringsFromDateForLocaleIdentifiers:()WBSNSDateExtras
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLocale:", v8);

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v9 = objc_msgSend(&unk_1E64D1100, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(&unk_1E64D1100);
              objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
              objc_msgSend(v6, "stringFromDate:", a1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v13);

              objc_msgSend(a1, "_safari_stringWithDashSeparatorWithDateFormatter:", v6);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v14);

            }
            v10 = objc_msgSend(&unk_1E64D1100, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          }
          while (v10);
        }
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        if (_dateFormatTemplatesWithLongMonth_onceToken != -1)
          dispatch_once(&_dateFormatTemplatesWithLongMonth_onceToken, &__block_literal_global_59_0);
        v15 = (id)_dateFormatTemplatesWithLongMonth_dateFormats;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
              objc_msgSend(v6, "stringFromDate:", a1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          }
          while (v17);
        }

        ++v7;
      }
      while (v7 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v24);
  }

  return v5;
}

- (BOOL)safari_isEarlierThanDate:()WBSNSDateExtras
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)safari_isLaterThanDate:()WBSNSDateExtras
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end

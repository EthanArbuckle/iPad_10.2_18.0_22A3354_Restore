@implementation PXPeopleCandidateWidgetUtilities

+ (id)insertPerson:(id)a3 forDaysDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    if (objc_msgSend(a1, "_pastMidnightBufferThreshold"))
      +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow](PXPeopleCandidateWidgetUtilities, "_dateKeyForTomorrow");
    else
      +[PXPeopleCandidateWidgetUtilities _dateKeyForToday](PXPeopleCandidateWidgetUtilities, "_dateKeyForToday");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "mutableCopy");
    if (!v13)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "px_localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v14) & 1) == 0)
      objc_msgSend(v13, "addObject:", v14);
    v15 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v9, "setObject:forKey:", v15, v11);

    v10 = (id)objc_msgSend(v9, "copy");
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

+ (BOOL)shouldFetchCandidatesForPerson:(id)a3 forDaysDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a4;
  v6 = a3;
  +[PXPeopleCandidateWidgetUtilities _dateKeyForToday](PXPeopleCandidateWidgetUtilities, "_dateKeyForToday");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow](PXPeopleCandidateWidgetUtilities, "_dateKeyForTomorrow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    v10 = v13 ^ 1;
  }

  return v10;
}

+ (id)removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXPeopleCandidateWidgetUtilities _dateKeyForToday](PXPeopleCandidateWidgetUtilities, "_dateKeyForToday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(v5, "compare:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10)) == 1)
        {

          v12 = v4;
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          if (objc_msgSend(a1, "_pastMidnightBufferThreshold"))
          {
            +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow](PXPeopleCandidateWidgetUtilities, "_dateKeyForTomorrow");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v13, "setObject:forKey:", v15, v14);

          }
          +[PXPeopleCandidateWidgetUtilities _dateKeyForToday](PXPeopleCandidateWidgetUtilities, "_dateKeyForToday");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v13, "setObject:forKey:", v17, v16);
          v11 = (id)objc_msgSend(v13, "copy");

          goto LABEL_17;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  v11 = v4;
LABEL_17:

  return v11;
}

+ (id)_dateKeyForToday
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleCandidateWidgetUtilities _dateKeyForDay:](PXPeopleCandidateWidgetUtilities, "_dateKeyForDay:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_dateKeyForTomorrow
{
  void *v2;
  void *v3;

  +[PXPeopleCandidateWidgetUtilities _tomorrow](PXPeopleCandidateWidgetUtilities, "_tomorrow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleCandidateWidgetUtilities _dateKeyForDay:](PXPeopleCandidateWidgetUtilities, "_dateKeyForDay:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_dateKeyForDay:(id)a3
{
  void *v3;
  void *v4;

  +[PXPeopleCandidateWidgetUtilities _localTimeZoneFormatStringForDate:](PXPeopleCandidateWidgetUtilities, "_localTimeZoneFormatStringForDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("PXPeopleCandidateWidgetKey"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_tomorrow
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, 1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_localTimeZoneFormatStringForDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy.MM.dd"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)_pastMidnightBufferThreshold
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", 0, 0, 0, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:toDate:options:", 32, v4, v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hour") > 21;

  return v6;
}

@end

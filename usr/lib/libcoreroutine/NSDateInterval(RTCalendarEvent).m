@implementation NSDateInterval(RTCalendarEvent)

+ (id)dateIntervalFromEvents:()RTCalendarEvent
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "dateIntervalFromEvent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)dateIntervalFromEvent:()RTCalendarEvent
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isOnOrBefore:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413314;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v24 = 2080;
      v23 = v3;
      v25 = "+[NSDateInterval(RTCalendarEvent) dateIntervalFromEvent:]";
      v26 = 1024;
      v27 = 35;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "endDate, %@, was before startDate, %@, event: %@ (in %s:%d)", (uint8_t *)&v18, 0x30u);

    }
  }
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isOnOrBefore:", v9);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v3, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end

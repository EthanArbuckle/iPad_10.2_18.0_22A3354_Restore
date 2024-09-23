@implementation STDowntimeOverrideBuilder

+ (id)createFixedDurationOverrideWithInterval:(double)a3 state:(int64_t)a4 creationDate:(id)a5 calendar:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STDowntimeOverride overrideWithState:creationDate:calendar:fixedDuration:](STDowntimeOverride, "overrideWithState:creationDate:calendar:fixedDuration:", a4, v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)createAutomaticOverrideWithState:(int64_t)a3 schedule:(id)a4 creationDate:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!objc_msgSend(v9, "enabled")
    || (objc_msgSend(v9, "computeNextOverrideEndDateForState:creationDate:inCalendar:", a3, v10, v11),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v11, "startOfDayForDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 96, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v13, v14, 1024);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[STDowntimeOverride overrideWithState:creationDate:calendar:endDate:](STDowntimeOverride, "overrideWithState:creationDate:calendar:endDate:", a3, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end

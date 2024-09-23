@implementation VCMetricCheckIn

- (VCMetricCheckIn)initWithCurrentDate:(id)a3 mode:(int64_t)a4 defaults:(id)a5
{
  id v9;
  id v10;
  VCMetricCheckIn *v11;
  VCMetricCheckIn *v12;
  VCMetricCheckIn *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCMetricCheckIn;
  v11 = -[VCMetricCheckIn init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a4;
    objc_storeStrong((id *)&v11->_currentDate, a3);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    v13 = v12;
  }

  return v12;
}

- (id)calendar
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
}

- (BOOL)isCheckInAllowed
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCMetricCheckIn checkInDate](self, "checkInDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  v4 = -[VCMetricCheckIn mode](self, "mode");
  if (v4 == 1)
  {
    v5 = 16;
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    v5 = 0x2000;
LABEL_7:
    -[VCMetricCheckIn calendar](self, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCMetricCheckIn currentDate](self, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCMetricCheckIn checkInDate](self, "checkInDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "compareDate:toDate:toUnitGranularity:", v8, v9, v5) == 1;

    return v6;
  }
  getWFEventTrackerLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v12 = 136315394;
    v13 = "-[VCMetricCheckIn isCheckInAllowed]";
    v14 = 2048;
    v15 = -[VCMetricCheckIn mode](self, "mode");
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v12, 0x16u);
  }

  return 0;
}

- (void)updateCheckInToNow
{
  void *v3;
  void *v4;
  id v5;

  -[VCMetricCheckIn userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VCMetricCheckIn currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCMetricCheckIn checkInKey](self, "checkInKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

- (NSDate)checkInDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *v7;

  -[VCMetricCheckIn userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCMetricCheckIn checkInKey](self, "checkInKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (NSDate)intervalStartDate
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMetricCheckIn mode](self, "mode");
  if (v3 == 1)
  {
    v4 = 16;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v4 = 0x2000;
LABEL_5:
    -[VCMetricCheckIn calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCMetricCheckIn currentDate](self, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", v4, -1, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDate *)v7;
  }
  getWFEventTrackerLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = 136315394;
    v11 = "-[VCMetricCheckIn intervalStartDate]";
    v12 = 2048;
    v13 = -[VCMetricCheckIn mode](self, "mode");
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v10, 0x16u);
  }

  -[VCMetricCheckIn currentDate](self, "currentDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)checkInKey
{
  int64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMetricCheckIn mode](self, "mode");
  if (v3 == 1)
    return CFSTR("VCDailyMetricCheckInLastCheckInKey");
  if (v3 == 2)
    return CFSTR("VCWeeklyMetricCheckInLastCheckInKey");
  getWFEventTrackerLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315394;
    v7 = "-[VCMetricCheckIn checkInKey]";
    v8 = 2048;
    v9 = -[VCMetricCheckIn mode](self, "mode");
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_FAULT, "%s Invalid metric check in mode %lu", (uint8_t *)&v6, 0x16u);
  }

  return CFSTR("fiddlesticks");
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
}

+ (id)recentCheckInWithMode:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCurrentDate:mode:defaults:", v5, a3, v6);

  return v7;
}

@end

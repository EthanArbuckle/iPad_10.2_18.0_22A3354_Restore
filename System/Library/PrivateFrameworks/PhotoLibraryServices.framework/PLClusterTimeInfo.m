@implementation PLClusterTimeInfo

- (PLClusterTimeInfo)initWithCalendar:(id)a3
{
  id v5;
  PLClusterTimeInfo *v6;
  PLClusterTimeInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLClusterTimeInfo;
  v6 = -[PLClusterTimeInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_calendar, a3);

  return v7;
}

- (void)reset
{
  NSDate *latestUTCDate;

  latestUTCDate = self->_latestUTCDate;
  self->_latestUTCDate = 0;

}

- (void)_updateTimestampsWithUTCDate:(id)a3 localDate:(id)a4
{
  NSCalendar *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v7 = self->_calendar;
  v8 = a4;
  objc_msgSend(v8, "timeIntervalSinceDate:", a3);
  v10 = v9;
  -[NSCalendar pl_endOfDayForDate:](v7, "pl_endOfDayForDate:", v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  self->_endOfSameDayTimestamp = v11 - v10;
  -[NSCalendar pl_startOfNextDayForDate:](v7, "pl_startOfNextDayForDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dateByAddingTimeInterval:", 28800.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  self->_maximumNextDayTimestamp = v14 - v10;

}

- (void)updateWithUTCDate:(id)a3 localDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSDate *latestUTCDate;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    latestUTCDate = self->_latestUTCDate;
    objc_storeStrong((id *)&self->_latestUTCDate, a3);
    if (!latestUTCDate)
      -[PLClusterTimeInfo _updateTimestampsWithUTCDate:localDate:](self, "_updateTimestampsWithUTCDate:localDate:", v7, v9);
  }
  else
  {
    PLMomentsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Trying to update cluster time info with nil date. utcDate: %@, localDate: %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (BOOL)utcDateBelongsInCluster:(id)a3
{
  id v4;
  double v5;
  BOOL v6;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  if (self->_latestUTCDate && v5 > self->_endOfSameDayTimestamp)
  {
    if (v5 <= self->_maximumNextDayTimestamp)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      v6 = v8 <= 10800.0;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (double)endOfSameDayTimestamp
{
  return self->_endOfSameDayTimestamp;
}

- (double)maximumNextDayTimestamp
{
  return self->_maximumNextDayTimestamp;
}

- (NSDate)latestUTCDate
{
  return self->_latestUTCDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestUTCDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end

@implementation RTLearnedPlaceTypeInferenceStats

- (RTLearnedPlaceTypeInferenceStats)initWithWeeklyStats:(id)a3 topMedianDwellTime:(double)a4
{
  id v7;
  RTLearnedPlaceTypeInferenceStats *v8;
  RTLearnedPlaceTypeInferenceStats *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  NSArray *weeklyStats;
  double *v24;
  uint64_t weeksWithNonZeroDwellTime;
  _QWORD v27[4];
  double *v28;
  objc_super v29;

  v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RTLearnedPlaceTypeInferenceStats;
  v8 = -[RTLearnedPlaceTypeInferenceStats init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_weeklyStats, a3);
    v9->_topMedianDwellTime = a4;
    *(_OWORD *)&v9->_weeklyAggregateDwellTimeBetweenDateRangeAverage = 0u;
    *(_OWORD *)&v9->_weeklyTotalDailyVisitCountAverage = 0u;
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.totalDailyVisitCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_totalDailyVisitCount = objc_msgSend(v10, "unsignedIntegerValue");

    v9->_weeksWithNonZeroDwellTime = 0;
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.dailyAggregateDwellTimeBetweenDateRangeAverage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.dailyAggregateDwellTimeBetweenDateRangeStandardDeviation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.totalDailyVisitCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.daysWithNonZeroDwellTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    weeklyStats = v9->_weeklyStats;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __75__RTLearnedPlaceTypeInferenceStats_initWithWeeklyStats_topMedianDwellTime___block_invoke;
    v27[3] = &unk_1E92A5200;
    v24 = v9;
    v28 = v24;
    -[NSArray enumerateObjectsUsingBlock:](weeklyStats, "enumerateObjectsUsingBlock:", v27);
    weeksWithNonZeroDwellTime = v9->_weeksWithNonZeroDwellTime;
    if (weeksWithNonZeroDwellTime >= 1)
    {
      v9->_weeklyAggregateDwellTimeBetweenDateRangeAverage = v13 / (double)weeksWithNonZeroDwellTime;
      v24[3] = v16 / (double)weeksWithNonZeroDwellTime;
      v24[4] = v19 / (double)weeksWithNonZeroDwellTime;
      v24[5] = v22 / (double)weeksWithNonZeroDwellTime;
    }

  }
  return v9;
}

uint64_t __75__RTLearnedPlaceTypeInferenceStats_initWithWeeklyStats_topMedianDwellTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "daysWithNonZeroDwellTime");
  if (result >= 1)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedPlaceTypeInferenceStats weeklyStats](self, "weeklyStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = -[RTLearnedPlaceTypeInferenceStats totalDailyVisitCount](self, "totalDailyVisitCount");
  v7 = -[RTLearnedPlaceTypeInferenceStats weeksWithNonZeroDwellTime](self, "weeksWithNonZeroDwellTime");
  -[RTLearnedPlaceTypeInferenceStats weeklyAggregateDwellTimeBetweenDateRangeAverage](self, "weeklyAggregateDwellTimeBetweenDateRangeAverage");
  v9 = v8;
  -[RTLearnedPlaceTypeInferenceStats weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation](self, "weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation");
  v11 = v10;
  -[RTLearnedPlaceTypeInferenceStats weeklyTotalDailyVisitCountAverage](self, "weeklyTotalDailyVisitCountAverage");
  v13 = v12;
  -[RTLearnedPlaceTypeInferenceStats weeklyDaysWithNonZeroDwellTimeAverage](self, "weeklyDaysWithNonZeroDwellTimeAverage");
  v15 = v14;
  -[RTLearnedPlaceTypeInferenceStats topMedianDwellTime](self, "topMedianDwellTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("weeklyStats, %lu, totalWeeklyVisitCount, %lu, weeksWithNonZeroDwellTime, %lu, weeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation, %.2f, weeklyTotalDailyVisitCountAverage, %.2f, weeklyDaysWithNonZeroDwellTimeAverage, %.2f, topMedianDwellTime, %.2f"), v5, v6, v7, v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)weeklyStats
{
  return self->_weeklyStats;
}

- (double)weeklyAggregateDwellTimeBetweenDateRangeAverage
{
  return self->_weeklyAggregateDwellTimeBetweenDateRangeAverage;
}

- (double)weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation
{
  return self->_weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation;
}

- (double)weeklyTotalDailyVisitCountAverage
{
  return self->_weeklyTotalDailyVisitCountAverage;
}

- (double)weeklyDaysWithNonZeroDwellTimeAverage
{
  return self->_weeklyDaysWithNonZeroDwellTimeAverage;
}

- (int64_t)totalDailyVisitCount
{
  return self->_totalDailyVisitCount;
}

- (int64_t)weeksWithNonZeroDwellTime
{
  return self->_weeksWithNonZeroDwellTime;
}

- (double)topMedianDwellTime
{
  return self->_topMedianDwellTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyStats, 0);
}

@end

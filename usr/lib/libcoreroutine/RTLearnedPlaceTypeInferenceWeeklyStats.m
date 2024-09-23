@implementation RTLearnedPlaceTypeInferenceWeeklyStats

- (RTLearnedPlaceTypeInferenceWeeklyStats)initWithDailyStats:(id)a3
{
  id v4;
  RTLearnedPlaceTypeInferenceWeeklyStats *v5;
  RTLearnedPlaceTypeInferenceWeeklyStats *v6;
  void *v7;
  uint64_t daysWithNonZeroDwellTime;
  double v9;
  _QWORD v11[4];
  RTLearnedPlaceTypeInferenceWeeklyStats *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTLearnedPlaceTypeInferenceWeeklyStats;
  v5 = -[RTLearnedPlaceTypeInferenceWeeklyStats init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_dailyAggregateDwellTimeBetweenDateRangeAverage = 0.0;
    v5->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation = 0.0;
    objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.visitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_totalDailyVisitCount = objc_msgSend(v7, "unsignedIntegerValue");

    v6->_daysWithNonZeroDwellTime = 0;
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__RTLearnedPlaceTypeInferenceWeeklyStats_initWithDailyStats___block_invoke;
    v11[3] = &unk_1E92A51D8;
    v12 = v6;
    v13 = &v19;
    v14 = &v15;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    daysWithNonZeroDwellTime = v6->_daysWithNonZeroDwellTime;
    if (daysWithNonZeroDwellTime >= 1)
    {
      v9 = v20[3] / (double)daysWithNonZeroDwellTime;
      v6->_dailyAggregateDwellTimeBetweenDateRangeAverage = v9;
      v6->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation = sqrt(v16[3] / (double)daysWithNonZeroDwellTime- v9 * v9);
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }

  return v6;
}

void __61__RTLearnedPlaceTypeInferenceWeeklyStats_initWithDailyStats___block_invoke(_QWORD *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "aggregateDwellTimeBetweenDateRange");
  if (v3 > 0.0)
  {
    ++*(_QWORD *)(a1[4] + 32);
    objc_msgSend(v8, "aggregateDwellTimeBetweenDateRange");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v4 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v8, "aggregateDwellTimeBetweenDateRange");
    v6 = v5;
    objc_msgSend(v8, "aggregateDwellTimeBetweenDateRange");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + v6 * v7;
  }

}

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[RTLearnedPlaceTypeInferenceWeeklyStats daysWithNonZeroDwellTime](self, "daysWithNonZeroDwellTime");
  v5 = -[RTLearnedPlaceTypeInferenceWeeklyStats totalDailyVisitCount](self, "totalDailyVisitCount");
  -[RTLearnedPlaceTypeInferenceWeeklyStats dailyAggregateDwellTimeBetweenDateRangeAverage](self, "dailyAggregateDwellTimeBetweenDateRangeAverage");
  v7 = v6;
  -[RTLearnedPlaceTypeInferenceWeeklyStats dailyAggregateDwellTimeBetweenDateRangeStandardDeviation](self, "dailyAggregateDwellTimeBetweenDateRangeStandardDeviation");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("daysWithNonZeroDwellTime, %lu, totalDailyVisitCount, %lu, dailyAggregateDwellTimeBetweenDateRangeAverage, %.2f, dailyAggregateDwellTimeBetweenDateRangeStandardDeviation, %.2f"), v4, v5, v7, v8);
}

- (double)dailyAggregateDwellTimeBetweenDateRangeAverage
{
  return self->_dailyAggregateDwellTimeBetweenDateRangeAverage;
}

- (double)dailyAggregateDwellTimeBetweenDateRangeStandardDeviation
{
  return self->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation;
}

- (int64_t)totalDailyVisitCount
{
  return self->_totalDailyVisitCount;
}

- (int64_t)daysWithNonZeroDwellTime
{
  return self->_daysWithNonZeroDwellTime;
}

@end

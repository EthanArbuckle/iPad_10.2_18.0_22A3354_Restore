@implementation RTLearnedPlaceTypeInferenceDailyStats

- (RTLearnedPlaceTypeInferenceDailyStats)initWithStart:(id)a3 end:(id)a4 visitCount:(unint64_t)a5 aggregateDwellTimeBetweenDateRange:(double)a6
{
  id v11;
  id v12;
  RTLearnedPlaceTypeInferenceDailyStats *v13;
  RTLearnedPlaceTypeInferenceDailyStats *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTLearnedPlaceTypeInferenceDailyStats;
  v13 = -[RTLearnedPlaceTypeInferenceDailyStats init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_start, a3);
    objc_storeStrong((id *)&v14->_end, a4);
    v14->_visitCount = a5;
    v14->_aggregateDwellTimeBetweenDateRange = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDate stringFromDate](self->_start, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_end, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start, %@, end, %@, visitCount, %lu, aggregateDwellTimeBetweenDateRange, %.2f"), v4, v5, self->_visitCount, *(_QWORD *)&self->_aggregateDwellTimeBetweenDateRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)start
{
  return self->_start;
}

- (NSDate)end
{
  return self->_end;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (double)aggregateDwellTimeBetweenDateRange
{
  return self->_aggregateDwellTimeBetweenDateRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end

@implementation STUsageReportGraphDataPoint

- (NSDate)date
{
  void *v2;
  void *v3;

  -[STUsageReportGraphDataPoint dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (STUsageReportGraphDataPoint)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 dateInterval:(id)a5 total:(id)a6 totalAsPercentageOfMax:(double)a7 segments:(id)a8
{
  id v15;
  id v16;
  id v17;
  STUsageReportGraphDataPoint *v18;
  STUsageReportGraphDataPoint *v19;
  uint64_t v20;
  NSNumber *total;
  uint64_t v22;
  NSArray *segments;
  objc_super v25;

  v15 = a5;
  v16 = a6;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)STUsageReportGraphDataPoint;
  v18 = -[STUsageReportGraphDataPoint init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_timePeriod = a3;
    v18->_itemType = a4;
    objc_storeStrong((id *)&v18->_dateInterval, a5);
    v20 = objc_msgSend(v16, "copy");
    total = v19->_total;
    v19->_total = (NSNumber *)v20;

    v19->_totalAsPercentageOfMax = a7;
    v22 = objc_msgSend(v17, "copy");
    segments = v19->_segments;
    v19->_segments = (NSArray *)v22;

  }
  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[STUsageReportGraphDataPoint segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("amountAsPercentageOfDataPointTotal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  v8 = -[STUsageReportGraphDataPoint timePeriod](self, "timePeriod");
  v9 = -[STUsageReportGraphDataPoint itemType](self, "itemType");
  -[STUsageReportGraphDataPoint dateInterval](self, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageReportGraphDataPoint total](self, "total");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p { timePeriod = %lu, itemType = %lu, dateInterval = %@, total = %@, segments = %@ }>"), v7, self, v8, v9, v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (NSNumber)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)totalAsPercentageOfMax
{
  return self->_totalAsPercentageOfMax;
}

- (void)setTotalAsPercentageOfMax:(double)a3
{
  self->_totalAsPercentageOfMax = a3;
}

- (NSString)indicatorImageName
{
  return self->_indicatorImageName;
}

- (void)setIndicatorImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)indicatorImageColor
{
  return (UIColor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndicatorImageColor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_indicatorImageColor, 0);
  objc_storeStrong((id *)&self->_indicatorImageName, 0);
  objc_storeStrong((id *)&self->_total, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end

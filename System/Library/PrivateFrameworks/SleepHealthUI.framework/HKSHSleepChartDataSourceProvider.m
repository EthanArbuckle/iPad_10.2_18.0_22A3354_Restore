@implementation HKSHSleepChartDataSourceProvider

- (HKSHSleepChartDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4
{
  id v7;
  id v8;
  HKSHSleepChartDataSourceProvider *v9;
  HKSHSleepChartDataSourceProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSHSleepChartDataSourceProvider;
  v9 = -[HKSHSleepChartDataSourceProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_queryIdentifier, a4);
  }

  return v10;
}

- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0D2F858];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = *MEMORY[0x1E0D2F4E0];
  -[HKSHSleepChartDataSourceProvider queryIdentifier](self, "queryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSHSleepChartDataSourceProvider calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:", v8, v7, 0, v10, v11, v12);

  return v13;
}

- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0D2F858];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = *MEMORY[0x1E0D2F4E8];
  -[HKSHSleepChartDataSourceProvider queryIdentifier](self, "queryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSHSleepChartDataSourceProvider calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:", v8, v7, 6, v10, v11, v12);

  return v13;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end

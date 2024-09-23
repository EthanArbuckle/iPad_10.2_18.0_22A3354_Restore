@implementation REDateRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature dateFeature](REFeature, "dateFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[REFeature dateOccursTodayFeature](REFeature, "dateOccursTodayFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)_dependencyClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return -[REDateRelevanceProviderManager _valueForProvider:context:feature:](self, "_valueForProvider:context:feature:", a3, 0, a4);
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8;
  id v9;
  NSDate *v10;
  id v11;
  void *v12;
  void *v13;
  NSDateInterval *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "attributeForKey:", CFSTR("RETrainingContextDateKey"));
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x24BDD1508]);
      REStartOfDayForDate(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      REEndOfDayForDate(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSDateInterval *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

      goto LABEL_6;
    }
  }
  else
  {

  }
  v10 = self->_lastDateUpdate;
  v14 = self->_todayInterval;
LABEL_6:
  +[REFeature dateFeature](REFeature, "dateFeature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {
    objc_msgSend(v8, "initialRelevanceDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0.0;
    if (v17)
    {
      if (v19)
      {
        objc_msgSend(v17, "laterDate:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 == v19)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v17, v19);
          if (objc_msgSend(v22, "containsDate:", v10))
          {
            objc_msgSend(v8, "interval");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "startDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = REPercentBetweenDates(v10, v24);

          }
        }
      }
    }
    +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "interval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "intersectionWithDateInterval:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 != 0;

    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  void *v4;

  objc_msgSend(a3, "irrelevantDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "compare:", self->_lastDateUpdate) == -1;

  return (char)self;
}

- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  double v16;
  void *v17;
  void *v18;
  REDateRelevanceProviderManager *v19;
  void *v20;
  float v21;
  uint64_t v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "irrelevantDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recentDuration");
  objc_msgSend(v10, "dateByAddingTimeInterval:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v8, v11);
  +[REFeature dateFeature](REFeature, "dateFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqual:", v13);

  if (v14)
  {
    v15 = objc_msgSend(v12, "containsDate:", self->_lastDateUpdate);
    v16 = 0.0;
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", 0.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "interval");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateByAddingUnit:value:toDate:options:", 16, 1, v18, 0);
      v19 = self;
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 1.0 - REPercentBetweenDates(v19->_lastDateUpdate, v20);
      v16 = v21;
    }
    +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v16);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "intersectionWithDateInterval:", self->_todayInterval);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 != 0;

    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v24);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v22;

  return v25;
}

- (void)_scheduleUpdatesForDateProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  REDateRelevanceProviderManager *v17;

  v4 = a3;
  objc_msgSend(v4, "interval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDateRelevanceProviderManager _scheduleUpdateForDate:](self, "_scheduleUpdateForDate:", v6);

  objc_msgSend(v4, "interval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDateRelevanceProviderManager _scheduleUpdateForDate:](self, "_scheduleUpdateForDate:", v8);

  objc_msgSend(v4, "irrelevantDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDateRelevanceProviderManager _scheduleUpdateForDate:](self, "_scheduleUpdateForDate:", v9);

  objc_msgSend(v4, "initialRelevanceDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REDateRelevanceProviderManager _scheduleUpdateForDate:](self, "_scheduleUpdateForDate:", v10);

  objc_msgSend(v4, "interval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentDuration");
  objc_msgSend(v12, "dateByAddingTimeInterval:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[REDateRelevanceProviderManager _scheduleUpdateForDate:](self, "_scheduleUpdateForDate:", v13);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__REDateRelevanceProviderManager__scheduleUpdatesForDateProvider___block_invoke;
  v15[3] = &unk_24CF8ACC0;
  v16 = v4;
  v17 = self;
  v14 = v4;
  -[RERelevanceProviderManager enumerateInflectionFeatureValues:](self, "enumerateInflectionFeatureValues:", v15);

}

void __66__REDateRelevanceProviderManager__scheduleUpdatesForDateProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a3;
  v5 = a2;
  +[REFeature dateFeature](REFeature, "dateFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_4;
  v8 = objc_msgSend(v12, "type");

  if (v8 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "interval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v11 = v11;
    REDateFromPercentFromDate(v10, *(float *)&v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_scheduleUpdateForDate:", v6);
LABEL_4:

  }
}

- (void)_scheduleUpdateForDate:(id)a3
{
  id v4;

  +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForAllProvidersAtDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v4);

}

- (void)_prepareForUpdate
{
  NSDate *v3;
  NSDate *lastDateUpdate;
  id v5;
  void *v6;
  NSDateInterval *v7;
  NSDateInterval *todayInterval;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;

  v5 = objc_alloc(MEMORY[0x24BDD1508]);
  REStartOfDayForDate(self->_lastDateUpdate);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  REEndOfDayForDate(self->_lastDateUpdate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDateInterval *)objc_msgSend(v5, "initWithStartDate:endDate:", v9, v6);
  todayInterval = self->_todayInterval;
  self->_todayInterval = v7;

}

- (void)resume
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleSignificantTimeChange, v3, 0);

}

- (void)pause
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)_handleSignificantTimeChange
{
  void *v3;
  _QWORD v4[5];

  -[RERelevanceProviderManager _removeAllPendingUpdates](self, "_removeAllPendingUpdates");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__REDateRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_24CF8ACE8;
  v4[4] = self;
  -[RERelevanceProviderManager _enumerateProviders:](self, "_enumerateProviders:", v4);
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v3);

}

uint64_t __62__REDateRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdatesForDateProvider:", a2);
}

- (NSDate)lastDateUpdate
{
  return self->_lastDateUpdate;
}

- (NSDate)todayStart
{
  return -[NSDateInterval startDate](self->_todayInterval, "startDate");
}

- (NSDate)todayEnd
{
  return -[NSDateInterval endDate](self->_todayInterval, "endDate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayInterval, 0);
  objc_storeStrong((id *)&self->_lastDateUpdate, 0);
}

@end

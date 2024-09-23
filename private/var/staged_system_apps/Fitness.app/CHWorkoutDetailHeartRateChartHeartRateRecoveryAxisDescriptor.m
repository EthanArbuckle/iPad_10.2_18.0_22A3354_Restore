@implementation CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor

- (CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor)init
{
  CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *v2;
  FIUIFormattingManager *v3;
  FIUIFormattingManager *formattingManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  v2 = -[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor init](&v6, "init");
  if (v2)
  {
    v3 = (FIUIFormattingManager *)objc_msgSend(objc_alloc((Class)FIUIFormattingManager), "initWithUnitManager:", 0);
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v3;

  }
  return v2;
}

- (void)setRecoveryHeartRateReadings:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *recoveryHeartRateReadingsByMinute;
  NSArray *cachedSubLabels;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor minValue](self, "minValue"));
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[_HKHeartRateRecoveryQueryUtility perMinuteWorkoutRecoveryHeartRateFromReadings:workoutEndDate:](_HKHeartRateRecoveryQueryUtility, "perMinuteWorkoutRecoveryHeartRateFromReadings:workoutEndDate:", v4, v5));

  recoveryHeartRateReadingsByMinute = self->_recoveryHeartRateReadingsByMinute;
  self->_recoveryHeartRateReadingsByMinute = v6;

  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;

}

- (void)setAxisSpacing:(id)a3
{
  NSArray *cachedLabels;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  -[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor setAxisSpacing:](&v5, "setAxisSpacing:", a3);
  cachedLabels = self->_cachedLabels;
  self->_cachedLabels = 0;

}

- (void)setSubAxisSpacing:(id)a3
{
  NSArray *cachedSubLabels;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  -[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor setSubAxisSpacing:](&v5, "setSubAxisSpacing:", a3);
  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;

}

- (void)invalidateCaches
{
  NSArray *cachedLabels;
  NSArray *cachedSubLabels;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor;
  -[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor invalidateCaches](&v5, "invalidateCaches");
  cachedLabels = self->_cachedLabels;
  self->_cachedLabels = 0;

  cachedSubLabels = self->_cachedSubLabels;
  self->_cachedSubLabels = 0;

}

- (id)axisLabels
{
  NSArray *cachedLabels;
  NSArray *v4;
  NSArray *v5;

  cachedLabels = self->_cachedLabels;
  if (!cachedLabels)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor _labelsForHeartRateRecovery](self, "_labelsForHeartRateRecovery"));
    v5 = self->_cachedLabels;
    self->_cachedLabels = v4;

    cachedLabels = self->_cachedLabels;
  }
  return cachedLabels;
}

- (id)axisSubLabels
{
  NSArray *cachedSubLabels;
  NSArray *v4;
  NSArray *v5;

  cachedSubLabels = self->_cachedSubLabels;
  if (!cachedSubLabels)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor _subLabelsForHeartRateRecovery](self, "_subLabelsForHeartRateRecovery"));
    v5 = self->_cachedSubLabels;
    self->_cachedSubLabels = v4;

    cachedSubLabels = self->_cachedSubLabels;
  }
  return cachedSubLabels;
}

- (id)_labelsForHeartRateRecovery
{
  CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *v2;
  void *v3;
  void *v4;
  void *v5;
  NSDateFormatter *v6;
  NSDateFormatter *hourMinuteFormatter;
  NSNumberFormatter *v8;
  NSNumberFormatter *minuteNumberFormatter;
  _UNKNOWN **v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor *v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor minValue](self, "minValue"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    if (!v2->_hourMinuteFormatter)
    {
      v6 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
      hourMinuteFormatter = v2->_hourMinuteFormatter;
      v2->_hourMinuteFormatter = v6;

    }
    if (!v2->_minuteNumberFormatter)
    {
      v8 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
      minuteNumberFormatter = v2->_minuteNumberFormatter;
      v2->_minuteNumberFormatter = v8;

      -[NSNumberFormatter setNumberStyle:](v2->_minuteNumberFormatter, "setNumberStyle:", 0);
      -[NSNumberFormatter setMaximumFractionDigits:](v2->_minuteNumberFormatter, "setMaximumFractionDigits:", 0);
    }
    v10 = &FIUIDistanceTypeForActivityType_ptr;
    v11 = objc_alloc_init((Class)FIUIChartAxisLabel);
    v12 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor _stringFromDate:withTimeInterval:textStyle:forceAMPM:](v2, "_stringFromDate:withTimeInterval:textStyle:forceAMPM:", v3, 0, 2, 1));
    objc_msgSend(v11, "setText:", v12);
    objc_msgSend(v11, "setLocation:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor highlightedLabelColor](v2, "highlightedLabelColor"));
    objc_msgSend(v11, "setLabelColor:", v13);

    objc_msgSend(v4, "addObject:", v11);
    v14 = v3;
    v15 = v14;
    v30 = v11;
    v31 = v3;
    v29 = (void *)v12;
    if (kHKWorkoutHeartRateRecoveryIntervalInMinutes < 2)
    {
      v17 = v14;
    }
    else
    {
      v16 = 1;
      v32 = kHKWorkoutHeartRateRecoveryIntervalInMinutes;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 64, 1, v15, 0));

        v18 = objc_alloc_init((Class)v10[227]);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = v2;
        v21 = v4;
        v22 = v5;
        v23 = v10;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MINUTES_SHORT_DESCRIPTION"), &stru_1007AE1D0, CFSTR("Localizable")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v16));

        v10 = v23;
        v5 = v22;
        v4 = v21;
        v2 = v20;

        objc_msgSend(v18, "setText:", v25);
        objc_msgSend(v18, "setLocation:", v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor highlightedLabelColor](v20, "highlightedLabelColor"));
        objc_msgSend(v18, "setLabelColor:", v26);

        objc_msgSend(v4, "addObject:", v18);
        ++v16;
        v15 = v17;
      }
      while (v32 != v16);
    }
    v27 = objc_msgSend(v4, "copy");

    v3 = v31;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_subLabelsForHeartRateRecovery
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor minValue](self, "minValue"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    if (kHKWorkoutHeartRateRecoveryIntervalInMinutes >= 1)
    {
      v6 = 0;
      v18 = 40;
      v19 = kHKWorkoutHeartRateRecoveryIntervalInMinutes;
      do
      {
        v7 = *(void **)&self->FIUIChartTimeAxisDescriptor_opaque[v18];
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6, v18));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "quantity"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedStringWithHeartRate:unitStyle:](self->_formattingManager, "localizedStringWithHeartRate:unitStyle:", v10, 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 64, v6, v3, 0));
        v13 = objc_alloc_init((Class)FIUIChartAxisLabel);
        objc_msgSend(v13, "setText:", v11);
        objc_msgSend(v13, "setLocation:", v12);
        v14 = v4;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateRecoveryAxisDescriptor highlightedSubLabelColor](self, "highlightedSubLabelColor"));
        objc_msgSend(v13, "setLabelColor:", v15);

        v4 = v14;
        objc_msgSend(v14, "addObject:", v13);

        ++v6;
      }
      while (v19 != v6);
    }
    v16 = objc_msgSend(v4, "copy");

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubLabels, 0);
  objc_storeStrong((id *)&self->_cachedLabels, 0);
  objc_storeStrong((id *)&self->_recoveryHeartRateReadingsByMinute, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_minuteNumberFormatter, 0);
  objc_storeStrong((id *)&self->_hourMinuteFormatter, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end

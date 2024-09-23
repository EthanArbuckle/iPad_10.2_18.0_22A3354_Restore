@implementation CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor

- (CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor)init
{
  CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor *v2;
  FIUIFormattingManager *v3;
  FIUIFormattingManager *formattingManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor;
  v2 = -[CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor init](&v6, "init");
  if (v2)
  {
    v3 = (FIUIFormattingManager *)objc_msgSend(objc_alloc((Class)FIUIFormattingManager), "initWithUnitManager:", 0);
    formattingManager = v2->_formattingManager;
    v2->_formattingManager = v3;

  }
  return v2;
}

- (void)setSubAxisSpacing:(id)a3
{
  FIUIChartAxisLabel *averageHeartRateLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor;
  -[CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor setSubAxisSpacing:](&v5, "setSubAxisSpacing:", a3);
  averageHeartRateLabel = self->_averageHeartRateLabel;
  self->_averageHeartRateLabel = 0;

}

- (void)invalidateCaches
{
  FIUIChartAxisLabel *averageHeartRateLabel;

  averageHeartRateLabel = self->_averageHeartRateLabel;
  self->_averageHeartRateLabel = 0;

}

- (void)setAverageHeartRate:(id)a3
{
  FIUIChartAxisLabel *averageHeartRateLabel;
  id v6;

  objc_storeStrong((id *)&self->_averageHeartRate, a3);
  v6 = a3;
  averageHeartRateLabel = self->_averageHeartRateLabel;
  self->_averageHeartRateLabel = 0;

}

- (id)axisSubLabels
{
  FIUIChartAxisLabel *averageHeartRateLabel;
  FIUIChartAxisLabel *v4;
  FIUIChartAxisLabel *v5;
  FIUIChartAxisLabel *v7;

  averageHeartRateLabel = self->_averageHeartRateLabel;
  if (!averageHeartRateLabel)
  {
    v4 = (FIUIChartAxisLabel *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor _createAverageHeartRateLabel](self, "_createAverageHeartRateLabel"));
    v5 = self->_averageHeartRateLabel;
    self->_averageHeartRateLabel = v4;

    averageHeartRateLabel = self->_averageHeartRateLabel;
  }
  v7 = averageHeartRateLabel;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
}

- (id)_createAverageHeartRateLabel
{
  void *v3;
  id v4;
  void *v5;
  NSNumber *averageHeartRate;
  FIUIFormattingManager *formattingManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor minValue](self, "minValue"));
  v4 = objc_alloc_init((Class)FIUIChartAxisLabel);
  objc_msgSend(v4, "setLocation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartHeartRateAxisDescriptor highlightedSubLabelColor](self, "highlightedSubLabelColor"));
  objc_msgSend(v4, "setLabelColor:", v5);

  if (v3 && (averageHeartRate = self->_averageHeartRate) != 0)
  {
    formattingManager = self->_formattingManager;
    -[NSNumber doubleValue](averageHeartRate, "doubleValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedStringWithBeatsPerMinute:](formattingManager, "localizedStringWithBeatsPerMinute:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BPM_AVG"), &stru_1007AE1D0, CFSTR("Localizable")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8));

    objc_msgSend(v4, "setText:", v11);
  }
  else
  {
    objc_msgSend(v4, "setText:", &stru_1007AE1D0);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageHeartRateLabel, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
}

@end

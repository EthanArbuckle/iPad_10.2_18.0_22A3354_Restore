@implementation ODCurareModelSelectionParameter

- (ODCurareModelSelectionParameter)initWithMetricName:(id)a3 percentageIncrease:(double)a4
{
  id v6;
  ODCurareModelSelectionParameter *v7;
  ODCurareModelSelectionParameter *v8;

  v6 = a3;
  v7 = -[ODCurareModelSelectionParameter init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[ODCurareModelSelectionParameter setMetricName:](v7, "setMetricName:", v6);
    -[ODCurareModelSelectionParameter setPercentageIncrease:](v8, "setPercentageIncrease:", a4);
  }

  return v8;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
  objc_storeStrong((id *)&self->_metricName, a3);
}

- (double)percentageIncrease
{
  return self->_percentageIncrease;
}

- (void)setPercentageIncrease:(double)a3
{
  self->_percentageIncrease = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end

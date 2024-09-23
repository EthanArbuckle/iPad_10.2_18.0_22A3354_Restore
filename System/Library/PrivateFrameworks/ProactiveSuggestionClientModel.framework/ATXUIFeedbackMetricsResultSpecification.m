@implementation ATXUIFeedbackMetricsResultSpecification

- (ATXUIFeedbackMetricsResultSpecification)init
{
  ATXUIFeedbackMetricsResultSpecification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXUIFeedbackMetricsResultSpecification;
  result = -[ATXUIFeedbackMetricsResultSpecification init](&v3, sel_init);
  if (result)
    result->_trendPlotGranularity = 2;
  return result;
}

- (int64_t)trendPlotGranularity
{
  return self->_trendPlotGranularity;
}

- (void)setTrendPlotGranularity:(int64_t)a3
{
  self->_trendPlotGranularity = a3;
}

@end

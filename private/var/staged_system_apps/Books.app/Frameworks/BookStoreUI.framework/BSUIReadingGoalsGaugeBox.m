@implementation BSUIReadingGoalsGaugeBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(_BSUIReadingGoalsGaugeBoxLayout, a2);
}

- (BSUIReadingGoalsGaugeMetrics)readingGoalsGaugeMetrics
{
  return self->_readingGoalsGaugeMetrics;
}

- (void)setReadingGoalsGaugeMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_readingGoalsGaugeMetrics, a3);
}

- (TUIConfigurationProviding)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_readingGoalsGaugeMetrics, 0);
}

@end

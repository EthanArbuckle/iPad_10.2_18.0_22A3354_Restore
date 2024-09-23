@implementation BSUIWeeklyProgressBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUIWeeklyProgressBoxLayout, a2);
}

- (BSUIWeeklyProgressMetrics)weeklyProgressMetrics
{
  return self->_weeklyProgressMetrics;
}

- (void)setWeeklyProgressMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_weeklyProgressMetrics, a3);
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
  objc_storeStrong((id *)&self->_weeklyProgressMetrics, 0);
}

@end

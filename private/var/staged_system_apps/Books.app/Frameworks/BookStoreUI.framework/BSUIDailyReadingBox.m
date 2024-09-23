@implementation BSUIDailyReadingBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(BSUIDailyReadingBoxLayout, a2);
}

- (BSUIDailyReadingMetrics)dailyReadingMetrics
{
  return self->_dailyReadingMetrics;
}

- (void)setDailyReadingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyReadingMetrics, a3);
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
  objc_storeStrong((id *)&self->_dailyReadingMetrics, 0);
}

@end

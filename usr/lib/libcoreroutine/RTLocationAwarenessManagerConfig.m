@implementation RTLocationAwarenessManagerConfig

- (double)requiredHorizontalAccuracy
{
  return self->_requiredHorizontalAccuracy;
}

- (double)dispatchTimerLeeway
{
  return self->_dispatchTimerLeeway;
}

- (double)heartbeatIntervalResolution
{
  return self->_heartbeatIntervalResolution;
}

- (RTLocationAwarenessManagerConfig)initWithHeartbeatIntervalResolution:(double)a3 maxHeartbeatInterval:(double)a4 dispatchTimerLeeway:(double)a5 requiredHorizontalAccuracy:(double)a6 activeDuration:(double)a7 minMetricSubmissionAge:(double)a8 maxHorizontalAccuracyForCoarseLocation:(double)a9 highAccuracyLocationRequestDuration:(double)a10
{
  RTLocationAwarenessManagerConfig *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RTLocationAwarenessManagerConfig;
  result = -[RTLocationAwarenessManagerConfig init](&v19, sel_init);
  if (result)
  {
    result->_heartbeatIntervalResolution = a3;
    result->_maxHeartbeatInterval = a4;
    result->_dispatchTimerLeeway = a5;
    result->_requiredHorizontalAccuracy = a6;
    result->_activeDuration = a7;
    result->_minMetricSubmissionAge = a8;
    result->_maxHorizontalAccuracyForCoarseLocation = a9;
    result->_highAccuracyLocationRequestDuration = a10;
  }
  return result;
}

- (RTLocationAwarenessManagerConfig)init
{
  return -[RTLocationAwarenessManagerConfig initWithHeartbeatIntervalResolution:maxHeartbeatInterval:dispatchTimerLeeway:requiredHorizontalAccuracy:activeDuration:minMetricSubmissionAge:maxHorizontalAccuracyForCoarseLocation:highAccuracyLocationRequestDuration:](self, "initWithHeartbeatIntervalResolution:maxHeartbeatInterval:dispatchTimerLeeway:requiredHorizontalAccuracy:activeDuration:minMetricSubmissionAge:maxHorizontalAccuracyForCoarseLocation:highAccuracyLocationRequestDuration:", 60.0, 86400.0, 1.0, 235.0, 15.0, 43200.0, *MEMORY[0x1E0C9E4B8], 90.0);
}

- (double)maxHeartbeatInterval
{
  return self->_maxHeartbeatInterval;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (double)minMetricSubmissionAge
{
  return self->_minMetricSubmissionAge;
}

- (double)maxHorizontalAccuracyForCoarseLocation
{
  return self->_maxHorizontalAccuracyForCoarseLocation;
}

- (double)highAccuracyLocationRequestDuration
{
  return self->_highAccuracyLocationRequestDuration;
}

@end

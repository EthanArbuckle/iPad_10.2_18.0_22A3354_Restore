@implementation BKAccelerometerClient

- (float)zThreshold
{
  return self->_zThreshold;
}

- (float)yThreshold
{
  return self->_yThreshold;
}

- (float)xThreshold
{
  return self->_xThreshold;
}

- (double)accelerometerUpdateInterval
{
  if (self->_wantsAccelerometerEvents)
    return self->_accelerometerUpdateInterval;
  else
    return 0.0;
}

- (BOOL)wantsOrientationEvents
{
  return self->_wantsOrientationEvents;
}

- (BOOL)passiveOrientationEvents
{
  return self->_passiveOrientationEvents;
}

- (BOOL)wantsAccelerometerEvents
{
  return self->_wantsAccelerometerEvents;
}

- (BOOL)_shouldSendSampleEventWithTimestamp:(double)a3 samplingInterval:(double)a4
{
  double accelerometerUpdateInterval;
  double v5;

  if (!self->_wantsAccelerometerEvents)
    return 0;
  accelerometerUpdateInterval = self->_accelerometerUpdateInterval;
  if (accelerometerUpdateInterval <= 0.0)
    return 0;
  v5 = a3 - self->_lastAccelerometerEventTimestamp;
  if (v5 >= accelerometerUpdateInterval)
    return 1;
  if (accelerometerUpdateInterval >= a4 * 2.5)
    return 0;
  return v5 > accelerometerUpdateInterval * 0.8 || v5 < 0.0;
}

- (BOOL)_passesThresholdForX:(float)a3 y:(float)a4 z:(float)a5
{
  float xThreshold;
  float yThreshold;
  float zThreshold;
  float v8;

  xThreshold = self->_xThreshold;
  if (xThreshold > 0.0)
  {
    if (a3 < 0.0)
      a3 = -a3;
    if (a3 >= xThreshold)
      return 1;
  }
  yThreshold = self->_yThreshold;
  if (yThreshold > 0.0)
  {
    if (a4 < 0.0)
      a4 = -a4;
    if (a4 >= yThreshold)
      return 1;
  }
  zThreshold = self->_zThreshold;
  if (zThreshold <= 0.0)
    return 0;
  v8 = -a5;
  if (a5 >= 0.0)
    v8 = a5;
  return v8 >= zThreshold;
}

- (void)setZThreshold:(float)a3
{
  self->_zThreshold = a3;
}

- (void)setYThreshold:(float)a3
{
  self->_yThreshold = a3;
}

- (void)setXThreshold:(float)a3
{
  self->_xThreshold = a3;
}

- (void)setWantsAccelerometerEvents:(BOOL)a3
{
  self->_wantsAccelerometerEvents = a3;
}

- (void)setAccelerometerUpdateInterval:(double)a3
{
  self->_accelerometerUpdateInterval = a3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKAccelerometerClient;
  v4 = -[BKAccelerometerClient descriptionBuilderWithMultilinePrefix:](&v10, "descriptionBuilderWithMultilinePrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "appendBool:withName:", self->_wantsOrientationEvents, CFSTR("wantsOrientationEvents"));
  v7 = objc_msgSend(v5, "appendBool:withName:", self->_passiveOrientationEvents, CFSTR("passiveEvents"));
  v8 = objc_msgSend(v5, "appendBool:withName:", self->_wantsAccelerometerEvents, CFSTR("wantsAccelerometerEvents"));
  return v5;
}

- (void)_queue_invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKAccelerometerClient;
  -[BKAccelerometerClient _queue_invalidate](&v2, "_queue_invalidate");
}

- (void)setPassiveOrientationEvents:(BOOL)a3
{
  self->_passiveOrientationEvents = a3;
}

- (void)setWantsOrientationEvents:(BOOL)a3
{
  self->_wantsOrientationEvents = a3;
}

- (double)_lastAccelerometerEventTimestamp
{
  return self->_lastAccelerometerEventTimestamp;
}

- (void)_setLastAccelerometerEventTimestamp:(double)a3
{
  self->_lastAccelerometerEventTimestamp = a3;
}

@end

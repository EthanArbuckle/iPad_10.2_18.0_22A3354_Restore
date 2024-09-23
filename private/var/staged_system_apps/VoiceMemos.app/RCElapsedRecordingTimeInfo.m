@implementation RCElapsedRecordingTimeInfo

- (unint64_t)machElapsedRecordingTime
{
  return self->_machElapsedRecordingTime;
}

- (void)setMachElapsedRecordingTime:(unint64_t)a3
{
  self->_machElapsedRecordingTime = a3;
}

- (double)elapsedRecordingTime
{
  return self->_elapsedRecordingTime;
}

- (void)setElapsedRecordingTime:(double)a3
{
  self->_elapsedRecordingTime = a3;
}

@end

@implementation SDUnlockLockMetricDates

- (NSDate)booted
{
  return self->_booted;
}

- (void)setBooted:(id)a3
{
  objc_storeStrong((id *)&self->_booted, a3);
}

- (NSDate)lastOnWrist
{
  return self->_lastOnWrist;
}

- (void)setLastOnWrist:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnWrist, a3);
}

- (NSDate)lastWristWake
{
  return self->_lastWristWake;
}

- (void)setLastWristWake:(id)a3
{
  objc_storeStrong((id *)&self->_lastWristWake, a3);
}

- (NSDate)motionCheckStarted
{
  return self->_motionCheckStarted;
}

- (void)setMotionCheckStarted:(id)a3
{
  objc_storeStrong((id *)&self->_motionCheckStarted, a3);
}

- (NSDate)motionCheckEnded
{
  return self->_motionCheckEnded;
}

- (void)setMotionCheckEnded:(id)a3
{
  objc_storeStrong((id *)&self->_motionCheckEnded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionCheckEnded, 0);
  objc_storeStrong((id *)&self->_motionCheckStarted, 0);
  objc_storeStrong((id *)&self->_lastWristWake, 0);
  objc_storeStrong((id *)&self->_lastOnWrist, 0);
  objc_storeStrong((id *)&self->_booted, 0);
}

@end

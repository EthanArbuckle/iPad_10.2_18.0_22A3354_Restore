@implementation HKSPSleepEventTimelineResults

- (HKSPSleepSchedule)validSleepSchedule
{
  HKSPSleepSchedule *v3;

  if (self->_sleepScheduleInvalid)
    return (HKSPSleepSchedule *)(id)-[HKSPMutableSleepSchedule copy](self->_mutableValidSleepSchedule, "copy");
  v3 = self->_originalSleepSchedule;
  return v3;
}

- (HKSPSleepEventTimeline)timeline
{
  return self->_timeline;
}

- (void)setTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_timeline, a3);
}

- (BOOL)sleepScheduleInvalid
{
  return self->_sleepScheduleInvalid;
}

- (void)setSleepScheduleInvalid:(BOOL)a3
{
  self->_sleepScheduleInvalid = a3;
}

- (unint64_t)sleepScheduleInvalidReason
{
  return self->_sleepScheduleInvalidReason;
}

- (void)setSleepScheduleInvalidReason:(unint64_t)a3
{
  self->_sleepScheduleInvalidReason = a3;
}

- (BOOL)snoozeFireDateNeedsReset
{
  return self->_snoozeFireDateNeedsReset;
}

- (void)setSnoozeFireDateNeedsReset:(BOOL)a3
{
  self->_snoozeFireDateNeedsReset = a3;
}

- (HKSPSleepEventTimeline)unadjustedTimeline
{
  return self->_unadjustedTimeline;
}

- (void)setUnadjustedTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_unadjustedTimeline, a3);
}

- (HKSPSleepSchedule)originalSleepSchedule
{
  return self->_originalSleepSchedule;
}

- (void)setOriginalSleepSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_originalSleepSchedule, a3);
}

- (HKSPMutableSleepSchedule)mutableValidSleepSchedule
{
  return self->_mutableValidSleepSchedule;
}

- (void)setMutableValidSleepSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_mutableValidSleepSchedule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableValidSleepSchedule, 0);
  objc_storeStrong((id *)&self->_originalSleepSchedule, 0);
  objc_storeStrong((id *)&self->_unadjustedTimeline, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end

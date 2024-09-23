@implementation _HKSPSleepEventTimelineAdjustment

- (HKSPResolvedSleepScheduleOccurrence)originalOccurrence
{
  return self->_originalOccurrence;
}

- (void)setOriginalOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_originalOccurrence, a3);
}

- (HKSPResolvedSleepScheduleOccurrence)adjustedOccurrence
{
  return self->_adjustedOccurrence;
}

- (void)setAdjustedOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedOccurrence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustedOccurrence, 0);
  objc_storeStrong((id *)&self->_originalOccurrence, 0);
}

@end

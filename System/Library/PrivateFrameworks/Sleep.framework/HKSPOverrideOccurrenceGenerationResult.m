@implementation HKSPOverrideOccurrenceGenerationResult

- (HKSPMutableSleepScheduleOccurrence)overrideOccurrence
{
  return self->_overrideOccurrence;
}

- (void)setOverrideOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_overrideOccurrence, a3);
}

- (BOOL)wasGeneratedFromTemplate
{
  return self->_wasGeneratedFromTemplate;
}

- (void)setWasGeneratedFromTemplate:(BOOL)a3
{
  self->_wasGeneratedFromTemplate = a3;
}

- (BOOL)upcomingOccurrenceWasOverride
{
  return self->_upcomingOccurrenceWasOverride;
}

- (void)setUpcomingOccurrenceWasOverride:(BOOL)a3
{
  self->_upcomingOccurrenceWasOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOccurrence, 0);
}

@end

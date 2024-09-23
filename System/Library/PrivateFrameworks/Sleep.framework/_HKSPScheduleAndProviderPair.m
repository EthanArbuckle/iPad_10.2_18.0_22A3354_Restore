@implementation _HKSPScheduleAndProviderPair

- (HKSPSuggestionProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (HKSPSleepSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end

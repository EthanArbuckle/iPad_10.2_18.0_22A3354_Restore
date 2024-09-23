@implementation PPFoodEventsAggregator

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 2);
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfFoodEvent:", a4);
}

@end

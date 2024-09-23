@implementation PPBoatEventsAggregator

- (id)tripCandidatesFromEventsPool
{
  return -[PPEventsAggregator tripCandidatesFromEventsPoolForCategory:](self, 5);
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfBoatEvent:", a4);
}

@end

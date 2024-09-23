@implementation RTStateDepictionAggStateStats

- (RTStateDepictionAggStateStats)init
{
  RTStateDepictionAggStateStats *v2;
  RTStateModelLocation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStateDepictionAggStateStats;
  v2 = -[RTStateDepictionAggStateStats init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RTStateModelLocation);
    -[RTStateDepictionAggStateStats setLocation:](v2, "setLocation:", v3);

    -[RTStateDepictionAggStateStats setAggregateTime_s:](v2, "setAggregateTime_s:", -1.0);
    -[RTStateDepictionAggStateStats setLastExit_s:](v2, "setLastExit_s:", -1.0);
    -[RTStateDepictionAggStateStats setNumOfEntries:](v2, "setNumOfEntries:", 0);
  }
  return v2;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)aggregateTime_s
{
  return self->_aggregateTime_s;
}

- (void)setAggregateTime_s:(double)a3
{
  self->_aggregateTime_s = a3;
}

- (double)lastExit_s
{
  return self->_lastExit_s;
}

- (void)setLastExit_s:(double)a3
{
  self->_lastExit_s = a3;
}

- (int)numOfEntries
{
  return self->_numOfEntries;
}

- (void)setNumOfEntries:(int)a3
{
  self->_numOfEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end

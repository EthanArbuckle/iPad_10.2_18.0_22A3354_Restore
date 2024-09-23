@implementation RTStateDepictionOnePredEl

- (RTStateDepictionOnePredEl)init
{
  RTStateDepictionOnePredEl *v2;
  RTStateDepictionOnePredEl *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStateDepictionOnePredEl;
  v2 = -[RTStateDepictionOnePredEl init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[RTStateDepictionOnePredEl setNumOfClustEntries:](v2, "setNumOfClustEntries:", 0);
    -[RTStateDepictionOnePredEl setAggregateTime_s:](v3, "setAggregateTime_s:", 0.0);
    -[RTStateDepictionOnePredEl setLatestVisitTime_s:](v3, "setLatestVisitTime_s:", -1.0);
    -[RTStateDepictionOnePredEl setDensity:](v3, "setDensity:", 0.0);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[RTStateDepictionOnePredEl setVisitHist:](v3, "setVisitHist:", v4);

  }
  return v3;
}

- (int)numOfClustEntries
{
  return self->_numOfClustEntries;
}

- (void)setNumOfClustEntries:(int)a3
{
  self->_numOfClustEntries = a3;
}

- (double)aggregateTime_s
{
  return self->_aggregateTime_s;
}

- (void)setAggregateTime_s:(double)a3
{
  self->_aggregateTime_s = a3;
}

- (double)latestVisitTime_s
{
  return self->_latestVisitTime_s;
}

- (void)setLatestVisitTime_s:(double)a3
{
  self->_latestVisitTime_s = a3;
}

- (double)earliestVisitTime_s
{
  return self->_earliestVisitTime_s;
}

- (void)setEarliestVisitTime_s:(double)a3
{
  self->_earliestVisitTime_s = a3;
}

- (NSMutableArray)visitHist
{
  return self->_visitHist;
}

- (void)setVisitHist:(id)a3
{
  objc_storeStrong((id *)&self->_visitHist, a3);
}

- (double)density
{
  return self->_density;
}

- (void)setDensity:(double)a3
{
  self->_density = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitHist, 0);
}

@end

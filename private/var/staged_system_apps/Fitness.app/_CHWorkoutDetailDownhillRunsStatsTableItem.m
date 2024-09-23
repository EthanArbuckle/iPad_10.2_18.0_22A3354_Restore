@implementation _CHWorkoutDetailDownhillRunsStatsTableItem

- (CHWorkoutDownhillRunsStats)downhillRunsStats
{
  return self->_downhillRunsStats;
}

- (void)setDownhillRunsStats:(id)a3
{
  objc_storeStrong((id *)&self->_downhillRunsStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downhillRunsStats, 0);
}

@end

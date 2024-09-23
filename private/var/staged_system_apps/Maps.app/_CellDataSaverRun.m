@implementation _CellDataSaverRun

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (unint64_t)totalTiles
{
  return self->_totalTiles;
}

- (void)setTotalTiles:(unint64_t)a3
{
  self->_totalTiles = a3;
}

- (unint64_t)successCount
{
  return self->_successCount;
}

- (void)setSuccessCount:(unint64_t)a3
{
  self->_successCount = a3;
}

- (unint64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(unint64_t)a3
{
  self->_failureCount = a3;
}

- (NSArray)policyStatistics
{
  return self->_policyStatistics;
}

- (void)setPolicyStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_policyStatistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyStatistics, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

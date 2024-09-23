@implementation TemplateInfo

- (signed)totalNodeCount
{
  return self->_totalNodeCount;
}

- (void)setTotalNodeCount:(signed __int16)a3
{
  self->_totalNodeCount = a3;
}

- (double)totalArea
{
  return self->_totalArea;
}

- (void)setTotalArea:(double)a3
{
  self->_totalArea = a3;
}

- (signed)largestComponentNodeCount
{
  return self->_largestComponentNodeCount;
}

- (void)setLargestComponentNodeCount:(signed __int16)a3
{
  self->_largestComponentNodeCount = a3;
}

- (double)largestComponentArea
{
  return self->_largestComponentArea;
}

- (void)setLargestComponentArea:(double)a3
{
  self->_largestComponentArea = a3;
}

- (signed)clusterCount
{
  return self->_clusterCount;
}

- (void)setClusterCount:(signed __int16)a3
{
  self->_clusterCount = a3;
}

- (NSDate)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(id)a3
{
  objc_storeStrong((id *)&self->_creationTime, a3);
}

- (int64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(int64_t)a3
{
  self->_matchCount = a3;
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int64_t)a3
{
  self->_updateCount = a3;
}

- (NSNumber)userID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_creationTime, 0);
}

@end

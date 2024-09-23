@implementation PXStoryAutoEditConcreteMomentsStatistics

- (unint64_t)minimumAssetCount
{
  return self->_minimumAssetCount;
}

- (void)setMinimumAssetCount:(unint64_t)a3
{
  self->_minimumAssetCount = a3;
}

- (unint64_t)maximumAssetCount
{
  return self->_maximumAssetCount;
}

- (void)setMaximumAssetCount:(unint64_t)a3
{
  self->_maximumAssetCount = a3;
}

- (double)averageAssetCount
{
  return self->_averageAssetCount;
}

- (void)setAverageAssetCount:(double)a3
{
  self->_averageAssetCount = a3;
}

- (NSString)memoryCategoryName
{
  return self->_memoryCategoryName;
}

- (void)setMemoryCategoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)clusteringDuration
{
  return self->_clusteringDuration;
}

- (void)setClusteringDuration:(double)a3
{
  self->_clusteringDuration = a3;
}

- (PFStoryClusteringProperties)clusteringProperties
{
  return self->_clusteringProperties;
}

- (void)setClusteringProperties:(id)a3
{
  objc_storeStrong((id *)&self->_clusteringProperties, a3);
}

- (PXStoryMemoryMomentClusteringDistanceCalculator)clusteringDistanceCalculator
{
  return self->_clusteringDistanceCalculator;
}

- (void)setClusteringDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_clusteringDistanceCalculator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteringDistanceCalculator, 0);
  objc_storeStrong((id *)&self->_clusteringProperties, 0);
  objc_storeStrong((id *)&self->_memoryCategoryName, 0);
}

@end

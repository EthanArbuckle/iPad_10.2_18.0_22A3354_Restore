@implementation PGCLIPTrendsConfiguration

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (NSNumber)useAveragedEmbeddingAsNumber
{
  return self->_useAveragedEmbeddingAsNumber;
}

- (NSDictionary)cosineSimilarityThresholdByVersion
{
  return self->_cosineSimilarityThresholdByVersion;
}

- (NSArray)validTrendTypes
{
  return self->_validTrendTypes;
}

- (NSArray)positiveQueries
{
  return self->_positiveQueries;
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveQueries, 0);
  objc_storeStrong((id *)&self->_validTrendTypes, 0);
  objc_storeStrong((id *)&self->_cosineSimilarityThresholdByVersion, 0);
  objc_storeStrong((id *)&self->_useAveragedEmbeddingAsNumber, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

@end

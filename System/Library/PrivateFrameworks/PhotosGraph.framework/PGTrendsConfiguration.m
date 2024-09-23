@implementation PGTrendsConfiguration

- (NSString)featureLabel
{
  return self->_featureLabel;
}

- (NSArray)validTrendTypes
{
  return self->_validTrendTypes;
}

- (NSArray)positiveScenes
{
  return self->_positiveScenes;
}

- (NSArray)secondaryPositiveScenes
{
  return self->_secondaryPositiveScenes;
}

- (NSArray)positiveDominantScenes
{
  return self->_positiveDominantScenes;
}

- (NSArray)positiveSemDevScenes
{
  return self->_positiveSemDevScenes;
}

- (NSArray)negativeScenes
{
  return self->_negativeScenes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeScenes, 0);
  objc_storeStrong((id *)&self->_positiveSemDevScenes, 0);
  objc_storeStrong((id *)&self->_positiveDominantScenes, 0);
  objc_storeStrong((id *)&self->_secondaryPositiveScenes, 0);
  objc_storeStrong((id *)&self->_positiveScenes, 0);
  objc_storeStrong((id *)&self->_validTrendTypes, 0);
  objc_storeStrong((id *)&self->_featureLabel, 0);
}

@end

@implementation PersonalizedCompoundItemAutocompleteAnalytics

- (void)setDiscreteFeatureValuesContributedToLatestClientRankingScore:(BOOL)a3
{
  self->_hasDiscreteFeatureValuesContributedToLatestClientRankingScore = 1;
  self->_discreteFeatureValuesContributedToLatestClientRankingScore = a3;
}

- (void)clearDiscreteFeatureValuesContributedToLatestClientRankingScore
{
  self->_hasDiscreteFeatureValuesContributedToLatestClientRankingScore = 0;
}

- (BOOL)hasDiscreteFeatureValuesContributedToLatestClientRankingScore
{
  return self->_hasDiscreteFeatureValuesContributedToLatestClientRankingScore;
}

- (BOOL)discreteFeatureValuesContributedToLatestClientRankingScore
{
  return self->_discreteFeatureValuesContributedToLatestClientRankingScore;
}

@end

@implementation PGGraphConsistencyCheckResult

- (PGGraphConsistencyCheckResult)init
{
  PGGraphConsistencyCheckResult *v2;
  PGGraphConsistencyCheckResult *v3;
  NSDictionary *similarityScoreByDomain;
  NSDictionary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGGraphConsistencyCheckResult;
  v2 = -[PGGraphConsistencyCheckResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    similarityScoreByDomain = v2->_similarityScoreByDomain;
    v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v2->_overallSimilarityScore = 0.0;
    v2->_similarityScoreByDomain = v5;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphConsistencyCheckResult;
  -[PGGraphConsistencyCheckResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - Overall similarity: %.2f\nResults per domain:\n%@"), v4, *(_QWORD *)&self->_overallSimilarityScore, self->_similarityScoreByDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)overallSimilarityScore
{
  return self->_overallSimilarityScore;
}

- (void)setOverallSimilarityScore:(double)a3
{
  self->_overallSimilarityScore = a3;
}

- (NSDictionary)similarityScoreByDomain
{
  return self->_similarityScoreByDomain;
}

- (void)setSimilarityScoreByDomain:(id)a3
{
  objc_storeStrong((id *)&self->_similarityScoreByDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarityScoreByDomain, 0);
}

@end

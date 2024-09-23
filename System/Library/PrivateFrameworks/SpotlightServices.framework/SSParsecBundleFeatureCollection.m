@implementation SSParsecBundleFeatureCollection

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;
  void *v16;
  objc_super v17;

  v14 = (id)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)SSParsecBundleFeatureCollection;
  -[SSParsecBundleFeatureCollection description](&v17, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection maxScore](self, "maxScore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection originalOrderAbsRank](self, "originalOrderAbsRank");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection originalOrderRelRank](self, "originalOrderRelRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection numResults](self, "numResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection cep](self, "cep");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection maxCEPAbsRank](self, "maxCEPAbsRank");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection maxCEPRelRank](self, "maxCEPRelRank");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection cepMaxRatio](self, "cepMaxRatio");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection cepAllMaxRatio](self, "cepAllMaxRatio");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSParsecBundleFeatureCollection blockIdValue](self, "blockIdValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ maxScore:%@ absRank:%@ relRank:%@ numResults:%lu cep:%@ maxCEPAbs:%@ maxCEPRel:%@ cepMaxRatio:%@ cepAllMaxRatio:%@ blockIdValue: %@"), v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)numResults
{
  return self->_numResults;
}

- (void)setNumResults:(id)a3
{
  objc_storeStrong((id *)&self->_numResults, a3);
}

- (NSNumber)maxScore
{
  return self->_maxScore;
}

- (void)setMaxScore:(id)a3
{
  objc_storeStrong((id *)&self->_maxScore, a3);
}

- (NSNumber)originalOrderAbsRank
{
  return self->_originalOrderAbsRank;
}

- (void)setOriginalOrderAbsRank:(id)a3
{
  objc_storeStrong((id *)&self->_originalOrderAbsRank, a3);
}

- (NSNumber)originalOrderRelRank
{
  return self->_originalOrderRelRank;
}

- (void)setOriginalOrderRelRank:(id)a3
{
  objc_storeStrong((id *)&self->_originalOrderRelRank, a3);
}

- (NSNumber)maxCEPAbsRank
{
  return self->_maxCEPAbsRank;
}

- (void)setMaxCEPAbsRank:(id)a3
{
  objc_storeStrong((id *)&self->_maxCEPAbsRank, a3);
}

- (NSNumber)maxCEPRelRank
{
  return self->_maxCEPRelRank;
}

- (void)setMaxCEPRelRank:(id)a3
{
  objc_storeStrong((id *)&self->_maxCEPRelRank, a3);
}

- (NSNumber)cep
{
  return self->_cep;
}

- (void)setCep:(id)a3
{
  objc_storeStrong((id *)&self->_cep, a3);
}

- (NSNumber)cepMaxRatio
{
  return self->_cepMaxRatio;
}

- (void)setCepMaxRatio:(id)a3
{
  objc_storeStrong((id *)&self->_cepMaxRatio, a3);
}

- (NSNumber)cepAllMaxRatio
{
  return self->_cepAllMaxRatio;
}

- (void)setCepAllMaxRatio:(id)a3
{
  objc_storeStrong((id *)&self->_cepAllMaxRatio, a3);
}

- (NSNumber)blockIdValue
{
  return self->_blockIdValue;
}

- (void)setBlockIdValue:(id)a3
{
  objc_storeStrong((id *)&self->_blockIdValue, a3);
}

- (NSNumber)maxScoreAbsRank
{
  return self->_maxScoreAbsRank;
}

- (void)setMaxScoreAbsRank:(id)a3
{
  objc_storeStrong((id *)&self->_maxScoreAbsRank, a3);
}

- (NSNumber)maxScoreRelRank
{
  return self->_maxScoreRelRank;
}

- (void)setMaxScoreRelRank:(id)a3
{
  objc_storeStrong((id *)&self->_maxScoreRelRank, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxScoreRelRank, 0);
  objc_storeStrong((id *)&self->_maxScoreAbsRank, 0);
  objc_storeStrong((id *)&self->_blockIdValue, 0);
  objc_storeStrong((id *)&self->_cepAllMaxRatio, 0);
  objc_storeStrong((id *)&self->_cepMaxRatio, 0);
  objc_storeStrong((id *)&self->_cep, 0);
  objc_storeStrong((id *)&self->_maxCEPRelRank, 0);
  objc_storeStrong((id *)&self->_maxCEPAbsRank, 0);
  objc_storeStrong((id *)&self->_originalOrderRelRank, 0);
  objc_storeStrong((id *)&self->_originalOrderAbsRank, 0);
  objc_storeStrong((id *)&self->_maxScore, 0);
  objc_storeStrong((id *)&self->_numResults, 0);
}

@end

@implementation VTPhraseDetectorInfo

- (VTPhraseDetectorInfo)initWithPhraseConfig:(id)a3
{
  id v5;
  VTPhraseDetectorInfo *v6;
  VTPhraseDetectorInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTPhraseDetectorInfo;
  v6 = -[VTPhraseDetectorInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_phraseConfig, a3);
    v7->_effectiveKeywordThreshold = INFINITY;
    v7->_hasPendingNearMiss = 0;
  }

  return v7;
}

- (float)effectiveKeywordThreshold
{
  return self->_effectiveKeywordThreshold;
}

- (void)setEffectiveKeywordThreshold:(float)a3
{
  self->_effectiveKeywordThreshold = a3;
}

- (BOOL)hasPendingNearMiss
{
  return self->_hasPendingNearMiss;
}

- (void)setHasPendingNearMiss:(BOOL)a3
{
  self->_hasPendingNearMiss = a3;
}

- (VTPhraseConfig)phraseConfig
{
  return self->_phraseConfig;
}

- (void)setPhraseConfig:(id)a3
{
  objc_storeStrong((id *)&self->_phraseConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseConfig, 0);
}

@end

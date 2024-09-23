@implementation SLUresMitigatorResult

- (SLUresMitigatorResult)initWithScore:(float)a3 decision:(BOOL)a4 decisionLevel:(double)a5 detailedResults:(id)a6 extractedFeats:(id)a7
{
  id v13;
  id v14;
  SLUresMitigatorResult *v15;
  SLUresMitigatorResult *v16;
  uint64_t v17;
  NSString *assetVersion;
  void *v19;
  float v20;
  void *v21;
  float v22;
  objc_super v24;

  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SLUresMitigatorResult;
  v15 = -[SLUresMitigatorResult init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_score = a3;
    v15->_didMitigate = a4;
    objc_storeStrong((id *)&v15->_detailedResult, a6);
    v16->_decisionLevel = a5;
    objc_storeStrong((id *)&v16->_extractedFeats, a7);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("assetVersion"));
    v17 = objc_claimAutoreleasedReturnValue();
    assetVersion = v16->_assetVersion;
    v16->_assetVersion = (NSString *)v17;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("threshold"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v16->_threshold = v20;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("speakerIDthreshold"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v16->_speakerIDThreshold = v22;

  }
  return v16;
}

- (float)score
{
  return self->_score;
}

- (BOOL)didMitigate
{
  return self->_didMitigate;
}

- (double)decisionLevel
{
  return self->_decisionLevel;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)speakerIDThreshold
{
  return self->_speakerIDThreshold;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (NSDictionary)detailedResult
{
  return self->_detailedResult;
}

- (NSDictionary)extractedFeats
{
  return self->_extractedFeats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedFeats, 0);
  objc_storeStrong((id *)&self->_detailedResult, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

@end

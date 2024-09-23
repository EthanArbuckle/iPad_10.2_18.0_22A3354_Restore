@implementation VTSinglePhraseResult

- (VTSinglePhraseResult)initWithPhId:(unint64_t)a3 keywordDetectorDecision:(unint64_t)a4 combinedScore:(float)a5 ndapiScore:(float)a6 ndapiResult:(id)a7 recognizerScore:(float)a8 isSecondChance:(BOOL)a9 isSecondChanceCandidate:(BOOL)a10 isRunningQuasar:(BOOL)a11
{
  id v21;
  VTSinglePhraseResult *v22;
  VTSinglePhraseResult *v23;
  objc_super v25;

  v21 = a7;
  v25.receiver = self;
  v25.super_class = (Class)VTSinglePhraseResult;
  v22 = -[VTSinglePhraseResult init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_phId = a3;
    v22->_decision = a4;
    v22->_combinedScore = a5;
    v22->_ndapiScore = a6;
    objc_storeStrong((id *)&v22->_ndapiResult, a7);
    v23->_recognizerScore = a8;
    v23->_isSecondChance = a9;
    v23->_isSecondChanceCandidate = a10;
    v23->_isRunningQuasar = a11;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VTSinglePhraseResult *v4;
  unint64_t phId;
  unint64_t decision;
  float combinedScore;
  float ndapiScore;
  void *v9;
  double v10;
  double v11;
  double v12;
  VTSinglePhraseResult *v13;

  v4 = [VTSinglePhraseResult alloc];
  phId = self->_phId;
  decision = self->_decision;
  combinedScore = self->_combinedScore;
  ndapiScore = self->_ndapiScore;
  v9 = (void *)-[VTKeywordAnalyzerNDAPIResult copy](self->_ndapiResult, "copy");
  *(float *)&v10 = self->_recognizerScore;
  *(float *)&v11 = combinedScore;
  *(float *)&v12 = ndapiScore;
  v13 = -[VTSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v4, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", phId, decision, v9, self->_isSecondChance, self->_isSecondChanceCandidate, self->_isRunningQuasar, v11, v12, v10);

  return v13;
}

- (unint64_t)phId
{
  return self->_phId;
}

- (unint64_t)decision
{
  return self->_decision;
}

- (float)combinedScore
{
  return self->_combinedScore;
}

- (float)ndapiScore
{
  return self->_ndapiScore;
}

- (VTKeywordAnalyzerNDAPIResult)ndapiResult
{
  return self->_ndapiResult;
}

- (float)recognizerScore
{
  return self->_recognizerScore;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (BOOL)isSecondChanceCandidate
{
  return self->_isSecondChanceCandidate;
}

- (BOOL)isRunningQuasar
{
  return self->_isRunningQuasar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndapiResult, 0);
}

@end

@implementation SLUresMitigatorIpFeats

- (SLUresMitigatorIpFeats)initWithDefaults
{
  SLUresMitigatorIpFeats *v2;
  SLUresMitigatorIpFeats *v3;
  NSNumber *inputOrigin;
  AFSpeechPackage *speechPackage;
  NSNumber *prevStageOutput;
  NSNumber *acousticFTMScores;
  NSNumber *speakerIDScore;
  NSNumber *boronScore;
  NSNumber *eosLikelihood;
  NSNumber *nldaScore;
  NSDictionary *nldaMetaInfo;
  NSNumber *lrnnScore;
  NSNumber *lrnnThreshold;
  NSNumber *confidenceScore;
  NSNumber *checkerScore;
  NSNumber *phsScore;
  NSNumber *embeddingScore;
  NSNumber *externalLrnnScale;
  NSNumber *externalLrnnOffset;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SLUresMitigatorIpFeats;
  v2 = -[SLUresMitigatorIpFeats init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    inputOrigin = v2->_inputOrigin;
    v2->_inputOrigin = 0;

    speechPackage = v3->_speechPackage;
    v3->_speechPackage = 0;

    v3->_didDetectSpeechActivity = 0;
    v3->_isAirpodsConnected = 0;
    v3->_timeSinceLastQuery = 0.0;
    v3->_decisionStage = 2;
    prevStageOutput = v3->_prevStageOutput;
    v3->_prevStageOutput = (NSNumber *)&unk_24D0CB2C8;

    acousticFTMScores = v3->_acousticFTMScores;
    v3->_acousticFTMScores = (NSNumber *)&unk_24D0CB2D8;

    speakerIDScore = v3->_speakerIDScore;
    v3->_speakerIDScore = (NSNumber *)&unk_24D0CB2C8;

    boronScore = v3->_boronScore;
    v3->_boronScore = (NSNumber *)&unk_24D0CB2D8;

    eosLikelihood = v3->_eosLikelihood;
    v3->_eosLikelihood = (NSNumber *)&unk_24D0CB428;

    *(_WORD *)&v3->_didDetectVisualActivity = 0;
    v3->_didDetectAttention = 0;
    nldaScore = v3->_nldaScore;
    v3->_nldaScore = (NSNumber *)&unk_24D0CB2D8;

    nldaMetaInfo = v3->_nldaMetaInfo;
    v3->_nldaMetaInfo = 0;

    lrnnScore = v3->_lrnnScore;
    v3->_lrnnScore = (NSNumber *)&unk_24D0CB2D8;

    lrnnThreshold = v3->_lrnnThreshold;
    v3->_lrnnThreshold = (NSNumber *)&unk_24D0CB2E8;

    confidenceScore = v3->_confidenceScore;
    v3->_confidenceScore = (NSNumber *)&unk_24D0CB2F8;

    checkerScore = v3->_checkerScore;
    v3->_checkerScore = (NSNumber *)&unk_24D0CB2C8;

    phsScore = v3->_phsScore;
    v3->_phsScore = (NSNumber *)&unk_24D0CB2C8;

    embeddingScore = v3->_embeddingScore;
    v3->_embeddingScore = (NSNumber *)&unk_24D0CB2D8;

    externalLrnnScale = v3->_externalLrnnScale;
    v3->_externalLrnnScale = (NSNumber *)&unk_24D0CB2C8;

    externalLrnnOffset = v3->_externalLrnnOffset;
    v3->_externalLrnnOffset = (NSNumber *)&unk_24D0CB2E8;

  }
  return v3;
}

- (AFSpeechPackage)speechPackage
{
  return self->_speechPackage;
}

- (void)setSpeechPackage:(id)a3
{
  objc_storeStrong((id *)&self->_speechPackage, a3);
}

- (NSNumber)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setInputOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_inputOrigin, a3);
}

- (NSNumber)acousticFTMScores
{
  return self->_acousticFTMScores;
}

- (void)setAcousticFTMScores:(id)a3
{
  objc_storeStrong((id *)&self->_acousticFTMScores, a3);
}

- (NSNumber)boronScore
{
  return self->_boronScore;
}

- (void)setBoronScore:(id)a3
{
  objc_storeStrong((id *)&self->_boronScore, a3);
}

- (NSNumber)speakerIDScore
{
  return self->_speakerIDScore;
}

- (void)setSpeakerIDScore:(id)a3
{
  objc_storeStrong((id *)&self->_speakerIDScore, a3);
}

- (BOOL)didDetectSpeechActivity
{
  return self->_didDetectSpeechActivity;
}

- (void)setDidDetectSpeechActivity:(BOOL)a3
{
  self->_didDetectSpeechActivity = a3;
}

- (BOOL)didDetectVisualActivity
{
  return self->_didDetectVisualActivity;
}

- (void)setDidDetectVisualActivity:(BOOL)a3
{
  self->_didDetectVisualActivity = a3;
}

- (BOOL)didDetectGazeAtOrb
{
  return self->_didDetectGazeAtOrb;
}

- (void)setDidDetectGazeAtOrb:(BOOL)a3
{
  self->_didDetectGazeAtOrb = a3;
}

- (BOOL)didDetectAttention
{
  return self->_didDetectAttention;
}

- (void)setDidDetectAttention:(BOOL)a3
{
  self->_didDetectAttention = a3;
}

- (BOOL)isAirpodsConnected
{
  return self->_isAirpodsConnected;
}

- (void)setIsAirpodsConnected:(BOOL)a3
{
  self->_isAirpodsConnected = a3;
}

- (double)timeSinceLastQuery
{
  return self->_timeSinceLastQuery;
}

- (void)setTimeSinceLastQuery:(double)a3
{
  self->_timeSinceLastQuery = a3;
}

- (unint64_t)decisionStage
{
  return self->_decisionStage;
}

- (void)setDecisionStage:(unint64_t)a3
{
  self->_decisionStage = a3;
}

- (NSNumber)prevStageOutput
{
  return self->_prevStageOutput;
}

- (void)setPrevStageOutput:(id)a3
{
  objc_storeStrong((id *)&self->_prevStageOutput, a3);
}

- (NSNumber)eosLikelihood
{
  return self->_eosLikelihood;
}

- (void)setEosLikelihood:(id)a3
{
  objc_storeStrong((id *)&self->_eosLikelihood, a3);
}

- (NSDictionary)nldaMetaInfo
{
  return self->_nldaMetaInfo;
}

- (void)setNldaMetaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nldaMetaInfo, a3);
}

- (NSNumber)nldaScore
{
  return self->_nldaScore;
}

- (void)setNldaScore:(id)a3
{
  objc_storeStrong((id *)&self->_nldaScore, a3);
}

- (NSNumber)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceScore, a3);
}

- (NSNumber)checkerScore
{
  return self->_checkerScore;
}

- (void)setCheckerScore:(id)a3
{
  objc_storeStrong((id *)&self->_checkerScore, a3);
}

- (NSNumber)phsScore
{
  return self->_phsScore;
}

- (void)setPhsScore:(id)a3
{
  objc_storeStrong((id *)&self->_phsScore, a3);
}

- (NSNumber)lrnnScore
{
  return self->_lrnnScore;
}

- (void)setLrnnScore:(id)a3
{
  objc_storeStrong((id *)&self->_lrnnScore, a3);
}

- (NSNumber)lrnnThreshold
{
  return self->_lrnnThreshold;
}

- (void)setLrnnThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_lrnnThreshold, a3);
}

- (NSNumber)embeddingScore
{
  return self->_embeddingScore;
}

- (void)setEmbeddingScore:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingScore, a3);
}

- (NSNumber)externalLrnnScale
{
  return self->_externalLrnnScale;
}

- (void)setExternalLrnnScale:(id)a3
{
  objc_storeStrong((id *)&self->_externalLrnnScale, a3);
}

- (NSNumber)externalLrnnOffset
{
  return self->_externalLrnnOffset;
}

- (void)setExternalLrnnOffset:(id)a3
{
  objc_storeStrong((id *)&self->_externalLrnnOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLrnnOffset, 0);
  objc_storeStrong((id *)&self->_externalLrnnScale, 0);
  objc_storeStrong((id *)&self->_embeddingScore, 0);
  objc_storeStrong((id *)&self->_lrnnThreshold, 0);
  objc_storeStrong((id *)&self->_lrnnScore, 0);
  objc_storeStrong((id *)&self->_phsScore, 0);
  objc_storeStrong((id *)&self->_checkerScore, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);
  objc_storeStrong((id *)&self->_nldaScore, 0);
  objc_storeStrong((id *)&self->_nldaMetaInfo, 0);
  objc_storeStrong((id *)&self->_eosLikelihood, 0);
  objc_storeStrong((id *)&self->_prevStageOutput, 0);
  objc_storeStrong((id *)&self->_speakerIDScore, 0);
  objc_storeStrong((id *)&self->_boronScore, 0);
  objc_storeStrong((id *)&self->_acousticFTMScores, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_speechPackage, 0);
}

@end

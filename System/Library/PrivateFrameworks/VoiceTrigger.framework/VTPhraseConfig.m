@implementation VTPhraseConfig

- (VTPhraseConfig)initWithName:(id)a3 threshold:(float)a4 secondChanceThreshold:(float)a5 loggingThreshold:(float)a6 ndapiScaleFactor:(float)a7 recognizerScoreOffset:(float)a8 recognizerScoreScaleFactor:(float)a9 recognizerToken:(id)a10 twoShotFeedbackDelay:(float)a11 remoraTwoShotFeedbackDelay:(float)a12 keywordRejectLoggingThreshold:(float)a13 speakerRejectLoggingThreshold:(float)a14 preTriggerSilenceOffset:(float)a15
{
  id v26;
  id v27;
  VTPhraseConfig *v28;
  VTPhraseConfig *v29;
  objc_super v31;

  v26 = a3;
  v27 = a10;
  v31.receiver = self;
  v31.super_class = (Class)VTPhraseConfig;
  v28 = -[VTPhraseConfig init](&v31, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_name, a3);
    v29->_threshold = a4;
    v29->_secondChanceThreshold = a5;
    v29->_loggingThreshold = a6;
    v29->_ndapiScaleFactor = a7;
    v29->_recognizerScoreOffset = a8;
    v29->_recognizerScoreScaleFactor = a9;
    objc_storeStrong((id *)&v29->_recognizerToken, a10);
    v29->_twoShotFeedbackDelay = a11;
    v29->_remoraTwoShotFeedbackDelay = a12;
    v29->_keywordRejectLoggingThreshold = a13;
    v29->_speakerRejectLoggingThreshold = a14;
    v29->_preTriggerSilenceOffset = a15;
  }

  return v29;
}

- (id)copyWithThreshold:(float)a3 secondChanceThreshold:(float)a4 loggingThreshold:(float)a5 ndapiScaleFactor:(float)a6 recognizerScoreOffset:(float)a7 recognizerScoreScaleFactor:(float)a8 keywordRejectLoggingThreshold:(float)a9
{
  VTPhraseConfig *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  VTPhraseConfig *v33;
  uint64_t v35;

  v15 = [VTPhraseConfig alloc];
  -[VTPhraseConfig name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPhraseConfig recognizerToken](self, "recognizerToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPhraseConfig twoShotFeedbackDelay](self, "twoShotFeedbackDelay");
  v19 = v18;
  -[VTPhraseConfig remoraTwoShotFeedbackDelay](self, "remoraTwoShotFeedbackDelay");
  v21 = v20;
  -[VTPhraseConfig speakerRejectLoggingThreshold](self, "speakerRejectLoggingThreshold");
  v23 = v22;
  -[VTPhraseConfig preTriggerSilenceOffset](self, "preTriggerSilenceOffset");
  LODWORD(v35) = v24;
  *(float *)&v25 = a3;
  *(float *)&v26 = a4;
  *(float *)&v27 = a5;
  *(float *)&v28 = a6;
  *(float *)&v29 = a7;
  *(float *)&v30 = a8;
  LODWORD(v31) = v19;
  LODWORD(v32) = v21;
  v33 = -[VTPhraseConfig initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:](v15, "initWithName:threshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:recognizerToken:twoShotFeedbackDelay:remoraTwoShotFeedbackDelay:keywordRejectLoggingThreshold:speakerRejectLoggingThreshold:preTriggerSilenceOffset:", v16, v17, v25, v26, v27, v28, v29, v30, v31, v32, __PAIR64__(v23, LODWORD(a9)), v35);

  return v33;
}

- (NSString)name
{
  return self->_name;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)secondChanceThreshold
{
  return self->_secondChanceThreshold;
}

- (float)loggingThreshold
{
  return self->_loggingThreshold;
}

- (float)ndapiScaleFactor
{
  return self->_ndapiScaleFactor;
}

- (float)recognizerScoreOffset
{
  return self->_recognizerScoreOffset;
}

- (float)recognizerScoreScaleFactor
{
  return self->_recognizerScoreScaleFactor;
}

- (NSString)recognizerToken
{
  return self->_recognizerToken;
}

- (float)twoShotFeedbackDelay
{
  return self->_twoShotFeedbackDelay;
}

- (float)remoraTwoShotFeedbackDelay
{
  return self->_remoraTwoShotFeedbackDelay;
}

- (float)keywordRejectLoggingThreshold
{
  return self->_keywordRejectLoggingThreshold;
}

- (float)speakerRejectLoggingThreshold
{
  return self->_speakerRejectLoggingThreshold;
}

- (float)preTriggerSilenceOffset
{
  return self->_preTriggerSilenceOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

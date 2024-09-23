@implementation VTKeywordAnalyzerNDAPIResult

- (VTKeywordAnalyzerNDAPIResult)init
{
  VTKeywordAnalyzerNDAPIResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTKeywordAnalyzerNDAPIResult;
  result = -[VTKeywordAnalyzerNDAPIResult init](&v3, sel_init);
  if (result)
    result->_bestScore = -1000000.0;
  return result;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];
  _QWORD v16[11];

  v16[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_samplesFed, CFSTR("samples_fed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("best_phrase");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bestPhrase);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("best_start");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bestStart);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("best_end");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_bestEnd);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("best_score");
  *(float *)&v7 = self->_bestScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v8;
  v15[5] = CFSTR("early_warning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEarlyWarning);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v9;
  v15[6] = CFSTR("is_rescoring");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRescoring);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v10;
  v15[7] = CFSTR("samples_at_fire");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_samplesAtFire);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v11;
  v15[8] = CFSTR("start_sample_count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_startSampleCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VTKeywordAnalyzerNDAPIResult *v4;
  double v5;

  v4 = objc_alloc_init(VTKeywordAnalyzerNDAPIResult);
  -[VTKeywordAnalyzerNDAPIResult setPhId:](v4, "setPhId:", self->_phId);
  -[VTKeywordAnalyzerNDAPIResult setSamplesFed:](v4, "setSamplesFed:", self->_samplesFed);
  -[VTKeywordAnalyzerNDAPIResult setBestPhrase:](v4, "setBestPhrase:", self->_bestPhrase);
  -[VTKeywordAnalyzerNDAPIResult setBestStart:](v4, "setBestStart:", self->_bestStart);
  -[VTKeywordAnalyzerNDAPIResult setBestEnd:](v4, "setBestEnd:", self->_bestEnd);
  *(float *)&v5 = self->_bestScore;
  -[VTKeywordAnalyzerNDAPIResult setBestScore:](v4, "setBestScore:", v5);
  -[VTKeywordAnalyzerNDAPIResult setIsEarlyWarning:](v4, "setIsEarlyWarning:", self->_isEarlyWarning);
  -[VTKeywordAnalyzerNDAPIResult setIsRescoring:](v4, "setIsRescoring:", self->_isRescoring);
  -[VTKeywordAnalyzerNDAPIResult setSamplesAtFire:](v4, "setSamplesAtFire:", self->_samplesAtFire);
  -[VTKeywordAnalyzerNDAPIResult setStartSampleCount:](v4, "setStartSampleCount:", self->_startSampleCount);
  return v4;
}

- (unint64_t)phId
{
  return self->_phId;
}

- (void)setPhId:(unint64_t)a3
{
  self->_phId = a3;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (BOOL)isEarlyWarning
{
  return self->_isEarlyWarning;
}

- (void)setIsEarlyWarning:(BOOL)a3
{
  self->_isEarlyWarning = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

- (unint64_t)samplesAtFire
{
  return self->_samplesAtFire;
}

- (void)setSamplesAtFire:(unint64_t)a3
{
  self->_samplesAtFire = a3;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (void)setStartSampleCount:(unint64_t)a3
{
  self->_startSampleCount = a3;
}

@end

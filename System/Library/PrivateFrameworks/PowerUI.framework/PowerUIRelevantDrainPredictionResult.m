@implementation PowerUIRelevantDrainPredictionResult

- (PowerUIRelevantDrainPredictionResult)init
{
  PowerUIRelevantDrainPredictionResult *v2;
  PowerUIRelevantDrainPredictionResult *v3;
  PowerUIRelevantDrainPredictionResult *prevStageResult;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PowerUIRelevantDrainPredictionResult;
  v2 = -[PowerUIRelevantDrainPredictionResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_significantDrainAhead = 1;
    *(_OWORD *)&v2->_confidence = xmmword_215B39280;
    v2->_suggestedLimit = 100;
    -[PowerUIRelevantDrainPredictionResult setScheme:](v2, "setScheme:", 1);
    prevStageResult = v3->_prevStageResult;
    v3->_prevStageResult = 0;

  }
  return v3;
}

- (void)setScheme:(int64_t)a3
{
  __CFString *v3;
  NSString *predictionSchemeString;

  if ((unint64_t)(a3 - 1) > 3)
    v3 = &stru_24D3FD658;
  else
    v3 = off_24D3FC548[a3 - 1];
  predictionSchemeString = self->_predictionSchemeString;
  self->_predictionScheme = a3;
  self->_predictionSchemeString = &v3->isa;

}

- (void)setSuggestedLimitForSignificantDrain:(unint64_t)a3
{
  unint64_t v3;

  v3 = 100;
  if (!self->_significantDrainAhead)
    v3 = a3;
  self->_suggestedLimit = v3;
}

- (id)description
{
  void *v3;
  NSString *predictionSchemeString;
  _BOOL8 significantDrainAhead;
  double confidence;
  double threshold;
  PowerUIRelevantDrainPredictionResult *prevStageResult;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  predictionSchemeString = self->_predictionSchemeString;
  significantDrainAhead = self->_significantDrainAhead;
  confidence = self->_confidence;
  threshold = self->_threshold;
  prevStageResult = self->_prevStageResult;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_suggestedLimit);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (prevStageResult)
    objc_msgSend(v3, "stringWithFormat:", CFSTR("\r===>Second Stage:\r\nScheme: %@\r\tPrediction Result:\r\tSignificantDrainAhead: %d\r\tConfidence: %f\r\tThreshold: %f, \r\tSuggestedLimit: %@, \rPrev Stage: %@"), predictionSchemeString, significantDrainAhead, *(_QWORD *)&confidence, *(_QWORD *)&threshold, v9, self->_prevStageResult);
  else
    objc_msgSend(v3, "stringWithFormat:", CFSTR("===>First Stage:\r\nScheme: %@\r\tPrediction Result:\r\tSignificantDrainAhead: %d\r\tConfidence: %f\r\tThreshold: %f, \r\tSuggestedLimit: %@"), predictionSchemeString, significantDrainAhead, *(_QWORD *)&confidence, *(_QWORD *)&threshold, v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (BOOL)significantDrainAhead
{
  return self->_significantDrainAhead;
}

- (void)setSignificantDrainAhead:(BOOL)a3
{
  self->_significantDrainAhead = a3;
}

- (unint64_t)suggestedLimit
{
  return self->_suggestedLimit;
}

- (void)setSuggestedLimit:(unint64_t)a3
{
  self->_suggestedLimit = a3;
}

- (PowerUIRelevantDrainPredictionResult)prevStageResult
{
  return self->_prevStageResult;
}

- (void)setPrevStageResult:(id)a3
{
  objc_storeStrong((id *)&self->_prevStageResult, a3);
}

- (int64_t)predictionScheme
{
  return self->_predictionScheme;
}

- (void)setPredictionScheme:(int64_t)a3
{
  self->_predictionScheme = a3;
}

- (NSString)predictionSchemeString
{
  return self->_predictionSchemeString;
}

- (void)setPredictionSchemeString:(id)a3
{
  objc_storeStrong((id *)&self->_predictionSchemeString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSchemeString, 0);
  objc_storeStrong((id *)&self->_prevStageResult, 0);
}

@end

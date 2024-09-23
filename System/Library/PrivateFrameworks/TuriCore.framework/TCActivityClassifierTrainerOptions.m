@implementation TCActivityClassifierTrainerOptions

- (TCActivityClassifierTrainerOptions)init
{
  TCActivityClassifierTrainerOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCActivityClassifierTrainerOptions;
  result = -[TCActivityClassifierTrainerOptions init](&v3, sel_init);
  if (result)
  {
    result->_batchSize = 32;
    *(_OWORD *)&result->_numFeatures = 0u;
    *(_OWORD *)&result->_numClasses = 0u;
    result->_randomSeed = 0;
  }
  return result;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)numFeatures
{
  return self->_numFeatures;
}

- (void)setNumFeatures:(int64_t)a3
{
  self->_numFeatures = a3;
}

- (int64_t)predictionWindow
{
  return self->_predictionWindow;
}

- (void)setPredictionWindow:(int64_t)a3
{
  self->_predictionWindow = a3;
}

- (int64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(int64_t)a3
{
  self->_numClasses = a3;
}

- (int64_t)numPredictionsPerChunk
{
  return self->_numPredictionsPerChunk;
}

- (void)setNumPredictionsPerChunk:(int64_t)a3
{
  self->_numPredictionsPerChunk = a3;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
}

@end

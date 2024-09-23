@implementation TCObjectDetectorTrainerSceneNetOptions

- (TCObjectDetectorTrainerSceneNetOptions)init
{
  TCObjectDetectorTrainerSceneNetOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCObjectDetectorTrainerSceneNetOptions;
  result = -[TCObjectDetectorTrainerSceneNetOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxIterations = xmmword_2186D0050;
    result->_numClasses = 0;
    result->_randomSeed = 0;
  }
  return result;
}

- (Config)config
{
  Config *result;

  *(_OWORD *)&retstr->var0 = xmmword_2186D0080;
  retstr->var4 = -1;
  retstr->var0 = -[TCObjectDetectorTrainerSceneNetOptions maxIterations](self, "maxIterations");
  retstr->var1 = -[TCObjectDetectorTrainerSceneNetOptions batchSize](self, "batchSize");
  result = -[TCObjectDetectorTrainerSceneNetOptions numClasses](self, "numClasses");
  retstr->var4 = (int)result;
  return result;
}

- (int64_t)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(int64_t)a3
{
  self->_maxIterations = a3;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (int64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(int64_t)a3
{
  self->_numClasses = a3;
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

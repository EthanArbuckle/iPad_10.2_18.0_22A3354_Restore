@implementation TCObjectDetectorTrainerDarknetYOLOOptions

- (TCObjectDetectorTrainerDarknetYOLOOptions)init
{
  TCObjectDetectorTrainerDarknetYOLOOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCObjectDetectorTrainerDarknetYOLOOptions;
  result = -[TCObjectDetectorTrainerDarknetYOLOOptions init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxIterations = xmmword_2186D0050;
    *(_OWORD *)&result->_numClasses = xmmword_2186D0060;
    *(_OWORD *)&result->_outputWidth = xmmword_2186D0070;
  }
  return result;
}

- (Config)config
{
  Config *result;

  *(_OWORD *)&retstr->var0 = xmmword_2186D0080;
  retstr->var4 = -1;
  retstr->var0 = -[TCObjectDetectorTrainerDarknetYOLOOptions maxIterations](self, "maxIterations");
  retstr->var1 = -[TCObjectDetectorTrainerDarknetYOLOOptions batchSize](self, "batchSize");
  retstr->var2 = -[TCObjectDetectorTrainerDarknetYOLOOptions outputHeight](self, "outputHeight");
  retstr->var3 = -[TCObjectDetectorTrainerDarknetYOLOOptions outputWidth](self, "outputWidth");
  result = -[TCObjectDetectorTrainerDarknetYOLOOptions numClasses](self, "numClasses");
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

- (int64_t)outputHeight
{
  return self->_outputHeight;
}

- (void)setOutputHeight:(int64_t)a3
{
  self->_outputHeight = a3;
}

- (int64_t)outputWidth
{
  return self->_outputWidth;
}

- (void)setOutputWidth:(int64_t)a3
{
  self->_outputWidth = a3;
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

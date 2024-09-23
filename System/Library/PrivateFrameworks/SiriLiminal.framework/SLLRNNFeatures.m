@implementation SLLRNNFeatures

- (float)lrnnScore
{
  return self->_lrnnScore;
}

- (void)setLrnnScore:(float)a3
{
  self->_lrnnScore = a3;
}

- (BOOL)lrnnProcessed
{
  return self->_lrnnProcessed;
}

- (void)setLrnnProcessed:(BOOL)a3
{
  self->_lrnnProcessed = a3;
}

@end

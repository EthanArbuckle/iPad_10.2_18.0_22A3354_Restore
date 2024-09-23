@implementation RMMediaSessionOptions

- (RMMediaSessionOptions)init
{
  RMMediaSessionOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RMMediaSessionOptions;
  result = -[RMMediaSessionOptions init](&v3, sel_init);
  if (result)
    result->_predictionIntervalMicroseconds = -1;
  return result;
}

- (unint64_t)predictionIntervalMicroseconds
{
  return self->_predictionIntervalMicroseconds;
}

- (void)setPredictionIntervalMicroseconds:(unint64_t)a3
{
  self->_predictionIntervalMicroseconds = a3;
}

- (int64_t)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(int64_t)a3
{
  self->_clientMode = a3;
}

@end

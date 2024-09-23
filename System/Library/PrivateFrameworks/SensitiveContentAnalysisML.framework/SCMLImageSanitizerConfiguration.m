@implementation SCMLImageSanitizerConfiguration

- (SCMLImageSanitizerConfiguration)init
{
  SCMLImageSanitizerConfiguration *v2;
  SCMLImageSanitizerConfiguration *v3;
  NSString *clipClassifierConfig;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCMLImageSanitizerConfiguration;
  v2 = -[SCMLImageSanitizerConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trackPerformance = 0;
    v2->_granularity = 0;
    clipClassifierConfig = v2->_clipClassifierConfig;
    v2->_clipClassifierConfig = (NSString *)&stru_2516E5A08;

    v3->_mode = 1;
    v3->_backends = 0;
  }
  return v3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (unint64_t)backends
{
  return self->_backends;
}

- (void)setBackends:(unint64_t)a3
{
  self->_backends = a3;
}

- (BOOL)trackPerformance
{
  return self->_trackPerformance;
}

- (void)setTrackPerformance:(BOOL)a3
{
  self->_trackPerformance = a3;
}

- (unsigned)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(unsigned int)a3
{
  self->_granularity = a3;
}

- (NSString)clipClassifierConfig
{
  return self->_clipClassifierConfig;
}

- (void)setClipClassifierConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipClassifierConfig, 0);
}

@end

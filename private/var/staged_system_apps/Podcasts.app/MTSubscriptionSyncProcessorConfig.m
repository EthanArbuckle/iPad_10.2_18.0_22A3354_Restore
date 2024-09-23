@implementation MTSubscriptionSyncProcessorConfig

+ (id)configWithSupportsMetrics:(BOOL)a3
{
  _BOOL8 v3;
  MTSubscriptionSyncProcessorConfig *v4;

  v3 = a3;
  v4 = objc_alloc_init(MTSubscriptionSyncProcessorConfig);
  -[MTSubscriptionSyncProcessorConfig setSupportsMetrics:](v4, "setSupportsMetrics:", v3);
  return v4;
}

- (BOOL)supportsMetrics
{
  return self->_supportsMetrics;
}

- (void)setSupportsMetrics:(BOOL)a3
{
  self->_supportsMetrics = a3;
}

@end

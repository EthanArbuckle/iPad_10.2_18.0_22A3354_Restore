@implementation PIParallaxAssetSettlingEffectOptions

- (BOOL)isInteractiveRequest
{
  return self->_isInteractiveRequest;
}

- (void)setIsInteractiveRequest:(BOOL)a3
{
  self->_isInteractiveRequest = a3;
}

- (BOOL)needsInProcessHandling
{
  return self->_needsInProcessHandling;
}

- (void)setNeedsInProcessHandling:(BOOL)a3
{
  self->_needsInProcessHandling = a3;
}

- (BOOL)loadVideoStatusOnly
{
  return self->_loadVideoStatusOnly;
}

- (void)setLoadVideoStatusOnly:(BOOL)a3
{
  self->_loadVideoStatusOnly = a3;
}

@end

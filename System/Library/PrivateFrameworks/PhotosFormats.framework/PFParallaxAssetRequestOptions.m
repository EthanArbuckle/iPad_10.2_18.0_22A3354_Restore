@implementation PFParallaxAssetRequestOptions

- (BOOL)needsInProcessHandling
{
  return self->_needsInProcessHandling;
}

- (void)setNeedsInProcessHandling:(BOOL)a3
{
  self->_needsInProcessHandling = a3;
}

@end

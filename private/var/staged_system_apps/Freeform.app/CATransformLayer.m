@implementation CATransformLayer

- (id)tsd_newLayerForRepContentPileClone
{
  return objc_alloc_init((Class)CATransformLayer);
}

@end

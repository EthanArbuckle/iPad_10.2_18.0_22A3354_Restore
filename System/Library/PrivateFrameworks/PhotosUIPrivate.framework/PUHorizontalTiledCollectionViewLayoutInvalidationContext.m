@implementation PUHorizontalTiledCollectionViewLayoutInvalidationContext

- (BOOL)invalidateCachedLayout
{
  return self->_invalidateCachedLayout;
}

- (void)_setInvalidateCachedLayout:(BOOL)a3
{
  self->_invalidateCachedLayout = a3;
}

@end

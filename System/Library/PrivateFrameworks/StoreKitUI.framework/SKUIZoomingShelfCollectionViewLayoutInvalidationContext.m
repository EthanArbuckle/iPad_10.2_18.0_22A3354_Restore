@implementation SKUIZoomingShelfCollectionViewLayoutInvalidationContext

- (BOOL)invalidateGeometryOnlyOfExistingLayoutAttributes
{
  return self->_invalidateGeometryOnlyOfExistingLayoutAttributes;
}

- (void)setInvalidateGeometryOnlyOfExistingLayoutAttributes:(BOOL)a3
{
  self->_invalidateGeometryOnlyOfExistingLayoutAttributes = a3;
}

@end

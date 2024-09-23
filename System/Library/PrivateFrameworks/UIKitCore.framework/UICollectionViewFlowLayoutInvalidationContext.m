@implementation UICollectionViewFlowLayoutInvalidationContext

- (BOOL)invalidateFlowLayoutAttributes
{
  return (*(_BYTE *)&self->_flowLayoutInvalidationFlags >> 1) & 1;
}

- (BOOL)invalidateFlowLayoutDelegateMetrics
{
  return *(_BYTE *)&self->_flowLayoutInvalidationFlags & 1;
}

- (UICollectionViewFlowLayoutInvalidationContext)init
{
  UICollectionViewFlowLayoutInvalidationContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewFlowLayoutInvalidationContext;
  result = -[UICollectionViewFlowLayoutInvalidationContext init](&v3, sel_init);
  if (result)
    *(_BYTE *)&result->_flowLayoutInvalidationFlags |= 3u;
  return result;
}

- (void)setInvalidateFlowLayoutAttributes:(BOOL)invalidateFlowLayoutAttributes
{
  char v3;

  if (invalidateFlowLayoutAttributes)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flowLayoutInvalidationFlags = *(_BYTE *)&self->_flowLayoutInvalidationFlags & 0xFD | v3;
}

- (void)setInvalidateFlowLayoutDelegateMetrics:(BOOL)invalidateFlowLayoutDelegateMetrics
{
  *(_BYTE *)&self->_flowLayoutInvalidationFlags = *(_BYTE *)&self->_flowLayoutInvalidationFlags & 0xFE | invalidateFlowLayoutDelegateMetrics;
}

@end

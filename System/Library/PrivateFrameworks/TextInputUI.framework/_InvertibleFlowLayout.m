@implementation _InvertibleFlowLayout

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_InvertibleFlowLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  return v3;
}

@end

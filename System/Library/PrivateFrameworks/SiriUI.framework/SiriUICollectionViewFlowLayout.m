@implementation SiriUICollectionViewFlowLayout

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  self->_animatesBoundsChanges = 1;
}

- (void)finalizeAnimatedBoundsChange
{
  self->_animatesBoundsChanges = 0;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  objc_super v4;

  if (self->_animatesBoundsChanges)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SiriUICollectionViewFlowLayout;
  -[SiriUICollectionViewFlowLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v4, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  void *v3;
  objc_super v5;

  if (self->_animatesBoundsChanges)
  {
    -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SiriUICollectionViewFlowLayout;
    -[SiriUICollectionViewFlowLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v5, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end

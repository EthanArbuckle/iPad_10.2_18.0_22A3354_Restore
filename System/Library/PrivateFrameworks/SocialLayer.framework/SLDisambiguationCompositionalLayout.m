@implementation SLDisambiguationCompositionalLayout

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLDisambiguationCompositionalLayout;
  -[SLDisambiguationCompositionalLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v5, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);
  return v3;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLDisambiguationCompositionalLayout;
  -[SLDisambiguationCompositionalLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v5, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);
  return v3;
}

@end

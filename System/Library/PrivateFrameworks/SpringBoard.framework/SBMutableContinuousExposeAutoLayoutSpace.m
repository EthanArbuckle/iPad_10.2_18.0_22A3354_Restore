@implementation SBMutableContinuousExposeAutoLayoutSpace

- (id)autoLayoutItemForDisplayItemIfExists:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMutableContinuousExposeAutoLayoutSpace;
  -[SBContinuousExposeAutoLayoutSpace autoLayoutItemForDisplayItemIfExists:](&v4, sel_autoLayoutItemForDisplayItemIfExists_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)autoLayoutItemForDisplayItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMutableContinuousExposeAutoLayoutSpace;
  -[SBContinuousExposeAutoLayoutSpace autoLayoutItemForDisplayItem:](&v4, sel_autoLayoutItemForDisplayItem_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

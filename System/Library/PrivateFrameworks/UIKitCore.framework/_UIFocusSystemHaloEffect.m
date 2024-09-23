@implementation _UIFocusSystemHaloEffect

- (id)_resolvedEffectForItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (_UIFocusEffectIsSystemDefaultVisible(v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIFocusSystemHaloEffect;
    -[UIFocusHaloEffect _resolvedEffectForItem:](&v7, sel__resolvedEffectForItem_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

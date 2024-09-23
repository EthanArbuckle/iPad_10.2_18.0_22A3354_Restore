@implementation UIFocusEffect

+ (UIFocusEffect)effect
{
  return (UIFocusEffect *)(id)objc_opt_new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  UIFocusEffect *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = self;

  return v5;
}

- (id)_resolvedEffectForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusEffect.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

  }
  if (_UIFocusEffectIsSystemDefaultVisible(v5))
  {
    +[UIFocusEffect effect](UIFocusHaloEffect, "effect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_resolvedEffectForItem:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end

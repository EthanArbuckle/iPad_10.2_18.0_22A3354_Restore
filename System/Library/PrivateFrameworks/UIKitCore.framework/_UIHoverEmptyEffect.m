@implementation _UIHoverEmptyEffect

+ (id)effect
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)effect___shared;
  if (!effect___shared)
  {
    v3 = -[_UIHoverEmptyEffect _init]([_UIHoverEmptyEffect alloc], "_init");
    v4 = (void *)effect___shared;
    effect___shared = (uint64_t)v3;

    v2 = (void *)effect___shared;
  }
  return v2;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIHoverEmptyEffect;
  return -[_UIHoverEmptyEffect init](&v3, sel_init);
}

@end

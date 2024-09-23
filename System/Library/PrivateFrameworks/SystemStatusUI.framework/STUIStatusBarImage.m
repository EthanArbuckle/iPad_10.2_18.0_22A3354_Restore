@implementation STUIStatusBarImage

+ (id)_kitImageNamed:(id)a3 withTrait:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___STUIStatusBarImage;
  objc_msgSendSuper2(&v8, sel__kitImageNamed_withTrait_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithOtherImage:", v5);
  else
    v6 = 0;

  return v6;
}

@end

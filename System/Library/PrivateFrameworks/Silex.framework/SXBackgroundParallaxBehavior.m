@implementation SXBackgroundParallaxBehavior

- (Class)handlerClassForComponent:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end

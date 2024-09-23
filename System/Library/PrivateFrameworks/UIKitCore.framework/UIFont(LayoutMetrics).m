@implementation UIFont(LayoutMetrics)

+ (id)layoutMetrics
{
  void *v0;
  _UIFontLayoutMetrics *v1;
  void *v2;

  v0 = (void *)__layoutMetrics;
  if (!__layoutMetrics)
  {
    v1 = objc_alloc_init(_UIFontLayoutMetrics);
    v2 = (void *)__layoutMetrics;
    __layoutMetrics = (uint64_t)v1;

    v0 = (void *)__layoutMetrics;
  }
  return v0;
}

+ (void)registerLayoutMetrics:()LayoutMetrics
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFontMetrics.m"), 131, CFSTR("layoutMetrics of type %@ is not a subclass of _UIFontLayoutMetrics."), v9);

  }
  v6 = objc_alloc_init(a3);
  v7 = (void *)__layoutMetrics;
  __layoutMetrics = (uint64_t)v6;

}

@end

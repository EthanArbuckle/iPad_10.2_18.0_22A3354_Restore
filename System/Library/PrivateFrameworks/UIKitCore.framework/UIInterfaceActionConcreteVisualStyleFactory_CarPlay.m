@implementation UIInterfaceActionConcreteVisualStyleFactory_CarPlay

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  __objc2_class **v4;

  v4 = off_1E167AA40;
  if (a4)
    v4 = off_1E167AA38;
  return objc_alloc_init(*v4);
}

@end

@implementation UIInterfaceActionConcreteVisualStyleFactory_AppleTV

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  __objc2_class **v4;

  if (dyld_program_sdk_at_least() && (_os_feature_enabled_impl() & 1) != 0)
    v4 = off_1E167AA30;
  else
    v4 = off_1E167AA28;
  return objc_alloc_init(*v4);
}

@end

@implementation UISCreateCachedColorTransform

uint64_t __UISCreateCachedColorTransform_block_invoke()
{
  cache_create("com.apple.UIKitServices.colorTransform", &_block_invoke_attrs, (cache_t **)&UISCreateCachedColorTransform_colorTransformCache);
  return cache_set_count_hint();
}

@end

@implementation NSDefaultFont

id __NSDefaultFont_block_invoke()
{
  void *v0;
  void *v1;

  _NSTextScalingTypeForCurrentEnvironment();
  v0 = (void *)objc_opt_class();
  v1 = (void *)objc_msgSend(v0, "fontWithName:size:", CFSTR("Helvetica"), 12.0);
  NSDefaultFont__defaultFont = (uint64_t)v1;
  if (!v1)
  {
    v1 = (void *)objc_msgSend(v0, "systemFontOfSize:", 12.0);
    NSDefaultFont__defaultFont = (uint64_t)v1;
  }
  return v1;
}

@end

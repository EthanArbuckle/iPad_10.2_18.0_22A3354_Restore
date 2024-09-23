@implementation NSTextHighlightShapeProviderGetMetrics

void ____NSTextHighlightShapeProviderGetMetrics_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleForKey:", CFSTR("_NSTextHighlightShapeProviderOutsetIncrement"));
  __NSTextHighlightShapeProviderGetMetrics_outsetIncrement = v0;

}

@end

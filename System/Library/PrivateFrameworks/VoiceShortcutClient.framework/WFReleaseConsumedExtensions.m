@implementation WFReleaseConsumedExtensions

uint64_t __WFReleaseConsumedExtensions_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "longLongValue");
  return sandbox_extension_release();
}

@end

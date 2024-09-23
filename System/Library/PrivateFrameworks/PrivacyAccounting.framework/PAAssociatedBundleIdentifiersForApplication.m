@implementation PAAssociatedBundleIdentifiersForApplication

uint64_t __PAAssociatedBundleIdentifiersForApplication_block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

@end

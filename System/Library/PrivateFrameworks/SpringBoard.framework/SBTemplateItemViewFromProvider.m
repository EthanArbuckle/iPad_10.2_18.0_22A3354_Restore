@implementation SBTemplateItemViewFromProvider

uint64_t __SBTemplateItemViewFromProvider_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end

@implementation PKMerchantCapabilityFromStrings

uint64_t __PKMerchantCapabilityFromStrings_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uppercaseString");
}

@end

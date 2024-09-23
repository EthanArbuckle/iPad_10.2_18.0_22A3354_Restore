@implementation PKSharingCapabilityVisibilitiesFromStringArray

uint64_t __PKSharingCapabilityVisibilitiesFromStringArray_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKSharingCapabilityVisibilityFromString(a2));
}

@end

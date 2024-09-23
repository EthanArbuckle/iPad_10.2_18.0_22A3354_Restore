@implementation PKSharingCapabilityShareabilitiesFromStringArray

uint64_t __PKSharingCapabilityShareabilitiesFromStringArray_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKSharingCapabilityShareabilityFromString(a2));
}

@end

@implementation NSNumber(HKSPSyncAnchor)

- (uint64_t)hksp_increment
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "unsignedIntegerValue") + 1);
}

@end

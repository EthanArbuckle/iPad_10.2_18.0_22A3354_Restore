@implementation TCCAccessCopyInformationInternal

uint64_t __TCCAccessCopyInformationInternal_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeRef v4;
  const void *v5;

  v4 = _TCCTCCAccessCopyInformationInternalForEntry(a3);
  if (v4)
  {
    v5 = v4;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
    CFRelease(v5);
  }
  return 1;
}

@end

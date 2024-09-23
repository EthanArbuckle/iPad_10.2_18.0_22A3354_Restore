@implementation PEMStateBefore

CFDataRef __PEMStateBefore_block_invoke()
{
  const __CFAllocator *v0;
  CFDataRef result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  PEMMarkerBegin = (uint64_t)CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"-----BEGIN ", 11, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  PEMMarkerBeginEnd = (uint64_t)CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"-----", 5, v0);
  PEMMarkerEnd = (uint64_t)CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"-----END ", 9, v0);
  PEMMarkerHeader = (uint64_t)CFDataCreateWithBytesNoCopy(0, (const UInt8 *)": ", 2, v0);
  result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)"\n", 1, v0);
  PEMMarkerNewline = (uint64_t)result;
  return result;
}

@end

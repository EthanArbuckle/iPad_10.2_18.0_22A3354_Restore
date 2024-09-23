@implementation SIStringCacheEnumerateStrings

void __SIStringCacheEnumerateStrings_block_invoke(uint64_t a1, const UInt8 *a2, CFIndex numBytes)
{
  CFStringRef v4;

  v4 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, numBytes, 0x8000100u, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(v4);
}

void __SIStringCacheEnumerateStrings_block_invoke_2(uint64_t a1, const UInt8 *a2, CFIndex numBytes)
{
  CFStringRef v4;

  v4 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, numBytes, 0x8000100u, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(v4);
}

@end

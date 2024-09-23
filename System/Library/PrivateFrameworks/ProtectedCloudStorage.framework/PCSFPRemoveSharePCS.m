@implementation PCSFPRemoveSharePCS

void __PCSFPRemoveSharePCS_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;

  if (!cf || (v4 = CFGetTypeID(cf), v4 != CFStringGetTypeID()))
    abort();
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), cf);
}

@end

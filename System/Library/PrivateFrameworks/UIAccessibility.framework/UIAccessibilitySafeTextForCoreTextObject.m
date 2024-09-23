@implementation UIAccessibilitySafeTextForCoreTextObject

CFTypeID __UIAccessibilitySafeTextForCoreTextObject_block_invoke(uint64_t a1)
{
  CFTypeID result;

  result = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end

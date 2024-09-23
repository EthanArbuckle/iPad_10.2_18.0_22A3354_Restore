@implementation UIEventHIDButtonMaskFromPointerEventAndChildren

uint64_t ___UIEventHIDButtonMaskFromPointerEventAndChildren_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = IOHIDEventGetType();
  if ((_DWORD)result == 2)
  {
    result = IOHIDEventGetIntegerValue();
    if (result >= 1)
    {
      v3 = 1 << (result - 1);
      if ((unint64_t)result >= 0x3F)
        v3 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v3;
    }
  }
  return result;
}

@end

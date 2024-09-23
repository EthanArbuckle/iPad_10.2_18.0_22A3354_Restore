@implementation PCSServiceItemGetByIndex

const __CFNumber *__PCSServiceItemGetByIndex_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFNumber *result;
  int v6;
  int valuePtr;

  result = *(const __CFNumber **)(a3 + 32);
  if (result)
  {
    valuePtr = 0;
    result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    v6 = valuePtr;
  }
  else
  {
    v6 = 0;
  }
  if (v6 == *(_DWORD *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

@end

@implementation IOAccessoryConfigStreamInterfaceGetCategoryProperties

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_129(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  const __CFNumber *Value;

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PropertyID"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(_QWORD *)(a1 + 32) + 8 * a2));
  return 1;
}

@end

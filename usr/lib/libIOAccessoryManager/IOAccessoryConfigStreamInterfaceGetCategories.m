@implementation IOAccessoryConfigStreamInterfaceGetCategories

uint64_t __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  NSObject *v6;
  const __CFNumber *Value;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  CFIndex Count;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_DWORD *)(a1 + 40);
    v10 = 136315906;
    v11 = "IOAccessoryConfigStreamInterfaceGetCategories_block_invoke";
    v12 = 2048;
    v13 = a2;
    v14 = 1024;
    v15 = v9;
    v16 = 2048;
    Count = CFDictionaryGetCount(a3);
    _os_log_debug_impl(&dword_20D641000, v6, OS_LOG_TYPE_DEBUG, "%s: callback, index %ld / %d, entry %ld values", (uint8_t *)&v10, 0x26u);
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("CategoryID"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(_QWORD *)(a1 + 32) + 8 * a2));
  return 1;
}

@end

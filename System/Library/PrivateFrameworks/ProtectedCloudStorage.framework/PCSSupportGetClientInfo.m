@implementation PCSSupportGetClientInfo

void __PCSSupportGetClientInfo_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;
  BOOL v4;
  CFStringRef v5;

  v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x1E0C9AB90]);
    v3 = CFDictionaryGetValue(v1, (const void *)*MEMORY[0x1E0C9AB98]);
    if (Value)
      v4 = v3 == 0;
    else
      v4 = 1;
    if (v4)
      v5 = 0;
    else
      v5 = CFStringCreateWithFormat(0, 0, CFSTR("%@;%@"), v3, Value);
    CFRelease(v1);
  }
  else
  {
    v5 = 0;
  }
  PCSSupportGetClientInfo_clientInfo = (uint64_t)v5;
}

@end

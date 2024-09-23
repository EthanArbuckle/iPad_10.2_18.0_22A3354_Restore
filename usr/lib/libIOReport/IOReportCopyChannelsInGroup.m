@implementation IOReportCopyChannelsInGroup

uint64_t __IOReportCopyChannelsInGroup_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;

  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportGroupName"));
  v5 = _validateStr(Value);
  v6 = CFDictionaryGetValue(theDict, CFSTR("IOReportSubGroupName"));
  v7 = _validateStr(v6);
  v8 = *(const void **)(a1 + 32);
  if ((!v8 || v5 && CFEqual(v8, v5)) && ((v9 = *(const void **)(a1 + 40)) == 0 || v7 && CFEqual(v9, v7)))
    return 0;
  else
    return 16;
}

@end

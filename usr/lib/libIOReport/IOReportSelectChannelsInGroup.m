@implementation IOReportSelectChannelsInGroup

uint64_t __IOReportSelectChannelsInGroup_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v4;

  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportGroupName"));
  v4 = _validateStr(Value);
  if (v4 && CFEqual(v4, *(CFTypeRef *)(a1 + 32)))
    return 0;
  else
    return 16;
}

uint64_t __IOReportSelectChannelsInGroup_block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v4;

  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportSubGroupName"));
  v4 = _validateStr(Value);
  if (v4 && CFEqual(v4, *(CFTypeRef *)(a1 + 32)))
    return 0;
  else
    return 16;
}

uint64_t __IOReportSelectChannelsInGroup_block_invoke_3(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  const void *v6;
  const void *v7;
  BOOL v8;
  const void *v9;

  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportGroupName"));
  v5 = _validateStr(Value);
  v6 = CFDictionaryGetValue(theDict, CFSTR("IOReportSubGroupName"));
  v7 = _validateStr(v6);
  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8 && (v9 = v7, CFEqual(v5, *(CFTypeRef *)(a1 + 32))) && CFEqual(v9, *(CFTypeRef *)(a1 + 40)))
    return 0;
  else
    return 16;
}

@end

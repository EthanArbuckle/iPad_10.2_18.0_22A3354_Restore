@implementation PKLocaleIs24HourMode

void __PKLocaleIs24HourMode_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("pk_date_formatter_queue", 0);
  v1 = (void *)qword_1ECF21E20;
  qword_1ECF21E20 = (uint64_t)v0;

}

const __CFString *__PKLocaleIs24HourMode_block_invoke_2(uint64_t a1)
{
  char v2;
  __CFDateFormatter *v3;
  const __CFString *result;
  const __CFString *v5;
  BOOL v6;

  if (PKLocaleIs24HourMode_todayFormatter)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFDateFormatterGetLocale((CFDateFormatterRef)PKLocaleIs24HourMode_todayFormatter));
    v3 = (__CFDateFormatter *)PKLocaleIs24HourMode_todayFormatter;
    if ((v2 & 1) != 0)
      goto LABEL_6;
    if (PKLocaleIs24HourMode_todayFormatter)
      CFRelease((CFTypeRef)PKLocaleIs24HourMode_todayFormatter);
  }
  v3 = CFDateFormatterCreate(0, *(CFLocaleRef *)(a1 + 32), kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  PKLocaleIs24HourMode_todayFormatter = (uint64_t)v3;
LABEL_6:
  result = CFDateFormatterGetFormat(v3);
  if (result)
  {
    v5 = result;
    result = (const __CFString *)CFStringFind(result, CFSTR("H"), 0).location;
    if (result == (const __CFString *)-1)
    {
      result = (const __CFString *)CFStringFind(v5, CFSTR("k"), 0).location;
      v6 = result != (const __CFString *)-1;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

@end

@implementation OIAxisRenderVerticalDates

CFStringRef ___OIAxisRenderVerticalDates_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double v3;
  double MinValue;
  double v6;
  uint64_t CustomNumberFormatter;
  uint64_t v8;
  uint64_t (*CustomFormatterCallback)(void);
  const __CFString *ICUFormating;

  v3 = (double)a2;
  if (*(double *)(a1 + 32) <= (double)a2)
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    MinValue = OIAxisGetMinValue(*(_QWORD *)(a1 + 40));
    v6 = MinValue + v3 * OIAxisGetUnit(*(_QWORD *)(a1 + 40));
    CustomNumberFormatter = OIAxisGetCustomNumberFormatter(*(_QWORD *)(a1 + 40));
    if (CustomNumberFormatter)
    {
      v8 = CustomNumberFormatter;
      CustomFormatterCallback = (uint64_t (*)(void))OIChartGetCustomFormatterCallback(*(_QWORD *)(a1 + 48));
      return (CFStringRef)OIFormatterCreateStringUsingCustomFormatter(v8, CustomFormatterCallback);
    }
    else
    {
      ICUFormating = (const __CFString *)OIAxisGetICUFormating(*(_QWORD *)(a1 + 40));
      return OIFormatterCreateDateStringFromDouble(ICUFormating, v6);
    }
  }
}

double ___OIAxisRenderVerticalDates_block_invoke_2(uint64_t a1, double a2)
{
  double v2;
  uint64_t v3;

  v2 = ceil(a2);
  v3 = 32;
  if (!*(_BYTE *)(a1 + 88))
    v3 = 48;
  return floor(*(double *)(a1 + v3) - v2 - *(double *)(a1 + 80)) + 0.5;
}

@end

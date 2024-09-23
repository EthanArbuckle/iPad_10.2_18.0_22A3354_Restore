@implementation OIAxisRenderHorizontalUnits

CFStringRef ___OIAxisRenderHorizontalUnits_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double v3;
  double v4;
  double v5;
  double v7;
  uint64_t Type;
  uint64_t v9;
  const __CFString *ICUFormating;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t CustomNumberFormatter;
  uint64_t v16;
  uint64_t (*CustomFormatterCallback)(void);
  const __CFString *v18;

  v3 = (double)a2;
  v4 = *(double *)(a1 + 40);
  v5 = 1.0;
  if (*(double *)(a1 + 32) / v4 + 1.0 <= (double)a2)
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    v7 = v4 * v3;
    if (((v4 * v3 <= 0.0) & OIAxisIsLogarithmic(*(_QWORD *)(a1 + 48))) == 0)
      v5 = v7;
    Type = OIAxisGetType(*(_QWORD *)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 48);
    if (Type == 3)
    {
      ICUFormating = (const __CFString *)OIAxisGetICUFormating(v9);
      return OIFormatterCreatePercentStringFromDouble(ICUFormating, v5);
    }
    else
    {
      v12 = OIAxisGetType(v9);
      v13 = *(_QWORD *)(a1 + 48);
      if (v12 == 2)
      {
        v14 = (const __CFString *)OIAxisGetICUFormating(v13);
        return OIFormatterCreateDateStringFromDouble(v14, v5);
      }
      else
      {
        CustomNumberFormatter = OIAxisGetCustomNumberFormatter(v13);
        if (CustomNumberFormatter)
        {
          v16 = CustomNumberFormatter;
          CustomFormatterCallback = (uint64_t (*)(void))OIChartGetCustomFormatterCallback(*(_QWORD *)(a1 + 56));
          return (CFStringRef)OIFormatterCreateStringUsingCustomFormatter(v16, CustomFormatterCallback);
        }
        else
        {
          v18 = (const __CFString *)OIAxisGetICUFormating(*(_QWORD *)(a1 + 48));
          return OIFormatterCreateStringFromDouble(v18, v5);
        }
      }
    }
  }
}

double ___OIAxisRenderHorizontalUnits_block_invoke_2(uint64_t a1, double a2)
{
  return floor(*(double *)(a1 + 32) - a2 * 0.5) + 0.5;
}

@end

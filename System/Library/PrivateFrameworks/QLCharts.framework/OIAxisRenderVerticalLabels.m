@implementation OIAxisRenderVerticalLabels

CFStringRef ___OIAxisRenderVerticalLabels_block_invoke(uint64_t a1, CFIndex a2, _BYTE *a3)
{
  uint64_t Type;
  const __CFNumber *ValueAtIndex;
  CFAbsoluteTime v7;
  const __CFString *ICUFormating;
  CFStringRef result;
  double valuePtr;

  if (*(_QWORD *)(a1 + 32) <= a2 || *(double *)(a1 + 40) + 1.0 <= (double)a2)
  {
    result = 0;
    *a3 = 1;
  }
  else
  {
    Type = OIAxisGetType(*(_QWORD *)(a1 + 48));
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), a2);
    if (Type == 2)
    {
      valuePtr = 0.0;
      CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr);
      v7 = valuePtr;
      ICUFormating = (const __CFString *)OIAxisGetICUFormating(*(_QWORD *)(a1 + 48));
      return OIFormatterCreateDateStringFromDouble(ICUFormating, v7);
    }
    else
    {
      return (CFStringRef)CFRetain(ValueAtIndex);
    }
  }
  return result;
}

double ___OIAxisRenderVerticalLabels_block_invoke_2(uint64_t a1, double a2)
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

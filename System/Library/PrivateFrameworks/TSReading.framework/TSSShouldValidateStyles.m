@implementation TSSShouldValidateStyles

double __TSSShouldValidateStyles_block_invoke(uint64_t a1)
{
  CFAbsoluteTime v1;
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = String == 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v1 = CFAbsoluteTimeGetCurrent() - *(double *)&String;
    result = *(double *)&String;
    if (v1 > *(double *)&String)
    {
      result = *(double *)&String + *(double *)&String;
      *(double *)&String = *(double *)&String + *(double *)&String;
    }
  }
  return result;
}

@end

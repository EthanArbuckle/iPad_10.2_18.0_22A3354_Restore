@implementation NSAttributedString

_QWORD *__97__NSAttributedString_SXAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  _QWORD *v7;

  if (++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) >= result[5])
  {
    *a7 = 1;
    v7 = (_QWORD *)result[6];
    if (v7)
      *v7 = a5 + a6;
  }
  return result;
}

uint64_t __70__NSAttributedString_SXAdditions__stringByTruncatingToLength_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(a3 + a4) <= *(_QWORD *)(result + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3 + a4;
  else
    *a7 = 1;
  return result;
}

@end

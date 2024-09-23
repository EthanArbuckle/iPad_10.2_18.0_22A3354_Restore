@implementation NSTextLayoutManagerGetLayoutFragmentForPosition

uint64_t ____NSTextLayoutManagerGetLayoutFragmentForPosition_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  double v9;
  double v10;

  result = objc_msgSend(a2, "state");
  if (!result)
    return result;
  result = objc_msgSend(a2, "layoutFragmentFrame");
  v10 = *(double *)(a1 + 48);
  if (v10 >= v8 && v10 < v8 + v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
LABEL_14:
    *a4 = 1;
    return result;
  }
  if (v10 > v8 && *(_BYTE *)(a1 + 56) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    return result;
  }
  if (v10 < v8)
    goto LABEL_14;
  return result;
}

@end

@implementation NSTextLayoutFragmentConfigureForTextAnimationContext

uint64_t ____NSTextLayoutFragmentConfigureForTextAnimationContext_block_invoke(uint64_t result, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (*(_QWORD *)(result + 72) <= a3)
  {
    *a4 = 1;
    return result;
  }
  v4 = result;
  v5 = (void *)objc_msgSend(a2, "textRangeByIntersectingWithTextRange:", *(_QWORD *)(result + 32));
  result = objc_msgSend(v5, "isNotEmpty");
  if (!(_DWORD)result)
    return result;
  v6 = *(void **)(v4 + 48);
  v7 = objc_msgSend(*(id *)(v4 + 32), "location");
  v8 = *(void **)(v4 + 56);
  v9 = objc_msgSend(v5, "location");
  if (v8)
  {
    result = objc_msgSend(v8, "rangeForLocation:allowsTrailingEdge:", v9, 0);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return result;
    v10 = result;
    result = objc_msgSend(v8, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v5, "endLocation"), 1);
  }
  else
  {
    result = objc_msgSend(v6, "offsetFromLocation:toLocation:", v7, v9);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return result;
    v10 = result;
    result = objc_msgSend(v6, "offsetFromLocation:toLocation:", v7, objc_msgSend(v5, "endLocation"));
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL && result != v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v4 + 64) + 8);
    v12 = *(uint64_t **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v12 + 2;
    *v12 = v10;
    v12[1] = result - v10;
  }
  return result;
}

@end

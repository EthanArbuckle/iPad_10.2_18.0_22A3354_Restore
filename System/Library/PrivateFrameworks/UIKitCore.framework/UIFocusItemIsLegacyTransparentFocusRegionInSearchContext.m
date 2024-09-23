@implementation UIFocusItemIsLegacyTransparentFocusRegionInSearchContext

void ___UIFocusItemIsLegacyTransparentFocusRegionInSearchContext_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int IsViewOrRespondsToSelector;
  char v8;
  void *v9;

  _UIFocusItemSafeCast(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9 = v5;
    IsViewOrRespondsToSelector = _UIFocusItemIsViewOrRespondsToSelector(v5);
    v6 = v9;
    if (IsViewOrRespondsToSelector)
    {
      v8 = objc_msgSend(v9, "_isTransparentFocusRegion");
      v6 = v9;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        *a3 = 1;
    }
  }

}

@end

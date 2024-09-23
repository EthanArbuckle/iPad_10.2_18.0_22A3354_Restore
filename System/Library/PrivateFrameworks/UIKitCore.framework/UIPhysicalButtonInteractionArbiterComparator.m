@implementation UIPhysicalButtonInteractionArbiterComparator

uint64_t _UIPhysicalButtonInteractionArbiterComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  _BYTE *v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "view");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "view");
  v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _UIWindowCompareWindowsUsingLevel(v5, v7);
  if (!v8)
  {
    if (v5 == v7)
      v8 = _UIGestureRecognizerContainerCompare(v4, v6, 1);
    else
      v8 = 0;
  }

  return v8;
}

@end

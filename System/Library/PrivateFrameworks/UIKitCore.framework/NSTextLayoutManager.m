@implementation NSTextLayoutManager

BOOL __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke(uint64_t a1, void *a2)
{
  double Width;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  CGRect v8;

  objc_msgSend(a2, "layoutFragmentFrame");
  Width = CGRectGetWidth(v8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v4 + 32) < Width)
    *(double *)(v4 + 32) = Width;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v5 + 24) + 1;
  *(_QWORD *)(v5 + 24) = v6;
  return v6 < 0x64;
}

uint64_t __73__NSTextLayoutManager_UIKitAdditions__ui_contentSizeForLastContainerView__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = CGRectGetMaxY(*(CGRect *)&a2);
  return 1;
}

@end

@implementation NSAttributedString

void __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3 != a2)
  {
    *(_QWORD *)(v2 + 40) = 0;

  }
}

void __68__NSAttributedString_TVMLKitAdditions__boundingRectWithWidth_lines___block_invoke(_QWORD *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, _BYTE *a9)
{
  unint64_t v11;
  CGRect v12;
  CGRect v13;

  v13.size.height = a5;
  v13.size.width = a4;
  v13.origin.y = a3;
  v13.origin.x = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v12 = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32), v13);
  v11 = a1[6];
  *(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32) = v12;
  if (v11)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) >= v11)
      *a9 = 1;
  }
}

@end

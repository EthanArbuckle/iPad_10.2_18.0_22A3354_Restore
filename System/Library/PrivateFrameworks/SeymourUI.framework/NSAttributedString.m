@implementation NSAttributedString

void __58__NSAttributedString_Sizing__boundingRectWithWidth_lines___block_invoke(_QWORD *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, _BYTE *a9)
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
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) >= v11)
    *a9 = 1;
}

@end

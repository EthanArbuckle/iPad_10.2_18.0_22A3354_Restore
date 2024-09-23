@implementation TSTLayoutGetAlignedStrokeFrame

uint64_t __TSTLayoutGetAlignedStrokeFrame_block_invoke(uint64_t a1, void *a2)
{
  double AlignedStrokeFrame;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  _BOOL4 IsNull;
  uint64_t v12;
  CGRect v14;

  if ((objc_msgSend(a2, "isFrozen") & 1) == 0)
  {
    AlignedStrokeFrame = TSTLayoutSpaceGetAlignedStrokeFrame((uint64_t)a2);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (IsNull)
    {
      *(double *)(v12 + 48) = AlignedStrokeFrame;
      *(CGFloat *)(v12 + 56) = v6;
      *(CGFloat *)(v12 + 64) = v8;
      *(CGFloat *)(v12 + 72) = v10;
    }
    else
    {
      v14.origin.x = AlignedStrokeFrame;
      v14.origin.y = v6;
      v14.size.width = v8;
      v14.size.height = v10;
      *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = CGRectUnion(*(CGRect *)(v12 + 48), v14);
    }
  }
  return 0;
}

@end

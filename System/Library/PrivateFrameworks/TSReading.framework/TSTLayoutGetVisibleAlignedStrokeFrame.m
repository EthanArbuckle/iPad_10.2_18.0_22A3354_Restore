@implementation TSTLayoutGetVisibleAlignedStrokeFrame

uint64_t __TSTLayoutGetVisibleAlignedStrokeFrame_block_invoke(uint64_t a1, TSTLayoutSpace *a2)
{
  unint64_t VisibleRangeForSpace;
  BOOL v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double AlignedStrokeFrameForGridRange;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  _BOOL4 IsEmpty;
  uint64_t v19;
  CGRect v21;

  if (!-[TSTLayoutSpace isRepeat](a2, "isRepeat"))
  {
    -[TSTLayoutSpace lockForRead](a2, "lockForRead");
    VisibleRangeForSpace = TSTLayoutGetVisibleRangeForSpace(*(double **)(a1 + 32), a2);
    if (HIWORD(VisibleRangeForSpace))
      v5 = (VisibleRangeForSpace & 0xFFFF00000000) == 0;
    else
      v5 = 1;
    if (!v5)
    {
      if (BYTE2(VisibleRangeForSpace) == 255)
        v6 = -1;
      else
        v6 = BYTE2(VisibleRangeForSpace);
      v7 = WORD2(VisibleRangeForSpace) + v6 - 1;
      if (!WORD2(VisibleRangeForSpace))
        v7 = 0xFFFFFFFFLL;
      if ((unsigned __int16)VisibleRangeForSpace == 0xFFFF)
        v8 = 0xFFFFFFFFLL;
      else
        v8 = (unsigned __int16)VisibleRangeForSpace;
      v9 = v6 | ((unint64_t)v8 << 32);
      v10 = ((VisibleRangeForSpace >> 16) & 0xFFFF00000000) + (v8 << 32) - 0x100000000;
      if (((VisibleRangeForSpace >> 16) & 0xFFFF00000000) == 0)
        v10 = 0xFFFFFFFF00000000;
      AlignedStrokeFrameForGridRange = TSTLayoutSpaceGetAlignedStrokeFrameForGridRange(a2, v9, v7 | v10);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      IsEmpty = CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (IsEmpty)
      {
        *(double *)(v19 + 48) = AlignedStrokeFrameForGridRange;
        *(CGFloat *)(v19 + 56) = v13;
        *(CGFloat *)(v19 + 64) = v15;
        *(CGFloat *)(v19 + 72) = v17;
      }
      else
      {
        v21.origin.x = AlignedStrokeFrameForGridRange;
        v21.origin.y = v13;
        v21.size.width = v15;
        v21.size.height = v17;
        *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = CGRectUnion(*(CGRect *)(v19 + 48), v21);
      }
    }
    -[TSTLayoutSpace unlock](a2, "unlock");
  }
  return 0;
}

@end

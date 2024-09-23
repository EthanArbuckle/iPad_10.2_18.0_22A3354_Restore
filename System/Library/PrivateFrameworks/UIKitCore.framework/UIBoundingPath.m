@implementation UIBoundingPath

void __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke(uint64_t a1, double a2, double a3)
{
  double v6;
  double v7;
  uint64_t v9;
  __int128 v10;

  if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
  {
    v6 = _UIIntersectionPointOfRayWithRect(a2, a3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
    if (v6 == *MEMORY[0x1E0C9D628] && v7 == *(double *)(MEMORY[0x1E0C9D628] + 8))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v9 + 32) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v9 + 48) = v10;
    }
    else
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v6
                                                                  - a2
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 32);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v7
                                                                  - a3
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 40);
    }
  }
}

@end

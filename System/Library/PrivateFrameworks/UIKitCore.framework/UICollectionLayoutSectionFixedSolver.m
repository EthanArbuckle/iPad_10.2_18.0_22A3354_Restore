@implementation UICollectionLayoutSectionFixedSolver

double __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_3(uint64_t a1)
{
  double v2;

  v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return _UISetPointValueForAxis(*(_QWORD *)(a1 + 40), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v2);
}

double __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 32) * (double)a2 + 0.0;
}

@end

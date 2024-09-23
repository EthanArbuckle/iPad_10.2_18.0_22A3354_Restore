@implementation UICollectionLayoutItemSolverState

_QWORD *__63___UICollectionLayoutItemSolverState__generateGeometricIndexer__block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if (a2)
  {
    v3 = a2[8];
    v4 = a2[9];
    v5 = a2[10];
    v6 = a2[11];
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v3 = 0.0;
  }
  return -[_UIRTree insertFrame:forIndex:](*(_QWORD **)(a1 + 32), a3, v3, v4, v5, v6);
}

@end

@implementation TSDMetalEdgeDistanceFieldBufferNeighborPixelsClosestToZero

uint64_t __TSDMetalEdgeDistanceFieldBufferNeighborPixelsClosestToZero_block_invoke(uint64_t a1, double *a2, double *a3)
{
  double v3;
  double v4;

  v3 = fabs(*a2);
  v4 = fabs(*a3);
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  else
    return v3 > v4;
}

@end

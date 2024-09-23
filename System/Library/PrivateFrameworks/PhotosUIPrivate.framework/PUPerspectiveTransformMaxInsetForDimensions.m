@implementation PUPerspectiveTransformMaxInsetForDimensions

uint64_t __PUPerspectiveTransformMaxInsetForDimensions_block_invoke(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) > a2)
    a2 = *(double *)(v2 + 24);
  *(double *)(v2 + 24) = a2;
  return result;
}

@end

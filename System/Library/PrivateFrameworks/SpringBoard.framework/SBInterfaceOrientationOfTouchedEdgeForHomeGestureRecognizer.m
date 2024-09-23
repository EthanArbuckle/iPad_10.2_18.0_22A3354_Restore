@implementation SBInterfaceOrientationOfTouchedEdgeForHomeGestureRecognizer

uint64_t __SBInterfaceOrientationOfTouchedEdgeForHomeGestureRecognizer_block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = a3;
  result = _interfaceOrientedRegionGivenScreenRegion();
  if ((result & 4) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    *a4 = 1;
  }
  return result;
}

@end

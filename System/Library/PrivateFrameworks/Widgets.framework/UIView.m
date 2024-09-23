@implementation UIView

uint64_t __75__UIView_WGCAPackageViewAdditions___wg_innerWalkSubviewTreeWithBlock_stop___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_wg_innerWalkSubviewTreeWithBlock:stop:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  *a4 = **(_BYTE **)(a1 + 40);
  return result;
}

@end

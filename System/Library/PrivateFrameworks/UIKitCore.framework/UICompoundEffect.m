@implementation UICompoundEffect

uint64_t __35___UICompoundEffect__expectedUsage__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_expectedUsage");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    *a3 = 1;
  }
  return result;
}

uint64_t __96___UICompoundEffect__needsUpdateForTransitionFromEnvironment_toEnvironment_changedTraits_usage___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", a1[4], a1[5], a1[6], a1[8]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end

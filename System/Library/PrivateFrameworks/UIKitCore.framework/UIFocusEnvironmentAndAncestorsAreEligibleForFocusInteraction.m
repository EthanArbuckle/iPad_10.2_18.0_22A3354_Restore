@implementation UIFocusEnvironmentAndAncestorsAreEligibleForFocusInteraction

uint64_t ___UIFocusEnvironmentAndAncestorsAreEligibleForFocusInteraction_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = _UIFocusEnvironmentIsEligibleForFocusInteraction(a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end

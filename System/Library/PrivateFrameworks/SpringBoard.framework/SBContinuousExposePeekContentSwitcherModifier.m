@implementation SBContinuousExposePeekContentSwitcherModifier

uint64_t __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isEqual:", a2);
}

uint64_t __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isEqual:", a2) ^ 1;
}

@end

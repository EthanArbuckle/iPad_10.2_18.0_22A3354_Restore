@implementation SBFullScreenAppFloorSwitcherModifier

BOOL __59___SBFullScreenAppFloorSwitcherModifier_frameForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

BOOL __73___SBFullScreenAppFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return *(_BYTE *)(a1 + 32) || objc_msgSend(a2, "environment") != 3;
}

uint64_t __65___SBFullScreenAppFloorSwitcherModifier_handleTapAppLayoutEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

@end

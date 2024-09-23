@implementation SBSlideOverAppsInFullScreenSwitcherSwitcherModifier

- (id)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v6;
  uint64_t v7;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSlideOverAppsInFullScreenSwitcherSwitcherModifier;
  -[SBSwitcherModifier _handleEvent:](&v11, sel__handleEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendChainableModifierResponse(v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "isExitingAnyPeekEvent"))
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
    v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendChainableModifierResponse(v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__SBSlideOverAppsInFullScreenSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &unk_1E8EBC298;
  v8[4] = self;
  objc_msgSend(a3, "bs_compactMap:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverAppsInFullScreenSwitcherSwitcherModifier;
  -[SBSlideOverAppsInFullScreenSwitcherSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v7, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__SBSlideOverAppsInFullScreenSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isAppLayoutMostRecentRepresentationOfDisplayItems:", v3))
  {
    if (objc_msgSend(v3, "environment") == 2)
    {
      objc_msgSend(v3, "appLayoutByModifyingEnvironment:", 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v3;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

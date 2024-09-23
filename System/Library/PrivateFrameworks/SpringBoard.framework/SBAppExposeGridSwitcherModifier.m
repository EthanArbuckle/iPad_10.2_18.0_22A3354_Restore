@implementation SBAppExposeGridSwitcherModifier

- (SBAppExposeGridSwitcherModifier)initWithBundleIdentifier:(id)a3 fullScreenCardSize:(CGSize)a4 floatingCardSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v7;
  CGFloat v8;
  id v10;
  SBAppExposeGridSwitcherModifier *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  objc_super v15;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v11 = -[SBSwitcherModifier init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v11->_fullScreenCardSize.width = v8;
    v11->_fullScreenCardSize.height = v7;
    v11->_floatingCardSize.width = width;
    v11->_floatingCardSize.height = height;
    v11->_reversesFloatingCardDirection = 1;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBMixedGridSwitcherModifier *v5;
  SBMixedGridSwitcherModifier *mixedGridModifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAppExposeGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_mixedGridModifier)
    {
      v5 = -[SBMixedGridSwitcherModifier initWithFullScreenCardSize:floatingCardSize:]([SBMixedGridSwitcherModifier alloc], "initWithFullScreenCardSize:floatingCardSize:", self->_fullScreenCardSize.width, self->_fullScreenCardSize.height, self->_floatingCardSize.width, self->_floatingCardSize.height);
      mixedGridModifier = self->_mixedGridModifier;
      self->_mixedGridModifier = v5;

      -[SBMixedGridSwitcherModifier setMaximumNumberOfFullScreenCardsForSingleRow:](self->_mixedGridModifier, "setMaximumNumberOfFullScreenCardsForSingleRow:", 2);
      -[SBMixedGridSwitcherModifier setLowDensityGridLayoutAlignment:](self->_mixedGridModifier, "setLowDensityGridLayoutAlignment:", 1);
      -[SBMixedGridSwitcherModifier setReversesFloatingCardDirection:](self->_mixedGridModifier, "setReversesFloatingCardDirection:", self->_reversesFloatingCardDirection);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_mixedGridModifier);
    }
  }
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
  self->_reversesFloatingCardDirection = a3;
  -[SBMixedGridSwitcherModifier setReversesFloatingCardDirection:](self->_mixedGridModifier, "setReversesFloatingCardDirection:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v4 = -[SBChainableModifier copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_bundleIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 18);
  *((_QWORD *)v4 + 18) = v5;

  *(CGSize *)(v4 + 152) = self->_fullScreenCardSize;
  *(CGSize *)(v4 + 168) = self->_floatingCardSize;
  v4[137] = self->_reversesFloatingCardDirection;
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBInvalidateReopenButtonTextSwitcherEventResponse *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAppExposeGridSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v11, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "toEnvironmentMode") == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  objc_msgSend(v4, "fromAppExposeBundleID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (SBInvalidateReopenButtonTextSwitcherEventResponse *)v6;
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "phase") == 2)
  {
    -[SBAppExposeGridSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBInvalidateReopenButtonTextSwitcherEventResponse *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleRemovalEvent:](&v11, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v11.receiver, v11.super_class);

  if (v6 == 2)
  {
    -[SBAppExposeGridSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleInsertionEvent:](&v10, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    -[SBAppExposeGridSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBAppExposeGridSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBAppExposeModifierShowReopenButtonReason"));
  if ((_DWORD)v4)
  {
    self->_isShowingReopenClosedWindowsButton = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBMixedGridSwitcherModifier adjustedAppLayoutsForAppLayouts:](self->_mixedGridModifier, "adjustedAppLayoutsForAppLayouts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsItemWithBundleIdentifier:", self->_bundleIdentifier))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleEligibleForContentDragSpringLoading:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)plusButtonAlpha
{
  return 1.0;
}

- (double)reopenClosedWindowsButtonAlpha
{
  double result;
  objc_super v4;

  if (!-[SBAppExposeGridSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")
    || (result = 1.0, !self->_isShowingReopenClosedWindowsButton))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBAppExposeGridSwitcherModifier;
    -[SBAppExposeGridSwitcherModifier reopenClosedWindowsButtonAlpha](&v4, sel_reopenClosedWindowsButtonAlpha, result);
  }
  return result;
}

- (double)reopenClosedWindowsButtonScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->_isShowingReopenClosedWindowsButton)
    return 1.0;
  -[SBAppExposeGridSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reopenButtonInitialScale");
  v6 = v5;

  return v6;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  return 1;
}

- (int64_t)plusButtonStyle
{
  return 0;
}

- (id)appLayoutToScrollToBeforeReopeningClosedWindows
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  -[SBAppExposeGridSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBMixedGridSwitcherModifier numberOfFloatingAppLayouts](self->_mixedGridModifier, "numberOfFloatingAppLayouts"))
  {
    v4 = -[SBMixedGridSwitcherModifier indexOfFirstMainAppLayoutFromAppLayouts:](self->_mixedGridModifier, "indexOfFirstMainAppLayoutFromAppLayouts:", v3);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v3, "lastObject");
    else
      objc_msgSend(v3, "objectAtIndex:", v4 - 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (v5
    && -[SBMixedGridSwitcherModifier isIndexVisible:](self->_mixedGridModifier, "isIndexVisible:", objc_msgSend(v3, "indexOfObject:", v5)))
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)_canShowReopenClosedWindowsButton
{
  return self->_numberOfHiddenAppLayouts != 0;
}

- (id)_updateReopenClosedWindowsButtonPresence
{
  BOOL v3;
  SBTimerEventSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  SBTimerEventSwitcherEventResponse *v9;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = -[SBAppExposeGridSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton");
  self->_numberOfHiddenAppLayouts = -[SBAppExposeGridSwitcherModifier numberOfHiddenAppLayoutsForBundleIdentifier:](self, "numberOfHiddenAppLayoutsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = 0;
  if (-[SBAppExposeGridSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")
    && !v3)
  {
    self->_isShowingReopenClosedWindowsButton = 0;
    -[SBAppExposeGridSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reopenButtonFadeInDelay");
    v8 = v7;

    objc_initWeak(&location, self);
    v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__SBAppExposeGridSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke;
    v11[3] = &unk_1E8EA3468;
    objc_copyWeak(&v12, &location);
    v4 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v9, "initWithDelay:validator:reason:", v11, CFSTR("kSBAppExposeModifierShowReopenButtonReason"), v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __75__SBAppExposeGridSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CGSize)fullScreenCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullScreenCardSize.width;
  height = self->_fullScreenCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)floatingCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_floatingCardSize.width;
  height = self->_floatingCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)reversesFloatingCardDirection
{
  return self->_reversesFloatingCardDirection;
}

- (BOOL)disableFullScreenCardScaleRounding
{
  return self->_disableFullScreenCardScaleRounding;
}

- (void)setDisableFullScreenCardScaleRounding:(BOOL)a3
{
  self->_disableFullScreenCardScaleRounding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
}

@end

@implementation SBAppExposeContinuousExposeSwitcherModifier

- (SBAppExposeContinuousExposeSwitcherModifier)initWithBundleIdentifier:(id)a3
{
  id v5;
  SBAppExposeContinuousExposeSwitcherModifier *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  SBGridSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v12, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBAppExposeContinuousExposeSwitcherModifier.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    }
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = objc_alloc_init(SBGridSwitcherModifier);
    -[SBChainableModifier addChildModifier:](v6, "addChildModifier:", v9);

  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v4 = -[SBChainableModifier copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_bundleIdentifier, "copy");
  v6 = (void *)v4[17];
  v4[17] = v5;

  *((_OWORD *)v4 + 6) = self->_previousContentOffset;
  *((_BYTE *)v4 + 112) = self->_isScrollingForward;
  v4[15] = self->_numberOfHiddenAppLayouts;
  *((_BYTE *)v4 + 128) = self->_isShowingReopenClosedWindowsButton;
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBInvalidateReopenButtonTextSwitcherEventResponse *v9;
  void *v10;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v20, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "toEnvironmentMode") == 2 && objc_msgSend(v4, "fromEnvironmentMode") != 2)
  {
    self->_previousContentOffset = (CGPoint)SBInvalidPoint;
    self->_isScrollingForward = 1;
  }
  objc_msgSend(v4, "fromAppExposeBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if (objc_msgSend(v4, "phase") == 2)
  {
    -[SBAppExposeContinuousExposeSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v11, v10);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v5 = (void *)v12;
    goto LABEL_18;
  }
  objc_msgSend(v4, "toAppExposeBundleID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    if (objc_msgSend(v4, "phase") == 3)
    {

LABEL_16:
      v11 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      SBAppendSwitcherModifierResponse(v11, v5);
      v12 = objc_claimAutoreleasedReturnValue();
      v10 = v5;
      goto LABEL_17;
    }
    v15 = objc_msgSend(v4, "isAnimated");

    if ((v15 & 1) == 0)
      goto LABEL_16;
  }
  objc_msgSend(v4, "fromAppExposeBundleID");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v11 = (SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *)v16;
    objc_msgSend(v4, "toAppExposeBundleID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v10 = (void *)v17;
LABEL_18:

      goto LABEL_19;
    }
    v18 = objc_msgSend(v4, "phase");

    if (v18 == 2)
      goto LABEL_16;
  }
LABEL_19:

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
  v11.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleRemovalEvent:](&v11, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v11.receiver, v11.super_class);

  if (v6 == 2)
  {
    -[SBAppExposeContinuousExposeSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(SBInvalidateReopenButtonTextSwitcherEventResponse);
    SBAppendSwitcherModifierResponse(v9, v8);
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
  v10.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleInsertionEvent:](&v10, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6 == 2)
  {
    -[SBAppExposeContinuousExposeSwitcherModifier _updateReopenClosedWindowsButtonPresence](self, "_updateReopenClosedWindowsButtonPresence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
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
  v10.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v10, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("kSBAppExposeContinuousExposeReopenReason"));
  if ((_DWORD)v4)
  {
    self->_isShowingReopenClosedWindowsButton = 1;
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:(id)a3 identifiersInStrip:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  -[SBAppExposeContinuousExposeSwitcherModifier adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:](&v18, sel_adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher_identifiersInStrip_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsString:", self->_bundleIdentifier, (_QWORD)v14))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  return v6;
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
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17.receiver = self;
  v17.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  -[SBAppExposeContinuousExposeSwitcherModifier adjustedAppLayoutsForAppLayouts:](&v17, sel_adjustedAppLayoutsForAppLayouts_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
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
        if (objc_msgSend(v11, "environment") != 3
          && objc_msgSend(v11, "containsItemWithBundleIdentifier:", self->_bundleIdentifier))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
  v10 = a4;
  -[SBAppExposeContinuousExposeSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v29, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "allItems", v29.receiver, v29.super_class);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count");
  if (v20 == 1)
  {
    SBRectWithSize();
    UIRectCenteredRect();
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v18 = v24;
  }
  v25 = v12;
  v26 = v14;
  v27 = v16;
  v28 = v18;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIRectCornerRadii result;

  -[SBAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chamoisSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherCornerRadius");

  -[SBAppExposeContinuousExposeSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v10;
  result.bottomRight = v9;
  result.bottomLeft = v8;
  result.topLeft = v7;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (double)homeScreenAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
}

- (double)homeScreenBackdropBlurProgress
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
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

  if (!-[SBAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")|| (result = 1.0, !self->_isShowingReopenClosedWindowsButton))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBAppExposeContinuousExposeSwitcherModifier;
    -[SBAppExposeContinuousExposeSwitcherModifier reopenClosedWindowsButtonAlpha](&v4, sel_reopenClosedWindowsButtonAlpha, result);
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
  -[SBAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
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
  void *v4;
  void *v5;
  char v6;

  -[SBAppExposeContinuousExposeSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBAppExposeContinuousExposeSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) == 0)
    {

      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
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

  v3 = -[SBAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton");
  self->_numberOfHiddenAppLayouts = -[SBAppExposeContinuousExposeSwitcherModifier numberOfHiddenAppLayoutsForBundleIdentifier:](self, "numberOfHiddenAppLayoutsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = 0;
  if (-[SBAppExposeContinuousExposeSwitcherModifier _canShowReopenClosedWindowsButton](self, "_canShowReopenClosedWindowsButton")&& !v3)
  {
    self->_isShowingReopenClosedWindowsButton = 0;
    -[SBAppExposeContinuousExposeSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reopenButtonFadeInDelay");
    v8 = v7;

    objc_initWeak(&location, self);
    v9 = [SBTimerEventSwitcherEventResponse alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__SBAppExposeContinuousExposeSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke;
    v11[3] = &unk_1E8EA3468;
    objc_copyWeak(&v12, &location);
    v4 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v9, "initWithDelay:validator:reason:", v11, CFSTR("kSBAppExposeContinuousExposeReopenReason"), v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

BOOL __87__SBAppExposeContinuousExposeSwitcherModifier__updateReopenClosedWindowsButtonPresence__block_invoke(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

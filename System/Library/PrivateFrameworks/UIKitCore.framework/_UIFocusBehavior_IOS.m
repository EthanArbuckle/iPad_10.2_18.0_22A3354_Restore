@implementation _UIFocusBehavior_IOS

- (BOOL)honorsFocusSystemEnabledInfoPlistKey
{
  return 1;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___UIFocusBehavior_IOS_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD81CB8 != -1)
    dispatch_once(&qword_1ECD81CB8, block);
  return (id)qword_1ECD81CB0;
}

- (BOOL)_shouldOverrideFocusSystemEnabledForScene:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_focusSystemSceneComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOverrideFocusSystemEnabled");

  return v4;
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIFocusLinkCheckEnabled, (uint64_t)CFSTR("UIFocusLinkCheckEnabled")) & 1) == 0&& !byte_1ECD769A4|| (dyld_program_sdk_at_least() & 1) != 0|| -[_UIFocusBehavior_IOS _shouldOverrideFocusSystemEnabledForScene:](self, "_shouldOverrideFocusSystemEnabledForScene:", v4);

  return v5;
}

- (int64_t)requiredInputDevices
{
  if (-[_UIFocusBehavior_IOS supportsGameControllers](self, "supportsGameControllers"))
    return 3;
  else
    return 1;
}

- (BOOL)syncsFocusAndResponder
{
  return 1;
}

- (int64_t)focusDeferral
{
  return 3;
}

- (BOOL)ignoresKeyWindowStatusWhenRestoringFocus
{
  return 1;
}

- (BOOL)allowsRestoringFocusForScreen:(id)a3
{
  return 1;
}

- (BOOL)controlCanBecomeFocused:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  int v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "focusEnabledInLimitedControls");

  if (v6)
  {
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();
    objc_opt_class();
    isKindOfClass |= v7 | objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)textViewCanBecomeFocused:(id)a3
{
  return objc_msgSend(a3, "isEditable");
}

- (BOOL)tabBarCanBecomeFocused
{
  return 0;
}

- (BOOL)tabBarButtonCanBecomeFocused
{
  return 0;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 1;
}

- (BOOL)includesContentScrollViewInPreferredFocusEnvironments
{
  return 1;
}

- (int64_t)indirectMovementPriority
{
  return 0;
}

- (unint64_t)focusGroupMovementBehavior
{
  return 30;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 1010;
}

- (BOOL)enforcesStrictTargetContentOffsetAdjustmentBehavior
{
  return 1;
}

- (unint64_t)defaultFocusScrollOffsetResolver
{
  return 2;
}

- (int64_t)scrollingMode
{
  return 2;
}

- (BOOL)shouldUseAccessibilityCompareForItemGeometry
{
  return 0;
}

- (BOOL)shouldUseAccessibilityCompareForFocusGroupsInExternallyPlacedWindows
{
  return 0;
}

- (int64_t)cellFocusability
{
  if (_UIFocusBehaviorAPIBehavior_onceToken[0] != -1)
    dispatch_once(_UIFocusBehaviorAPIBehavior_onceToken, &__block_literal_global_575);
  if (_UIFocusBehaviorAPIBehavior_apiFocusBehavior)
    return 2;
  else
    return 1;
}

- (BOOL)preventsCellFocusabilityWhileEditing
{
  return 0;
}

- (BOOL)defaultValueForSelectionFollowsFocusInCollectionView:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (!dyld_program_sdk_at_least())
    goto LABEL_16;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasSplitViewControllerContextSidebarColumn");

  if (v5)
  {
    if ((objc_msgSend(v3, "_delegateSupportsPrimaryAction") & 1) == 0)
    {
      objc_msgSend(v3, "_viewControllerForAncestor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "splitViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_msgSend(v7, "displayMode");
        if (v8 <= 6 && ((1 << v8) & 0x68) != 0)
        {
          LOBYTE(v5) = 0;
LABEL_15:

          goto LABEL_17;
        }
      }

    }
    if ((dyld_program_sdk_at_least() & 1) != 0 || (objc_msgSend(v3, "isEditing") & 1) == 0)
    {
      objc_msgSend(v3, "_viewControllerForAncestor");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v7 = (void *)v9;
        do
        {
          objc_opt_class();
          LOBYTE(v5) = objc_opt_isKindOfClass();
          if ((v5 & 1) != 0)
            break;
          objc_msgSend(v7, "parentViewController");
          v10 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v10;
        }
        while (v10);
        goto LABEL_15;
      }
    }
LABEL_16:
    LOBYTE(v5) = 0;
  }
LABEL_17:

  return v5 & 1;
}

- (BOOL)defaultValueForSelectionFollowsFocusInTableView:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (!dyld_program_sdk_at_least())
    goto LABEL_16;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasSplitViewControllerContextSidebarColumn");

  if (v5)
  {
    if ((objc_msgSend(v3, "_delegateSupportsPrimaryAction") & 1) == 0)
    {
      objc_msgSend(v3, "_viewControllerForAncestor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "splitViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_msgSend(v7, "displayMode");
        if (v8 <= 6 && ((1 << v8) & 0x68) != 0)
        {
          LOBYTE(v5) = 0;
LABEL_15:

          goto LABEL_17;
        }
      }

    }
    if ((dyld_program_sdk_at_least() & 1) != 0 || (objc_msgSend(v3, "isEditing") & 1) == 0)
    {
      objc_msgSend(v3, "_viewControllerForAncestor");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v7 = (void *)v9;
        do
        {
          objc_opt_class();
          LOBYTE(v5) = objc_opt_isKindOfClass();
          if ((v5 & 1) != 0)
            break;
          objc_msgSend(v7, "parentViewController");
          v10 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v10;
        }
        while (v10);
        goto LABEL_15;
      }
    }
LABEL_16:
    LOBYTE(v5) = 0;
  }
LABEL_17:

  return v5 & 1;
}

- (BOOL)viewControllerPresentationRestoresLastFocusedItem
{
  return 1;
}

- (BOOL)treatFirstAndLastHeadingsAsGlobal
{
  return 1;
}

- (BOOL)supportsViewTransparency
{
  return dyld_program_sdk_at_least();
}

- (BOOL)supportsMultipleWindows
{
  return dyld_program_sdk_at_least();
}

- (BOOL)requiresLegacyScreenBasedWindowLookup
{
  return 0;
}

- (BOOL)supportsClipToBounds
{
  return 1;
}

- (int64_t)focusCastingMode
{
  return 2;
}

- (BOOL)throttlesProgrammaticFocusUpdates
{
  return 1;
}

- (BOOL)wantsTreeLocking
{
  return 1;
}

- (double)stabilizedLinearFocusMovementTimeout
{
  int v2;
  double result;

  v2 = dyld_program_sdk_at_least();
  result = 0.0;
  if (v2)
    return 0.5;
  return result;
}

- (BOOL)cachesPreferredEnvironmentEnumerationResults
{
  return 1;
}

- (BOOL)modernFocusedItemGetterBehavior
{
  return 1;
}

- (BOOL)disablesFocusabilityForItemsContainingFocus
{
  return 0;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 0;
}

- (BOOL)addsAccessibilityElementsToFocusEngine
{
  return 0;
}

- (BOOL)shouldAdjustAnimationTimingForOffscreenDistance
{
  return 1;
}

- (BOOL)supportsSounds
{
  return 0;
}

- (BOOL)supportsHaptics
{
  return 0;
}

- (BOOL)supportsFrameReporter
{
  return 0;
}

- (int64_t)buttonSelectionMode
{
  return 2;
}

- (int64_t)focusRingVisibility
{
  void *v2;
  int v3;

  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forcesDefaultFocusAppearance");

  if (v3)
    return 2;
  else
    return 3;
}

- (BOOL)supportsParentFocusRings
{
  return 0;
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  return 1;
}

- (BOOL)supportsIndirectPanningMovement
{
  return 0;
}

- (BOOL)supportsIndirectRotaryMovement
{
  return 0;
}

- (BOOL)shouldConvertIndirectTapsIntoArrowKeys
{
  return 0;
}

- (BOOL)supportsGameControllers
{
  void *v2;
  char v3;

  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresGameControllerBasedFocus");

  return v3;
}

- (BOOL)supportsArrowKeys
{
  return 1;
}

- (int64_t)pageButtonScrollingStyle
{
  return 0;
}

- (BOOL)supportsTabKey
{
  return 1;
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 0;
}

- (BOOL)shouldSupressIndirectMovementOnSelect
{
  return 0;
}

- (int64_t)deliverKeyEventsToFocusEngine
{
  return 2;
}

- (int64_t)skipKeyCommandsForKeyEvents
{
  return 2;
}

- (BOOL)tabBasedMovementLoops
{
  return 1;
}

- (BOOL)autoDismissesPopoverControllersOnFocusIntersection
{
  return 0;
}

- (int64_t)focusSystemDeactivationMode
{
  return 0;
}

- (BOOL)legacyIsTransparentFocusRegionSupported
{
  return 0;
}

- (BOOL)waitForFocusMovementActionToEnableFocusSystem
{
  return 0;
}

- (BOOL)shouldCallAccessibilityOverrides
{
  return 0;
}

- (BOOL)supportsLinearMovementDebugOverlay
{
  if (qword_1ECD81CC0 != -1)
    dispatch_once(&qword_1ECD81CC0, &__block_literal_global_129_1);
  return _MergedGlobals_1266;
}

@end

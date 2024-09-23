@implementation _UIFocusBehavior_CarPlay

+ (id)sharedInstance
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This is an abstract class that can not be initialized directly."));
  return 0;
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusBehavior_CarPlay.m"), 30, CFSTR("Attempting to initialize CarPlay focus system with a scene (%@) that is not a windowScene"), v5);

  }
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interactionModel");

  return (v7 & 0xA) != 0;
}

- (BOOL)honorsFocusSystemEnabledInfoPlistKey
{
  return 1;
}

- (int64_t)requiredInputDevices
{
  return 0;
}

- (BOOL)syncsFocusAndResponder
{
  return 0;
}

- (int64_t)focusDeferral
{
  return 0;
}

- (BOOL)ignoresKeyWindowStatusWhenRestoringFocus
{
  return 0;
}

- (BOOL)allowsRestoringFocusForScreen:(id)a3
{
  return objc_msgSend(a3, "_isCarInstrumentsScreen") ^ 1;
}

- (BOOL)controlCanBecomeFocused:(id)a3
{
  return 1;
}

- (BOOL)textViewCanBecomeFocused:(id)a3
{
  return objc_msgSend(a3, "isSelectable");
}

- (BOOL)tabBarCanBecomeFocused
{
  return 1;
}

- (BOOL)tabBarButtonCanBecomeFocused
{
  return 1;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 0;
}

- (BOOL)includesContentScrollViewInPreferredFocusEnvironments
{
  return 0;
}

- (unint64_t)focusGroupMovementBehavior
{
  return 0;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 0;
}

- (BOOL)enforcesStrictTargetContentOffsetAdjustmentBehavior
{
  return 0;
}

- (unint64_t)defaultFocusScrollOffsetResolver
{
  return 0;
}

- (int64_t)scrollingMode
{
  return 1;
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
  return 0;
}

- (BOOL)preventsCellFocusabilityWhileEditing
{
  return 1;
}

- (BOOL)defaultValueForSelectionFollowsFocusInCollectionView:(id)a3
{
  return 0;
}

- (BOOL)defaultValueForSelectionFollowsFocusInTableView:(id)a3
{
  return 0;
}

- (BOOL)viewControllerPresentationRestoresLastFocusedItem
{
  return 0;
}

- (BOOL)treatFirstAndLastHeadingsAsGlobal
{
  return 0;
}

- (BOOL)supportsViewTransparency
{
  return 0;
}

- (BOOL)supportsMultipleWindows
{
  return 0;
}

- (BOOL)requiresLegacyScreenBasedWindowLookup
{
  return 1;
}

- (BOOL)supportsClipToBounds
{
  return dyld_program_sdk_at_least();
}

- (int64_t)focusCastingMode
{
  return 0;
}

- (BOOL)throttlesProgrammaticFocusUpdates
{
  return 0;
}

- (BOOL)wantsTreeLocking
{
  return 0;
}

- (double)stabilizedLinearFocusMovementTimeout
{
  return -1.0;
}

- (BOOL)cachesPreferredEnvironmentEnumerationResults
{
  return 0;
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

- (int64_t)buttonSelectionMode
{
  return 3;
}

- (int64_t)focusRingVisibility
{
  return 0;
}

- (BOOL)supportsParentFocusRings
{
  return 0;
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  return 0;
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
  return 0;
}

- (BOOL)supportsArrowKeys
{
  return 0;
}

- (int64_t)pageButtonScrollingStyle
{
  return 0;
}

- (BOOL)supportsTabKey
{
  return 0;
}

- (int64_t)indirectMovementPriority
{
  return 0;
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
  return 0;
}

- (int64_t)skipKeyCommandsForKeyEvents
{
  return 0;
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

- (BOOL)shouldAdjustAnimationTimingForOffscreenDistance
{
  return 0;
}

- (BOOL)supportsSounds
{
  return 0;
}

- (BOOL)supportsHaptics
{
  return 1;
}

- (BOOL)supportsFrameReporter
{
  return 0;
}

- (BOOL)legacyIsTransparentFocusRegionSupported
{
  return 1;
}

- (BOOL)waitForFocusMovementActionToEnableFocusSystem
{
  return 1;
}

- (BOOL)shouldCallAccessibilityOverrides
{
  return 0;
}

- (BOOL)supportsLinearMovementDebugOverlay
{
  return 0;
}

@end

@implementation _UIFocusBehavior_TV

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37___UIFocusBehavior_TV_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD82240 != -1)
    dispatch_once(&qword_1ECD82240, block);
  return (id)_MergedGlobals_1301;
}

- (_UIFocusBehavior_TV)init
{
  _UIFocusBehavior_TV *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusBehavior_TV;
  v2 = -[_UIFocusBehavior_TV init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleRemoteTouchSurfaceTypeDidChangeNotification_, CFSTR("_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusBehavior_TV;
  -[_UIFocusBehavior_TV dealloc](&v4, sel_dealloc);
}

- (BOOL)wantsFocusSystemForScene:(id)a3
{
  return 1;
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
  return 1;
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
  return 32;
}

- (unint64_t)focusGroupContainmentBehavior
{
  return 296;
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
  return 0;
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
  return 1;
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
  return 0;
}

- (BOOL)supportsClipToBounds
{
  return dyld_program_sdk_at_least();
}

- (int64_t)focusCastingMode
{
  return 1;
}

- (BOOL)throttlesProgrammaticFocusUpdates
{
  return 0;
}

- (BOOL)wantsTreeLocking
{
  return 1;
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
  return 0;
}

- (BOOL)disablesFocusabilityForItemsContainingFocus
{
  return 0;
}

- (BOOL)refinesIndexBarTargetContentOffset
{
  return 1;
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
  return 1;
}

- (BOOL)supportsHaptics
{
  return 0;
}

- (BOOL)supportsFrameReporter
{
  return 1;
}

- (int64_t)buttonSelectionMode
{
  return 2;
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
  return 1;
}

- (BOOL)supportsIndirectRotaryMovement
{
  int v2;
  char v3;
  char v4;
  char v5;

  v2 = B519BehaviorEnabled();
  if (v2)
  {
    v3 = _os_feature_enabled_impl();
    v4 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_SupportsIndirectRotaryMovement, (uint64_t)CFSTR("B519_SupportsIndirectRotaryMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1EDDA83BC)
      v5 = 1;
    else
      v5 = v4;
    LOBYTE(v2) = v3 & v5;
  }
  return v2;
}

- (BOOL)shouldConvertIndirectTapsIntoArrowKeys
{
  return !B519BehaviorEnabled()
      || _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled() != 0;
}

- (BOOL)supportsGameControllers
{
  return 1;
}

- (BOOL)supportsArrowKeys
{
  return 1;
}

- (int64_t)pageButtonScrollingStyle
{
  int v2;
  int64_t v3;

  if (!_os_feature_enabled_impl())
    return 0;
  v2 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPageButtonScrollingStyle, (uint64_t)CFSTR("FocusPageButtonScrollingStyle"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  v3 = qword_1EDDA83C8;
  if (v2)
    v3 = 1;
  if (v3 <= 3)
    return v3;
  else
    return 0;
}

- (BOOL)supportsTabKey
{
  return 0;
}

- (int64_t)indirectMovementPriority
{
  int v2;
  int v3;

  if (!B519BehaviorEnabled())
    return 0;
  v2 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_ButtonPressesCancelMovement, (uint64_t)CFSTR("B519_ButtonPressesCancelMovement"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1EDDA83B4)
    v3 = 1;
  else
    v3 = v2;
  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)shouldEnableFocusOnSelect
{
  return 0;
}

- (int64_t)deliverKeyEventsToFocusEngine
{
  return 1;
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
  return 1;
}

- (int64_t)focusSystemDeactivationMode
{
  return 1;
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
  return 0;
}

- (void)_handleRemoteTouchSurfaceTypeDidChangeNotification:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

}

@end

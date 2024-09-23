@implementation UIApplicationInfoParser

void __48___UIApplicationInfoParser_mainBundleInfoParser__block_invoke()
{
  _UIApplicationInfoParser *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [_UIApplicationInfoParser alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[_UIApplicationInfoParser _initWithBundle:](v0, "_initWithBundle:", v3);
  v2 = (void *)_MergedGlobals_1053;
  _MergedGlobals_1053 = v1;

}

void __53___UIApplicationInfoParser_initWithApplicationProxy___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("UIBackgroundStyle"), CFSTR("UIApplicationIsOpaque"), CFSTR("UIStatusBarHidden"), CFSTR("UIStatusBarStyle"), CFSTR("UIStatusBarHiddenWhenVerticallyCompact"), CFSTR("UILaunchImageFile"), CFSTR("NSAccentColorName"), CFSTR("UIStatusBarStyleIgnoredOverrides"), CFSTR("UIViewControllerBasedStatusBarAppearance"), CFSTR("UIApplicationSystemWindowsSecureKey"), CFSTR("UIWhitePointAdaptivityStyleKey"), CFSTR("_UIWhitePointAdaptivityStyle"), CFSTR("Capabilities"), CFSTR("UIOptOutOfRTL"), CFSTR("NSDisableKeyboardLayoutAdjustedShortcuts"), CFSTR("UISupportedInterfaceOrientations"), CFSTR("UIInterfaceOrientation"),
         CFSTR("UIApplicationExitsOnSuspend"),
         CFSTR("UIApplicationInterfaceManifest"),
         CFSTR("UIUserInterfaceStyle"),
         CFSTR("UIDeviceFamily"),
         CFSTR("com.apple.uikit.feature-a"),
         CFSTR("UIApplicationSupportsIndirectInputEvents"),
         CFSTR("_UIRequiresGameControllerBasedFocus"),
         CFSTR("_UIFocusLimitedControlsEnabled"),
         CFSTR("_UIFocusDefaultAppearanceEnabled"),
         CFSTR("UIFocusSystemEnabled"),
         CFSTR("UIObservationTrackingEnabled"),
         CFSTR("UIApplicationSupportsPrintCommand"),
         0x1E1760D20,
         CFSTR("CFBundleDocumentTypes"),
         0);
  v1 = (void *)qword_1ECD7DCC0;
  qword_1ECD7DCC0 = v0;

}

@end

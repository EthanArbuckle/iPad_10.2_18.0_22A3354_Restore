@implementation UIApplication(UIAccessibility)

- (id)accessibilityLastGesturedTextInputStatusChange
{
  return objc_getAssociatedObject(a1, &__UIApplication__accessibilityLastGesturedTextInputStatusChange);
}

- (uint64_t)setAccessibilityLastGesturedTextInputStatusChange:()UIAccessibility
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityKeyboardKeyDispatchOverride
{
  return objc_getAssociatedObject(a1, &__UIApplication__accessibilityKeyboardKeyDispatchOverride);
}

- (void)setAccessibilityKeyboardKeyDispatchOverride:()UIAccessibility
{
  id v3;

  v3 = _Block_copy(aBlock);
  __UIAccessibilitySetAssociatedObject();

}

- (double)_accessibilityMaximumAllowedOutOfBoundsPercent
{
  double result;

  if (UIAccessibilityIsWidgetExtension_onceToken != -1)
    dispatch_once(&UIAccessibilityIsWidgetExtension_onceToken, &__block_literal_global_423);
  result = 0.5;
  if (!UIAccessibilityIsWidgetExtension_IsWidget)
    return 1.0;
  return result;
}

- (BOOL)_accessibilityIsAppReadyToBeProbed
{
  _BOOL8 v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v5 = 0;
  AXPerformSafeBlock();
  if (AXProcessIsSpringBoard())
  {
    _AXLogWithFacility();
    v0 = 0;
  }
  else if (*((_BYTE *)v7 + 24))
  {
    v0 = *((_BYTE *)v3 + 24) != 0;
  }
  else
  {
    v0 = 1;
    if ((_accessibilityIsAppReadyToBeProbed_EmittedLogSpew & 1) == 0)
    {
      _AXLogWithFacility();
      _accessibilityIsAppReadyToBeProbed_EmittedLogSpew = 1;
    }
  }
  _Block_object_dispose(&v2, 8);
  _Block_object_dispose(&v6, 8);
  return v0;
}

- (void)_accessibilitySetIsDictationListeningOverride:()UIAccessibility
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_DEFAULT, "Set dictation override: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("_accessibilityIsDictationListeningOverride"));
}

@end

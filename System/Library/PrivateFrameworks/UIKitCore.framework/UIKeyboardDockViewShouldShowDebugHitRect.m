@implementation UIKeyboardDockViewShouldShowDebugHitRect

uint64_t ___UIKeyboardDockViewShouldShowDebugHitRect_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  uint64_t result;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("ShowDockItemTouchArea"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  result = os_variant_has_internal_diagnostics();
  if (!(_DWORD)result)
    v2 = 0;
  _MergedGlobals_13_3 = v2;
  return result;
}

@end

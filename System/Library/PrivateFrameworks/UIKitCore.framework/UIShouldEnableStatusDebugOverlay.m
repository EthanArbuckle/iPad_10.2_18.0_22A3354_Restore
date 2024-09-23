@implementation UIShouldEnableStatusDebugOverlay

void ___UIShouldEnableStatusDebugOverlay_block_invoke()
{
  void *v0;
  int v1;
  int v2;
  BOOL v3;
  BOOL v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("UIFocusStatusDebugOverlayEnabled"));

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v7 = _UIInternalPreference_UIFocusStatusDebugOverlayEnabled,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIFocusStatusDebugOverlayEnabled))
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v3 = v2 < v7;
      if (v2 < v7)
        break;
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_UIFocusStatusDebugOverlayEnabled, (uint64_t)CFSTR("UIFocusStatusDebugOverlayEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v7 = _UIInternalPreference_UIFocusStatusDebugOverlayEnabled;
    }
    while (v2 != _UIInternalPreference_UIFocusStatusDebugOverlayEnabled);
  }
  if (byte_1ECD76684)
    v4 = v3;
  else
    v4 = 0;
  _MergedGlobals_1111 = v4 | v1;
  if (v1)
  {
    v5 = qword_1ECD7EB98;
    if (!qword_1ECD7EB98)
    {
      v5 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&qword_1ECD7EB98);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "UIFocusStatusDebugOverlayEnabled";
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Focus debugging overlay enabled via -%s launch argument.", (uint8_t *)&v8, 0xCu);
    }
  }
}

@end

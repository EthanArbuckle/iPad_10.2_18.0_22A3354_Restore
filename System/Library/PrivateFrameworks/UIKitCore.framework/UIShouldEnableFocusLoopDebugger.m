@implementation UIShouldEnableFocusLoopDebugger

void ___UIShouldEnableFocusLoopDebugger_block_invoke()
{
  void *v0;
  int v1;
  unint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("UIFocusLoopDebuggerEnabled"));

  _MergedGlobals_1266 = (byte_1ECD7699C != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIFocusLoopDebuggerEnabled, (uint64_t)CFSTR("UIFocusLoopDebuggerEnabled")) | v1;
  if (v1)
  {
    v2 = qword_1ECD81CC8;
    if (!qword_1ECD81CC8)
    {
      v2 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&qword_1ECD81CC8);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "UIFocusLoopDebuggerEnabled";
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Focus loop debugger enabled via -%s launch argument.", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end

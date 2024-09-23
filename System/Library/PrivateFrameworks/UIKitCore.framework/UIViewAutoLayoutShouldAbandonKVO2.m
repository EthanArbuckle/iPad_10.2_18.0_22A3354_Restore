@implementation UIViewAutoLayoutShouldAbandonKVO2

void ___UIViewAutoLayoutShouldAbandonKVO2_block_invoke()
{
  int v0;
  int v1;
  unint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIViewAutoLayoutAbandonKVO2, (uint64_t)CFSTR("UIViewAutoLayoutAbandonKVO2"));
  if (byte_1ECD769C4)
    v1 = 1;
  else
    v1 = v0;
  _MergedGlobals_64 = v1;
  if (v1 == 1)
    _MergedGlobals_64 = objc_msgSend(MEMORY[0x1E0D156C8], "instancesRespondToSelector:", sel_isObservingChangesForVariable_);
  if (os_variant_has_internal_diagnostics() && !_MergedGlobals_64)
  {
    v2 = qword_1ECD790C8;
    if (!qword_1ECD790C8)
    {
      v2 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&qword_1ECD790C8);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = CFSTR("Auto Layout is using KVO2 to observe variable changes. To allow use of an alternative if available in Foundation, as mobile, \"defaults write com.apple.UIKit UIViewAutoLayoutAbandonKVO2 -BOOL YES\");
      if (v1)
        v4 = CFSTR("Auto Layout is using KVO2 to observe variable changes because the current version of Foundation does not support any other option");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

@end

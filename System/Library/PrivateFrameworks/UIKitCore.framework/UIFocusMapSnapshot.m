@implementation UIFocusMapSnapshot

void __45___UIFocusMapSnapshot_addRegionsInContainer___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category_0;
  if (!_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category_0)
  {
    v2 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category_0);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "%@.\nSuppressing subsequent logging of this error.", (uint8_t *)&v5, 0xCu);
  }
}

@end

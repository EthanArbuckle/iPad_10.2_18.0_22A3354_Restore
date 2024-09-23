@implementation UISystemGestureGateGestureRecognizer

void __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesBegan___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_0;
  if (!_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_0)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke___s_category_0);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 32))
      v4 = "YES";
    else
      v4 = "NO";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Trying to set delaysTouchesBegan to %s on a system gate gesture recognizer - this is unsupported and will have undesired side effects", (uint8_t *)&v5, 0xCu);
  }
}

void __63___UISystemGestureGateGestureRecognizer_setDelaysTouchesEnded___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke_2___s_category;
  if (!_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_AllowCarPlayScenesToCallMakeKeyWindow_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    if (*(_BYTE *)(a1 + 32))
      v4 = "YES";
    else
      v4 = "NO";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Trying to set delaysTouchesEnded to %s on a system gate gesture recognizer - this is unsupported and will have undesired side effects", (uint8_t *)&v5, 0xCu);
  }
}

void __64___UISystemGestureGateGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_timeOut");
    WeakRetained = v2;
  }

}

@end

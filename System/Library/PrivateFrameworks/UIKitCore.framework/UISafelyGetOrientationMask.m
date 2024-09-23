@implementation UISafelyGetOrientationMask

void ___UISafelyGetOrientationMask_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = __LaunchTestName_block_invoke___s_category;
  if (!__LaunchTestName_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("General", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&__LaunchTestName_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: An exception was thrown while evaluating supported interface orientations. UIViewController.supportedInterfaceOrientations should always return a UIInterfaceOrientationMask. Suppressed exception: \"%{public}@\", (uint8_t *)&v7, 0xCu);

  }
}

@end

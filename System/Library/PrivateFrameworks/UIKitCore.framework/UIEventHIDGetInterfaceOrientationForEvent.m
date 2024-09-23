@implementation UIEventHIDGetInterfaceOrientationForEvent

void ___UIEventHIDGetInterfaceOrientationForEvent_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "_orientationDebugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IOHIDEventGetType());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected window orientation: %@, event type: %@", (uint8_t *)&v8, 0x16u);
LABEL_6:

LABEL_7:
    return;
  }
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_11;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_11)
  {
    v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_11);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "_orientationDebugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IOHIDEventGetType());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unexpected window orientation: %@, event type: %@", (uint8_t *)&v8, 0x16u);
    goto LABEL_6;
  }
}

@end

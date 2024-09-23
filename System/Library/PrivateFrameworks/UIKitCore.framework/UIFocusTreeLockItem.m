@implementation UIFocusTreeLockItem

uint64_t __63___UIFocusTreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke(uint64_t a1)
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  CFAbsoluteTime v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  CFAbsoluteTime Current;
  uint64_t v12;
  double v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    return objc_msgSend(*(id *)(a1 + 32), "_cleanup:", 1);
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      Current = CFAbsoluteTimeGetCurrent();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = Current - *(double *)(v12 + 72);
      v14 = 138412802;
      v15 = v10;
      v16 = 2048;
      v17 = v13;
      v18 = 2112;
      v19 = v12;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v14, 0x20u);
    }
    goto LABEL_8;
  }
  v3 = _UIInternalPreference_FocusTreeLockVerboseLogging_block_invoke___s_category;
  if (!_UIInternalPreference_FocusTreeLockVerboseLogging_block_invoke___s_category)
  {
    v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&_UIInternalPreference_FocusTreeLockVerboseLogging_block_invoke___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v6 = v4;
    v7 = CFAbsoluteTimeGetCurrent();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v7 - *(double *)(v8 + 72);
    v14 = 138412802;
    v15 = v5;
    v16 = 2048;
    v17 = v9;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Locked environment %@ was deallocated after being locked for %.2f seconds. This should never happen. Additional info:\n%@", (uint8_t *)&v14, 0x20u);
LABEL_8:

  }
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup:", 1);
}

@end

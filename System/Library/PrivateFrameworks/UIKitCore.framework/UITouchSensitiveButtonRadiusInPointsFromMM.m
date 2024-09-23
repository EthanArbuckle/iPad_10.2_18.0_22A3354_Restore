@implementation UITouchSensitiveButtonRadiusInPointsFromMM

void ___UITouchSensitiveButtonRadiusInPointsFromMM_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "_eventRoutingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected scene and screen receiving dynamic button delivery: %@", (uint8_t *)&v8, 0xCu);
LABEL_6:

LABEL_7:
    return;
  }
  v2 = _UITouchSensitiveButtonPositionHintsString_block_invoke___s_category;
  if (!_UITouchSensitiveButtonPositionHintsString_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UITouchSensitiveButtonPositionHintsString_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "_eventRoutingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unexpected scene and screen receiving dynamic button delivery: %@", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }
}

@end

@implementation UIImageTextAttachment

id __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_colorForFlattening");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = *(void **)(a1 + 40);
      if (v4)
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
      else
        objc_msgSend(*(id *)(a1 + 48), "_deriveAttribute:inStorage:atIndex:", *(_QWORD *)off_1E1678D98, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

id __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textContentManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (os_variant_has_internal_diagnostics())
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = 138412546;
        v11 = 0;
        v12 = 2080;
        v13 = "NSTextContentStorage";
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "%@ is of unexpected class (expected class %s)", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else if (!v5)
  {
    v8 = _block_invoke___s_category_7;
    if (!_block_invoke___s_category_7)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_block_invoke___s_category_7);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = 0;
      v12 = 2080;
      v13 = "NSTextContentStorage";
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@ is of unexpected class (expected class %s)", (uint8_t *)&v10, 0x16u);
    }
  }
  return v5;
}

@end

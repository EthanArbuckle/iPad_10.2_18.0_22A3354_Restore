@implementation UIConfigurationIdentifierForColorTransformer

void ___UIConfigurationIdentifierForColorTransformer_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  void *v3;
  unint64_t v4;
  NSObject *log;
  NSObject *loga;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1036;
  _MergedGlobals_1036 = v0;

  for (i = 2; i != 29; ++i)
  {
    _UIConfigurationColorTransformerForIdentifier(i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v3)
      {
        __UIFaultDebugAssertLog();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v8 = i;
          _os_log_fault_impl(&dword_185066000, log, OS_LOG_TYPE_FAULT, "Missing color transformer for identifier: %ld", buf, 0xCu);
        }

      }
    }
    else if (!v3)
    {
      v4 = qword_1ECD7D9C8;
      if (!qword_1ECD7D9C8)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&qword_1ECD7D9C8);
      }
      loga = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v8 = i;
        _os_log_impl(&dword_185066000, loga, OS_LOG_TYPE_ERROR, "Missing color transformer for identifier: %ld", buf, 0xCu);
      }
    }
    NSMapInsert((NSMapTable *)_MergedGlobals_1036, v3, (const void *)i);

  }
}

@end

@implementation UIFenceTask

void __20___UIFenceTask_init__block_invoke(uint64_t a1, char a2)
{
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0 && os_variant_has_internal_diagnostics())
  {
    v3 = _block_invoke___s_category_13;
    if (!_block_invoke___s_category_13)
    {
      v3 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_block_invoke___s_category_13);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu failed to acquire underlying assertion", (uint8_t *)&v6, 0xCu);
    }
  }
}

@end

@implementation UIColorBreakForOutOfRangeColorComponents

void __UIColorBreakForOutOfRangeColorComponents_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_7;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_7)
  {
    v2 = __UILogCategoryGetNode("Graphics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_7);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "UIColor created with component values far outside the expected range. Set a breakpoint on %s to debug. This message will only be logged once.", (uint8_t *)&v5, 0xCu);
  }
}

@end

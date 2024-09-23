@implementation UIHIDInputEventString

void _UIHIDInputEventString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 != a4)
  {
    v8 = _UIHIDInputEventString_block_invoke_2___s_category;
    if (!_UIHIDInputEventString_block_invoke_2___s_category)
    {
      v8 = __UILogCategoryGetNode("HIDTransformer", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_UIHIDInputEventString_block_invoke_2___s_category);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = _UIStateString[a3];
        v11 = _UIHIDInputEventString[a5];
        v12 = _UIStateString[a4];
        v13 = 138412802;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "State Transition: %@[%@] -> %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

@end

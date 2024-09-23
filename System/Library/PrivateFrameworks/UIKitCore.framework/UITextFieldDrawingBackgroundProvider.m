@implementation UITextFieldDrawingBackgroundProvider

void __54___UITextFieldDrawingBackgroundProvider_drawInBounds___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = _block_invoke___s_category_5;
  if (!_block_invoke___s_category_5)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_block_invoke___s_category_5);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v2 = v1;
    v3 = 138412290;
    v4 = objc_opt_class();
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_ERROR, "%@ does not implement -drawInBounds:, and it should!", (uint8_t *)&v3, 0xCu);

  }
}

@end

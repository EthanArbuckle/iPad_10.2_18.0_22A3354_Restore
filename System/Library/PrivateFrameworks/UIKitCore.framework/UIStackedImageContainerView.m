@implementation UIStackedImageContainerView

void __50___UIStackedImageContainerView_setFocusDirection___block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _block_invoke___s_category_14;
  if (!_block_invoke___s_category_14)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_block_invoke___s_category_14);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Please set installsMotionEffectsWhenFocused to NO before manually setting the focus direction of a _UIStackedImageContainerView", v2, 2u);
  }
}

@end

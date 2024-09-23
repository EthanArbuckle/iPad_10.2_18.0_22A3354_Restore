@implementation UIContentViewEditingController

void __81___UIContentViewEditingController_updateLabelConfiguration_editingConfiguration___block_invoke(uint64_t a1)
{
  unint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "numberOfLines") != 1)
  {
    v1 = _block_invoke___s_category_3;
    if (!_block_invoke___s_category_3)
    {
      v1 = __UILogCategoryGetNode("ContentViewEditingConfiguration", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v1, (unint64_t *)&_block_invoke___s_category_3);
    }
    v2 = *(NSObject **)(v1 + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_ERROR, "Enabling _UIContentViewEditingConfiguration.usesTextInputAsLabel with a corresponding label configuration whose numberOfLines != 1 will result in incorrect positioning of the text input. This message will only be logged once.", v3, 2u);
    }
  }
}

@end

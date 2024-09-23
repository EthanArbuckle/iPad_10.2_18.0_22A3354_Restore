@implementation UIKitPrivateCoreGlyphsManager

void ___UIKitPrivateCoreGlyphsManager_block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category_0;
  if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category_0)
  {
    v0 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category_0);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_ERROR, "Could not initialize the CoreGlyphsPrivate asset bundle. Is it there?", v2, 2u);
  }
}

@end

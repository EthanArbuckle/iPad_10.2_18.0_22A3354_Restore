@implementation UIWindowKeyWindowAPIIsSceneLevel

void ___UIWindowKeyWindowAPIIsSceneLevel_block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_162 = dyld_program_sdk_at_least();
  v0 = qword_1EDDC85A0;
  if (!qword_1EDDC85A0)
  {
    v0 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v0, (unint64_t *)&qword_1EDDC85A0);
  }
  v1 = *(NSObject **)(v0 + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    if (_MergedGlobals_162)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_185066000, v1, OS_LOG_TYPE_DEFAULT, "Key window API is scene-level: %@", (uint8_t *)&v3, 0xCu);
  }
}

@end

@implementation UIConstraintBasedLayoutEngageNonLazily

void ___UIConstraintBasedLayoutEngageNonLazily_block_invoke()
{
  void *v0;
  int v1;
  unint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  byte_1ECD790B2 = 0;
  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("_UIConstraintBasedLayoutEngageNonLazily"));
  if (v0)
  {
    v1 = objc_msgSend(v0, "BOOLValue");
    byte_1ECD790B2 = v1;
    if (!v1)
      return;
  }
  else if (!byte_1ECD790B2)
  {
    return;
  }
  v2 = qword_1ECD790E8;
  if (!qword_1ECD790E8)
  {
    v2 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&qword_1ECD790E8);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = CFSTR("ON");
    if (!byte_1ECD790B2)
      v4 = CFSTR("OFF");
    v5 = 138412546;
    v6 = CFSTR("_UIConstraintBasedLayoutEngageNonLazily");
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "%@ is %@", (uint8_t *)&v5, 0x16u);
  }
}

@end

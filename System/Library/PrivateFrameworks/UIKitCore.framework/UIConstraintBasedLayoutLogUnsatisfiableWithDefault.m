@implementation UIConstraintBasedLayoutLogUnsatisfiableWithDefault

void ___UIConstraintBasedLayoutLogUnsatisfiableWithDefault_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  unint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  byte_1ECD790B5 = *(_BYTE *)(a1 + 32);
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("_UIConstraintBasedLayoutLogUnsatisfiable"));
  if (v2)
  {
    v3 = objc_msgSend(v2, "BOOLValue");
    byte_1ECD790B5 = v3;
  }
  else
  {
    v3 = byte_1ECD790B5;
  }
  if (v3 != *(unsigned __int8 *)(a1 + 32))
  {
    v4 = qword_1ECD79118;
    if (!qword_1ECD79118)
    {
      v4 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD79118);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = CFSTR("ON");
      if (!byte_1ECD790B5)
        v6 = CFSTR("OFF");
      v7 = 138412546;
      v8 = CFSTR("_UIConstraintBasedLayoutLogUnsatisfiable");
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "%@ is %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

@end

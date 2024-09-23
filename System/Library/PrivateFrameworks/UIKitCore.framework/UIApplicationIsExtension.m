@implementation UIApplicationIsExtension

void ___UIApplicationIsExtension_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionInfoForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    byte_1EDDC7FFB = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "infoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("NSExtension"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PlugInKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v3, "objectForKey:", CFSTR("NSExtensionPointIdentifier")),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.accessibility.AccessibilityUIServer")),
            v7,
            (v8 & 1) == 0))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Plist keys indicate the current process is an extension but NSExtensionMain() has not been called. UIKit will treat this process as an extension.", buf, 2u);
          }

        }
        else
        {
          v9 = qword_1EDDC80D8;
          if (!qword_1EDDC80D8)
          {
            v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&qword_1EDDC80D8);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Plist keys indicate the current process is an extension but NSExtensionMain() has not been called. UIKit will treat this process as an extension.", v13, 2u);
          }
        }
      }
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    byte_1EDDC7FFB = v11;

  }
}

@end

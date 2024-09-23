@implementation UIAppSpecificUserInterfaceStyle

void ___UIAppSpecificUserInterfaceStyle_block_invoke()
{
  void *v0;
  __CFString *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("UIUserInterfaceStyle"));
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v2 = dyld_program_sdk_at_least();

      if (v2)
        v1 = CFSTR("Automatic");
      else
        v1 = CFSTR("Light");
    }
    if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("Dark")) & 1) != 0)
    {
      v3 = 2;
    }
    else
    {
      if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("Light")) & 1) == 0)
      {
        v4 = qword_1EDDC83E0;
        if (!qword_1EDDC83E0)
        {
          v4 = __UILogCategoryGetNode("UIInterfaceStyle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&qword_1EDDC83E0);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v6 = 138543874;
          v7 = v1;
          v8 = 2114;
          v9 = CFSTR("UIUserInterfaceStyle");
          v10 = 2114;
          v11 = CFSTR("Light");
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "'%{public}@' is not a recognized value for %{public}@. Defaulting to %{public}@.", (uint8_t *)&v6, 0x20u);
        }
      }
      v3 = 1;
    }
    qword_1EDDC83D0 = v3;

  }
  else
  {
    qword_1EDDC83D0 = 1;
  }
}

@end

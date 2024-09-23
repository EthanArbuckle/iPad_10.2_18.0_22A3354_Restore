@implementation UIBarAppearanceAPIVersion

void ___UIBarAppearanceAPIVersion_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("BarAppearanceVersion"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (v1)
    {
      v10 = v1;
    }
    else
    {
      _UIKitUserDefaults();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("BarAppearanceVersion"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    _UIKitUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("BarAppearanceVersionOverride"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
    }
    else
    {
      v6 = v10;
      if (!v10)
      {
        _UIMainBundleIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(MEMORY[0x1E0C9AA60], "containsObject:", v9) & 1) == 0)
          qword_1ECD7A8A8 = 1;

        v7 = qword_1ECD7A8A8;
        if ((qword_1ECD7A8A8 & 0x8000000000000000) == 0)
          goto LABEL_10;
        goto LABEL_15;
      }
    }
    v7 = objc_msgSend(v6, "integerValue");
    qword_1ECD7A8A8 = v7;
    if ((v7 & 0x8000000000000000) == 0)
    {
LABEL_10:
      if (v7 < 3)
      {
LABEL_17:

        return;
      }
      v8 = 2;
LABEL_16:
      qword_1ECD7A8A8 = v8;
      goto LABEL_17;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
}

@end

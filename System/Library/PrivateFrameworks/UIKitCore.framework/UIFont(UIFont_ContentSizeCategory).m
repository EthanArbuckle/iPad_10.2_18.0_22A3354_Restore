@implementation UIFont(UIFont_ContentSizeCategory)

+ (id)_normalizedContentSizeCategory:()UIFont_ContentSizeCategory default:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isEqualToString:", CFSTR("_UICTContentSizeCategoryUnspecified")))
  {
    if (a4)
    {
      v7 = (void *)objc_opt_class();
    }
    else
    {
      +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      +[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == 3)
        objc_msgSend(v10, "preferredContentSizeCategoryCarPlay");
      else
        objc_msgSend(v10, "preferredContentSizeCategory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("_UICTContentSizeCategoryUnspecified")))
        goto LABEL_11;
      v7 = (void *)objc_opt_class();
      v6 = v12;
    }
    objc_msgSend(v7, "_defaultContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v6 = v12;
  }
  return v6;
}

+ (uint64_t)_preferredContentSizeCategory:()UIFont_ContentSizeCategory
{
  return objc_msgSend((id)UIApp, "_preferredContentSizeCategory:");
}

+ (id)preferredContentSizeCategory
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  +[UIContentSizeCategoryPreference system](UIContentSizeCategoryPreference, "system");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 == 3)
    objc_msgSend(v2, "preferredContentSizeCategoryCarPlay");
  else
    objc_msgSend(v2, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

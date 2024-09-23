@implementation _NSLocalizedStringResource(SHSNavigationComponents)

+ (id)shs_localizedPathComponentForTonePickerSpecifier:()SHSNavigationComponents
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  NSStringFromClass((Class)objc_msgSend(v3, "detailControllerClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v6))
  {
    NSStringFromClass((Class)objc_msgSend(v3, "detailControllerClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (!v10)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v11 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SHS_BundleForSoundsAndHapticsSettingsFramework();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", v4, CFSTR("Sounds"), v6, v13);

  }
  else
  {
    v14 = 0;
  }

LABEL_7:
  return v14;
}

@end

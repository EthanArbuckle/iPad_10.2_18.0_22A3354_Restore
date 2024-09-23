@implementation UIImage(PSIconImageCacheDeprecationCompatibility)

+ (id)ps_settingsIconImageDescriptor
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDrawBorder:", 1);
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAppearance:", objc_msgSend(v1, "userInterfaceStyle") != 1);

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "layoutDirection"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v0, "setLanguageDirection:", v3);

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setContrast:", objc_msgSend(v4, "accessibilityContrast") == 1);

  return v0;
}

+ (id)ps_synchronousIconWithApplicationBundleIdentifier:()PSIconImageCacheDeprecationCompatibility
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D3A820];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:", v5);

  objc_msgSend(a1, "ps_settingsIconImageDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA638];
  v10 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ps_synchronousIconWithTypeIdentifier:()PSIconImageCacheDeprecationCompatibility
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D3A820];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithType:", v5);

  objc_msgSend(a1, "ps_settingsIconImageDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareImageForDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA638];
  v10 = objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "scale");
  objc_msgSend(v9, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

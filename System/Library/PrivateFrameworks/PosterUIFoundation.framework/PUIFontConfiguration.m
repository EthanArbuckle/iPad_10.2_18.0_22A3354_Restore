@implementation PUIFontConfiguration

+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  double v10;
  PUISystemFontConfiguration *v11;
  void *v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "fontIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "weight");
  if (v9)
  {
    v11 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:]([PUISystemFontConfiguration alloc], "initWithFontIdentifier:weight:systemItem:", v9, v5, v10);
  }
  else
  {
    objc_msgSend(v7, "customFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v11 = -[PUICustomFontConfiguration initWithFont:extensionBundleURL:]([PUICustomFontConfiguration alloc], "initWithFont:extensionBundleURL:", v12, v8);
    else
      v11 = 0;

  }
  return (PUIFontConfiguration *)v11;
}

+ (PUIFontConfiguration)fontConfigurationWithPUIFont:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = (objc_class *)MEMORY[0x24BDC1528];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithBundleIdentifier:error:", v10, 0);

  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1, "fontConfigurationWithPUIFont:extensionBundleURL:systemItem:", v8, v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return (PUIFontConfiguration *)v13;
}

+ (PUIFontConfiguration)defaultFontConfiguration
{
  return (PUIFontConfiguration *)objc_alloc_init(PUISystemFontConfiguration);
}

- (id)PUIFontWithExtensionBundle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIFontConfiguration PUIFontWithExtensionBundleURL:](self, "PUIFontWithExtensionBundleURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)PUIFontWithExtensionBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDC1528];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:error:", v5, 0);

  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUIFontConfiguration PUIFontWithExtensionBundleURL:](self, "PUIFontWithExtensionBundleURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)PUIFontWithExtensionBundleURL:(id)a3
{
  return 0;
}

- (PUIFontConfiguration)init
{
  void *v3;
  int v4;
  PUISystemFontConfiguration *v5;
  PUIFontConfiguration *p_super;
  objc_super v8;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIFontConfiguration isMemberOfClass:](self, "isMemberOfClass:", v3);

  if (v4)
  {
    v5 = objc_alloc_init(PUISystemFontConfiguration);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUIFontConfiguration;
    v5 = -[PUIFontConfiguration init](&v8, sel_init);
    self = &v5->super;
  }
  p_super = &v5->super;

  return p_super;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&stru_25154D128;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PUIFontConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __35__PUIFontConfiguration_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __35__PUIFontConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIFontConfiguration)initWithCoder:(id)a3
{

  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PUIFontConfiguration)initWithBSXPCCoder:(id)a3
{

  return 0;
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

@end

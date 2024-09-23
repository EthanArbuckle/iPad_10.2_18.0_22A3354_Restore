@implementation PRPosterTimeFontConfiguration

+ (PRPosterTimeFontConfiguration)configurationWithTimeFontConfiguration:(id)a3 extensionBundleURL:(id)a4 systemItem:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  PRPosterSystemTimeFontConfiguration *v14;
  void *v15;
  void *v17;
  void *v18;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRPosterTimeFontConfiguration.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeFontConfiguration != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRPosterTimeFontConfiguration.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleURL != nil"));

LABEL_3:
  objc_msgSend(v9, "timeFontIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "weight");
  if (v12)
  {
    v14 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:]([PRPosterSystemTimeFontConfiguration alloc], "initWithTimeFontIdentifier:weight:systemItem:", v12, v5, v13);
  }
  else
  {
    objc_msgSend(v9, "customFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v14 = -[PRPosterCustomTimeFontConfiguration initWithFont:extensionBundleURL:]([PRPosterCustomTimeFontConfiguration alloc], "initWithFont:extensionBundleURL:", v15, v11);
    else
      v14 = 0;

  }
  return (PRPosterTimeFontConfiguration *)v14;
}

+ (PRPosterTimeFontConfiguration)configurationWithTimeFontConfiguration:(id)a3 extensionBundleIdentifier:(id)a4 systemItem:(BOOL)a5
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
  v9 = (objc_class *)MEMORY[0x1E0CA5848];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithBundleIdentifier:error:", v10, 0);

  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1, "configurationWithTimeFontConfiguration:extensionBundleURL:systemItem:", v8, v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return (PRPosterTimeFontConfiguration *)v13;
}

+ (PRPosterTimeFontConfiguration)defaultConfiguration
{
  return (PRPosterTimeFontConfiguration *)objc_alloc_init(PRPosterSystemTimeFontConfiguration);
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundle != nil"));

  }
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTimeFontConfiguration timeFontConfigurationWithExtensionBundleURL:](self, "timeFontConfigurationWithExtensionBundleURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterTimeFontConfiguration *)v7;
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleIdentifier != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v5, 0);
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PRPosterTimeFontConfiguration timeFontConfigurationWithExtensionBundleURL:](self, "timeFontConfigurationWithExtensionBundleURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return (PRPosterTimeFontConfiguration *)v8;
}

- (PRPosterTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  return 0;
}

- (PRPosterTimeFontConfiguration)init
{
  void *v3;
  int v4;
  PRPosterSystemTimeFontConfiguration *v5;
  PRPosterTimeFontConfiguration *p_super;
  objc_super v8;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRPosterTimeFontConfiguration isMemberOfClass:](self, "isMemberOfClass:", v3);

  if (v4)
  {
    v5 = objc_alloc_init(PRPosterSystemTimeFontConfiguration);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRPosterTimeFontConfiguration;
    v5 = -[PRPosterTimeFontConfiguration init](&v8, sel_init);
    self = &v5->super;
  }
  p_super = &v5->super;

  return p_super;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&stru_1E2186E08;
}

- (id)timeFontIdentifier
{
  return 0;
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
  PRPosterTimeFontConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __44__PRPosterTimeFontConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __44__PRPosterTimeFontConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterTimeFontConfiguration)initWithCoder:(id)a3
{

  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{

  return 0;
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

@end

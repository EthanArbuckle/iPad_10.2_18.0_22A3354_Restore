@implementation WFActionSessionKitSessionConfiguration

- (WFActionSessionKitSessionConfiguration)initWithBundleIdentifier:(id)a3 toastDurationPerRunSource:(id)a4
{
  id v7;
  id v8;
  WFActionSessionKitSessionConfiguration *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  uint64_t v12;
  NSDictionary *toastDurationPerRunSource;
  WFActionSessionKitSessionConfiguration *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionSessionKitSessionConfiguration.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFActionSessionKitSessionConfiguration;
  v9 = -[WFActionSessionKitSessionConfiguration init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    toastDurationPerRunSource = v9->_toastDurationPerRunSource;
    v9->_toastDurationPerRunSource = (NSDictionary *)v12;

    v14 = v9;
  }

  return v9;
}

- (double)toastDurationForRunSource:(id)a3
{
  id v5;
  NSDictionary *toastDurationPerRunSource;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v18;

  v5 = a3;
  if (v5)
  {
    if (self)
    {
LABEL_3:
      toastDurationPerRunSource = self->_toastDurationPerRunSource;
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionSessionKitSessionConfiguration.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runSource"));

    if (self)
      goto LABEL_3;
  }
  toastDurationPerRunSource = 0;
LABEL_4:
  -[NSDictionary objectForKeyedSubscript:](toastDurationPerRunSource, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", CFSTR("WFShortcutsToastedBannerAutoCollapseDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "doubleValue");
    v11 = v16;

  }
  return v11;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastDurationPerRunSource, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end

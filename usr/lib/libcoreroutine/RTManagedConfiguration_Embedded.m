@implementation RTManagedConfiguration_Embedded

- (BOOL)effectiveBoolValueForSetting:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTManagedConfiguration_Embedded stringToManagedConfigurationKey:](self, "stringToManagedConfigurationKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "effectiveBoolValueForSetting:", v7) == 1;
  return (char)v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[RTManagedConfiguration delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)RTManagedConfiguration_Embedded;
    -[RTManagedConfiguration setDelegate:](&v8, sel_setDelegate_, v4);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "registerObserver:", self);
    else
      objc_msgSend(v6, "unregisterObserver:", self);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTManagedConfiguration_Embedded;
  -[RTManagedConfiguration_Embedded dealloc](&v4, sel_dealloc);
}

- (id)stringToManagedConfigurationKey:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(CFSTR("RTFeatureDiagnosticsSubmissionAllowed"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D46FC0];
  }
  else
  {
    if (!objc_msgSend(CFSTR("RTFeatureFindMyCarAllowed"), "isEqualToString:", v3))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0D47000];
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4;

  -[RTManagedConfiguration delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didReceiveEffectiveSettingsChangedNotification");

}

- (BOOL)isDiagnosticsAndUsageAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed");

  return v3;
}

- (BOOL)isFindMyCarAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFindMyCarAllowed");

  return v3;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHealthDataSubmissionAllowed");

  return v3;
}

@end

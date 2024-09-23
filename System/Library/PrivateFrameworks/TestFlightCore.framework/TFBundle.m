@implementation TFBundle

+ (id)frameworkBundle
{
  if (frameworkBundle_onceToken != -1)
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_3);
  return (id)frameworkBundle_frameworkBundle;
}

void __27__TFBundle_frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)frameworkBundle_frameworkBundle;
  frameworkBundle_frameworkBundle = v0;

}

+ (id)pathForResource:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "frameworkBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)bundleIdentifierForBundleURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithURL:allowPlaceholder:error:", v3, 1, &v12);
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generatedLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v3;
      v17 = 2114;
      v18 = v5;
      v10 = v9;
      _os_log_impl(&dword_2174E1000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Cannot load application record for %{public}@: %{public}@", buf, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

@end

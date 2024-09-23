@implementation NSExtension(_QLUtilities)

- (uint64_t)QL_isAppleExtension
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple."));

  return v2;
}

- (id)QL_parentBundleID
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;

  objc_msgSend(a1, "_extensionBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v2, &v10);
  v4 = v10;
  if (!v3)
  {
    v5 = MEMORY[0x24BDE5F50];
    v6 = *(NSObject **)(MEMORY[0x24BDE5F50] + 128);
    if (!v6)
    {
      QLTInitLogging();
      v6 = *(NSObject **)(v5 + 128);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSExtension(_QLUtilities) QL_parentBundleID].cold.1((uint64_t)v2, (uint64_t)v4, v6);
  }
  objc_msgSend(v3, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)isGenerationPreview
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("QLIsDataBasedPreview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)QL_parentBundleID
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20D4C7000, log, OS_LOG_TYPE_ERROR, "Could not find application extension record %@: %@", (uint8_t *)&v3, 0x16u);
}

@end

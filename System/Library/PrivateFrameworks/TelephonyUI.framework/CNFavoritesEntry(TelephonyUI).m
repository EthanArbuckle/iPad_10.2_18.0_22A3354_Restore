@implementation CNFavoritesEntry(TelephonyUI)

- (id)localizedContactPropertyLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "contactProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(a1, "contactProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayStringForLabel:propertyName:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)localizedBundleName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C965E8]))
  {
    objc_msgSend(a1, "localizedContactPropertyLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v10);
    v5 = v10;
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v4, "localizedName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
        TPDefaultLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CNFavoritesEntry(TelephonyUI) localizedBundleName].cold.1((uint64_t)v2, (uint64_t)v6, v7);

      }
      v3 = 0;
    }

  }
  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "localizedContactPropertyLabel");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return v3;
}

- (void)localizedBundleName
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCFA3000, log, OS_LOG_TYPE_ERROR, "Attempt to obtain application record for bundle identifier %@ failed with error %@", (uint8_t *)&v3, 0x16u);
}

@end

@implementation STAskForTimeApplicationResource

- (STAskForTimeApplicationResource)initWithBundleIdentifier:(id)a3 changeHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  STAskForTimeApplicationResource *v15;
  objc_super v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CA5870];
  v8 = a4;
  v18 = 0;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v18);
  v10 = v18;
  if (v9)
  {
    objc_msgSend(v9, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog ask](STLog, "ask");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_INFO, "Failed to get application record for %{public}@ %{public}@", buf, 0x16u);
    }

    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[STAskForTimeApplicationResource _fetchParentBundleIdentifierForBundleIdentifier:](self, "_fetchParentBundleIdentifierForBundleIdentifier:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)STAskForTimeApplicationResource;
  v15 = -[STAskForTimeResource initWithResourceIdentifier:resourceDisplayName:usageType:changeHandler:](&v17, sel_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler_, v14, v11, 0, v8);

  return v15;
}

- (id)_fetchParentBundleIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[STAskForTimeApplicationResource _fetchParentBundleIdentifiersForBundleIdentifier:](self, "_fetchParentBundleIdentifiersForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  v16 = v7;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v7 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v12);

        if (v6 >= 2)
        {
          +[STLog ask](STLog, "ask");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v22 = v7;
            _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_DEFAULT, "Multiple Bundle Identifiers Found: %{public}@", buf, 0xCu);
          }

        }
        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_fetchParentBundleIdentifiersForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v24);
  v6 = v24;
  v7 = v6;
  if (v5)
  {
    v19 = v6;
    objc_msgSend(v5, "appClipMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentApplicationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
          {
            +[STLog ask](STLog, "ask");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v26 = v3;
              v27 = 2114;
              v28 = v15;
              _os_log_error_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_ERROR, "Failed looking up parent bundle identifier for app: %{public}@ with parent application identifier %{public}@", buf, 0x16u);
            }

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v12);
    }

    v7 = v19;
  }
  else
  {
    +[STLog ask](STLog, "ask");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v3;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_DEFAULT, "No application record for bundle identifier: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

@end

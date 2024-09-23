@implementation TRIUserCovariates

- (TRIUserCovariates)initWithContext:(id)a3
{
  id v5;
  TRIUserCovariates *v6;
  TRIUserCovariates *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIUserCovariates;
  v6 = -[TRIUserCovariates init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)_applicationRecordForBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v8);
  v5 = v8;
  if (!v4)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      v11 = 2114;
      v12 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "application not found for bundle id {public}%@ -- %{public}@", buf, 0x16u);
    }

  }
  return v4;
}

- (id)tri_hasApplicationWithBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[TRIUserCovariates _applicationRecordForBundleId:](self, "_applicationRecordForBundleId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", v7 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)tri_shortVersionStringForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIUserCovariates _applicationRecordForBundleId:](self, "_applicationRecordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortVersionString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E9336E60;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)tri_versionStringForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIUserCovariates _applicationRecordForBundleId:](self, "_applicationRecordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exactBundleVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E9336E60;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)tri_versionForBundleId:(id)a3
{
  void *v3;
  void *v4;

  -[TRIUserCovariates tri_shortVersionStringForBundleId:](self, "tri_shortVersionStringForBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0BA8], "parseVersionFromString:withPrefix:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tri_majorVersionForBundleId:(id)a3
{
  void *v3;
  void *v4;

  -[TRIUserCovariates tri_versionForBundleId:](self, "tri_versionForBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "majorVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tri_minorVersionForBundleId:(id)a3
{
  void *v3;
  void *v4;

  -[TRIUserCovariates tri_versionForBundleId:](self, "tri_versionForBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minorVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tri_patchVersionForBundleId:(id)a3
{
  void *v3;
  void *v4;

  -[TRIUserCovariates tri_versionForBundleId:](self, "tri_versionForBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "patchVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tri_versionForBundleId:(id)a3 compareToString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[TRIUserCovariates tri_versionForBundleId:](self, "tri_versionForBundleId:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0BA8], "parseVersionFromString:withPrefix:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "compare:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end

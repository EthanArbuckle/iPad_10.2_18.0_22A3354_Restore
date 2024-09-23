@implementation OBPrivacyBundleProvider

- (OBPrivacyBundleProvider)initWithEnclosingBundleIdentifier:(id)a3 privacyBundleName:(id)a4
{
  id v7;
  id v8;
  OBPrivacyBundleProvider *v9;
  OBPrivacyBundleProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OBPrivacyBundleProvider;
  v9 = -[OBPrivacyBundleProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enclosingBundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_privacyBundleName, a4);
  }

  return v10;
}

- (NSString)path
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v15 = 0;
  -[OBPrivacyBundleProvider _bundleRecordWithError:](self, "_bundleRecordWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (!v3 || v4)
  {
    _OBLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[OBPrivacyBundleProvider path].cold.1(self, v5, v8);
    v13 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleWithURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[OBPrivacyBundleProvider privacyBundleName](self, "privacyBundleName");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringByDeletingPathExtension](v9, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyBundleProvider privacyBundleName](self, "privacyBundleName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject pathForResource:ofType:inDirectory:forLocalization:](v8, "pathForResource:ofType:inDirectory:forLocalization:", v10, v12, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _OBLoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[OBPrivacyBundleProvider path].cold.2(self, v9);
      v13 = 0;
    }

  }
  return (NSString *)v13;
}

- (id)_bundleRecordWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CA5898];
  -[OBPrivacyBundleProvider enclosingBundleIdentifier](self, "enclosingBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)enclosingBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEnclosingBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)privacyBundleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrivacyBundleName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyBundleName, 0);
  objc_storeStrong((id *)&self->_enclosingBundleIdentifier, 0);
}

- (void)path
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enclosingBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_199FE5000, a2, OS_LOG_TYPE_ERROR, "Failed to create bundle for %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

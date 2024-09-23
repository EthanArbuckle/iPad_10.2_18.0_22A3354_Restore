@implementation STBundleRecord_Base

+ (id)bundleRecordForBundleAtURL:(id)a3
{
  const __CFURL *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  const __CFURL *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFURL *)a3;
  v5 = CFBundleCopyInfoDictionaryInDirectory(v4);
  v6 = v5;
  if (!v5
    || (-[__CFDictionary allKeys](v5, "allKeys"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    STSystemStatusLogBundleLoading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v4;
      _os_log_error_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_ERROR, "Error loading data for bundle at %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  -[__CFDictionary bs_safeObjectForKey:ofType:](v6, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0C9AE78], objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary bs_safeObjectForKey:ofType:](v6, "bs_safeObjectForKey:ofType:", CFSTR("STBundleRecordType"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleInfoDictionary:bundleRecordIdentifier:bundleURL:", v6, v10, v4);
  else
    v12 = 0;

  return v12;
}

- (STBundleRecord_Base)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5
{
  id v7;
  id v8;
  STBundleRecord_Base *v9;
  uint64_t v10;
  NSString *recordIdentifier;
  uint64_t v12;
  NSURL *recordBundleURL;
  objc_super v15;

  v7 = a4;
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STBundleRecord_Base;
  v9 = -[STBundleRecord_Base init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    recordIdentifier = v9->_recordIdentifier;
    v9->_recordIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    recordBundleURL = v9->_recordBundleURL;
    v9->_recordBundleURL = (NSURL *)v12;

  }
  return v9;
}

+ (NSString)recordType
{
  return 0;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (NSURL)recordBundleURL
{
  return self->_recordBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBundleURL, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end

@implementation VUIPersistentContainer

+ (id)defaultDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!sDeleteAllEntriesOnInitialization)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.tv"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataContainerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Application Support"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = sLogObject_2;
  if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Using overridden defaultDirectoryURL for download database: %@", buf, 0xCu);
  }
  if (!v5)
  {
LABEL_5:
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___VUIPersistentContainer;
    objc_msgSendSuper2(&v9, sel_defaultDirectoryURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sLogObject_2;
    if (os_log_type_enabled((os_log_t)sLogObject_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Using default implementation of defaultDirectoryURL for download database: %@", buf, 0xCu);
    }
  }
  return v5;
}

@end

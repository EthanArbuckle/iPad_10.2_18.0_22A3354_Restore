@implementation NSURL(WFFileProviderOperations)

- (id)wf_fileProviderItem
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "itemForURL:error:", a1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (v3 && (objc_msgSend(v3, "fileURL"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = v3;
  }
  else
  {
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[NSURL(WFFileProviderOperations) wf_fileProviderItem]";
      v12 = 2112;
      v13 = a1;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s URL: %@ does not require file provider options due no item", buf, 0x16u);
    }

    v6 = 0;
  }

  return v6;
}

@end

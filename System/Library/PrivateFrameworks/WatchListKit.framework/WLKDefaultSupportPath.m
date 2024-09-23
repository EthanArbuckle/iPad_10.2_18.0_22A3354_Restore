@implementation WLKDefaultSupportPath

void __WLKDefaultSupportPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  CPSharedResourcesDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v15[0] = v0;
    v15[1] = CFSTR("Library");
    v15[2] = CFSTR("com.apple.WatchListKit");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WLKDefaultSupportPath__path;
    WLKDefaultSupportPath__path = v3;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "fileExistsAtPath:", WLKDefaultSupportPath__path))
    {
      v14 = 0;
      v6 = objc_msgSend(v5, "removeItemAtPath:error:", WLKDefaultSupportPath__path, &v14);
      v7 = v14;
      v8 = v7;
      if ((v6 & 1) == 0 && v7)
      {
        WLKSystemLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __WLKDefaultSupportPath_block_invoke_cold_1(v8, v9);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.tv.sharedcontainer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)WLKDefaultSupportPath__path;
  WLKDefaultSupportPath__path = v12;

}

void __WLKDefaultSupportPath_block_invoke_cold_1(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = 136315138;
  v5 = objc_msgSend(v3, "UTF8String");
  _os_log_error_impl(&dword_1B515A000, a2, OS_LOG_TYPE_ERROR, "WLKPathUtilities - Failed to remove previous DefaultSupportPath location file with error: %s", (uint8_t *)&v4, 0xCu);

}

@end

@implementation BYWarranty

+ (BOOL)shouldDisplay
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"));

  return v3;
}

+ (void)acknowledge
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"), &v9);
  v4 = v9;

  if ((v3 & 1) == 0)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v6 = 0;
        v7 = v4;
      }
      else if (v4)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "domain");
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v4, "code"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 1;
      }
      else
      {
        v6 = 0;
        v7 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_error_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_ERROR, "Failed to remove warranty sentinel: %{public}@", buf, 0xCu);
      if (v6)
      {

      }
    }

  }
}

@end

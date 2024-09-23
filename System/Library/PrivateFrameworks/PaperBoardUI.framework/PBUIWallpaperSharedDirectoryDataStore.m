@implementation PBUIWallpaperSharedDirectoryDataStore

- (PBUIWallpaperSharedDirectoryDataStore)initWithDirectoryURL:(id)a3
{
  PBUIWallpaperSharedDirectoryDataStore *v3;
  PBUIWallpaperSharedDirectoryDataStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperSharedDirectoryDataStore;
  v3 = -[PBUIWallpaperDirectoryDataStore initWithDirectoryURL:](&v6, sel_initWithDirectoryURL_, a3);
  v4 = v3;
  if (v3)
    -[PBUIWallpaperDirectoryDataStore setSupportsWallpaperOptions:](v3, "setSupportsWallpaperOptions:", 1);
  return v4;
}

- (id)directoryCreationAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 511);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didWriteFileToURL:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  __CFFileSecurity *v7;
  __CFFileSecurity *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PBUIWallpaperSharedDirectoryDataStore;
  -[PBUIWallpaperDirectoryDataStore didWriteFileToURL:](&v14, sel_didWriteFileToURL_, v4);
  v13 = 0;
  v5 = *MEMORY[0x1E0C99990];
  v6 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v13, *MEMORY[0x1E0C99990], 0);
  v7 = (__CFFileSecurity *)v13;
  v8 = v7;
  if (v6)
  {
    CFFileSecuritySetMode(v7, 0x1B6u);
    v12 = 0;
    v9 = objc_msgSend(v4, "setResourceValue:forKey:error:", v8, v5, &v12);
    v10 = v12;
    if ((v9 & 1) == 0)
    {
      PBUILogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PBUIWallpaperSharedDirectoryDataStore didWriteFileToURL:].cold.1();

    }
  }

}

- (void)didWriteFileToURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B71C0000, v0, v1, "Error setting permissions on wallpaper file '%{public}@': %{public}@");
  OUTLINED_FUNCTION_9();
}

@end

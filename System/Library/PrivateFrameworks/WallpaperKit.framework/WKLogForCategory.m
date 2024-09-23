@implementation WKLogForCategory

void __WKLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;

  v0 = os_log_create("com.apple.WallpaperKit", "Base");
  v1 = (void *)WKLogForCategory_logObjects[0];
  WKLogForCategory_logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.WallpaperKit", "Import");
  v3 = (void *)qword_1ED56B810;
  qword_1ED56B810 = (uint64_t)v2;

  v4 = os_log_create("com.apple.WallpaperKit", "DefaultWallpaper");
  v5 = (void *)qword_1ED56B818;
  qword_1ED56B818 = (uint64_t)v4;

  v6 = os_log_create("com.apple.WallpaperKit", "Processing");
  v7 = (void *)qword_1ED56B820;
  qword_1ED56B820 = (uint64_t)v6;

  v8 = os_log_create("com.apple.WallpaperKit", "Collections");
  v9 = (void *)qword_1ED56B828;
  qword_1ED56B828 = (uint64_t)v8;

  v10 = os_log_create("com.apple.WallpaperKit", "PerformanceSignposts");
  v11 = (void *)qword_1ED56B830;
  qword_1ED56B830 = (uint64_t)v10;

  v12 = os_log_create("com.apple.WallpaperKit", "Migration");
  v13 = (void *)qword_1ED56B838;
  qword_1ED56B838 = (uint64_t)v12;

  v14 = os_log_create("com.apple.WallpaperKit", "SystemShellWallpaperManager");
  v15 = (void *)qword_1ED56B840;
  qword_1ED56B840 = (uint64_t)v14;

  v16 = os_log_create("com.apple.WallpaperKit", "WallpaperManager");
  v17 = (void *)qword_1ED56B848;
  qword_1ED56B848 = (uint64_t)v16;

  v18 = os_log_create("com.apple.WallpaperKit", "PhotoLibraryManager");
  v19 = (void *)qword_1ED56B850;
  qword_1ED56B850 = (uint64_t)v18;

}

@end

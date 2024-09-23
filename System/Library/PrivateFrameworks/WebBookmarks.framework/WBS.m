@implementation WBS

void __WBS_LOG_CHANNEL_PREFIXTabGroup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "TabGroup");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXTabGroup_log;
  WBS_LOG_CHANNEL_PREFIXTabGroup_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXBookmarks_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "Bookmarks");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXBookmarks_log;
  WBS_LOG_CHANNEL_PREFIXBookmarks_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXBookmarkSync_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "BookmarkSync");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
  WBS_LOG_CHANNEL_PREFIXBookmarkSync_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXCloudBookmarks_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "CloudBookmarks");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log;
  WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXCycler_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "Cycler");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXCycler_log;
  WBS_LOG_CHANNEL_PREFIXCycler_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXDataMigration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "DataMigration");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXDataMigration_log;
  WBS_LOG_CHANNEL_PREFIXDataMigration_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXReadingList_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "ReadingList");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXReadingList_log;
  WBS_LOG_CHANNEL_PREFIXReadingList_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXReadingListIcons_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "ReadingListIcons");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXReadingListIcons_log;
  WBS_LOG_CHANNEL_PREFIXReadingListIcons_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXTabs_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "Tabs");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXTabs_log;
  WBS_LOG_CHANNEL_PREFIXTabs_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXWebsiteData_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "WebsiteData");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXWebsiteData_log;
  WBS_LOG_CHANNEL_PREFIXWebsiteData_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "WebBookmarkServer");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log;
  WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXCloudSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "CloudSettings");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXCloudSettings_log;
  WBS_LOG_CHANNEL_PREFIXCloudSettings_log = (uint64_t)v0;

}

void __WBS_LOG_CHANNEL_PREFIXProfiles_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebBookmarks", "Profiles");
  v1 = (void *)WBS_LOG_CHANNEL_PREFIXProfiles_log;
  WBS_LOG_CHANNEL_PREFIXProfiles_log = (uint64_t)v0;

}

@end

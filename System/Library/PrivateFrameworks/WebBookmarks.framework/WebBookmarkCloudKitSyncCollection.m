@implementation WebBookmarkCloudKitSyncCollection

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  WebBookmarkCloudKitSyncCollection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_INFO, "-> %s(database: %{public}@)", buf, 0x16u);
  }
  v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "@@ %s: Unlocking bookmark database", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "unlockSyncAsynchronously");
  v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WebBookmarkCloudKitSyncCollection dealloc]";
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)WebBookmarkCloudKitSyncCollection;
  -[WebBookmarkCollection dealloc](&v6, sel_dealloc);
}

@end

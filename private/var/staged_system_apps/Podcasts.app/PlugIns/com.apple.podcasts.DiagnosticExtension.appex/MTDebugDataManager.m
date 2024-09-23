@implementation MTDebugDataManager

+ (void)setup
{
  MTPodcastDatabaseDebugProvider *v2;
  MTMediaLibraryDebugProvider *v3;
  MTPodcastDatabaseWalDebugProvider *v4;
  MTPodcastDatabaseShmDebugProvider *v5;
  MTDebugSharedUserDefaultsDataProvider *v6;

  v2 = objc_alloc_init(MTPodcastDatabaseDebugProvider);
  +[IMDebugDataManager registerDataProvider:](IMDebugDataManager, "registerDataProvider:", v2);

  v3 = objc_alloc_init(MTMediaLibraryDebugProvider);
  +[IMDebugDataManager registerDataProvider:](IMDebugDataManager, "registerDataProvider:", v3);

  v4 = objc_alloc_init(MTPodcastDatabaseWalDebugProvider);
  +[IMDebugDataManager registerDataProvider:](IMDebugDataManager, "registerDataProvider:", v4);

  v5 = objc_alloc_init(MTPodcastDatabaseShmDebugProvider);
  +[IMDebugDataManager registerDataProvider:](IMDebugDataManager, "registerDataProvider:", v5);

  v6 = objc_alloc_init(MTDebugSharedUserDefaultsDataProvider);
  +[IMDebugDataManager registerDataProvider:](IMDebugDataManager, "registerDataProvider:", v6);

}

@end

@implementation PGMusicCatalogMonitor

+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  +[PGWrapperMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:completionHandler:](PGWrapperMusicCatalogMonitor, "checkMusicCatalogEligibilityWithProgressReporter:completionHandler:", a3, a4);
}

+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3
{
  return +[PGWrapperMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:](PGWrapperMusicCatalogMonitor, "checkMusicCatalogEligibilityWithProgressReporter:", a3);
}

+ (void)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _BOOL8, id);
  _BOOL8 v8;
  id v9;
  id v10;

  v10 = 0;
  v7 = (void (**)(id, _BOOL8, id))a5;
  v8 = +[PGWrapperMusicCatalogMonitor clearCatalogMusicFromCacheWithPhotoLibrary:progressReporter:error:](PGWrapperMusicCatalogMonitor, "clearCatalogMusicFromCacheWithPhotoLibrary:progressReporter:error:", a3, a4, &v10);
  v9 = v10;
  v7[2](v7, v8, v9);

}

+ (BOOL)canAccessMediaLibrary
{
  return +[PGWrapperMusicCatalogMonitor canAccessMediaLibrary](PGWrapperMusicCatalogMonitor, "canAccessMediaLibrary");
}

@end

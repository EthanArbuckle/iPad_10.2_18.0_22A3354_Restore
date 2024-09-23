@implementation PGWrapperMusicCatalogMonitor

+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  sub_1CA4CB25C((uint64_t)sub_1CA4CB5F4, v6);

  swift_release();
}

+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3
{
  return _s11PhotosGraph19MusicCatalogMonitorC05checkcD11Eligibility16progressReporterSbSo010MAProgressI0C_tFZ_0() & 1;
}

+ (BOOL)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_1CA4CB348(v6);

  return 1;
}

+ (BOOL)canAccessMediaLibrary
{
  char v2;

  _s11PhotosGraph19MusicCatalogMonitorC21canAccessMediaLibrarySbyFZ_0();
  return v2 & 1;
}

- (PGWrapperMusicCatalogMonitor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicCatalogMonitor init](&v3, sel_init);
}

@end

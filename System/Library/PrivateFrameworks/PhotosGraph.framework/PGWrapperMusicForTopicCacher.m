@implementation PGWrapperMusicForTopicCacher

+ (void)prefetchCuratedSongLibraryAssetsWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = a3;
  sub_1CA3D1BB8((uint64_t)v6, (void (**)(const void *, _QWORD, void *))v5);
  _Block_release(v5);
  _Block_release(v5);

}

+ (BOOL)cacheMusicWithCache:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_1CA3D1208((uint64_t)v6, (uint64_t)v7);

  return 1;
}

- (PGWrapperMusicForTopicCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForTopicCacher init](&v3, sel_init);
}

@end

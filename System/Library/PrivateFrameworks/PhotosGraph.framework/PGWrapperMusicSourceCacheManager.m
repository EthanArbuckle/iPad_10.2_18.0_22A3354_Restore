@implementation PGWrapperMusicSourceCacheManager

+ (void)pruneUnusedSourcesWithPhotoLibrary:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  void (**v9)(void *, uint64_t, _QWORD);
  id v10;
  id v11;
  id v12;

  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(a6);
  v10 = a3;
  v12 = a4;
  v11 = a5;
  sub_1CA396A14(v10, v12);
  v9[2](v9, 1, 0);
  _Block_release(v9);

}

- (PGWrapperMusicSourceCacheManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicSourceCacheManager init](&v3, sel_init);
}

@end

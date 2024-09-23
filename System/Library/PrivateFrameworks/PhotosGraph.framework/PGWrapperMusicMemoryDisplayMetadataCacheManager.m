@implementation PGWrapperMusicMemoryDisplayMetadataCacheManager

+ (void)evictExpiredSongsWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  char *v9;
  id v10;

  v7 = _Block_copy(a5);
  _Block_copy(v7);
  _Block_copy(v7);
  v8 = a3;
  v10 = a4;
  v9 = sub_1CA2CEAA8(v8);
  _Block_copy(v7);
  sub_1CA300BF4(v9, (uint64_t)v10, v7);
  _Block_release(v7);

  _Block_release(v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (PGWrapperMusicMemoryDisplayMetadataCacheManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicMemoryDisplayMetadataCacheManager init](&v3, sel_init);
}

@end

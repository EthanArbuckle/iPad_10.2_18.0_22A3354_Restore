@implementation PGWrapperMusicCacheMusicKitReconciler

+ (void)runWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a4;
  static MusicCacheMusicKitReconciler.run(photoLibrary:progressReporter:completionHandler:)(v9, (uint64_t)v10, (void (*)(_QWORD, void *))sub_1CA300FEC, v8);

  swift_release();
}

- (PGWrapperMusicCacheMusicKitReconciler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicCacheMusicKitReconciler init](&v3, sel_init);
}

@end

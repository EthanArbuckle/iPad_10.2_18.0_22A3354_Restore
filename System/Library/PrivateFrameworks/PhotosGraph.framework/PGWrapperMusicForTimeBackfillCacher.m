@implementation PGWrapperMusicForTimeBackfillCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 forceCaching:(BOOL)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  void *v9;
  uint64_t ObjCClassMetadata;
  id v11;
  id v12;

  v7 = a4;
  v9 = _Block_copy(a6);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v9);
  v11 = a3;
  v12 = a5;
  sub_1CA3D6D90(v11, v7, v12, ObjCClassMetadata, v9);
  _Block_release(v9);
  _Block_release(v9);

}

- (PGWrapperMusicForTimeBackfillCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForTimeBackfillCacher init](&v3, sel_init);
}

@end

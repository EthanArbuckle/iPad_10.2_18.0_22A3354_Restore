@implementation PGWrapperMusicForMomentCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  _QWORD *v7;
  uint64_t ObjCClassMetadata;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  v9 = a3;
  v10 = a4;
  sub_1CA50634C(v9, (uint64_t)v10, ObjCClassMetadata, v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (PGWrapperMusicForMomentCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForMomentCacher init](&v3, sel_init);
}

@end

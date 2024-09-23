@implementation PGWrapperMusicForYouCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 forceCaching:(BOOL)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  void *v9;
  unsigned __int8 *ObjCClassMetadata;
  id v11;
  id v12;

  v7 = a4;
  v9 = _Block_copy(a6);
  ObjCClassMetadata = (unsigned __int8 *)swift_getObjCClassMetadata();
  _Block_copy(v9);
  v11 = a3;
  v12 = a5;
  sub_1CA409B54(v11, v7, v12, ObjCClassMetadata, v9);
  _Block_release(v9);
  _Block_release(v9);

}

- (PGWrapperMusicForYouCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForYouCacher init](&v3, sel_init);
}

@end

@implementation PGWrapperMusicForTimeFrontfillCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 forceCaching:(BOOL)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  void *v9;
  void *ObjCClassMetadata;
  id v11;
  id v12;

  v7 = a4;
  v9 = _Block_copy(a6);
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v9);
  v11 = a3;
  v12 = a5;
  sub_1CA4ADC20(v11, v7, v12, ObjCClassMetadata, v9);
  _Block_release(v9);
  _Block_release(v9);

}

- (PGWrapperMusicForTimeFrontfillCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForTimeFrontfillCacher init](&v3, sel_init);
}

@end

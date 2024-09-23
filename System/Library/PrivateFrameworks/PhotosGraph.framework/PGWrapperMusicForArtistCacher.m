@implementation PGWrapperMusicForArtistCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 graphManager:(id)a4 forceCaching:(BOOL)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  void *v11;
  uint64_t v12;
  void *ObjCClassMetadata;
  id v14;
  id v15;
  id v16;

  v8 = a5;
  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  v14 = a3;
  v15 = a4;
  v16 = a6;
  _Block_copy(v11);
  sub_1CA4DF1E8(v14, v15, v8, 100, v16, ObjCClassMetadata, (void (*)(uint64_t, id))sub_1CA300FEC, v12);
  swift_release();
  _Block_release(v11);

}

- (PGWrapperMusicForArtistCacher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGWrapperMusicForArtistCacher init](&v3, sel_init);
}

@end

@implementation PXFakePhotoKitAssetsFetcher

+ (PXFakePhotoKitAssetsFetcher)defaultFetcher
{
  if (qword_1EE9841B0 != -1)
    swift_once();
  return (PXFakePhotoKitAssetsFetcher *)(id)qword_1EE999090;
}

- (id)fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4
{
  id v6;
  PXFakePhotoKitAssetsFetcher *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1A701DCB0((uint64_t)v6, (id)a4);

  return v8;
}

+ (void)fillLibraryWithFakeAssets:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_1A687EE84;
  }
  else
  {
    v6 = 0;
  }
  swift_getObjCClassMetadata();
  v7 = a3;
  sub_1A701CB40(v7, (uint64_t)v5, v6);
  sub_1A6855D80((uint64_t)v5);

}

- (PXFakePhotoKitAssetsFetcher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PXFakePhotoKitAssetsFetcher init](&v3, sel_init);
}

@end

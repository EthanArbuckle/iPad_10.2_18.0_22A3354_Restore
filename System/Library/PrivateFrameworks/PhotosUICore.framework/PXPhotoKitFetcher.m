@implementation PXPhotoKitFetcher

+ (id)fetchAssetsWithCurationKind:(int64_t)a3 container:(id)a4 libraryFilter:(int64_t)a5 curationContext:(int64_t)a6
{
  id v9;
  id v10;

  v9 = a4;
  v10 = sub_1A6B56930(a3, v9, a5, a6);

  return v10;
}

- (_TtC12PhotosUICore17PXPhotoKitFetcher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXPhotoKitFetcher();
  return -[PXPhotoKitFetcher init](&v3, sel_init);
}

@end

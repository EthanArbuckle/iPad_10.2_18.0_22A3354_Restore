@implementation PXPhotosCollectionTitleInfo

- (NSString)title
{
  return (NSString *)sub_1A6959268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12PhotosUICore27PXPhotosCollectionTitleInfo_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_1A6959268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12PhotosUICore27PXPhotosCollectionTitleInfo_subtitle);
}

- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)initWithAssetCollection:(id)a3
{
  uint64_t ObjectType;
  __int128 v5;
  __int128 v6;
  _TtC12PhotosUICore27PXPhotosCollectionTitleInfo *v7;
  __int128 v9;
  __int128 v10;

  ObjectType = swift_getObjectType();
  if (a3)
  {
    swift_unknownObjectRetain();
    PXDisplayAssetCollection.photosCollectionTitleInfo.getter((uint64_t *)&v9);
    v5 = v9;
    v6 = v10;
  }
  else
  {
    v5 = xmmword_1A7BA6CB0;
    v6 = 0uLL;
  }
  v9 = v5;
  v10 = v6;
  v7 = (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo *)(*(uint64_t (**)(__int128 *))(ObjectType + 96))(&v9);
  swift_unknownObjectRelease();
  swift_deallocPartialClassInstance();
  return v7;
}

- (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo)init
{
  _TtC12PhotosUICore27PXPhotosCollectionTitleInfo *result;

  result = (_TtC12PhotosUICore27PXPhotosCollectionTitleInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

@implementation ImageWellThumbnailProvider

- (int64_t)requestImageForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4
{
  return sub_1AAB812DC(self, (int)a2, a4, a3.width, a3.height, (uint64_t)&unk_1E588CE68, (uint64_t)sub_1AAB84924, (uint64_t (*)(uint64_t, uint64_t, double, double))sub_1AAB8112C);
}

- (int64_t)requestImageAndUUIDForStartingAssetFillingTargetSize:(CGSize)a3 resultHandler:(id)a4
{
  return sub_1AAB812DC(self, (int)a2, a4, a3.width, a3.height, (uint64_t)&unk_1E588CE40, (uint64_t)sub_1AAB8491C, (uint64_t (*)(uint64_t, uint64_t, double, double))sub_1AAB81250);
}

- (void)cancelThumbnailRequest:(int64_t)a3
{
  _TtC15PhotosUIPrivate26ImageWellThumbnailProvider *v4;

  v4 = self;
  sub_1AAB81410(a3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  id v7;
  _TtC15PhotosUIPrivate26ImageWellThumbnailProvider *v8;

  v5 = a4;
  v7 = a3;
  v8 = self;
  sub_1AAB81518((uint64_t)v7, v5);

}

- (_TtC15PhotosUIPrivate26ImageWellThumbnailProvider)init
{
  ImageWellThumbnailProvider.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26ImageWellThumbnailProvider_dataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate26ImageWellThumbnailProvider_mediaProvider));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

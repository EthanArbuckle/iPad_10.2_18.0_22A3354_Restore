@implementation PXSharedAlbumAddToViewFactory

+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 assets:(id)a4 doneCallback:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = _Block_copy(a5);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4430);
  v7 = sub_1A7AE3A10();
  if (v6)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_1A6DF5F80;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = sub_1A6DF0550(v9, v7, (uint64_t)v6, v8);
  sub_1A686EE5C((uint64_t)v6);

  swift_bridgeObjectRelease();
  return v10;
}

+ (id)contentHostedViewControllerWithSharedAlbum:(id)a3 mediaSources:(id)a4 doneCallback:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = _Block_copy(a5);
  sub_1A6856488(0, (unint64_t *)&unk_1EE8D98C0);
  v7 = sub_1A7AE3A10();
  if (v6)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_1A687EE8C;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = sub_1A6DF09D4(v9, v7, (uint64_t)v6, v8);
  sub_1A686EE5C((uint64_t)v6);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC12PhotosUICore29PXSharedAlbumAddToViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXSharedAlbumAddToViewFactory();
  return -[PXSharedAlbumAddToViewFactory init](&v3, sel_init);
}

@end

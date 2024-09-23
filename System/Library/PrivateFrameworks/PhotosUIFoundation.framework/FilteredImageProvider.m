@implementation FilteredImageProvider

- (_TtC18PhotosUIFoundation21FilteredImageProvider)init
{
  _TtC18PhotosUIFoundation21FilteredImageProvider *result;

  FilteredImageProvider.init()();
  return result;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  void *v13;
  uint64_t v14;
  id v15;
  _TtC18PhotosUIFoundation21FilteredImageProvider *v16;
  int64_t v17;

  height = a4.height;
  width = a4.width;
  v13 = _Block_copy(a7);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  swift_unknownObjectRetain();
  v15 = a6;
  v16 = self;
  v17 = sub_2443324FC((uint64_t)a3, a5, a6, (uint64_t)sub_244334F84, (os_unfair_lock_s *)v14, width, height);
  swift_unknownObjectRelease();

  swift_release();
  return v17;
}

- (void)cancelImageRequest:(int64_t)a3
{
  _TtC18PhotosUIFoundation21FilteredImageProvider *v4;

  v4 = self;
  sub_244332C20(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end

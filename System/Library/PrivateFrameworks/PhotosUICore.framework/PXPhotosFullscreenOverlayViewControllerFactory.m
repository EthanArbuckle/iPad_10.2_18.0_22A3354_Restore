@implementation PXPhotosFullscreenOverlayViewControllerFactory

+ (id)makeViewControllerWithOverlayControllers:(id)a3 photosViewModel:(id)a4
{
  unint64_t v5;
  id v6;
  void *v7;

  sub_1A69677A8();
  v5 = sub_1A7AE3A10();
  v6 = a4;
  v7 = (void *)sub_1A71FCFC4(v5, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (PXPhotosFullscreenOverlayViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosFullscreenOverlayViewControllerFactory();
  return -[PXPhotosFullscreenOverlayViewControllerFactory init](&v3, sel_init);
}

@end

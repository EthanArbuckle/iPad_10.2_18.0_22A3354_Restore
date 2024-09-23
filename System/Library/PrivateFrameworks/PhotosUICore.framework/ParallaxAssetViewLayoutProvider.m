@implementation ParallaxAssetViewLayoutProvider

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  _TtC12PhotosUICore31ParallaxAssetViewLayoutProvider *v18;
  void *v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  swift_unknownObjectRetain();
  v17 = a6;
  v18 = self;
  sub_1A688829C(v16, (CGAffineTransform *)a5, v17, a7, x, y, width, height);

  swift_unknownObjectRelease();
  sub_1A688C60C();
  v19 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v19;
}

- (_TtC12PhotosUICore31ParallaxAssetViewLayoutProvider)init
{
  _TtC12PhotosUICore31ParallaxAssetViewLayoutProvider *result;

  result = (_TtC12PhotosUICore31ParallaxAssetViewLayoutProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore31ParallaxAssetViewLayoutProvider_renderContext));
}

@end

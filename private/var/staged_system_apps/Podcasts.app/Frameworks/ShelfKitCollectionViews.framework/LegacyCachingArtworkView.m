@implementation LegacyCachingArtworkView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1BE710(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_1BE764(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1BE710(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_1BE764(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (_TtC23ShelfKitCollectionViews24LegacyCachingArtworkView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews24LegacyCachingArtworkView *result;

  result = (_TtC23ShelfKitCollectionViews24LegacyCachingArtworkView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.LegacyCachingArtworkView", 48, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_imageSource]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_dataProvider));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_imageStore));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_pageRenderController));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_imageBlur, &qword_3D5918);
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24LegacyCachingArtworkView_imageDownloadObserver, &qword_3DAF10);
}

@end

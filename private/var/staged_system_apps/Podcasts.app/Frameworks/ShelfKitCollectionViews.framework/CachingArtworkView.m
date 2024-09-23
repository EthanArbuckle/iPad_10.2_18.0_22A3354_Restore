@implementation CachingArtworkView

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)init
{
  char *v3;
  uint64_t v4;
  char *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscription) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscribedRequest;
  v4 = type metadata accessor for ArtworkRequest(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_imageProvider;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_pageRenderController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_objectGraph) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CachingArtworkView(0);
  return -[ArtworkView initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews18CachingArtworkView *result;

  result = (_TtC23ShelfKitCollectionViews18CachingArtworkView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.CachingArtworkView", 42, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscription));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_subscribedRequest, &qword_3D1228);
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_imageProvider, &qword_3D1230);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_pageRenderController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews18CachingArtworkView_objectGraph));
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1E1E8(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ShelfKitCollectionViews18CachingArtworkView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1E338((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1E1E8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC23ShelfKitCollectionViews18CachingArtworkView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1E338((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

@end

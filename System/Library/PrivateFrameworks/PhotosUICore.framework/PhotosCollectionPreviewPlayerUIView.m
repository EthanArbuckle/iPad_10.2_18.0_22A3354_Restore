@implementation PhotosCollectionPreviewPlayerUIView

- (_TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView *v8;
  _TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_player) = 0;
  type metadata accessor for PXStoryAsyncPlayerView();
  v8 = self;
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_sharedPlayerView) = (Class)_s12PhotosUICore17ParallaxTitleViewC5frameACSo6CGRectV_tcfC_0(0.0, 0.0, width, height);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for PhotosCollectionPreviewPlayerUIView();
  v9 = -[PhotosCollectionPreviewPlayerUIView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  -[PhotosCollectionPreviewPlayerUIView addSubview:](v9, sel_addSubview_, *(Class *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_sharedPlayerView));
  return v9;
}

- (_TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView)initWithCoder:(id)a3
{
  id v4;
  _TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_player) = 0;
  v4 = a3;

  result = (_TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosCollectionPreviewPlayerUIView();
  v2 = (char *)v4.receiver;
  -[PhotosCollectionPreviewPlayerUIView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_sharedPlayerView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35PhotosCollectionPreviewPlayerUIView_sharedPlayerView));
}

@end

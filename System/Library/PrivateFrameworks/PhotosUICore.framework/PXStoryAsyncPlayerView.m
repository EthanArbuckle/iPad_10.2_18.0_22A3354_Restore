@implementation PXStoryAsyncPlayerView

- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _TtC12PhotosUICore22PXStoryAsyncPlayerView *v9;
  objc_class *v10;
  _TtC12PhotosUICore22PXStoryAsyncPlayerView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_player) = 0;
  v8 = objc_allocWithZone((Class)PXGHostingView);
  v9 = self;
  v10 = (objc_class *)objc_msgSend(v8, sel_initWithFrame_, 0.0, 0.0, width, height);
  *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView) = v10;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for PXStoryAsyncPlayerView();
  v11 = -[PXStoryAsyncPlayerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  -[PXStoryAsyncPlayerView addSubview:](v11, sel_addSubview_, *(Class *)((char *)&v11->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView));
  return v11;
}

- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithCoder:(id)a3
{
  id v4;
  _TtC12PhotosUICore22PXStoryAsyncPlayerView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_player) = 0;
  v4 = a3;

  result = (_TtC12PhotosUICore22PXStoryAsyncPlayerView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  void *v2;
  _TtC12PhotosUICore22PXStoryAsyncPlayerView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView);
  v3 = self;
  -[PXStoryAsyncPlayerView bounds](v3, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PXStoryAsyncPlayerView();
  -[PXStoryAsyncPlayerView layoutSubviews](&v4, sel_layoutSubviews);

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView));
}

@end

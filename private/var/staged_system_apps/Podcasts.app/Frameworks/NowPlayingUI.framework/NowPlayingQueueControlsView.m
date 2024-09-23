@implementation NowPlayingQueueControlsView

- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI27NowPlayingQueueControlsView *)sub_B64AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI27NowPlayingQueueControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B6FF0();
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI27NowPlayingQueueControlsView *v2;

  v2 = self;
  sub_B6630();

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  void (*v5)(_TtC12NowPlayingUI27NowPlayingQueueControlsView *);
  uint64_t v6;
  _TtC12NowPlayingUI27NowPlayingQueueControlsView *v7;

  v4 = a3;
  v7 = self;
  sub_B6E0C();
  -[NowPlayingQueueControlsView setNeedsLayout](v7, "setNeedsLayout");
  v5 = *(void (**)(_TtC12NowPlayingUI27NowPlayingQueueControlsView *))((char *)&v7->super.super.super.isa
                                                                                + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler);
  if (v5)
  {
    v6 = *(_QWORD *)&v7->shareHandler[OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler];
    swift_retain();
    v5(v7);
    sub_145A0((uint64_t)v5, v6);
  }

}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_shareHandler), *(_QWORD *)&self->shareHandler[OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_shareHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_sleepButton));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler), *(_QWORD *)&self->shareHandler[OBJC_IVAR____TtC12NowPlayingUI27NowPlayingQueueControlsView_layoutInvalidationHandler]);
}

@end

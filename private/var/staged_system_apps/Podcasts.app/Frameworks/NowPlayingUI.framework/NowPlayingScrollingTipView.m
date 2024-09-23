@implementation NowPlayingScrollingTipView

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)init
{
  return (_TtC12NowPlayingUI26NowPlayingScrollingTipView *)sub_B5078();
}

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B5FA0();
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI26NowPlayingScrollingTipView *v2;

  v2 = self;
  sub_B5948();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12NowPlayingUI26NowPlayingScrollingTipView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  -[NowPlayingScrollingTipView safeAreaInsets](v5, "safeAreaInsets");
  v10 = sub_B4DDC(width, height, v6, v7, v8, v9);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (_TtC12NowPlayingUI26NowPlayingScrollingTipView)initWithFrame:(CGRect)a3
{
  _TtC12NowPlayingUI26NowPlayingScrollingTipView *result;

  result = (_TtC12NowPlayingUI26NowPlayingScrollingTipView *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingScrollingTipView", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneButtonHandler), *(_QWORD *)&self->doneButtonHandler[OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_visualEffectView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI26NowPlayingScrollingTipView_doneEventHandler));
}

@end

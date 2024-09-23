@implementation PinnedButtonContainerView

- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView *)sub_39683C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_3982D0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_396C70(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView *v2;

  v2 = self;
  sub_396FB4();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerText[OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_headerText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headerText[OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_footerText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_embeddedChildViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_visualEffectView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_buttons));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_footerLabel));
}

@end

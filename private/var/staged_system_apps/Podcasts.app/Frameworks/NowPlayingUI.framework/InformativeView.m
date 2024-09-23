@implementation InformativeView

- (_TtC12NowPlayingUI15InformativeView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI15InformativeView *)sub_4C0A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI15InformativeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4DCE8();
}

- (NSString)title
{
  return (NSString *)sub_4C6EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_title);
}

- (void)setTitle:(id)a3
{
  sub_4C758((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_title, (void (*)(uint64_t, uint64_t))sub_4C5DC);
}

- (NSString)message
{
  return (NSString *)sub_4C6EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_message);
}

- (void)setMessage:(id)a3
{
  sub_4C758((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NowPlayingUI15InformativeView_message, (void (*)(uint64_t, uint64_t))sub_4C7C8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12NowPlayingUI15InformativeView *v5;
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
  sub_4C8D0(width, height);
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
  _TtC12NowPlayingUI15InformativeView *v2;

  v2 = self;
  sub_4CAC4();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *);
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InformativeView();
  v2 = (char *)v5.receiver;
  -[InformativeView music_inheritedLayoutInsetsDidChange](&v5, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v5.receiver, v5.super_class);
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler + 8];
    swift_retain(v4);
    v3(v2);
    sub_145A0((uint64_t)v3, v4);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI15InformativeView *v6;

  v5 = a3;
  v6 = self;
  sub_4D29C(a3);

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI15InformativeView *v5;

  v4 = a3;
  v5 = self;
  sub_4DEA0();

}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)accessibilityTextStackView
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textStackView));
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_message]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionTitle]);
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionHandler), *(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionHandler]);
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler), *(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textStackView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textComponents);
  v4 = *(_QWORD *)&self->customView[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->image[OBJC_IVAR____TtC12NowPlayingUI15InformativeView_textComponents]);
  swift_release(v4);
  swift_release(v3);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionEventHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI15InformativeView_actionButton));

}

@end

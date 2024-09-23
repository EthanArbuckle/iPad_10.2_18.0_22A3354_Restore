@implementation InformativeView

- (_TtC16MusicApplication15InformativeView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15InformativeView *)sub_548210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15InformativeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_54A9BC();
}

- (NSString)title
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15InformativeView_title);
}

- (void)setTitle:(id)a3
{
  sub_548A00((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication15InformativeView_title, (uint64_t (*)(void))sub_54A258);
}

- (NSString)message
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15InformativeView_message);
}

- (void)setMessage:(id)a3
{
  sub_548A00((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication15InformativeView_message, (uint64_t (*)(void))sub_54A430);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication15InformativeView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_548E8C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication15InformativeView *v2;

  v2 = self;
  sub_5492D0();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InformativeView();
  v2 = (char *)v6.receiver;
  -[InformativeView music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication15InformativeView *v6;

  v5 = a3;
  v6 = self;
  sub_549D88(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_customView));

  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC16MusicApplication15InformativeView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC16MusicApplication15InformativeView_message]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->customView[OBJC_IVAR____TtC16MusicApplication15InformativeView_actionTitle]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication15InformativeView_actionHandler), *(_QWORD *)&self->customView[OBJC_IVAR____TtC16MusicApplication15InformativeView_actionHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler), *(_QWORD *)&self->customView[OBJC_IVAR____TtC16MusicApplication15InformativeView_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication15InformativeView_actionEventHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15InformativeView____lazy_storage___messageLabel));
}

@end

@implementation CollectionAccessoryView

- (_TtC16MusicApplication23CollectionAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication23CollectionAccessoryView *)sub_214D08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication23CollectionAccessoryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_216438();
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication23CollectionAccessoryView *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15[24];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_title);
  v7 = *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_title];
  *v6 = v5;
  v6[1] = v8;
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRelease(v7);
  v11 = (char *)v10 + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents;
  swift_beginAccess((char *)v10 + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents, v15, 0, 0);
  v12 = *((_QWORD *)v11 + 1);
  v13 = *v6;
  v14 = v6[1];
  swift_retain(v12);
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v13, v14);

  swift_release(v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication23CollectionAccessoryView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_2154B0(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC16MusicApplication23CollectionAccessoryView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_accessoryImageView);
  v3 = self;
  objc_msgSend(v2, "sizeThatFits:", 0.0, 0.0);
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textStackView), "sizeThatFits:", 0.0, 0.0);
  v9 = v8;
  v11 = v10;

  v12 = v5 + v9 + 8.0;
  if (v11 > v7)
    v13 = v11;
  else
    v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication23CollectionAccessoryView *v2;

  v2 = self;
  sub_215674();

}

- (void)tintColorDidChange
{
  _TtC16MusicApplication23CollectionAccessoryView *v2;

  v2 = self;
  sub_21592C();

}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  void *v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_title]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_titleTextColor));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_handler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_handler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textStackView));
  v3 = *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents];
  v4 = *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents + 8];
  v5 = *(void **)&self->titleTextColor[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->textAlignment[OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_textComponents]);

  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_button));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23CollectionAccessoryView_buttonActionEventHandler));
}

@end

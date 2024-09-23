@implementation ParagraphView

- (_TtC16MusicApplication13ParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13ParagraphView *)sub_AC6A28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13ParagraphView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_ACA558();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13ParagraphView_title);
}

- (void)setTitle:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13ParagraphView_title, (void (*)(uint64_t, uint64_t))sub_AC6CE8);
}

- (NSString)text
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13ParagraphView_text);
}

- (void)setText:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13ParagraphView_text, (void (*)(uint64_t, uint64_t))sub_AC6E24);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication13ParagraphView *v6;

  v5 = a3;
  v6 = self;
  sub_AC7A2C(a3);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  _TtC16MusicApplication13ParagraphView *v2;

  v2 = self;
  sub_AC7BF8();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication13ParagraphView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_AC7DD4((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  _TtC16MusicApplication13ParagraphView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_AC7DD4((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication13ParagraphView *v5;
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
  sub_AC5FB0(width, height);
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
  _TtC16MusicApplication13ParagraphView *v2;

  v2 = self;
  sub_AC7F64();

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC16MusicApplication13ParagraphView *v17;
  uint64_t v19;

  length = a5.length;
  location = a5.location;
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = a3;
  v16 = a4;
  v17 = self;
  LOBYTE(length) = sub_ACA70C((uint64_t)v14, location, length);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return length & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_AAE88(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13ParagraphView_textStyle));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13ParagraphView_textViewLabelPropertiesHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication13ParagraphView_textViewLabelPropertiesHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13ParagraphView_layoutInvalidationHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication13ParagraphView_layoutInvalidationHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13ParagraphView_moreButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication13ParagraphView_moreButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___sizingTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___moreButton));
  swift_bridgeObjectRelease();
}

@end

@implementation BadgingView

- (_TtC16MusicApplication11BadgingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  NSString *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_badgingItems) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_fontTextStyle) = (Class)UIFontTextStyleSubheadline;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_longestTextWidth) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication11BadgingView_itemLabels) = (Class)_swiftEmptyArrayStorage;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BadgingView();
  v8 = UIFontTextStyleSubheadline;
  return -[BadgingView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication11BadgingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_622E80();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_621FC8(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication11BadgingView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_62207C((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_621FC8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  _TtC16MusicApplication11BadgingView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_62207C((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BadgingView();
  v2 = (char *)v6.receiver;
  -[BadgingView music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication11BadgingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_622254(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication11BadgingView *v2;

  v2 = self;
  sub_622614();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication11BadgingView_fontTextStyle));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler), *(_QWORD *)&self->badgingItems[OBJC_IVAR____TtC16MusicApplication11BadgingView_layoutInvalidationHandler]);
  swift_bridgeObjectRelease();
}

@end

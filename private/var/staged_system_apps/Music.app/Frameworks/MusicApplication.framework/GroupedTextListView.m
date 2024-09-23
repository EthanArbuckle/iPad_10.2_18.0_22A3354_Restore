@implementation GroupedTextListView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication19GroupedTextListView *v6;

  v5 = a3;
  v6 = self;
  sub_8BEB58(a3);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GroupedTextListView();
  v2 = (char *)v6.receiver;
  -[GroupedTextListView music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication19GroupedTextListView *v5;
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
  sub_8BEF20(width, height);
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
  _TtC16MusicApplication19GroupedTextListView *v2;

  v2 = self;
  sub_8BF3F0();

}

- (NSArray)accessibilityStackViews
{
  Class isa;
  _BYTE v4[24];

  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_stackViews, v4, 0, 0);
  type metadata accessor for TextStackView();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSArray)accessibilityListGroupStrings
{
  _TtC16MusicApplication19GroupedTextListView *v2;
  Class isa;

  v2 = self;
  sub_8C1324();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_TtC16MusicApplication19GroupedTextListView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19GroupedTextListView *)sub_8C15E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19GroupedTextListView)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication19GroupedTextListView *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication19GroupedTextListView *)sub_8C1A7C((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler), *(_QWORD *)&self->wantsTopSeparator[OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19GroupedTextListView____lazy_storage___headerTitleLabel));
  swift_bridgeObjectRelease();
}

@end

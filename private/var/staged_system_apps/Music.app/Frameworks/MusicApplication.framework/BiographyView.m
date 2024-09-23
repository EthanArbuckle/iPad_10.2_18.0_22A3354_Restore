@implementation BiographyView

- (_TtC16MusicApplication13BiographyView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_363D18();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication13BiographyView *v2;

  v2 = self;
  sub_362608();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  void (*v3)(char *, __n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BiographyView();
  v2 = (char *)v6.receiver;
  -[BiographyView music_inheritedLayoutInsetsDidChange](&v6, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v6.receiver, v6.super_class);
  v3 = *(void (**)(char *, __n128))&v2[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler + 8];
    v5 = swift_retain(v4);
    v3(v2, v5);
    sub_5C198((uint64_t)v3, v4);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication13BiographyView *v5;
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
  sub_362938(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  void (*v6)(char *, __n128);
  uint64_t v7;
  __n128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BiographyView();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[BiographyView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  objc_msgSend(v4, "setNeedsLayout", v9.receiver, v9.super_class);
  v6 = *(void (**)(char *, __n128))&v4[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler];
  if (v6)
  {
    v7 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler + 8];
    v8 = swift_retain(v7);
    v6(v4, v8);
    sub_5C198((uint64_t)v6, v7);
  }

}

- (NSArray)accessibilityStackViews
{
  _TtC16MusicApplication13BiographyView *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_362EA0();

  type metadata accessor for TextStackView();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)accessibilityListStrings
{
  _TtC16MusicApplication13BiographyView *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_3633E8();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC16MusicApplication13BiographyView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication13BiographyView *result;

  result = (_TtC16MusicApplication13BiographyView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.BiographyView", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler), *(_QWORD *)&self->layoutStyle[OBJC_IVAR____TtC16MusicApplication13BiographyView_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13BiographyView_textDrawingCache));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13BiographyView____lazy_storage___stackViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13BiographyView____lazy_storage___cachedStackViewComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13BiographyView_listItems));
}

@end

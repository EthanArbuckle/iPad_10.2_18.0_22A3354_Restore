@implementation Window

- (_TtC16MusicApplication6Window)initWithWindowScene:(id)a3
{
  id v3;
  _TtC16MusicApplication6Window *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication6Window *)sub_7243D4(v3);

  return v4;
}

- (_TtC16MusicApplication6Window)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication6Window *)Window.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication6Window)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC16MusicApplication6Window *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication6Window_screenDimensionsDidChangeHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication6Window_boundsSizeDidChangeHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  v6 = a3;

  result = (_TtC16MusicApplication6Window *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/Window.swift", 29, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)sendEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for Window();
  v4 = a3;
  v5 = v8.receiver;
  -[Window sendEvent:](&v8, "sendEvent:", v4);
  v6 = (void *)objc_opt_self(NSNotificationCenter);
  v7 = objc_msgSend(v6, "defaultCenter", v8.receiver, v8.super_class);
  if (qword_14AB838 != -1)
    swift_once(&qword_14AB838, sub_7237C4);
  objc_msgSend(v7, "postNotificationName:object:", qword_1580D58, v5);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication6Window *v2;

  v2 = self;
  Window.layoutSubviews()();

}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _TtC16MusicApplication6Window *v5;
  objc_super v6;

  v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  v5 = self;

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for Window();
  -[Window _updateWindowTraitsAndNotify:](&v6, "_updateWindowTraitsAndNotify:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  _TtC16MusicApplication6Window *v6;
  objc_super v7;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  v5 = a3;
  v6 = self;

  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for Window();
  -[Window traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v5);

}

- (_TtC16MusicApplication6Window)initWithContentRect:(CGRect)a3
{
  _TtC16MusicApplication6Window *result;

  result = (_TtC16MusicApplication6Window *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.Window", 23, "init(contentRect:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication6Window_screenDimensionsDidChangeHandler), *(_QWORD *)&self->screenDimensionsDidChangeHandler[OBJC_IVAR____TtC16MusicApplication6Window_screenDimensionsDidChangeHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication6Window_boundsSizeDidChangeHandler), *(_QWORD *)&self->screenDimensionsDidChangeHandler[OBJC_IVAR____TtC16MusicApplication6Window_boundsSizeDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection));
}

@end

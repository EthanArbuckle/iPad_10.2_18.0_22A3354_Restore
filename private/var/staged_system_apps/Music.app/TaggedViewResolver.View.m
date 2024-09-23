@implementation TaggedViewResolver.View

- (_TtCV5Music18TaggedViewResolver4View)initWithCoder:(id)a3
{
  _TtCV5Music18TaggedViewResolver4View *result;

  result = (_TtCV5Music18TaggedViewResolver4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/PlaylistSongSuggestions.swift", 35, 2, 883, 0);
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtCV5Music18TaggedViewResolver4View *v6;

  v4 = *(void (**)(void))((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtCV5Music18TaggedViewResolver4View_windowObserver);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtCV5Music18TaggedViewResolver4View)initWithFrame:(CGRect)a3
{
  _TtCV5Music18TaggedViewResolver4View *result;

  result = (_TtCV5Music18TaggedViewResolver4View *)_swift_stdlib_reportUnimplementedInitializer("Music.View", 10, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCV5Music18TaggedViewResolver4View_song;
  v4 = type metadata accessor for Song(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(_QWORD *)&self->windowObserver[OBJC_IVAR____TtCV5Music18TaggedViewResolver4View_windowObserver]);
}

@end

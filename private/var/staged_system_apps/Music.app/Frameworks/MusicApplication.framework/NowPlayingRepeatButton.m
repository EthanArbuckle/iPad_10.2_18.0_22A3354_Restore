@implementation NowPlayingRepeatButton

- (_TtC16MusicApplication22NowPlayingRepeatButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22NowPlayingRepeatButton *)sub_95D7A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22NowPlayingRepeatButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication22NowPlayingRepeatButton *result;

  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_repeatType] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_defaultColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_selectedColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_selectedBackgroundColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_dimmedBackgroundColor] = 0;
  v4 = a3;

  result = (_TtC16MusicApplication22NowPlayingRepeatButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NowPlayingRepeatButton.swift", 45, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication22NowPlayingRepeatButton *v6;

  v5 = a3;
  v6 = self;
  sub_95DBCC((uint64_t)a3);

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingRepeatButton();
  v2 = v3.receiver;
  -[NowPlayingRepeatButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_95DD4C();

}

- (int64_t)accessibilityRepeatType
{
  return *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication22NowPlayingRepeatButton_repeatType];
}

- (void).cxx_destruct
{

}

@end

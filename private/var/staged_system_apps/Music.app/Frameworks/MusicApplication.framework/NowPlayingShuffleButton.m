@implementation NowPlayingShuffleButton

- (_TtC16MusicApplication23NowPlayingShuffleButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication23NowPlayingShuffleButton *)sub_B3E6EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication23NowPlayingShuffleButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication23NowPlayingShuffleButton *result;

  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_shuffleType] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_defaultColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_selectedColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_selectedBackgroundColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_dimmedBackgroundColor] = 0;
  v4 = a3;

  result = (_TtC16MusicApplication23NowPlayingShuffleButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NowPlayingShuffleButton.swift", 46, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication23NowPlayingShuffleButton *v6;

  v5 = a3;
  v6 = self;
  sub_B3E90C((uint64_t)a3);

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingShuffleButton();
  v2 = v3.receiver;
  -[NowPlayingShuffleButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_B3EA8C();

}

- (int64_t)accessibilityShuffleType
{
  return *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC16MusicApplication23NowPlayingShuffleButton_shuffleType];
}

- (void).cxx_destruct
{

}

@end

@implementation NowPlayingShuffleButton

- (_TtC5Music23NowPlayingShuffleButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music23NowPlayingShuffleButton *)sub_1006B6884(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music23NowPlayingShuffleButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music23NowPlayingShuffleButton *result;

  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_shuffleType] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_defaultColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_selectedColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_selectedBackgroundColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_dimmedBackgroundColor] = 0;
  v4 = a3;

  result = (_TtC5Music23NowPlayingShuffleButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NowPlayingShuffleButton.swift", 35, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music23NowPlayingShuffleButton *v6;

  v5 = a3;
  v6 = self;
  sub_1006B6A9C((uint64_t)a3);

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingShuffleButton();
  v2 = v3.receiver;
  -[NowPlayingShuffleButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_1006B6C1C();

}

- (int64_t)accessibilityShuffleType
{
  return *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music23NowPlayingShuffleButton_shuffleType];
}

- (void).cxx_destruct
{

}

@end

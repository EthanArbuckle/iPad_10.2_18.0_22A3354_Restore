@implementation NowPlayingRepeatButton

- (_TtC5Music22NowPlayingRepeatButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music22NowPlayingRepeatButton *)sub_10080406C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music22NowPlayingRepeatButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music22NowPlayingRepeatButton *result;

  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_repeatType] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_defaultColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_selectedColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_selectedBackgroundColor] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_dimmedBackgroundColor] = 0;
  v4 = a3;

  result = (_TtC5Music22NowPlayingRepeatButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NowPlayingRepeatButton.swift", 34, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music22NowPlayingRepeatButton *v6;

  v5 = a3;
  v6 = self;
  sub_100804474((uint64_t)a3);

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingRepeatButton();
  v2 = v3.receiver;
  -[NowPlayingRepeatButton tintColorDidChange](&v3, "tintColorDidChange");
  sub_1008045F4();

}

- (int64_t)accessibilityRepeatType
{
  return *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music22NowPlayingRepeatButton_repeatType];
}

- (void).cxx_destruct
{

}

@end

@implementation NowPlayingAutoPlayButton

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingAutoPlayButton();
  return -[NowPlayingAutoPlayButton isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingAutoPlayButton();
  v4 = v5.receiver;
  -[NowPlayingAutoPlayButton setSelected:](&v5, "setSelected:", v3);
  sub_10063A588();

}

- (_TtC5Music24NowPlayingAutoPlayButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Music24NowPlayingAutoPlayButton *)sub_10063A228(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music24NowPlayingAutoPlayButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5Music24NowPlayingAutoPlayButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_defaultColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_selectedColor) = 0;
  v4 = a3;

  result = (_TtC5Music24NowPlayingAutoPlayButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NowPlayingAutoPlayButton.swift", 36, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music24NowPlayingAutoPlayButton *v6;

  v5 = a3;
  v6 = self;
  sub_10063A45C((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_defaultColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingAutoPlayButton_selectedColor));
}

@end

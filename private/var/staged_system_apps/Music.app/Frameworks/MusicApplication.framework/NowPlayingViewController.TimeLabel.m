@implementation NowPlayingViewController.TimeLabel

- (_TtCC16MusicApplication24NowPlayingViewController9TimeLabel)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication24NowPlayingViewController9TimeLabel *result;

  sub_73C920(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC16MusicApplication24NowPlayingViewController9TimeLabel)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication24NowPlayingViewController9TimeLabel *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication24NowPlayingViewController9TimeLabel_displayLink) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication24NowPlayingViewController9TimeLabel____lazy_storage___dateFormatter) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication24NowPlayingViewController9TimeLabel *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NowPlaying+Animation.swift", 43, 2, 40, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication24NowPlayingViewController9TimeLabel_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication24NowPlayingViewController9TimeLabel____lazy_storage___dateFormatter));
}

@end

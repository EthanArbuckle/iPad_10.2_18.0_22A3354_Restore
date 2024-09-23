@implementation MusicLyricsBackgroundView

- (MusicLyricsBackgroundView)initWithFrame:(CGRect)a3
{
  return (MusicLyricsBackgroundView *)sub_9A4878(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MusicLyricsBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9A533C();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicLyricsBackgroundView____lazy_storage___gradientView));

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicLyricsBackgroundView_playerPathSubscription));
}

@end

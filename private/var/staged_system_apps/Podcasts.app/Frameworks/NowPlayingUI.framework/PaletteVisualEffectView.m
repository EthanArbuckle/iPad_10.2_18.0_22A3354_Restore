@implementation PaletteVisualEffectView

- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI23PaletteVisualEffectView *)sub_9B098(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI23PaletteVisualEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9C924();
}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI23PaletteVisualEffectView *v2;

  v2 = self;
  sub_9B3F0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI23PaletteVisualEffectView_separator));
}

@end

@implementation ChannelLogoView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI15ChannelLogoView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v5 = self;
  v6 = sub_1D9B475FC(a4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI15ChannelLogoView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15ChannelLogoView *result;

  sub_1D9B47E5C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15ChannelLogoView)initWithCoder:(id)a3
{
  _TtC8VideosUI15ChannelLogoView *result;

  sub_1D9B47EC8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D9B47F8C(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC8VideosUI15ChannelLogoView____lazy_storage___appleTvImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ChannelLogoView_channelImageView));
  swift_release();
}

@end

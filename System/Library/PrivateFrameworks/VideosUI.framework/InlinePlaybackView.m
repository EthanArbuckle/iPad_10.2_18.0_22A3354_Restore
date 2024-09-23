@implementation InlinePlaybackView

- (_TtC8VideosUI18InlinePlaybackView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI18InlinePlaybackView *result;

  sub_1D9CDF564();
  return result;
}

- (_TtC8VideosUI18InlinePlaybackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CDF634();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI18InlinePlaybackView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9CDF6F4(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)accessibilityImageView
{
  _TtC8VideosUI18InlinePlaybackView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9CDFAA0();

  return (UIView *)OUTLINED_FUNCTION_111(v3);
}

- (UIView)accessibilityPlaybackView
{
  _TtC8VideosUI18InlinePlaybackView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D9C1EE14();

  return (UIView *)OUTLINED_FUNCTION_111(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18InlinePlaybackView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18InlinePlaybackView_playbackView));
}

@end

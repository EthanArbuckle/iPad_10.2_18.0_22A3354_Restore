@implementation DownloadStateIndicatorView

- (_TtC8VideosUI26DownloadStateIndicatorView)init
{
  _TtC8VideosUI26DownloadStateIndicatorView *result;

  sub_1D9DCF3B8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26DownloadStateIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DCF544();
}

- (void)dealloc
{
  _TtC8VideosUI26DownloadStateIndicatorView *v2;

  v2 = self;
  sub_1D9DCF5CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26DownloadStateIndicatorView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26DownloadStateIndicatorView_progressView));
  swift_release();
  swift_release();
  swift_release();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI26DownloadStateIndicatorView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = self;
  OUTLINED_FUNCTION_21_4();
  sub_1D9DCF908(a4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI26DownloadStateIndicatorView)initWithFrame:(CGRect)a3
{
  sub_1D9DD009C();
}

@end

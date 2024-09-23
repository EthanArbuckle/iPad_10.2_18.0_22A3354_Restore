@implementation CarouselViewCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI16CarouselViewCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9EF37C4(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI16CarouselViewCell *v2;

  v2 = self;
  sub_1D9EF3904();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI16CarouselViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI16CarouselViewCell *result;

  sub_1D9EF3BC4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI16CarouselViewCell)initWithCoder:(id)a3
{
  _TtC8VideosUI16CarouselViewCell *result;

  sub_1D9EF3C7C(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_cellImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell_shadow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16CarouselViewCell____lazy_storage___inlinePlaybackView));
}

@end

@implementation CarouselViewContainer

- (_TtC8VideosUI21CarouselViewContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9ED725C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI21CarouselViewContainer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9ED7318(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI21CarouselViewContainer)initWithFrame:(CGRect)a3
{
  sub_1D9ED7A08();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_carouselView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CarouselViewContainer_headerView));
}

- (void)pageChangeEventWithSender:(id)a3
{
  id v4;
  _TtC8VideosUI21CarouselViewContainer *v5;

  v4 = a3;
  v5 = self;
  sub_1D9ED7B8C(v4);

}

@end

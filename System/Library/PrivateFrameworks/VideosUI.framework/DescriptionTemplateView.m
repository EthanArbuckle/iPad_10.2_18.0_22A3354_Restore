@implementation DescriptionTemplateView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI23DescriptionTemplateView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9E75CF4(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC8VideosUI23DescriptionTemplateView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI23DescriptionTemplateView *result;

  sub_1D9E75EC4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI23DescriptionTemplateView)initWithCoder:(id)a3
{
  _TtC8VideosUI23DescriptionTemplateView *result;

  sub_1D9E75F68(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23DescriptionTemplateView____lazy_storage___contentView));
}

@end

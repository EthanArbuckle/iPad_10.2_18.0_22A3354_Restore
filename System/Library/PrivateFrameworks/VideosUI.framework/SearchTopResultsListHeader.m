@implementation SearchTopResultsListHeader

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI26SearchTopResultsListHeader *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1DA0CF5C8(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI26SearchTopResultsListHeader *v2;

  v2 = self;
  sub_1DA0CF818();

}

- (_TtC8VideosUI26SearchTopResultsListHeader)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI26SearchTopResultsListHeader *result;

  sub_1DA0CFAFC();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26SearchTopResultsListHeader)initWithCoder:(id)a3
{
  _TtC8VideosUI26SearchTopResultsListHeader *result;

  sub_1DA0CFB74(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26SearchTopResultsListHeader_titleView));
}

@end

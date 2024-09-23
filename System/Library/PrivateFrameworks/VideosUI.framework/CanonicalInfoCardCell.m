@implementation CanonicalInfoCardCell

- (_TtC8VideosUI21CanonicalInfoCardCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI21CanonicalInfoCardCell *result;

  sub_1D9AC8AB0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI21CanonicalInfoCardCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9AC96DC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI21CanonicalInfoCardCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1D9AC975C(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI21CanonicalInfoCardCell *v2;

  v2 = self;
  sub_1D9AC98BC();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CanonicalInfoCardCell_cardView));
}

@end

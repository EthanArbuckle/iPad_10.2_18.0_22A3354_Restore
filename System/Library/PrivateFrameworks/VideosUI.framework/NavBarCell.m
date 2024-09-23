@implementation NavBarCell

- (_TtC8VideosUI10NavBarCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI10NavBarCell *)sub_1D9E58508();
}

- (_TtC8VideosUI10NavBarCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E585B4();
}

- (void)prepareForReuse
{
  _TtC8VideosUI10NavBarCell *v2;

  v2 = self;
  sub_1D9E5864C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)layoutSubviews
{
  _TtC8VideosUI10NavBarCell *v2;

  v2 = self;
  sub_1D9E586E4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8VideosUI10NavBarCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1D9E58ADC(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI10NavBarCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI10NavBarCell_accessoryView));
}

@end

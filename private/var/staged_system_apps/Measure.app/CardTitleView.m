@implementation CardTitleView

- (UILabel)title
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC7Measure13CardTitleView_title));
}

- (_TtC7Measure13CardTitleView)init
{
  return (_TtC7Measure13CardTitleView *)sub_1000CAF64();
}

- (_TtC7Measure13CardTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000CC9E8();
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC7Measure13CardTitleView *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  v2 = qword_10047A750;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_10047A750, sub_10000EF04);
  v4 = qword_1004AF088;
  if (qword_10047A790 != -1)
    swift_once(&qword_10047A790, sub_10000F000);
  v5 = qword_1004AF0C8;

  v6 = *(double *)&v4;
  v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7Measure13CardTitleView)initWithFrame:(CGRect)a3
{
  _TtC7Measure13CardTitleView *result;

  result = (_TtC7Measure13CardTitleView *)_swift_stdlib_reportUnimplementedInitializer("Measure.CardTitleView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

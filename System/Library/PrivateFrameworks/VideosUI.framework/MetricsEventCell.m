@implementation MetricsEventCell

- (_TtC8VideosUI16MetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _TtC8VideosUI16MetricsEventCell *result;

  if (a4)
    sub_1DA143E80();
  sub_1D9C18BB4((void *)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI16MetricsEventCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C192C8();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_23_58((uint64_t)self);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16MetricsEventCell____lazy_storage___totalTimeView));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI16MetricsEventCell____lazy_storage___appearTimeView));
}

@end

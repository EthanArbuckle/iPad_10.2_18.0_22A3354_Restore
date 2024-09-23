@implementation MetricsDataFieldCell

- (_TtC8VideosUI20MetricsDataFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
    sub_1DA143E80();
  return (_TtC8VideosUI20MetricsDataFieldCell *)sub_1D9F98220((void *)a3);
}

- (_TtC8VideosUI20MetricsDataFieldCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F98314();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___fieldValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20MetricsDataFieldCell____lazy_storage___viewMargin));
}

@end

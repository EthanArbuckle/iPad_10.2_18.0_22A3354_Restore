@implementation SectionViewSegmentedView

- (_TtC5TeaUI24SectionViewSegmentedView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI24SectionViewSegmentedView *)sub_1B1606CE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUI24SectionViewSegmentedView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1606E30();
}

- (void)layoutSubviews
{
  _TtC5TeaUI24SectionViewSegmentedView *v2;

  v2 = self;
  sub_1B1606EEC();

}

- (void)doSegmentChange
{
  _TtC5TeaUI24SectionViewSegmentedView *v2;

  v2 = self;
  sub_1B1607100();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewSegmentedView_segmentedControl));
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI24SectionViewSegmentedView_onChangeBlock));
}

@end

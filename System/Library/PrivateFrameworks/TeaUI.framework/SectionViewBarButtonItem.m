@implementation SectionViewBarButtonItem

- (_TtC5TeaUI24SectionViewBarButtonItem)init
{
  return (_TtC5TeaUI24SectionViewBarButtonItem *)sub_1B14F8D88();
}

- (_TtC5TeaUI24SectionViewBarButtonItem)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14F9104();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_barBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_collapsingButton));
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_onCreateMenuBlock));
}

@end

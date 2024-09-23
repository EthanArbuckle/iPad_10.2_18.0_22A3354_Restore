@implementation ContactConfigurationCell

- (_TtC10MobileMail24ContactConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail24ContactConfigurationCell *)sub_100211768(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail24ContactConfigurationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100212444();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC10MobileMail24ContactConfigurationCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002125FC(a3);

}

- (void)prepareForReuse
{
  _TtC10MobileMail24ContactConfigurationCell *v2;

  v2 = self;
  sub_100212CBC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_label));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_imageSizeConstraint));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell____lazy_storage___avatarViewController));
  sub_1001F0D3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_contactName);
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_contact));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail24ContactConfigurationCell_futureContact));
}

@end

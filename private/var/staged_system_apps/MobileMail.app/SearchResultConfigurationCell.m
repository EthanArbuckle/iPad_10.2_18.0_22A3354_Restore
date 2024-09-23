@implementation SearchResultConfigurationCell

- (void)prepareForReuse
{
  _TtC10MobileMail29SearchResultConfigurationCell *v2;

  v2 = self;
  sub_1003316F8();

}

- (_TtC10MobileMail29SearchResultConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail29SearchResultConfigurationCell *)sub_100331814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail29SearchResultConfigurationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC10MobileMail29SearchResultConfigurationCell *)sub_100331978(a3);
}

- (void).cxx_destruct
{
  sub_1001ED890((Class *)((char *)&self->super.super.super.super.super.isa
                        + OBJC_IVAR____TtC10MobileMail29SearchResultConfigurationCell_contacts));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29SearchResultConfigurationCell_futureContacts));
}

@end

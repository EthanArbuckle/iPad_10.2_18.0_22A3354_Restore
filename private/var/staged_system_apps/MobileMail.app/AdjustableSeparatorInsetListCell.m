@implementation AdjustableSeparatorInsetListCell

- (void)updateConstraints
{
  _TtC10MobileMail32AdjustableSeparatorInsetListCell *v2;

  v2 = self;
  sub_1001F1878();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC10MobileMail32AdjustableSeparatorInsetListCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001F213C(a3);

}

- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail32AdjustableSeparatorInsetListCell *)sub_1001F2748(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail32AdjustableSeparatorInsetListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC10MobileMail32AdjustableSeparatorInsetListCell *)sub_1001F28D4(a3);
}

- (void).cxx_destruct
{
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail32AdjustableSeparatorInsetListCell_leadingConstraint));
}

@end

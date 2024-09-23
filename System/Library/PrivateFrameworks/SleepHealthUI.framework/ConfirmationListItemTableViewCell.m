@implementation ConfirmationListItemTableViewCell

- (_TtC13SleepHealthUI33ConfirmationListItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1A9CE82E0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC13SleepHealthUI33ConfirmationListItemTableViewCell *)sub_1A9C977DC(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI33ConfirmationListItemTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9C98358();
}

- (void).cxx_destruct
{
  sub_1A9BEDB34((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationListItemTableViewCell_item, (unint64_t *)&qword_1EEB44998, (unint64_t *)&qword_1EEB449A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationListItemTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationListItemTableViewCell_detailLabel));
}

@end

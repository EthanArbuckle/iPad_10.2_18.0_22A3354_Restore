@implementation TTRIReminderLocationPickerViewCell

- (void)awakeFromNib
{
  _TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *v2;

  v2 = self;
  sub_1B4487C3C();

}

- (void)layoutSubviews
{
  _TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *v2;

  v2 = self;
  sub_1B4487FA8();

}

- (UILabel)nameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel));
}

- (void)setNameLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)addressLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel));
}

- (void)setAddressLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)pinImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView));
}

- (void)setPinImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView) = (Class)a3;
  v3 = a3;

}

- (UIView)pinImageBackgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView));
}

- (void)setPinImageBackgroundView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView) = (Class)a3;
  v3 = a3;

}

- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1B4906A64();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *)sub_1B4488200(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore34TTRIReminderLocationPickerViewCell *)sub_1B4488328(a3);
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_viewModelItem;
  sub_1B4489440(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_viewModelItem), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((void **)v3 + 6), *((void **)v3 + 7));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_addressLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIReminderLocationPickerViewCell_pinImageBackgroundView));
}

@end

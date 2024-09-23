@implementation TTRIReminderListPickerTableViewHeader

- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1B4906A64();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader *)sub_1B4225AE8(v3, v4);
}

- (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader)initWithCoder:(id)a3
{
  _TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader *result;

  result = (_TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader_prominentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderListPickerTableViewHeader_standardView));
}

@end

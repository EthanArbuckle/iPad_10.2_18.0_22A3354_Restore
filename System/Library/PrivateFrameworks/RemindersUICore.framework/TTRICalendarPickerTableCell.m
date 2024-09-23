@implementation TTRICalendarPickerTableCell

- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore27TTRICalendarPickerTableCell *)TTRICalendarPickerTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore27TTRICalendarPickerTableCell)initWithCoder:(id)a3
{
  _TtC15RemindersUICore27TTRICalendarPickerTableCell *result;

  result = (_TtC15RemindersUICore27TTRICalendarPickerTableCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E9DE0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B4911D70;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore27TTRICalendarPickerTableCell_datePicker);
  *(_QWORD *)(v3 + 56) = sub_1B41DF50C(0, &qword_1EF0A8AF8);
  *(_QWORD *)(v3 + 32) = v4;
  v5 = v4;
  v6 = (void *)sub_1B4906DA0();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore27TTRICalendarPickerTableCell_datePicker));
}

@end

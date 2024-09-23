@implementation TTRIDatePickerTableCell

- (void)awakeFromNib
{
  _TtC15RemindersUICore23TTRIDatePickerTableCell *v2;

  v2 = self;
  TTRIDatePickerTableCell.awakeFromNib()();

}

- (void)updateConstraints
{
  _TtC15RemindersUICore23TTRIDatePickerTableCell *v2;

  v2 = self;
  TTRIDatePickerTableCell.updateConstraints()();

}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)(id)MEMORY[0x1B5E3D8DC]((char *)self+ OBJC_IVAR____TtC15RemindersUICore23TTRIDatePickerTableCell_datePicker, a2);
}

- (void)setDatePicker:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)datePickerDoubleTapped:(id)a3
{
  _TtC15RemindersUICore23TTRIDatePickerTableCell *v4;
  _TtC15RemindersUICore23TTRIDatePickerTableCell *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B45A27AC();

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore23TTRIDatePickerTableCell *)TTRIDatePickerTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore23TTRIDatePickerTableCell)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore23TTRIDatePickerTableCell *)TTRIDatePickerTableCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRIDatePickerTableCell_tapGestureRecognizer));
  swift_bridgeObjectRelease();
}

@end

@implementation TTRIButtonCellTableCell

- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC15RemindersUICore23TTRIButtonCellTableCell *result;

  if (a4)
  {
    a4 = (id)sub_1B4906A64();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  TTRIButtonCellTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
  return result;
}

- (_TtC15RemindersUICore23TTRIButtonCellTableCell)initWithCoder:(id)a3
{
  _TtC15RemindersUICore23TTRIButtonCellTableCell *result;

  result = (_TtC15RemindersUICore23TTRIButtonCellTableCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore23TTRIButtonCellTableCell_button));
}

@end

@implementation TTRILocationQuickPickersTableCell

+ (Class)containerViewClass
{
  sub_1B41DF50C(0, &qword_1EF0B6500);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell *)TTRILocationQuickPickersTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell)initWithCoder:(id)a3
{
  _TtC15RemindersUICore33TTRILocationQuickPickersTableCell *result;

  result = (_TtC15RemindersUICore33TTRILocationQuickPickersTableCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRILocationQuickPickersTableCell_labeledIconsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRILocationQuickPickersTableCell_scrollView));
}

@end

@implementation TTRISubtaskListAddSubtaskCell

- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *)sub_1B42D8C80(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell)initWithCoder:(id)a3
{
  id v4;
  _TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell_isForGroceries) = 0;
  v4 = a3;

  result = (_TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore29TTRISubtaskListAddSubtaskCell *v2;

  v2 = self;
  sub_1B42D8F74();

}

@end

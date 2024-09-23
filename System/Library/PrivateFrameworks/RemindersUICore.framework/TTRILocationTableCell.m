@implementation TTRILocationTableCell

- (_TtC15RemindersUICore21TTRILocationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1B4906A64();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC15RemindersUICore21TTRILocationTableCell *)sub_1B47CF2F4(v4, v5);
}

- (_TtC15RemindersUICore21TTRILocationTableCell)initWithCoder:(id)a3
{
  _TtC15RemindersUICore21TTRILocationTableCell *result;

  result = (_TtC15RemindersUICore21TTRILocationTableCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore21TTRILocationTableCell_infoButton));
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore21TTRILocationTableCell_infoButton), sel_accessibilityActivationPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)ttriAccessibilityIsSpeakThisElement
{
  return 1;
}

@end

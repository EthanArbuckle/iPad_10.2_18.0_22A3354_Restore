@implementation SummaryQueueCountView

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI21SummaryQueueCountView *v3;
  double Width;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryQueueCountView_countLabel);
  v3 = self;
  objc_msgSend(v2, sel_frame);
  Width = CGRectGetWidth(v11);
  if (qword_255B82160 != -1)
    swift_once();
  v5 = Width + *(double *)&qword_255BE4410 + *(double *)&qword_255BE4420;
  objc_msgSend(v2, sel_frame);
  v6 = CGRectGetHeight(v12) + *(double *)&qword_255BE4408;
  v7 = *(double *)&qword_255BE4418;

  v8 = v6 + v7;
  v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_TtC9SeymourUI21SummaryQueueCountView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21SummaryQueueCountView *)sub_22B3623D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21SummaryQueueCountView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B362A80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SummaryQueueCountView_countLabel));
}

@end

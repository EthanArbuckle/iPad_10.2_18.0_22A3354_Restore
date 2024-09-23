@implementation TrendsScrubberFlagpoleView

- (void)layoutSubviews
{
  _TtC10FitnessApp26TrendsScrubberFlagpoleView *v2;

  v2 = self;
  sub_1005640D4();

}

- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  _TtC10FitnessApp26TrendsScrubberFlagpoleView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor;
  v9 = (void *)objc_opt_self(UIColor);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "whiteColor");

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for TrendsScrubberFlagpoleView();
  return -[TrendsScrubberFlagpoleView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp26TrendsScrubberFlagpoleView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC10FitnessApp26TrendsScrubberFlagpoleView *v8;
  _TtC10FitnessApp26TrendsScrubberFlagpoleView *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor;
  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "whiteColor");

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for TrendsScrubberFlagpoleView();
  v9 = -[TrendsScrubberFlagpoleView initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TrendsScrubberFlagpoleView_platterColor));
}

@end

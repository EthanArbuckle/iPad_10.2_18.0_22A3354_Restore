@implementation TrendAveragePlatterView

- (_TtC10FitnessApp23TrendAveragePlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23TrendAveragePlatterView *)sub_1004F8928(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23TrendAveragePlatterView)initWithCoder:(id)a3
{
  sub_1004F8BF0(a3);
  return 0;
}

- (void)setupFontsAndConstants
{
  _TtC10FitnessApp23TrendAveragePlatterView *v2;

  v2 = self;
  sub_1004F912C();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrendAveragePlatterView();
  v2 = (char *)v4.receiver;
  -[TrendAveragePlatterView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_opt_self(CATransaction);
  objc_msgSend(v3, "begin", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setDisableActions:", 1);
  sub_1004F9820(v2);
  objc_msgSend(v3, "commit");

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_label1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_label2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_stackLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendAveragePlatterView_stackTrailingConstraint));
}

@end

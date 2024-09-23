@implementation TrendsScrubberPlatterView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_10001E724(0, &qword_10083A700, CAShapeLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp25TrendsScrubberPlatterView *)sub_100564458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)fontSizeChangedWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp25TrendsScrubberPlatterView *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005648AC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC10FitnessApp25TrendsScrubberPlatterView)initWithCoder:(id)a3
{
  sub_100565210(a3);
  return 0;
}

- (void)layoutSubviews
{
  _TtC10FitnessApp25TrendsScrubberPlatterView *v2;

  v2 = self;
  sub_10056539C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_midConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_leadingConstaint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_trailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendsScrubberPlatterView_platterColor));
}

@end

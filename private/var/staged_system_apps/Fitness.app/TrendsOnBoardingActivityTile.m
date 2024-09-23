@implementation TrendsOnBoardingActivityTile

- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp28TrendsOnBoardingActivityTile *)sub_100031F78(a3, (uint64_t)a4, v6);
}

- (void)dealloc
{
  _TtC10FitnessApp28TrendsOnBoardingActivityTile *v2;

  v2 = self;
  sub_10024E32C();
}

- (void).cxx_destruct
{
  sub_1000297A8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration), *(_QWORD *)&self->configuration[OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_insetContentView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_activeViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_videoView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_observers));
}

- (void)didTapGetStartedButton
{
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _TtC10FitnessApp28TrendsOnBoardingActivityTile *v6;

  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration;
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp28TrendsOnBoardingActivityTile_configuration);
  if ((unint64_t)v3 - 1 >= 2)
  {
    v4 = *((_QWORD *)v2 + 1);
    if (v3)
    {
      v6 = self;
      v5 = sub_1000297BC((uint64_t)v3, v4);
      v3(v5);
      sub_1000297A8((uint64_t)v3, v4);

    }
    else
    {
      sub_10003AFE0(0, *((_QWORD *)v2 + 1));
    }
  }
}

- (void)prepareForReuse
{
  _TtC10FitnessApp28TrendsOnBoardingActivityTile *v2;

  v2 = self;
  sub_10024EC34();

}

- (_TtC10FitnessApp28TrendsOnBoardingActivityTile)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10024F118();
}

@end

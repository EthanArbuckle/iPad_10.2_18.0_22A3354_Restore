@implementation AwardsActivityTile

- (_TtC10FitnessApp18AwardsActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp18AwardsActivityTile *)sub_1002B6364(a3, (uint64_t)a4, v6);
}

- (void)didTapAchievementWithTapGestureRecognizer:(id)a3
{
  id v4;
  _TtC10FitnessApp18AwardsActivityTile *v5;

  v4 = a3;
  v5 = self;
  sub_1002B7888(v4);

}

- (void)prepareForReuse
{
  _TtC10FitnessApp18AwardsActivityTile *v3;
  void *v4;
  id v5;
  objc_super v6;

  swift_getObjectType(self);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AwardsActivityTile();
  v3 = self;
  -[AwardsActivityTile prepareForReuse](&v6, "prepareForReuse");
  v4 = *(Class *)((char *)&v3->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_insetContentView);
  v5 = sub_100032478();
  objc_msgSend(v4, "setBackgroundColor:", v5, v6.receiver, v6.super_class);

}

- (_TtC10FitnessApp18AwardsActivityTile)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B7C9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_leftAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_middleAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_rightAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_activeEnergyUnit));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_leftCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_middleCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_rightCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___insetContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___leftCellContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___middleCellContentViewHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile____lazy_storage___rightCellContentViewHeightAnchor));
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_onDidTapAchievement), *(_QWORD *)&self->leftAchievement[OBJC_IVAR____TtC10FitnessApp18AwardsActivityTile_onDidTapAchievement]);
}

@end

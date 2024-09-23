@implementation AchievementsListTableViewCell

- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp29AchievementsListTableViewCell *)sub_10017DC14(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp29AchievementsListTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10017FD0C();
}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AchievementsListTableViewCell();
  v2 = (char *)v4.receiver;
  -[AchievementsListTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementCellContentView];
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_titleLabel), "setText:", 0, v4.receiver, v4.super_class);
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC10FitnessApp26AchievementCellContentView_detailLabel), "setText:", 0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementCellContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29AchievementsListTableViewCell_achievementBadgeView));
}

@end
